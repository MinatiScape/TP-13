.class public Lcom/android/wallpaper/picker/CategoryFragment$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


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

.field public final synthetic val$homePreviewCard:Landroidx/cardview/widget/CardView;

.field public final synthetic val$lockPreviewContainer:Landroid/view/ViewGroup;

.field public final synthetic val$lockscreenPreviewCard:Landroidx/cardview/widget/CardView;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/CategoryFragment;Landroidx/cardview/widget/CardView;Landroidx/cardview/widget/CardView;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment$3;->this$0:Lcom/android/wallpaper/picker/CategoryFragment;

    iput-object p2, p0, Lcom/android/wallpaper/picker/CategoryFragment$3;->val$homePreviewCard:Landroidx/cardview/widget/CardView;

    iput-object p3, p0, Lcom/android/wallpaper/picker/CategoryFragment$3;->val$lockscreenPreviewCard:Landroidx/cardview/widget/CardView;

    iput-object p4, p0, Lcom/android/wallpaper/picker/CategoryFragment$3;->val$lockPreviewContainer:Landroid/view/ViewGroup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/android/wallpaper/picker/CategoryFragment$3;->this$0:Lcom/android/wallpaper/picker/CategoryFragment;

    .line 2
    iget-object p2, p2, Lcom/android/wallpaper/picker/CategoryFragment;->mRootContainer:Landroid/view/View;

    .line 3
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result p2

    iget-object p3, p0, Lcom/android/wallpaper/picker/CategoryFragment$3;->this$0:Lcom/android/wallpaper/picker/CategoryFragment;

    .line 4
    iget-object p3, p3, Lcom/android/wallpaper/picker/CategoryFragment;->mPreviewPager:Lcom/android/wallpaper/widget/PreviewPager;

    .line 5
    invoke-virtual {p3}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    move-result p3

    sub-int/2addr p2, p3

    .line 6
    iget-object p3, p0, Lcom/android/wallpaper/picker/CategoryFragment$3;->this$0:Lcom/android/wallpaper/picker/CategoryFragment;

    .line 7
    iget-object p3, p3, Lcom/android/wallpaper/picker/CategoryFragment;->mBottomSheetBehavior:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 8
    invoke-virtual {p3, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setPeekHeight(I)V

    .line 9
    invoke-virtual {p1, p2}, Landroid/view/View;->setMinimumHeight(I)V

    .line 10
    iget-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment$3;->val$homePreviewCard:Landroidx/cardview/widget/CardView;

    iget-object p2, p0, Lcom/android/wallpaper/picker/CategoryFragment$3;->this$0:Lcom/android/wallpaper/picker/CategoryFragment;

    .line 11
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    iget-object p3, p0, Lcom/android/wallpaper/picker/CategoryFragment$3;->val$homePreviewCard:Landroidx/cardview/widget/CardView;

    invoke-virtual {p3}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result p3

    .line 12
    invoke-static {p2, p3}, Lcom/android/wallpaper/util/SizeCalculator;->getPreviewCornerRadius(Landroid/app/Activity;I)F

    move-result p2

    invoke-virtual {p1, p2}, Landroidx/cardview/widget/CardView;->setRadius(F)V

    .line 13
    iget-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment$3;->val$lockscreenPreviewCard:Landroidx/cardview/widget/CardView;

    if-eqz p1, :cond_0

    .line 14
    iget-object p2, p0, Lcom/android/wallpaper/picker/CategoryFragment$3;->this$0:Lcom/android/wallpaper/picker/CategoryFragment;

    .line 15
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment$3;->val$lockPreviewContainer:Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    move-result p0

    .line 16
    invoke-static {p2, p0}, Lcom/android/wallpaper/util/SizeCalculator;->getPreviewCornerRadius(Landroid/app/Activity;I)F

    move-result p0

    invoke-virtual {p1, p0}, Landroidx/cardview/widget/CardView;->setRadius(F)V

    :cond_0
    return-void
.end method
