.class public Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/picker/CategorySelectorFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "CategoryAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
        ">;",
        "Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;"
    }
.end annotation


# instance fields
.field public mCategories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/Category;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/CategorySelectorFragment;Ljava/util/List;Lcom/android/wallpaper/picker/CategorySelectorFragment$1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;->mCategories:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;->mCategories:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x0

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    .line 3
    iget-boolean p0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mAwaitingCategories:Z

    if-eqz p0, :cond_0

    add-int/lit8 v0, v0, 0x1

    :cond_0
    return v0
.end method

.method public getItemViewType(I)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    .line 2
    iget-boolean v0, v0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mAwaitingCategories:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 3
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;->getItemCount()I

    move-result v0

    sub-int/2addr v0, v1

    if-ne p1, v0, :cond_0

    const/4 p0, 0x4

    return p0

    :cond_0
    if-nez p1, :cond_1

    return v1

    .line 4
    :cond_1
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    .line 5
    iget-boolean p0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mIsFeaturedCollectionAvailable:Z

    if-eqz p0, :cond_3

    const/4 p0, 0x2

    if-eq p1, v1, :cond_2

    if-ne p1, p0, :cond_3

    :cond_2
    return p0

    :cond_3
    const/4 p0, 0x3

    return p0
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 2

    .line 1
    invoke-virtual {p0, p2}, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;->getItemViewType(I)I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    const/4 p0, 0x4

    if-eq v0, p0, :cond_1

    .line 2
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "Unsupported viewType "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " in CategoryAdapter"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "CategorySelectorFragment"

    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 3
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;->mCategories:Ljava/util/List;

    add-int/lit8 p2, p2, 0x0

    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/wallpaper/model/Category;

    .line 4
    check-cast p1, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;

    .line 5
    iput-object p0, p1, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->mCategory:Lcom/android/wallpaper/model/Category;

    .line 6
    iget-object p2, p1, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->mTitleView:Landroid/widget/TextView;

    .line 7
    iget-object p0, p0, Lcom/android/wallpaper/model/Category;->mTitle:Ljava/lang/String;

    .line 8
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 9
    invoke-virtual {p1}, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->drawThumbnailAndOverlayIcon()V

    :cond_1
    :goto_0
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x1

    const v2, 0x7f0d006a

    const/4 v3, 0x0

    if-eq p2, v1, :cond_3

    const/4 v1, 0x2

    if-eq p2, v1, :cond_2

    const/4 v1, 0x3

    if-eq p2, v1, :cond_1

    const/4 v1, 0x4

    const/4 v2, 0x0

    if-eq p2, v1, :cond_0

    .line 2
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "Unsupported viewType "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " in CategoryAdapter"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "CategorySelectorFragment"

    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v2

    :cond_0
    const p2, 0x7f0d006c

    .line 3
    invoke-virtual {v0, p2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 4
    new-instance p2, Lcom/android/wallpaper/picker/CategorySelectorFragment$LoadingIndicatorHolder;

    iget-object p0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    invoke-direct {p2, p0, p1, v2}, Lcom/android/wallpaper/picker/CategorySelectorFragment$LoadingIndicatorHolder;-><init>(Lcom/android/wallpaper/picker/CategorySelectorFragment;Landroid/view/View;Lcom/android/wallpaper/picker/CategorySelectorFragment$1;)V

    return-object p2

    .line 5
    :cond_1
    invoke-virtual {v0, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 6
    new-instance p2, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;

    iget-object p0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    invoke-direct {p2, p0, p1}, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;-><init>(Lcom/android/wallpaper/picker/CategorySelectorFragment;Landroid/view/View;)V

    return-object p2

    .line 7
    :cond_2
    invoke-virtual {v0, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 8
    new-instance p2, Lcom/android/wallpaper/picker/CategorySelectorFragment$FeaturedCategoryHolder;

    iget-object p0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    invoke-direct {p2, p0, p1}, Lcom/android/wallpaper/picker/CategorySelectorFragment$FeaturedCategoryHolder;-><init>(Lcom/android/wallpaper/picker/CategorySelectorFragment;Landroid/view/View;)V

    return-object p2

    .line 9
    :cond_3
    invoke-virtual {v0, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 10
    new-instance p2, Lcom/android/wallpaper/picker/CategorySelectorFragment$MyPhotosCategoryHolder;

    iget-object p0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    invoke-direct {p2, p0, p1}, Lcom/android/wallpaper/picker/CategorySelectorFragment$MyPhotosCategoryHolder;-><init>(Lcom/android/wallpaper/picker/CategorySelectorFragment;Landroid/view/View;)V

    return-object p2
.end method

.method public onPermissionsDenied(Z)V
    .locals 3

    if-nez p1, :cond_0

    return-void

    .line 1
    :cond_0
    iget-object p1, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    const v0, 0x7f110100

    .line 2
    invoke-virtual {p1, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 3
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f1200fe

    invoke-direct {v0, v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    .line 4
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const v0, 0x104000a

    const/4 v1, 0x0

    .line 5
    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const v0, 0x7f11011a

    new-instance v1, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;)V

    .line 6
    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 8
    invoke-virtual {p0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method public onPermissionsGranted()V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$Adapter;->mObservable:Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;->notifyChanged()V

    return-void
.end method
