.class public Landroidx/fragment/app/FragmentAnim;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/fragment/app/FragmentAnim$EndViewTransitionAnimation;,
        Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;
    }
.end annotation


# direct methods
.method public static loadAnimation(Landroid/content/Context;Landroidx/fragment/app/Fragment;Z)Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;
    .locals 6

    .line 1
    iget-object v0, p1, Landroidx/fragment/app/Fragment;->mAnimationInfo:Landroidx/fragment/app/Fragment$AnimationInfo;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    .line 2
    :cond_0
    iget v0, v0, Landroidx/fragment/app/Fragment$AnimationInfo;->mNextTransition:I

    .line 3
    :goto_0
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getNextAnim()I

    move-result v2

    .line 4
    invoke-virtual {p1, v1}, Landroidx/fragment/app/Fragment;->setNextAnim(I)V

    .line 5
    iget-object v3, p1, Landroidx/fragment/app/Fragment;->mContainer:Landroid/view/ViewGroup;

    const/4 v4, 0x0

    if-eqz v3, :cond_1

    const v5, 0x7f0a0287

    .line 6
    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 7
    iget-object v3, p1, Landroidx/fragment/app/Fragment;->mContainer:Landroid/view/ViewGroup;

    invoke-virtual {v3, v5, v4}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 8
    :cond_1
    iget-object p1, p1, Landroidx/fragment/app/Fragment;->mContainer:Landroid/view/ViewGroup;

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object p1

    if-eqz p1, :cond_2

    return-object v4

    :cond_2
    if-nez v2, :cond_9

    if-eqz v0, :cond_9

    const/16 p1, 0x1001

    if-eq v0, p1, :cond_7

    const/16 p1, 0x1003

    if-eq v0, p1, :cond_5

    const/16 p1, 0x2002

    if-eq v0, p1, :cond_3

    const/4 p1, -0x1

    goto :goto_1

    :cond_3
    if-eqz p2, :cond_4

    const p1, 0x7f020003

    goto :goto_1

    :cond_4
    const p1, 0x7f020004

    goto :goto_1

    :cond_5
    if-eqz p2, :cond_6

    const p1, 0x7f020005

    goto :goto_1

    :cond_6
    const p1, 0x7f020006

    goto :goto_1

    :cond_7
    if-eqz p2, :cond_8

    const p1, 0x7f020007

    goto :goto_1

    :cond_8
    const p1, 0x7f020008

    :goto_1
    move v2, p1

    :cond_9
    if-eqz v2, :cond_d

    .line 9
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getResourceTypeName(I)Ljava/lang/String;

    move-result-object p1

    const-string p2, "anim"

    .line 10
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b

    .line 11
    :try_start_0
    invoke-static {p0, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object p2

    if-eqz p2, :cond_a

    .line 12
    new-instance v0, Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;

    invoke-direct {v0, p2}, Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;-><init>(Landroid/view/animation/Animation;)V
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    return-object v0

    :cond_a
    const/4 v1, 0x1

    goto :goto_2

    :catch_0
    move-exception p0

    .line 13
    throw p0

    :catch_1
    :cond_b
    :goto_2
    if-nez v1, :cond_d

    .line 14
    :try_start_1
    invoke-static {p0, v2}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    move-result-object p2

    if-eqz p2, :cond_d

    .line 15
    new-instance v0, Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;

    invoke-direct {v0, p2}, Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;-><init>(Landroid/animation/Animator;)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_2

    return-object v0

    :catch_2
    move-exception p2

    if-nez p1, :cond_c

    .line 16
    invoke-static {p0, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object p0

    if-eqz p0, :cond_d

    .line 17
    new-instance p1, Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;

    invoke-direct {p1, p0}, Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;-><init>(Landroid/view/animation/Animation;)V

    return-object p1

    .line 18
    :cond_c
    throw p2

    :cond_d
    return-object v4
.end method
