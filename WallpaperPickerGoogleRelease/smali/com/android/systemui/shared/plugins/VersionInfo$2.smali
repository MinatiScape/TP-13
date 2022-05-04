.class public Lcom/android/systemui/shared/plugins/VersionInfo$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/BiConsumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/shared/plugins/VersionInfo;->checkVersion(Lcom/android/systemui/shared/plugins/VersionInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/function/BiConsumer<",
        "Ljava/lang/Class<",
        "*>;",
        "Lcom/android/systemui/shared/plugins/VersionInfo$Version;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/systemui/shared/plugins/VersionInfo;


# direct methods
.method public constructor <init>(Lcom/android/systemui/shared/plugins/VersionInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/systemui/shared/plugins/VersionInfo$2;->this$0:Lcom/android/systemui/shared/plugins/VersionInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/lang/Class;Lcom/android/systemui/shared/plugins/VersionInfo$Version;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/android/systemui/shared/plugins/VersionInfo$Version;",
            ")V"
        }
    .end annotation

    .line 2
    invoke-static {p2}, Lcom/android/systemui/shared/plugins/VersionInfo$Version;->access$200(Lcom/android/systemui/shared/plugins/VersionInfo$Version;)Z

    move-result p0

    if-nez p0, :cond_0

    return-void

    .line 3
    :cond_0
    new-instance p0, Lcom/android/systemui/shared/plugins/VersionInfo$InvalidVersionException;

    const-string p2, "Missing required dependency "

    invoke-static {p2}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    .line 4
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2}, Lcom/android/systemui/shared/plugins/VersionInfo$InvalidVersionException;-><init>(Ljava/lang/String;Z)V

    throw p0
.end method

.method public bridge synthetic accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Class;

    check-cast p2, Lcom/android/systemui/shared/plugins/VersionInfo$Version;

    invoke-virtual {p0, p1, p2}, Lcom/android/systemui/shared/plugins/VersionInfo$2;->accept(Ljava/lang/Class;Lcom/android/systemui/shared/plugins/VersionInfo$Version;)V

    return-void
.end method
