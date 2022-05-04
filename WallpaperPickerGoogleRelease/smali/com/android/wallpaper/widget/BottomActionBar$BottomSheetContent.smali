.class public abstract Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/widget/BottomActionBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "BottomSheetContent"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/view/View;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public mContentView:Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public mIsVisible:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;->mContentView:Landroid/view/View;

    const/4 p1, 0x0

    .line 3
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;->setVisibility(Z)V

    return-void
.end method


# virtual methods
.method public final createView(Landroid/content/Context;)Landroid/view/View;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")TT;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    invoke-virtual {p0}, Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;->getViewId()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    .line 2
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;->onViewCreated(Landroid/view/View;)V

    const/4 p0, 0x1

    .line 3
    invoke-virtual {p1, p0}, Landroid/view/View;->setFocusable(Z)V

    return-object p1
.end method

.method public abstract getViewId()I
.end method

.method public onRecreateView(Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    return-void
.end method

.method public abstract onViewCreated(Landroid/view/View;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method

.method public final setVisibility(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;->mIsVisible:Z

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;->mContentView:Landroid/view/View;

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/16 p1, 0x8

    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
