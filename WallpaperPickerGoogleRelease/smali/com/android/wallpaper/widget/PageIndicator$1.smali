.class public Lcom/android/wallpaper/widget/PageIndicator$1;
.super Landroid/graphics/drawable/Animatable2$AnimationCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/widget/PageIndicator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/widget/PageIndicator;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/widget/PageIndicator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/widget/PageIndicator$1;->this$0:Lcom/android/wallpaper/widget/PageIndicator;

    invoke-direct {p0}, Landroid/graphics/drawable/Animatable2$AnimationCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/graphics/drawable/Animatable2$AnimationCallback;->onAnimationEnd(Landroid/graphics/drawable/Drawable;)V

    .line 2
    instance-of v0, p1, Landroid/graphics/drawable/AnimatedVectorDrawable;

    if-eqz v0, :cond_0

    .line 3
    check-cast p1, Landroid/graphics/drawable/AnimatedVectorDrawable;

    iget-object v0, p0, Lcom/android/wallpaper/widget/PageIndicator$1;->this$0:Lcom/android/wallpaper/widget/PageIndicator;

    .line 4
    iget-object v0, v0, Lcom/android/wallpaper/widget/PageIndicator;->mAnimationCallback:Landroid/graphics/drawable/Animatable2$AnimationCallback;

    .line 5
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/AnimatedVectorDrawable;->unregisterAnimationCallback(Landroid/graphics/drawable/Animatable2$AnimationCallback;)Z

    .line 6
    :cond_0
    iget-object p1, p0, Lcom/android/wallpaper/widget/PageIndicator$1;->this$0:Lcom/android/wallpaper/widget/PageIndicator;

    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p1, Lcom/android/wallpaper/widget/PageIndicator;->mAnimating:Z

    .line 8
    iget-object p1, p1, Lcom/android/wallpaper/widget/PageIndicator;->mQueuedPositions:Ljava/util/ArrayList;

    .line 9
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-eqz p1, :cond_1

    .line 10
    iget-object p0, p0, Lcom/android/wallpaper/widget/PageIndicator$1;->this$0:Lcom/android/wallpaper/widget/PageIndicator;

    .line 11
    iget-object p1, p0, Lcom/android/wallpaper/widget/PageIndicator;->mQueuedPositions:Ljava/util/ArrayList;

    .line 12
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 13
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/widget/PageIndicator;->setPosition(I)V

    :cond_1
    return-void
.end method
