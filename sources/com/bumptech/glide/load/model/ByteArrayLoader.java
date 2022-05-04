package com.bumptech.glide.load.model;

import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.data.DataFetcher;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.signature.ObjectKey;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.ByteBuffer;
/* loaded from: classes.dex */
public final class ByteArrayLoader<Data> implements ModelLoader<byte[], Data> {
    public final Converter<Data> converter;

    /* loaded from: classes.dex */
    public static class ByteBufferFactory implements ModelLoaderFactory<byte[], ByteBuffer> {
        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public final ModelLoader<byte[], ByteBuffer> build(MultiModelLoaderFactory multiModelLoaderFactory) {
            return new ByteArrayLoader(new Converter<ByteBuffer>() { // from class: com.bumptech.glide.load.model.ByteArrayLoader.ByteBufferFactory.1
                @Override // com.bumptech.glide.load.model.ByteArrayLoader.Converter
                public final ByteBuffer convert(byte[] bArr) {
                    return ByteBuffer.wrap(bArr);
                }

                @Override // com.bumptech.glide.load.model.ByteArrayLoader.Converter
                public final Class<ByteBuffer> getDataClass() {
                    return ByteBuffer.class;
                }
            });
        }
    }

    /* loaded from: classes.dex */
    public interface Converter<Data> {
        Data convert(byte[] bArr);

        Class<Data> getDataClass();
    }

    /* loaded from: classes.dex */
    public static class Fetcher<Data> implements DataFetcher<Data> {
        public final Converter<Data> converter;
        public final byte[] model;

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void cancel() {
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void cleanup() {
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final Class<Data> getDataClass() {
            return this.converter.getDataClass();
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void loadData(Priority priority, DataFetcher.DataCallback<? super Data> dataCallback) {
            dataCallback.onDataReady((Data) this.converter.convert(this.model));
        }

        public Fetcher(byte[] bArr, Converter<Data> converter) {
            this.model = bArr;
            this.converter = converter;
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final DataSource getDataSource() {
            return DataSource.LOCAL;
        }
    }

    /* loaded from: classes.dex */
    public static class StreamFactory implements ModelLoaderFactory<byte[], InputStream> {
        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public final ModelLoader<byte[], InputStream> build(MultiModelLoaderFactory multiModelLoaderFactory) {
            return new ByteArrayLoader(new Converter<InputStream>() { // from class: com.bumptech.glide.load.model.ByteArrayLoader.StreamFactory.1
                @Override // com.bumptech.glide.load.model.ByteArrayLoader.Converter
                public final InputStream convert(byte[] bArr) {
                    return new ByteArrayInputStream(bArr);
                }

                @Override // com.bumptech.glide.load.model.ByteArrayLoader.Converter
                public final Class<InputStream> getDataClass() {
                    return InputStream.class;
                }
            });
        }
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final ModelLoader.LoadData buildLoadData(byte[] bArr, int i, int i2, Options options) {
        byte[] bArr2 = bArr;
        return new ModelLoader.LoadData(new ObjectKey(bArr2), new Fetcher(bArr2, this.converter));
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final /* bridge */ /* synthetic */ boolean handles(byte[] bArr) {
        return true;
    }

    public ByteArrayLoader(Converter<Data> converter) {
        this.converter = converter;
    }
}
