package com.bumptech.glide.load.engine.cache;

import androidx.collection.ContainerHelpers;
import java.util.ArrayDeque;
import java.util.HashMap;
import java.util.concurrent.locks.ReentrantLock;
/* loaded from: classes.dex */
public final class DiskCacheWriteLocker {
    public final HashMap locks = new HashMap();
    public final WriteLockPool writeLockPool = new WriteLockPool();

    /* loaded from: classes.dex */
    public static class WriteLock {
        public int interestedThreads;
        public final ReentrantLock lock = new ReentrantLock();
    }

    /* loaded from: classes.dex */
    public static class WriteLockPool {
        public final ArrayDeque pool = new ArrayDeque();
    }

    public final void release(String str) {
        WriteLock writeLock;
        synchronized (this) {
            Object obj = this.locks.get(str);
            ContainerHelpers.checkNotNull(obj);
            writeLock = (WriteLock) obj;
            int i = writeLock.interestedThreads;
            if (i >= 1) {
                int i2 = i - 1;
                writeLock.interestedThreads = i2;
                if (i2 == 0) {
                    WriteLock writeLock2 = (WriteLock) this.locks.remove(str);
                    if (writeLock2.equals(writeLock)) {
                        WriteLockPool writeLockPool = this.writeLockPool;
                        synchronized (writeLockPool.pool) {
                            if (writeLockPool.pool.size() < 10) {
                                writeLockPool.pool.offer(writeLock2);
                            }
                        }
                    } else {
                        throw new IllegalStateException("Removed the wrong lock, expected to remove: " + writeLock + ", but actually removed: " + writeLock2 + ", safeKey: " + str);
                    }
                }
            } else {
                throw new IllegalStateException("Cannot release a lock that is not held, safeKey: " + str + ", interestedThreads: " + writeLock.interestedThreads);
            }
        }
        writeLock.lock.unlock();
    }
}
