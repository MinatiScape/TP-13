.class public interface abstract Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySelectorFragmentHost;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/picker/CategorySelectorFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "CategorySelectorFragmentHost"
.end annotation


# virtual methods
.method public abstract cleanUp()V
.end method

.method public abstract fetchCategories()V
.end method

.method public abstract isHostToolbarShown()Z
.end method

.method public abstract requestCustomPhotoPicker(Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;)V
.end method

.method public abstract setToolbarTitle(Ljava/lang/CharSequence;)V
.end method

.method public abstract show(Lcom/android/wallpaper/model/Category;)V
.end method