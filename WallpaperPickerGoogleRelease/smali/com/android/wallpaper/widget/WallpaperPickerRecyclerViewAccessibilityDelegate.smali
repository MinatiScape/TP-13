.class public Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate;
.super Landroidx/recyclerview/widget/RecyclerViewAccessibilityDelegate;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate$BottomSheetHost;
    }
.end annotation


# instance fields
.field public final mBottomSheetHost:Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate$BottomSheetHost;

.field public final mColumns:I

.field public final mGridRecyclerView:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate$BottomSheetHost;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerViewAccessibilityDelegate;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate;->mGridRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 3
    iput-object p2, p0, Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate;->mBottomSheetHost:Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate$BottomSheetHost;

    .line 4
    iput p3, p0, Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate;->mColumns:I

    return-void
.end method


# virtual methods
.method public onRequestSendAccessibilityEvent(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p3}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result v0

    const v1, 0x8000

    if-ne v0, v1, :cond_0

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate;->mGridRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I

    move-result v0

    .line 3
    iget-object v1, p0, Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate;->mBottomSheetHost:Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate$BottomSheetHost;

    if-eqz v1, :cond_0

    invoke-interface {v1}, Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate$BottomSheetHost;->isExpanded()Z

    move-result v1

    if-nez v1, :cond_0

    iget v1, p0, Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate;->mColumns:I

    if-lt v0, v1, :cond_0

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate;->mBottomSheetHost:Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate$BottomSheetHost;

    invoke-interface {v0}, Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate$BottomSheetHost;->expandBottomSheet()V

    .line 5
    :cond_0
    iget-object p0, p0, Landroidx/core/view/AccessibilityDelegateCompat;->mOriginalDelegate:Landroid/view/View$AccessibilityDelegate;

    invoke-virtual {p0, p1, p2, p3}, Landroid/view/View$AccessibilityDelegate;->onRequestSendAccessibilityEvent(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result p0

    return p0
.end method

.method public performAccessibilityAction(Landroid/view/View;ILandroid/os/Bundle;)Z
    .locals 1

    const/16 v0, 0x1000

    if-ne p2, v0, :cond_0

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate;->mBottomSheetHost:Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate$BottomSheetHost;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate$BottomSheetHost;->isExpanded()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate;->mBottomSheetHost:Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate$BottomSheetHost;

    invoke-interface {v0}, Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate$BottomSheetHost;->expandBottomSheet()V

    .line 3
    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerViewAccessibilityDelegate;->performAccessibilityAction(Landroid/view/View;ILandroid/os/Bundle;)Z

    move-result p0

    return p0
.end method
