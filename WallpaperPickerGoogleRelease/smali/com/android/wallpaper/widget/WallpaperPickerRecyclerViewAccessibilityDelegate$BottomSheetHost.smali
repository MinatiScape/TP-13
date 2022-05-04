.class public interface abstract Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate$BottomSheetHost;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "BottomSheetHost"
.end annotation


# virtual methods
.method public abstract expandBottomSheet()V
.end method

.method public abstract getBottomSheetState()I
.end method

.method public isExpanded()Z
    .locals 1

    .line 1
    invoke-interface {p0}, Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate$BottomSheetHost;->getBottomSheetState()I

    move-result p0

    const/4 v0, 0x3

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
