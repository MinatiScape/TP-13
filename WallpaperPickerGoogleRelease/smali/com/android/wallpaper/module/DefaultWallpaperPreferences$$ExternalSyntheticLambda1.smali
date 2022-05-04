.class public final synthetic Lcom/android/wallpaper/module/DefaultWallpaperPreferences$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# instance fields
.field public final synthetic f$0:Landroid/app/backup/BackupManager;


# direct methods
.method public synthetic constructor <init>(Landroid/app/backup/BackupManager;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences$$ExternalSyntheticLambda1;->f$0:Landroid/app/backup/BackupManager;

    return-void
.end method


# virtual methods
.method public final onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 0

    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences$$ExternalSyntheticLambda1;->f$0:Landroid/app/backup/BackupManager;

    .line 1
    invoke-virtual {p0}, Landroid/app/backup/BackupManager;->dataChanged()V

    return-void
.end method
