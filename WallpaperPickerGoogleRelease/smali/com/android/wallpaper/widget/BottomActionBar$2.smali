.class public Lcom/android/wallpaper/widget/BottomActionBar$2;
.super Landroid/view/View$AccessibilityDelegate;
.source "SourceFile"


# instance fields
.field public final synthetic val$eventTypes:[I


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/widget/BottomActionBar;[I)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/wallpaper/widget/BottomActionBar$2;->val$eventTypes:[I

    invoke-direct {p0}, Landroid/view/View$AccessibilityDelegate;-><init>()V

    return-void
.end method


# virtual methods
.method public sendAccessibilityEvent(Landroid/view/View;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/widget/BottomActionBar$2;->val$eventTypes:[I

    invoke-static {v0, p2}, Lcom/android/internal/util/ArrayUtils;->contains([II)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2
    invoke-super {p0, p1, p2}, Landroid/view/View$AccessibilityDelegate;->sendAccessibilityEvent(Landroid/view/View;I)V

    :cond_0
    return-void
.end method
