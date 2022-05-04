.class public Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;
.super Lcom/android/wallpaper/picker/BaseActivity;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/widget/BottomActionBar$BottomActionBarHost;
.implements Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualPickerFragmentHost;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$IndividualPickerActivityIntentFactory;
    }
.end annotation


# instance fields
.field public mCategory:Lcom/android/wallpaper/model/Category;

.field public mCategoryCollectionId:Ljava/lang/String;

.field public mPreviewIntentFactory:Lcom/android/wallpaper/model/InlinePreviewIntentFactory;

.field public mWallpaperId:Ljava/lang/String;

.field public mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/picker/BaseActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public getBottomActionBar()Lcom/android/wallpaper/widget/BottomActionBar;
    .locals 1

    const v0, 0x7f0a0077

    .line 1
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Lcom/android/wallpaper/widget/BottomActionBar;

    return-object p0
.end method

.method public isHostToolbarShown()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public moveToPreviousFragment()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->popBackStack()V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/FragmentActivity;->onActivityResult(IILandroid/content/Intent;)V

    const-string p3, "IndividualPickerAct"

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eq p1, v0, :cond_0

    const/4 v2, 0x4

    if-eq p1, v2, :cond_1

    .line 2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invalid request code: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_0
    move v0, v1

    :cond_1
    const/4 p1, -0x1

    if-ne p2, p1, :cond_3

    .line 3
    iget-object v2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;->mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;

    check-cast v2, Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    invoke-virtual {v2}, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->onLiveWallpaperSet()V

    if-eqz v0, :cond_2

    const v0, 0x7f110149

    .line 4
    :try_start_0
    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not show toast "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    :goto_0
    const p3, 0x7f01001c

    const v0, 0x7f01001d

    .line 7
    invoke-virtual {p0, p3, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 8
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setResult(I)V

    .line 9
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 10
    :cond_3
    :goto_1
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;->mWallpaperId:Ljava/lang/String;

    if-eqz p1, :cond_4

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result p1

    if-nez p1, :cond_4

    .line 11
    invoke-virtual {p0, p2}, Landroid/app/Activity;->setResult(I)V

    .line 12
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :cond_4
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 7

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 2
    new-instance v0, Lcom/android/wallpaper/picker/PreviewActivity$PreviewActivityIntentFactory;

    invoke-direct {v0}, Lcom/android/wallpaper/picker/PreviewActivity$PreviewActivityIntentFactory;-><init>()V

    iput-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;->mPreviewIntentFactory:Lcom/android/wallpaper/model/InlinePreviewIntentFactory;

    .line 3
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    .line 4
    invoke-interface {v0, p0}, Lcom/android/wallpaper/module/Injector;->getWallpaperPersister(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPersister;

    move-result-object v1

    iput-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;->mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;

    if-nez p1, :cond_0

    .line 5
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v1, "com.android.wallpaper.category_collection_id"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string v1, "key_category_collection_id"

    .line 6
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :goto_0
    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;->mCategoryCollectionId:Ljava/lang/String;

    .line 7
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v1, "com.android.wallpaper.wallpaper_id"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;->mWallpaperId:Ljava/lang/String;

    if-nez p1, :cond_1

    const p1, 0x7f0d0034

    .line 8
    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->setContentView(I)V

    const p1, 0x7f0a026d

    .line 9
    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/Toolbar;

    .line 10
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getDelegate()Landroidx/appcompat/app/AppCompatDelegate;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroidx/appcompat/app/AppCompatDelegate;->setSupportActionBar(Landroidx/appcompat/widget/Toolbar;)V

    .line 11
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    const v2, 0x7f0a0101

    .line 12
    invoke-virtual {v1, v2}, Landroidx/fragment/app/FragmentManager;->findFragmentById(I)Landroidx/fragment/app/Fragment;

    move-result-object v3

    .line 13
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroidx/appcompat/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 14
    invoke-virtual {p1}, Landroidx/appcompat/widget/Toolbar;->getNavigationIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    const v6, 0x1010036

    .line 15
    invoke-static {p0, v6}, Landroidx/transition/R$id;->getColorAttr(Landroid/content/Context;I)I

    move-result v6

    .line 16
    invoke-virtual {v4, v6}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 17
    invoke-virtual {p1}, Landroidx/appcompat/widget/Toolbar;->getNavigationIcon()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1, v5}, Landroid/graphics/drawable/Drawable;->setAutoMirrored(Z)V

    if-nez v3, :cond_2

    .line 18
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p1

    iget-object v3, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;->mCategoryCollectionId:Ljava/lang/String;

    .line 19
    invoke-interface {p1, v3}, Lcom/android/wallpaper/module/Injector;->getIndividualPickerFragment(Ljava/lang/String;)Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    move-result-object p1

    .line 20
    new-instance v3, Landroidx/fragment/app/BackStackRecord;

    invoke-direct {v3, v1}, Landroidx/fragment/app/BackStackRecord;-><init>(Landroidx/fragment/app/FragmentManager;)V

    .line 21
    invoke-virtual {v3, v2, p1}, Landroidx/fragment/app/FragmentTransaction;->add(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    invoke-virtual {v3}, Landroidx/fragment/app/BackStackRecord;->commit()I

    goto :goto_1

    :cond_1
    const p1, 0x7f0d0035

    .line 22
    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->setContentView(I)V

    .line 23
    :cond_2
    :goto_1
    invoke-interface {v0, p0}, Lcom/android/wallpaper/module/Injector;->getCategoryProvider(Landroid/content/Context;)Lcom/android/wallpaper/model/CategoryProvider;

    move-result-object p1

    .line 24
    new-instance v0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1;

    invoke-direct {v0, p0, p1}, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1;-><init>(Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;Lcom/android/wallpaper/model/CategoryProvider;)V

    const/4 p0, 0x0

    check-cast p1, Lcom/android/wallpaper/module/DefaultCategoryProvider;

    invoke-virtual {p1, v0, p0}, Lcom/android/wallpaper/module/DefaultCategoryProvider;->fetchCategories(Lcom/android/wallpaper/model/CategoryReceiver;Z)V

    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1

    .line 1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x102002c

    if-ne p1, v0, :cond_0

    .line 2
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/activity/ComponentActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;->mCategoryCollectionId:Ljava/lang/String;

    const-string v0, "key_category_collection_id"

    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public removeToolbarMenu()V
    .locals 0

    return-void
.end method

.method public setToolbarMenu(I)V
    .locals 0

    return-void
.end method

.method public setToolbarTitle(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    .line 2
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method
