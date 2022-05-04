.class public Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/network/ServerFetcher$NextImageInCollectionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NextImageCallback"
.end annotation


# instance fields
.field public final mAppContext:Landroid/content/Context;

.field public final mCollectionId:Ljava/lang/String;

.field public final mCollectionName:Ljava/lang/String;

.field public final mListener:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;

.field public final mPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

.field public final mResumeToken:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;Lcom/android/wallpaper/module/WallpaperPreferences;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mAppContext:Landroid/content/Context;

    .line 3
    iput-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mCollectionId:Ljava/lang/String;

    .line 4
    iput-object p3, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mCollectionName:Ljava/lang/String;

    .line 5
    iput-object p4, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mResumeToken:Ljava/lang/String;

    .line 6
    iput-object p5, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mListener:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;

    .line 7
    iput-object p6, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    return-void
.end method


# virtual methods
.method public onError(Lcom/android/volley/VolleyError;)V
    .locals 5

    const-string v0, "Volley error of type "

    .line 1
    invoke-static {v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 2
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " requesting next wallpaper metadata for collectionId: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mCollectionId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " and collectionName: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mCollectionName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " with resumeToken: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mResumeToken:Ljava/lang/String;

    const-string v2, ", rescheduling this task."

    invoke-static {v0, v1, v2}, Landroid/support/v4/app/FragmentTabHost$SavedState$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mAppContext:Landroid/content/Context;

    const-string v2, "BackdropWPRotator"

    .line 3
    invoke-static {v2, v0, v1}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Detailed error message: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mAppContext:Landroid/content/Context;

    invoke-static {v2, v0, v1}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 5
    iget-object v0, p1, Lcom/android/volley/VolleyError;->networkResponse:Lcom/android/volley/NetworkResponse;

    if-eqz v0, :cond_0

    const-string v1, "Volley network response with status code: "

    .line 6
    invoke-static {v1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v3, v0, Lcom/android/volley/NetworkResponse;->statusCode:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " and headers: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v0, Lcom/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " and network roundtrip time of "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v3, v0, Lcom/android/volley/NetworkResponse;->networkTimeMs:J

    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, "ms"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mAppContext:Landroid/content/Context;

    invoke-static {v2, v0, v1}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mAppContext:Landroid/content/Context;

    .line 8
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v1

    .line 9
    invoke-interface {v1, v0}, Lcom/android/wallpaper/module/Injector;->getUserEventLogger(Landroid/content/Context;)Lcom/android/wallpaper/module/UserEventLogger;

    move-result-object v0

    .line 10
    instance-of v1, p1, Lcom/android/volley/NoConnectionError;

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    .line 11
    invoke-interface {v0, v2}, Lcom/android/wallpaper/module/UserEventLogger;->logDailyWallpaperMetadataRequestFailure(I)V

    goto :goto_0

    .line 12
    :cond_1
    instance-of v1, p1, Lcom/android/volley/ParseError;

    if-eqz v1, :cond_2

    const/4 p1, 0x2

    .line 13
    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logDailyWallpaperMetadataRequestFailure(I)V

    goto :goto_0

    .line 14
    :cond_2
    instance-of v1, p1, Lcom/android/volley/ServerError;

    if-eqz v1, :cond_3

    const/4 p1, 0x3

    .line 15
    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logDailyWallpaperMetadataRequestFailure(I)V

    goto :goto_0

    .line 16
    :cond_3
    instance-of p1, p1, Lcom/android/volley/TimeoutError;

    if-eqz p1, :cond_4

    const/4 p1, 0x4

    .line 17
    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logDailyWallpaperMetadataRequestFailure(I)V

    goto :goto_0

    :cond_4
    const/4 p1, 0x0

    .line 18
    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logDailyWallpaperMetadataRequestFailure(I)V

    .line 19
    :goto_0
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mAppContext:Landroid/content/Context;

    invoke-static {p1, v2}, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator;->access$300(Landroid/content/Context;I)V

    .line 20
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mListener:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;

    invoke-interface {p0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;->onError()V

    return-void
.end method

.method public onSuccess(Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;Ljava/lang/String;)V
    .locals 9

    .line 1
    invoke-static {}, Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;->getInstance()Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mAppContext:Landroid/content/Context;

    .line 2
    invoke-virtual {p1}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;->getImageUrl()Ljava/lang/String;

    move-result-object v2

    .line 3
    invoke-virtual {v0, v1, v2}, Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;->createRotatingWallpaperUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 4
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v7

    .line 5
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mAppContext:Landroid/content/Context;

    invoke-interface {v7, v1}, Lcom/android/wallpaper/module/Injector;->getRequester(Landroid/content/Context;)Lcom/google/android/gms/common/internal/zzam;

    move-result-object v1

    .line 6
    new-instance v2, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;

    move-object v3, v2

    move-object v4, p0

    move-object v5, v0

    move-object v6, p2

    move-object v8, p1

    invoke-direct/range {v3 .. v8}, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;-><init>(Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;Landroid/net/Uri;Ljava/lang/String;Lcom/android/wallpaper/module/Injector;Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;)V

    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/common/internal/zzam;->loadImageBitmap(Landroid/net/Uri;Lcom/bumptech/glide/request/target/Target;)V

    return-void
.end method
