package com.bumptech.glide.load.engine.cache;

import androidx.collection.ContainerHelpers;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.util.LruCache;
import com.bumptech.glide.util.Util;
import com.bumptech.glide.util.pool.FactoryPools;
import com.bumptech.glide.util.pool.StateVerifier;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
/* loaded from: classes.dex */
public final class SafeKeyGenerator {
    public final LruCache<Key, String> loadIdToSafeHash = new LruCache<>(1000);
    public final FactoryPools.FactoryPool digestPool = FactoryPools.threadSafe(10, new FactoryPools.Factory<PoolableDigestContainer>() { // from class: com.bumptech.glide.load.engine.cache.SafeKeyGenerator.1
        @Override // com.bumptech.glide.util.pool.FactoryPools.Factory
        public final PoolableDigestContainer create() {
            try {
                return new PoolableDigestContainer(MessageDigest.getInstance("SHA-256"));
            } catch (NoSuchAlgorithmException e) {
                throw new RuntimeException(e);
            }
        }
    });

    /* loaded from: classes.dex */
    public static final class PoolableDigestContainer implements FactoryPools.Poolable {
        public final MessageDigest messageDigest;
        public final StateVerifier.DefaultStateVerifier stateVerifier = new StateVerifier.DefaultStateVerifier();

        public PoolableDigestContainer(MessageDigest messageDigest) {
            this.messageDigest = messageDigest;
        }

        @Override // com.bumptech.glide.util.pool.FactoryPools.Poolable
        public final StateVerifier.DefaultStateVerifier getVerifier() {
            return this.stateVerifier;
        }
    }

    public final String getSafeKey(Key key) {
        String str;
        synchronized (this.loadIdToSafeHash) {
            str = this.loadIdToSafeHash.get(key);
        }
        if (str == null) {
            Object acquire = this.digestPool.acquire();
            ContainerHelpers.checkNotNull(acquire);
            PoolableDigestContainer poolableDigestContainer = (PoolableDigestContainer) acquire;
            try {
                key.updateDiskCacheKey(poolableDigestContainer.messageDigest);
                byte[] digest = poolableDigestContainer.messageDigest.digest();
                char[] cArr = Util.SHA_256_CHARS;
                synchronized (cArr) {
                    for (int i = 0; i < digest.length; i++) {
                        int i2 = digest[i] & 255;
                        int i3 = i * 2;
                        char[] cArr2 = Util.HEX_CHAR_ARRAY;
                        cArr[i3] = cArr2[i2 >>> 4];
                        cArr[i3 + 1] = cArr2[i2 & 15];
                    }
                    str = new String(cArr);
                }
            } finally {
                this.digestPool.release(poolableDigestContainer);
            }
        }
        synchronized (this.loadIdToSafeHash) {
            this.loadIdToSafeHash.put(key, str);
        }
        return str;
    }
}
