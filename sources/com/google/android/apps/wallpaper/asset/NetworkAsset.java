package com.google.android.apps.wallpaper.asset;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import android.widget.ImageView;
import androidx.cardview.R$style;
import androidx.fragment.app.FragmentActivity;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.asset.Asset$$ExternalSyntheticLambda1;
import com.android.wallpaper.asset.StreamableAsset;
import com.android.wallpaper.network.WallpaperRequester;
import com.android.wallpaper.picker.WallpaperPreviewBitmapTransformation;
import com.android.wallpaper.util.WallpaperConnection$$ExternalSyntheticLambda0;
import com.bumptech.glide.Glide;
import com.bumptech.glide.RequestBuilder;
import com.bumptech.glide.RequestManager;
import com.bumptech.glide.load.model.stream.HttpGlideUrlLoader;
import com.bumptech.glide.load.resource.bitmap.BitmapTransitionOptions;
import com.bumptech.glide.load.resource.drawable.DrawableTransitionOptions;
import com.bumptech.glide.request.BaseRequestOptions;
import com.bumptech.glide.request.RequestOptions;
import com.bumptech.glide.request.target.SimpleTarget;
import com.bumptech.glide.request.target.Target;
import com.bumptech.glide.request.transition.BitmapTransitionFactory;
import com.bumptech.glide.request.transition.DrawableCrossFadeFactory;
import com.bumptech.glide.request.transition.Transition;
import com.google.android.apps.wallpaper.asset.NetworkAsset;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
/* loaded from: classes.dex */
public final class NetworkAsset extends StreamableAsset {
    public static final ExecutorService sExecutorService = Executors.newCachedThreadPool();
    public WallpaperRequester mRequester;
    public Uri mTinyUri;
    public Uri mUri;

    /* renamed from: com.google.android.apps.wallpaper.asset.NetworkAsset$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass1 extends SimpleTarget<File> {
        public final /* synthetic */ Asset.DimensionsReceiver val$receiver;

        public AnonymousClass1(Asset.DimensionsReceiver dimensionsReceiver) {
            this.val$receiver = dimensionsReceiver;
        }

        @Override // com.bumptech.glide.request.target.Target
        public final void onLoadFailed(Drawable drawable) {
            this.val$receiver.onDimensionsDecoded(null);
        }

        @Override // com.bumptech.glide.request.target.Target
        public final void onResourceReady(Object obj, Transition transition) {
            final File file = (File) obj;
            ExecutorService executorService = NetworkAsset.sExecutorService;
            final Asset.DimensionsReceiver dimensionsReceiver = this.val$receiver;
            executorService.execute(new Runnable() { // from class: com.google.android.apps.wallpaper.asset.NetworkAsset$1$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    FileInputStream fileInputStream;
                    NetworkAsset.AnonymousClass1 r0 = NetworkAsset.AnonymousClass1.this;
                    File file2 = file;
                    Asset.DimensionsReceiver dimensionsReceiver2 = dimensionsReceiver;
                    r0.getClass();
                    try {
                        fileInputStream = new FileInputStream(file2.getAbsolutePath());
                    } catch (FileNotFoundException e) {
                        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("File not found for network asset with URL: ");
                        m.append(NetworkAsset.this.mUri);
                        Log.e("NetworkAsset", m.toString(), e);
                        fileInputStream = null;
                    }
                    if (fileInputStream == null) {
                        new Handler(Looper.getMainLooper()).post(new WallpaperConnection$$ExternalSyntheticLambda0(dimensionsReceiver2, 1));
                        return;
                    }
                    BitmapFactory.Options options = new BitmapFactory.Options();
                    options.inJustDecodeBounds = true;
                    BitmapFactory.decodeStream(fileInputStream, null, options);
                    try {
                        fileInputStream.close();
                    } catch (IOException e2) {
                        StringBuilder m2 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Unable to close input stream for NetworkAsset with URL: ");
                        m2.append(NetworkAsset.this.mUri);
                        Log.e("NetworkAsset", m2.toString(), e2);
                    }
                    new Handler(Looper.getMainLooper()).post(new Asset$$ExternalSyntheticLambda1(dimensionsReceiver2, options, 3));
                }
            });
        }
    }

    @Override // com.android.wallpaper.asset.StreamableAsset, com.android.wallpaper.asset.Asset
    public final void decodeRawDimensions(Activity activity, Asset.DimensionsReceiver dimensionsReceiver) {
        if (activity == null) {
            super.decodeRawDimensions(null, dimensionsReceiver);
            return;
        }
        WallpaperRequester wallpaperRequester = this.mRequester;
        Uri uri = this.mUri;
        Target target = new AnonymousClass1(dimensionsReceiver);
        wallpaperRequester.getClass();
        RequestManager requestManager = Glide.getRetriever(activity).get(activity);
        requestManager.getClass();
        RequestBuilder requestBuilder = new RequestBuilder(requestManager.glide, requestManager, File.class, requestManager.context);
        if (RequestOptions.skipMemoryCacheTrueOptions == null) {
            RequestOptions skipMemoryCache = new RequestOptions().skipMemoryCache(true);
            skipMemoryCache.autoClone();
            RequestOptions.skipMemoryCacheTrueOptions = skipMemoryCache;
        }
        RequestBuilder apply = requestBuilder.mo32apply((BaseRequestOptions<?>) RequestOptions.skipMemoryCacheTrueOptions).loadGeneric(uri).mo32apply((BaseRequestOptions<?>) new RequestOptions().set(HttpGlideUrlLoader.TIMEOUT, 10000));
        apply.into(target, null, apply, com.bumptech.glide.util.Executors.MAIN_THREAD_EXECUTOR);
    }

    @Override // com.android.wallpaper.asset.StreamableAsset
    public final InputStream openInputStream() {
        File file;
        WallpaperRequester wallpaperRequester = this.mRequester;
        Uri uri = this.mUri;
        wallpaperRequester.getClass();
        try {
            RequestManager with = Glide.with(wallpaperRequester.mAppContext);
            with.getClass();
            file = (File) new RequestBuilder(with.glide, with, File.class, with.context).mo32apply((BaseRequestOptions<?>) RequestManager.DOWNLOAD_ONLY_OPTIONS).loadGeneric(uri).mo32apply((BaseRequestOptions<?>) new RequestOptions().set(HttpGlideUrlLoader.TIMEOUT, 10000)).submit().get();
        } catch (Exception unused) {
            Log.e("WallpaperRequester", "Unable to get File for image with url: " + uri);
            file = null;
        }
        if (file == null) {
            return null;
        }
        try {
            return new FileInputStream(file.getAbsolutePath());
        } catch (FileNotFoundException unused2) {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("File not found for the image at URL: ");
            m.append(this.mUri);
            Log.e("NetworkAsset", m.toString());
            return null;
        }
    }

    public NetworkAsset(Context context, Uri uri, Uri uri2) {
        this.mUri = uri;
        this.mTinyUri = uri2;
        this.mRequester = R$style.getInjector().getRequester(context.getApplicationContext());
    }

    @Override // com.android.wallpaper.asset.Asset
    public final Bitmap getLowResBitmap(Context context) {
        try {
            return (Bitmap) Glide.getRetriever(context).get(context).asBitmap().loadGeneric(this.mTinyUri).mo32apply((BaseRequestOptions<?>) RequestOptions.noTransformation().set(HttpGlideUrlLoader.TIMEOUT, 10000)).submit().get();
        } catch (InterruptedException | ExecutionException e) {
            Log.w("NetworkAsset", "Couldn't obtain low res bitmap", e);
            return null;
        }
    }

    @Override // com.android.wallpaper.asset.Asset
    public final void loadDrawable(Activity activity, ImageView imageView, int i) {
        RequestBuilder<Drawable> asDrawable = Glide.getRetriever(activity).get((Context) activity).asDrawable();
        if (this.mTinyUri != null) {
            asDrawable.thumbnail(Glide.getRetriever(activity).get((Context) activity).asDrawable().loadGeneric(this.mTinyUri).transition(DrawableTransitionOptions.withCrossFade()));
        }
        imageView.setBackgroundColor(i);
        asDrawable.loadGeneric(this.mUri).mo32apply((BaseRequestOptions<?>) ((RequestOptions) RequestOptions.noTransformation().placeholder(new ColorDrawable(i))).set(HttpGlideUrlLoader.TIMEOUT, 10000)).transition(DrawableTransitionOptions.withCrossFade()).into(imageView);
    }

    @Override // com.android.wallpaper.asset.Asset
    public final void loadLowResDrawable(FragmentActivity fragmentActivity, ImageView imageView, int i, WallpaperPreviewBitmapTransformation wallpaperPreviewBitmapTransformation) {
        RequestBuilder<Bitmap> apply = Glide.getRetriever(fragmentActivity).get((Activity) fragmentActivity).asBitmap().loadGeneric(this.mTinyUri).mo32apply((BaseRequestOptions<?>) ((RequestOptions) RequestOptions.bitmapTransform(wallpaperPreviewBitmapTransformation).placeholder(new ColorDrawable(i))).set(HttpGlideUrlLoader.TIMEOUT, 10000));
        BitmapTransitionOptions bitmapTransitionOptions = new BitmapTransitionOptions();
        bitmapTransitionOptions.transitionFactory = new BitmapTransitionFactory(new DrawableCrossFadeFactory(300));
        apply.transition(bitmapTransitionOptions).into(imageView);
    }
}
