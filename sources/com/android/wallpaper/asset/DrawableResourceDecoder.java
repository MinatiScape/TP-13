package com.android.wallpaper.asset;

import android.graphics.drawable.Drawable;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.resource.drawable.DrawableResource;
import java.io.IOException;
/* loaded from: classes.dex */
public final class DrawableResourceDecoder implements ResourceDecoder<Drawable, Drawable> {
    @Override // com.bumptech.glide.load.ResourceDecoder
    public final Resource<Drawable> decode(Drawable drawable, int i, int i2, Options options) throws IOException {
        return new DrawableResource<Drawable>(drawable) { // from class: com.android.wallpaper.asset.DrawableResourceDecoder.1
            @Override // com.bumptech.glide.load.engine.Resource
            public final void recycle() {
            }

            @Override // com.bumptech.glide.load.engine.Resource
            public final int getSize() {
                return get().getIntrinsicHeight() * get().getIntrinsicWidth() * 4;
            }

            @Override // com.bumptech.glide.load.engine.Resource
            public final Class<Drawable> getResourceClass() {
                return Drawable.class;
            }
        };
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public final /* bridge */ /* synthetic */ boolean handles(Drawable drawable, Options options) throws IOException {
        return true;
    }
}
