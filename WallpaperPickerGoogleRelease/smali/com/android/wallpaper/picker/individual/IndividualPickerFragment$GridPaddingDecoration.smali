.class public Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$GridPaddingDecoration;
.super Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "GridPaddingDecoration"
.end annotation


# instance fields
.field public final mPaddingBottom:I

.field public final mPaddingHorizontal:I


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;-><init>()V

    .line 2
    iput p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$GridPaddingDecoration;->mPaddingHorizontal:I

    .line 3
    iput p3, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$GridPaddingDecoration;->mPaddingBottom:I

    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
    .locals 0

    .line 1
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result p2

    if-ltz p2, :cond_0

    .line 2
    iget p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$GridPaddingDecoration;->mPaddingHorizontal:I

    iput p2, p1, Landroid/graphics/Rect;->left:I

    .line 3
    iput p2, p1, Landroid/graphics/Rect;->right:I

    .line 4
    iget p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$GridPaddingDecoration;->mPaddingBottom:I

    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    :cond_0
    return-void
.end method
