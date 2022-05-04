.class public Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySpanSizeLookup;
.super Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/picker/CategorySelectorFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "CategorySpanSizeLookup"
.end annotation


# instance fields
.field public mAdapter:Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;

.field public final synthetic this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/CategorySelectorFragment;Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;Lcom/android/wallpaper/picker/CategorySelectorFragment$1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySpanSizeLookup;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySpanSizeLookup;->mAdapter:Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;

    return-void
.end method


# virtual methods
.method public getSpanSize(I)I
    .locals 3

    const/4 v0, 0x2

    if-ltz p1, :cond_2

    .line 1
    iget-object v1, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySpanSizeLookup;->mAdapter:Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;

    invoke-virtual {v1, p1}, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;->getItemViewType(I)I

    move-result v1

    const/4 v2, 0x4

    if-eq v1, v2, :cond_2

    iget-object v1, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySpanSizeLookup;->mAdapter:Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;

    .line 2
    invoke-virtual {v1, p1}, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;->getItemViewType(I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    goto :goto_0

    .line 3
    :cond_0
    iget-object v1, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySpanSizeLookup;->mAdapter:Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;

    invoke-virtual {v1, p1}, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;->getItemViewType(I)I

    move-result p1

    if-ne p1, v0, :cond_1

    .line 4
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySpanSizeLookup;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    .line 5
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/CategorySelectorFragment;->getNumColumns()I

    move-result p0

    mul-int/2addr p0, v0

    .line 6
    div-int/2addr p0, v0

    return p0

    :cond_1
    return v0

    .line 7
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySpanSizeLookup;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    sget p1, Lcom/android/wallpaper/picker/CategorySelectorFragment;->$r8$clinit:I

    .line 8
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/CategorySelectorFragment;->getNumColumns()I

    move-result p0

    mul-int/2addr p0, v0

    return p0
.end method
