.class public Lcom/android/customization/picker/WallpaperPreviewer$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/customization/picker/WallpaperPreviewer;-><init>(Landroidx/lifecycle/Lifecycle;Landroid/app/Activity;Landroid/widget/ImageView;Landroid/view/SurfaceView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/customization/picker/WallpaperPreviewer;

.field public final synthetic val$rootView:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/android/customization/picker/WallpaperPreviewer;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/customization/picker/WallpaperPreviewer$1;->this$0:Lcom/android/customization/picker/WallpaperPreviewer;

    iput-object p2, p0, Lcom/android/customization/picker/WallpaperPreviewer$1;->val$rootView:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/customization/picker/WallpaperPreviewer$1;->this$0:Lcom/android/customization/picker/WallpaperPreviewer;

    .line 2
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-static {}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getInstance()Lcom/android/wallpaper/util/ScreenSizeCalculator;

    move-result-object p2

    iget-object p3, p1, Lcom/android/customization/picker/WallpaperPreviewer;->mActivity:Landroid/app/Activity;

    invoke-virtual {p2, p3}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getScreenAspectRatio(Landroid/content/Context;)F

    move-result p2

    .line 4
    iget-object p3, p1, Lcom/android/customization/picker/WallpaperPreviewer;->mHomePreview:Landroid/widget/ImageView;

    invoke-virtual {p3}, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;

    move-result-object p3

    check-cast p3, Landroidx/cardview/widget/CardView;

    .line 5
    invoke-virtual {p3}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result p4

    int-to-float p4, p4

    div-float/2addr p4, p2

    float-to-int p2, p4

    .line 6
    invoke-virtual {p3}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p4

    .line 7
    iput p2, p4, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 8
    invoke-virtual {p3, p4}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 9
    iget-object p1, p1, Lcom/android/customization/picker/WallpaperPreviewer;->mActivity:Landroid/app/Activity;

    invoke-static {p1, p2}, Lcom/android/wallpaper/util/SizeCalculator;->getPreviewCornerRadius(Landroid/app/Activity;I)F

    move-result p1

    invoke-virtual {p3, p1}, Landroidx/cardview/widget/CardView;->setRadius(F)V

    .line 10
    iget-object p1, p0, Lcom/android/customization/picker/WallpaperPreviewer$1;->val$rootView:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    return-void
.end method
