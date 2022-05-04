.class public Landroidx/lifecycle/ViewModelProvider;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/lifecycle/ViewModelProvider$AndroidViewModelFactory;,
        Landroidx/lifecycle/ViewModelProvider$NewInstanceFactory;,
        Landroidx/lifecycle/ViewModelProvider$KeyedFactory;,
        Landroidx/lifecycle/ViewModelProvider$OnRequeryFactory;,
        Landroidx/lifecycle/ViewModelProvider$Factory;
    }
.end annotation


# instance fields
.field public final mFactory:Landroidx/lifecycle/ViewModelProvider$Factory;

.field public final mViewModelStore:Landroidx/lifecycle/ViewModelStore;


# direct methods
.method public constructor <init>(Landroidx/lifecycle/ViewModelStore;Landroidx/lifecycle/ViewModelProvider$Factory;)V
    .locals 0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    iput-object p2, p0, Landroidx/lifecycle/ViewModelProvider;->mFactory:Landroidx/lifecycle/ViewModelProvider$Factory;

    .line 6
    iput-object p1, p0, Landroidx/lifecycle/ViewModelProvider;->mViewModelStore:Landroidx/lifecycle/ViewModelStore;

    return-void
.end method

.method public constructor <init>(Landroidx/lifecycle/ViewModelStoreOwner;)V
    .locals 1

    .line 1
    check-cast p1, Landroidx/activity/ComponentActivity;

    invoke-virtual {p1}, Landroidx/activity/ComponentActivity;->getViewModelStore()Landroidx/lifecycle/ViewModelStore;

    move-result-object v0

    .line 2
    invoke-interface {p1}, Landroidx/lifecycle/HasDefaultViewModelProviderFactory;->getDefaultViewModelProviderFactory()Landroidx/lifecycle/ViewModelProvider$Factory;

    move-result-object p1

    .line 3
    invoke-direct {p0, v0, p1}, Landroidx/lifecycle/ViewModelProvider;-><init>(Landroidx/lifecycle/ViewModelStore;Landroidx/lifecycle/ViewModelProvider$Factory;)V

    return-void
.end method


# virtual methods
.method public get(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroidx/lifecycle/ViewModel;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    const-string v1, "androidx.lifecycle.ViewModelProvider.DefaultKey:"

    .line 2
    invoke-static {v1, v0}, Landroidx/appcompat/view/SupportMenuInflater$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3
    iget-object v1, p0, Landroidx/lifecycle/ViewModelProvider;->mViewModelStore:Landroidx/lifecycle/ViewModelStore;

    .line 4
    iget-object v1, v1, Landroidx/lifecycle/ViewModelStore;->mMap:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/lifecycle/ViewModel;

    .line 5
    invoke-virtual {p1, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 6
    iget-object p0, p0, Landroidx/lifecycle/ViewModelProvider;->mFactory:Landroidx/lifecycle/ViewModelProvider$Factory;

    instance-of p1, p0, Landroidx/lifecycle/ViewModelProvider$OnRequeryFactory;

    if-eqz p1, :cond_2

    .line 7
    check-cast p0, Landroidx/lifecycle/ViewModelProvider$OnRequeryFactory;

    invoke-virtual {p0, v1}, Landroidx/lifecycle/ViewModelProvider$OnRequeryFactory;->onRequery(Landroidx/lifecycle/ViewModel;)V

    goto :goto_1

    .line 8
    :cond_0
    iget-object v1, p0, Landroidx/lifecycle/ViewModelProvider;->mFactory:Landroidx/lifecycle/ViewModelProvider$Factory;

    instance-of v2, v1, Landroidx/lifecycle/ViewModelProvider$KeyedFactory;

    if-eqz v2, :cond_1

    .line 9
    check-cast v1, Landroidx/lifecycle/ViewModelProvider$KeyedFactory;

    invoke-virtual {v1, v0, p1}, Landroidx/lifecycle/ViewModelProvider$KeyedFactory;->create(Ljava/lang/String;Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object p1

    goto :goto_0

    .line 10
    :cond_1
    invoke-interface {v1, p1}, Landroidx/lifecycle/ViewModelProvider$Factory;->create(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object p1

    :goto_0
    move-object v1, p1

    .line 11
    iget-object p0, p0, Landroidx/lifecycle/ViewModelProvider;->mViewModelStore:Landroidx/lifecycle/ViewModelStore;

    .line 12
    iget-object p0, p0, Landroidx/lifecycle/ViewModelStore;->mMap:Ljava/util/HashMap;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/lifecycle/ViewModel;

    if-eqz p0, :cond_2

    .line 13
    invoke-virtual {p0}, Landroidx/lifecycle/ViewModel;->onCleared()V

    :cond_2
    :goto_1
    return-object v1

    .line 14
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Local and anonymous classes can not be ViewModels"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
