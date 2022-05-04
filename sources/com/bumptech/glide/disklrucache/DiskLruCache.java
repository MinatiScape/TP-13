package com.bumptech.glide.disklrucache;

import android.annotation.TargetApi;
import android.os.StrictMode;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import androidx.appcompat.view.SupportMenuInflater$$ExternalSyntheticOutline0;
import java.io.BufferedWriter;
import java.io.Closeable;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.concurrent.Callable;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
/* loaded from: classes.dex */
public final class DiskLruCache implements Closeable {
    public final File directory;
    public final File journalFile;
    public final File journalFileBackup;
    public final File journalFileTmp;
    public BufferedWriter journalWriter;
    public long maxSize;
    public int redundantOpCount;
    public long size = 0;
    public final LinkedHashMap<String, Entry> lruEntries = new LinkedHashMap<>(0, 0.75f, true);
    public long nextSequenceNumber = 0;
    public final ThreadPoolExecutor executorService = new ThreadPoolExecutor(0, 1, 60, TimeUnit.SECONDS, new LinkedBlockingQueue(), new DiskLruCacheThreadFactory());
    public final AnonymousClass1 cleanupCallable = new Callable<Void>() { // from class: com.bumptech.glide.disklrucache.DiskLruCache.1
        @Override // java.util.concurrent.Callable
        public final Void call() throws Exception {
            synchronized (DiskLruCache.this) {
                DiskLruCache diskLruCache = DiskLruCache.this;
                if (diskLruCache.journalWriter == null) {
                    return null;
                }
                diskLruCache.trimToSize();
                if (DiskLruCache.this.journalRebuildRequired()) {
                    DiskLruCache.this.rebuildJournal();
                    DiskLruCache.this.redundantOpCount = 0;
                }
                return null;
            }
        }
    };
    public final int appVersion = 1;
    public final int valueCount = 1;

    /* loaded from: classes.dex */
    public static final class DiskLruCacheThreadFactory implements ThreadFactory {
        @Override // java.util.concurrent.ThreadFactory
        public final synchronized Thread newThread(Runnable runnable) {
            Thread thread;
            thread = new Thread(runnable, "glide-disk-lru-cache-thread");
            thread.setPriority(1);
            return thread;
        }
    }

    /* loaded from: classes.dex */
    public final class Editor {
        public boolean committed;
        public final Entry entry;
        public final boolean[] written;

        public Editor(Entry entry) {
            boolean[] zArr;
            this.entry = entry;
            if (entry.readable) {
                zArr = null;
            } else {
                zArr = new boolean[DiskLruCache.this.valueCount];
            }
            this.written = zArr;
        }

        public final void abort() throws IOException {
            DiskLruCache.access$2100(DiskLruCache.this, this, false);
        }

        public final File getFile() throws IOException {
            File file;
            synchronized (DiskLruCache.this) {
                Entry entry = this.entry;
                if (entry.currentEditor == this) {
                    if (!entry.readable) {
                        this.written[0] = true;
                    }
                    file = entry.dirtyFiles[0];
                    DiskLruCache.this.directory.mkdirs();
                } else {
                    throw new IllegalStateException();
                }
            }
            return file;
        }
    }

    /* loaded from: classes.dex */
    public final class Entry {
        public File[] cleanFiles;
        public Editor currentEditor;
        public File[] dirtyFiles;
        public final String key;
        public final long[] lengths;
        public boolean readable;
        public long sequenceNumber;

        public Entry(String str) {
            this.key = str;
            int i = DiskLruCache.this.valueCount;
            this.lengths = new long[i];
            this.cleanFiles = new File[i];
            this.dirtyFiles = new File[i];
            StringBuilder sb = new StringBuilder(str);
            sb.append('.');
            int length = sb.length();
            for (int i2 = 0; i2 < DiskLruCache.this.valueCount; i2++) {
                sb.append(i2);
                this.cleanFiles[i2] = new File(DiskLruCache.this.directory, sb.toString());
                sb.append(".tmp");
                this.dirtyFiles[i2] = new File(DiskLruCache.this.directory, sb.toString());
                sb.setLength(length);
            }
        }

        public final String getLengths() throws IOException {
            long[] jArr;
            StringBuilder sb = new StringBuilder();
            for (long j : this.lengths) {
                sb.append(' ');
                sb.append(j);
            }
            return sb.toString();
        }
    }

    public static void access$2100(DiskLruCache diskLruCache, Editor editor, boolean z) throws IOException {
        synchronized (diskLruCache) {
            Entry entry = editor.entry;
            if (entry.currentEditor == editor) {
                if (z && !entry.readable) {
                    for (int i = 0; i < diskLruCache.valueCount; i++) {
                        if (!editor.written[i]) {
                            editor.abort();
                            throw new IllegalStateException("Newly created entry didn't create value for index " + i);
                        } else if (!entry.dirtyFiles[i].exists()) {
                            editor.abort();
                            return;
                        }
                    }
                }
                for (int i2 = 0; i2 < diskLruCache.valueCount; i2++) {
                    File file = entry.dirtyFiles[i2];
                    if (!z) {
                        deleteIfExists(file);
                    } else if (file.exists()) {
                        File file2 = entry.cleanFiles[i2];
                        file.renameTo(file2);
                        long j = entry.lengths[i2];
                        long length = file2.length();
                        entry.lengths[i2] = length;
                        diskLruCache.size = (diskLruCache.size - j) + length;
                    }
                }
                diskLruCache.redundantOpCount++;
                entry.currentEditor = null;
                if (entry.readable || z) {
                    entry.readable = true;
                    diskLruCache.journalWriter.append((CharSequence) "CLEAN");
                    diskLruCache.journalWriter.append(' ');
                    diskLruCache.journalWriter.append((CharSequence) entry.key);
                    diskLruCache.journalWriter.append((CharSequence) entry.getLengths());
                    diskLruCache.journalWriter.append('\n');
                    if (z) {
                        long j2 = diskLruCache.nextSequenceNumber;
                        diskLruCache.nextSequenceNumber = 1 + j2;
                        entry.sequenceNumber = j2;
                    }
                } else {
                    diskLruCache.lruEntries.remove(entry.key);
                    diskLruCache.journalWriter.append((CharSequence) "REMOVE");
                    diskLruCache.journalWriter.append(' ');
                    diskLruCache.journalWriter.append((CharSequence) entry.key);
                    diskLruCache.journalWriter.append('\n');
                }
                flushWriter(diskLruCache.journalWriter);
                if (diskLruCache.size > diskLruCache.maxSize || diskLruCache.journalRebuildRequired()) {
                    diskLruCache.executorService.submit(diskLruCache.cleanupCallable);
                }
                return;
            }
            throw new IllegalStateException();
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final synchronized void close() throws IOException {
        if (this.journalWriter != null) {
            Iterator it = new ArrayList(this.lruEntries.values()).iterator();
            while (it.hasNext()) {
                Editor editor = ((Entry) it.next()).currentEditor;
                if (editor != null) {
                    editor.abort();
                }
            }
            trimToSize();
            closeWriter(this.journalWriter);
            this.journalWriter = null;
        }
    }

    public final Editor edit(String str) throws IOException {
        Editor editor;
        synchronized (this) {
            if (this.journalWriter != null) {
                Entry entry = this.lruEntries.get(str);
                editor = null;
                if (entry == null) {
                    entry = new Entry(str);
                    this.lruEntries.put(str, entry);
                } else if (entry.currentEditor != null) {
                }
                editor = new Editor(entry);
                entry.currentEditor = editor;
                this.journalWriter.append((CharSequence) "DIRTY");
                this.journalWriter.append(' ');
                this.journalWriter.append((CharSequence) str);
                this.journalWriter.append('\n');
                flushWriter(this.journalWriter);
            } else {
                throw new IllegalStateException("cache is closed");
            }
        }
        return editor;
    }

    public final synchronized Value get(String str) throws IOException {
        if (this.journalWriter != null) {
            Entry entry = this.lruEntries.get(str);
            if (entry == null) {
                return null;
            }
            if (!entry.readable) {
                return null;
            }
            for (File file : entry.cleanFiles) {
                if (!file.exists()) {
                    return null;
                }
            }
            this.redundantOpCount++;
            this.journalWriter.append((CharSequence) "READ");
            this.journalWriter.append(' ');
            this.journalWriter.append((CharSequence) str);
            this.journalWriter.append('\n');
            if (journalRebuildRequired()) {
                this.executorService.submit(this.cleanupCallable);
            }
            return new Value(entry.cleanFiles);
        }
        throw new IllegalStateException("cache is closed");
    }

    public final synchronized void rebuildJournal() throws IOException {
        BufferedWriter bufferedWriter = this.journalWriter;
        if (bufferedWriter != null) {
            closeWriter(bufferedWriter);
        }
        BufferedWriter bufferedWriter2 = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(this.journalFileTmp), Util.US_ASCII));
        bufferedWriter2.write("libcore.io.DiskLruCache");
        bufferedWriter2.write("\n");
        bufferedWriter2.write("1");
        bufferedWriter2.write("\n");
        bufferedWriter2.write(Integer.toString(this.appVersion));
        bufferedWriter2.write("\n");
        bufferedWriter2.write(Integer.toString(this.valueCount));
        bufferedWriter2.write("\n");
        bufferedWriter2.write("\n");
        for (Entry entry : this.lruEntries.values()) {
            if (entry.currentEditor != null) {
                bufferedWriter2.write("DIRTY " + entry.key + '\n');
            } else {
                bufferedWriter2.write("CLEAN " + entry.key + entry.getLengths() + '\n');
            }
        }
        closeWriter(bufferedWriter2);
        if (this.journalFile.exists()) {
            renameTo(this.journalFile, this.journalFileBackup, true);
        }
        renameTo(this.journalFileTmp, this.journalFile, false);
        this.journalFileBackup.delete();
        this.journalWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(this.journalFile, true), Util.US_ASCII));
    }

    /* loaded from: classes.dex */
    public final class Value {
        public final File[] files;

        public Value(File[] fileArr) {
            this.files = fileArr;
        }
    }

    /* JADX WARN: Type inference failed for: r2v2, types: [com.bumptech.glide.disklrucache.DiskLruCache$1] */
    public DiskLruCache(File file, long j) {
        this.directory = file;
        this.journalFile = new File(file, "journal");
        this.journalFileTmp = new File(file, "journal.tmp");
        this.journalFileBackup = new File(file, "journal.bkp");
        this.maxSize = j;
    }

    public static DiskLruCache open(File file, long j) throws IOException {
        if (j > 0) {
            File file2 = new File(file, "journal.bkp");
            if (file2.exists()) {
                File file3 = new File(file, "journal");
                if (file3.exists()) {
                    file2.delete();
                } else {
                    renameTo(file2, file3, false);
                }
            }
            DiskLruCache diskLruCache = new DiskLruCache(file, j);
            if (diskLruCache.journalFile.exists()) {
                try {
                    diskLruCache.readJournal();
                    diskLruCache.processJournal();
                    return diskLruCache;
                } catch (IOException e) {
                    PrintStream printStream = System.out;
                    printStream.println("DiskLruCache " + file + " is corrupt: " + e.getMessage() + ", removing");
                    diskLruCache.close();
                    Util.deleteContents(diskLruCache.directory);
                }
            }
            file.mkdirs();
            DiskLruCache diskLruCache2 = new DiskLruCache(file, j);
            diskLruCache2.rebuildJournal();
            return diskLruCache2;
        }
        throw new IllegalArgumentException("maxSize <= 0");
    }

    public static void renameTo(File file, File file2, boolean z) throws IOException {
        if (z) {
            deleteIfExists(file2);
        }
        if (!file.renameTo(file2)) {
            throw new IOException();
        }
    }

    public final boolean journalRebuildRequired() {
        int i = this.redundantOpCount;
        if (i < 2000 || i < this.lruEntries.size()) {
            return false;
        }
        return true;
    }

    public final void processJournal() throws IOException {
        deleteIfExists(this.journalFileTmp);
        Iterator<Entry> it = this.lruEntries.values().iterator();
        while (it.hasNext()) {
            Entry next = it.next();
            int i = 0;
            if (next.currentEditor == null) {
                while (i < this.valueCount) {
                    this.size += next.lengths[i];
                    i++;
                }
            } else {
                next.currentEditor = null;
                while (i < this.valueCount) {
                    deleteIfExists(next.cleanFiles[i]);
                    deleteIfExists(next.dirtyFiles[i]);
                    i++;
                }
                it.remove();
            }
        }
    }

    public final void readJournal() throws IOException {
        StrictLineReader strictLineReader = new StrictLineReader(new FileInputStream(this.journalFile), Util.US_ASCII);
        try {
            String readLine = strictLineReader.readLine();
            String readLine2 = strictLineReader.readLine();
            String readLine3 = strictLineReader.readLine();
            String readLine4 = strictLineReader.readLine();
            String readLine5 = strictLineReader.readLine();
            if (!"libcore.io.DiskLruCache".equals(readLine) || !"1".equals(readLine2) || !Integer.toString(this.appVersion).equals(readLine3) || !Integer.toString(this.valueCount).equals(readLine4) || !"".equals(readLine5)) {
                throw new IOException("unexpected journal header: [" + readLine + ", " + readLine2 + ", " + readLine4 + ", " + readLine5 + "]");
            }
            boolean z = false;
            int i = 0;
            while (true) {
                try {
                    readJournalLine(strictLineReader.readLine());
                    i++;
                } catch (EOFException unused) {
                    this.redundantOpCount = i - this.lruEntries.size();
                    if (strictLineReader.end == -1) {
                        z = true;
                    }
                    if (z) {
                        rebuildJournal();
                    } else {
                        this.journalWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(this.journalFile, true), Util.US_ASCII));
                    }
                    try {
                        strictLineReader.close();
                        return;
                    } catch (RuntimeException e) {
                        throw e;
                    } catch (Exception unused2) {
                        return;
                    }
                }
            }
        } catch (Throwable th) {
            try {
                strictLineReader.close();
            } catch (RuntimeException e2) {
                throw e2;
            } catch (Exception unused3) {
            }
            throw th;
        }
    }

    public final void readJournalLine(String str) throws IOException {
        String str2;
        int indexOf = str.indexOf(32);
        if (indexOf != -1) {
            int i = indexOf + 1;
            int indexOf2 = str.indexOf(32, i);
            if (indexOf2 == -1) {
                str2 = str.substring(i);
                if (indexOf == 6 && str.startsWith("REMOVE")) {
                    this.lruEntries.remove(str2);
                    return;
                }
            } else {
                str2 = str.substring(i, indexOf2);
            }
            Entry entry = this.lruEntries.get(str2);
            if (entry == null) {
                entry = new Entry(str2);
                this.lruEntries.put(str2, entry);
            }
            if (indexOf2 != -1 && indexOf == 5 && str.startsWith("CLEAN")) {
                String[] split = str.substring(indexOf2 + 1).split(" ");
                entry.readable = true;
                entry.currentEditor = null;
                if (split.length == DiskLruCache.this.valueCount) {
                    for (int i2 = 0; i2 < split.length; i2++) {
                        try {
                            entry.lengths[i2] = Long.parseLong(split[i2]);
                        } catch (NumberFormatException unused) {
                            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("unexpected journal line: ");
                            m.append(Arrays.toString(split));
                            throw new IOException(m.toString());
                        }
                    }
                    return;
                }
                StringBuilder m2 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("unexpected journal line: ");
                m2.append(Arrays.toString(split));
                throw new IOException(m2.toString());
            } else if (indexOf2 == -1 && indexOf == 5 && str.startsWith("DIRTY")) {
                entry.currentEditor = new Editor(entry);
            } else if (indexOf2 != -1 || indexOf != 4 || !str.startsWith("READ")) {
                throw new IOException(SupportMenuInflater$$ExternalSyntheticOutline0.m("unexpected journal line: ", str));
            }
        } else {
            throw new IOException(SupportMenuInflater$$ExternalSyntheticOutline0.m("unexpected journal line: ", str));
        }
    }

    public final void trimToSize() throws IOException {
        while (this.size > this.maxSize) {
            String key = this.lruEntries.entrySet().iterator().next().getKey();
            synchronized (this) {
                if (this.journalWriter != null) {
                    Entry entry = this.lruEntries.get(key);
                    if (entry != null && entry.currentEditor == null) {
                        for (int i = 0; i < this.valueCount; i++) {
                            File file = entry.cleanFiles[i];
                            if (file.exists() && !file.delete()) {
                                throw new IOException("failed to delete " + file);
                            }
                            long j = this.size;
                            long[] jArr = entry.lengths;
                            this.size = j - jArr[i];
                            jArr[i] = 0;
                        }
                        this.redundantOpCount++;
                        this.journalWriter.append((CharSequence) "REMOVE");
                        this.journalWriter.append(' ');
                        this.journalWriter.append((CharSequence) key);
                        this.journalWriter.append('\n');
                        this.lruEntries.remove(key);
                        if (journalRebuildRequired()) {
                            this.executorService.submit(this.cleanupCallable);
                        }
                    }
                } else {
                    throw new IllegalStateException("cache is closed");
                }
            }
        }
    }

    @TargetApi(26)
    public static void closeWriter(Writer writer) throws IOException {
        StrictMode.ThreadPolicy threadPolicy = StrictMode.getThreadPolicy();
        StrictMode.setThreadPolicy(new StrictMode.ThreadPolicy.Builder(threadPolicy).permitUnbufferedIo().build());
        try {
            writer.close();
        } finally {
            StrictMode.setThreadPolicy(threadPolicy);
        }
    }

    public static void deleteIfExists(File file) throws IOException {
        if (file.exists() && !file.delete()) {
            throw new IOException();
        }
    }

    @TargetApi(26)
    public static void flushWriter(Writer writer) throws IOException {
        StrictMode.ThreadPolicy threadPolicy = StrictMode.getThreadPolicy();
        StrictMode.setThreadPolicy(new StrictMode.ThreadPolicy.Builder(threadPolicy).permitUnbufferedIo().build());
        try {
            writer.flush();
        } finally {
            StrictMode.setThreadPolicy(threadPolicy);
        }
    }
}
