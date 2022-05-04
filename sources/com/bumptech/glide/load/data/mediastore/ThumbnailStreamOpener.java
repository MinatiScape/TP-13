package com.bumptech.glide.load.data.mediastore;

import android.content.ContentResolver;
import androidx.cardview.R$styleable;
import com.bumptech.glide.load.ImageHeaderParser;
import com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool;
import java.util.List;
/* loaded from: classes.dex */
public final class ThumbnailStreamOpener {
    public static final R$styleable DEFAULT_SERVICE = new R$styleable();
    public final ArrayPool byteArrayPool;
    public final ContentResolver contentResolver;
    public final List<ImageHeaderParser> parsers;
    public final ThumbnailQuery query;

    public ThumbnailStreamOpener(List<ImageHeaderParser> list, ThumbnailQuery thumbnailQuery, ArrayPool arrayPool, ContentResolver contentResolver) {
        this.query = thumbnailQuery;
        this.byteArrayPool = arrayPool;
        this.contentResolver = contentResolver;
        this.parsers = list;
    }
}
