.class public abstract Lcom/google/common/reflect/ClassPath$Scanner;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/reflect/ClassPath;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Scanner"
.end annotation


# instance fields
.field public final scannedUris:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 3
    iput-object v0, p0, Lcom/google/common/reflect/ClassPath$Scanner;->scannedUris:Ljava/util/Set;

    return-void
.end method

.method public static getClassPathEntries(Ljava/lang/ClassLoader;)Lcom/google/common/collect/ImmutableMap;
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "classloader"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ClassLoader;",
            ")",
            "Lcom/google/common/collect/ImmutableMap<",
            "Ljava/io/File;",
            "Ljava/lang/ClassLoader;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 2
    invoke-virtual {p0}, Ljava/lang/ClassLoader;->getParent()Ljava/lang/ClassLoader;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 3
    invoke-static {v1}, Lcom/google/common/reflect/ClassPath$Scanner;->getClassPathEntries(Ljava/lang/ClassLoader;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->putAll(Ljava/util/Map;)V

    .line 4
    :cond_0
    instance-of v1, p0, Ljava/net/URLClassLoader;

    if-eqz v1, :cond_2

    .line 5
    move-object v1, p0

    check-cast v1, Ljava/net/URLClassLoader;

    invoke-virtual {v1}, Ljava/net/URLClassLoader;->getURLs()[Ljava/net/URL;

    move-result-object v1

    sget-object v2, Lcom/google/common/collect/ImmutableList;->EMPTY_ITR:Lcom/google/common/collect/AbstractIndexedListIterator;

    .line 6
    array-length v2, v1

    if-nez v2, :cond_1

    .line 7
    sget-object v1, Lcom/google/common/collect/RegularImmutableList;->EMPTY:Lcom/google/common/collect/ImmutableList;

    goto :goto_0

    .line 8
    :cond_1
    invoke-virtual {v1}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    invoke-static {v1}, Lcom/google/common/collect/ImmutableList;->construct([Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    goto :goto_0

    .line 9
    :cond_2
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 10
    invoke-static {}, Lcom/google/common/reflect/ClassPath$Scanner;->parseJavaClassPath()Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    goto :goto_0

    .line 11
    :cond_3
    sget-object v1, Lcom/google/common/collect/ImmutableList;->EMPTY_ITR:Lcom/google/common/collect/AbstractIndexedListIterator;

    .line 12
    sget-object v1, Lcom/google/common/collect/RegularImmutableList;->EMPTY:Lcom/google/common/collect/ImmutableList;

    .line 13
    :goto_0
    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableList;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object v1

    :cond_4
    :goto_1
    move-object v2, v1

    check-cast v2, Lcom/google/common/collect/AbstractIndexedListIterator;

    invoke-virtual {v2}, Lcom/google/common/collect/AbstractIndexedListIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/URL;

    .line 14
    invoke-virtual {v2}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v3

    const-string v4, "file"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 15
    invoke-static {v2}, Lcom/google/common/reflect/ClassPath;->toFile(Ljava/net/URL;)Ljava/io/File;

    move-result-object v2

    .line 16
    invoke-virtual {v0, v2}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 17
    invoke-virtual {v0, v2, p0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 18
    :cond_5
    instance-of p0, v0, Lcom/google/common/collect/ImmutableMap;

    if-eqz p0, :cond_6

    instance-of p0, v0, Ljava/util/SortedMap;

    if-nez p0, :cond_6

    .line 19
    move-object p0, v0

    check-cast p0, Lcom/google/common/collect/ImmutableMap;

    .line 20
    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableMap;->isPartialView()Z

    move-result v1

    if-nez v1, :cond_6

    goto :goto_3

    .line 21
    :cond_6
    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object p0

    .line 22
    instance-of v0, p0, Ljava/util/Collection;

    if-eqz v0, :cond_7

    .line 23
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v0

    goto :goto_2

    :cond_7
    const/4 v0, 0x4

    .line 24
    :goto_2
    new-instance v1, Lcom/google/common/collect/ImmutableMap$Builder;

    invoke-direct {v1, v0}, Lcom/google/common/collect/ImmutableMap$Builder;-><init>(I)V

    .line 25
    invoke-virtual {v1, p0}, Lcom/google/common/collect/ImmutableMap$Builder;->putAll(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableMap$Builder;

    .line 26
    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableMap$Builder;->build()Lcom/google/common/collect/ImmutableMap;

    move-result-object p0

    :goto_3
    return-object p0
.end method

.method public static getClassPathEntry(Ljava/io/File;Ljava/lang/String;)Ljava/net/URL;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "jarFile",
            "path"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/net/URL;

    invoke-virtual {p0}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getClassPathFromManifest(Ljava/io/File;Ljava/util/jar/Manifest;)Lcom/google/common/collect/ImmutableSet;
    .locals 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "jarFile",
            "manifest"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ljava/util/jar/Manifest;",
            ")",
            "Lcom/google/common/collect/ImmutableSet<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    if-nez p1, :cond_0

    .line 1
    sget p0, Lcom/google/common/collect/ImmutableSet;->$r8$clinit:I

    .line 2
    sget-object p0, Lcom/google/common/collect/RegularImmutableSet;->EMPTY:Lcom/google/common/collect/RegularImmutableSet;

    return-object p0

    .line 3
    :cond_0
    sget v0, Lcom/google/common/collect/ImmutableSet;->$r8$clinit:I

    .line 4
    new-instance v0, Lcom/google/common/collect/ImmutableSet$Builder;

    invoke-direct {v0}, Lcom/google/common/collect/ImmutableSet$Builder;-><init>()V

    .line 5
    invoke-virtual {p1}, Ljava/util/jar/Manifest;->getMainAttributes()Ljava/util/jar/Attributes;

    move-result-object p1

    sget-object v1, Ljava/util/jar/Attributes$Name;->CLASS_PATH:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v1}, Ljava/util/jar/Attributes$Name;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/util/jar/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 6
    sget-object v1, Lcom/google/common/reflect/ClassPath;->CLASS_PATH_ATTRIBUTE_SEPARATOR:Lcom/google/common/base/Splitter;

    .line 7
    invoke-virtual {v1, p1}, Lcom/google/common/base/Splitter;->split(Ljava/lang/CharSequence;)Ljava/lang/Iterable;

    move-result-object p1

    check-cast p1, Lcom/google/common/base/Splitter$5;

    invoke-virtual {p1}, Lcom/google/common/base/Splitter$5;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 8
    :try_start_0
    invoke-static {p0, v1}, Lcom/google/common/reflect/ClassPath$Scanner;->getClassPathEntry(Ljava/io/File;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v1
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    invoke-virtual {v1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v2

    const-string v3, "file"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 10
    invoke-static {v1}, Lcom/google/common/reflect/ClassPath;->toFile(Ljava/net/URL;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;

    goto :goto_0

    .line 11
    :catch_0
    sget-object v2, Lcom/google/common/reflect/ClassPath;->logger:Ljava/util/logging/Logger;

    .line 12
    sget-object v3, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v4, "Invalid Class-Path entry: "

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_2

    invoke-virtual {v4, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :cond_2
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v4}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_1
    const-string v4, "com.google.common.reflect.ClassPath$Scanner"

    const-string v5, "getClassPathFromManifest"

    invoke-virtual {v2, v3, v4, v5, v1}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 13
    :cond_3
    iget p0, v0, Lcom/google/common/collect/ImmutableCollection$ArrayBasedBuilder;->size:I

    if-eqz p0, :cond_8

    const/4 p1, 0x0

    const/4 v1, 0x1

    if-eq p0, v1, :cond_7

    .line 14
    iget-object v2, v0, Lcom/google/common/collect/ImmutableSet$Builder;->hashTable:[Ljava/lang/Object;

    if-eqz v2, :cond_6

    invoke-static {p0}, Lcom/google/common/collect/ImmutableSet;->chooseTableSize(I)I

    move-result p0

    iget-object v2, v0, Lcom/google/common/collect/ImmutableSet$Builder;->hashTable:[Ljava/lang/Object;

    array-length v2, v2

    if-ne p0, v2, :cond_6

    .line 15
    iget p0, v0, Lcom/google/common/collect/ImmutableCollection$ArrayBasedBuilder;->size:I

    iget-object v2, v0, Lcom/google/common/collect/ImmutableCollection$ArrayBasedBuilder;->contents:[Ljava/lang/Object;

    array-length v3, v2

    shr-int/lit8 v4, v3, 0x1

    shr-int/lit8 v3, v3, 0x2

    add-int/2addr v4, v3

    if-ge p0, v4, :cond_4

    move p1, v1

    :cond_4
    if-eqz p1, :cond_5

    invoke-static {v2, p0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v2

    :cond_5
    move-object v4, v2

    .line 16
    new-instance p0, Lcom/google/common/collect/RegularImmutableSet;

    iget v5, v0, Lcom/google/common/collect/ImmutableSet$Builder;->hashCode:I

    iget-object v6, v0, Lcom/google/common/collect/ImmutableSet$Builder;->hashTable:[Ljava/lang/Object;

    array-length p1, v6

    add-int/lit8 v7, p1, -0x1

    iget v8, v0, Lcom/google/common/collect/ImmutableCollection$ArrayBasedBuilder;->size:I

    move-object v3, p0

    invoke-direct/range {v3 .. v8}, Lcom/google/common/collect/RegularImmutableSet;-><init>([Ljava/lang/Object;I[Ljava/lang/Object;II)V

    goto :goto_2

    .line 17
    :cond_6
    iget p0, v0, Lcom/google/common/collect/ImmutableCollection$ArrayBasedBuilder;->size:I

    iget-object p1, v0, Lcom/google/common/collect/ImmutableCollection$ArrayBasedBuilder;->contents:[Ljava/lang/Object;

    .line 18
    invoke-static {p0, p1}, Lcom/google/common/collect/ImmutableSet;->construct(I[Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet;

    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ljava/util/AbstractCollection;->size()I

    move-result p1

    iput p1, v0, Lcom/google/common/collect/ImmutableCollection$ArrayBasedBuilder;->size:I

    .line 20
    :goto_2
    iput-boolean v1, v0, Lcom/google/common/collect/ImmutableCollection$ArrayBasedBuilder;->forceCopy:Z

    const/4 p1, 0x0

    .line 21
    iput-object p1, v0, Lcom/google/common/collect/ImmutableSet$Builder;->hashTable:[Ljava/lang/Object;

    goto :goto_3

    .line 22
    :cond_7
    iget-object p0, v0, Lcom/google/common/collect/ImmutableCollection$ArrayBasedBuilder;->contents:[Ljava/lang/Object;

    aget-object p0, p0, p1

    sget p1, Lcom/google/common/collect/ImmutableSet;->$r8$clinit:I

    .line 23
    new-instance p1, Lcom/google/common/collect/SingletonImmutableSet;

    invoke-direct {p1, p0}, Lcom/google/common/collect/SingletonImmutableSet;-><init>(Ljava/lang/Object;)V

    move-object p0, p1

    goto :goto_3

    .line 24
    :cond_8
    sget p0, Lcom/google/common/collect/ImmutableSet;->$r8$clinit:I

    .line 25
    sget-object p0, Lcom/google/common/collect/RegularImmutableSet;->EMPTY:Lcom/google/common/collect/RegularImmutableSet;

    :goto_3
    return-object p0
.end method

.method public static parseJavaClassPath()Lcom/google/common/collect/ImmutableList;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/net/URL;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/google/common/collect/ImmutableList;->EMPTY_ITR:Lcom/google/common/collect/AbstractIndexedListIterator;

    const/4 v0, 0x4

    const-string v1, "initialCapacity"

    .line 2
    invoke-static {v0, v1}, Lcom/google/common/collect/CollectPreconditions;->checkNonnegative(ILjava/lang/String;)I

    new-array v0, v0, [Ljava/lang/Object;

    .line 3
    sget-object v1, Lcom/google/common/base/StandardSystemProperty;->PATH_SEPARATOR:Lcom/google/common/base/StandardSystemProperty;

    invoke-virtual {v1}, Lcom/google/common/base/StandardSystemProperty;->value()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/base/Splitter;->on(Ljava/lang/String;)Lcom/google/common/base/Splitter;

    move-result-object v1

    sget-object v2, Lcom/google/common/base/StandardSystemProperty;->JAVA_CLASS_PATH:Lcom/google/common/base/StandardSystemProperty;

    invoke-virtual {v2}, Lcom/google/common/base/StandardSystemProperty;->value()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/common/base/Splitter;->split(Ljava/lang/CharSequence;)Ljava/lang/Iterable;

    move-result-object v1

    check-cast v1, Lcom/google/common/base/Splitter$5;

    invoke-virtual {v1}, Lcom/google/common/base/Splitter$5;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 4
    :try_start_0
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v4
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_3

    .line 5
    :try_start_1
    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v5, v2, 0x1

    .line 6
    array-length v6, v0

    if-ge v6, v5, :cond_0

    .line 7
    array-length v6, v0

    .line 8
    invoke-static {v6, v5}, Lcom/google/common/collect/ImmutableCollection$Builder;->expandedCapacity(II)I

    move-result v6

    invoke-static {v0, v6}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_2

    .line 9
    :cond_0
    :try_start_2
    aput-object v4, v0, v2
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_0

    :goto_1
    move v2, v5

    goto :goto_0

    :catch_0
    move-exception v2

    goto :goto_4

    :catch_1
    move v2, v5

    goto :goto_2

    :catch_2
    move-exception v4

    goto :goto_3

    :catch_3
    move-exception v4

    goto :goto_5

    .line 10
    :catch_4
    :goto_2
    :try_start_3
    new-instance v4, Ljava/net/URL;

    const-string v5, "file"

    const/4 v6, 0x0

    new-instance v7, Ljava/io/File;

    invoke-direct {v7, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v4, v5, v6, v7}, Ljava/net/URL;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/net/MalformedURLException; {:try_start_3 .. :try_end_3} :catch_3

    add-int/lit8 v5, v2, 0x1

    .line 11
    :try_start_4
    array-length v6, v0

    if-ge v6, v5, :cond_1

    .line 12
    array-length v6, v0

    .line 13
    invoke-static {v6, v5}, Lcom/google/common/collect/ImmutableCollection$Builder;->expandedCapacity(II)I

    move-result v6

    invoke-static {v0, v6}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0
    :try_end_4
    .catch Ljava/net/MalformedURLException; {:try_start_4 .. :try_end_4} :catch_2

    .line 14
    :cond_1
    :try_start_5
    aput-object v4, v0, v2
    :try_end_5
    .catch Ljava/net/MalformedURLException; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_1

    :goto_3
    move v5, v2

    move-object v2, v4

    :goto_4
    move-object v9, v2

    move v2, v5

    goto :goto_6

    :goto_5
    move-object v9, v4

    .line 15
    :goto_6
    sget-object v4, Lcom/google/common/reflect/ClassPath;->logger:Ljava/util/logging/Logger;

    .line 16
    sget-object v5, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v6, "malformed classpath entry: "

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :cond_2

    invoke-virtual {v6, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_7

    :cond_2
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v6}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_7
    move-object v8, v3

    const-string v6, "com.google.common.reflect.ClassPath$Scanner"

    const-string v7, "parseJavaClassPath"

    invoke-virtual/range {v4 .. v9}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 17
    :cond_3
    invoke-static {v0, v2}, Lcom/google/common/collect/ImmutableList;->asImmutableList([Ljava/lang/Object;I)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public final scan(Ljava/io/File;Ljava/lang/ClassLoader;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "file",
            "classloader"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/common/reflect/ClassPath$Scanner;->scannedUris:Ljava/util/Set;

    invoke-virtual {p1}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1

    if-nez v0, :cond_0

    goto :goto_1

    .line 3
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 4
    invoke-virtual {p0, p2, p1}, Lcom/google/common/reflect/ClassPath$Scanner;->scanDirectory(Ljava/lang/ClassLoader;Ljava/io/File;)V

    goto :goto_1

    .line 5
    :cond_1
    :try_start_1
    new-instance v0, Ljava/util/jar/JarFile;

    invoke-direct {v0, p1}, Ljava/util/jar/JarFile;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 6
    :try_start_2
    invoke-virtual {v0}, Ljava/util/jar/JarFile;->getManifest()Ljava/util/jar/Manifest;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/google/common/reflect/ClassPath$Scanner;->getClassPathFromManifest(Ljava/io/File;Ljava/util/jar/Manifest;)Lcom/google/common/collect/ImmutableSet;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/common/collect/ImmutableCollection;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    .line 7
    invoke-virtual {p0, v1, p2}, Lcom/google/common/reflect/ClassPath$Scanner;->scan(Ljava/io/File;Ljava/lang/ClassLoader;)V

    goto :goto_0

    .line 8
    :cond_2
    invoke-virtual {p0, p2, v0}, Lcom/google/common/reflect/ClassPath$Scanner;->scanJarFile(Ljava/lang/ClassLoader;Ljava/util/jar/JarFile;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 9
    :try_start_3
    invoke-virtual {v0}, Ljava/util/jar/JarFile;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_1

    :catchall_0
    move-exception p0

    :try_start_4
    invoke-virtual {v0}, Ljava/util/jar/JarFile;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 10
    :catch_0
    throw p0

    :catch_1
    move-exception p0

    .line 11
    sget-object p2, Lcom/google/common/reflect/ClassPath;->logger:Ljava/util/logging/Logger;

    .line 12
    sget-object v0, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x10

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v1

    const-string v1, "Cannot access "

    const-string v3, ": "

    invoke-static {v2, v1, p1, v3, p0}, Lcom/bumptech/glide/Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline1;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "com.google.common.reflect.ClassPath$Scanner"

    const-string v1, "scanFrom"

    invoke-virtual {p2, v0, p1, v1, p0}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :catch_2
    :cond_3
    :goto_1
    return-void
.end method

.method public abstract scanDirectory(Ljava/lang/ClassLoader;Ljava/io/File;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "loader",
            "directory"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract scanJarFile(Ljava/lang/ClassLoader;Ljava/util/jar/JarFile;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "loader",
            "file"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
