.class public Landroidx/fragment/app/Fragment$8;
.super Landroidx/fragment/app/Fragment$OnPreAttachedListener;
.source "SourceFile"


# instance fields
.field public final synthetic this$0:Landroidx/fragment/app/Fragment;

.field public final synthetic val$callback:Landroidx/activity/result/ActivityResultCallback;

.field public final synthetic val$contract:Landroidx/activity/result/contract/ActivityResultContract;

.field public final synthetic val$ref:Ljava/util/concurrent/atomic/AtomicReference;

.field public final synthetic val$registryProvider:Landroidx/arch/core/util/Function;


# direct methods
.method public constructor <init>(Landroidx/fragment/app/Fragment;Landroidx/arch/core/util/Function;Ljava/util/concurrent/atomic/AtomicReference;Landroidx/activity/result/contract/ActivityResultContract;Landroidx/activity/result/ActivityResultCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/fragment/app/Fragment$8;->this$0:Landroidx/fragment/app/Fragment;

    iput-object p2, p0, Landroidx/fragment/app/Fragment$8;->val$registryProvider:Landroidx/arch/core/util/Function;

    iput-object p3, p0, Landroidx/fragment/app/Fragment$8;->val$ref:Ljava/util/concurrent/atomic/AtomicReference;

    iput-object p4, p0, Landroidx/fragment/app/Fragment$8;->val$contract:Landroidx/activity/result/contract/ActivityResultContract;

    iput-object p5, p0, Landroidx/fragment/app/Fragment$8;->val$callback:Landroidx/activity/result/ActivityResultCallback;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Landroidx/fragment/app/Fragment$OnPreAttachedListener;-><init>(Landroidx/fragment/app/Fragment$1;)V

    return-void
.end method


# virtual methods
.method public onPreAttached()V
    .locals 9

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment$8;->this$0:Landroidx/fragment/app/Fragment;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "fragment_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v0, Landroidx/fragment/app/Fragment;->mWho:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "_rq#"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v0, Landroidx/fragment/app/Fragment;->mNextLocalRequestCode:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 3
    iget-object v1, p0, Landroidx/fragment/app/Fragment$8;->val$registryProvider:Landroidx/arch/core/util/Function;

    check-cast v1, Landroidx/fragment/app/Fragment$6;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    iget-object v1, v1, Landroidx/fragment/app/Fragment$6;->this$0:Landroidx/fragment/app/Fragment;

    iget-object v2, v1, Landroidx/fragment/app/Fragment;->mHost:Landroidx/fragment/app/FragmentHostCallback;

    instance-of v3, v2, Landroidx/activity/result/ActivityResultRegistryOwner;

    if-eqz v3, :cond_0

    .line 5
    check-cast v2, Landroidx/activity/result/ActivityResultRegistryOwner;

    invoke-interface {v2}, Landroidx/activity/result/ActivityResultRegistryOwner;->getActivityResultRegistry()Landroidx/activity/result/ActivityResultRegistry;

    move-result-object v1

    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    .line 7
    iget-object v1, v1, Landroidx/activity/ComponentActivity;->mActivityResultRegistry:Landroidx/activity/result/ActivityResultRegistry;

    .line 8
    :goto_0
    iget-object v2, p0, Landroidx/fragment/app/Fragment$8;->val$ref:Ljava/util/concurrent/atomic/AtomicReference;

    iget-object v3, p0, Landroidx/fragment/app/Fragment$8;->this$0:Landroidx/fragment/app/Fragment;

    iget-object v4, p0, Landroidx/fragment/app/Fragment$8;->val$contract:Landroidx/activity/result/contract/ActivityResultContract;

    iget-object p0, p0, Landroidx/fragment/app/Fragment$8;->val$callback:Landroidx/activity/result/ActivityResultCallback;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->getLifecycle()Landroidx/lifecycle/Lifecycle;

    move-result-object v5

    .line 10
    move-object v6, v5

    check-cast v6, Landroidx/lifecycle/LifecycleRegistry;

    .line 11
    iget-object v7, v6, Landroidx/lifecycle/LifecycleRegistry;->mState:Landroidx/lifecycle/Lifecycle$State;

    .line 12
    sget-object v8, Landroidx/lifecycle/Lifecycle$State;->STARTED:Landroidx/lifecycle/Lifecycle$State;

    .line 13
    invoke-virtual {v7, v8}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v7

    if-ltz v7, :cond_1

    const/4 v7, 0x1

    goto :goto_1

    :cond_1
    const/4 v7, 0x0

    :goto_1
    if-nez v7, :cond_3

    .line 14
    invoke-virtual {v1, v0}, Landroidx/activity/result/ActivityResultRegistry;->registerKey(Ljava/lang/String;)I

    move-result v3

    .line 15
    iget-object v6, v1, Landroidx/activity/result/ActivityResultRegistry;->mKeyToLifecycleContainers:Ljava/util/Map;

    invoke-interface {v6, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/activity/result/ActivityResultRegistry$LifecycleContainer;

    if-nez v6, :cond_2

    .line 16
    new-instance v6, Landroidx/activity/result/ActivityResultRegistry$LifecycleContainer;

    invoke-direct {v6, v5}, Landroidx/activity/result/ActivityResultRegistry$LifecycleContainer;-><init>(Landroidx/lifecycle/Lifecycle;)V

    .line 17
    :cond_2
    new-instance v5, Landroidx/activity/result/ActivityResultRegistry$1;

    invoke-direct {v5, v1, v0, p0, v4}, Landroidx/activity/result/ActivityResultRegistry$1;-><init>(Landroidx/activity/result/ActivityResultRegistry;Ljava/lang/String;Landroidx/activity/result/ActivityResultCallback;Landroidx/activity/result/contract/ActivityResultContract;)V

    .line 18
    iget-object p0, v6, Landroidx/activity/result/ActivityResultRegistry$LifecycleContainer;->mLifecycle:Landroidx/lifecycle/Lifecycle;

    invoke-virtual {p0, v5}, Landroidx/lifecycle/Lifecycle;->addObserver(Landroidx/lifecycle/LifecycleObserver;)V

    .line 19
    iget-object p0, v6, Landroidx/activity/result/ActivityResultRegistry$LifecycleContainer;->mObservers:Ljava/util/ArrayList;

    invoke-virtual {p0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    iget-object p0, v1, Landroidx/activity/result/ActivityResultRegistry;->mKeyToLifecycleContainers:Ljava/util/Map;

    invoke-interface {p0, v0, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    new-instance p0, Landroidx/activity/result/ActivityResultRegistry$2;

    invoke-direct {p0, v1, v3, v4, v0}, Landroidx/activity/result/ActivityResultRegistry$2;-><init>(Landroidx/activity/result/ActivityResultRegistry;ILandroidx/activity/result/contract/ActivityResultContract;Ljava/lang/String;)V

    .line 22
    invoke-virtual {v2, p0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    return-void

    .line 23
    :cond_3
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "LifecycleOwner "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " is attempting to register while current state is "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    iget-object v1, v6, Landroidx/lifecycle/LifecycleRegistry;->mState:Landroidx/lifecycle/Lifecycle$State;

    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ". LifecycleOwners must call register before they are STARTED."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
