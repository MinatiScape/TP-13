.class public Landroidx/slice/widget/DisplayedListItems;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final mDisplayedItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/slice/widget/SliceContent;",
            ">;"
        }
    .end annotation
.end field

.field public final mHiddenItemCount:I


# direct methods
.method public constructor <init>(Ljava/util/List;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "displayedItems",
            "hiddenItemCount"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/slice/widget/SliceContent;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Landroidx/slice/widget/DisplayedListItems;->mDisplayedItems:Ljava/util/List;

    .line 3
    iput p2, p0, Landroidx/slice/widget/DisplayedListItems;->mHiddenItemCount:I

    return-void
.end method
