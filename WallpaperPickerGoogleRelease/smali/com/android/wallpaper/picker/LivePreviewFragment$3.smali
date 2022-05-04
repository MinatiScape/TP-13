.class public Lcom/android/wallpaper/picker/LivePreviewFragment$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/widget/BottomActionBar$AccessibilityCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/picker/LivePreviewFragment;->onBottomActionBarReady(Lcom/android/wallpaper/widget/BottomActionBar;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/LivePreviewFragment;

.field public final synthetic val$separatedTabsContainer:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/LivePreviewFragment;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$3;->this$0:Lcom/android/wallpaper/picker/LivePreviewFragment;

    iput-object p2, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$3;->val$separatedTabsContainer:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBottomSheetCollapsed()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$3;->this$0:Lcom/android/wallpaper/picker/LivePreviewFragment;

    .line 2
    iget-object v0, v0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mPreviewContainer:Landroid/view/ViewGroup;

    const/4 v1, 0x1

    .line 3
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setImportantForAccessibility(I)V

    .line 4
    iget-object p0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$3;->val$separatedTabsContainer:Landroid/view/View;

    invoke-virtual {p0, v1}, Landroid/view/View;->setImportantForAccessibility(I)V

    return-void
.end method

.method public onBottomSheetExpanded()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$3;->this$0:Lcom/android/wallpaper/picker/LivePreviewFragment;

    .line 2
    iget-object v0, v0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mPreviewContainer:Landroid/view/ViewGroup;

    const/4 v1, 0x4

    .line 3
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setImportantForAccessibility(I)V

    .line 4
    iget-object p0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$3;->val$separatedTabsContainer:Landroid/view/View;

    invoke-virtual {p0, v1}, Landroid/view/View;->setImportantForAccessibility(I)V

    return-void
.end method
