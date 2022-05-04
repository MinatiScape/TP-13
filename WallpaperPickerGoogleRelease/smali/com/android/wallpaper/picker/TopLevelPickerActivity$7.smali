.class public Lcom/android/wallpaper/picker/TopLevelPickerActivity$7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

.field public final synthetic val$centerCropOptionBtn:Landroid/widget/Button;

.field public final synthetic val$centerOptionBtn:Landroid/widget/Button;

.field public final synthetic val$stretchOptionBtn:Landroid/widget/Button;

.field public final synthetic val$wallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/TopLevelPickerActivity;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$7;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    iput-object p2, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$7;->val$wallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;

    iput-object p3, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$7;->val$centerCropOptionBtn:Landroid/widget/Button;

    iput-object p4, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$7;->val$centerOptionBtn:Landroid/widget/Button;

    iput-object p5, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$7;->val$stretchOptionBtn:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$7;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 2
    iget-object v0, p1, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;

    .line 3
    iget-object v1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$7;->val$wallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;

    const/4 v2, 0x1

    new-instance v3, Lcom/android/wallpaper/picker/TopLevelPickerActivity$7$1;

    invoke-direct {v3, p0}, Lcom/android/wallpaper/picker/TopLevelPickerActivity$7$1;-><init>(Lcom/android/wallpaper/picker/TopLevelPickerActivity$7;)V

    check-cast v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    invoke-virtual {v0, p1, v1, v2, v3}, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->setIndividualWallpaperWithPosition(Landroid/app/Activity;Lcom/android/wallpaper/model/WallpaperInfo;ILcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V

    return-void
.end method
