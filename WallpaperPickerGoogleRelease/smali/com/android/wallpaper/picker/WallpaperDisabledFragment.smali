.class public Lcom/android/wallpaper/picker/WallpaperDisabledFragment;
.super Landroidx/fragment/app/Fragment;
.source "SourceFile"


# static fields
.field public static final synthetic $r8$clinit:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p3

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-interface {p3, v0}, Lcom/android/wallpaper/module/Injector;->getFormFactorChecker(Landroid/content/Context;)Lcom/android/wallpaper/util/DownloadableUtils;

    move-result-object p3

    .line 2
    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const p3, 0x7f0d005e

    const/4 v0, 0x0

    .line 3
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 4
    iget-object p0, p0, Landroidx/fragment/app/Fragment;->mArguments:Landroid/os/Bundle;

    const-string p2, "wallpaper_support_level"

    .line 5
    invoke-virtual {p0, p2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p0

    const p2, 0x7f0a0289

    .line 6
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    const/4 p3, 0x1

    if-ne p0, p3, :cond_0

    const p0, 0x7f110145

    .line 7
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    :cond_0
    const/4 p3, 0x2

    if-ne p0, p3, :cond_1

    const p0, 0x7f110146

    .line 8
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(I)V

    :cond_1
    :goto_0
    return-object p1
.end method

.method public onResume()V
    .locals 2

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->mCalled:Z

    .line 2
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    invoke-interface {v0, p0}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object p0

    .line 3
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-interface {p0, v0, v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLastAppActiveTimestamp(J)V

    return-void
.end method
