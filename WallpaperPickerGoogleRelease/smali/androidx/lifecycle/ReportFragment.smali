.class public Landroidx/lifecycle/ReportFragment;
.super Landroid/app/Fragment;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/lifecycle/ReportFragment$LifecycleCallbacks;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method

.method public static dispatch(Landroid/app/Activity;Landroidx/lifecycle/Lifecycle$Event;)V
    .locals 2

    .line 1
    instance-of v0, p0, Landroidx/lifecycle/LifecycleRegistryOwner;

    const-string v1, "handleLifecycleEvent"

    if-eqz v0, :cond_0

    .line 2
    check-cast p0, Landroidx/lifecycle/LifecycleRegistryOwner;

    invoke-interface {p0}, Landroidx/lifecycle/LifecycleRegistryOwner;->getLifecycle()Landroidx/lifecycle/LifecycleRegistry;

    move-result-object p0

    .line 3
    invoke-virtual {p0, v1}, Landroidx/lifecycle/LifecycleRegistry;->enforceMainThreadIfNeeded(Ljava/lang/String;)V

    .line 4
    invoke-virtual {p1}, Landroidx/lifecycle/Lifecycle$Event;->getTargetState()Landroidx/lifecycle/Lifecycle$State;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/lifecycle/LifecycleRegistry;->moveToState(Landroidx/lifecycle/Lifecycle$State;)V

    return-void

    .line 5
    :cond_0
    instance-of v0, p0, Landroidx/lifecycle/LifecycleOwner;

    if-eqz v0, :cond_1

    .line 6
    check-cast p0, Landroidx/lifecycle/LifecycleOwner;

    invoke-interface {p0}, Landroidx/lifecycle/LifecycleOwner;->getLifecycle()Landroidx/lifecycle/Lifecycle;

    move-result-object p0

    .line 7
    instance-of v0, p0, Landroidx/lifecycle/LifecycleRegistry;

    if-eqz v0, :cond_1

    .line 8
    check-cast p0, Landroidx/lifecycle/LifecycleRegistry;

    .line 9
    invoke-virtual {p0, v1}, Landroidx/lifecycle/LifecycleRegistry;->enforceMainThreadIfNeeded(Ljava/lang/String;)V

    .line 10
    invoke-virtual {p1}, Landroidx/lifecycle/Lifecycle$Event;->getTargetState()Landroidx/lifecycle/Lifecycle$State;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/lifecycle/LifecycleRegistry;->moveToState(Landroidx/lifecycle/Lifecycle$State;)V

    :cond_1
    return-void
.end method

.method public static injectIfNeededIn(Landroid/app/Activity;)V
    .locals 3

    .line 1
    invoke-static {p0}, Landroidx/lifecycle/ReportFragment$LifecycleCallbacks;->registerIn(Landroid/app/Activity;)V

    .line 2
    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    const-string v0, "androidx.lifecycle.LifecycleDispatcher.report_fragment_tag"

    .line 3
    invoke-virtual {p0, v0}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v1

    if-nez v1, :cond_0

    .line 4
    invoke-virtual {p0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    new-instance v2, Landroidx/lifecycle/ReportFragment;

    invoke-direct {v2}, Landroidx/lifecycle/ReportFragment;-><init>()V

    invoke-virtual {v1, v2, v0}, Landroid/app/FragmentTransaction;->add(Landroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commit()I

    .line 5
    invoke-virtual {p0}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    :cond_0
    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    return-void
.end method

.method public onDestroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Fragment;->onDestroy()V

    return-void
.end method

.method public onPause()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Fragment;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Fragment;->onResume()V

    return-void
.end method

.method public onStart()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Fragment;->onStart()V

    return-void
.end method

.method public onStop()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Fragment;->onStop()V

    return-void
.end method
