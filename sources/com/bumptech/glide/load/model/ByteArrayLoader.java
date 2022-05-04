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
public class ByteArrayLoader<Data> implements ModelLoader<byte[], Data> {
    public final Converter<Data> converter;

    /* loaded from: classes.dex */
    public static class ByteBufferFactory implements ModelLoaderFactory<byte[], ByteBuffer> {
        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public ModelLoader<byte[], ByteBuffer> build(MultiModelLoaderFactory multiFactory) {
            return new ByteArrayLoader(new Converter<ByteBuffer>() { // from class: com.bumptech.glide.load.model.ByteArrayLoader.ByteBufferFactory.1
                @Override // com.bumptech.glide.load.model.ByteArrayLoader.Converter
                public ByteBuffer convert(byte[] model) {
                    return ByteBuffer.wrap(model);
                }

                @Override // com.bumptech.glide.load.model.ByteArrayLoader.Converter
                public Class<ByteBuffer> getDataClass() {
                    return ByteBuffer.class;
                }
            });
        }
    }

    /* loaded from: classes.dex */
    public interface Converter<Data> {
        Data convert(byte[] model);

        Class<Data> getDataClass();
    }

    /* loaded from: classes.dex */
    public static class Fetcher<Data> implements DataFetcher<Data> {
        public final Converter<Data> converter;
        public final byte[] model;

        public Fetcher(byte[] model, Converter<Data> converter) {
            this.model = model;
            this.converter = converter;
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public void cancel() {
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public void cleanup() {
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public Class<Data> getDataClass() {
            return this.converter.getDataClass();
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public DataSource getDataSource() {
            return DataSource.LOCAL;
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public void loadData(Priority priority, DataFetcher.DataCallback<? super Data> callback) {
            callback.onDataReady((Data) this.converter.convert(this.model));
        }
    }

    /* loaded from: classes.dex */
    public static class StreamFactory implements ModelLoaderFactory<byte[], InputStream> {
        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public ModelLoader<byte[], InputStream> build(MultiModelLoaderFactory multiFactory) {
            return new ByteArrayLoader(new Converter<InputStream>() { // from class: com.bumptech.glide.load.model.ByteArrayLoader.StreamFactory.1
                @Override // com.bumptech.glide.load.model.ByteArrayLoader.Converter
                public InputStream convert(byte[] model) {
                    return new ByteArrayInputStream(model);
                }

                @Override // com.bumptech.glide.load.model.ByteArrayLoader.Converter
                public Class<InputStream> getDataClass() {
                    return InputStream.class;
                }
            });
        }
    }

    public ByteArrayLoader(Converter<Data> converter) {
        this.converter = converter;
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public ModelLoader.LoadData buildLoadData(byte[] model, int width, int height, Options options) {
        byte[] bArr = model;
        return new ModelLoader.LoadData(new ObjectKey(bArr), new Fetcher(bArr, this.converter));
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public /* bridge */ /* synthetic */ boolean handles(byte[] model) {
        return true;
    }
}
