.class public final synthetic Lcom/android/wallpaper/picker/WallpaperInfoHelper$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/ExploreIntentChecker$IntentReceiver;
.implements Lcom/android/wallpaper/module/WallpaperRefresher$RefreshListener;


# instance fields
.field public final synthetic f$0:Ljava/lang/Object;

.field public final synthetic f$1:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory$WallpaperInfoCallback;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/WallpaperInfoHelper$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/wallpaper/picker/WallpaperInfoHelper$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/WallpaperInfoHelper$ExploreIntentReceiver;Ljava/lang/CharSequence;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/WallpaperInfoHelper$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/wallpaper/picker/WallpaperInfoHelper$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public onIntentReceived(Landroid/content/Intent;)V
    .locals 2

    iget-object v0, p0, Lcom/android/wallpaper/picker/WallpaperInfoHelper$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/wallpaper/picker/WallpaperInfoHelper$ExploreIntentReceiver;

    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperInfoHelper$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    check-cast p0, Ljava/lang/CharSequence;

    .line 1
    check-cast v0, Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent$$ExternalSyntheticLambda0;

    iget-object v1, v0, Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast v1, Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent;

    iget-object v0, v0, Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Runnable;

    .line 2
    iput-object p0, v1, Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent;->mActionLabel:Ljava/lang/CharSequence;

    .line 3
    iput-object p1, v1, Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent;->mExploreIntent:Landroid/content/Intent;

    if-eqz v0, :cond_0

    .line 4
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void
.end method

.method public onRefreshed(Lcom/android/wallpaper/model/WallpaperMetadata;Lcom/android/wallpaper/model/WallpaperMetadata;I)V
    .locals 9

    iget-object v0, p0, Lcom/android/wallpaper/picker/WallpaperInfoHelper$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;

    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperInfoHelper$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    check-cast p0, Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory$WallpaperInfoCallback;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1
    iget-object v1, p1, Lcom/android/wallpaper/model/WallpaperMetadata;->mWallpaperComponent:Landroid/app/WallpaperInfo;

    if-nez v1, :cond_0

    .line 2
    new-instance v1, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;

    .line 3
    iget-object v3, p1, Lcom/android/wallpaper/model/WallpaperMetadata;->mAttributions:Ljava/util/List;

    .line 4
    iget-object v4, p1, Lcom/android/wallpaper/model/WallpaperMetadata;->mActionUrl:Ljava/lang/String;

    .line 5
    iget v5, p1, Lcom/android/wallpaper/model/WallpaperMetadata;->mActionLabelRes:I

    .line 6
    iget v6, p1, Lcom/android/wallpaper/model/WallpaperMetadata;->mActionIconRes:I

    .line 7
    iget-object v7, p1, Lcom/android/wallpaper/model/WallpaperMetadata;->mCollectionId:Ljava/lang/String;

    const/4 v8, 0x1

    move-object v2, v1

    .line 8
    invoke-direct/range {v2 .. v8}, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;-><init>(Ljava/util/List;Ljava/lang/String;IILjava/lang/String;I)V

    goto :goto_0

    .line 9
    :cond_0
    iget-object p1, v0, Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;->mLiveWallpaperInfoFactory:Lcom/google/android/material/shape/CornerTreatment;

    invoke-virtual {p1, v1}, Lcom/google/android/material/shape/CornerTreatment;->getLiveWallpaperInfo(Landroid/app/WallpaperInfo;)Lcom/android/wallpaper/model/WallpaperInfo;

    move-result-object v1

    :goto_0
    const/4 p1, 0x0

    if-eqz p2, :cond_1

    .line 10
    new-instance p1, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;

    .line 11
    iget-object v3, p2, Lcom/android/wallpaper/model/WallpaperMetadata;->mAttributions:Ljava/util/List;

    .line 12
    iget-object v4, p2, Lcom/android/wallpaper/model/WallpaperMetadata;->mActionUrl:Ljava/lang/String;

    .line 13
    iget v5, p2, Lcom/android/wallpaper/model/WallpaperMetadata;->mActionLabelRes:I

    .line 14
    iget v6, p2, Lcom/android/wallpaper/model/WallpaperMetadata;->mActionIconRes:I

    .line 15
    iget-object v7, p2, Lcom/android/wallpaper/model/WallpaperMetadata;->mCollectionId:Ljava/lang/String;

    const/4 v8, 0x2

    move-object v2, p1

    .line 16
    invoke-direct/range {v2 .. v8}, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;-><init>(Ljava/util/List;Ljava/lang/String;IILjava/lang/String;I)V

    .line 17
    :cond_1
    iput-object v1, v0, Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;->mHomeWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 18
    iput-object p1, v0, Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;->mLockWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 19
    iput p3, v0, Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;->mPresentationMode:I

    .line 20
    invoke-interface {p0, v1, p1, p3}, Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory$WallpaperInfoCallback;->onWallpaperInfoCreated(Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/model/WallpaperInfo;I)V

    return-void
.end method
