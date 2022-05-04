package com.bumptech.glide.load.data.mediastore;

import android.content.ContentResolver;
import com.bumptech.glide.load.ImageHeaderParser;
import com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool;
import java.util.List;
/* loaded from: classes.dex */
public class ThumbnailStreamOpener {
    public static final FileService DEFAULT_SERVICE = new FileService();
    public final ArrayPool byteArrayPool;
    public final ContentResolver contentResolver;
    public final List<ImageHeaderParser> parsers;
    public final ThumbnailQuery query;

    public ThumbnailStreamOpener(List<ImageHeaderParser> parsers, ThumbnailQuery query, ArrayPool byteArrayPool, ContentResolver contentResolver) {
        this.query = query;
        this.byteArrayPool = byteArrayPool;
        this.contentResolver = contentResolver;
        this.parsers = parsers;
    }
}
