.class public final synthetic Lcom/android/systemui/navigationbar/buttons/KeyButtonRipple$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Lcom/android/systemui/navigationbar/buttons/KeyButtonRipple;


# direct methods
.method public synthetic constructor <init>(Lcom/android/systemui/navigationbar/buttons/KeyButtonRipple;I)V
    .locals 0

    iput p2, p0, Lcom/android/systemui/navigationbar/buttons/KeyButtonRipple$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/systemui/navigationbar/buttons/KeyButtonRipple$$ExternalSyntheticLambda0;->f$0:Lcom/android/systemui/navigationbar/buttons/KeyButtonRipple;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget v0, p0, Lcom/android/systemui/navigationbar/buttons/KeyButtonRipple$$ExternalSyntheticLambda0;->$r8$classId:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p0, p0, Lcom/android/systemui/navigationbar/buttons/KeyButtonRipple$$ExternalSyntheticLambda0;->f$0:Lcom/android/systemui/navigationbar/buttons/KeyButtonRipple;

    invoke-static {p0}, Lcom/android/systemui/navigationbar/buttons/KeyButtonRipple;->$r8$lambda$WoMRy-Fpz4O1KOzs-xBECkPouvM(Lcom/android/systemui/navigationbar/buttons/KeyButtonRipple;)V

    return-void

    :goto_0
    iget-object p0, p0, Lcom/android/systemui/navigationbar/buttons/KeyButtonRipple$$ExternalSyntheticLambda0;->f$0:Lcom/android/systemui/navigationbar/buttons/KeyButtonRipple;

    invoke-static {p0}, Lcom/android/systemui/navigationbar/buttons/KeyButtonRipple;->$r8$lambda$YB5cCuoO-4V9-GaM3DVbMQlKgAg(Lcom/android/systemui/navigationbar/buttons/KeyButtonRipple;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
