.class public final synthetic Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$$Lambda$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$ThrowableSupplier;


# instance fields
.field public final synthetic $r8$classId:I

.field public final arg$1:Lcom/adobe/xmp/XMPMeta;


# direct methods
.method public constructor <init>(Lcom/adobe/xmp/XMPMeta;I)V
    .locals 1

    iput p2, p0, Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$$Lambda$6;->$r8$classId:I

    const/4 v0, 0x1

    if-eq p2, v0, :cond_1

    const/4 v0, 0x2

    if-eq p2, v0, :cond_0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$$Lambda$6;->arg$1:Lcom/adobe/xmp/XMPMeta;

    return-void

    .line 2
    :cond_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$$Lambda$6;->arg$1:Lcom/adobe/xmp/XMPMeta;

    return-void

    .line 3
    :cond_1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$$Lambda$6;->arg$1:Lcom/adobe/xmp/XMPMeta;

    return-void
.end method


# virtual methods
.method public get()Ljava/lang/Object;
    .locals 3

    iget v0, p0, Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$$Lambda$6;->$r8$classId:I

    const/4 v1, 0x0

    const-string v2, "http://ns.google.com/photos/1.0/camera/"

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    .line 1
    :pswitch_0
    iget-object p0, p0, Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$$Lambda$6;->arg$1:Lcom/adobe/xmp/XMPMeta;

    .line 2
    check-cast p0, Lcom/adobe/xmp/impl/XMPMetaImpl;

    const-string v0, "MicroVideoOffset"

    invoke-virtual {p0, v2, v0}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getPropertyInteger(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    .line 3
    :pswitch_1
    iget-object p0, p0, Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$$Lambda$6;->arg$1:Lcom/adobe/xmp/XMPMeta;

    .line 4
    check-cast p0, Lcom/adobe/xmp/impl/XMPMetaImpl;

    const-string v0, "MotionPhoto"

    invoke-virtual {p0, v2, v0}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getPropertyInteger(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 5
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    if-gtz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x2

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    :cond_1
    :goto_0
    return-object v1

    .line 6
    :goto_1
    iget-object p0, p0, Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$$Lambda$6;->arg$1:Lcom/adobe/xmp/XMPMeta;

    .line 7
    check-cast p0, Lcom/adobe/xmp/impl/XMPMetaImpl;

    const-string v0, "MicroVideo"

    invoke-virtual {p0, v2, v0}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getPropertyInteger(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p0

    if-eqz p0, :cond_3

    .line 8
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    if-gtz p0, :cond_2

    goto :goto_2

    :cond_2
    const/4 p0, 0x1

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    :cond_3
    :goto_2
    return-object v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
