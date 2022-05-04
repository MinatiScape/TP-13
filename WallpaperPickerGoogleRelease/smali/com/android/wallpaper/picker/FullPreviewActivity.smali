.class public Lcom/android/wallpaper/picker/FullPreviewActivity;
.super Lcom/android/wallpaper/picker/BasePreviewActivity;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/picker/AppbarFragment$AppbarFragmentHost;


# static fields
.field public static final synthetic $r8$clinit:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/picker/BasePreviewActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public isUpArrowSupported()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/android/wallpaper/util/ActivityUtils;->isSUWMode(Landroid/content/Context;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 11

    .line 1
    invoke-super {p0, p1}, Lcom/android/wallpaper/picker/BasePreviewActivity;->onCreate(Landroid/os/Bundle;)V

    .line 2
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/view/Window;->setAllowEnterTransitionOverlap(Z)V

    .line 3
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v1, 0xd

    invoke-virtual {p1, v1}, Landroid/view/Window;->requestFeature(I)Z

    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    new-instance v1, Landroid/transition/Slide;

    invoke-direct {v1}, Landroid/transition/Slide;-><init>()V

    invoke-virtual {p1, v1}, Landroid/view/Window;->setExitTransition(Landroid/transition/Transition;)V

    .line 5
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    new-instance v1, Landroid/transition/Slide;

    invoke-direct {v1}, Landroid/transition/Slide;-><init>()V

    invoke-virtual {p1, v1}, Landroid/view/Window;->setEnterTransition(Landroid/transition/Transition;)V

    const p1, 0x7f0d0033

    .line 6
    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->setContentView(I)V

    .line 7
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/BasePreviewActivity;->enableFullScreen()V

    .line 8
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    const v1, 0x7f0a0101

    .line 9
    invoke-virtual {p1, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentById(I)Landroidx/fragment/app/Fragment;

    move-result-object v2

    if-nez v2, :cond_0

    .line 10
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "com.android.wallpaper.picker.wallpaper_info"

    .line 11
    invoke-virtual {v2, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v3

    move-object v6, v3

    check-cast v6, Lcom/android/wallpaper/model/WallpaperInfo;

    const-string v3, "com.android.wallpaper.picker.view_as_home"

    .line 12
    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v8

    const/4 v0, 0x0

    const-string v3, "com.android.wallpaper.picker.testing_mode_enabled"

    .line 13
    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v10

    .line 14
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v4

    const/4 v7, 0x1

    const/4 v9, 0x1

    move-object v5, p0

    invoke-interface/range {v4 .. v10}, Lcom/android/wallpaper/module/Injector;->getPreviewFragment(Landroid/content/Context;Lcom/android/wallpaper/model/WallpaperInfo;IZZZ)Landroidx/fragment/app/Fragment;

    move-result-object p0

    .line 15
    new-instance v0, Landroidx/fragment/app/BackStackRecord;

    invoke-direct {v0, p1}, Landroidx/fragment/app/BackStackRecord;-><init>(Landroidx/fragment/app/FragmentManager;)V

    .line 16
    invoke-virtual {v0, v1, p0}, Landroidx/fragment/app/FragmentTransaction;->add(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 17
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    :cond_0
    return-void
.end method

.method public onUpArrowPressed()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    return-void
.end method
