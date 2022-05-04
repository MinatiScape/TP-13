package com.bumptech.glide.load.engine.cache;

import android.util.Log;
import com.bumptech.glide.disklrucache.DiskLruCache;
import com.bumptech.glide.disklrucache.Util;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.engine.DataCacheWriter;
import com.bumptech.glide.load.engine.cache.DiskCacheWriteLocker;
import java.io.File;
import java.io.IOException;
/* loaded from: classes.dex */
public final class DiskLruCacheWrapper implements DiskCache {
    public final File directory;
    public DiskLruCache diskLruCache;
    public final long maxSize;
    public final DiskCacheWriteLocker writeLocker = new DiskCacheWriteLocker();
    public final SafeKeyGenerator safeKeyGenerator = new SafeKeyGenerator();

    @Override // com.bumptech.glide.load.engine.cache.DiskCache
    public final synchronized void clear() {
        try {
            DiskLruCache diskCache = getDiskCache();
            diskCache.close();
            Util.deleteContents(diskCache.directory);
        } catch (IOException e) {
            if (Log.isLoggable("DiskLruCacheWrapper", 5)) {
                Log.w("DiskLruCacheWrapper", "Unable to clear disk cache or disk cache cleared externally", e);
            }
        }
        resetDiskCache();
    }

    public final synchronized DiskLruCache getDiskCache() throws IOException {
        if (this.diskLruCache == null) {
            this.diskLruCache = DiskLruCache.open(this.directory, this.maxSize);
        }
        return this.diskLruCache;
    }

    public final synchronized void resetDiskCache() {
        this.diskLruCache = null;
    }

    @Override // com.bumptech.glide.load.engine.cache.DiskCache
    public final File get(Key key) {
        String safeKey = this.safeKeyGenerator.getSafeKey(key);
        if (Log.isLoggable("DiskLruCacheWrapper", 2)) {
            Log.v("DiskLruCacheWrapper", "Get: Obtained: " + safeKey + " for for Key: " + key);
        }
        try {
            DiskLruCache.Value value = getDiskCache().get(safeKey);
            if (value != null) {
                return value.files[0];
            }
            return null;
        } catch (IOException e) {
            if (!Log.isLoggable("DiskLruCacheWrapper", 5)) {
                return null;
            }
            Log.w("DiskLruCacheWrapper", "Unable to get from disk cache", e);
            return null;
        }
    }

    @Override // com.bumptech.glide.load.engine.cache.DiskCache
    public final void put(Key key, DataCacheWriter dataCacheWriter) {
        DiskCacheWriteLocker.WriteLock writeLock;
        String safeKey = this.safeKeyGenerator.getSafeKey(key);
        DiskCacheWriteLocker diskCacheWriteLocker = this.writeLocker;
        synchronized (diskCacheWriteLocker) {
            writeLock = (DiskCacheWriteLocker.WriteLock) diskCacheWriteLocker.locks.get(safeKey);
            if (writeLock == null) {
                DiskCacheWriteLocker.WriteLockPool writeLockPool = diskCacheWriteLocker.writeLockPool;
                synchronized (writeLockPool.pool) {
                    writeLock = (DiskCacheWriteLocker.WriteLock) writeLockPool.pool.poll();
                }
                if (writeLock == null) {
                    writeLock = new DiskCacheWriteLocker.WriteLock();
                }
                diskCacheWriteLocker.locks.put(safeKey, writeLock);
            }
            writeLock.interestedThreads++;
        }
        writeLock.lock.lock();
        try {
            if (Log.isLoggable("DiskLruCacheWrapper", 2)) {
                Log.v("DiskLruCacheWrapper", "Put: Obtained: " + safeKey + " for for Key: " + key);
            }
            try {
                DiskLruCache diskCache = getDiskCache();
                if (diskCache.get(safeKey) == null) {
                    DiskLruCache.Editor edit = diskCache.edit(safeKey);
                    if (edit != null) {
                        try {
                            if (dataCacheWriter.encoder.encode(dataCacheWriter.data, edit.getFile(), dataCacheWriter.options)) {
                                DiskLruCache.access$2100(DiskLruCache.this, edit, true);
                                edit.committed = true;
                            }
                        } finally {
                            if (!edit.committed) {
                                try {
                                    edit.abort();
                                } catch (IOException unused) {
                                }
                            }
                        }
                    } else {
                        throw new IllegalStateException("Had two simultaneous puts for: " + safeKey);
                    }
                }
            } catch (IOException e) {
                if (Log.isLoggable("DiskLruCacheWrapper", 5)) {
                    Log.w("DiskLruCacheWrapper", "Unable to put to disk cache", e);
                }
            }
        } finally {
            this.writeLocker.release(safeKey);
        }
    }

    @Deprecated
    public DiskLruCacheWrapper(File file, long j) {
        this.directory = file;
        this.maxSize = j;
    }
}
