.class public Lcom/android/wallpaper/picker/CategoryFragment$5$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/picker/CategoryFragment$5;->onWallpaperInfoCreated(Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/model/WallpaperInfo;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$1:Lcom/android/wallpaper/picker/CategoryFragment$5;

.field public final synthetic val$homeWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

.field public final synthetic val$lockWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/CategoryFragment$5;Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/model/WallpaperInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment$5$1;->this$1:Lcom/android/wallpaper/picker/CategoryFragment$5;

    iput-object p2, p0, Lcom/android/wallpaper/picker/CategoryFragment$5$1;->val$homeWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    iput-object p3, p0, Lcom/android/wallpaper/picker/CategoryFragment$5$1;->val$lockWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/CategoryFragment$5$1;->this$1:Lcom/android/wallpaper/picker/CategoryFragment$5;

    iget-object v0, v0, Lcom/android/wallpaper/picker/CategoryFragment$5;->this$0:Lcom/android/wallpaper/picker/CategoryFragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 2
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/CategoryFragment$5$1;->this$1:Lcom/android/wallpaper/picker/CategoryFragment$5;

    iget-object v0, v0, Lcom/android/wallpaper/picker/CategoryFragment$5;->this$0:Lcom/android/wallpaper/picker/CategoryFragment;

    iget-object v1, p0, Lcom/android/wallpaper/picker/CategoryFragment$5$1;->val$homeWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 3
    iput-object v1, v0, Lcom/android/wallpaper/picker/CategoryFragment;->mHomePreviewWallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 4
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment$5$1;->val$lockWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    if-nez p0, :cond_1

    move-object p0, v1

    .line 5
    :cond_1
    iput-object p0, v0, Lcom/android/wallpaper/picker/CategoryFragment;->mLockPreviewWallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 6
    iget-object p0, v0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    .line 7
    iget-object p0, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mHomeImageWallpaper:Landroid/widget/ImageView;

    if-nez v1, :cond_2

    goto/16 :goto_2

    :cond_2
    if-nez p0, :cond_3

    goto/16 :goto_2

    .line 8
    :cond_3
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    if-nez v2, :cond_4

    goto/16 :goto_2

    .line 9
    :cond_4
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v3

    invoke-interface {v3, v2}, Lcom/android/wallpaper/module/Injector;->getUserEventLogger(Landroid/content/Context;)Lcom/android/wallpaper/module/UserEventLogger;

    move-result-object v3

    .line 10
    instance-of v4, v1, Lcom/android/wallpaper/model/LiveWallpaperInfo;

    const/4 v5, 0x1

    xor-int/lit8 v6, v4, 0x1

    if-eqz v6, :cond_5

    .line 11
    iget-object v6, v0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    .line 12
    iget-object v6, v6, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mHomeImageWallpaper:Landroid/widget/ImageView;

    goto :goto_0

    :cond_5
    move-object v6, p0

    :goto_0
    const v7, 0x1010530

    if-eqz v6, :cond_6

    .line 13
    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v1, v8}, Lcom/android/wallpaper/model/WallpaperInfo;->getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object v8

    .line 14
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v9

    .line 15
    invoke-static {v9, v7}, Landroidx/transition/R$id;->getColorAttr(Landroid/content/Context;I)I

    move-result v9

    .line 16
    invoke-virtual {v8, v2, v6, v9}, Lcom/android/wallpaper/asset/Asset;->loadPreviewImage(Landroid/app/Activity;Landroid/widget/ImageView;I)V

    :cond_6
    if-eqz v4, :cond_a

    .line 17
    iget-object v4, v0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    .line 18
    iget-object v4, v4, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mHomeImageWallpaper:Landroid/widget/ImageView;

    if-eqz v4, :cond_7

    .line 19
    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/android/wallpaper/model/WallpaperInfo;->getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object v4

    iget-object v6, v0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    .line 20
    iget-object v6, v6, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mHomeImageWallpaper:Landroid/widget/ImageView;

    .line 21
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v8

    .line 22
    invoke-static {v8, v7}, Landroidx/transition/R$id;->getColorAttr(Landroid/content/Context;I)I

    move-result v7

    .line 23
    invoke-virtual {v4, v2, v6, v7}, Lcom/android/wallpaper/asset/Asset;->loadPreviewImage(Landroid/app/Activity;Landroid/widget/ImageView;I)V

    .line 24
    :cond_7
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    if-nez v2, :cond_8

    goto :goto_1

    .line 25
    :cond_8
    iget-object v4, v0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    if-eqz v4, :cond_9

    .line 26
    invoke-virtual {v4}, Lcom/android/wallpaper/util/WallpaperConnection;->disconnect()V

    .line 27
    :cond_9
    invoke-static {}, Lcom/android/wallpaper/util/WallpaperConnection;->isPreviewAvailable()Z

    move-result v4

    if-eqz v4, :cond_b

    .line 28
    iget-object v4, v0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    .line 29
    iget-object v4, v4, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mHomeImageWallpaper:Landroid/widget/ImageView;

    .line 30
    new-instance v6, Lcom/android/wallpaper/util/WallpaperConnection;

    .line 31
    invoke-virtual {v1}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperComponent()Landroid/app/WallpaperInfo;

    move-result-object v7

    .line 32
    new-instance v8, Landroid/content/Intent;

    const-string v9, "android.service.wallpaper.WallpaperService"

    invoke-direct {v8, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 33
    invoke-virtual {v7}, Landroid/app/WallpaperInfo;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7}, Landroid/app/WallpaperInfo;->getServiceName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v8, v9, v7}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v7

    .line 34
    new-instance v8, Lcom/android/wallpaper/picker/CategoryFragment$6;

    invoke-direct {v8, v0}, Lcom/android/wallpaper/picker/CategoryFragment$6;-><init>(Lcom/android/wallpaper/picker/CategoryFragment;)V

    iget-object v9, v0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    invoke-direct {v6, v7, v2, v8, v9}, Lcom/android/wallpaper/util/WallpaperConnection;-><init>(Landroid/content/Intent;Landroid/content/Context;Lcom/android/wallpaper/util/WallpaperConnection$WallpaperConnectionListener;Landroid/view/SurfaceView;)V

    iput-object v6, v0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    .line 35
    iput-boolean v5, v6, Lcom/android/wallpaper/util/WallpaperConnection;->mIsVisible:Z

    .line 36
    invoke-virtual {v6, v5}, Lcom/android/wallpaper/util/WallpaperConnection;->setEngineVisibility(Z)V

    .line 37
    new-instance v2, Lcom/android/wallpaper/util/DiskBasedLogger$$ExternalSyntheticLambda1;

    invoke-direct {v2, v0}, Lcom/android/wallpaper/util/DiskBasedLogger$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/picker/CategoryFragment;)V

    invoke-virtual {v4, v2}, Landroid/widget/ImageView;->post(Ljava/lang/Runnable;)Z

    goto :goto_1

    .line 38
    :cond_a
    iget-object v2, v0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    if-eqz v2, :cond_b

    .line 39
    invoke-virtual {v2}, Lcom/android/wallpaper/util/WallpaperConnection;->disconnect()V

    const/4 v2, 0x0

    .line 40
    iput-object v2, v0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    .line 41
    :cond_b
    :goto_1
    invoke-virtual {p0}, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    new-instance v2, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda2;

    invoke-direct {v2, v0, v1, v5, v3}, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda2;-><init>(Lcom/android/wallpaper/picker/CategoryFragment;Lcom/android/wallpaper/model/WallpaperInfo;ZLcom/android/wallpaper/module/UserEventLogger;)V

    invoke-virtual {p0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_2
    return-void
.end method
