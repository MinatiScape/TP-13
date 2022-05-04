.class public Lcom/android/wallpaper/widget/WallpaperInfoView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public mExploreButton:Landroid/widget/Button;

.field public mSubtitle1:Landroid/widget/TextView;

.field public mSubtitle2:Landroid/widget/TextView;

.field public mTitle:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    const v0, 0x7f0a028f

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/wallpaper/widget/WallpaperInfoView;->mTitle:Landroid/widget/TextView;

    const v0, 0x7f0a028d

    .line 3
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/wallpaper/widget/WallpaperInfoView;->mSubtitle1:Landroid/widget/TextView;

    const v0, 0x7f0a028e

    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/wallpaper/widget/WallpaperInfoView;->mSubtitle2:Landroid/widget/TextView;

    const v0, 0x7f0a028c

    .line 5
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/android/wallpaper/widget/WallpaperInfoView;->mExploreButton:Landroid/widget/Button;

    return-void
.end method
