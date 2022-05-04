.class public interface abstract Lcom/android/customization/model/CustomizationOption;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/android/customization/model/CustomizationOption;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract bindThumbnailTile(Landroid/view/View;)V
.end method

.method public abstract getLayoutResId()I
.end method

.method public abstract getTitle()Ljava/lang/String;
.end method

.method public abstract isActive(Lcom/android/customization/model/CustomizationManager;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/customization/model/CustomizationManager<",
            "TT;>;)Z"
        }
    .end annotation
.end method
