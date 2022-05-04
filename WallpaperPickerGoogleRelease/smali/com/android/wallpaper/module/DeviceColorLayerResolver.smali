.class public Lcom/android/wallpaper/module/DeviceColorLayerResolver;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/DrawableLayerResolver;


# static fields
.field public static final DEVICE_COLOR:Ljava/lang/String;

.field public static final LAYER_INDEX:I


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    const-string v0, "ro.boot.hardware.color"

    .line 1
    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/wallpaper/module/DeviceColorLayerResolver;->DEVICE_COLOR:Ljava/lang/String;

    .line 2
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "BLK"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "ORG"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    .line 3
    :goto_0
    sput v0, Lcom/android/wallpaper/module/DeviceColorLayerResolver;->LAYER_INDEX:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
