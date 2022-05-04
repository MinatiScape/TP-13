.class public final Lwireless/android/learning/acmi/micropaper/frontend/MicropaperFrontend;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final MICROPAPER_BROADCAST_RECEIVER:Landroid/content/ComponentName;

.field public static final MICROPAPER_SERVICE:Landroid/content/ComponentName;


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/ComponentName;

    const-string v1, "com.google.pixel.dynamicwallpapers"

    const-string v2, "wireless.android.learning.acmi.micropaper.MicropaperService"

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lwireless/android/learning/acmi/micropaper/frontend/MicropaperFrontend;->MICROPAPER_SERVICE:Landroid/content/ComponentName;

    .line 2
    new-instance v0, Landroid/content/ComponentName;

    const-string v2, "wireless.android.learning.acmi.micropaper.parameters.MicropaperParametersReceiver"

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lwireless/android/learning/acmi/micropaper/frontend/MicropaperFrontend;->MICROPAPER_BROADCAST_RECEIVER:Landroid/content/ComponentName;

    return-void
.end method
