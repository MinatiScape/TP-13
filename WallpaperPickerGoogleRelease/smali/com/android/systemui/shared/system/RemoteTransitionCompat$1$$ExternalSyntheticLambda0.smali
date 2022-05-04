.class public final synthetic Lcom/android/systemui/shared/system/RemoteTransitionCompat$1$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Landroid/window/IRemoteTransitionFinishedCallback;


# direct methods
.method public synthetic constructor <init>(Landroid/window/IRemoteTransitionFinishedCallback;I)V
    .locals 1

    iput p2, p0, Lcom/android/systemui/shared/system/RemoteTransitionCompat$1$$ExternalSyntheticLambda0;->$r8$classId:I

    const/4 v0, 0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/systemui/shared/system/RemoteTransitionCompat$1$$ExternalSyntheticLambda0;->f$0:Landroid/window/IRemoteTransitionFinishedCallback;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget v0, p0, Lcom/android/systemui/shared/system/RemoteTransitionCompat$1$$ExternalSyntheticLambda0;->$r8$classId:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p0, p0, Lcom/android/systemui/shared/system/RemoteTransitionCompat$1$$ExternalSyntheticLambda0;->f$0:Landroid/window/IRemoteTransitionFinishedCallback;

    invoke-static {p0}, Lcom/android/systemui/shared/system/RemoteTransitionCompat$1;->$r8$lambda$jwJx2V1LAn-ejviZsZXR1iMLhUc(Landroid/window/IRemoteTransitionFinishedCallback;)V

    return-void

    :goto_0
    iget-object p0, p0, Lcom/android/systemui/shared/system/RemoteTransitionCompat$1$$ExternalSyntheticLambda0;->f$0:Landroid/window/IRemoteTransitionFinishedCallback;

    invoke-static {p0}, Lcom/android/systemui/shared/system/RemoteTransitionCompat$1;->$r8$lambda$4bGfLVj4G1PZG6H5jtGC-YBezCc(Landroid/window/IRemoteTransitionFinishedCallback;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
