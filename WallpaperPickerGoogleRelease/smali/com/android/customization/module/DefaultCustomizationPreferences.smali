.class public Lcom/android/customization/module/DefaultCustomizationPreferences;
.super Lcom/android/wallpaper/module/DefaultWallpaperPreferences;
.source "SourceFile"

# interfaces
.implements Lcom/android/customization/module/CustomizationPreferences;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public getThemedIconEnabled()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v0, "themepicker_themed_icon_enabled"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public setThemedIconEnabled(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "themepicker_themed_icon_enabled"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method
