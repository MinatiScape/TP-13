.class public Lcom/android/wallpaper/picker/CategoryFragment$2;
.super Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/picker/CategoryFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/CategoryFragment;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/CategoryFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment$2;->this$0:Lcom/android/wallpaper/picker/CategoryFragment;

    invoke-direct {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onSlide(Landroid/view/View;F)V
    .locals 0

    return-void
.end method

.method public onStateChanged(Landroid/view/View;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment$2;->this$0:Lcom/android/wallpaper/picker/CategoryFragment;

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mPreviewPager:Lcom/android/wallpaper/widget/PreviewPager;

    const/4 p1, 0x3

    if-ne p2, p1, :cond_0

    const/4 p1, 0x4

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    .line 3
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setImportantForAccessibility(I)V

    return-void
.end method
