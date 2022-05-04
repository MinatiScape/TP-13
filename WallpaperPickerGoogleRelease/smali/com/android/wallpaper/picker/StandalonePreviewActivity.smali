.class public Lcom/android/wallpaper/picker/StandalonePreviewActivity;
.super Lcom/android/wallpaper/picker/BasePreviewActivity;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/picker/AppbarFragment$AppbarFragmentHost;


# instance fields
.field public mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/picker/BasePreviewActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public enableFullScreen()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/wallpaper/picker/BasePreviewActivity;->enableFullScreen()V

    .line 2
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    const/16 v0, 0x200

    invoke-virtual {p0, v0, v0}, Landroid/view/Window;->setFlags(II)V

    return-void
.end method

.method public isUpArrowSupported()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    const-string v0, "up_arrow"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public final loadPreviewFragment()V
    .locals 10

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "com.android.wallpaper.picker.testing_mode_enabled"

    const/4 v2, 0x0

    .line 2
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v9

    .line 3
    new-instance v5, Lcom/android/wallpaper/model/ImageWallpaperInfo;

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    invoke-direct {v5, v0}, Lcom/android/wallpaper/model/ImageWallpaperInfo;-><init>(Landroid/net/Uri;)V

    .line 4
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v3

    const/4 v6, 0x1

    const/4 v7, 0x1

    const/4 v8, 0x0

    move-object v4, p0

    invoke-interface/range {v3 .. v9}, Lcom/android/wallpaper/module/Injector;->getPreviewFragment(Landroid/content/Context;Lcom/android/wallpaper/model/WallpaperInfo;IZZZ)Landroidx/fragment/app/Fragment;

    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    .line 6
    new-instance v1, Landroidx/fragment/app/BackStackRecord;

    invoke-direct {v1, p0}, Landroidx/fragment/app/BackStackRecord;-><init>(Landroidx/fragment/app/FragmentManager;)V

    const p0, 0x7f0a0101

    .line 7
    invoke-virtual {v1, p0, v0}, Landroidx/fragment/app/FragmentTransaction;->add(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 8
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    return-void
.end method

.method public onAttachedToWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onAttachedToWindow()V

    .line 2
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const v1, 0x7f0a0101

    .line 3
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentById(I)Landroidx/fragment/app/Fragment;

    move-result-object v0

    if-nez v0, :cond_0

    .line 4
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/StandalonePreviewActivity;->loadPreviewFragment()V

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Lcom/android/wallpaper/picker/BasePreviewActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0d0036

    .line 2
    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->setContentView(I)V

    .line 3
    new-instance p1, Lcom/android/wallpaper/module/LargeScreenMultiPanesChecker;

    invoke-direct {p1}, Lcom/android/wallpaper/module/LargeScreenMultiPanesChecker;-><init>()V

    .line 4
    invoke-virtual {p1, p0}, Lcom/android/wallpaper/module/LargeScreenMultiPanesChecker;->isMultiPanesEnabled(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_4

    .line 5
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v3, "is_from_settings_homepage"

    .line 6
    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_0

    move v3, v2

    goto :goto_0

    :cond_0
    move v3, v1

    :goto_0
    const-string v4, "android.intent.extra.STREAM"

    if-nez v3, :cond_2

    .line 7
    invoke-static {v0}, Lcom/android/wallpaper/util/ActivityUtils;->isLaunchedFromSettingsRelated(Landroid/content/Intent;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 8
    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 9
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5, v3, v2}, Landroid/app/Activity;->grantUriPermission(Ljava/lang/String;Landroid/net/Uri;I)V

    .line 10
    :cond_1
    invoke-virtual {p1, v0}, Lcom/android/wallpaper/module/LargeScreenMultiPanesChecker;->getMultiPanesIntent(Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object p1

    const/high16 v3, 0x10000000

    .line 11
    invoke-virtual {p1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v3

    .line 12
    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v3, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v0

    const-string v3, "up_arrow"

    .line 13
    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 14
    invoke-static {p0, p1, v1}, Lcom/android/wallpaper/util/ActivityUtils;->startActivityForResultSafely(Landroid/app/Activity;Landroid/content/Intent;I)V

    .line 15
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    goto :goto_2

    .line 16
    :cond_2
    invoke-virtual {v0, v4}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-virtual {v0, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/net/Uri;

    goto :goto_1

    :cond_3
    const/4 p1, 0x0

    :goto_1
    if-eqz p1, :cond_4

    .line 17
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 18
    :cond_4
    :goto_2
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/StandalonePreviewActivity;->enableFullScreen()V

    .line 19
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p1

    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/android/wallpaper/module/Injector;->getUserEventLogger(Landroid/content/Context;)Lcom/android/wallpaper/module/UserEventLogger;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/picker/StandalonePreviewActivity;->mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    .line 20
    invoke-interface {p1}, Lcom/android/wallpaper/module/UserEventLogger;->logStandalonePreviewLaunched()V

    .line 21
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    .line 22
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-nez p1, :cond_5

    const-string p1, "StandalonePreview"

    const-string v0, "No URI passed in intent; exiting StandalonePreviewActivity"

    .line 23
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void

    .line 25
    :cond_5
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v0

    .line 26
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v3

    .line 27
    invoke-virtual {p0, p1, v0, v3, v2}, Landroid/app/Activity;->checkUriPermission(Landroid/net/Uri;III)I

    move-result p1

    if-nez p1, :cond_6

    move p1, v2

    goto :goto_3

    :cond_6
    move p1, v1

    .line 28
    :goto_3
    iget-object v0, p0, Lcom/android/wallpaper/picker/StandalonePreviewActivity;->mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logStandalonePreviewImageUriHasReadPermission(Z)V

    if-nez p1, :cond_8

    .line 29
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    .line 30
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const-string v3, "android.permission.READ_EXTERNAL_STORAGE"

    .line 31
    invoke-virtual {p1, v3, v0}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_7

    move v1, v2

    :cond_7
    if-nez v1, :cond_8

    .line 32
    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, v2}, Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V

    :cond_8
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 2

    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    .line 1
    array-length p1, p2

    const/4 v1, 0x0

    if-lez p1, :cond_0

    aget-object p1, p2, v1

    const-string p2, "android.permission.READ_EXTERNAL_STORAGE"

    .line 2
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    array-length p1, p3

    if-lez p1, :cond_0

    aget p1, p3, v1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    move v0, v1

    .line 3
    :goto_0
    iget-object p1, p0, Lcom/android/wallpaper/picker/StandalonePreviewActivity;->mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    invoke-interface {p1, v0}, Lcom/android/wallpaper/module/UserEventLogger;->logStandalonePreviewStorageDialogApproved(Z)V

    if-nez v0, :cond_1

    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 5
    :cond_1
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/StandalonePreviewActivity;->loadPreviewFragment()V

    :cond_2
    return-void
.end method

.method public onUpArrowPressed()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    return-void
.end method
