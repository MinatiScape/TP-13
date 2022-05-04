.class public interface abstract Lcom/android/systemui/flags/FlagReader;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/flags/FlagReader$Listener;,
        Lcom/android/systemui/flags/FlagReader$DefaultImpls;
    }
.end annotation


# virtual methods
.method public abstract addListener(Lcom/android/systemui/flags/FlagReader$Listener;)V
    .param p1    # Lcom/android/systemui/flags/FlagReader$Listener;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract isEnabled(IZ)Z
.end method

.method public abstract isEnabled(Lcom/android/systemui/flags/BooleanFlag;)Z
    .param p1    # Lcom/android/systemui/flags/BooleanFlag;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract removeListener(Lcom/android/systemui/flags/FlagReader$Listener;)V
    .param p1    # Lcom/android/systemui/flags/FlagReader$Listener;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method
