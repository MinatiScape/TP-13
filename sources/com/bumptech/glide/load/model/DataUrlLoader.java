package com.bumptech.glide.load.model;

import android.util.Base64;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.data.DataFetcher;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.signature.ObjectKey;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Objects;
/* loaded from: classes.dex */
public final class DataUrlLoader<Model, Data> implements ModelLoader<Model, Data> {
    public final DataDecoder<Data> dataDecoder;

    /* loaded from: classes.dex */
    public interface DataDecoder<Data> {
    }

    /* loaded from: classes.dex */
    public static final class DataUriFetcher<Data> implements DataFetcher<Data> {
        public Data data;
        public final String dataUri;
        public final DataDecoder<Data> reader;

        public DataUriFetcher(String dataUri, DataDecoder<Data> reader) {
            this.dataUri = dataUri;
            this.reader = reader;
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public void cancel() {
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public void cleanup() {
            try {
                DataDecoder<Data> dataDecoder = this.reader;
                Data data = this.data;
                Objects.requireNonNull((StreamFactory.AnonymousClass1) dataDecoder);
                ((InputStream) data).close();
            } catch (IOException unused) {
            }
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public Class<Data> getDataClass() {
            Objects.requireNonNull((StreamFactory.AnonymousClass1) this.reader);
            return InputStream.class;
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public DataSource getDataSource() {
            return DataSource.LOCAL;
        }

        /* JADX WARN: Type inference failed for: r2v3, types: [java.lang.Object, Data] */
        @Override // com.bumptech.glide.load.data.DataFetcher
        public void loadData(Priority priority, DataFetcher.DataCallback<? super Data> callback) {
            try {
                ?? r2 = (Data) ((StreamFactory.AnonymousClass1) this.reader).decode(this.dataUri);
                this.data = r2;
                callback.onDataReady(r2);
            } catch (IllegalArgumentException e) {
                callback.onLoadFailed(e);
            }
        }
    }

    /* loaded from: classes.dex */
    public static final class StreamFactory<Model> implements ModelLoaderFactory<Model, InputStream> {
        public final DataDecoder<InputStream> opener = new AnonymousClass1();

        /* renamed from: com.bumptech.glide.load.model.DataUrlLoader$StreamFactory$1  reason: invalid class name */
        /* loaded from: classes.dex */
        public class AnonymousClass1 implements DataDecoder<InputStream> {
            public Object decode(String url) throws IllegalArgumentException {
                if (url.startsWith("data:image")) {
                    int indexOf = url.indexOf(44);
                    if (indexOf == -1) {
                        throw new IllegalArgumentException("Missing comma in data URL.");
                    } else if (url.substring(0, indexOf).endsWith(";base64")) {
                        return new ByteArrayInputStream(Base64.decode(url.substring(indexOf + 1), 0));
                    } else {
                        throw new IllegalArgumentException("Not a base64 image data URL.");
                    }
                } else {
                    throw new IllegalArgumentException("Not a valid image data URL.");
                }
            }
        }

        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public ModelLoader<Model, InputStream> build(MultiModelLoaderFactory multiFactory) {
            return new DataUrlLoader(this.opener);
        }
    }

    public DataUrlLoader(DataDecoder<Data> dataDecoder) {
        this.dataDecoder = dataDecoder;
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public ModelLoader.LoadData<Data> buildLoadData(Model model, int width, int height, Options options) {
        return new ModelLoader.LoadData<>(new ObjectKey(model), new DataUriFetcher(model.toString(), this.dataDecoder));
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public boolean handles(Model model) {
        return model.toString().startsWith("data:image");
    }
}
