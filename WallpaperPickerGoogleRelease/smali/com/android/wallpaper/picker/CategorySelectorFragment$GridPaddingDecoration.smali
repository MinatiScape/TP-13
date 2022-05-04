.class public Lcom/android/wallpaper/picker/CategorySelectorFragment$GridPaddingDecoration;
.super Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/picker/CategorySelectorFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "GridPaddingDecoration"
.end annotation


# instance fields
.field public final mPadding:I

.field public final synthetic this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/CategorySelectorFragment;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$GridPaddingDecoration;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;-><init>()V

    .line 2
    iput p2, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$GridPaddingDecoration;->mPadding:I

    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
    .locals 0

    .line 1
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result p4

    add-int/lit8 p4, p4, 0x0

    if-ltz p4, :cond_0

    .line 2
    iget p4, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$GridPaddingDecoration;->mPadding:I

    iput p4, p1, Landroid/graphics/Rect;->left:I

    .line 3
    iput p4, p1, Landroid/graphics/Rect;->right:I

    .line 4
    :cond_0
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object p2

    .line 5
    instance-of p3, p2, Lcom/android/wallpaper/picker/CategorySelectorFragment$MyPhotosCategoryHolder;

    if-nez p3, :cond_2

    instance-of p2, p2, Lcom/android/wallpaper/picker/CategorySelectorFragment$FeaturedCategoryHolder;

    if-eqz p2, :cond_1

    goto :goto_0

    .line 6
    :cond_1
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$GridPaddingDecoration;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p2, 0x7f070103

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    goto :goto_1

    .line 7
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$GridPaddingDecoration;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p2, 0x7f070105

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    :goto_1
    return-void
.end method
