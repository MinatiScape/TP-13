.class public interface abstract Lcom/android/customization/model/ResourceConstants;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ICONS_FOR_PREVIEW:[Ljava/lang/String;

.field public static final sTargetPackages:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .locals 8

    const-string v0, "ic_wifi_signal_3"

    const-string v1, "ic_qs_bluetooth"

    const-string v2, "ic_qs_dnd"

    const-string v3, "ic_qs_flashlight"

    const-string v4, "ic_qs_auto_rotate"

    const-string v5, "ic_qs_battery_saver"

    const-string v6, "ic_signal_cellular_3_4_bar"

    const-string v7, "ic_battery_80_24dp"

    .line 1
    filled-new-array/range {v0 .. v7}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/customization/model/ResourceConstants;->ICONS_FOR_PREVIEW:[Ljava/lang/String;

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/customization/model/ResourceConstants;->sTargetPackages:Ljava/util/ArrayList;

    return-void
.end method
