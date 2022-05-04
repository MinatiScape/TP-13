.class public Lcom/android/wallpaper/picker/individual/SetIndividualHolder;
.super Lcom/android/wallpaper/picker/individual/IndividualHolder;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/wallpaper/picker/individual/SelectableHolder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/picker/individual/SetIndividualHolder$OnSetListener;
    }
.end annotation


# instance fields
.field public mOnSetListener:Lcom/android/wallpaper/picker/individual/SetIndividualHolder$OnSetListener;

.field public mSelectionAnimator:Lcom/android/wallpaper/picker/individual/SelectionAnimator;

.field public mTile:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/app/Activity;ILandroid/view/View;Lcom/android/wallpaper/picker/individual/SelectionAnimator;Lcom/android/wallpaper/picker/individual/SetIndividualHolder$OnSetListener;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/wallpaper/picker/individual/IndividualHolder;-><init>(Landroid/app/Activity;ILandroid/view/View;)V

    const p1, 0x7f0a0266

    .line 2
    invoke-virtual {p3, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/SetIndividualHolder;->mTile:Landroid/view/View;

    .line 3
    iput-object p4, p0, Lcom/android/wallpaper/picker/individual/SetIndividualHolder;->mSelectionAnimator:Lcom/android/wallpaper/picker/individual/SelectionAnimator;

    .line 4
    iput-object p5, p0, Lcom/android/wallpaper/picker/individual/SetIndividualHolder;->mOnSetListener:Lcom/android/wallpaper/picker/individual/SetIndividualHolder$OnSetListener;

    return-void
.end method


# virtual methods
.method public bindWallpaper(Lcom/android/wallpaper/model/WallpaperInfo;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/android/wallpaper/picker/individual/IndividualHolder;->bindWallpaper(Lcom/android/wallpaper/model/WallpaperInfo;)V

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    invoke-virtual {p1}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperId()Ljava/lang/String;

    move-result-object p1

    .line 3
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mActivity:Landroid/app/Activity;

    .line 4
    invoke-virtual {v1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 5
    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object v0

    .line 6
    invoke-interface {v0}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperRemoteId()Ljava/lang/String;

    move-result-object v0

    if-eqz p1, :cond_0

    .line 7
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-eqz p1, :cond_1

    .line 8
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/SetIndividualHolder;->mSelectionAnimator:Lcom/android/wallpaper/picker/individual/SelectionAnimator;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 9
    :cond_1
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/SetIndividualHolder;->mSelectionAnimator:Lcom/android/wallpaper/picker/individual/SelectionAnimator;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    :goto_1
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/SetIndividualHolder;->mTile:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/SetIndividualHolder;->setWallpaper()V

    return-void
.end method

.method public setSelectionState(I)V
    .locals 1

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/SetIndividualHolder;->mSelectionAnimator:Lcom/android/wallpaper/picker/individual/SelectionAnimator;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    if-nez p1, :cond_1

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/SetIndividualHolder;->mSelectionAnimator:Lcom/android/wallpaper/picker/individual/SelectionAnimator;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    .line 3
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/SetIndividualHolder;->mSelectionAnimator:Lcom/android/wallpaper/picker/individual/SelectionAnimator;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    :goto_0
    return-void
.end method

.method public setWallpaper()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/SetIndividualHolder;->mSelectionAnimator:Lcom/android/wallpaper/picker/individual/SelectionAnimator;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mBindingAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    const/4 v1, -0x1

    if-nez v0, :cond_0

    goto :goto_0

    .line 3
    :cond_0
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mOwnerRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    if-nez v0, :cond_1

    goto :goto_0

    .line 4
    :cond_1
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    if-nez v0, :cond_2

    goto :goto_0

    .line 5
    :cond_2
    iget-object v2, p0, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mOwnerRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2, p0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapterPositionInRecyclerView(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)I

    move-result v2

    if-ne v2, v1, :cond_3

    goto :goto_0

    .line 6
    :cond_3
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mBindingAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    if-ne v3, v0, :cond_4

    goto :goto_1

    :cond_4
    :goto_0
    move v2, v1

    .line 7
    :goto_1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/SetIndividualHolder;->mOnSetListener:Lcom/android/wallpaper/picker/individual/SetIndividualHolder$OnSetListener;

    check-cast v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter$1;

    .line 8
    iget-object v3, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter$1;->this$1:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;

    .line 9
    iget v4, v3, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->mPendingSelectedAdapterPosition:I

    const/4 v5, 0x0

    if-eq v4, v1, :cond_5

    .line 10
    iget-object v3, v3, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget-object v3, v3, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v3, v4}, Landroidx/recyclerview/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object v3

    .line 11
    instance-of v4, v3, Lcom/android/wallpaper/picker/individual/SelectableHolder;

    if-eqz v4, :cond_5

    .line 12
    check-cast v3, Lcom/android/wallpaper/picker/individual/SelectableHolder;

    invoke-interface {v3, v5}, Lcom/android/wallpaper/picker/individual/SelectableHolder;->setSelectionState(I)V

    .line 13
    :cond_5
    iget-object v3, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter$1;->this$1:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;

    .line 14
    iget v4, v3, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->mSelectedAdapterPosition:I

    if-eq v4, v1, :cond_6

    .line 15
    iget-object v1, v3, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget-object v1, v1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v4}, Landroidx/recyclerview/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object v1

    .line 16
    instance-of v3, v1, Lcom/android/wallpaper/picker/individual/SelectableHolder;

    if-eqz v3, :cond_6

    .line 17
    check-cast v1, Lcom/android/wallpaper/picker/individual/SelectableHolder;

    invoke-interface {v1, v5}, Lcom/android/wallpaper/picker/individual/SelectableHolder;->setSelectionState(I)V

    .line 18
    :cond_6
    iget-object v0, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter$1;->this$1:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;

    .line 19
    iput v2, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->mPendingSelectedAdapterPosition:I

    .line 20
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 21
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/SetIndividualHolder;->mSelectionAnimator:Lcom/android/wallpaper/picker/individual/SelectionAnimator;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v1

    .line 23
    invoke-interface {v1, v0}, Lcom/android/wallpaper/module/Injector;->getUserEventLogger(Landroid/content/Context;)Lcom/android/wallpaper/module/UserEventLogger;

    move-result-object v1

    .line 24
    iget-object v3, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v4, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v3, v4}, Lcom/android/wallpaper/model/WallpaperInfo;->getCollectionId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Lcom/android/wallpaper/module/UserEventLogger;->logIndividualWallpaperSelected(Ljava/lang/String;)V

    .line 25
    iget-object v3, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    invoke-virtual {v3, v0}, Lcom/android/wallpaper/model/WallpaperInfo;->getDesktopAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object v6

    .line 26
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v3

    invoke-interface {v3, v0}, Lcom/android/wallpaper/module/Injector;->getWallpaperPersister(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPersister;

    move-result-object v3

    .line 27
    iget-object v5, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    const/4 v7, 0x0

    const/high16 v8, 0x3f800000    # 1.0f

    const/4 v9, 0x2

    new-instance v10, Lcom/android/wallpaper/picker/individual/SetIndividualHolder$1;

    invoke-direct {v10, p0, v2, v1, v0}, Lcom/android/wallpaper/picker/individual/SetIndividualHolder$1;-><init>(Lcom/android/wallpaper/picker/individual/SetIndividualHolder;ILcom/android/wallpaper/module/UserEventLogger;Landroid/content/Context;)V

    move-object v4, v3

    check-cast v4, Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    invoke-virtual/range {v4 .. v10}, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->setIndividualWallpaper(Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/asset/Asset;Landroid/graphics/Rect;FILcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V

    return-void
.end method
