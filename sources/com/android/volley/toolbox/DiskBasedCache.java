package com.android.volley.toolbox;

import android.os.SystemClock;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.text.TextUtils;
import com.android.volley.Cache;
import com.android.volley.Header;
import com.android.volley.VolleyLog;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
/* loaded from: classes.dex */
public final class DiskBasedCache implements Cache {
    public static final float HYSTERESIS_FACTOR = 0.9f;
    public final FileSupplier mRootDirectorySupplier;
    public final LinkedHashMap mEntries = new LinkedHashMap(16, 0.75f, true);
    public long mTotalSize = 0;
    public final int mMaxCacheSizeInBytes = 5242880;

    /* loaded from: classes.dex */
    public static class CacheHeader {
        public final List<Header> allResponseHeaders;
        public final String etag;
        public final String key;
        public final long lastModified;
        public final long serverDate;
        public long size;
        public final long softTtl;
        public final long ttl;

        public CacheHeader(String str, String str2, long j, long j2, long j3, long j4, List<Header> list) {
            this.key = str;
            this.etag = "".equals(str2) ? null : str2;
            this.serverDate = j;
            this.lastModified = j2;
            this.ttl = j3;
            this.softTtl = j4;
            this.allResponseHeaders = list;
        }

        public final Cache.Entry toCacheEntry(byte[] bArr) {
            Cache.Entry entry = new Cache.Entry();
            entry.data = bArr;
            entry.etag = this.etag;
            entry.serverDate = this.serverDate;
            entry.lastModified = this.lastModified;
            entry.ttl = this.ttl;
            entry.softTtl = this.softTtl;
            List<Header> list = this.allResponseHeaders;
            TreeMap treeMap = new TreeMap(String.CASE_INSENSITIVE_ORDER);
            for (Header header : list) {
                treeMap.put(header.mName, header.mValue);
            }
            entry.responseHeaders = treeMap;
            entry.allResponseHeaders = Collections.unmodifiableList(this.allResponseHeaders);
            return entry;
        }

        public static CacheHeader readHeader(CountingInputStream countingInputStream) throws IOException {
            List list;
            if (DiskBasedCache.readInt(countingInputStream) == 538247942) {
                String readString = DiskBasedCache.readString(countingInputStream);
                String readString2 = DiskBasedCache.readString(countingInputStream);
                long readLong = DiskBasedCache.readLong(countingInputStream);
                long readLong2 = DiskBasedCache.readLong(countingInputStream);
                long readLong3 = DiskBasedCache.readLong(countingInputStream);
                long readLong4 = DiskBasedCache.readLong(countingInputStream);
                int readInt = DiskBasedCache.readInt(countingInputStream);
                if (readInt >= 0) {
                    if (readInt == 0) {
                        list = Collections.emptyList();
                    } else {
                        list = new ArrayList();
                    }
                    List list2 = list;
                    for (int i = 0; i < readInt; i++) {
                        list2.add(new Header(DiskBasedCache.readString(countingInputStream).intern(), DiskBasedCache.readString(countingInputStream).intern()));
                    }
                    return new CacheHeader(readString, readString2, readLong, readLong2, readLong3, readLong4, list2);
                }
                throw new IOException("readHeaderList size=" + readInt);
            }
            throw new IOException();
        }

        public final boolean writeHeader(BufferedOutputStream bufferedOutputStream) {
            try {
                DiskBasedCache.writeInt(bufferedOutputStream, 538247942);
                DiskBasedCache.writeString(bufferedOutputStream, this.key);
                String str = this.etag;
                if (str == null) {
                    str = "";
                }
                DiskBasedCache.writeString(bufferedOutputStream, str);
                DiskBasedCache.writeLong(bufferedOutputStream, this.serverDate);
                DiskBasedCache.writeLong(bufferedOutputStream, this.lastModified);
                DiskBasedCache.writeLong(bufferedOutputStream, this.ttl);
                DiskBasedCache.writeLong(bufferedOutputStream, this.softTtl);
                List<Header> list = this.allResponseHeaders;
                if (list != null) {
                    DiskBasedCache.writeInt(bufferedOutputStream, list.size());
                    for (Header header : list) {
                        DiskBasedCache.writeString(bufferedOutputStream, header.mName);
                        DiskBasedCache.writeString(bufferedOutputStream, header.mValue);
                    }
                } else {
                    DiskBasedCache.writeInt(bufferedOutputStream, 0);
                }
                bufferedOutputStream.flush();
                return true;
            } catch (IOException e) {
                VolleyLog.d("%s", e.toString());
                return false;
            }
        }

        /* JADX WARN: Illegal instructions before constructor call */
        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r0v0, types: [java.util.List<com.android.volley.Header>] */
        /* JADX WARN: Type inference failed for: r0v1, types: [java.util.ArrayList] */
        /* JADX WARN: Type inference failed for: r0v2 */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public CacheHeader(java.lang.String r14, com.android.volley.Cache.Entry r15) {
            /*
                r13 = this;
                java.lang.String r2 = r15.etag
                long r3 = r15.serverDate
                long r5 = r15.lastModified
                long r7 = r15.ttl
                long r9 = r15.softTtl
                java.util.List<com.android.volley.Header> r0 = r15.allResponseHeaders
                if (r0 == 0) goto L10
            Le:
                r11 = r0
                goto L44
            L10:
                java.util.Map<java.lang.String, java.lang.String> r15 = r15.responseHeaders
                java.util.ArrayList r0 = new java.util.ArrayList
                int r1 = r15.size()
                r0.<init>(r1)
                java.util.Set r15 = r15.entrySet()
                java.util.Iterator r15 = r15.iterator()
            L23:
                boolean r1 = r15.hasNext()
                if (r1 == 0) goto Le
                java.lang.Object r1 = r15.next()
                java.util.Map$Entry r1 = (java.util.Map.Entry) r1
                com.android.volley.Header r11 = new com.android.volley.Header
                java.lang.Object r12 = r1.getKey()
                java.lang.String r12 = (java.lang.String) r12
                java.lang.Object r1 = r1.getValue()
                java.lang.String r1 = (java.lang.String) r1
                r11.<init>(r12, r1)
                r0.add(r11)
                goto L23
            L44:
                r0 = r13
                r1 = r14
                r0.<init>(r1, r2, r3, r5, r7, r9, r11)
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: com.android.volley.toolbox.DiskBasedCache.CacheHeader.<init>(java.lang.String, com.android.volley.Cache$Entry):void");
        }
    }

    /* loaded from: classes.dex */
    public interface FileSupplier {
    }

    public static void writeLong(BufferedOutputStream bufferedOutputStream, long j) throws IOException {
        bufferedOutputStream.write((byte) (j >>> 0));
        bufferedOutputStream.write((byte) (j >>> 8));
        bufferedOutputStream.write((byte) (j >>> 16));
        bufferedOutputStream.write((byte) (j >>> 24));
        bufferedOutputStream.write((byte) (j >>> 32));
        bufferedOutputStream.write((byte) (j >>> 40));
        bufferedOutputStream.write((byte) (j >>> 48));
        bufferedOutputStream.write((byte) (j >>> 56));
    }

    public final synchronized Cache.Entry get(String str) {
        CacheHeader cacheHeader = (CacheHeader) this.mEntries.get(str);
        if (cacheHeader == null) {
            return null;
        }
        File fileForKey = getFileForKey(str);
        try {
            CountingInputStream countingInputStream = new CountingInputStream(new BufferedInputStream(createInputStream(fileForKey)), fileForKey.length());
            try {
                CacheHeader readHeader = CacheHeader.readHeader(countingInputStream);
                if (!TextUtils.equals(str, readHeader.key)) {
                    VolleyLog.d("%s: key=%s, found=%s", fileForKey.getAbsolutePath(), str, readHeader.key);
                    CacheHeader cacheHeader2 = (CacheHeader) this.mEntries.remove(str);
                    if (cacheHeader2 != null) {
                        this.mTotalSize -= cacheHeader2.size;
                    }
                    return null;
                }
                return cacheHeader.toCacheEntry(streamToBytes(countingInputStream, countingInputStream.length - countingInputStream.bytesRead));
            } finally {
                countingInputStream.close();
            }
        } catch (IOException e) {
            VolleyLog.d("%s: %s", fileForKey.getAbsolutePath(), e.toString());
            synchronized (this) {
                boolean delete = getFileForKey(str).delete();
                CacheHeader cacheHeader3 = (CacheHeader) this.mEntries.remove(str);
                if (cacheHeader3 != null) {
                    this.mTotalSize -= cacheHeader3.size;
                }
                if (!delete) {
                    VolleyLog.d("Could not delete cache entry for key=%s, filename=%s", str, getFilenameForKey(str));
                }
                return null;
            }
        }
    }

    public final synchronized void initialize() {
        long length;
        CountingInputStream countingInputStream;
        File file = ((Volley$1) this.mRootDirectorySupplier).get();
        if (!file.exists()) {
            if (!file.mkdirs()) {
                VolleyLog.e("Unable to create cache dir %s", file.getAbsolutePath());
            }
            return;
        }
        File[] listFiles = file.listFiles();
        if (listFiles != null) {
            for (File file2 : listFiles) {
                try {
                    length = file2.length();
                    countingInputStream = new CountingInputStream(new BufferedInputStream(createInputStream(file2)), length);
                } catch (IOException unused) {
                    file2.delete();
                }
                try {
                    CacheHeader readHeader = CacheHeader.readHeader(countingInputStream);
                    readHeader.size = length;
                    putEntry(readHeader.key, readHeader);
                    countingInputStream.close();
                } catch (Throwable th) {
                    countingInputStream.close();
                    throw th;
                    break;
                }
            }
        }
    }

    public final synchronized void put(String str, Cache.Entry entry) {
        BufferedOutputStream bufferedOutputStream;
        CacheHeader cacheHeader;
        long j = this.mTotalSize;
        byte[] bArr = entry.data;
        long length = j + bArr.length;
        int i = this.mMaxCacheSizeInBytes;
        if (length <= i || bArr.length <= i * 0.9f) {
            File fileForKey = getFileForKey(str);
            try {
                bufferedOutputStream = new BufferedOutputStream(createOutputStream(fileForKey));
                cacheHeader = new CacheHeader(str, entry);
            } catch (IOException unused) {
                if (!fileForKey.delete()) {
                    VolleyLog.d("Could not clean up file %s", fileForKey.getAbsolutePath());
                }
                if (!((Volley$1) this.mRootDirectorySupplier).get().exists()) {
                    VolleyLog.d("Re-initializing cache after external clearing.", new Object[0]);
                    this.mEntries.clear();
                    this.mTotalSize = 0L;
                    initialize();
                }
            }
            if (cacheHeader.writeHeader(bufferedOutputStream)) {
                bufferedOutputStream.write(entry.data);
                bufferedOutputStream.close();
                cacheHeader.size = fileForKey.length();
                putEntry(str, cacheHeader);
                pruneIfNeeded();
                return;
            }
            bufferedOutputStream.close();
            VolleyLog.d("Failed to write header for %s", fileForKey.getAbsolutePath());
            throw new IOException();
        }
    }

    /* loaded from: classes.dex */
    public static class CountingInputStream extends FilterInputStream {
        public long bytesRead;
        public final long length;

        @Override // java.io.FilterInputStream, java.io.InputStream
        public final int read() throws IOException {
            int read = super.read();
            if (read != -1) {
                this.bytesRead++;
            }
            return read;
        }

        public CountingInputStream(BufferedInputStream bufferedInputStream, long j) {
            super(bufferedInputStream);
            this.length = j;
        }

        @Override // java.io.FilterInputStream, java.io.InputStream
        public final int read(byte[] bArr, int i, int i2) throws IOException {
            int read = super.read(bArr, i, i2);
            if (read != -1) {
                this.bytesRead += read;
            }
            return read;
        }

        public long bytesRead() {
            return this.bytesRead;
        }
    }

    public static byte[] streamToBytes(CountingInputStream countingInputStream, long j) throws IOException {
        long j2 = countingInputStream.length - countingInputStream.bytesRead;
        if (j >= 0 && j <= j2) {
            int i = (int) j;
            if (i == j) {
                byte[] bArr = new byte[i];
                new DataInputStream(countingInputStream).readFully(bArr);
                return bArr;
            }
        }
        throw new IOException("streamToBytes length=" + j + ", maxLength=" + j2);
    }

    public static void writeInt(BufferedOutputStream bufferedOutputStream, int i) throws IOException {
        bufferedOutputStream.write((i >> 0) & 255);
        bufferedOutputStream.write((i >> 8) & 255);
        bufferedOutputStream.write((i >> 16) & 255);
        bufferedOutputStream.write((i >> 24) & 255);
    }

    public static void writeString(BufferedOutputStream bufferedOutputStream, String str) throws IOException {
        byte[] bytes = str.getBytes("UTF-8");
        writeLong(bufferedOutputStream, bytes.length);
        bufferedOutputStream.write(bytes, 0, bytes.length);
    }

    public InputStream createInputStream(File file) throws FileNotFoundException {
        return new FileInputStream(file);
    }

    public OutputStream createOutputStream(File file) throws FileNotFoundException {
        return new FileOutputStream(file);
    }

    public final File getFileForKey(String str) {
        return new File(((Volley$1) this.mRootDirectorySupplier).get(), getFilenameForKey(str));
    }

    public final void pruneIfNeeded() {
        if (this.mTotalSize >= this.mMaxCacheSizeInBytes) {
            if (VolleyLog.DEBUG) {
                VolleyLog.v("Pruning old cache entries.", new Object[0]);
            }
            long j = this.mTotalSize;
            long elapsedRealtime = SystemClock.elapsedRealtime();
            Iterator it = this.mEntries.entrySet().iterator();
            int i = 0;
            while (it.hasNext()) {
                CacheHeader cacheHeader = (CacheHeader) ((Map.Entry) it.next()).getValue();
                if (getFileForKey(cacheHeader.key).delete()) {
                    this.mTotalSize -= cacheHeader.size;
                } else {
                    String str = cacheHeader.key;
                    VolleyLog.d("Could not delete cache entry for key=%s, filename=%s", str, getFilenameForKey(str));
                }
                it.remove();
                i++;
                if (((float) this.mTotalSize) < this.mMaxCacheSizeInBytes * 0.9f) {
                    break;
                }
            }
            if (VolleyLog.DEBUG) {
                VolleyLog.v("pruned %d files, %d bytes, %d ms", Integer.valueOf(i), Long.valueOf(this.mTotalSize - j), Long.valueOf(SystemClock.elapsedRealtime() - elapsedRealtime));
            }
        }
    }

    public final void putEntry(String str, CacheHeader cacheHeader) {
        if (!this.mEntries.containsKey(str)) {
            this.mTotalSize += cacheHeader.size;
        } else {
            this.mTotalSize = (cacheHeader.size - ((CacheHeader) this.mEntries.get(str)).size) + this.mTotalSize;
        }
        this.mEntries.put(str, cacheHeader);
    }

    public DiskBasedCache(Volley$1 volley$1) {
        this.mRootDirectorySupplier = volley$1;
    }

    public static String getFilenameForKey(String str) {
        int length = str.length() / 2;
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m(String.valueOf(str.substring(0, length).hashCode()));
        m.append(String.valueOf(str.substring(length).hashCode()));
        return m.toString();
    }

    public static int read(InputStream inputStream) throws IOException {
        int read = inputStream.read();
        if (read != -1) {
            return read;
        }
        throw new EOFException();
    }

    public static int readInt(InputStream inputStream) throws IOException {
        return (read(inputStream) << 24) | (read(inputStream) << 0) | 0 | (read(inputStream) << 8) | (read(inputStream) << 16);
    }

    public static long readLong(InputStream inputStream) throws IOException {
        return ((read(inputStream) & 255) << 0) | 0 | ((read(inputStream) & 255) << 8) | ((read(inputStream) & 255) << 16) | ((read(inputStream) & 255) << 24) | ((read(inputStream) & 255) << 32) | ((read(inputStream) & 255) << 40) | ((read(inputStream) & 255) << 48) | ((255 & read(inputStream)) << 56);
    }

    public static String readString(CountingInputStream countingInputStream) throws IOException {
        return new String(streamToBytes(countingInputStream, readLong(countingInputStream)), "UTF-8");
    }
}
