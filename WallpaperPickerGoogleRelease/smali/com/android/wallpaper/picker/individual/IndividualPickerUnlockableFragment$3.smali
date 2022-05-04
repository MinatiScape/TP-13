.class public Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$3;
.super Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;->setUpImageGrid()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

.field public final synthetic val$gridLayoutManager:Landroidx/recyclerview/widget/GridLayoutManager;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;Landroidx/recyclerview/widget/GridLayoutManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$3;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

    iput-object p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$3;->val$gridLayoutManager:Landroidx/recyclerview/widget/GridLayoutManager;

    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;-><init>()V

    return-void
.end method


# virtual methods
.method public getSpanSize(I)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$3;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

    iget-object v0, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mAdapter:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;

    invoke-virtual {v0, p1}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->getItemViewType(I)I

    move-result p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1

    const/4 v1, 0x2

    if-eq p1, v1, :cond_1

    const/4 v1, 0x3

    if-eq p1, v1, :cond_1

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    const/4 v0, 0x5

    if-eq p1, v0, :cond_0

    const/4 p0, -0x1

    return p0

    .line 2
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$3;->val$gridLayoutManager:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 3
    iget p0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    return p0

    :cond_1
    return v0
.end method
