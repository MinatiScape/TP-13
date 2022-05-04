package com.android.wallpaper.asset;

import android.app.Activity;
import android.content.res.Resources;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.widget.ImageView;
import com.android.wallpaper.asset.ResourceAsset;
import com.bumptech.glide.Glide;
import com.bumptech.glide.RequestBuilder;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.MultiTransformation;
import com.bumptech.glide.load.resource.bitmap.BitmapTransformation;
import com.bumptech.glide.load.resource.bitmap.FitCenter;
import com.bumptech.glide.request.BaseRequestOptions;
import com.bumptech.glide.request.RequestOptions;
/* loaded from: classes.dex */
public final class SystemStaticAsset extends ResourceAsset {
    public final String mResName;

    /* loaded from: classes.dex */
    public static class PackageResourceKey extends ResourceAsset.PackageResourceKey {
        public String mResName;

        public PackageResourceKey(Resources resources, int i, String str) {
            super(resources, i);
            this.mResName = str;
        }

        @Override // com.android.wallpaper.asset.ResourceAsset.PackageResourceKey
        public String getCacheKey() {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("PackageResourceKey{packageName=");
            m.append(this.mPackageName);
            m.append(",resId=");
            m.append(this.mResId);
            m.append(",resName=");
            m.append(this.mResName);
            m.append('}');
            return m.toString();
        }
    }

    public SystemStaticAsset(Resources resources, int i, String str) {
        super(resources, i);
        this.mResName = str;
    }

    @Override // com.android.wallpaper.asset.ResourceAsset
    public Key getKey() {
        if (this.mKey == null) {
            this.mKey = new PackageResourceKey(this.mRes, this.mResId, this.mResName);
        }
        return this.mKey;
    }

    @Override // com.android.wallpaper.asset.Asset
    public void loadLowResDrawable(Activity activity, ImageView imageView, int i, BitmapTransformation bitmapTransformation) {
        MultiTransformation multiTransformation = new MultiTransformation(new FitCenter(), bitmapTransformation);
        RequestBuilder<Drawable> asDrawable = Glide.with(activity).asDrawable();
        asDrawable.model = this;
        asDrawable.isModelSet = true;
        asDrawable.apply((BaseRequestOptions<?>) RequestOptions.bitmapTransform(multiTransformation).placeholder(new ColorDrawable(i))).into(imageView);
    }
}
