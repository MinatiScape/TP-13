.class public final Lcom/google/common/reflect/ClassPath$DefaultScanner;
.super Lcom/google/common/reflect/ClassPath$Scanner;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/reflect/ClassPath;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DefaultScanner"
.end annotation


# instance fields
.field public final resources:Lcom/google/common/collect/SetMultimap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/SetMultimap<",
            "Ljava/lang/ClassLoader;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/google/common/reflect/ClassPath$Scanner;-><init>()V

    const/16 v0, 0x8

    const-string v1, "expectedKeys"

    .line 2
    invoke-static {v0, v1}, Lcom/google/common/collect/CollectPreconditions;->checkNonnegative(ILjava/lang/String;)I

    const/4 v1, 0x2

    const-string v2, "expectedValuesPerKey"

    .line 3
    invoke-static {v1, v2}, Lcom/google/common/collect/CollectPreconditions;->checkNonnegative(ILjava/lang/String;)I

    .line 4
    new-instance v2, Lcom/google/common/collect/CompactHashMap;

    invoke-direct {v2, v0}, Lcom/google/common/collect/CompactHashMap;-><init>(I)V

    .line 5
    new-instance v0, Lcom/google/common/collect/MultimapBuilder$LinkedHashSetSupplier;

    invoke-direct {v0, v1}, Lcom/google/common/collect/MultimapBuilder$LinkedHashSetSupplier;-><init>(I)V

    .line 6
    new-instance v1, Lcom/google/common/collect/Multimaps$CustomSetMultimap;

    invoke-direct {v1, v2, v0}, Lcom/google/common/collect/Multimaps$CustomSetMultimap;-><init>(Ljava/util/Map;Lcom/google/common/base/Supplier;)V

    .line 7
    iput-object v1, p0, Lcom/google/common/reflect/ClassPath$DefaultScanner;->resources:Lcom/google/common/collect/SetMultimap;

    return-void
.end method


# virtual methods
.method public final scanDirectory(Ljava/io/File;Ljava/lang/ClassLoader;Ljava/lang/String;Ljava/util/Set;)V
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "directory",
            "classloader",
            "packagePrefix",
            "currentPath"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ljava/lang/ClassLoader;",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Ljava/io/File;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 4
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_0

    .line 5
    sget-object p0, Lcom/google/common/reflect/ClassPath;->logger:Ljava/util/logging/Logger;

    .line 6
    sget-object p2, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p3

    add-int/lit8 p3, p3, 0x16

    const-string p4, "Cannot read directory "

    invoke-static {p3, p4, p1}, Lcom/bumptech/glide/Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string p3, "com.google.common.reflect.ClassPath$DefaultScanner"

    const-string p4, "scanDirectory"

    invoke-virtual {p0, p2, p3, p4, p1}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 7
    :cond_0
    array-length p1, v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p1, :cond_4

    aget-object v2, v0, v1

    .line 8
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    .line 9
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 10
    invoke-virtual {v2}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v2

    .line 11
    invoke-interface {p4, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    const/4 v4, 0x1

    .line 12
    invoke-static {p3, v4}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v4

    invoke-static {v3, v4}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v4

    const-string v5, "/"

    invoke-static {v4, p3, v3, v5}, Landroidx/viewpager2/widget/FakeDrag$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v2, p2, v3, p4}, Lcom/google/common/reflect/ClassPath$DefaultScanner;->scanDirectory(Ljava/io/File;Ljava/lang/ClassLoader;Ljava/lang/String;Ljava/util/Set;)V

    .line 13
    invoke-interface {p4, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_2

    .line 14
    :cond_1
    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    :cond_2
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object v2, v3

    :goto_1
    const-string v3, "META-INF/MANIFEST.MF"

    .line 15
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 16
    iget-object v3, p0, Lcom/google/common/reflect/ClassPath$DefaultScanner;->resources:Lcom/google/common/collect/SetMultimap;

    check-cast v3, Lcom/google/common/collect/AbstractSetMultimap;

    invoke-virtual {v3, p2}, Lcom/google/common/collect/AbstractSetMultimap;->get(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_3
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_4
    return-void
.end method

.method public scanDirectory(Ljava/lang/ClassLoader;Ljava/io/File;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "classloader",
            "directory"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 2
    invoke-virtual {p2}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const-string v1, ""

    .line 3
    invoke-virtual {p0, p2, p1, v1, v0}, Lcom/google/common/reflect/ClassPath$DefaultScanner;->scanDirectory(Ljava/io/File;Ljava/lang/ClassLoader;Ljava/lang/String;Ljava/util/Set;)V

    return-void
.end method

.method public scanJarFile(Ljava/lang/ClassLoader;Ljava/util/jar/JarFile;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "classloader",
            "file"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/util/jar/JarFile;->entries()Ljava/util/Enumeration;

    move-result-object p2

    .line 2
    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 3
    invoke-interface {p2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/jar/JarEntry;

    .line 4
    invoke-virtual {v0}, Ljava/util/jar/JarEntry;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/util/jar/JarEntry;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "META-INF/MANIFEST.MF"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    .line 5
    :cond_1
    iget-object v1, p0, Lcom/google/common/reflect/ClassPath$DefaultScanner;->resources:Lcom/google/common/collect/SetMultimap;

    check-cast v1, Lcom/google/common/collect/AbstractSetMultimap;

    invoke-virtual {v1, p1}, Lcom/google/common/collect/AbstractSetMultimap;->get(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    invoke-virtual {v0}, Ljava/util/jar/JarEntry;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    return-void
.end method
