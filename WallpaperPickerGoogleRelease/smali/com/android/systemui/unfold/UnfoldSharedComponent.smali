.class public interface abstract Lcom/android/systemui/unfold/UnfoldSharedComponent;
.super Ljava/lang/Object;
.source "UnfoldSharedComponent.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/unfold/UnfoldSharedComponent$Factory;
    }
.end annotation


# virtual methods
.method public abstract getUnfoldTransitionProvider()Ljava/util/Optional;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Optional<",
            "Lcom/android/systemui/unfold/UnfoldTransitionProgressProvider;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end method
