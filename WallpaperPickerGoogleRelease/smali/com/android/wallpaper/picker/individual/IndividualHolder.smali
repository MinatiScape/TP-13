.class public abstract Lcom/android/wallpaper/picker/individual/IndividualHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "SourceFile"


# instance fields
.field public mActivity:Landroid/app/Activity;

.field public mThumbnailView:Landroid/widget/ImageView;

.field public mTileLayout:Landroid/view/View;

.field public mTitleView:Landroid/widget/TextView;

.field public mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;


# direct methods
.method public constructor <init>(Landroid/app/Activity;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p3}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mActivity:Landroid/app/Activity;

    const p1, 0x7f0a0266

    .line 3
    invoke-virtual {p3, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mTileLayout:Landroid/view/View;

    const p1, 0x7f0a0264

    .line 4
    invoke-virtual {p3, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mThumbnailView:Landroid/widget/ImageView;

    const p1, 0x7f0a0192

    .line 5
    invoke-virtual {p3, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    const p1, 0x7f0a0269

    .line 6
    invoke-virtual {p3, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mTitleView:Landroid/widget/TextView;

    const p0, 0x7f0a0288

    .line 7
    invoke-virtual {p3, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    iput p2, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    return-void
.end method


# virtual methods
.method public bindWallpaper(Lcom/android/wallpaper/model/WallpaperInfo;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mActivity:Landroid/app/Activity;

    invoke-virtual {p1, v0}, Lcom/android/wallpaper/model/WallpaperInfo;->getTitle(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 3
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mActivity:Landroid/app/Activity;

    invoke-virtual {p1, v1}, Lcom/android/wallpaper/model/WallpaperInfo;->getAttributions(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    .line 4
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x0

    if-lez v2, :cond_0

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 5
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mTitleView:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mTitleView:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 7
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mTileLayout:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_1

    :cond_1
    if-eqz v1, :cond_2

    .line 8
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mTileLayout:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 9
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mActivity:Landroid/app/Activity;

    .line 10
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 11
    invoke-virtual {p1, v0}, Lcom/android/wallpaper/model/WallpaperInfo;->getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object p1

    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mActivity:Landroid/app/Activity;

    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mThumbnailView:Landroid/widget/ImageView;

    const v1, 0x1010530

    .line 12
    invoke-static {v0, v1}, Landroidx/transition/R$id;->getColorAttr(Landroid/content/Context;I)I

    move-result v1

    .line 13
    invoke-virtual {p1, v0, p0, v1}, Lcom/android/wallpaper/asset/Asset;->loadDrawable(Landroid/content/Context;Landroid/widget/ImageView;I)V

    return-void
.end method
