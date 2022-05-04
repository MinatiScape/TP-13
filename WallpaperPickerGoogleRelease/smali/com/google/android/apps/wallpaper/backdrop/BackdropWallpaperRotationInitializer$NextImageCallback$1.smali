.class public Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;
.super Lcom/bumptech/glide/request/target/SimpleTarget;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->onSuccess(Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bumptech/glide/request/target/SimpleTarget<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic this$1:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;

.field public final synthetic val$fifeImageUri:Landroid/net/Uri;

.field public final synthetic val$resumeToken:Ljava/lang/String;

.field public final synthetic val$wallpaperImage:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;


# direct methods
.method public constructor <init>(Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;Landroid/net/Uri;Ljava/lang/String;Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->this$1:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->val$fifeImageUri:Landroid/net/Uri;

    iput-object p3, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->val$resumeToken:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->val$wallpaperImage:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;

    invoke-direct {p0}, Lcom/bumptech/glide/request/target/SimpleTarget;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoadFailed(Landroid/graphics/drawable/Drawable;)V
    .locals 2

    const-string p1, "Wallpaper bitmap load failed for FIFE URL: "

    .line 1
    invoke-static {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->val$fifeImageUri:Landroid/net/Uri;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " from  collection with collectionId: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->this$1:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;

    iget-object v0, v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;

    .line 2
    iget-object v0, v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mCollectionId:Ljava/lang/String;

    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " with new resumeToken: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->val$resumeToken:Ljava/lang/String;

    const-string v1, "."

    invoke-static {p1, v0, v1}, Landroid/support/v4/app/FragmentTabHost$SavedState$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->this$1:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;

    .line 4
    iget-object v0, v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->mAppContext:Landroid/content/Context;

    const-string v1, "BackdropWPRotationInit"

    .line 5
    invoke-static {v1, p1, v0}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 6
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->this$1:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;

    .line 7
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->mListener:Lcom/android/wallpaper/model/WallpaperRotationInitializer$Listener;

    .line 8
    invoke-interface {p0}, Lcom/android/wallpaper/model/WallpaperRotationInitializer$Listener;->onError()V

    return-void
.end method

.method public onResourceReady(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition;)V
    .locals 6

    .line 1
    check-cast p1, Landroid/graphics/Bitmap;

    const-string p2, "."

    const-string v0, " from collection with collectionId: "

    const-string v1, "BackdropWPRotationInit"

    if-nez p1, :cond_0

    const-string p1, "Wallpaper bitmap was null for wallpaper from FIFE URL: "

    .line 2
    invoke-static {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->val$fifeImageUri:Landroid/net/Uri;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->this$1:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;

    iget-object v0, v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;

    .line 3
    iget-object v0, v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mCollectionId:Ljava/lang/String;

    .line 4
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " and resumeToken: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->val$resumeToken:Ljava/lang/String;

    invoke-static {p1, v0, p2}, Landroid/support/v4/app/FragmentTabHost$SavedState$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->this$1:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;

    .line 5
    iget-object p2, p2, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->mAppContext:Landroid/content/Context;

    .line 6
    invoke-static {v1, p1, p2}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 7
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->this$1:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;

    .line 8
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->mListener:Lcom/android/wallpaper/model/WallpaperRotationInitializer$Listener;

    .line 9
    invoke-interface {p0}, Lcom/android/wallpaper/model/WallpaperRotationInitializer$Listener;->onError()V

    goto/16 :goto_1

    .line 10
    :cond_0
    iget-object v2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->val$wallpaperImage:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;

    .line 11
    invoke-virtual {v2}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;->getAttributionList()Ljava/util/List;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->this$1:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;

    iget-object v3, v3, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;

    .line 12
    iget-object v3, v3, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mCollectionName:Ljava/lang/String;

    .line 13
    invoke-static {v2, v3}, Landroidx/coordinatorlayout/R$style;->parseAttributions(Ljava/util/List;Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    .line 14
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->this$1:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;

    .line 15
    iget-object v4, v4, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->mAppContext:Landroid/content/Context;

    .line 16
    invoke-interface {v3, v4}, Lcom/android/wallpaper/module/Injector;->getWallpaperPersister(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPersister;

    move-result-object v3

    .line 17
    iget-object v4, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->val$wallpaperImage:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;

    .line 18
    invoke-virtual {v4}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;->getActionUrl()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->this$1:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;

    iget-object v5, v5, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;

    .line 19
    iget-object v5, v5, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mCollectionId:Ljava/lang/String;

    .line 20
    check-cast v3, Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 21
    invoke-virtual {v3, p1, v2, v4, v5}, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->cropAndSetWallpaperBitmapInRotationStatic(Landroid/graphics/Bitmap;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_1

    const-string p1, "Unable to set rotating wallpaper bitmap for wallpaper from FIFE URL: "

    .line 22
    invoke-static {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->val$fifeImageUri:Landroid/net/Uri;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->this$1:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;

    iget-object v0, v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;

    .line 23
    iget-object v0, v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mCollectionId:Ljava/lang/String;

    .line 24
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " with new resumeToken: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->val$resumeToken:Ljava/lang/String;

    invoke-static {p1, v0, p2}, Landroid/support/v4/app/FragmentTabHost$SavedState$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->this$1:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;

    .line 25
    iget-object p2, p2, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->mAppContext:Landroid/content/Context;

    .line 26
    invoke-static {v1, p1, p2}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 27
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->this$1:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;

    .line 28
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->mListener:Lcom/android/wallpaper/model/WallpaperRotationInitializer$Listener;

    .line 29
    invoke-interface {p0}, Lcom/android/wallpaper/model/WallpaperRotationInitializer$Listener;->onError()V

    goto/16 :goto_1

    .line 30
    :cond_1
    iget-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->this$1:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;

    iget-object p2, p2, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;

    .line 31
    iput-object v2, p2, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedAttributions:Ljava/util/List;

    .line 32
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->val$wallpaperImage:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;

    invoke-virtual {v0}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;->getActionUrl()Ljava/lang/String;

    move-result-object v0

    .line 33
    iput-object v0, p2, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedActionUrl:Ljava/lang/String;

    .line 34
    iget-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->this$1:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;

    iget-object p2, p2, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->val$wallpaperImage:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;

    .line 35
    invoke-virtual {v0}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;->getType()Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;->getNumber()I

    move-result v0

    .line 36
    invoke-static {v0}, Landroidx/core/R$id;->getActionLabelForType(I)I

    move-result v0

    .line 37
    iput v0, p2, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedActionLabelRes:I

    .line 38
    iget-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->this$1:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;

    iget-object p2, p2, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->val$wallpaperImage:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;

    .line 39
    invoke-virtual {v0}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;->getType()Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;->getNumber()I

    move-result v0

    .line 40
    invoke-static {v0}, Landroidx/core/R$id;->getActionIconForType(I)I

    move-result v0

    .line 41
    iput v0, p2, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedActionIconRes:I

    .line 42
    iget-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->this$1:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;

    iget-object v0, p2, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;

    .line 43
    iput p1, v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedWallpaperId:I

    .line 44
    iget p1, p2, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->mNetworkPreference:I

    .line 45
    iput p1, v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedRequiredNetworkState:I

    .line 46
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->val$resumeToken:Ljava/lang/String;

    .line 47
    iput-object p1, v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedResumeToken:Ljava/lang/String;

    .line 48
    iget-object p1, p2, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->mListener:Lcom/android/wallpaper/model/WallpaperRotationInitializer$Listener;

    .line 49
    invoke-interface {p1}, Lcom/android/wallpaper/model/WallpaperRotationInitializer$Listener;->onFirstWallpaperInRotationSet()V

    .line 50
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p1

    iget-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->this$1:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;

    .line 51
    iget-object p2, p2, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->mAppContext:Landroid/content/Context;

    .line 52
    invoke-interface {p1, p2}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object p1

    .line 53
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p2

    .line 54
    invoke-interface {p2}, Lcom/android/wallpaper/module/Injector;->getWallpaperStatusChecker()Lcom/google/android/material/shape/EdgeTreatment;

    move-result-object p2

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->this$1:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;

    .line 55
    iget-object v0, v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->mAppContext:Landroid/content/Context;

    .line 56
    invoke-virtual {p2, v0}, Lcom/google/android/material/shape/EdgeTreatment;->isLockWallpaperSet(Landroid/content/Context;)Z

    move-result p2

    if-eqz p2, :cond_2

    const/4 p2, 0x0

    goto :goto_0

    :cond_2
    const/4 p2, 0x2

    .line 57
    :goto_0
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->this$1:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;

    iget-object v0, v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;

    .line 58
    iget-object v0, v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mCollectionId:Ljava/lang/String;

    .line 59
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback$1;->val$wallpaperImage:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;

    .line 60
    invoke-virtual {p0}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;->getAssetId()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p0

    .line 61
    invoke-interface {p1, p2, v0, p0}, Lcom/android/wallpaper/module/WallpaperPreferences;->updateDailyWallpaperSet(ILjava/lang/String;Ljava/lang/String;)V

    :goto_1
    return-void
.end method
