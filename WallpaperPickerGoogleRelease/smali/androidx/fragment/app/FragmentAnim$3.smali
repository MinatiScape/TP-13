.class public Landroidx/fragment/app/FragmentAnim$3;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# instance fields
.field public final synthetic val$callback:Landroidx/fragment/app/FragmentTransition$Callback;

.field public final synthetic val$container:Landroid/view/ViewGroup;

.field public final synthetic val$fragment:Landroidx/fragment/app/Fragment;

.field public final synthetic val$signal:Landroidx/core/os/CancellationSignal;

.field public final synthetic val$viewToAnimate:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Landroid/view/View;Landroidx/fragment/app/Fragment;Landroidx/fragment/app/FragmentTransition$Callback;Landroidx/core/os/CancellationSignal;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/fragment/app/FragmentAnim$3;->val$container:Landroid/view/ViewGroup;

    iput-object p2, p0, Landroidx/fragment/app/FragmentAnim$3;->val$viewToAnimate:Landroid/view/View;

    iput-object p3, p0, Landroidx/fragment/app/FragmentAnim$3;->val$fragment:Landroidx/fragment/app/Fragment;

    iput-object p4, p0, Landroidx/fragment/app/FragmentAnim$3;->val$callback:Landroidx/fragment/app/FragmentTransition$Callback;

    iput-object p5, p0, Landroidx/fragment/app/FragmentAnim$3;->val$signal:Landroidx/core/os/CancellationSignal;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object p1, p0, Landroidx/fragment/app/FragmentAnim$3;->val$container:Landroid/view/ViewGroup;

    iget-object v0, p0, Landroidx/fragment/app/FragmentAnim$3;->val$viewToAnimate:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->endViewTransition(Landroid/view/View;)V

    .line 2
    iget-object p1, p0, Landroidx/fragment/app/FragmentAnim$3;->val$fragment:Landroidx/fragment/app/Fragment;

    .line 3
    iget-object v0, p1, Landroidx/fragment/app/Fragment;->mAnimationInfo:Landroidx/fragment/app/Fragment$AnimationInfo;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move-object v0, v1

    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, v0, Landroidx/fragment/app/Fragment$AnimationInfo;->mAnimator:Landroid/animation/Animator;

    .line 5
    :goto_0
    invoke-virtual {p1, v1}, Landroidx/fragment/app/Fragment;->setAnimator(Landroid/animation/Animator;)V

    if-eqz v0, :cond_1

    .line 6
    iget-object p1, p0, Landroidx/fragment/app/FragmentAnim$3;->val$container:Landroid/view/ViewGroup;

    iget-object v0, p0, Landroidx/fragment/app/FragmentAnim$3;->val$viewToAnimate:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result p1

    if-gez p1, :cond_1

    .line 7
    iget-object p1, p0, Landroidx/fragment/app/FragmentAnim$3;->val$callback:Landroidx/fragment/app/FragmentTransition$Callback;

    iget-object v0, p0, Landroidx/fragment/app/FragmentAnim$3;->val$fragment:Landroidx/fragment/app/Fragment;

    iget-object p0, p0, Landroidx/fragment/app/FragmentAnim$3;->val$signal:Landroidx/core/os/CancellationSignal;

    check-cast p1, Landroidx/fragment/app/FragmentManager$2;

    invoke-virtual {p1, v0, p0}, Landroidx/fragment/app/FragmentManager$2;->onComplete(Landroidx/fragment/app/Fragment;Landroidx/core/os/CancellationSignal;)V

    :cond_1
    return-void
.end method
