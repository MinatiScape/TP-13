package com.android.wallpaper.asset;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.media.ExifInterface;
import android.net.Uri;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import android.widget.ImageView;
import androidx.fragment.app.FragmentActivity;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.asset.ContentUriAsset;
import com.android.wallpaper.picker.WallpaperPreviewBitmapTransformation;
import com.bumptech.glide.Glide;
import com.bumptech.glide.load.MultiTransformation;
import com.bumptech.glide.load.engine.DiskCacheStrategy;
import com.bumptech.glide.load.resource.bitmap.FitCenter;
import com.bumptech.glide.load.resource.drawable.DrawableTransitionOptions;
import com.bumptech.glide.request.BaseRequestOptions;
import com.bumptech.glide.request.RequestOptions;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
/* loaded from: classes.dex */
public final class ContentUriAsset extends StreamableAsset {
    public static final ExecutorService sExecutorService = Executors.newSingleThreadExecutor();
    public final Context mContext;
    public ExifInterfaceCompat mExifCompat;
    public int mExifOrientation;
    public final RequestOptions mRequestOptions;
    public final Uri mUri;

    /* renamed from: com.android.wallpaper.asset.ContentUriAsset$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass1 implements Asset.DimensionsReceiver {
        public final /* synthetic */ Asset.BitmapReceiver val$receiver;
        public final /* synthetic */ Rect val$rect;

        /* renamed from: com.android.wallpaper.asset.ContentUriAsset$1$1  reason: invalid class name and collision with other inner class name */
        /* loaded from: classes.dex */
        public class C00031 implements Asset.BitmapReceiver {
            public C00031() {
            }

            @Override // com.android.wallpaper.asset.Asset.BitmapReceiver
            public final void onBitmapDecoded(final Bitmap bitmap) {
                if (bitmap == null) {
                    StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("There was an error decoding the asset's full bitmap with content URI: ");
                    m.append(ContentUriAsset.this.mUri);
                    Log.e("ContentUriAsset", m.toString());
                    AnonymousClass1 r4 = AnonymousClass1.this;
                    ContentUriAsset contentUriAsset = ContentUriAsset.this;
                    Asset.BitmapReceiver bitmapReceiver = r4.val$receiver;
                    contentUriAsset.getClass();
                    Asset.decodeBitmapCompleted(bitmapReceiver, null);
                    return;
                }
                ExecutorService executorService = ContentUriAsset.sExecutorService;
                AnonymousClass1 r1 = AnonymousClass1.this;
                final Asset.BitmapReceiver bitmapReceiver2 = r1.val$receiver;
                final Rect rect = r1.val$rect;
                executorService.execute(new Runnable() { // from class: com.android.wallpaper.asset.ContentUriAsset$1$1$$ExternalSyntheticLambda0
                    @Override // java.lang.Runnable
                    public final void run() {
                        ContentUriAsset.AnonymousClass1.C00031 r0 = ContentUriAsset.AnonymousClass1.C00031.this;
                        Asset.BitmapReceiver bitmapReceiver3 = bitmapReceiver2;
                        Bitmap bitmap2 = bitmap;
                        Rect rect2 = rect;
                        ContentUriAsset contentUriAsset2 = ContentUriAsset.this;
                        Bitmap createBitmap = Bitmap.createBitmap(bitmap2, rect2.left, rect2.top, rect2.width(), rect2.height());
                        contentUriAsset2.getClass();
                        Asset.decodeBitmapCompleted(bitmapReceiver3, createBitmap);
                    }
                });
            }
        }

        public AnonymousClass1(Asset.BitmapReceiver bitmapReceiver, Rect rect) {
            this.val$receiver = bitmapReceiver;
            this.val$rect = rect;
        }

        @Override // com.android.wallpaper.asset.Asset.DimensionsReceiver
        public final void onDimensionsDecoded(Point point) {
            if (point == null) {
                StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("There was an error decoding the asset's raw dimensions with content URI: ");
                m.append(ContentUriAsset.this.mUri);
                Log.e("ContentUriAsset", m.toString());
                this.val$receiver.onBitmapDecoded(null);
                return;
            }
            ContentUriAsset.this.decodeBitmap(point.x, point.y, new C00031());
        }
    }

    public ContentUriAsset() {
        throw null;
    }

    public ContentUriAsset(Context context, Uri uri, boolean z) {
        RequestOptions centerCropTransform = RequestOptions.centerCropTransform();
        this.mExifOrientation = -1;
        this.mContext = context.getApplicationContext();
        this.mUri = uri;
        if (z) {
            this.mRequestOptions = centerCropTransform.mo32apply(new RequestOptions().diskCacheStrategy(DiskCacheStrategy.NONE).skipMemoryCache(true));
            return;
        }
        this.mRequestOptions = centerCropTransform;
    }

    @Override // com.android.wallpaper.asset.StreamableAsset, com.android.wallpaper.asset.Asset
    public final void decodeBitmapRegion(Rect rect, int i, int i2, boolean z, Asset.BitmapReceiver bitmapReceiver) {
        boolean z2;
        String type = this.mContext.getContentResolver().getType(this.mUri);
        boolean z3 = true;
        if (type == null || !type.equals("image/jpeg")) {
            z2 = false;
        } else {
            z2 = true;
        }
        if (!z2) {
            String type2 = this.mContext.getContentResolver().getType(this.mUri);
            if (type2 == null || !type2.equals("image/png")) {
                z3 = false;
            }
            if (!z3) {
                decodeRawDimensions(null, new AnonymousClass1(bitmapReceiver, rect));
                return;
            }
        }
        super.decodeBitmapRegion(rect, i, i2, z, bitmapReceiver);
    }

    public final void ensureExifInterface() {
        if (this.mExifCompat == null) {
            try {
                InputStream openInputStream = openInputStream();
                if (openInputStream != null) {
                    this.mExifCompat = new ExifInterfaceCompat(openInputStream);
                }
                if (openInputStream != null) {
                    openInputStream.close();
                }
            } catch (IOException e) {
                StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Couldn't read stream for ");
                m.append(this.mUri);
                Log.w("ContentUriAsset", m.toString(), e);
            }
        }
    }

    @Override // com.android.wallpaper.asset.StreamableAsset
    public final int getExifOrientation() {
        int i = this.mExifOrientation;
        if (i != -1) {
            return i;
        }
        ensureExifInterface();
        ExifInterfaceCompat exifInterfaceCompat = this.mExifCompat;
        int i2 = 1;
        if (exifInterfaceCompat == null) {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Unable to read EXIF rotation for content URI asset with content URI: ");
            m.append(this.mUri);
            Log.w("ContentUriAsset", m.toString());
        } else {
            ExifInterface exifInterface = exifInterfaceCompat.mFrameworkExifInterface;
            exifInterface.getClass();
            i2 = exifInterface.getAttributeInt("Orientation", 1);
        }
        this.mExifOrientation = i2;
        return i2;
    }

    @Override // com.android.wallpaper.asset.Asset
    public final void loadLowResDrawable(FragmentActivity fragmentActivity, ImageView imageView, int i, WallpaperPreviewBitmapTransformation wallpaperPreviewBitmapTransformation) {
        Glide.getRetriever(fragmentActivity).get((Activity) fragmentActivity).asDrawable().loadGeneric(this.mUri).mo32apply((BaseRequestOptions<?>) RequestOptions.bitmapTransform(new MultiTransformation(new FitCenter(), wallpaperPreviewBitmapTransformation)).placeholder(new ColorDrawable(i))).into(imageView);
    }

    @Override // com.android.wallpaper.asset.StreamableAsset
    public final InputStream openInputStream() {
        try {
            return this.mContext.getContentResolver().openInputStream(this.mUri);
        } catch (FileNotFoundException e) {
            Log.w("ContentUriAsset", "Image file not found", e);
            return null;
        }
    }

    @Override // com.android.wallpaper.asset.Asset
    public final void loadDrawable(Activity activity, ImageView imageView, int i) {
        Glide.getRetriever(activity).get((Context) activity).asDrawable().loadGeneric(this.mUri).mo32apply((BaseRequestOptions<?>) this.mRequestOptions.placeholder(new ColorDrawable(i))).transition(DrawableTransitionOptions.withCrossFade()).into(imageView);
    }
}
