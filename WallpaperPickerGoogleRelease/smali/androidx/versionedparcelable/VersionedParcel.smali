.class public abstract Landroidx/versionedparcelable/VersionedParcel;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final mParcelizerCache:Landroidx/collection/SimpleArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/SimpleArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation
.end field

.field public final mReadCache:Landroidx/collection/SimpleArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/SimpleArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Method;",
            ">;"
        }
    .end annotation
.end field

.field public final mWriteCache:Landroidx/collection/SimpleArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/SimpleArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Method;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/collection/SimpleArrayMap;Landroidx/collection/SimpleArrayMap;Landroidx/collection/SimpleArrayMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/collection/SimpleArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Method;",
            ">;",
            "Landroidx/collection/SimpleArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Method;",
            ">;",
            "Landroidx/collection/SimpleArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "*>;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Landroidx/versionedparcelable/VersionedParcel;->mReadCache:Landroidx/collection/SimpleArrayMap;

    .line 3
    iput-object p2, p0, Landroidx/versionedparcelable/VersionedParcel;->mWriteCache:Landroidx/collection/SimpleArrayMap;

    .line 4
    iput-object p3, p0, Landroidx/versionedparcelable/VersionedParcel;->mParcelizerCache:Landroidx/collection/SimpleArrayMap;

    return-void
.end method


# virtual methods
.method public abstract closeField()V
.end method

.method public abstract createSubParcel()Landroidx/versionedparcelable/VersionedParcel;
.end method

.method public final findParcelClass(Ljava/lang/Class;)Ljava/lang/Class;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/versionedparcelable/VersionedParcel;->mParcelizerCache:Landroidx/collection/SimpleArrayMap;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    .line 2
    invoke-virtual {v0, v1, v2}, Landroidx/collection/SimpleArrayMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 3
    check-cast v0, Ljava/lang/Class;

    if-nez v0, :cond_0

    .line 4
    invoke-virtual {p1}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const/4 v0, 0x1

    .line 5
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v0

    const-string v0, "%s.%sParcelizer"

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 6
    invoke-virtual {p1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-static {v0, v2, v1}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    .line 7
    iget-object p0, p0, Landroidx/versionedparcelable/VersionedParcel;->mParcelizerCache:Landroidx/collection/SimpleArrayMap;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, v0}, Landroidx/collection/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method public final getReadMethod(Ljava/lang/String;)Ljava/lang/reflect/Method;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 1
    const-class v0, Landroidx/versionedparcelable/VersionedParcel;

    iget-object v1, p0, Landroidx/versionedparcelable/VersionedParcel;->mReadCache:Landroidx/collection/SimpleArrayMap;

    const/4 v2, 0x0

    .line 2
    invoke-virtual {v1, p1, v2}, Landroidx/collection/SimpleArrayMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 3
    check-cast v1, Ljava/lang/reflect/Method;

    if-nez v1, :cond_0

    .line 4
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {p1, v2, v1}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const-string v0, "read"

    .line 5
    invoke-virtual {v1, v0, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 6
    iget-object p0, p0, Landroidx/versionedparcelable/VersionedParcel;->mReadCache:Landroidx/collection/SimpleArrayMap;

    invoke-virtual {p0, p1, v1}, Landroidx/collection/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v1
.end method

.method public final getWriteMethod(Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/versionedparcelable/VersionedParcel;->mWriteCache:Landroidx/collection/SimpleArrayMap;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    .line 2
    invoke-virtual {v0, v1, v2}, Landroidx/collection/SimpleArrayMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 3
    check-cast v0, Ljava/lang/reflect/Method;

    if-nez v0, :cond_0

    .line 4
    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->findParcelClass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Class;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    .line 5
    const-class v3, Landroidx/versionedparcelable/VersionedParcel;

    aput-object v3, v1, v2

    const-string v2, "write"

    invoke-virtual {v0, v2, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 6
    iget-object p0, p0, Landroidx/versionedparcelable/VersionedParcel;->mWriteCache:Landroidx/collection/SimpleArrayMap;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, v0}, Landroidx/collection/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method public readArray([Ljava/lang/Object;I)[Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;I)[TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->readField(I)Z

    move-result p2

    if-nez p2, :cond_0

    return-object p1

    .line 2
    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readInt()I

    move-result p2

    const/4 v0, 0x0

    if-gez p2, :cond_1

    goto/16 :goto_7

    .line 3
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p2}, Ljava/util/ArrayList;-><init>(I)V

    if-eqz p2, :cond_9

    .line 4
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readInt()I

    move-result v2

    if-gez p2, :cond_2

    goto/16 :goto_7

    :cond_2
    const/4 v3, 0x1

    if-eq v2, v3, :cond_8

    const/4 v3, 0x2

    if-eq v2, v3, :cond_7

    const/4 v3, 0x3

    if-eq v2, v3, :cond_5

    const/4 v0, 0x4

    if-eq v2, v0, :cond_4

    const/4 v0, 0x5

    if-eq v2, v0, :cond_3

    goto/16 :goto_6

    :cond_3
    :goto_0
    if-lez p2, :cond_9

    .line 5
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 p2, p2, -0x1

    goto :goto_0

    :cond_4
    :goto_1
    if-lez p2, :cond_9

    .line 6
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 p2, p2, -0x1

    goto :goto_1

    :cond_5
    :goto_2
    if-lez p2, :cond_9

    const-string v2, ")"

    const-string v3, "Unable to read Serializable object (name = "

    .line 7
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readString()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_6

    move-object v5, v0

    goto :goto_3

    .line 8
    :cond_6
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readByteArray()[B

    move-result-object v5

    .line 9
    new-instance v6, Ljava/io/ByteArrayInputStream;

    invoke-direct {v6, v5}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 10
    :try_start_0
    new-instance v5, Landroidx/versionedparcelable/VersionedParcel$1;

    invoke-direct {v5, p0, v6}, Landroidx/versionedparcelable/VersionedParcel$1;-><init>(Landroidx/versionedparcelable/VersionedParcel;Ljava/io/InputStream;)V

    .line 11
    invoke-virtual {v5}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/io/Serializable;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    :goto_3
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 p2, p2, -0x1

    goto :goto_2

    :catch_0
    move-exception p0

    .line 13
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-static {v3, v4, v2}, Landroidx/concurrent/futures/AbstractResolvableFuture$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    :catch_1
    move-exception p0

    .line 14
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-static {v3, v4, v2}, Landroidx/concurrent/futures/AbstractResolvableFuture$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    :cond_7
    :goto_4
    if-lez p2, :cond_9

    .line 15
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readParcelable()Landroid/os/Parcelable;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 p2, p2, -0x1

    goto :goto_4

    :cond_8
    :goto_5
    if-lez p2, :cond_9

    .line 16
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readVersionedParcelable()Landroidx/versionedparcelable/VersionedParcelable;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 p2, p2, -0x1

    goto :goto_5

    .line 17
    :cond_9
    :goto_6
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    :goto_7
    return-object v0
.end method

.method public abstract readBoolean()Z
.end method

.method public abstract readBundle()Landroid/os/Bundle;
.end method

.method public abstract readByteArray()[B
.end method

.method public abstract readCharSequence()Ljava/lang/CharSequence;
.end method

.method public abstract readField(I)Z
.end method

.method public abstract readInt()I
.end method

.method public readInt(II)I
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->readField(I)Z

    move-result p2

    if-nez p2, :cond_0

    return p1

    .line 2
    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readInt()I

    move-result p0

    return p0
.end method

.method public abstract readLong()J
.end method

.method public abstract readParcelable()Landroid/os/Parcelable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroid/os/Parcelable;",
            ">()TT;"
        }
    .end annotation
.end method

.method public readParcelable(Landroid/os/Parcelable;I)Landroid/os/Parcelable;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroid/os/Parcelable;",
            ">(TT;I)TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->readField(I)Z

    move-result p2

    if-nez p2, :cond_0

    return-object p1

    .line 2
    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readParcelable()Landroid/os/Parcelable;

    move-result-object p0

    return-object p0
.end method

.method public abstract readString()Ljava/lang/String;
.end method

.method public readString(Ljava/lang/String;I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->readField(I)Z

    move-result p2

    if-nez p2, :cond_0

    return-object p1

    .line 2
    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public abstract readStrongBinder()Landroid/os/IBinder;
.end method

.method public readVersionedParcelable()Landroidx/versionedparcelable/VersionedParcelable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroidx/versionedparcelable/VersionedParcelable;",
            ">()TT;"
        }
    .end annotation

    .line 3
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 4
    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->createSubParcel()Landroidx/versionedparcelable/VersionedParcel;

    move-result-object v2

    .line 5
    :try_start_0
    invoke-virtual {p0, v0}, Landroidx/versionedparcelable/VersionedParcel;->getReadMethod(Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object p0

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v2, v0, v3

    .line 6
    invoke-virtual {p0, v1, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/versionedparcelable/VersionedParcelable;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 7
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :catch_1
    move-exception p0

    .line 8
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :catch_2
    move-exception p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 10
    instance-of v1, v0, Ljava/lang/RuntimeException;

    if-nez v1, :cond_2

    .line 11
    instance-of v1, v0, Ljava/lang/Error;

    if-eqz v1, :cond_1

    .line 12
    check-cast v0, Ljava/lang/Error;

    throw v0

    .line 13
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 14
    :cond_2
    check-cast v0, Ljava/lang/RuntimeException;

    throw v0

    :catch_3
    move-exception p0

    .line 15
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public readVersionedParcelable(Landroidx/versionedparcelable/VersionedParcelable;I)Landroidx/versionedparcelable/VersionedParcelable;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroidx/versionedparcelable/VersionedParcelable;",
            ">(TT;I)TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->readField(I)Z

    move-result p2

    if-nez p2, :cond_0

    return-object p1

    .line 2
    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readVersionedParcelable()Landroidx/versionedparcelable/VersionedParcelable;

    move-result-object p0

    return-object p0
.end method

.method public abstract setOutputField(I)V
.end method

.method public writeArray([Ljava/lang/Object;I)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;I)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->setOutputField(I)V

    if-nez p1, :cond_0

    const/4 p1, -0x1

    .line 2
    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    goto/16 :goto_7

    .line 3
    :cond_0
    array-length p2, p1

    .line 4
    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    if-lez p2, :cond_e

    const/4 v0, 0x0

    .line 5
    aget-object v1, p1, v0

    .line 6
    instance-of v2, v1, Ljava/lang/String;

    const/4 v3, 0x5

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x4

    const/4 v7, 0x1

    if-eqz v2, :cond_1

    move v1, v6

    goto :goto_0

    .line 7
    :cond_1
    instance-of v2, v1, Landroid/os/Parcelable;

    if-eqz v2, :cond_2

    move v1, v5

    goto :goto_0

    .line 8
    :cond_2
    instance-of v2, v1, Landroidx/versionedparcelable/VersionedParcelable;

    if-eqz v2, :cond_3

    move v1, v7

    goto :goto_0

    .line 9
    :cond_3
    instance-of v2, v1, Ljava/io/Serializable;

    if-eqz v2, :cond_4

    move v1, v4

    goto :goto_0

    .line 10
    :cond_4
    instance-of v2, v1, Landroid/os/IBinder;

    if-eqz v2, :cond_5

    move v1, v3

    goto :goto_0

    .line 11
    :cond_5
    instance-of v2, v1, Ljava/lang/Integer;

    if-eqz v2, :cond_6

    const/4 v1, 0x7

    goto :goto_0

    .line 12
    :cond_6
    instance-of v2, v1, Ljava/lang/Float;

    if-eqz v2, :cond_d

    const/16 v1, 0x8

    .line 13
    :goto_0
    invoke-virtual {p0, v1}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    if-eq v1, v7, :cond_c

    if-eq v1, v5, :cond_b

    if-eq v1, v4, :cond_9

    if-eq v1, v6, :cond_8

    if-eq v1, v3, :cond_7

    goto/16 :goto_7

    :cond_7
    :goto_1
    if-ge v0, p2, :cond_e

    .line 14
    aget-object v1, p1, v0

    check-cast v1, Landroid/os/IBinder;

    invoke-virtual {p0, v1}, Landroidx/versionedparcelable/VersionedParcel;->writeStrongBinder(Landroid/os/IBinder;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_8
    :goto_2
    if-ge v0, p2, :cond_e

    .line 15
    aget-object v1, p1, v0

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v1}, Landroidx/versionedparcelable/VersionedParcel;->writeString(Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_9
    :goto_3
    if-ge v0, p2, :cond_e

    .line 16
    aget-object v1, p1, v0

    check-cast v1, Ljava/io/Serializable;

    if-nez v1, :cond_a

    const/4 v1, 0x0

    .line 17
    invoke-virtual {p0, v1}, Landroidx/versionedparcelable/VersionedParcel;->writeString(Ljava/lang/String;)V

    goto :goto_4

    .line 18
    :cond_a
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    .line 19
    invoke-virtual {p0, v2}, Landroidx/versionedparcelable/VersionedParcel;->writeString(Ljava/lang/String;)V

    .line 20
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 21
    :try_start_0
    new-instance v4, Ljava/io/ObjectOutputStream;

    invoke-direct {v4, v3}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 22
    invoke-virtual {v4, v1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 23
    invoke-virtual {v4}, Ljava/io/ObjectOutputStream;->close()V

    .line 24
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    invoke-virtual {p0, v1}, Landroidx/versionedparcelable/VersionedParcel;->writeByteArray([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :catch_0
    move-exception p0

    .line 25
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "VersionedParcelable encountered IOException writing serializable object (name = "

    const-string v0, ")"

    invoke-static {p2, v2, v0}, Landroidx/concurrent/futures/AbstractResolvableFuture$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    :cond_b
    :goto_5
    if-ge v0, p2, :cond_e

    .line 26
    aget-object v1, p1, v0

    check-cast v1, Landroid/os/Parcelable;

    invoke-virtual {p0, v1}, Landroidx/versionedparcelable/VersionedParcel;->writeParcelable(Landroid/os/Parcelable;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_c
    :goto_6
    if-ge v0, p2, :cond_e

    .line 27
    aget-object v1, p1, v0

    check-cast v1, Landroidx/versionedparcelable/VersionedParcelable;

    invoke-virtual {p0, v1}, Landroidx/versionedparcelable/VersionedParcel;->writeVersionedParcelable(Landroidx/versionedparcelable/VersionedParcelable;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 28
    :cond_d
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " cannot be VersionedParcelled"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_e
    :goto_7
    return-void
.end method

.method public abstract writeBoolean(Z)V
.end method

.method public abstract writeBundle(Landroid/os/Bundle;)V
.end method

.method public abstract writeByteArray([B)V
.end method

.method public abstract writeCharSequence(Ljava/lang/CharSequence;)V
.end method

.method public abstract writeInt(I)V
.end method

.method public abstract writeLong(J)V
.end method

.method public abstract writeParcelable(Landroid/os/Parcelable;)V
.end method

.method public abstract writeString(Ljava/lang/String;)V
.end method

.method public abstract writeStrongBinder(Landroid/os/IBinder;)V
.end method

.method public writeVersionedParcelable(Landroidx/versionedparcelable/VersionedParcelable;)V
    .locals 4

    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 1
    invoke-virtual {p0, v0}, Landroidx/versionedparcelable/VersionedParcel;->writeString(Ljava/lang/String;)V

    return-void

    .line 2
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroidx/versionedparcelable/VersionedParcel;->findParcelClass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_4

    .line 3
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroidx/versionedparcelable/VersionedParcel;->writeString(Ljava/lang/String;)V

    .line 4
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->createSubParcel()Landroidx/versionedparcelable/VersionedParcel;

    move-result-object v1

    .line 5
    :try_start_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroidx/versionedparcelable/VersionedParcel;->getWriteMethod(Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 p1, 0x1

    aput-object v1, v2, p1

    .line 6
    invoke-virtual {p0, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    .line 7
    invoke-virtual {v1}, Landroidx/versionedparcelable/VersionedParcel;->closeField()V

    return-void

    :catch_0
    move-exception p0

    .line 8
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :catch_1
    move-exception p0

    .line 9
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :catch_2
    move-exception p0

    .line 10
    invoke-virtual {p0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    .line 11
    instance-of v0, p1, Ljava/lang/RuntimeException;

    if-nez v0, :cond_2

    .line 12
    instance-of v0, p1, Ljava/lang/Error;

    if-eqz v0, :cond_1

    .line 13
    check-cast p1, Ljava/lang/Error;

    throw p1

    .line 14
    :cond_1
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    .line 15
    :cond_2
    check-cast p1, Ljava/lang/RuntimeException;

    throw p1

    :catch_3
    move-exception p0

    .line 16
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :catch_4
    move-exception p0

    .line 17
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " does not have a Parcelizer"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method
