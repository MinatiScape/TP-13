.class public Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$IndividualUnlockAdapter;
.super Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "IndividualUnlockAdapter"
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;Ljava/util/List;)V
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
    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$IndividualUnlockAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

    .line 2
    invoke-direct {p0, p1, p2}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;-><init>(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public final createTitleHolder(Landroid/view/ViewGroup;Z)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$IndividualUnlockAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p0

    const v0, 0x7f0d006f

    const/4 v1, 0x0

    .line 2
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    if-eqz p2, :cond_0

    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getPaddingStart()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingEnd()I

    move-result p2

    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    .line 5
    invoke-virtual {p0, p1, v1, p2, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 6
    :cond_0
    new-instance p1, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$UnlockAdditionalsHeaderHolder;

    invoke-direct {p1, p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$UnlockAdditionalsHeaderHolder;-><init>(Landroid/view/View;)V

    return-object p1
.end method

.method public getItemViewType(I)I
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->getItemViewType(I)I

    move-result v0

    .line 2
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$IndividualUnlockAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

    iget-object v1, v1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpapers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge p1, v1, :cond_1

    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$IndividualUnlockAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

    iget-object v1, v1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpapers:Ljava/util/List;

    .line 3
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$IndividualUnlockAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v1, p0}, Lcom/android/wallpaper/model/WallpaperInfo;->getCollectionId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "unlock_additionals_header"

    .line 4
    invoke-static {v1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_1

    if-nez p1, :cond_0

    const/4 p0, 0x5

    goto :goto_0

    :cond_0
    const/4 p0, 0x4

    :goto_0
    return p0

    :cond_1
    return v0
.end method

.method public onBindIndividualHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->onBindIndividualHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$IndividualUnlockAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

    invoke-virtual {v0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->shouldShowRotationTile()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$IndividualUnlockAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

    iget-object v0, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCategory:Lcom/android/wallpaper/model/WallpaperCategory;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    instance-of v0, v0, Lcom/android/wallpaper/model/DesktopCustomCategory;

    if-eqz v0, :cond_1

    :cond_0
    add-int/lit8 p2, p2, -0x1

    .line 4
    :cond_1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$IndividualUnlockAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

    iget-object v0, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpapers:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/android/wallpaper/model/WallpaperInfo;

    .line 5
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    .line 6
    iget-object v0, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mAppliedWallpaperIds:Ljava/util/Set;

    .line 7
    invoke-virtual {p2}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const v0, 0x7f0800ab

    .line 8
    instance-of p2, p2, Lcom/android/wallpaper/model/DownloadableLiveWallpaperInfo;

    invoke-virtual {p0, p1, v0, p2}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->showBadge(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;IZ)V

    :cond_2
    return-void
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 2

    .line 1
    invoke-virtual {p0, p2}, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$IndividualUnlockAdapter;->getItemViewType(I)I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 p0, 0x3

    if-eq v0, p0, :cond_0

    const/4 p0, 0x4

    if-eq v0, p0, :cond_3

    const/4 p0, 0x5

    if-eq v0, p0, :cond_3

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

    const-string p1, "IndividualPickerUnlockableFrgmnt"

    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 3
    :cond_0
    check-cast p1, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder;

    invoke-virtual {p1}, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder;->bind()V

    goto :goto_0

    .line 4
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$IndividualUnlockAdapter;->onBindIndividualHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V

    goto :goto_0

    .line 5
    :cond_2
    invoke-virtual {p0, p1, p2}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->onBindRotationHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V

    :cond_3
    :goto_0
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object v0

    if-nez v0, :cond_2

    const/4 v1, 0x4

    if-eq p2, v1, :cond_1

    const/4 v1, 0x5

    if-eq p2, v1, :cond_0

    .line 2
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "Unsupported viewType "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " in IndividualAdapter"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "IndividualPickerUnlockableFrgmnt"

    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    const/4 p2, 0x1

    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$IndividualUnlockAdapter;->createTitleHolder(Landroid/view/ViewGroup;Z)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object p0

    return-object p0

    :cond_1
    const/4 p2, 0x0

    .line 4
    invoke-virtual {p0, p1, p2}, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$IndividualUnlockAdapter;->createTitleHolder(Landroid/view/ViewGroup;Z)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object p0

    return-object p0

    :cond_2
    :goto_0
    return-object v0
.end method
