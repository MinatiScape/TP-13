.class public abstract Lcom/android/wallpaper/picker/AppbarFragment;
.super Lcom/android/wallpaper/picker/BottomActionBarFragment;
.source "SourceFile"

# interfaces
.implements Landroid/widget/Toolbar$OnMenuItemClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/picker/AppbarFragment$AppbarFragmentHost;
    }
.end annotation


# instance fields
.field public mHost:Lcom/android/wallpaper/picker/AppbarFragment$AppbarFragmentHost;

.field public mTitleView:Landroid/widget/TextView;

.field public mToolbar:Landroid/widget/Toolbar;

.field public mUpArrowEnabled:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/picker/BottomActionBarFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public getDefaultTitle()Ljava/lang/CharSequence;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getToolbarColorId()I
    .locals 0

    const p0, 0x7f0600ef

    return p0
.end method

.method public getToolbarId()I
    .locals 0

    const p0, 0x7f0a026d

    return p0
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    .line 2
    check-cast p1, Lcom/android/wallpaper/picker/AppbarFragment$AppbarFragmentHost;

    iput-object p1, p0, Lcom/android/wallpaper/picker/AppbarFragment;->mHost:Lcom/android/wallpaper/picker/AppbarFragment$AppbarFragmentHost;

    return-void
.end method

.method public onBottomActionBarReady(Lcom/android/wallpaper/widget/BottomActionBar;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/wallpaper/picker/AppbarFragment;->mUpArrowEnabled:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/wallpaper/picker/AppbarFragment;->mHost:Lcom/android/wallpaper/picker/AppbarFragment$AppbarFragmentHost;

    invoke-interface {v0}, Lcom/android/wallpaper/picker/AppbarFragment$AppbarFragmentHost;->isUpArrowSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x8

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const v1, 0x7f0a0034

    .line 2
    invoke-virtual {p1, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 3
    iput-object p1, p0, Lcom/android/wallpaper/picker/BottomActionBarFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    .line 5
    invoke-virtual {p1, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Lcom/android/wallpaper/picker/AppbarFragment$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/picker/AppbarFragment$$ExternalSyntheticLambda0;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/AppbarFragment;->mToolbar:Landroid/widget/Toolbar;

    if-nez v0, :cond_0

    return-void

    .line 2
    :cond_0
    iget-object v1, p0, Lcom/android/wallpaper/picker/AppbarFragment;->mTitleView:Landroid/widget/TextView;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 3
    invoke-virtual {v0, v2}, Landroid/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/picker/AppbarFragment;->mTitleView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 5
    :cond_1
    invoke-virtual {v0, p1}, Landroid/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 6
    :goto_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 7
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_1

    :cond_2
    move-object p1, v2

    :goto_1
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    :cond_3
    return-void
.end method

.method public setUpToolbar(Landroid/view/View;Z)V
    .locals 2

    .line 1
    iput-boolean p2, p0, Lcom/android/wallpaper/picker/AppbarFragment;->mUpArrowEnabled:Z

    .line 2
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/AppbarFragment;->getToolbarId()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Toolbar;

    iput-object p1, p0, Lcom/android/wallpaper/picker/AppbarFragment;->mToolbar:Landroid/widget/Toolbar;

    const v0, 0x7f0a00c1

    .line 3
    invoke-virtual {p1, v0}, Landroid/widget/Toolbar;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/android/wallpaper/picker/AppbarFragment;->mTitleView:Landroid/widget/TextView;

    .line 4
    iget-object p1, p0, Lcom/android/wallpaper/picker/AppbarFragment;->mToolbar:Landroid/widget/Toolbar;

    invoke-virtual {p0}, Lcom/android/wallpaper/picker/AppbarFragment;->getToolbarColorId()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/Toolbar;->setBackgroundResource(I)V

    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    .line 6
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/wallpaper/picker/AppbarFragment;->getToolbarColorId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    .line 7
    invoke-virtual {p1, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 8
    iget-object p1, p0, Landroidx/fragment/app/Fragment;->mArguments:Landroid/os/Bundle;

    if-eqz p1, :cond_0

    .line 9
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/AppbarFragment;->getDefaultTitle()Ljava/lang/CharSequence;

    move-result-object v0

    const-string v1, "ToolbarFragment.title"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/AppbarFragment;->getDefaultTitle()Ljava/lang/CharSequence;

    move-result-object p1

    .line 11
    :goto_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 12
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/AppbarFragment;->setTitle(Ljava/lang/CharSequence;)V

    :cond_1
    if-eqz p2, :cond_2

    .line 13
    iget-object p1, p0, Lcom/android/wallpaper/picker/AppbarFragment;->mHost:Lcom/android/wallpaper/picker/AppbarFragment$AppbarFragmentHost;

    invoke-interface {p1}, Lcom/android/wallpaper/picker/AppbarFragment$AppbarFragmentHost;->isUpArrowSupported()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 14
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0800cf

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/content/res/Resources;->getDrawable(ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 15
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    const/4 p2, 0x1

    .line 16
    invoke-virtual {p1, p2}, Landroid/graphics/drawable/Drawable;->setAutoMirrored(Z)V

    .line 17
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    const v0, 0x1010036

    invoke-static {p2, v0}, Landroidx/transition/R$id;->getColorAttr(Landroid/content/Context;I)I

    move-result p2

    .line 18
    invoke-virtual {p1, p2}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 19
    iget-object p2, p0, Lcom/android/wallpaper/picker/AppbarFragment;->mToolbar:Landroid/widget/Toolbar;

    invoke-virtual {p2, p1}, Landroid/widget/Toolbar;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    .line 20
    iget-object p1, p0, Lcom/android/wallpaper/picker/AppbarFragment;->mToolbar:Landroid/widget/Toolbar;

    const p2, 0x7f11003f

    invoke-virtual {p1, p2}, Landroid/widget/Toolbar;->setNavigationContentDescription(I)V

    .line 21
    iget-object p1, p0, Lcom/android/wallpaper/picker/AppbarFragment;->mToolbar:Landroid/widget/Toolbar;

    new-instance p2, Lcom/android/wallpaper/picker/AppbarFragment$$ExternalSyntheticLambda0;

    invoke-direct {p2, p0}, Lcom/android/wallpaper/picker/AppbarFragment$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/AppbarFragment;)V

    invoke-virtual {p1, p2}, Landroid/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_2
    return-void
.end method

.method public setUpToolbarMenu(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/AppbarFragment;->mToolbar:Landroid/widget/Toolbar;

    invoke-virtual {v0, p1}, Landroid/widget/Toolbar;->inflateMenu(I)V

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/picker/AppbarFragment;->mToolbar:Landroid/widget/Toolbar;

    invoke-virtual {p1, p0}, Landroid/widget/Toolbar;->setOnMenuItemClickListener(Landroid/widget/Toolbar$OnMenuItemClickListener;)V

    return-void
.end method
