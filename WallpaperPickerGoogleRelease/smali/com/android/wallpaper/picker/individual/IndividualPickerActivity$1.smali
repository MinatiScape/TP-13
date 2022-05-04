.class public Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/model/CategoryReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;

.field public final synthetic val$categoryProvider:Lcom/android/wallpaper/model/CategoryProvider;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;Lcom/android/wallpaper/model/CategoryProvider;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;

    iput-object p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1;->val$categoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doneFetchingCategories()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;

    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1;->val$categoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    .line 2
    iget-object v2, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;->mCategoryCollectionId:Ljava/lang/String;

    .line 3
    check-cast v1, Lcom/android/wallpaper/module/DefaultCategoryProvider;

    invoke-virtual {v1, v2}, Lcom/android/wallpaper/module/DefaultCategoryProvider;->getCategory(Ljava/lang/String;)Lcom/android/wallpaper/model/Category;

    move-result-object v1

    .line 4
    iput-object v1, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;->mCategory:Lcom/android/wallpaper/model/Category;

    .line 5
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;

    .line 6
    iget-object v1, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;->mCategory:Lcom/android/wallpaper/model/Category;

    if-nez v1, :cond_0

    const-string v0, "Failed to find the category: "

    .line 7
    invoke-static {v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;

    .line 8
    iget-object v1, v1, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;->mCategoryCollectionId:Ljava/lang/String;

    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;

    const-string v2, "IndividualPickerAct"

    .line 10
    invoke-static {v2, v0, v1}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 11
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void

    .line 12
    :cond_0
    iget-object v2, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;->mWallpaperId:Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 13
    check-cast v1, Lcom/android/wallpaper/model/WallpaperCategory;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v2, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1;)V

    const/4 p0, 0x0

    invoke-virtual {v1, v0, v2, p0}, Lcom/android/wallpaper/model/WallpaperCategory;->fetchWallpapers(Landroid/content/Context;Lcom/android/wallpaper/model/WallpaperReceiver;Z)V

    goto :goto_0

    .line 14
    :cond_1
    iget-object p0, v1, Lcom/android/wallpaper/model/Category;->mTitle:Ljava/lang/String;

    .line 15
    invoke-virtual {v0, p0}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    .line 16
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object p0

    iget-object v0, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;->mCategory:Lcom/android/wallpaper/model/Category;

    .line 17
    iget-object v0, v0, Lcom/android/wallpaper/model/Category;->mTitle:Ljava/lang/String;

    .line 18
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method

.method public onCategoryReceived(Lcom/android/wallpaper/model/Category;)V
    .locals 0

    return-void
.end method
