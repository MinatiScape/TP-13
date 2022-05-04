.class public final Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;
.super Landroid/os/ResultReceiver;
.source "SourceFile"


# annotations
.annotation build Lcom/google/android/gms/common/annotation/KeepName;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/images/ImageManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "ImageReceiver"
.end annotation


# virtual methods
.method public final onReceiveResult(ILandroid/os/Bundle;)V
    .locals 0

    const-string p0, "com.google.android.gms.extra.fileDescriptor"

    .line 1
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p0

    check-cast p0, Landroid/os/ParcelFileDescriptor;

    .line 2
    sget-object p0, Lcom/google/android/gms/common/images/ImageManager;->zza:Ljava/lang/Object;

    const/4 p0, 0x0

    .line 3
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    throw p0
.end method
