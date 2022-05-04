.class public Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic this$1:Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;

.field public final synthetic val$appContext:Landroid/content/Context;

.field public final synthetic val$exploreIntent:Landroid/content/Intent;

.field public final synthetic val$homeWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$1;->this$1:Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;

    iput-object p2, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$1;->val$homeWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    iput-object p3, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$1;->val$appContext:Landroid/content/Context;

    iput-object p4, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$1;->val$exploreIntent:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$1;->this$1:Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;

    iget-object p1, p1, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 2
    iget-object p1, p1, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$1;->val$homeWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$1;->val$appContext:Landroid/content/Context;

    .line 4
    invoke-virtual {v0, v1}, Lcom/android/wallpaper/model/WallpaperInfo;->getCollectionId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$1;->val$homeWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v2, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$1;->val$appContext:Landroid/content/Context;

    .line 5
    invoke-virtual {v1, v2}, Lcom/android/wallpaper/model/WallpaperInfo;->getActionLabelRes(Landroid/content/Context;)I

    move-result v1

    .line 6
    invoke-interface {p1, v0, v1}, Lcom/android/wallpaper/module/UserEventLogger;->logActionClicked(Ljava/lang/String;I)V

    .line 7
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$1;->this$1:Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;

    iget-object p1, p1, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$1;->val$exploreIntent:Landroid/content/Intent;

    invoke-virtual {p1, p0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
