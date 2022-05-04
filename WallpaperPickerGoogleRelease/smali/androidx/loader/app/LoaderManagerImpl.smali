.class public Landroidx/loader/app/LoaderManagerImpl;
.super Landroidx/loader/app/LoaderManager;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/loader/app/LoaderManagerImpl$LoaderViewModel;,
        Landroidx/loader/app/LoaderManagerImpl$LoaderInfo;
    }
.end annotation


# instance fields
.field public final mLifecycleOwner:Landroidx/lifecycle/LifecycleOwner;

.field public final mLoaderViewModel:Landroidx/loader/app/LoaderManagerImpl$LoaderViewModel;


# direct methods
.method public constructor <init>(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/ViewModelStore;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Landroidx/loader/app/LoaderManager;-><init>()V

    .line 2
    iput-object p1, p0, Landroidx/loader/app/LoaderManagerImpl;->mLifecycleOwner:Landroidx/lifecycle/LifecycleOwner;

    .line 3
    sget-object p1, Landroidx/loader/app/LoaderManagerImpl$LoaderViewModel;->FACTORY:Landroidx/lifecycle/ViewModelProvider$Factory;

    const-class v0, Landroidx/loader/app/LoaderManagerImpl$LoaderViewModel;

    .line 4
    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    const-string v2, "androidx.lifecycle.ViewModelProvider.DefaultKey:"

    .line 5
    invoke-static {v2, v1}, Landroidx/appcompat/view/SupportMenuInflater$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 6
    iget-object v2, p2, Landroidx/lifecycle/ViewModelStore;->mMap:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/lifecycle/ViewModel;

    .line 7
    invoke-virtual {v0, v2}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 8
    instance-of p2, p1, Landroidx/lifecycle/ViewModelProvider$OnRequeryFactory;

    if-eqz p2, :cond_2

    .line 9
    check-cast p1, Landroidx/lifecycle/ViewModelProvider$OnRequeryFactory;

    invoke-virtual {p1, v2}, Landroidx/lifecycle/ViewModelProvider$OnRequeryFactory;->onRequery(Landroidx/lifecycle/ViewModel;)V

    goto :goto_1

    .line 10
    :cond_0
    instance-of v2, p1, Landroidx/lifecycle/ViewModelProvider$KeyedFactory;

    if-eqz v2, :cond_1

    .line 11
    check-cast p1, Landroidx/lifecycle/ViewModelProvider$KeyedFactory;

    invoke-virtual {p1, v1, v0}, Landroidx/lifecycle/ViewModelProvider$KeyedFactory;->create(Ljava/lang/String;Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object p1

    goto :goto_0

    .line 12
    :cond_1
    check-cast p1, Landroidx/loader/app/LoaderManagerImpl$LoaderViewModel$1;

    invoke-virtual {p1, v0}, Landroidx/loader/app/LoaderManagerImpl$LoaderViewModel$1;->create(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object p1

    :goto_0
    move-object v2, p1

    .line 13
    iget-object p1, p2, Landroidx/lifecycle/ViewModelStore;->mMap:Ljava/util/HashMap;

    invoke-virtual {p1, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/lifecycle/ViewModel;

    if-eqz p1, :cond_2

    .line 14
    invoke-virtual {p1}, Landroidx/lifecycle/ViewModel;->onCleared()V

    .line 15
    :cond_2
    :goto_1
    check-cast v2, Landroidx/loader/app/LoaderManagerImpl$LoaderViewModel;

    .line 16
    iput-object v2, p0, Landroidx/loader/app/LoaderManagerImpl;->mLoaderViewModel:Landroidx/loader/app/LoaderManagerImpl$LoaderViewModel;

    return-void

    .line 17
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Local and anonymous classes can not be ViewModels"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static isLoggingEnabled(I)Z
    .locals 1

    const-string v0, "LoaderManager"

    .line 1
    invoke-static {v0, p0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method


# virtual methods
.method public dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/loader/app/LoaderManagerImpl;->mLoaderViewModel:Landroidx/loader/app/LoaderManagerImpl$LoaderViewModel;

    .line 2
    iget-object p2, p0, Landroidx/loader/app/LoaderManagerImpl$LoaderViewModel;->mLoaders:Landroidx/collection/SparseArrayCompat;

    .line 3
    iget p2, p2, Landroidx/collection/SparseArrayCompat;->mSize:I

    if-lez p2, :cond_1

    .line 4
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string p2, "Loaders:"

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const/4 p2, 0x0

    .line 5
    iget-object p4, p0, Landroidx/loader/app/LoaderManagerImpl$LoaderViewModel;->mLoaders:Landroidx/collection/SparseArrayCompat;

    .line 6
    iget v0, p4, Landroidx/collection/SparseArrayCompat;->mSize:I

    if-gtz v0, :cond_0

    goto :goto_0

    .line 7
    :cond_0
    iget-object p4, p4, Landroidx/collection/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    aget-object p4, p4, p2

    .line 8
    check-cast p4, Landroidx/loader/app/LoaderManagerImpl$LoaderInfo;

    .line 9
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string p1, "  #"

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object p0, p0, Landroidx/loader/app/LoaderManagerImpl$LoaderViewModel;->mLoaders:Landroidx/collection/SparseArrayCompat;

    .line 10
    iget-object p0, p0, Landroidx/collection/SparseArrayCompat;->mKeys:[I

    aget p0, p0, p2

    .line 11
    invoke-virtual {p3, p0}, Ljava/io/PrintWriter;->print(I)V

    const-string p0, ": "

    .line 12
    invoke-virtual {p3, p0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p4}, Landroidx/loader/app/LoaderManagerImpl$LoaderInfo;->toString()Ljava/lang/String;

    const/4 p0, 0x0

    throw p0

    :cond_1
    :goto_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v1, "LoaderManager{"

    .line 2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " in "

    .line 4
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 5
    iget-object v1, p0, Landroidx/loader/app/LoaderManagerImpl;->mLifecycleOwner:Landroidx/lifecycle/LifecycleOwner;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 6
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "{"

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 8
    iget-object p0, p0, Landroidx/loader/app/LoaderManagerImpl;->mLifecycleOwner:Landroidx/lifecycle/LifecycleOwner;

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "}}"

    .line 9
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 10
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
