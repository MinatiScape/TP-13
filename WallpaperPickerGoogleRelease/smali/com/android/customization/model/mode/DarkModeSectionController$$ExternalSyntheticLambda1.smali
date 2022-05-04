.class public final synthetic Lcom/android/customization/model/mode/DarkModeSectionController$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/android/customization/model/mode/DarkModeSectionController;

.field public final synthetic f$1:Landroid/content/Context;

.field public final synthetic f$2:Landroid/app/UiModeManager;

.field public final synthetic f$3:Z


# direct methods
.method public synthetic constructor <init>(Lcom/android/customization/model/mode/DarkModeSectionController;Landroid/content/Context;Landroid/app/UiModeManager;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/customization/model/mode/DarkModeSectionController$$ExternalSyntheticLambda1;->f$0:Lcom/android/customization/model/mode/DarkModeSectionController;

    iput-object p2, p0, Lcom/android/customization/model/mode/DarkModeSectionController$$ExternalSyntheticLambda1;->f$1:Landroid/content/Context;

    iput-object p3, p0, Lcom/android/customization/model/mode/DarkModeSectionController$$ExternalSyntheticLambda1;->f$2:Landroid/app/UiModeManager;

    iput-boolean p4, p0, Lcom/android/customization/model/mode/DarkModeSectionController$$ExternalSyntheticLambda1;->f$3:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    iget-object v0, p0, Lcom/android/customization/model/mode/DarkModeSectionController$$ExternalSyntheticLambda1;->f$0:Lcom/android/customization/model/mode/DarkModeSectionController;

    iget-object v1, p0, Lcom/android/customization/model/mode/DarkModeSectionController$$ExternalSyntheticLambda1;->f$1:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/customization/model/mode/DarkModeSectionController$$ExternalSyntheticLambda1;->f$2:Landroid/app/UiModeManager;

    iget-boolean p0, p0, Lcom/android/customization/model/mode/DarkModeSectionController$$ExternalSyntheticLambda1;->f$3:Z

    .line 1
    iget-object v0, v0, Lcom/android/customization/model/mode/DarkModeSectionController;->mDarkModeSectionView:Lcom/android/customization/picker/mode/DarkModeSectionView;

    const v3, 0x7f1100bd

    .line 2
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 3
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->announceForAccessibility(Ljava/lang/CharSequence;)V

    .line 4
    invoke-virtual {v2, p0}, Landroid/app/UiModeManager;->setNightModeActivated(Z)Z

    return-void
.end method
