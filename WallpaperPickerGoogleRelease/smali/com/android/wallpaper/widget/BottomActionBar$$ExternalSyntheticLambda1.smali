.class public final synthetic Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Ljava/lang/Object;

.field public final synthetic f$1:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/model/WallpaperSectionController;Landroid/view/View;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/StartRotationDialogFragment;Landroid/widget/CheckBox;)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/widget/BottomActionBar;Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    iget v0, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda1;->$r8$classId:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast p1, Lcom/android/wallpaper/model/WallpaperSectionController;

    iget-object p0, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    .line 1
    iget-object v0, p1, Lcom/android/wallpaper/model/WallpaperSectionController;->mPermissionRequester:Lcom/android/wallpaper/model/PermissionRequester;

    new-instance v1, Lcom/android/wallpaper/model/WallpaperSectionController$1;

    invoke-direct {v1, p1, p0}, Lcom/android/wallpaper/model/WallpaperSectionController$1;-><init>(Lcom/android/wallpaper/model/WallpaperSectionController;Landroid/view/View;)V

    invoke-interface {v0, v1}, Lcom/android/wallpaper/model/PermissionRequester;->requestExternalStoragePermission(Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;)V

    return-void

    .line 2
    :pswitch_1
    iget-object v0, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/wallpaper/widget/BottomActionBar;

    iget-object p0, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    check-cast p0, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    .line 3
    iget-object v1, v0, Lcom/android/wallpaper/widget/BottomActionBar;->mBottomSheetBehavior:Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;

    .line 4
    iget v1, v1, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->state:I

    const/4 v2, 0x4

    if-ne v1, v2, :cond_0

    .line 5
    iget-object v1, v0, Lcom/android/wallpaper/widget/BottomActionBar;->mContentViewMap:Ljava/util/Map;

    new-instance v2, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda3;

    invoke-direct {v2, p0}, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda3;-><init>(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    invoke-interface {v1, v2}, Ljava/util/Map;->forEach(Ljava/util/function/BiConsumer;)V

    .line 6
    :cond_0
    iget-object p0, v0, Lcom/android/wallpaper/widget/BottomActionBar;->mBottomSheetView:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setAccessibilityTraversalAfter(I)V

    return-void

    .line 7
    :goto_0
    iget-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast p1, Lcom/android/wallpaper/picker/StartRotationDialogFragment;

    iget-object p0, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    check-cast p0, Landroid/widget/CheckBox;

    sget v0, Lcom/android/wallpaper/picker/StartRotationDialogFragment;->$r8$clinit:I

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    invoke-virtual {p0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p0

    iput-boolean p0, p1, Lcom/android/wallpaper/picker/StartRotationDialogFragment;->mIsWifiOnlyChecked:Z

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
