package com.bumptech.glide.load.engine;

import androidx.core.util.Pools$Pool;
import androidx.recyclerview.R$attr$$ExternalSyntheticOutline0;
import com.adobe.xmp.XMPPathFactory$$ExternalSyntheticOutline0;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.data.DataRewinder;
import com.bumptech.glide.load.engine.DecodePath;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
/* loaded from: classes.dex */
public class LoadPath<Data, ResourceType, Transcode> {
    public final List<? extends DecodePath<Data, ResourceType, Transcode>> decodePaths;
    public final String failureMessage;
    public final Pools$Pool<List<Throwable>> listPool;

    public LoadPath(Class<Data> dataClass, Class<ResourceType> resourceClass, Class<Transcode> transcodeClass, List<DecodePath<Data, ResourceType, Transcode>> decodePaths, Pools$Pool<List<Throwable>> listPool) {
        this.listPool = listPool;
        if (!decodePaths.isEmpty()) {
            this.decodePaths = decodePaths;
            String simpleName = dataClass.getSimpleName();
            String simpleName2 = resourceClass.getSimpleName();
            String simpleName3 = transcodeClass.getSimpleName();
            StringBuilder m = R$attr$$ExternalSyntheticOutline0.m(simpleName3.length() + simpleName2.length() + simpleName.length() + 21, "Failed LoadPath{", simpleName, "->", simpleName2);
            m.append("->");
            m.append(simpleName3);
            m.append("}");
            this.failureMessage = m.toString();
            return;
        }
        throw new IllegalArgumentException("Must not be empty.");
    }

    public Resource<Transcode> load(DataRewinder<Data> rewinder, Options options, int width, int height, DecodePath.DecodeCallback<ResourceType> decodeCallback) throws GlideException {
        List<Throwable> acquire = this.listPool.acquire();
        Objects.requireNonNull(acquire, "Argument must not be null");
        try {
            int size = this.decodePaths.size();
            Resource<Transcode> resource = null;
            for (int i = 0; i < size; i++) {
                try {
                    resource = this.decodePaths.get(i).decode(rewinder, width, height, options, decodeCallback);
                } catch (GlideException e) {
                    acquire.add(e);
                }
                if (resource != null) {
                    break;
                }
            }
            if (resource != null) {
                return resource;
            }
            throw new GlideException(this.failureMessage, new ArrayList(acquire));
        } finally {
            this.listPool.release(acquire);
        }
    }

    public String toString() {
        String arrays = Arrays.toString(this.decodePaths.toArray());
        StringBuilder sb = new StringBuilder(XMPPathFactory$$ExternalSyntheticOutline0.m(arrays, 22));
        sb.append("LoadPath{decodePaths=");
        sb.append(arrays);
        sb.append('}');
        return sb.toString();
    }
}
