.class public interface abstract Lcom/android/systemui/unfold/updates/FoldStateProvider;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/systemui/statusbar/policy/CallbackController;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/unfold/updates/FoldStateProvider$FoldUpdatesListener;,
        Lcom/android/systemui/unfold/updates/FoldStateProvider$FoldUpdate;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/systemui/statusbar/policy/CallbackController<",
        "Lcom/android/systemui/unfold/updates/FoldStateProvider$FoldUpdatesListener;",
        ">;"
    }
.end annotation


# virtual methods
.method public abstract isFullyOpened()Z
.end method

.method public abstract start()V
.end method

.method public abstract stop()V
.end method