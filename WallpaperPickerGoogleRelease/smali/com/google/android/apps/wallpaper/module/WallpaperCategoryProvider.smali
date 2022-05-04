.class public Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider;
.super Lcom/android/wallpaper/module/DefaultCategoryProvider;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;
    }
.end annotation


# static fields
.field public static sSystemStaticCategories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/Category;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/wallpaper/module/DefaultCategoryProvider;-><init>(Landroid/content/Context;)V

    return-void
.end method
