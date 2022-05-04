.class public Lcom/android/wallpaper/picker/WallpaperPickerDelegate$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/model/CategoryReceiver;


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

.field public final synthetic val$liveWallpaperCollectionId:Ljava/lang/String;

.field public final synthetic val$oldLiveWallpapersCategory:Lcom/android/wallpaper/model/Category;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/WallpaperPickerDelegate;Ljava/lang/String;Lcom/android/wallpaper/model/Category;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$4;->this$0:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    iput-object p2, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$4;->val$liveWallpaperCollectionId:Ljava/lang/String;

    iput-object p3, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$4;->val$oldLiveWallpapersCategory:Lcom/android/wallpaper/model/Category;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doneFetchingCategories()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$4;->this$0:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    .line 2
    iget-object v0, v0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    .line 3
    iget-object v1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$4;->val$liveWallpaperCollectionId:Ljava/lang/String;

    check-cast v0, Lcom/android/wallpaper/module/DefaultCategoryProvider;

    invoke-virtual {v0, v1}, Lcom/android/wallpaper/module/DefaultCategoryProvider;->getCategory(Ljava/lang/String;)Lcom/android/wallpaper/model/Category;

    move-result-object v0

    if-nez v0, :cond_0

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$4;->this$0:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$4;->val$oldLiveWallpapersCategory:Lcom/android/wallpaper/model/Category;

    invoke-virtual {v0, p0}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->removeCategory(Lcom/android/wallpaper/model/Category;)V

    goto :goto_0

    .line 5
    :cond_0
    iget-object v1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$4;->val$oldLiveWallpapersCategory:Lcom/android/wallpaper/model/Category;

    if-eqz v1, :cond_1

    .line 6
    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$4;->this$0:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    .line 7
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->getCategorySelectorFragment()Lcom/android/wallpaper/picker/CategorySelectorFragment;

    move-result-object p0

    if-eqz p0, :cond_2

    .line 8
    invoke-virtual {p0, v0}, Lcom/android/wallpaper/picker/CategorySelectorFragment;->updateCategory(Lcom/android/wallpaper/model/Category;)V

    goto :goto_0

    .line 9
    :cond_1
    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$4;->this$0:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->addCategory(Lcom/android/wallpaper/model/Category;Z)V

    :cond_2
    :goto_0
    return-void
.end method

.method public onCategoryReceived(Lcom/android/wallpaper/model/Category;)V
    .locals 0

    return-void
.end method
