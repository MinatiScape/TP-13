.class public Lcom/android/wallpaper/picker/TopLevelPickerActivity$8$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/picker/TopLevelPickerActivity$8;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$1:Lcom/android/wallpaper/picker/TopLevelPickerActivity$8;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/TopLevelPickerActivity$8;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$8$1;->this$1:Lcom/android/wallpaper/picker/TopLevelPickerActivity$8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    return-void
.end method

.method public onSuccess(Lcom/android/wallpaper/model/WallpaperInfo;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$8$1;->this$1:Lcom/android/wallpaper/picker/TopLevelPickerActivity$8;

    iget-object p1, p1, Lcom/android/wallpaper/picker/TopLevelPickerActivity$8;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    .line 2
    :cond_0
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$8$1;->this$1:Lcom/android/wallpaper/picker/TopLevelPickerActivity$8;

    iget-object p1, p1, Lcom/android/wallpaper/picker/TopLevelPickerActivity$8;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->refreshCurrentWallpapers(Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter$RefreshListener;)V

    .line 3
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$8$1;->this$1:Lcom/android/wallpaper/picker/TopLevelPickerActivity$8;

    iget-object v0, p1, Lcom/android/wallpaper/picker/TopLevelPickerActivity$8;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    iget-object p1, p1, Lcom/android/wallpaper/picker/TopLevelPickerActivity$8;->val$stretchOptionBtn:Landroid/widget/Button;

    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, p1, v1}, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->setStretchWallpaperPositionButtonSelected(Landroid/widget/Button;Z)V

    .line 5
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$8$1;->this$1:Lcom/android/wallpaper/picker/TopLevelPickerActivity$8;

    iget-object v0, p1, Lcom/android/wallpaper/picker/TopLevelPickerActivity$8;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    iget-object p1, p1, Lcom/android/wallpaper/picker/TopLevelPickerActivity$8;->val$centerCropOptionBtn:Landroid/widget/Button;

    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, p1, v1}, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->setCenterCropWallpaperPositionButtonSelected(Landroid/widget/Button;Z)V

    .line 7
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$8$1;->this$1:Lcom/android/wallpaper/picker/TopLevelPickerActivity$8;

    iget-object v0, p1, Lcom/android/wallpaper/picker/TopLevelPickerActivity$8;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    iget-object p1, p1, Lcom/android/wallpaper/picker/TopLevelPickerActivity$8;->val$centerOptionBtn:Landroid/widget/Button;

    .line 8
    invoke-virtual {v0, p1, v1}, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->setCenterWallpaperPositionButtonSelected(Landroid/widget/Button;Z)V

    .line 9
    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$8$1;->this$1:Lcom/android/wallpaper/picker/TopLevelPickerActivity$8;

    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$8;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 10
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
