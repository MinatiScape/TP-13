.class public Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/model/CategoryReceiver;


# instance fields
.field public final synthetic this$0:Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider;

.field public final synthetic val$numFetchesDone:[I

.field public final synthetic val$receiver:Lcom/android/wallpaper/model/CategoryReceiver;


# direct methods
.method public constructor <init>(Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider;Lcom/android/wallpaper/model/CategoryReceiver;[I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$1;->this$0:Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider;

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$1;->val$receiver:Lcom/android/wallpaper/model/CategoryReceiver;

    iput-object p3, p0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$1;->val$numFetchesDone:[I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doneFetchingCategories()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$1;->val$numFetchesDone:[I

    const/4 v1, 0x0

    aget v2, v0, v1

    const/4 v3, 0x1

    add-int/2addr v2, v3

    aput v2, v0, v1

    .line 2
    aget v0, v0, v1

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 3
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$1;->val$receiver:Lcom/android/wallpaper/model/CategoryReceiver;

    invoke-interface {v0}, Lcom/android/wallpaper/model/CategoryReceiver;->doneFetchingCategories()V

    .line 4
    :cond_0
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$1;->this$0:Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider;

    .line 5
    iput-boolean v3, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mFetchedCategories:Z

    return-void
.end method

.method public onCategoryReceived(Lcom/android/wallpaper/model/Category;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$1;->val$receiver:Lcom/android/wallpaper/model/CategoryReceiver;

    invoke-interface {v0, p1}, Lcom/android/wallpaper/model/CategoryReceiver;->onCategoryReceived(Lcom/android/wallpaper/model/Category;)V

    .line 2
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$1;->this$0:Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider;

    .line 3
    iget-object v0, v0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mCategories:Ljava/util/ArrayList;

    .line 4
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_0

    .line 5
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$1;->this$0:Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider;

    .line 6
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mCategories:Ljava/util/ArrayList;

    .line 7
    invoke-virtual {p0, v0, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$1;->this$0:Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider;

    .line 9
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mCategories:Ljava/util/ArrayList;

    .line 10
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_0
    return-void
.end method
