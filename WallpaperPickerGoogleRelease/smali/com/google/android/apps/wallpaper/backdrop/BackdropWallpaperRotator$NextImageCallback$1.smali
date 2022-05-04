.class public Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;
.super Lcom/bumptech/glide/request/target/SimpleTarget;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->onSuccess(Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;Ljava/lang/String;)V
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
.field public final synthetic this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;

.field public final synthetic val$fifeImageUri:Landroid/net/Uri;

.field public final synthetic val$injector:Lcom/android/wallpaper/module/Injector;

.field public final synthetic val$resumeToken:Ljava/lang/String;

.field public final synthetic val$wallpaperImage:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;


# direct methods
.method public constructor <init>(Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;Landroid/net/Uri;Ljava/lang/String;Lcom/android/wallpaper/module/Injector;Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->val$fifeImageUri:Landroid/net/Uri;

    iput-object p3, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->val$resumeToken:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->val$injector:Lcom/android/wallpaper/module/Injector;

    iput-object p5, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->val$wallpaperImage:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;

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

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->val$fifeImageUri:Landroid/net/Uri;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " from collection with collectionId: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;

    .line 2
    iget-object v0, v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mCollectionId:Ljava/lang/String;

    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " with new resumeToken: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->val$resumeToken:Ljava/lang/String;

    const-string v1, ", rescheduling this task."

    invoke-static {p1, v0, v1}, Landroid/support/v4/app/FragmentTabHost$SavedState$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;

    .line 4
    iget-object v0, v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mAppContext:Landroid/content/Context;

    const-string v1, "BackdropWPRotator"

    .line 5
    invoke-static {v1, p1, v0}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 6
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;

    .line 7
    iget-object p1, p1, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mAppContext:Landroid/content/Context;

    const/4 v0, 0x2

    .line 8
    invoke-static {p1, v0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator;->access$300(Landroid/content/Context;I)V

    .line 9
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;

    .line 10
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mListener:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;

    .line 11
    invoke-interface {p0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;->onError()V

    return-void
.end method

.method public onResourceReady(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition;)V
    .locals 10

    .line 1
    move-object v1, p1

    check-cast v1, Landroid/graphics/Bitmap;

    const/4 p1, 0x2

    const-string p2, ", rescheduling this task."

    const-string v7, " with new resumeToken: "

    const-string v8, " from collection with collectionId: "

    const-string v9, "BackdropWPRotator"

    if-nez v1, :cond_0

    const-string v0, "Wallpaper bitmap was null for wallpaper from FIFE URL: "

    .line 2
    invoke-static {v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->val$fifeImageUri:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;

    .line 3
    iget-object v1, v1, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mCollectionId:Ljava/lang/String;

    .line 4
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->val$resumeToken:Ljava/lang/String;

    invoke-static {v0, v1, p2}, Landroid/support/v4/app/FragmentTabHost$SavedState$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;

    .line 5
    iget-object v0, v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mAppContext:Landroid/content/Context;

    .line 6
    invoke-static {v9, p2, v0}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 7
    iget-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;

    .line 8
    iget-object p2, p2, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mAppContext:Landroid/content/Context;

    .line 9
    invoke-static {p2, p1}, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator;->access$300(Landroid/content/Context;I)V

    .line 10
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;

    .line 11
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mListener:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;

    .line 12
    invoke-interface {p0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;->onError()V

    goto/16 :goto_0

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->val$injector:Lcom/android/wallpaper/module/Injector;

    iget-object v2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;

    .line 14
    iget-object v2, v2, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mAppContext:Landroid/content/Context;

    .line 15
    invoke-interface {v0, v2}, Lcom/android/wallpaper/module/Injector;->getWallpaperPersister(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPersister;

    move-result-object v0

    .line 16
    iget-object v2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->val$wallpaperImage:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;

    .line 17
    invoke-virtual {v2}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;->getAttributionList()Ljava/util/List;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;

    .line 18
    iget-object v3, v3, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mCollectionName:Ljava/lang/String;

    .line 19
    invoke-static {v2, v3}, Landroidx/coordinatorlayout/R$style;->parseAttributions(Ljava/util/List;Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->val$wallpaperImage:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;

    .line 20
    invoke-virtual {v3}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;->getType()Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;

    move-result-object v3

    .line 21
    invoke-virtual {v3}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;->getNumber()I

    move-result v3

    .line 22
    invoke-static {v3}, Landroidx/core/R$id;->getActionLabelForType(I)I

    move-result v3

    iget-object v4, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->val$wallpaperImage:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;

    .line 23
    invoke-virtual {v4}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;->getType()Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;

    move-result-object v4

    .line 24
    invoke-virtual {v4}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;->getNumber()I

    move-result v4

    .line 25
    invoke-static {v4}, Landroidx/core/R$id;->getActionIconForType(I)I

    move-result v4

    iget-object v5, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->val$wallpaperImage:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;

    .line 26
    invoke-virtual {v5}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;->getActionUrl()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;

    .line 27
    iget-object v6, v6, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mCollectionId:Ljava/lang/String;

    .line 28
    check-cast v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    invoke-virtual/range {v0 .. v6}, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->setWallpaperInRotation(Landroid/graphics/Bitmap;Ljava/util/List;IILjava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string p1, "Unable to set wallpaper in rotation for wallpaper from FIFE URL: "

    .line 29
    invoke-static {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->val$fifeImageUri:Landroid/net/Uri;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;

    .line 30
    iget-object v0, v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mCollectionId:Ljava/lang/String;

    .line 31
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->val$resumeToken:Ljava/lang/String;

    invoke-static {p1, v0, p2}, Landroid/support/v4/app/FragmentTabHost$SavedState$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;

    .line 32
    iget-object p2, p2, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mAppContext:Landroid/content/Context;

    .line 33
    invoke-static {v9, p1, p2}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 34
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;

    .line 35
    iget-object p1, p1, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mAppContext:Landroid/content/Context;

    const/4 p2, 0x3

    .line 36
    invoke-static {p1, p2}, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator;->access$300(Landroid/content/Context;I)V

    .line 37
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;

    .line 38
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mListener:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;

    .line 39
    invoke-interface {p0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;->onError()V

    goto :goto_0

    .line 40
    :cond_1
    iget-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;

    .line 41
    iget-object p2, p2, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 42
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-interface {p2, v0, v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLastAppActiveTimestamp(J)V

    .line 43
    iget-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;

    .line 44
    iget-object p2, p2, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mAppContext:Landroid/content/Context;

    const/4 v0, 0x0

    .line 45
    invoke-static {p2, v0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator;->access$300(Landroid/content/Context;I)V

    .line 46
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p2

    .line 47
    invoke-interface {p2}, Lcom/android/wallpaper/module/Injector;->getWallpaperStatusChecker()Lcom/google/android/material/shape/EdgeTreatment;

    move-result-object p2

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;

    .line 48
    iget-object v1, v1, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mAppContext:Landroid/content/Context;

    .line 49
    invoke-virtual {p2, v1}, Lcom/google/android/material/shape/EdgeTreatment;->isLockWallpaperSet(Landroid/content/Context;)Z

    move-result p2

    .line 50
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;

    .line 51
    iget-object v2, v1, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    if-eqz p2, :cond_2

    move p1, v0

    .line 52
    :cond_2
    iget-object p2, v1, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mCollectionId:Ljava/lang/String;

    .line 53
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->val$wallpaperImage:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;

    .line 54
    invoke-virtual {v0}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;->getAssetId()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    .line 55
    invoke-interface {v2, p1, p2, v0}, Lcom/android/wallpaper/module/WallpaperPreferences;->updateDailyWallpaperSet(ILjava/lang/String;Ljava/lang/String;)V

    .line 56
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;

    .line 57
    iget-object p1, p1, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;->mListener:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;

    .line 58
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback$1;->val$resumeToken:Ljava/lang/String;

    invoke-interface {p1, p0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;->onSuccess(Ljava/lang/String;)V

    :goto_0
    return-void
.end method
