package com.bumptech.glide.load.engine;

import com.bumptech.glide.load.Encoder;
import com.bumptech.glide.load.Options;
/* loaded from: classes.dex */
public final class DataCacheWriter<DataType> {
    public final DataType data;
    public final Encoder<DataType> encoder;
    public final Options options;

    public DataCacheWriter(Encoder<DataType> encoder, DataType datatype, Options options) {
        this.encoder = encoder;
        this.data = datatype;
        this.options = options;
    }
}
