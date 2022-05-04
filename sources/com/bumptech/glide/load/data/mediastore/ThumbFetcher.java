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
public final class ThumbFetcher implements DataFetcher<InputStream> {
    public InputStream inputStream;
    public final Uri mediaStoreImageUri;
    public final ThumbnailStreamOpener opener;

    @Override // com.bumptech.glide.load.data.DataFetcher
    public final void cancel() {
    }

    /* loaded from: classes.dex */
    public static class ImageThumbnailQuery implements ThumbnailQuery {
        public static final String[] PATH_PROJECTION = {"_data"};
        public final ContentResolver contentResolver;

        public ImageThumbnailQuery(ContentResolver contentResolver) {
            this.contentResolver = contentResolver;
        }

        @Override // com.bumptech.glide.load.data.mediastore.ThumbnailQuery
        public final Cursor query(Uri uri) {
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
        public final Cursor query(Uri uri) {
            return this.contentResolver.query(MediaStore.Video.Thumbnails.EXTERNAL_CONTENT_URI, PATH_PROJECTION, "kind = 1 AND video_id = ?", new String[]{uri.getLastPathSegment()}, null);
        }
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public final void cleanup() {
        InputStream inputStream = this.inputStream;
        if (inputStream != null) {
            try {
                inputStream.close();
            } catch (IOException unused) {
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0028, code lost:
        if (r6 != null) goto L20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x004b, code lost:
        if (r6 != null) goto L20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x004d, code lost:
        r6.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0050, code lost:
        r7 = null;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Not initialized variable reg: 6, insn: 0x0023: MOVE  (r5 I:??[OBJECT, ARRAY]) = (r6 I:??[OBJECT, ARRAY]), block:B:10:0x0023 */
    /* JADX WARN: Removed duplicated region for block: B:35:0x007f  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00c6  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00f5  */
    /* JADX WARN: Removed duplicated region for block: B:76:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r3v2, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r6v9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.io.InputStream openThumbInputStream() throws java.io.FileNotFoundException {
        /*
            Method dump skipped, instructions count: 249
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.load.data.mediastore.ThumbFetcher.openThumbInputStream():java.io.InputStream");
    }

    public ThumbFetcher(Uri uri, ThumbnailStreamOpener thumbnailStreamOpener) {
        this.mediaStoreImageUri = uri;
        this.opener = thumbnailStreamOpener;
    }

    public static ThumbFetcher build(Context context, Uri uri, ThumbnailQuery thumbnailQuery) {
        return new ThumbFetcher(uri, new ThumbnailStreamOpener(Glide.get(context).registry.getImageHeaderParsers(), thumbnailQuery, Glide.get(context).arrayPool, context.getContentResolver()));
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public final void loadData(Priority priority, DataFetcher.DataCallback<? super InputStream> dataCallback) {
        try {
            InputStream openThumbInputStream = openThumbInputStream();
            this.inputStream = openThumbInputStream;
            dataCallback.onDataReady(openThumbInputStream);
        } catch (FileNotFoundException e) {
            if (Log.isLoggable("MediaStoreThumbFetcher", 3)) {
                Log.d("MediaStoreThumbFetcher", "Failed to find thumbnail file", e);
            }
            dataCallback.onLoadFailed(e);
        }
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public final Class<InputStream> getDataClass() {
        return InputStream.class;
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public final DataSource getDataSource() {
        return DataSource.LOCAL;
    }
}
