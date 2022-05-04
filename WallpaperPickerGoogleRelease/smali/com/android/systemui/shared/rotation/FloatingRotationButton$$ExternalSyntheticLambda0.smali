.class public final synthetic Lcom/android/systemui/shared/rotation/FloatingRotationButton$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Lcom/android/systemui/shared/rotation/FloatingRotationButton;


# direct methods
.method public synthetic constructor <init>(Lcom/android/systemui/shared/rotation/FloatingRotationButton;I)V
    .locals 0

    iput p2, p0, Lcom/android/systemui/shared/rotation/FloatingRotationButton$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/systemui/shared/rotation/FloatingRotationButton$$ExternalSyntheticLambda0;->f$0:Lcom/android/systemui/shared/rotation/FloatingRotationButton;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget v0, p0, Lcom/android/systemui/shared/rotation/FloatingRotationButton$$ExternalSyntheticLambda0;->$r8$classId:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p0, p0, Lcom/android/systemui/shared/rotation/FloatingRotationButton$$ExternalSyntheticLambda0;->f$0:Lcom/android/systemui/shared/rotation/FloatingRotationButton;

    invoke-static {p0}, Lcom/android/systemui/shared/rotation/FloatingRotationButton;->$r8$lambda$ru2bO1n_Sw-5453EhPqos_J4PT8(Lcom/android/systemui/shared/rotation/FloatingRotationButton;)V

    return-void

    :goto_0
    iget-object p0, p0, Lcom/android/systemui/shared/rotation/FloatingRotationButton$$ExternalSyntheticLambda0;->f$0:Lcom/android/systemui/shared/rotation/FloatingRotationButton;

    invoke-static {p0}, Lcom/android/systemui/shared/rotation/FloatingRotationButton;->$r8$lambda$KlNtkQsfU8KBz67x5m2ktsr8jd0(Lcom/android/systemui/shared/rotation/FloatingRotationButton;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
