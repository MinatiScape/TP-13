.class public Lcom/android/wallpaper/picker/WallpaperPickerDelegate$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/model/CategoryReceiver;


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

.field public final synthetic val$oldCategory:Lcom/android/wallpaper/model/Category;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/WallpaperPickerDelegate;Lcom/android/wallpaper/model/Category;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$3;->this$0:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    iput-object p2, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$3;->val$oldCategory:Lcom/android/wallpaper/model/Category;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doneFetchingCategories()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$3;->this$0:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$3;->val$oldCategory:Lcom/android/wallpaper/model/Category;

    invoke-virtual {v0, p0}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->removeCategory(Lcom/android/wallpaper/model/Category;)V

    return-void
.end method

.method public onCategoryReceived(Lcom/android/wallpaper/model/Category;)V
    .locals 0

    return-void
.end method
