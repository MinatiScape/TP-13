.class public final Lcom/android/systemui/navigationbar/buttons/KeyButtonRipple$TraceAnimatorListener;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/navigationbar/buttons/KeyButtonRipple;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "TraceAnimatorListener"
.end annotation


# instance fields
.field private final mName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/systemui/navigationbar/buttons/KeyButtonRipple$TraceAnimatorListener;->mName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    const-string p1, "KeyButtonRipple.cancel."

    .line 1
    invoke-static {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object p0, p0, Lcom/android/systemui/navigationbar/buttons/KeyButtonRipple$TraceAnimatorListener;->mName:Ljava/lang/String;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 2
    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    const-string p1, "KeyButtonRipple.end."

    .line 1
    invoke-static {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object p0, p0, Lcom/android/systemui/navigationbar/buttons/KeyButtonRipple$TraceAnimatorListener;->mName:Ljava/lang/String;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 2
    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    const-string p1, "KeyButtonRipple.start."

    .line 1
    invoke-static {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object p0, p0, Lcom/android/systemui/navigationbar/buttons/KeyButtonRipple$TraceAnimatorListener;->mName:Ljava/lang/String;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 2
    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void
.end method