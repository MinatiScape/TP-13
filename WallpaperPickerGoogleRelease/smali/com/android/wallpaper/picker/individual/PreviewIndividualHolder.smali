.class public Lcom/android/wallpaper/picker/individual/PreviewIndividualHolder;
.super Lcom/android/wallpaper/picker/individual/IndividualHolder;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public mPreviewIntentFactory:Lcom/android/wallpaper/model/InlinePreviewIntentFactory;

.field public mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;


# direct methods
.method public constructor <init>(Landroid/app/Activity;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/wallpaper/picker/individual/IndividualHolder;-><init>(Landroid/app/Activity;ILandroid/view/View;)V

    .line 2
    iget-object p2, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mTileLayout:Landroid/view/View;

    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 3
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p2

    invoke-interface {p2, p1}, Lcom/android/wallpaper/module/Injector;->getWallpaperPersister(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPersister;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/PreviewIndividualHolder;->mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;

    .line 4
    new-instance p1, Lcom/android/wallpaper/picker/PreviewActivity$PreviewActivityIntentFactory;

    invoke-direct {p1}, Lcom/android/wallpaper/picker/PreviewActivity$PreviewActivityIntentFactory;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/PreviewIndividualHolder;->mPreviewIntentFactory:Lcom/android/wallpaper/model/InlinePreviewIntentFactory;

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mActivity:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p0, "PreviewIndividualHolder"

    const-string p1, "onClick received on VH on finishing Activity"

    .line 2
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 3
    :cond_0
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p1

    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mActivity:Landroid/app/Activity;

    invoke-interface {p1, v0}, Lcom/android/wallpaper/module/Injector;->getUserEventLogger(Landroid/content/Context;)Lcom/android/wallpaper/module/UserEventLogger;

    move-result-object p1

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Lcom/android/wallpaper/model/WallpaperInfo;->getCollectionId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/android/wallpaper/module/UserEventLogger;->logIndividualWallpaperSelected(Ljava/lang/String;)V

    .line 5
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 6
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/PreviewIndividualHolder;->mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;

    check-cast v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 7
    iput-object p1, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperInfoInPreview:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 8
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mActivity:Landroid/app/Activity;

    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/PreviewIndividualHolder;->mPreviewIntentFactory:Lcom/android/wallpaper/model/InlinePreviewIntentFactory;

    .line 9
    instance-of v1, p1, Lcom/android/wallpaper/model/LiveWallpaperInfo;

    if-eqz v1, :cond_1

    const/4 v1, 0x4

    goto :goto_0

    :cond_1
    const/4 v1, 0x1

    .line 10
    :goto_0
    invoke-virtual {p1, v0, p0, v1}, Lcom/android/wallpaper/model/WallpaperInfo;->showPreview(Landroid/app/Activity;Lcom/android/wallpaper/model/InlinePreviewIntentFactory;I)V

    return-void
.end method
