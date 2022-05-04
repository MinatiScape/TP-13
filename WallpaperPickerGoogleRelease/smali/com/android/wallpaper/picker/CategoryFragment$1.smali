.class public Lcom/android/wallpaper/picker/CategoryFragment$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/picker/CategoryFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/CategoryFragment;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/CategoryFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment$1;->this$0:Lcom/android/wallpaper/picker/CategoryFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment$1;->this$0:Lcom/android/wallpaper/picker/CategoryFragment;

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    if-eqz p1, :cond_2

    .line 3
    iget-boolean p1, p1, Lcom/android/wallpaper/util/WallpaperConnection;->mEngineReady:Z

    if-eqz p1, :cond_2

    .line 4
    iget-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mHomePreviewWallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 5
    instance-of p1, p1, Lcom/android/wallpaper/model/LiveWallpaperInfo;

    if-eqz p1, :cond_2

    const/4 p1, 0x0

    cmpl-float p1, p2, p1

    if-eqz p1, :cond_1

    const/high16 p1, 0x3f800000    # 1.0f

    cmpl-float p1, p2, p1

    if-eqz p1, :cond_1

    if-nez p3, :cond_0

    goto :goto_0

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    const/4 p1, 0x1

    .line 7
    invoke-virtual {p0, p1}, Landroid/view/SurfaceView;->setZOrderMediaOverlay(Z)V

    goto :goto_1

    .line 8
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    const/4 p1, 0x0

    .line 9
    invoke-virtual {p0, p1}, Landroid/view/SurfaceView;->setZOrderMediaOverlay(Z)V

    :cond_2
    :goto_1
    return-void
.end method

.method public onPageSelected(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/CategoryFragment$1;->this$0:Lcom/android/wallpaper/picker/CategoryFragment;

    .line 2
    iget-object v1, v0, Lcom/android/wallpaper/picker/CategoryFragment;->mPreviewPager:Lcom/android/wallpaper/widget/PreviewPager;

    .line 3
    invoke-virtual {v1}, Lcom/android/wallpaper/widget/PreviewPager;->isRtl()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 4
    iget-object v1, p0, Lcom/android/wallpaper/picker/CategoryFragment$1;->this$0:Lcom/android/wallpaper/picker/CategoryFragment;

    .line 5
    iget-object v1, v1, Lcom/android/wallpaper/picker/CategoryFragment;->mWallPaperPreviews:Ljava/util/List;

    .line 6
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    sub-int p1, v1, p1

    .line 7
    :cond_0
    iput p1, v0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperIndex:I

    .line 8
    iget-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment$1;->this$0:Lcom/android/wallpaper/picker/CategoryFragment;

    .line 9
    iget-object p1, p1, Lcom/android/wallpaper/picker/CategoryFragment;->mIndividualPickerFragment:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    if-eqz p1, :cond_1

    .line 10
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->isVisible()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 11
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment$1;->this$0:Lcom/android/wallpaper/picker/CategoryFragment;

    .line 12
    iget-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mIndividualPickerFragment:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    .line 13
    iget p0, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperIndex:I

    .line 14
    invoke-virtual {p1, p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->highlightAppliedWallpaper(I)V

    :cond_1
    return-void
.end method
