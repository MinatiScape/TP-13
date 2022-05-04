package com.google.android.apps.wallpaper.module;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.graphics.Rect;
import android.util.Log;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.util.SizeCalculator;
import com.android.wallpaper.util.WallpaperCropUtils;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref$ObjectRef;
import kotlinx.coroutines.CoroutineScope;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
@DebugMetadata(c = "com.google.android.apps.wallpaper.module.RecentWallpaperUtils$saveThumbnail$2", f = "RecentWallpaperUtils.kt", l = {}, m = "invokeSuspend")
/* loaded from: classes.dex */
public final class RecentWallpaperUtils$saveThumbnail$2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    public final /* synthetic */ Context $context;
    public final /* synthetic */ Bitmap $fullSizeBitmap;
    public final /* synthetic */ WallpaperInfo $info;
    public final /* synthetic */ String $wallpaperId;
    public int label;
    private /* synthetic */ CoroutineScope p$;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public RecentWallpaperUtils$saveThumbnail$2(Context context, Bitmap bitmap, String str, WallpaperInfo wallpaperInfo, Continuation<? super RecentWallpaperUtils$saveThumbnail$2> continuation) {
        super(2, continuation);
        this.$context = context;
        this.$fullSizeBitmap = bitmap;
        this.$wallpaperId = str;
        this.$info = wallpaperInfo;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        RecentWallpaperUtils$saveThumbnail$2 recentWallpaperUtils$saveThumbnail$2 = new RecentWallpaperUtils$saveThumbnail$2(this.$context, this.$fullSizeBitmap, this.$wallpaperId, this.$info, continuation);
        recentWallpaperUtils$saveThumbnail$2.p$ = (CoroutineScope) obj;
        return recentWallpaperUtils$saveThumbnail$2;
    }

    @Override // kotlin.jvm.functions.Function2
    public Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((RecentWallpaperUtils$saveThumbnail$2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Type inference failed for: r9v8, types: [android.graphics.Rect, T] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        if (this.label == 0) {
            ResultKt.throwOnFailure(obj);
            final Point suggestedThumbnailSize = SizeCalculator.getSuggestedThumbnailSize(this.$context);
            final Ref$ObjectRef ref$ObjectRef = new Ref$ObjectRef();
            if (this.$fullSizeBitmap != null) {
                ?? rect = new Rect(0, 0, this.$fullSizeBitmap.getWidth(), this.$fullSizeBitmap.getHeight());
                ref$ObjectRef.element = rect;
                WallpaperCropUtils.fitToSize((Rect) rect, suggestedThumbnailSize.x, suggestedThumbnailSize.y);
                Context context = this.$context;
                String wallpaperThumbnailFileName = RecentWallpaperUtils.getWallpaperThumbnailFileName(this.$wallpaperId);
                Bitmap createScaledBitmap = Bitmap.createScaledBitmap(this.$fullSizeBitmap, ((Rect) ref$ObjectRef.element).width(), ((Rect) ref$ObjectRef.element).height(), true);
                Intrinsics.checkNotNullExpressionValue(createScaledBitmap, "createScaledBitmap(fullSizeBitmap, thumbRect.width(), thumbRect.height(),\n                        true)");
                RecentWallpaperUtils.access$storeBitmap(context, wallpaperThumbnailFileName, createScaledBitmap);
            } else {
                WallpaperInfo wallpaperInfo = this.$info;
                if (wallpaperInfo == null) {
                    Log.e("RecentWallpaperUtils", Intrinsics.stringPlus("fullSizeBitmap & info both null for ", this.$wallpaperId));
                    return Unit.INSTANCE;
                }
                final Asset thumbAsset = wallpaperInfo.getThumbAsset(this.$context);
                final String str = this.$wallpaperId;
                final Context context2 = this.$context;
                thumbAsset.decodeRawDimensions(null, new Asset.DimensionsReceiver() { // from class: com.google.android.apps.wallpaper.module.RecentWallpaperUtils$saveThumbnail$2.1
                    /* JADX WARN: Type inference failed for: r1v0, types: [android.graphics.Rect, T] */
                    @Override // com.android.wallpaper.asset.Asset.DimensionsReceiver
                    public final void onDimensionsDecoded(@Nullable Point point) {
                        Ref$ObjectRef<Rect> ref$ObjectRef2 = ref$ObjectRef;
                        Integer num = null;
                        Integer valueOf = point == null ? null : Integer.valueOf(point.x);
                        int intValue = valueOf == null ? suggestedThumbnailSize.x : valueOf.intValue();
                        if (point != null) {
                            num = Integer.valueOf(point.y);
                        }
                        ref$ObjectRef2.element = new Rect(0, 0, intValue, num == null ? suggestedThumbnailSize.y : num.intValue());
                        Point point2 = suggestedThumbnailSize;
                        WallpaperCropUtils.fitToSize(ref$ObjectRef.element, point2.x, point2.y);
                        Asset asset = thumbAsset;
                        int width = ref$ObjectRef.element.width();
                        int height = ref$ObjectRef.element.height();
                        final String str2 = str;
                        final Context context3 = context2;
                        asset.decodeBitmap(width, height, new Asset.BitmapReceiver() { // from class: com.google.android.apps.wallpaper.module.RecentWallpaperUtils.saveThumbnail.2.1.1
                            @Override // com.android.wallpaper.asset.Asset.BitmapReceiver
                            public final void onBitmapDecoded(@Nullable Bitmap bitmap) {
                                if (bitmap == null) {
                                    Log.e("RecentWallpaperUtils", Intrinsics.stringPlus("Couldn't decode thumbnail bitmap for ", str2));
                                } else {
                                    RecentWallpaperUtils.access$storeBitmap(context3, RecentWallpaperUtils.getWallpaperThumbnailFileName(str2), bitmap);
                                }
                            }
                        });
                    }
                });
            }
            return Unit.INSTANCE;
        }
        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
    }
}
