.class public final synthetic Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Ljava/lang/Object;

.field public final synthetic f$1:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider$FetchThemedIconEnabledCallback;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/systemui/shared/navigationbar/RegionSamplingHelper;Landroid/view/SurfaceControl;)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/CustomizationPickerFragment;Landroid/os/Bundle;)V
    .locals 1

    const/4 v0, 0x3

    iput v0, p0, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent;Lcom/android/wallpaper/widget/WallpaperInfoView;)V
    .locals 1

    const/4 v0, 0x4

    iput v0, p0, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/util/PreviewUtils$WorkspacePreviewCallback;Landroid/os/Bundle;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget v0, p0, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;->$r8$classId:I

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_1

    :pswitch_0
    iget-object v0, p0, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/wallpaper/picker/CustomizationPickerFragment;

    iget-object p0, p0, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    check-cast p0, Landroid/os/Bundle;

    .line 1
    iget-object v0, v0, Lcom/android/wallpaper/picker/CustomizationPickerFragment;->mNestedScrollView:Landroidx/core/widget/NestedScrollView;

    const-string v1, "SCROLL_POSITION_Y"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p0

    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->setScrollY(I)V

    return-void

    .line 2
    :pswitch_1
    iget-object v0, p0, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/systemui/shared/navigationbar/RegionSamplingHelper;

    iget-object p0, p0, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    check-cast p0, Landroid/view/SurfaceControl;

    invoke-static {v0, p0}, Lcom/android/systemui/shared/navigationbar/RegionSamplingHelper;->$r8$lambda$8zHcWoytc2ngqSPm8PwLjAZ6FZk(Lcom/android/systemui/shared/navigationbar/RegionSamplingHelper;Landroid/view/SurfaceControl;)V

    return-void

    :pswitch_2
    iget-object v0, p0, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;

    iget-object p0, p0, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    check-cast p0, Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider$FetchThemedIconEnabledCallback;

    .line 3
    iget-object v0, v0, Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;->mCustomizationPreferences:Lcom/android/customization/module/CustomizationPreferences;

    invoke-interface {v0}, Lcom/android/customization/module/CustomizationPreferences;->getThemedIconEnabled()Z

    move-result v0

    check-cast p0, Lcom/android/customization/model/themedicon/ThemedIconSectionController$$ExternalSyntheticLambda0;

    iget-object p0, p0, Lcom/android/customization/model/themedicon/ThemedIconSectionController$$ExternalSyntheticLambda0;->f$0:Lcom/android/customization/model/themedicon/ThemedIconSectionController;

    .line 4
    iget-object p0, p0, Lcom/android/customization/model/themedicon/ThemedIconSectionController;->mThemedIconSectionView:Lcom/android/customization/picker/themedicon/ThemedIconSectionView;

    .line 5
    iget-object p0, p0, Lcom/android/customization/picker/themedicon/ThemedIconSectionView;->mSwitchView:Landroid/widget/Switch;

    .line 6
    invoke-virtual {p0, v0}, Landroid/widget/Switch;->setChecked(Z)V

    return-void

    .line 7
    :pswitch_3
    iget-object v0, p0, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/wallpaper/util/PreviewUtils$WorkspacePreviewCallback;

    iget-object p0, p0, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    check-cast p0, Landroid/os/Bundle;

    .line 8
    check-cast v0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;

    iget-object v0, v0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;

    .line 9
    iget-object v1, v0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mRequestPending:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    if-eqz p0, :cond_1

    .line 10
    iget-object v1, v0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mLastSurface:Landroid/view/Surface;

    if-eqz v1, :cond_1

    .line 11
    iget-object v1, v0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mWorkspaceSurface:Landroid/view/SurfaceView;

    const-string v2, "surface_package"

    .line 12
    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/view/SurfaceControlViewHost$SurfacePackage;

    .line 13
    invoke-virtual {v1, v2}, Landroid/view/SurfaceView;->setChildSurfacePackage(Landroid/view/SurfaceControlViewHost$SurfacePackage;)V

    const-string v1, "callback"

    .line 14
    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p0

    check-cast p0, Landroid/os/Message;

    .line 15
    iput-object p0, v0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mCallback:Landroid/os/Message;

    .line 16
    iget-boolean p0, v0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mNeedsToCleanUp:Z

    if-eqz p0, :cond_0

    .line 17
    invoke-virtual {v0}, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->cleanUp()V

    goto :goto_0

    .line 18
    :cond_0
    iget-object p0, v0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mListener:Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback$WorkspaceRenderListener;

    if-eqz p0, :cond_1

    .line 19
    check-cast p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;

    iget-object p0, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast p0, Landroid/view/SurfaceView;

    invoke-static {p0}, Lcom/android/wallpaper/picker/WallpaperColorThemePreview;->lambda$updateWorkspacePreview$0(Landroid/view/SurfaceView;)V

    :cond_1
    :goto_0
    return-void

    .line 20
    :goto_1
    iget-object v0, p0, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent;

    iget-object p0, p0, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    check-cast p0, Lcom/android/wallpaper/widget/WallpaperInfoView;

    .line 21
    invoke-virtual {v0, p0}, Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent;->populateWallpaperInfo(Lcom/android/wallpaper/widget/WallpaperInfoView;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
