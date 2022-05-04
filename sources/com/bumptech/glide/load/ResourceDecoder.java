package com.bumptech.glide.load;

import com.bumptech.glide.load.engine.Resource;
import java.io.IOException;
/* loaded from: classes.dex */
public interface ResourceDecoder<T, Z> {
    Resource<Z> decode(T source, int width, int height, Options options) throws IOException;

    boolean handles(T source, Options options) throws IOException;
}
