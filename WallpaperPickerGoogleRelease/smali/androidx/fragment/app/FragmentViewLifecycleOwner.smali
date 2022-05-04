.class public Landroidx/fragment/app/FragmentViewLifecycleOwner;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/savedstate/SavedStateRegistryOwner;


# instance fields
.field public mLifecycleRegistry:Landroidx/lifecycle/LifecycleRegistry;

.field public mSavedStateRegistryController:Landroidx/savedstate/SavedStateRegistryController;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Landroidx/fragment/app/FragmentViewLifecycleOwner;->mLifecycleRegistry:Landroidx/lifecycle/LifecycleRegistry;

    .line 3
    iput-object v0, p0, Landroidx/fragment/app/FragmentViewLifecycleOwner;->mSavedStateRegistryController:Landroidx/savedstate/SavedStateRegistryController;

    return-void
.end method


# virtual methods
.method public getLifecycle()Landroidx/lifecycle/Lifecycle;
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentViewLifecycleOwner;->mLifecycleRegistry:Landroidx/lifecycle/LifecycleRegistry;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Landroidx/lifecycle/LifecycleRegistry;

    const/4 v1, 0x1

    .line 3
    invoke-direct {v0, p0, v1}, Landroidx/lifecycle/LifecycleRegistry;-><init>(Landroidx/lifecycle/LifecycleOwner;Z)V

    .line 4
    iput-object v0, p0, Landroidx/fragment/app/FragmentViewLifecycleOwner;->mLifecycleRegistry:Landroidx/lifecycle/LifecycleRegistry;

    .line 5
    new-instance v0, Landroidx/savedstate/SavedStateRegistryController;

    invoke-direct {v0, p0}, Landroidx/savedstate/SavedStateRegistryController;-><init>(Landroidx/savedstate/SavedStateRegistryOwner;)V

    .line 6
    iput-object v0, p0, Landroidx/fragment/app/FragmentViewLifecycleOwner;->mSavedStateRegistryController:Landroidx/savedstate/SavedStateRegistryController;

    .line 7
    :cond_0
    iget-object p0, p0, Landroidx/fragment/app/FragmentViewLifecycleOwner;->mLifecycleRegistry:Landroidx/lifecycle/LifecycleRegistry;

    return-object p0
.end method

.method public getSavedStateRegistry()Landroidx/savedstate/SavedStateRegistry;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/FragmentViewLifecycleOwner;->mSavedStateRegistryController:Landroidx/savedstate/SavedStateRegistryController;

    .line 2
    iget-object p0, p0, Landroidx/savedstate/SavedStateRegistryController;->mRegistry:Landroidx/savedstate/SavedStateRegistry;

    return-object p0
.end method

.method public handleLifecycleEvent(Landroidx/lifecycle/Lifecycle$Event;)V
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/FragmentViewLifecycleOwner;->mLifecycleRegistry:Landroidx/lifecycle/LifecycleRegistry;

    const-string v0, "handleLifecycleEvent"

    .line 2
    invoke-virtual {p0, v0}, Landroidx/lifecycle/LifecycleRegistry;->enforceMainThreadIfNeeded(Ljava/lang/String;)V

    .line 3
    invoke-virtual {p1}, Landroidx/lifecycle/Lifecycle$Event;->getTargetState()Landroidx/lifecycle/Lifecycle$State;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/lifecycle/LifecycleRegistry;->moveToState(Landroidx/lifecycle/Lifecycle$State;)V

    return-void
.end method
