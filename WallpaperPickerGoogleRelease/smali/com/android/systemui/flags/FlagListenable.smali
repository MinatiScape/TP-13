.class public interface abstract Lcom/android/systemui/flags/FlagListenable;
.super Ljava/lang/Object;
.source "FlagListenable.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/flags/FlagListenable$Listener;,
        Lcom/android/systemui/flags/FlagListenable$FlagEvent;
    }
.end annotation


# virtual methods
.method public abstract addListener(Lcom/android/systemui/flags/Flag;Lcom/android/systemui/flags/FlagListenable$Listener;)V
    .param p1    # Lcom/android/systemui/flags/Flag;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/android/systemui/flags/FlagListenable$Listener;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/systemui/flags/Flag<",
            "*>;",
            "Lcom/android/systemui/flags/FlagListenable$Listener;",
            ")V"
        }
    .end annotation
.end method

.method public abstract removeListener(Lcom/android/systemui/flags/FlagListenable$Listener;)V
    .param p1    # Lcom/android/systemui/flags/FlagListenable$Listener;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method
