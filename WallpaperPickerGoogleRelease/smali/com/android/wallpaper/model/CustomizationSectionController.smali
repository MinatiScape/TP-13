.class public interface abstract Lcom/android/wallpaper/model/CustomizationSectionController;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/model/CustomizationSectionController$CustomizationSectionNavigationController;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/android/wallpaper/picker/SectionView;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract createView(Landroid/content/Context;)Lcom/android/wallpaper/picker/SectionView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")TT;"
        }
    .end annotation
.end method

.method public abstract isAvailable(Landroid/content/Context;)Z
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public onTransitionOut()V
    .locals 0

    return-void
.end method

.method public release()V
    .locals 0

    return-void
.end method
