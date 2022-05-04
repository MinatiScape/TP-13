.class public Landroid/support/v4/media/MediaController2ImplLegacy$3;
.super Landroid/os/ResultReceiver;
.source "SourceFile"


# virtual methods
.method public onReceiveResult(ILandroid/os/Bundle;)V
    .locals 0

    .line 1
    sget p0, Landroid/support/v4/media/MediaController2ImplLegacy;->$r8$clinit:I

    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    throw p0
.end method
