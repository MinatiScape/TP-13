.class public final synthetic Lcom/android/wallpaper/picker/WallpaperPickerDelegate$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/WallpaperPickerDelegate;I)V
    .locals 1

    iput p2, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$$ExternalSyntheticLambda0;->$r8$classId:I

    const/4 v0, 0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    return-void
.end method


# virtual methods
.method public final onPackageChanged(Ljava/lang/String;I)V
    .locals 4

    iget v0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$$ExternalSyntheticLambda0;->$r8$classId:I

    const/4 v1, 0x1

    const/4 v2, 0x3

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_4

    :pswitch_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    if-ne p2, v1, :cond_0

    .line 1
    iget-object p2, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    new-instance v0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$2;

    invoke-direct {v0, p0, p1}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$2;-><init>(Lcom/android/wallpaper/picker/WallpaperPickerDelegate;Ljava/lang/String;)V

    check-cast p2, Lcom/android/wallpaper/module/DefaultCategoryProvider;

    invoke-virtual {p2, v0, v1}, Lcom/android/wallpaper/module/DefaultCategoryProvider;->fetchCategories(Lcom/android/wallpaper/model/CategoryReceiver;Z)V

    goto :goto_2

    :cond_0
    if-ne p2, v2, :cond_4

    .line 2
    iget-object p2, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    check-cast p2, Lcom/android/wallpaper/module/DefaultCategoryProvider;

    .line 3
    iget-boolean v0, p2, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mFetchedCategories:Z

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    iget-object p2, p2, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mCategories:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    goto :goto_0

    :cond_1
    move p2, v2

    :goto_0
    if-ge v2, p2, :cond_3

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    check-cast v0, Lcom/android/wallpaper/module/DefaultCategoryProvider;

    invoke-virtual {v0, v2}, Lcom/android/wallpaper/module/DefaultCategoryProvider;->getCategory(I)Lcom/android/wallpaper/model/Category;

    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/wallpaper/model/Category;->supportsThirdParty()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {v0, p1}, Lcom/android/wallpaper/model/Category;->containsThirdParty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_1

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    const/4 v0, 0x0

    :goto_1
    if-eqz v0, :cond_5

    .line 6
    iget-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    new-instance p2, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$3;

    invoke-direct {p2, p0, v0}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$3;-><init>(Lcom/android/wallpaper/picker/WallpaperPickerDelegate;Lcom/android/wallpaper/model/Category;)V

    check-cast p1, Lcom/android/wallpaper/module/DefaultCategoryProvider;

    invoke-virtual {p1, p2, v1}, Lcom/android/wallpaper/module/DefaultCategoryProvider;->fetchCategories(Lcom/android/wallpaper/model/CategoryReceiver;Z)V

    goto :goto_2

    .line 7
    :cond_4
    invoke-virtual {p0, v1}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->populateCategories(Z)V

    :cond_5
    :goto_2
    return-void

    .line 8
    :pswitch_1
    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    .line 9
    iget-object v0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mActivity:Landroidx/fragment/app/FragmentActivity;

    const v3, 0x7f1100a4

    invoke-virtual {v0, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 10
    iget-object v3, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    check-cast v3, Lcom/android/wallpaper/module/DefaultCategoryProvider;

    invoke-virtual {v3, v0}, Lcom/android/wallpaper/module/DefaultCategoryProvider;->getCategory(Ljava/lang/String;)Lcom/android/wallpaper/model/Category;

    move-result-object v3

    if-ne p2, v2, :cond_6

    if-eqz v3, :cond_7

    .line 11
    invoke-virtual {v3, p1}, Lcom/android/wallpaper/model/Category;->containsThirdParty(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_6

    goto :goto_3

    .line 12
    :cond_6
    iget-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    new-instance p2, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$4;

    invoke-direct {p2, p0, v0, v3}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$4;-><init>(Lcom/android/wallpaper/picker/WallpaperPickerDelegate;Ljava/lang/String;Lcom/android/wallpaper/model/Category;)V

    check-cast p1, Lcom/android/wallpaper/module/DefaultCategoryProvider;

    invoke-virtual {p1, p2, v1}, Lcom/android/wallpaper/module/DefaultCategoryProvider;->fetchCategories(Lcom/android/wallpaper/model/CategoryReceiver;Z)V

    :cond_7
    :goto_3
    return-void

    .line 13
    :goto_4
    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    if-eq p2, v2, :cond_8

    .line 14
    invoke-virtual {p0, v1}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->populateCategories(Z)V

    :cond_8
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
