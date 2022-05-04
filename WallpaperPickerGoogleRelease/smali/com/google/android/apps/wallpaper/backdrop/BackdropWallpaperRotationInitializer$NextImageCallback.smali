.class public Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/network/ServerFetcher$NextImageInCollectionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "NextImageCallback"
.end annotation


# instance fields
.field public final mAppContext:Landroid/content/Context;

.field public final mListener:Lcom/android/wallpaper/model/WallpaperRotationInitializer$Listener;

.field public final mNetworkPreference:I

.field public final synthetic this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;


# direct methods
.method public constructor <init>(Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;Landroid/content/Context;ILcom/android/wallpaper/model/WallpaperRotationInitializer$Listener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->mAppContext:Landroid/content/Context;

    .line 3
    iput-object p4, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->mListener:Lcom/android/wallpaper/model/WallpaperRotationInitializer$Listener;

    .line 4
    iput p3, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->mNetworkPreference:I

    return-void
.end method


# virtual methods
.method public onError(Lcom/android/volley/VolleyError;)V
    .locals 2

    const-string p1, "Unable to get first wallpaper in rotation for wallpaper from collection  with ID "

    .line 1
    invoke-static {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;

    .line 2
    iget-object v0, v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mCollectionId:Ljava/lang/String;

    const-string v1, "."

    .line 3
    invoke-static {p1, v0, v1}, Landroid/support/v4/app/FragmentTabHost$SavedState$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->mAppContext:Landroid/content/Context;

    const-string v1, "BackdropWPRotationInit"

    .line 4
    invoke-static {v1, p1, v0}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 5
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->mListener:Lcom/android/wallpaper/model/WallpaperRotationInitializer$Listener;

    invoke-interface {p0}, Lcom/android/wallpaper/model/WallpaperRotationInitializer$Listener;->onError()V

    return-void
.end method

.method public onSuccess(Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;->getInstance()Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->mAppContext:Landroid/content/Context;

    .line 2
    invoke-virtual {p1}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;->getImageUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;->createRotatingWallpaperUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 3
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->mAppContext:Landroid/content/Context;

    invoke-interface {v1, v2}, Lcom/android/wallpaper/module/Injector;->getRequester(Landroid/content/Context;)Lcom/google/android/gms/common/internal/zzam;

    move-result-object v1

    .line 4
    new-instance v2, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;

    invoke-direct {v2, p0, v0, p2, p1}, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;-><init>(Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;Landroid/net/Uri;Ljava/lang/String;Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;)V

    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/common/internal/zzam;->loadImageBitmap(Landroid/net/Uri;Lcom/bumptech/glide/request/target/Target;)V

    return-void
.end method
