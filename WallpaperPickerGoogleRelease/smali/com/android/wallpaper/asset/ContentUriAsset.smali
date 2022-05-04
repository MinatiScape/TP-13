.class public final Lcom/android/wallpaper/asset/ContentUriAsset;
.super Lcom/android/wallpaper/asset/StreamableAsset;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/asset/ContentUriAsset$BitmapCropTask;
    }
.end annotation


# instance fields
.field public final mContext:Landroid/content/Context;

.field public mExifCompat:Lcom/android/wallpaper/asset/ExifInterfaceCompat;

.field public mExifOrientation:I

.field public final mRequestOptions:Lcom/bumptech/glide/request/RequestOptions;

.field public final mUri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/net/Uri;Z)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/bumptech/glide/request/RequestOptions;->centerCropTransform()Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    .line 2
    invoke-direct {p0}, Lcom/android/wallpaper/asset/StreamableAsset;-><init>()V

    const/4 v1, -0x1

    .line 3
    iput v1, p0, Lcom/android/wallpaper/asset/ContentUriAsset;->mExifOrientation:I

    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/asset/ContentUriAsset;->mContext:Landroid/content/Context;

    .line 5
    iput-object p2, p0, Lcom/android/wallpaper/asset/ContentUriAsset;->mUri:Landroid/net/Uri;

    if-eqz p3, :cond_0

    .line 6
    sget-object p1, Lcom/bumptech/glide/load/engine/DiskCacheStrategy;->NONE:Lcom/bumptech/glide/load/engine/DiskCacheStrategy;

    .line 7
    invoke-static {p1}, Lcom/bumptech/glide/request/RequestOptions;->diskCacheStrategyOf(Lcom/bumptech/glide/load/engine/DiskCacheStrategy;)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object p1

    const/4 p2, 0x1

    .line 8
    invoke-virtual {p1, p2}, Lcom/bumptech/glide/request/BaseRequestOptions;->skipMemoryCache(Z)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object p1

    .line 9
    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/BaseRequestOptions;->apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object p1

    check-cast p1, Lcom/bumptech/glide/request/RequestOptions;

    iput-object p1, p0, Lcom/android/wallpaper/asset/ContentUriAsset;->mRequestOptions:Lcom/bumptech/glide/request/RequestOptions;

    goto :goto_0

    .line 10
    :cond_0
    iput-object v0, p0, Lcom/android/wallpaper/asset/ContentUriAsset;->mRequestOptions:Lcom/bumptech/glide/request/RequestOptions;

    :goto_0
    return-void
.end method


# virtual methods
.method public decodeBitmapRegion(Landroid/graphics/Rect;IIZLcom/android/wallpaper/asset/Asset$BitmapReceiver;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/asset/ContentUriAsset;->isJpeg()Z

    move-result v0

    if-nez v0, :cond_2

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/asset/ContentUriAsset;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/android/wallpaper/asset/ContentUriAsset;->mUri:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "image/png"

    .line 3
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    const/4 p2, 0x0

    .line 4
    new-instance p3, Lcom/android/wallpaper/asset/ContentUriAsset$1;

    invoke-direct {p3, p0, p5, p1}, Lcom/android/wallpaper/asset/ContentUriAsset$1;-><init>(Lcom/android/wallpaper/asset/ContentUriAsset;Lcom/android/wallpaper/asset/Asset$BitmapReceiver;Landroid/graphics/Rect;)V

    invoke-virtual {p0, p2, p3}, Lcom/android/wallpaper/asset/StreamableAsset;->decodeRawDimensions(Landroid/app/Activity;Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;)V

    return-void

    .line 5
    :cond_2
    :goto_1
    invoke-super/range {p0 .. p5}, Lcom/android/wallpaper/asset/StreamableAsset;->decodeBitmapRegion(Landroid/graphics/Rect;IIZLcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    return-void
.end method

.method public final ensureExifInterface()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/asset/ContentUriAsset;->mExifCompat:Lcom/android/wallpaper/asset/ExifInterfaceCompat;

    if-nez v0, :cond_1

    .line 2
    :try_start_0
    invoke-virtual {p0}, Lcom/android/wallpaper/asset/ContentUriAsset;->openInputStream()Ljava/io/InputStream;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v0, :cond_0

    .line 3
    :try_start_1
    new-instance v1, Lcom/android/wallpaper/asset/ExifInterfaceCompat;

    invoke-direct {v1, v0}, Lcom/android/wallpaper/asset/ExifInterfaceCompat;-><init>(Ljava/io/InputStream;)V

    iput-object v1, p0, Lcom/android/wallpaper/asset/ContentUriAsset;->mExifCompat:Lcom/android/wallpaper/asset/ExifInterfaceCompat;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v1

    .line 4
    :try_start_2
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v0

    :try_start_3
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw v1

    :cond_0
    :goto_1
    if-eqz v0, :cond_1

    .line 5
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    const-string v1, "Couldn\'t read stream for "

    .line 6
    invoke-static {v1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object p0, p0, Lcom/android/wallpaper/asset/ContentUriAsset;->mUri:Landroid/net/Uri;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "ContentUriAsset"

    invoke-static {v1, p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    :goto_2
    return-void
.end method

.method public getExifOrientation()I
    .locals 4

    .line 1
    iget v0, p0, Lcom/android/wallpaper/asset/ContentUriAsset;->mExifOrientation:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    return v0

    .line 2
    :cond_0
    invoke-virtual {p0}, Lcom/android/wallpaper/asset/ContentUriAsset;->ensureExifInterface()V

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/asset/ContentUriAsset;->mExifCompat:Lcom/android/wallpaper/asset/ExifInterfaceCompat;

    const/4 v1, 0x1

    if-nez v0, :cond_1

    const-string v0, "Unable to read EXIF rotation for content URI asset with content URI: "

    .line 4
    invoke-static {v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/android/wallpaper/asset/ContentUriAsset;->mUri:Landroid/net/Uri;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "ContentUriAsset"

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    const-string v2, "Orientation"

    .line 5
    iget-object v3, v0, Lcom/android/wallpaper/asset/ExifInterfaceCompat;->mFrameworkExifInterface:Landroid/media/ExifInterface;

    if-eqz v3, :cond_2

    .line 6
    invoke-virtual {v3, v2, v1}, Landroid/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    move-result v1

    goto :goto_0

    .line 7
    :cond_2
    iget-object v0, v0, Lcom/android/wallpaper/asset/ExifInterfaceCompat;->mSupportExifInterface:Landroidx/exifinterface/media/ExifInterface;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    invoke-virtual {v0, v2}, Landroidx/exifinterface/media/ExifInterface;->getExifAttribute(Ljava/lang/String;)Landroidx/exifinterface/media/ExifInterface$ExifAttribute;

    move-result-object v2

    if-nez v2, :cond_3

    goto :goto_0

    .line 9
    :cond_3
    :try_start_0
    iget-object v0, v0, Landroidx/exifinterface/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    invoke-virtual {v2, v0}, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->getIntValue(Ljava/nio/ByteOrder;)I

    move-result v1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    :catch_0
    :goto_0
    iput v1, p0, Lcom/android/wallpaper/asset/ContentUriAsset;->mExifOrientation:I

    return v1
.end method

.method public isJpeg()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/asset/ContentUriAsset;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object p0, p0, Lcom/android/wallpaper/asset/ContentUriAsset;->mUri:Landroid/net/Uri;

    invoke-virtual {v0, p0}, Landroid/content/ContentResolver;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_0

    const-string v0, "image/jpeg"

    .line 2
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public loadDrawable(Landroid/content/Context;Landroid/widget/ImageView;I)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object p1

    .line 2
    invoke-virtual {p1}, Lcom/bumptech/glide/RequestManager;->asDrawable()Lcom/bumptech/glide/RequestBuilder;

    move-result-object p1

    iget-object v0, p0, Lcom/android/wallpaper/asset/ContentUriAsset;->mUri:Landroid/net/Uri;

    .line 3
    invoke-virtual {p1, v0}, Lcom/bumptech/glide/RequestBuilder;->load(Landroid/net/Uri;)Lcom/bumptech/glide/RequestBuilder;

    iget-object p0, p0, Lcom/android/wallpaper/asset/ContentUriAsset;->mRequestOptions:Lcom/bumptech/glide/request/RequestOptions;

    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, p3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 4
    invoke-virtual {p0, v0}, Lcom/bumptech/glide/request/BaseRequestOptions;->placeholder(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    .line 6
    invoke-static {}, Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;->withCrossFade()Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/RequestBuilder;->transition(Lcom/bumptech/glide/TransitionOptions;)Lcom/bumptech/glide/RequestBuilder;

    .line 7
    invoke-virtual {p0, p2}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    return-void
.end method

.method public loadDrawableWithTransition(Landroid/content/Context;Landroid/widget/ImageView;ILcom/android/wallpaper/asset/Asset$DrawableLoadedListener;I)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object p1

    .line 2
    invoke-virtual {p1}, Lcom/bumptech/glide/RequestManager;->asDrawable()Lcom/bumptech/glide/RequestBuilder;

    move-result-object p1

    iget-object v0, p0, Lcom/android/wallpaper/asset/ContentUriAsset;->mUri:Landroid/net/Uri;

    .line 3
    invoke-virtual {p1, v0}, Lcom/bumptech/glide/RequestBuilder;->load(Landroid/net/Uri;)Lcom/bumptech/glide/RequestBuilder;

    iget-object v0, p0, Lcom/android/wallpaper/asset/ContentUriAsset;->mRequestOptions:Lcom/bumptech/glide/request/RequestOptions;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, p5}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 4
    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/BaseRequestOptions;->placeholder(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object p5

    .line 5
    invoke-virtual {p1, p5}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p1

    .line 6
    new-instance p5, Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;

    invoke-direct {p5}, Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;-><init>()V

    .line 7
    new-instance v0, Lcom/bumptech/glide/request/transition/DrawableCrossFadeFactory;

    const/4 v1, 0x0

    invoke-direct {v0, p3, v1}, Lcom/bumptech/glide/request/transition/DrawableCrossFadeFactory;-><init>(IZ)V

    .line 8
    iput-object v0, p5, Lcom/bumptech/glide/TransitionOptions;->transitionFactory:Lcom/bumptech/glide/request/transition/TransitionFactory;

    .line 9
    invoke-virtual {p1, p5}, Lcom/bumptech/glide/RequestBuilder;->transition(Lcom/bumptech/glide/TransitionOptions;)Lcom/bumptech/glide/RequestBuilder;

    new-instance p3, Lcom/android/wallpaper/asset/ContentUriAsset$2;

    invoke-direct {p3, p0, p4}, Lcom/android/wallpaper/asset/ContentUriAsset$2;-><init>(Lcom/android/wallpaper/asset/ContentUriAsset;Lcom/android/wallpaper/asset/Asset$DrawableLoadedListener;)V

    const/4 p0, 0x0

    .line 10
    iput-object p0, p1, Lcom/bumptech/glide/RequestBuilder;->requestListeners:Ljava/util/List;

    .line 11
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    iput-object p0, p1, Lcom/bumptech/glide/RequestBuilder;->requestListeners:Ljava/util/List;

    .line 12
    invoke-virtual {p0, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 13
    invoke-virtual {p1, p2}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    return-void
.end method

.method public loadLowResDrawable(Landroid/app/Activity;Landroid/widget/ImageView;ILcom/bumptech/glide/load/resource/bitmap/BitmapTransformation;)V
    .locals 4

    .line 1
    new-instance v0, Lcom/bumptech/glide/load/MultiTransformation;

    const/4 v1, 0x2

    new-array v1, v1, [Lcom/bumptech/glide/load/Transformation;

    new-instance v2, Lcom/bumptech/glide/load/resource/bitmap/FitCenter;

    invoke-direct {v2}, Lcom/bumptech/glide/load/resource/bitmap/FitCenter;-><init>()V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    aput-object p4, v1, v2

    invoke-direct {v0, v1}, Lcom/bumptech/glide/load/MultiTransformation;-><init>([Lcom/bumptech/glide/load/Transformation;)V

    .line 2
    invoke-static {p1}, Lcom/bumptech/glide/Glide;->with(Landroid/app/Activity;)Lcom/bumptech/glide/RequestManager;

    move-result-object p1

    .line 3
    invoke-virtual {p1}, Lcom/bumptech/glide/RequestManager;->asDrawable()Lcom/bumptech/glide/RequestBuilder;

    move-result-object p1

    iget-object p0, p0, Lcom/android/wallpaper/asset/ContentUriAsset;->mUri:Landroid/net/Uri;

    .line 4
    invoke-virtual {p1, p0}, Lcom/bumptech/glide/RequestBuilder;->load(Landroid/net/Uri;)Lcom/bumptech/glide/RequestBuilder;

    .line 5
    invoke-static {v0}, Lcom/bumptech/glide/request/RequestOptions;->bitmapTransform(Lcom/bumptech/glide/load/Transformation;)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object p0

    new-instance p4, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {p4, p3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 6
    invoke-virtual {p0, p4}, Lcom/bumptech/glide/request/BaseRequestOptions;->placeholder(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    .line 8
    invoke-virtual {p0, p2}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    return-void
.end method

.method public openInputStream()Ljava/io/InputStream;
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/wallpaper/asset/ContentUriAsset;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object p0, p0, Lcom/android/wallpaper/asset/ContentUriAsset;->mUri:Landroid/net/Uri;

    invoke-virtual {v0, p0}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    const-string v0, "ContentUriAsset"

    const-string v1, "Image file not found"

    .line 2
    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p0, 0x0

    return-object p0
.end method
