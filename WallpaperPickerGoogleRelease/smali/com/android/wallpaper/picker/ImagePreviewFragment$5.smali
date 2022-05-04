.class public Lcom/android/wallpaper/picker/ImagePreviewFragment$5;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/ImagePreviewFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$5;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$5;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mLowResImageView:Landroid/widget/ImageView;

    if-eqz p0, :cond_0

    const/4 p1, 0x0

    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :cond_0
    return-void
.end method
