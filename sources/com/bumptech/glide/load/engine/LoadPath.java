package com.bumptech.glide.load.engine;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import androidx.collection.ContainerHelpers;
import androidx.core.util.Pools$Pool;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.data.DataRewinder;
import com.bumptech.glide.load.engine.DecodeJob;
import com.bumptech.glide.util.pool.FactoryPools;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
/* loaded from: classes.dex */
public final class LoadPath<Data, ResourceType, Transcode> {
    public final List<? extends DecodePath<Data, ResourceType, Transcode>> decodePaths;
    public final String failureMessage;
    public final Pools$Pool<List<Throwable>> listPool;

    public final Resource load(DataRewinder dataRewinder, Options options, int i, int i2, DecodeJob.DecodeCallback decodeCallback) throws GlideException {
        List<Throwable> acquire = this.listPool.acquire();
        ContainerHelpers.checkNotNull(acquire);
        List<Throwable> list = acquire;
        try {
            int size = this.decodePaths.size();
            Resource resource = null;
            for (int i3 = 0; i3 < size; i3++) {
                try {
                    resource = this.decodePaths.get(i3).decode(dataRewinder, i, i2, options, decodeCallback);
                } catch (GlideException e) {
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
        } finally {
            this.listPool.release(list);
        }
    }

    public final String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("LoadPath{decodePaths=");
        m.append(Arrays.toString(this.decodePaths.toArray()));
        m.append('}');
        return m.toString();
    }

    public LoadPath(Class cls, Class cls2, Class cls3, List list, FactoryPools.FactoryPool factoryPool) {
        this.listPool = factoryPool;
        if (!list.isEmpty()) {
            this.decodePaths = list;
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Failed LoadPath{");
            m.append(cls.getSimpleName());
            m.append("->");
            m.append(cls2.getSimpleName());
            m.append("->");
            m.append(cls3.getSimpleName());
            m.append("}");
            this.failureMessage = m.toString();
            return;
        }
        throw new IllegalArgumentException("Must not be empty.");
    }
}
