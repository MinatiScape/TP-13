.class public Lcom/android/wallpaper/picker/ImagePreviewFragment$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/picker/ImagePreviewFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

.field public final synthetic val$activity:Landroid/app/Activity;

.field public final synthetic val$view:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/ImagePreviewFragment;Landroid/app/Activity;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$1;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    iput-object p2, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$1;->val$activity:Landroid/app/Activity;

    iput-object p3, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$1;->val$view:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$1;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    iget-object p1, p1, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWorkspaceSurface:Landroid/view/SurfaceView;

    invoke-virtual {p1}, Landroid/view/SurfaceView;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroidx/cardview/widget/CardView;

    iget-object p2, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$1;->val$activity:Landroid/app/Activity;

    iget-object p3, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$1;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    iget-object p3, p3, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWorkspaceSurface:Landroid/view/SurfaceView;

    .line 2
    invoke-virtual {p3}, Landroid/view/SurfaceView;->getParent()Landroid/view/ViewParent;

    move-result-object p3

    check-cast p3, Landroidx/cardview/widget/CardView;

    invoke-virtual {p3}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result p3

    .line 3
    invoke-static {p2, p3}, Lcom/android/wallpaper/util/SizeCalculator;->getPreviewCornerRadius(Landroid/app/Activity;I)F

    move-result p2

    .line 4
    invoke-virtual {p1, p2}, Landroidx/cardview/widget/CardView;->setRadius(F)V

    .line 5
    iget-object p1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$1;->val$view:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    return-void
.end method
