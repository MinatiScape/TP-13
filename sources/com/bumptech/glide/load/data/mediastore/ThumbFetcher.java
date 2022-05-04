package com.bumptech.glide.load.data.mediastore;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.MediaStore;
import android.util.Log;
import com.bumptech.glide.Glide;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.data.DataFetcher;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes.dex */
public class ThumbFetcher implements DataFetcher<InputStream> {
    public InputStream inputStream;
    public final Uri mediaStoreImageUri;
    public final ThumbnailStreamOpener opener;

    /* loaded from: classes.dex */
    public static class ImageThumbnailQuery implements ThumbnailQuery {
        public static final String[] PATH_PROJECTION = {"_data"};
        public final ContentResolver contentResolver;

        public ImageThumbnailQuery(ContentResolver contentResolver) {
            this.contentResolver = contentResolver;
        }

        @Override // com.bumptech.glide.load.data.mediastore.ThumbnailQuery
        public Cursor query(Uri uri) {
            return this.contentResolver.query(MediaStore.Images.Thumbnails.EXTERNAL_CONTENT_URI, PATH_PROJECTION, "kind = 1 AND image_id = ?", new String[]{uri.getLastPathSegment()}, null);
        }
    }

    /* loaded from: classes.dex */
    public static class VideoThumbnailQuery implements ThumbnailQuery {
        public static final String[] PATH_PROJECTION = {"_data"};
        public final ContentResolver contentResolver;

        public VideoThumbnailQuery(ContentResolver contentResolver) {
            this.contentResolver = contentResolver;
        }

        @Override // com.bumptech.glide.load.data.mediastore.ThumbnailQuery
        public Cursor query(Uri uri) {
            return this.contentResolver.query(MediaStore.Video.Thumbnails.EXTERNAL_CONTENT_URI, PATH_PROJECTION, "kind = 1 AND video_id = ?", new String[]{uri.getLastPathSegment()}, null);
        }
    }

    public ThumbFetcher(Uri mediaStoreImageUri, ThumbnailStreamOpener opener) {
        this.mediaStoreImageUri = mediaStoreImageUri;
        this.opener = opener;
    }

    public static ThumbFetcher build(Context context, Uri uri, ThumbnailQuery query) {
        return new ThumbFetcher(uri, new ThumbnailStreamOpener(Glide.get(context).registry.getImageHeaderParsers(), query, Glide.get(context).arrayPool, context.getContentResolver()));
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public void cancel() {
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public void cleanup() {
        InputStream inputStream = this.inputStream;
        if (inputStream != null) {
            try {
                inputStream.close();
            } catch (IOException unused) {
            }
        }
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public Class<InputStream> getDataClass() {
        return InputStream.class;
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public DataSource getDataSource() {
        return DataSource.LOCAL;
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public void loadData(Priority priority, DataFetcher.DataCallback<? super InputStream> callback) {
        try {
            InputStream openThumbInputStream = openThumbInputStream();
            this.inputStream = openThumbInputStream;
            callback.onDataReady(openThumbInputStream);
        } catch (FileNotFoundException e) {
            if (Log.isLoggable("MediaStoreThumbFetcher", 3)) {
                Log.d("MediaStoreThumbFetcher", "Failed to find thumbnail file", e);
            }
            callback.onLoadFailed(e);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x002e  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00a9  */
    /* JADX WARN: Removed duplicated region for block: B:64:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.io.InputStream openThumbInputStream() throws java.io.FileNotFoundException {
        /*
            r9 = this;
            com.bumptech.glide.load.data.mediastore.ThumbnailStreamOpener r0 = r9.opener
            android.net.Uri r1 = r9.mediaStoreImageUri
            com.bumptech.glide.load.data.mediastore.ThumbnailQuery r2 = r0.query
            android.database.Cursor r2 = r2.query(r1)
            r3 = 0
            r4 = 0
            if (r2 == 0) goto L21
            boolean r5 = r2.moveToFirst()     // Catch: java.lang.Throwable -> L1c
            if (r5 == 0) goto L21
            java.lang.String r5 = r2.getString(r3)     // Catch: java.lang.Throwable -> L1c
            r2.close()
            goto L27
        L1c:
            r9 = move-exception
            r2.close()
            throw r9
        L21:
            if (r2 == 0) goto L26
            r2.close()
        L26:
            r5 = r4
        L27:
            boolean r2 = android.text.TextUtils.isEmpty(r5)
            if (r2 == 0) goto L2e
            goto L46
        L2e:
            java.io.File r2 = new java.io.File
            r2.<init>(r5)
            boolean r5 = r2.exists()
            if (r5 == 0) goto L44
            r5 = 0
            long r7 = r2.length()
            int r5 = (r5 > r7 ? 1 : (r5 == r7 ? 0 : -1))
            if (r5 >= 0) goto L44
            r3 = 1
        L44:
            if (r3 != 0) goto L48
        L46:
            r0 = r4
            goto L52
        L48:
            android.net.Uri r2 = android.net.Uri.fromFile(r2)
            android.content.ContentResolver r0 = r0.contentResolver     // Catch: java.lang.NullPointerException -> Lb0
            java.io.InputStream r0 = r0.openInputStream(r2)     // Catch: java.lang.NullPointerException -> Lb0
        L52:
            r1 = -1
            if (r0 == 0) goto La6
            com.bumptech.glide.load.data.mediastore.ThumbnailStreamOpener r2 = r9.opener
            android.net.Uri r9 = r9.mediaStoreImageUri
            java.util.Objects.requireNonNull(r2)
            java.lang.String r3 = "ThumbStreamOpener"
            android.content.ContentResolver r5 = r2.contentResolver     // Catch: java.lang.Throwable -> L72 java.lang.Throwable -> L74
            java.io.InputStream r4 = r5.openInputStream(r9)     // Catch: java.lang.Throwable -> L72 java.lang.Throwable -> L74
            java.util.List<com.bumptech.glide.load.ImageHeaderParser> r5 = r2.parsers     // Catch: java.lang.Throwable -> L72 java.lang.Throwable -> L74
            com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool r2 = r2.byteArrayPool     // Catch: java.lang.Throwable -> L72 java.lang.Throwable -> L74
            int r9 = com.bumptech.glide.load.ImageHeaderParserUtils.getOrientation(r5, r4, r2)     // Catch: java.lang.Throwable -> L72 java.lang.Throwable -> L74
            if (r4 == 0) goto La7
            r4.close()     // Catch: java.io.IOException -> La7
            goto La7
        L72:
            r9 = move-exception
            goto La0
        L74:
            r2 = move-exception
            r5 = 3
            boolean r5 = android.util.Log.isLoggable(r3, r5)     // Catch: java.lang.Throwable -> L72
            if (r5 == 0) goto L9a
            java.lang.String r9 = java.lang.String.valueOf(r9)     // Catch: java.lang.Throwable -> L72
            int r5 = r9.length()     // Catch: java.lang.Throwable -> L72
            int r5 = r5 + 20
            java.lang.StringBuilder r6 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L72
            r6.<init>(r5)     // Catch: java.lang.Throwable -> L72
            java.lang.String r5 = "Failed to open uri: "
            r6.append(r5)     // Catch: java.lang.Throwable -> L72
            r6.append(r9)     // Catch: java.lang.Throwable -> L72
            java.lang.String r9 = r6.toString()     // Catch: java.lang.Throwable -> L72
            android.util.Log.d(r3, r9, r2)     // Catch: java.lang.Throwable -> L72
        L9a:
            if (r4 == 0) goto La6
            r4.close()     // Catch: java.io.IOException -> La6
            goto La6
        La0:
            if (r4 == 0) goto La5
            r4.close()     // Catch: java.io.IOException -> La5
        La5:
            throw r9
        La6:
            r9 = r1
        La7:
            if (r9 == r1) goto Laf
            com.bumptech.glide.load.data.ExifOrientationStream r1 = new com.bumptech.glide.load.data.ExifOrientationStream
            r1.<init>(r0, r9)
            r0 = r1
        Laf:
            return r0
        Lb0:
            r9 = move-exception
            java.io.FileNotFoundException r0 = new java.io.FileNotFoundException
            java.lang.String r1 = java.lang.String.valueOf(r1)
            java.lang.String r2 = java.lang.String.valueOf(r2)
            int r3 = r1.length()
            int r3 = r3 + 21
            int r4 = r2.length()
            int r4 = r4 + r3
            java.lang.String r3 = "NPE opening uri: "
            java.lang.String r5 = " -> "
            java.lang.String r1 = com.bumptech.glide.Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline1.m(r4, r3, r1, r5, r2)
            r0.<init>(r1)
            java.lang.Throwable r9 = r0.initCause(r9)
            java.io.FileNotFoundException r9 = (java.io.FileNotFoundException) r9
            throw r9
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.load.data.mediastore.ThumbFetcher.openThumbInputStream():java.io.InputStream");
    }
}
