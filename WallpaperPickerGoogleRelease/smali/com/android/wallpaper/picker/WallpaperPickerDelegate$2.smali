.class public Lcom/android/wallpaper/picker/WallpaperPickerDelegate$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/model/CategoryReceiver;


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

.field public final synthetic val$packageName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/WallpaperPickerDelegate;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$2;->this$0:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    iput-object p2, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$2;->val$packageName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doneFetchingCategories()V
    .locals 0

    return-void
.end method

.method public onCategoryReceived(Lcom/android/wallpaper/model/Category;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/android/wallpaper/model/Category;->supportsThirdParty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$2;->val$packageName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/android/wallpaper/model/Category;->containsThirdParty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$2;->this$0:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->addCategory(Lcom/android/wallpaper/model/Category;Z)V

    :cond_0
    return-void
.end method
