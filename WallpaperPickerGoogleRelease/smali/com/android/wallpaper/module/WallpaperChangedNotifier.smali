.class public Lcom/android/wallpaper/module/WallpaperChangedNotifier;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/module/WallpaperChangedNotifier$Listener;
    }
.end annotation


# static fields
.field public static sInstance:Lcom/android/wallpaper/module/WallpaperChangedNotifier;

.field public static final sInstanceLock:Ljava/lang/Object;


# instance fields
.field public mListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/wallpaper/module/WallpaperChangedNotifier$Listener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/android/wallpaper/module/WallpaperChangedNotifier;->sInstanceLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/wallpaper/module/WallpaperChangedNotifier;->mListeners:Ljava/util/List;

    return-void
.end method

.method public static getInstance()Lcom/android/wallpaper/module/WallpaperChangedNotifier;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/wallpaper/module/WallpaperChangedNotifier;->sInstanceLock:Ljava/lang/Object;

    monitor-enter v0

    .line 2
    :try_start_0
    sget-object v1, Lcom/android/wallpaper/module/WallpaperChangedNotifier;->sInstance:Lcom/android/wallpaper/module/WallpaperChangedNotifier;

    if-nez v1, :cond_0

    .line 3
    new-instance v1, Lcom/android/wallpaper/module/WallpaperChangedNotifier;

    invoke-direct {v1}, Lcom/android/wallpaper/module/WallpaperChangedNotifier;-><init>()V

    sput-object v1, Lcom/android/wallpaper/module/WallpaperChangedNotifier;->sInstance:Lcom/android/wallpaper/module/WallpaperChangedNotifier;

    .line 4
    :cond_0
    sget-object v1, Lcom/android/wallpaper/module/WallpaperChangedNotifier;->sInstance:Lcom/android/wallpaper/module/WallpaperChangedNotifier;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    .line 5
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method public notifyWallpaperChanged()V
    .locals 2

    const/4 v0, 0x0

    .line 1
    :goto_0
    iget-object v1, p0, Lcom/android/wallpaper/module/WallpaperChangedNotifier;->mListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 2
    iget-object v1, p0, Lcom/android/wallpaper/module/WallpaperChangedNotifier;->mListeners:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/wallpaper/module/WallpaperChangedNotifier$Listener;

    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperChangedNotifier$Listener;->onWallpaperChanged()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
