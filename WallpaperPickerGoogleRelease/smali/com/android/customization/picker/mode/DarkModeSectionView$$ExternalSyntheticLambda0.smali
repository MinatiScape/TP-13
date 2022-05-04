.class public final synthetic Lcom/android/customization/picker/mode/DarkModeSectionView$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field public final synthetic f$0:Lcom/android/customization/picker/mode/DarkModeSectionView;

.field public final synthetic f$1:Landroid/widget/Switch;


# direct methods
.method public synthetic constructor <init>(Lcom/android/customization/picker/mode/DarkModeSectionView;Landroid/widget/Switch;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/customization/picker/mode/DarkModeSectionView$$ExternalSyntheticLambda0;->f$0:Lcom/android/customization/picker/mode/DarkModeSectionView;

    iput-object p2, p0, Lcom/android/customization/picker/mode/DarkModeSectionView$$ExternalSyntheticLambda0;->f$1:Landroid/widget/Switch;

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    iget-object p1, p0, Lcom/android/customization/picker/mode/DarkModeSectionView$$ExternalSyntheticLambda0;->f$0:Lcom/android/customization/picker/mode/DarkModeSectionView;

    iget-object p0, p0, Lcom/android/customization/picker/mode/DarkModeSectionView$$ExternalSyntheticLambda0;->f$1:Landroid/widget/Switch;

    .line 1
    iget-boolean p1, p1, Lcom/android/customization/picker/mode/DarkModeSectionView;->mIsDarkModeActivated:Z

    invoke-virtual {p0, p1}, Landroid/widget/Switch;->setChecked(Z)V

    return-void
.end method
