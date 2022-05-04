.class public Lcom/android/wallpaper/picker/TopLevelPickerActivity$3;
.super Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;
.source "SourceFile"


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/TopLevelPickerActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$3;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    invoke-direct {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onSlide(Landroid/view/View;F)V
    .locals 0

    const/4 p1, 0x0

    cmpl-float p1, p2, p1

    if-ltz p1, :cond_0

    goto :goto_0

    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    sub-float p2, p1, p2

    .line 1
    :goto_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$3;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    const p1, 0x7f0a007a

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/LinearLayout;

    .line 2
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->setAlpha(F)V

    return-void
.end method

.method public onStateChanged(Landroid/view/View;I)V
    .locals 0

    return-void
.end method
