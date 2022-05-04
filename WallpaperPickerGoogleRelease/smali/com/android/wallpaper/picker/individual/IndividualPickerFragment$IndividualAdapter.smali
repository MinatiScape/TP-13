.class public Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "IndividualAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field public mPendingSelectedAdapterPosition:I

.field public mSelectedAdapterPosition:I

.field public final mWallpapers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/WallpaperInfo;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/WallpaperInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->mWallpapers:Ljava/util/List;

    const/4 p1, -0x1

    .line 3
    iput p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->mPendingSelectedAdapterPosition:I

    .line 4
    iput p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->mSelectedAdapterPosition:I

    return-void
.end method

.method public static access$200(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;I)V
    .locals 4

    .line 1
    iget v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->mPendingSelectedAdapterPosition:I

    iget v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->mSelectedAdapterPosition:I

    if-ne v0, v1, :cond_0

    goto/16 :goto_0

    .line 2
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    .line 3
    iget-object v1, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCurrentWallpaperBottomSheetPresenter:Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter;

    if-eqz v1, :cond_2

    .line 4
    check-cast v1, Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    invoke-virtual {v1, v0}, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->refreshCurrentWallpapers(Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter$RefreshListener;)V

    .line 5
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    .line 6
    iget-object v1, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCurrentWallpaperBottomSheetExpandedRunnable:Ljava/lang/Runnable;

    if-eqz v1, :cond_1

    .line 7
    iget-object v0, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 8
    :cond_1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    new-instance v1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter$2;

    invoke-direct {v1, p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter$2;-><init>(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;)V

    .line 9
    iput-object v1, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCurrentWallpaperBottomSheetExpandedRunnable:Ljava/lang/Runnable;

    .line 10
    iget-object v0, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 11
    :cond_2
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-nez v0, :cond_3

    goto :goto_0

    .line 12
    :cond_3
    iget v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->mSelectedAdapterPosition:I

    const/4 v1, 0x0

    if-ltz v0, :cond_4

    .line 13
    iget-object v2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget-object v2, v2, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object v0

    .line 14
    instance-of v2, v0, Lcom/android/wallpaper/picker/individual/SelectableHolder;

    if-eqz v2, :cond_4

    .line 15
    check-cast v0, Lcom/android/wallpaper/picker/individual/SelectableHolder;

    invoke-interface {v0, v1}, Lcom/android/wallpaper/picker/individual/SelectableHolder;->setSelectionState(I)V

    .line 16
    :cond_4
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget-object v0, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    .line 17
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object v0

    .line 18
    instance-of v2, v0, Lcom/android/wallpaper/picker/individual/SelectableHolder;

    if-eqz v2, :cond_5

    .line 19
    check-cast v0, Lcom/android/wallpaper/picker/individual/SelectableHolder;

    const/4 v2, 0x2

    invoke-interface {v0, v2}, Lcom/android/wallpaper/picker/individual/SelectableHolder;->setSelectionState(I)V

    .line 20
    :cond_5
    iput p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->mSelectedAdapterPosition:I

    .line 21
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget-object v0, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 22
    iget v0, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    .line 23
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->getItemCount()I

    move-result v2

    int-to-float v2, v2

    int-to-float v3, v0

    div-float/2addr v2, v3

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v2, v2

    .line 24
    div-int/2addr p1, v0

    const/4 v0, 0x1

    sub-int/2addr v2, v0

    if-ne p1, v2, :cond_6

    move v1, v0

    .line 25
    :cond_6
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-virtual {p0, v1}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->updateImageGridPadding(Z)V

    :goto_0
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-virtual {v0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->shouldShowRotationTile()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget-object v0, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCategory:Lcom/android/wallpaper/model/WallpaperCategory;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    instance-of v0, v0, Lcom/android/wallpaper/model/DesktopCustomCategory;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 3
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->mWallpapers:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    goto :goto_1

    .line 4
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->mWallpapers:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    add-int/lit8 p0, p0, 0x1

    :goto_1
    return p0
.end method

.method public getItemViewType(I)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-virtual {v0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->shouldShowRotationTile()Z

    move-result v0

    if-eqz v0, :cond_0

    if-nez p1, :cond_0

    const/4 p0, 0x1

    return p0

    .line 2
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget-object v0, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCategory:Lcom/android/wallpaper/model/WallpaperCategory;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    instance-of v0, v0, Lcom/android/wallpaper/model/DesktopCustomCategory;

    if-eqz v0, :cond_1

    .line 4
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    .line 5
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->isRotationEnabled()Z

    move-result p0

    if-nez p0, :cond_1

    if-nez p1, :cond_1

    const/4 p0, 0x3

    return p0

    :cond_1
    const/4 p0, 0x2

    return p0
.end method

.method public onBindIndividualHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-virtual {v0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->shouldShowRotationTile()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget-object v0, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCategory:Lcom/android/wallpaper/model/WallpaperCategory;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    instance-of v0, v0, Lcom/android/wallpaper/model/DesktopCustomCategory;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    move v0, p2

    goto :goto_1

    :cond_1
    :goto_0
    add-int/lit8 v0, p2, -0x1

    .line 3
    :goto_1
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->mWallpapers:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/wallpaper/model/WallpaperInfo;

    .line 4
    iget-object v1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/wallpaper/model/WallpaperInfo;->computePlaceholderColor(Landroid/content/Context;)Ljava/util/concurrent/Future;

    .line 5
    move-object v1, p1

    check-cast v1, Lcom/android/wallpaper/picker/individual/IndividualHolder;

    invoke-virtual {v1, v0}, Lcom/android/wallpaper/picker/individual/IndividualHolder;->bindWallpaper(Lcom/android/wallpaper/model/WallpaperInfo;)V

    .line 6
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    .line 7
    iget-object v1, v1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mAppliedWallpaperIds:Ljava/util/Set;

    .line 8
    invoke-virtual {v0}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 9
    iput p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->mSelectedAdapterPosition:I

    .line 10
    iget-object p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    .line 11
    iput-object v0, p2, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mAppliedWallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 12
    :cond_2
    iget-object p2, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    const v0, 0x7f0a0288

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroidx/cardview/widget/CardView;

    .line 13
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-virtual {v0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->isFewerColumnLayout()Z

    move-result v0

    if-eqz v0, :cond_3

    const v0, 0x7f0700fb

    goto :goto_2

    :cond_3
    const v0, 0x7f0700fc

    .line 14
    :goto_2
    iget-object v2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    invoke-virtual {p2, v0}, Landroidx/cardview/widget/CardView;->setRadius(F)V

    const p2, 0x7f080112

    .line 15
    invoke-virtual {p0, p1, p2, v1}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->showBadge(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;IZ)V

    return-void
.end method

.method public onBindRotationHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget v1, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mFormFactor:I

    if-nez v1, :cond_2

    .line 2
    iget-object v0, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCategory:Lcom/android/wallpaper/model/WallpaperCategory;

    .line 3
    iget-object v0, v0, Lcom/android/wallpaper/model/Category;->mCollectionId:Ljava/lang/String;

    .line 4
    check-cast p1, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;

    .line 5
    iget-object v1, p1, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getWallpaperPresentationMode()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    iget-object v1, p1, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 6
    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperCollectionId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 7
    iget-object v1, p1, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;->mSelectionAnimator:Lcom/android/wallpaper/picker/individual/SelectionAnimator;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 8
    :cond_0
    iget-object v1, p1, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;->mSelectionAnimator:Lcom/android/wallpaper/picker/individual/SelectionAnimator;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    :goto_0
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget-object v1, v1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getWallpaperPresentationMode()I

    move-result v1

    if-ne v1, v2, :cond_1

    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget-object v1, v1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 10
    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperCollectionId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 11
    iput p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->mSelectedAdapterPosition:I

    .line 12
    :cond_1
    iget-object p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    .line 13
    iget-boolean p2, p2, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWasUpdateRunnableRun:Z

    if-nez p2, :cond_2

    .line 14
    iget-object p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->mWallpapers:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_2

    .line 15
    iget-object p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-static {p2, p1}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->access$300(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;)V

    .line 16
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    const/4 p1, 0x1

    .line 17
    iput-boolean p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWasUpdateRunnableRun:Z

    :cond_2
    return-void
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 2

    .line 1
    invoke-virtual {p0, p2}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->getItemViewType(I)I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 p0, 0x3

    if-eq v0, p0, :cond_0

    .line 2
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "Unsupported viewType "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " in IndividualAdapter"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "IndividualPickerFrgmnt"

    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 3
    :cond_0
    check-cast p1, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder;

    invoke-virtual {p1}, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder;->bind()V

    goto :goto_0

    .line 4
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->onBindIndividualHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V

    goto :goto_0

    .line 5
    :cond_2
    invoke-virtual {p0, p1, p2}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->onBindRotationHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V

    :goto_0
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 8

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eq p2, v0, :cond_3

    const/4 v0, 0x2

    if-eq p2, v0, :cond_1

    const/4 v0, 0x3

    if-eq p2, v0, :cond_0

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "Unsupported viewType "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " in IndividualAdapter"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "IndividualPickerFrgmnt"

    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x0

    return-object p0

    .line 2
    :cond_0
    iget-object p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0d006d

    .line 3
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 4
    new-instance p2, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder;

    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    .line 5
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    check-cast v1, Lcom/android/wallpaper/picker/MyPhotosStarter$MyPhotosStarterProvider;

    invoke-interface {v1}, Lcom/android/wallpaper/picker/MyPhotosStarter$MyPhotosStarterProvider;->getMyPhotosStarter()Lcom/android/wallpaper/picker/MyPhotosStarter;

    move-result-object v1

    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mTileSizePx:Landroid/graphics/Point;

    iget p0, p0, Landroid/graphics/Point;->y:I

    invoke-direct {p2, v0, v1, p0, p1}, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder;-><init>(Landroid/app/Activity;Lcom/android/wallpaper/picker/MyPhotosStarter;ILandroid/view/View;)V

    return-object p2

    .line 6
    :cond_1
    iget-object p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0d006b

    .line 7
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v5

    .line 8
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget p2, p1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mFormFactor:I

    if-nez p2, :cond_2

    .line 9
    new-instance v6, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$EmptySelectionAnimator;

    invoke-direct {v6, p1}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$EmptySelectionAnimator;-><init>(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;)V

    .line 10
    new-instance p1, Lcom/android/wallpaper/picker/individual/SetIndividualHolder;

    iget-object p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    .line 11
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v3

    iget-object p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget-object p2, p2, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mTileSizePx:Landroid/graphics/Point;

    iget v4, p2, Landroid/graphics/Point;->y:I

    new-instance v7, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter$1;

    invoke-direct {v7, p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter$1;-><init>(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;)V

    move-object v2, p1

    invoke-direct/range {v2 .. v7}, Lcom/android/wallpaper/picker/individual/SetIndividualHolder;-><init>(Landroid/app/Activity;ILandroid/view/View;Lcom/android/wallpaper/picker/individual/SelectionAnimator;Lcom/android/wallpaper/picker/individual/SetIndividualHolder$OnSetListener;)V

    goto :goto_0

    .line 12
    :cond_2
    new-instance p1, Lcom/android/wallpaper/picker/individual/PreviewIndividualHolder;

    iget-object p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mTileSizePx:Landroid/graphics/Point;

    iget p0, p0, Landroid/graphics/Point;->y:I

    invoke-direct {p1, p2, p0, v5}, Lcom/android/wallpaper/picker/individual/PreviewIndividualHolder;-><init>(Landroid/app/Activity;ILandroid/view/View;)V

    :goto_0
    return-object p1

    .line 13
    :cond_3
    iget-object p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0d006e

    .line 14
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v5

    .line 15
    new-instance v6, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$EmptySelectionAnimator;

    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-direct {v6, p1}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$EmptySelectionAnimator;-><init>(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;)V

    .line 16
    new-instance p1, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;

    iget-object p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v3

    iget-object v7, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget-object p0, v7, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mTileSizePx:Landroid/graphics/Point;

    iget v4, p0, Landroid/graphics/Point;->y:I

    move-object v2, p1

    invoke-direct/range {v2 .. v7}, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;-><init>(Landroid/app/Activity;ILandroid/view/View;Lcom/android/wallpaper/picker/individual/SelectionAnimator;Lcom/android/wallpaper/picker/RotationStarter;)V

    return-object p1
.end method

.method public showBadge(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;IZ)V
    .locals 1

    .line 1
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    const v0, 0x7f0a0125

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    if-eqz p3, :cond_1

    .line 2
    iget-object p3, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-virtual {p3}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->isFewerColumnLayout()Z

    move-result p3

    if-eqz p3, :cond_0

    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p3, 0x7f0700fe

    invoke-virtual {p0, p3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p0

    goto :goto_0

    .line 3
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p3, 0x7f0700ff

    invoke-virtual {p0, p3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p0

    .line 4
    :goto_0
    invoke-virtual {p1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p3

    check-cast p3, Landroid/widget/RelativeLayout$LayoutParams;

    float-to-int p0, p0

    .line 5
    invoke-virtual {p3, p0, p0, p0, p0}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 6
    invoke-virtual {p1, p3}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 7
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    const/4 p0, 0x0

    .line 8
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_1

    :cond_1
    const/16 p0, 0x8

    .line 9
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setVisibility(I)V

    :goto_1
    return-void
.end method
