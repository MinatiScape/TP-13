.class public Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/wallpaper/picker/individual/SelectableHolder;


# instance fields
.field public mActivity:Landroid/app/Activity;

.field public mRotationStarter:Lcom/android/wallpaper/picker/RotationStarter;

.field public mSelectionAnimator:Lcom/android/wallpaper/picker/individual/SelectionAnimator;

.field public mThumbnailView:Landroid/widget/ImageView;

.field public mTile:Landroid/view/View;

.field public mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;


# direct methods
.method public constructor <init>(Landroid/app/Activity;ILandroid/view/View;Lcom/android/wallpaper/picker/individual/SelectionAnimator;Lcom/android/wallpaper/picker/RotationStarter;)V
    .locals 1

    .line 1
    invoke-direct {p0, p3}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 2
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 3
    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;->mActivity:Landroid/app/Activity;

    const p1, 0x7f0a0266

    .line 4
    invoke-virtual {p3, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;->mTile:Landroid/view/View;

    const p1, 0x7f0a0264

    .line 5
    invoke-virtual {p3, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;->mThumbnailView:Landroid/widget/ImageView;

    .line 6
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;->mTile:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;->mTile:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 8
    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 9
    iput-object p4, p0, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;->mSelectionAnimator:Lcom/android/wallpaper/picker/individual/SelectionAnimator;

    .line 10
    iput-object p5, p0, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;->mRotationStarter:Lcom/android/wallpaper/picker/RotationStarter;

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;->mSelectionAnimator:Lcom/android/wallpaper/picker/individual/SelectionAnimator;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;->mSelectionAnimator:Lcom/android/wallpaper/picker/individual/SelectionAnimator;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;->mRotationStarter:Lcom/android/wallpaper/picker/RotationStarter;

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Lcom/android/wallpaper/picker/RotationStarter;->startRotation(I)V

    return-void
.end method

.method public setSelectionState(I)V
    .locals 1

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;->mSelectionAnimator:Lcom/android/wallpaper/picker/individual/SelectionAnimator;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    if-nez p1, :cond_1

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;->mSelectionAnimator:Lcom/android/wallpaper/picker/individual/SelectionAnimator;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    .line 3
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;->mSelectionAnimator:Lcom/android/wallpaper/picker/individual/SelectionAnimator;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    :goto_0
    return-void
.end method
