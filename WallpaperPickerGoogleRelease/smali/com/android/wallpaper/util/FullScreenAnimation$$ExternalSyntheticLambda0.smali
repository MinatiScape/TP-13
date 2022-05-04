.class public final synthetic Lcom/android/wallpaper/util/FullScreenAnimation$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/TextView;

.field public final synthetic f$1:Landroid/widget/ImageButton;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/TextView;Landroid/widget/ImageButton;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/util/FullScreenAnimation$$ExternalSyntheticLambda0;->f$0:Landroid/widget/TextView;

    iput-object p2, p0, Lcom/android/wallpaper/util/FullScreenAnimation$$ExternalSyntheticLambda0;->f$1:Landroid/widget/ImageButton;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    iget-object v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation$$ExternalSyntheticLambda0;->f$0:Landroid/widget/TextView;

    iget-object p0, p0, Lcom/android/wallpaper/util/FullScreenAnimation$$ExternalSyntheticLambda0;->f$1:Landroid/widget/ImageButton;

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 2
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    if-eqz p0, :cond_0

    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/ImageButton;->setColorFilter(I)V

    :cond_0
    return-void
.end method
