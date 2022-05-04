package com.bumptech.glide.load.engine;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import androidx.collection.ContainerHelpers;
import androidx.core.util.Pools$Pool;
import com.bumptech.glide.Registry;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.EncodeStrategy;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.ResourceEncoder;
import com.bumptech.glide.load.Transformation;
import com.bumptech.glide.load.data.DataRewinder;
import com.bumptech.glide.load.engine.DecodeJob;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.load.resource.transcode.ResourceTranscoder;
import com.bumptech.glide.util.pool.FactoryPools;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public final class DecodePath<DataType, ResourceType, Transcode> {
    public final Class<DataType> dataClass;
    public final List<? extends ResourceDecoder<DataType, ResourceType>> decoders;
    public final String failureMessage;
    public final Pools$Pool<List<Throwable>> listPool;
    public final ResourceTranscoder<ResourceType, Transcode> transcoder;

    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Multi-variable type inference failed */
    public final Resource decode(DataRewinder dataRewinder, int i, int i2, Options options, DecodeJob.DecodeCallback decodeCallback) throws GlideException {
        Transformation transformation;
        Resource resource;
        boolean z;
        EncodeStrategy encodeStrategy;
        boolean z2;
        Key key;
        List<Throwable> acquire = this.listPool.acquire();
        ContainerHelpers.checkNotNull(acquire);
        List<Throwable> list = acquire;
        try {
            Resource<ResourceType> decodeResourceWithList = decodeResourceWithList(dataRewinder, i, i2, options, list);
            this.listPool.release(list);
            DecodeJob decodeJob = DecodeJob.this;
            DataSource dataSource = decodeCallback.dataSource;
            decodeJob.getClass();
            Class<?> cls = decodeResourceWithList.get().getClass();
            ResourceEncoder resourceEncoder = null;
            if (dataSource != DataSource.RESOURCE_DISK_CACHE) {
                Transformation transformation2 = decodeJob.decodeHelper.getTransformation(cls);
                resource = transformation2.transform(decodeJob.glideContext, decodeResourceWithList, decodeJob.width, decodeJob.height);
                transformation = transformation2;
            } else {
                resource = decodeResourceWithList;
                transformation = null;
            }
            if (!decodeResourceWithList.equals(resource)) {
                decodeResourceWithList.recycle();
            }
            if (decodeJob.decodeHelper.glideContext.registry.resourceEncoderRegistry.get(resource.getResourceClass()) != null) {
                z = true;
            } else {
                z = false;
            }
            if (z) {
                ResourceEncoder resourceEncoder2 = decodeJob.decodeHelper.glideContext.registry.resourceEncoderRegistry.get(resource.getResourceClass());
                if (resourceEncoder2 != null) {
                    encodeStrategy = resourceEncoder2.getEncodeStrategy(decodeJob.options);
                    resourceEncoder = resourceEncoder2;
                } else {
                    throw new Registry.NoResultEncoderAvailableException(resource.getResourceClass());
                }
            } else {
                encodeStrategy = EncodeStrategy.NONE;
            }
            DecodeHelper<R> decodeHelper = decodeJob.decodeHelper;
            Key key2 = decodeJob.currentSourceKey;
            ArrayList loadData = decodeHelper.getLoadData();
            int size = loadData.size();
            int i3 = 0;
            while (true) {
                if (i3 >= size) {
                    z2 = false;
                    break;
                } else if (((ModelLoader.LoadData) loadData.get(i3)).sourceKey.equals(key2)) {
                    z2 = true;
                    break;
                } else {
                    i3++;
                }
            }
            if (decodeJob.diskCacheStrategy.isResourceCacheable(!z2, dataSource, encodeStrategy)) {
                if (resourceEncoder != null) {
                    int ordinal = encodeStrategy.ordinal();
                    if (ordinal == 0) {
                        key = new DataCacheKey(decodeJob.currentSourceKey, decodeJob.signature);
                    } else if (ordinal == 1) {
                        key = new ResourceCacheKey(decodeJob.decodeHelper.glideContext.arrayPool, decodeJob.currentSourceKey, decodeJob.signature, decodeJob.width, decodeJob.height, transformation, cls, decodeJob.options);
                    } else {
                        throw new IllegalArgumentException("Unknown strategy: " + encodeStrategy);
                    }
                    LockedResource<Z> lockedResource = (LockedResource) LockedResource.POOL.acquire();
                    ContainerHelpers.checkNotNull(lockedResource);
                    lockedResource.isRecycled = false;
                    lockedResource.isLocked = true;
                    lockedResource.toWrap = resource;
                    DecodeJob.DeferredEncodeManager<?> deferredEncodeManager = decodeJob.deferredEncodeManager;
                    deferredEncodeManager.key = key;
                    deferredEncodeManager.encoder = resourceEncoder;
                    deferredEncodeManager.toEncode = lockedResource;
                    resource = lockedResource;
                } else {
                    throw new Registry.NoResultEncoderAvailableException(resource.get().getClass());
                }
            }
            return this.transcoder.transcode(resource, options);
        } catch (Throwable th) {
            this.listPool.release(list);
            throw th;
        }
    }

    public final Resource<ResourceType> decodeResourceWithList(DataRewinder<DataType> dataRewinder, int i, int i2, Options options, List<Throwable> list) throws GlideException {
        int size = this.decoders.size();
        Resource<ResourceType> resource = null;
        for (int i3 = 0; i3 < size; i3++) {
            ResourceDecoder<DataType, ResourceType> resourceDecoder = this.decoders.get(i3);
            try {
                if (resourceDecoder.handles(dataRewinder.rewindAndGet(), options)) {
                    resource = resourceDecoder.decode(dataRewinder.rewindAndGet(), i, i2, options);
                }
            } catch (IOException | OutOfMemoryError | RuntimeException e) {
                if (Log.isLoggable("DecodePath", 2)) {
                    Log.v("DecodePath", "Failed to decode data for " + resourceDecoder, e);
                }
                list.add(e);
            }
            if (resource != null) {
                break;
            }
        }
        if (resource != null) {
            return resource;
        }
        throw new GlideException(this.failureMessage, new ArrayList(list));
    }

    public final String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("DecodePath{ dataClass=");
        m.append(this.dataClass);
        m.append(", decoders=");
        m.append(this.decoders);
        m.append(", transcoder=");
        m.append(this.transcoder);
        m.append('}');
        return m.toString();
    }

    public DecodePath(Class cls, Class cls2, Class cls3, List list, ResourceTranscoder resourceTranscoder, FactoryPools.FactoryPool factoryPool) {
        this.dataClass = cls;
        this.decoders = list;
        this.transcoder = resourceTranscoder;
        this.listPool = factoryPool;
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Failed DecodePath{");
        m.append(cls.getSimpleName());
        m.append("->");
        m.append(cls2.getSimpleName());
        m.append("->");
        m.append(cls3.getSimpleName());
        m.append("}");
        this.failureMessage = m.toString();
    }
}
