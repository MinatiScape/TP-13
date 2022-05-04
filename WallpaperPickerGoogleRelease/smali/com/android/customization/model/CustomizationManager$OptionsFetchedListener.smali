.class public interface abstract Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/customization/model/CustomizationManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OptionsFetchedListener"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/android/customization/model/CustomizationOption;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    if-eqz p1, :cond_0

    const-string p0, "OptionsFecthedListener"

    const-string v0, "Error loading options"

    .line 1
    invoke-static {p0, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    return-void
.end method

.method public abstract onOptionsLoaded(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;)V"
        }
    .end annotation
.end method
