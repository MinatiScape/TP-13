.class public Lcom/android/wallpaper/picker/ViewOnlyPreviewActivity;
.super Lcom/android/wallpaper/picker/BasePreviewActivity;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/picker/AppbarFragment$AppbarFragmentHost;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/picker/ViewOnlyPreviewActivity$ViewOnlyPreviewActivityIntentFactory;
    }
.end annotation


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
    .locals 10

    .line 1
    invoke-super {p0, p1}, Lcom/android/wallpaper/picker/BasePreviewActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0d0036

    .line 2
    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->setContentView(I)V

    .line 3
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/BasePreviewActivity;->enableFullScreen()V

    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    const v0, 0x7f0a0101

    .line 5
    invoke-virtual {p1, v0}, Landroidx/fragment/app/FragmentManager;->findFragmentById(I)Landroidx/fragment/app/Fragment;

    move-result-object v1

    if-nez v1, :cond_0

    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "com.android.wallpaper.picker.wallpaper_info"

    .line 7
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Lcom/android/wallpaper/model/WallpaperInfo;

    const/4 v2, 0x0

    const-string v3, "com.android.wallpaper.picker.testing_mode_enabled"

    .line 8
    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v9

    const/4 v2, 0x1

    const-string v3, "com.android.wallpaper.picker.view_as_home"

    .line 9
    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v7

    .line 10
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v3

    const/4 v6, 0x0

    const/4 v8, 0x0

    move-object v4, p0

    invoke-interface/range {v3 .. v9}, Lcom/android/wallpaper/module/Injector;->getPreviewFragment(Landroid/content/Context;Lcom/android/wallpaper/model/WallpaperInfo;IZZZ)Landroidx/fragment/app/Fragment;

    move-result-object p0

    .line 11
    new-instance v1, Landroidx/fragment/app/BackStackRecord;

    invoke-direct {v1, p1}, Landroidx/fragment/app/BackStackRecord;-><init>(Landroidx/fragment/app/FragmentManager;)V

    .line 12
    invoke-virtual {v1, v0, p0}, Landroidx/fragment/app/FragmentTransaction;->add(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 13
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    :cond_0
    return-void
.end method

.method public onUpArrowPressed()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    return-void
.end method
