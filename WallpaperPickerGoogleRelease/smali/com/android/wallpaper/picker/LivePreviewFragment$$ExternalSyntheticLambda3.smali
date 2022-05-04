.class public final synthetic Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/util/FullScreenAnimation$FullScreenStatusListener;
.implements Lcom/android/wallpaper/widget/WallpaperColorsLoader$Callback;


# instance fields
.field public final synthetic f$0:Lcom/android/wallpaper/picker/LivePreviewFragment;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/LivePreviewFragment;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda3;->f$0:Lcom/android/wallpaper/picker/LivePreviewFragment;

    return-void
.end method


# virtual methods
.method public onFullScreenStatusChange(Z)V
    .locals 2

    iget-object p0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda3;->f$0:Lcom/android/wallpaper/picker/LivePreviewFragment;

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mLockScreenPreviewer:Lcom/android/wallpaper/widget/LockScreenPreviewer;

    xor-int/lit8 v1, p1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/wallpaper/widget/LockScreenPreviewer;->setDateViewVisibility(Z)V

    if-nez p1, :cond_0

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    sget-object p1, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->EDIT:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    .line 3
    iget-object p0, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mActionMap:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/view/View;->sendAccessibilityEvent(I)V

    :cond_0
    return-void
.end method

.method public onLoaded(Landroid/app/WallpaperColors;)V
    .locals 1

    iget-object p0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda3;->f$0:Lcom/android/wallpaper/picker/LivePreviewFragment;

    sget v0, Lcom/android/wallpaper/picker/LivePreviewFragment;->$r8$clinit:I

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, p1, v0}, Lcom/android/wallpaper/picker/LivePreviewFragment;->onWallpaperColorsChanged(Landroid/app/WallpaperColors;I)V

    return-void
.end method
