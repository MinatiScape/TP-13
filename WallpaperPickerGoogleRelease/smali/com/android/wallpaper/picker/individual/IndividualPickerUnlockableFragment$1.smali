.class public Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/model/CategoryReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;->fetchWallpapers(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

.field public final synthetic val$forceReload:Z


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

    iput-boolean p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$1;->val$forceReload:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doneFetchingCategories()V
    .locals 0

    return-void
.end method

.method public onCategoryReceived(Lcom/android/wallpaper/model/Category;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/android/wallpaper/model/Category;->mCollectionId:Ljava/lang/String;

    .line 2
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

    iget-object v1, v1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCategory:Lcom/android/wallpaper/model/WallpaperCategory;

    .line 3
    iget-object v1, v1, Lcom/android/wallpaper/model/Category;->mCollectionId:Ljava/lang/String;

    .line 4
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 5
    :cond_0
    instance-of v0, p1, Lcom/android/wallpaper/model/WallpaperCategory;

    if-nez v0, :cond_1

    return-void

    .line 6
    :cond_1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

    iget-object v0, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpapers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 7
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

    .line 8
    iget-object v0, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;->mDownloadableWallpapers:Ljava/util/List;

    .line 9
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 10
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mIsWallpapersReceived:Z

    .line 11
    invoke-virtual {v0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->updateLoading()V

    .line 12
    check-cast p1, Lcom/android/wallpaper/model/WallpaperCategory;

    .line 13
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$1;)V

    iget-boolean p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$1;->val$forceReload:Z

    invoke-virtual {p1, v0, v1, p0}, Lcom/android/wallpaper/model/WallpaperCategory;->fetchWallpapers(Landroid/content/Context;Lcom/android/wallpaper/model/WallpaperReceiver;Z)V

    return-void
.end method
