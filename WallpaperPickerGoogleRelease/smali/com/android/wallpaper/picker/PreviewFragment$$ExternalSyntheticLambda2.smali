.class public final synthetic Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Lcom/android/wallpaper/picker/PreviewFragment;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/PreviewFragment;I)V
    .locals 0

    iput p2, p0, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda2;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda2;->f$0:Lcom/android/wallpaper/picker/PreviewFragment;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget v0, p0, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda2;->$r8$classId:I

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda2;->f$0:Lcom/android/wallpaper/picker/PreviewFragment;

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mFullScreenAnimation:Lcom/android/wallpaper/util/FullScreenAnimation;

    invoke-virtual {p0, v1}, Lcom/android/wallpaper/util/FullScreenAnimation;->startAnimation(Z)V

    return-void

    .line 2
    :goto_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda2;->f$0:Lcom/android/wallpaper/picker/PreviewFragment;

    sget-object v0, Lcom/android/wallpaper/picker/PreviewFragment;->ALPHA_OUT:Landroid/view/animation/Interpolator;

    .line 3
    invoke-virtual {p0, v1}, Lcom/android/wallpaper/picker/PreviewFragment;->finishActivity(Z)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
