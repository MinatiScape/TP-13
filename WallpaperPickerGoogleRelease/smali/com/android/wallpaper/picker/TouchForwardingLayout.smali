.class public Lcom/android/wallpaper/picker/TouchForwardingLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public mForwardingEnabled:Z

.field public mView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/TouchForwardingLayout;->mView:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-boolean p0, p0, Lcom/android/wallpaper/picker/TouchForwardingLayout;->mForwardingEnabled:Z

    if-eqz p0, :cond_0

    .line 2
    invoke-virtual {v0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    :cond_0
    const/4 p0, 0x1

    return p0
.end method
