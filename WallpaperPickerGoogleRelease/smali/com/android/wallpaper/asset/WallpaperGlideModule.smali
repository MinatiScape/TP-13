.class public Lcom/android/wallpaper/asset/WallpaperGlideModule;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/module/GlideModule;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public applyOptions(Landroid/content/Context;Lcom/bumptech/glide/GlideBuilder;)V
    .locals 2

    .line 1
    new-instance p0, Lcom/bumptech/glide/load/engine/cache/InternalCacheDiskCacheFactory;

    const-wide/32 v0, 0x6400000

    invoke-direct {p0, p1, v0, v1}, Lcom/bumptech/glide/load/engine/cache/InternalCacheDiskCacheFactory;-><init>(Landroid/content/Context;J)V

    .line 2
    iput-object p0, p2, Lcom/bumptech/glide/GlideBuilder;->diskCacheFactory:Lcom/bumptech/glide/load/engine/cache/DiskCache$Factory;

    .line 3
    new-instance p0, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;

    invoke-direct {p0, p1}, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;-><init>(Landroid/content/Context;)V

    const/high16 p1, 0x40000000    # 2.0f

    .line 4
    iput p1, p0, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;->bitmapPoolScreens:F

    const p1, 0x3f99999a    # 1.2f

    .line 5
    iput p1, p0, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;->memoryCacheScreens:F

    .line 6
    new-instance p1, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;

    invoke-direct {p1, p0}, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;-><init>(Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;)V

    .line 7
    iput-object p1, p2, Lcom/bumptech/glide/GlideBuilder;->memorySizeCalculator:Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;

    .line 8
    new-instance p0, Lcom/bumptech/glide/request/RequestOptions;

    invoke-direct {p0}, Lcom/bumptech/glide/request/RequestOptions;-><init>()V

    sget-object p1, Lcom/bumptech/glide/load/DecodeFormat;->PREFER_ARGB_8888:Lcom/bumptech/glide/load/DecodeFormat;

    .line 9
    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->DECODE_FORMAT:Lcom/bumptech/glide/load/Option;

    invoke-virtual {p0, v0, p1}, Lcom/bumptech/glide/request/BaseRequestOptions;->set(Lcom/bumptech/glide/load/Option;Ljava/lang/Object;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object p0

    sget-object v0, Lcom/bumptech/glide/load/resource/gif/GifOptions;->DECODE_FORMAT:Lcom/bumptech/glide/load/Option;

    .line 10
    invoke-virtual {p0, v0, p1}, Lcom/bumptech/glide/request/BaseRequestOptions;->set(Lcom/bumptech/glide/load/Option;Ljava/lang/Object;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object p0

    .line 11
    check-cast p0, Lcom/bumptech/glide/request/RequestOptions;

    .line 12
    iput-object p0, p2, Lcom/bumptech/glide/GlideBuilder;->defaultRequestOptions:Lcom/bumptech/glide/request/RequestOptions;

    return-void
.end method

.method public registerComponents(Landroid/content/Context;Lcom/bumptech/glide/Glide;Lcom/bumptech/glide/Registry;)V
    .locals 1

    .line 1
    const-class p0, Lcom/android/wallpaper/asset/WallpaperModel;

    const-class p1, Landroid/graphics/drawable/Drawable;

    new-instance p2, Lcom/android/wallpaper/asset/WallpaperModelLoader$WallpaperModelLoaderFactory;

    invoke-direct {p2}, Lcom/android/wallpaper/asset/WallpaperModelLoader$WallpaperModelLoaderFactory;-><init>()V

    invoke-virtual {p3, p0, p1, p2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    .line 2
    const-class p0, Lcom/android/wallpaper/asset/ResourceAsset;

    const-class p1, Ljava/io/InputStream;

    new-instance p2, Lcom/android/wallpaper/asset/ResourceAssetLoader$ResourceAssetLoaderFactory;

    invoke-direct {p2}, Lcom/android/wallpaper/asset/ResourceAssetLoader$ResourceAssetLoaderFactory;-><init>()V

    invoke-virtual {p3, p0, p1, p2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    .line 3
    const-class p0, Lcom/android/wallpaper/asset/SystemStaticAsset;

    const-class p1, Ljava/io/InputStream;

    new-instance p2, Lcom/android/wallpaper/asset/SystemStaticAssetLoader$SystemStaticAssetLoaderFactory;

    invoke-direct {p2}, Lcom/android/wallpaper/asset/SystemStaticAssetLoader$SystemStaticAssetLoaderFactory;-><init>()V

    invoke-virtual {p3, p0, p1, p2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    .line 4
    const-class p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;

    const-class p1, Landroid/graphics/drawable/Drawable;

    new-instance p2, Lcom/android/wallpaper/asset/LiveWallpaperThumbAssetLoader$LiveWallpaperThumbAssetLoaderFactory;

    invoke-direct {p2}, Lcom/android/wallpaper/asset/LiveWallpaperThumbAssetLoader$LiveWallpaperThumbAssetLoaderFactory;-><init>()V

    invoke-virtual {p3, p0, p1, p2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    .line 5
    const-class p0, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;

    const-class p1, Ljava/io/InputStream;

    new-instance p2, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVNLoader$CurrentWallpaperAssetVNLoaderFactory;

    invoke-direct {p2}, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVNLoader$CurrentWallpaperAssetVNLoaderFactory;-><init>()V

    invoke-virtual {p3, p0, p1, p2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    .line 6
    const-class p0, Landroid/graphics/drawable/Drawable;

    const-class p1, Landroid/graphics/drawable/Drawable;

    new-instance p2, Lcom/android/wallpaper/asset/DrawableResourceDecoder;

    invoke-direct {p2}, Lcom/android/wallpaper/asset/DrawableResourceDecoder;-><init>()V

    const-string v0, "legacy_append"

    .line 7
    invoke-virtual {p3, v0, p0, p1, p2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceDecoder;)Lcom/bumptech/glide/Registry;

    return-void
.end method
