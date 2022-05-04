.class public Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/model/CategoryReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$4;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doneFetchingCategories()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$4;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    .line 2
    iget-object v1, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    .line 3
    iget-object v0, v0, Landroidx/fragment/app/Fragment;->mArguments:Landroid/os/Bundle;

    const-string v2, "category_collection_id"

    .line 4
    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 5
    check-cast v1, Lcom/android/wallpaper/module/DefaultCategoryProvider;

    invoke-virtual {v1, v0}, Lcom/android/wallpaper/module/DefaultCategoryProvider;->getCategory(Ljava/lang/String;)Lcom/android/wallpaper/model/Category;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 6
    instance-of v1, v0, Lcom/android/wallpaper/model/WallpaperCategory;

    if-nez v1, :cond_0

    return-void

    .line 7
    :cond_0
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$4;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    check-cast v0, Lcom/android/wallpaper/model/WallpaperCategory;

    iput-object v0, v1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCategory:Lcom/android/wallpaper/model/WallpaperCategory;

    if-nez v0, :cond_1

    .line 8
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "IndividualPickerFrgmnt"

    const-string v2, "Failed to find the category."

    invoke-static {v1, v2, v0}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 9
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$4;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    .line 10
    invoke-virtual {v0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->getIndividualPickerFragmentHost()Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualPickerFragmentHost;

    move-result-object v0

    .line 11
    invoke-interface {v0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualPickerFragmentHost;->moveToPreviousFragment()V

    .line 12
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$4;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    const v0, 0x7f110054

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p0

    .line 13
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    .line 14
    :cond_1
    invoke-virtual {v1}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->onCategoryLoaded()V

    return-void
.end method

.method public onCategoryReceived(Lcom/android/wallpaper/model/Category;)V
    .locals 0

    return-void
.end method
