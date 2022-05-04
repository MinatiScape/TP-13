package com.bumptech.glide.load.resource.drawable;

import android.graphics.drawable.Drawable;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.engine.Resource;
import java.io.IOException;
/* loaded from: classes.dex */
public final class UnitDrawableDecoder implements ResourceDecoder<Drawable, Drawable> {
    @Override // com.bumptech.glide.load.ResourceDecoder
    public final Resource<Drawable> decode(Drawable drawable, int i, int i2, Options options) throws IOException {
        Drawable drawable2 = drawable;
        if (drawable2 != null) {
            return new NonOwnedDrawableResource(drawable2);
        }
        return null;
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public final /* bridge */ /* synthetic */ boolean handles(Drawable drawable, Options options) throws IOException {
        return true;
    }
}
