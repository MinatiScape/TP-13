package com.bumptech.glide.request;

import android.graphics.Bitmap;
import com.bumptech.glide.load.Transformation;
import com.bumptech.glide.load.resource.bitmap.CenterCrop;
import com.bumptech.glide.load.resource.bitmap.DownsampleStrategy;
/* loaded from: classes.dex */
public final class RequestOptions extends BaseRequestOptions<RequestOptions> {
    public static RequestOptions centerCropOptions;
    public static RequestOptions noTransformOptions;
    public static RequestOptions skipMemoryCacheTrueOptions;

    public static RequestOptions bitmapTransform(Transformation<Bitmap> transformation) {
        return new RequestOptions().transform(transformation, true);
    }

    public static RequestOptions centerCropTransform() {
        if (centerCropOptions == null) {
            RequestOptions requestOptions = new RequestOptions();
            DownsampleStrategy.FitCenter fitCenter = DownsampleStrategy.FIT_CENTER;
            RequestOptions requestOptions2 = (RequestOptions) requestOptions.transform(new CenterCrop());
            requestOptions2.autoClone();
            centerCropOptions = requestOptions2;
        }
        return centerCropOptions;
    }

    public static RequestOptions noTransformation() {
        if (noTransformOptions == null) {
            RequestOptions dontTransform = new RequestOptions().dontTransform();
            dontTransform.autoClone();
            noTransformOptions = dontTransform;
        }
        return noTransformOptions;
    }
}
