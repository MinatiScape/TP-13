.class public Lcom/android/wallpaper/picker/CategorySelectorFragment$FeaturedCategoryHolder;
.super Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/picker/CategorySelectorFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "FeaturedCategoryHolder"
.end annotation


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/CategorySelectorFragment;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;-><init>(Lcom/android/wallpaper/picker/CategorySelectorFragment;Landroid/view/View;)V

    const p0, 0x7f0a0080

    .line 2
    invoke-virtual {p2, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroidx/cardview/widget/CardView;

    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    .line 4
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/android/wallpaper/util/SizeCalculator;->getFeaturedCategoryTileSize(Landroid/app/Activity;)Landroid/graphics/Point;

    move-result-object v0

    iget v0, v0, Landroid/graphics/Point;->y:I

    iput v0, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 5
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0700fb

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {p0, p1}, Landroidx/cardview/widget/CardView;->setRadius(F)V

    return-void
.end method
