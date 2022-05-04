package com.bumptech.glide.load.model;

import android.os.ParcelFileDescriptor;
import android.util.Log;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.data.DataFetcher;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.signature.ObjectKey;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes.dex */
public final class FileLoader<Data> implements ModelLoader<File, Data> {
    public final FileOpener<Data> fileOpener;

    /* loaded from: classes.dex */
    public static class Factory<Data> implements ModelLoaderFactory<File, Data> {
        public final FileOpener<Data> opener;

        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public final ModelLoader<File, Data> build(MultiModelLoaderFactory multiModelLoaderFactory) {
            return new FileLoader(this.opener);
        }

        public Factory(FileOpener<Data> fileOpener) {
            this.opener = fileOpener;
        }
    }

    /* loaded from: classes.dex */
    public static class FileDescriptorFactory extends Factory<ParcelFileDescriptor> {
        public FileDescriptorFactory() {
            super(new FileOpener<ParcelFileDescriptor>() { // from class: com.bumptech.glide.load.model.FileLoader.FileDescriptorFactory.1
                @Override // com.bumptech.glide.load.model.FileLoader.FileOpener
                public final void close(ParcelFileDescriptor parcelFileDescriptor) throws IOException {
                    parcelFileDescriptor.close();
                }

                @Override // com.bumptech.glide.load.model.FileLoader.FileOpener
                public final ParcelFileDescriptor open(File file) throws FileNotFoundException {
                    return ParcelFileDescriptor.open(file, 268435456);
                }

                @Override // com.bumptech.glide.load.model.FileLoader.FileOpener
                public final Class<ParcelFileDescriptor> getDataClass() {
                    return ParcelFileDescriptor.class;
                }
            });
        }
    }

    /* loaded from: classes.dex */
    public static final class FileFetcher<Data> implements DataFetcher<Data> {
        public Data data;
        public final File file;
        public final FileOpener<Data> opener;

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void cancel() {
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void cleanup() {
            Data data = this.data;
            if (data != null) {
                try {
                    this.opener.close(data);
                } catch (IOException unused) {
                }
            }
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final Class<Data> getDataClass() {
            return this.opener.getDataClass();
        }

        /* JADX WARN: Type inference failed for: r2v5, types: [java.lang.Object, Data] */
        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void loadData(Priority priority, DataFetcher.DataCallback<? super Data> dataCallback) {
            try {
                Data open = this.opener.open(this.file);
                this.data = open;
                dataCallback.onDataReady(open);
            } catch (FileNotFoundException e) {
                if (Log.isLoggable("FileLoader", 3)) {
                    Log.d("FileLoader", "Failed to open file", e);
                }
                dataCallback.onLoadFailed(e);
            }
        }

        public FileFetcher(File file, FileOpener<Data> fileOpener) {
            this.file = file;
            this.opener = fileOpener;
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final DataSource getDataSource() {
            return DataSource.LOCAL;
        }
    }

    /* loaded from: classes.dex */
    public interface FileOpener<Data> {
        void close(Data data) throws IOException;

        Class<Data> getDataClass();

        Data open(File file) throws FileNotFoundException;
    }

    /* loaded from: classes.dex */
    public static class StreamFactory extends Factory<InputStream> {
        public StreamFactory() {
            super(new FileOpener<InputStream>() { // from class: com.bumptech.glide.load.model.FileLoader.StreamFactory.1
                @Override // com.bumptech.glide.load.model.FileLoader.FileOpener
                public final void close(InputStream inputStream) throws IOException {
                    inputStream.close();
                }

                @Override // com.bumptech.glide.load.model.FileLoader.FileOpener
                public final InputStream open(File file) throws FileNotFoundException {
                    return new FileInputStream(file);
                }

                @Override // com.bumptech.glide.load.model.FileLoader.FileOpener
                public final Class<InputStream> getDataClass() {
                    return InputStream.class;
                }
            });
        }
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final ModelLoader.LoadData buildLoadData(File file, int i, int i2, Options options) {
        File file2 = file;
        return new ModelLoader.LoadData(new ObjectKey(file2), new FileFetcher(file2, this.fileOpener));
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final /* bridge */ /* synthetic */ boolean handles(File file) {
        return true;
    }

    public FileLoader(FileOpener<Data> fileOpener) {
        this.fileOpener = fileOpener;
    }
}
