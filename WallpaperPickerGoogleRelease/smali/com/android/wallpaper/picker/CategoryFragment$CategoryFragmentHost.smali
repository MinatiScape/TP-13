.class public interface abstract Lcom/android/wallpaper/picker/CategoryFragment$CategoryFragmentHost;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/picker/MyPhotosStarter$MyPhotosStarterProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/picker/CategoryFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "CategoryFragmentHost"
.end annotation


# virtual methods
.method public abstract cleanUp()V
.end method

.method public abstract fetchCategories()V
.end method

.method public abstract isReadExternalStoragePermissionGranted()Z
.end method

.method public abstract requestExternalStoragePermission(Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;)V
.end method

.method public abstract show(Ljava/lang/String;)V
.end method

.method public abstract showViewOnlyPreview(Lcom/android/wallpaper/model/WallpaperInfo;Z)V
.end method
