.class public interface abstract Lcom/android/systemui/flags/FlagListenable$Listener;
.super Ljava/lang/Object;
.source "FlagListenable.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/flags/FlagListenable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Listener"
.end annotation


# virtual methods
.method public abstract onFlagChanged(Lcom/android/systemui/flags/FlagListenable$FlagEvent;)V
    .param p1    # Lcom/android/systemui/flags/FlagListenable$FlagEvent;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method
