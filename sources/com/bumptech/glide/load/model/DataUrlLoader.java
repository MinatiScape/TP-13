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
/* loaded from: classes.dex */
public final class DataUrlLoader<Model, Data> implements ModelLoader<Model, Data> {
    public final DataDecoder<Data> dataDecoder;

    /* loaded from: classes.dex */
    public interface DataDecoder<Data> {
    }

    /* loaded from: classes.dex */
    public static final class DataUriFetcher<Data> implements DataFetcher<Data> {
        public ByteArrayInputStream data;
        public final String dataUri;
        public final DataDecoder<Data> reader;

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void cancel() {
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void cleanup() {
            try {
                DataDecoder<Data> dataDecoder = this.reader;
                ByteArrayInputStream byteArrayInputStream = this.data;
                ((StreamFactory.AnonymousClass1) dataDecoder).getClass();
                byteArrayInputStream.close();
            } catch (IOException unused) {
            }
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final Class<Data> getDataClass() {
            ((StreamFactory.AnonymousClass1) this.reader).getClass();
            return InputStream.class;
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void loadData(Priority priority, DataFetcher.DataCallback<? super Data> dataCallback) {
            try {
                ByteArrayInputStream decode = ((StreamFactory.AnonymousClass1) this.reader).decode(this.dataUri);
                this.data = decode;
                dataCallback.onDataReady(decode);
            } catch (IllegalArgumentException e) {
                dataCallback.onLoadFailed(e);
            }
        }

        public DataUriFetcher(String str, DataDecoder<Data> dataDecoder) {
            this.dataUri = str;
            this.reader = dataDecoder;
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final DataSource getDataSource() {
            return DataSource.LOCAL;
        }
    }

    /* loaded from: classes.dex */
    public static final class StreamFactory<Model> implements ModelLoaderFactory<Model, InputStream> {
        public final AnonymousClass1 opener = new AnonymousClass1();

        /* renamed from: com.bumptech.glide.load.model.DataUrlLoader$StreamFactory$1  reason: invalid class name */
        /* loaded from: classes.dex */
        public class AnonymousClass1 implements DataDecoder<InputStream> {
            public final ByteArrayInputStream decode(String str) throws IllegalArgumentException {
                if (str.startsWith("data:image")) {
                    int indexOf = str.indexOf(44);
                    if (indexOf == -1) {
                        throw new IllegalArgumentException("Missing comma in data URL.");
                    } else if (str.substring(0, indexOf).endsWith(";base64")) {
                        return new ByteArrayInputStream(Base64.decode(str.substring(indexOf + 1), 0));
                    } else {
                        throw new IllegalArgumentException("Not a base64 image data URL.");
                    }
                } else {
                    throw new IllegalArgumentException("Not a valid image data URL.");
                }
            }
        }

        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public final ModelLoader<Model, InputStream> build(MultiModelLoaderFactory multiModelLoaderFactory) {
            return new DataUrlLoader(this.opener);
        }
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final ModelLoader.LoadData<Data> buildLoadData(Model model, int i, int i2, Options options) {
        return new ModelLoader.LoadData<>(new ObjectKey(model), new DataUriFetcher(model.toString(), this.dataDecoder));
    }

    public DataUrlLoader(StreamFactory.AnonymousClass1 r1) {
        this.dataDecoder = r1;
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final boolean handles(Model model) {
        return model.toString().startsWith("data:image");
    }
}
