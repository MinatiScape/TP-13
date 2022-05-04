.class public Lcom/android/wallpaper/picker/TopLevelPickerActivity$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/NetworkStatusNotifier$Listener;


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

.field public final synthetic val$savedInstanceState:Landroid/os/Bundle;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/TopLevelPickerActivity;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$2;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    iput-object p2, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$2;->val$savedInstanceState:Landroid/os/Bundle;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onNetworkChanged(I)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$2;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$2;->val$savedInstanceState:Landroid/os/Bundle;

    sget v1, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->$r8$clinit:I

    const/4 v1, 0x0

    const/4 v2, -0x1

    const v3, 0x7f0a0101

    const/4 v4, 0x1

    if-ne p1, v4, :cond_4

    .line 2
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    .line 3
    invoke-virtual {p1, v3}, Landroidx/fragment/app/FragmentManager;->findFragmentById(I)Landroidx/fragment/app/Fragment;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 4
    instance-of v5, v3, Lcom/android/wallpaper/picker/OfflineDesktopFragment;

    if-eqz v5, :cond_0

    goto :goto_0

    :cond_0
    move v5, v1

    goto :goto_1

    :cond_1
    :goto_0
    move v5, v4

    :goto_1
    if-eqz v3, :cond_2

    .line 5
    new-instance v6, Landroidx/fragment/app/BackStackRecord;

    invoke-direct {v6, p1}, Landroidx/fragment/app/BackStackRecord;-><init>(Landroidx/fragment/app/FragmentManager;)V

    .line 6
    invoke-virtual {v6, v3}, Landroidx/fragment/app/BackStackRecord;->remove(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 7
    invoke-virtual {v6}, Landroidx/fragment/app/BackStackRecord;->commit()I

    :cond_2
    if-eqz p0, :cond_3

    const-string p1, "selected_category_tab"

    .line 8
    invoke-virtual {p0, p1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    :cond_3
    iput v2, v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mLastSelectedCategoryTabIndex:I

    .line 9
    iget-object p0, v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    invoke-virtual {p0, v5}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->populateCategories(Z)V

    .line 10
    invoke-virtual {v0, v4}, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->setDesktopLoading(Z)V

    .line 11
    iget-object p0, v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mBottomSheet:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 12
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p1, 0x7f0800be

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    .line 13
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object p0

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    const p1, 0x1010435

    .line 14
    invoke-static {v0, p1}, Landroidx/transition/R$id;->getColorAttr(Landroid/content/Context;I)I

    move-result p1

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 15
    invoke-virtual {p0, p1, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 16
    iget-object p1, v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mCurrentWallpaperSkipWallpaperButton:Landroid/widget/Button;

    const/4 v1, 0x0

    .line 17
    invoke-virtual {p1, p0, v1, v1, v1}, Landroid/widget/Button;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 18
    iget-object p0, v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mBottomSheet:Landroid/widget/LinearLayout;

    .line 19
    invoke-static {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    move-result-object p0

    .line 20
    new-instance p1, Lcom/android/wallpaper/picker/TopLevelPickerActivity$3;

    invoke-direct {p1, v0}, Lcom/android/wallpaper/picker/TopLevelPickerActivity$3;-><init>(Lcom/android/wallpaper/picker/TopLevelPickerActivity;)V

    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 21
    invoke-virtual {v0, v1}, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->refreshCurrentWallpapers(Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter$RefreshListener;)V

    goto :goto_2

    .line 22
    :cond_4
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    .line 23
    invoke-virtual {p0, v3}, Landroidx/fragment/app/FragmentManager;->findFragmentById(I)Landroidx/fragment/app/Fragment;

    move-result-object p1

    if-eqz p1, :cond_5

    .line 24
    new-instance v5, Landroidx/fragment/app/BackStackRecord;

    invoke-direct {v5, p0}, Landroidx/fragment/app/BackStackRecord;-><init>(Landroidx/fragment/app/FragmentManager;)V

    .line 25
    invoke-virtual {v5, p1}, Landroidx/fragment/app/BackStackRecord;->remove(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 26
    invoke-virtual {v5}, Landroidx/fragment/app/BackStackRecord;->commit()I

    .line 27
    :cond_5
    new-instance p1, Lcom/android/wallpaper/picker/OfflineDesktopFragment;

    invoke-direct {p1}, Lcom/android/wallpaper/picker/OfflineDesktopFragment;-><init>()V

    .line 28
    new-instance v5, Landroidx/fragment/app/BackStackRecord;

    invoke-direct {v5, p0}, Landroidx/fragment/app/BackStackRecord;-><init>(Landroidx/fragment/app/FragmentManager;)V

    .line 29
    invoke-virtual {v5, v3, p1}, Landroidx/fragment/app/FragmentTransaction;->add(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 30
    invoke-virtual {v5}, Landroidx/fragment/app/BackStackRecord;->commit()I

    .line 31
    iput v2, v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mLastSelectedCategoryTabIndex:I

    .line 32
    iget-object p0, v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    invoke-virtual {p0, v4}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->populateCategories(Z)V

    .line 33
    invoke-virtual {v0, v1}, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->setDesktopLoading(Z)V

    .line 34
    invoke-virtual {v0, v1}, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->setCurrentWallpapersExpanded(Z)V

    :goto_2
    return-void
.end method
