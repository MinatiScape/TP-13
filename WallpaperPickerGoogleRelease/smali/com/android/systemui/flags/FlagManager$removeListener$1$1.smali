.class final Lcom/android/systemui/flags/FlagManager$removeListener$1$1;
.super Ljava/lang/Object;
.source "FlagManager.kt"

# interfaces
.implements Ljava/util/function/Predicate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/flags/FlagManager;->removeListener(Lcom/android/systemui/flags/FlagListenable$Listener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/function/Predicate;"
    }
.end annotation


# instance fields
.field public final synthetic $listener:Lcom/android/systemui/flags/FlagListenable$Listener;


# direct methods
.method public constructor <init>(Lcom/android/systemui/flags/FlagListenable$Listener;)V
    .locals 0

    iput-object p1, p0, Lcom/android/systemui/flags/FlagManager$removeListener$1$1;->$listener:Lcom/android/systemui/flags/FlagListenable$Listener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final test(Lcom/android/systemui/flags/FlagManager$PerFlagListener;)Z
    .locals 1
    .param p1    # Lcom/android/systemui/flags/FlagManager$PerFlagListener;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const-string v0, "it"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-virtual {p1}, Lcom/android/systemui/flags/FlagManager$PerFlagListener;->getListener()Lcom/android/systemui/flags/FlagListenable$Listener;

    move-result-object p1

    iget-object p0, p0, Lcom/android/systemui/flags/FlagManager$removeListener$1$1;->$listener:Lcom/android/systemui/flags/FlagListenable$Listener;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public bridge synthetic test(Ljava/lang/Object;)Z
    .locals 0

    .line 2
    check-cast p1, Lcom/android/systemui/flags/FlagManager$PerFlagListener;

    invoke-virtual {p0, p1}, Lcom/android/systemui/flags/FlagManager$removeListener$1$1;->test(Lcom/android/systemui/flags/FlagManager$PerFlagListener;)Z

    move-result p0

    return p0
.end method
