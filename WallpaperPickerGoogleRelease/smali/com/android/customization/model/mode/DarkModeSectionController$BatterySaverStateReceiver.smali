.class public Lcom/android/customization/model/mode/DarkModeSectionController$BatterySaverStateReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/customization/model/mode/DarkModeSectionController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "BatterySaverStateReceiver"
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/customization/model/mode/DarkModeSectionController;


# direct methods
.method public constructor <init>(Lcom/android/customization/model/mode/DarkModeSectionController;Lcom/android/customization/model/mode/DarkModeSectionController$1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/customization/model/mode/DarkModeSectionController$BatterySaverStateReceiver;->this$0:Lcom/android/customization/model/mode/DarkModeSectionController;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string p2, "android.os.action.POWER_SAVE_MODE_CHANGED"

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p0, p0, Lcom/android/customization/model/mode/DarkModeSectionController$BatterySaverStateReceiver;->this$0:Lcom/android/customization/model/mode/DarkModeSectionController;

    .line 2
    iget-object p1, p0, Lcom/android/customization/model/mode/DarkModeSectionController;->mDarkModeSectionView:Lcom/android/customization/picker/mode/DarkModeSectionView;

    if-eqz p1, :cond_0

    .line 3
    iget-object p0, p0, Lcom/android/customization/model/mode/DarkModeSectionController;->mPowerManager:Landroid/os/PowerManager;

    .line 4
    invoke-virtual {p0}, Landroid/os/PowerManager;->isPowerSaveMode()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    invoke-virtual {p1, p0}, Lcom/android/customization/picker/mode/DarkModeSectionView;->setEnabled(Z)V

    :cond_0
    return-void
.end method
