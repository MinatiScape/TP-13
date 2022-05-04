.class public Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$BackdropRotationAsyncTask;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BackdropRotationAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field public mAppContext:Landroid/content/Context;

.field public mCollectionId:Ljava/lang/String;

.field public mCollectionName:Ljava/lang/String;

.field public mListener:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;

.field public mResumeToken:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$BackdropRotationAsyncTask;->mAppContext:Landroid/content/Context;

    .line 3
    iput-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$BackdropRotationAsyncTask;->mCollectionId:Ljava/lang/String;

    .line 4
    iput-object p3, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$BackdropRotationAsyncTask;->mCollectionName:Ljava/lang/String;

    .line 5
    iput-object p5, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$BackdropRotationAsyncTask;->mListener:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;

    .line 6
    iput-object p4, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$BackdropRotationAsyncTask;->mResumeToken:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    check-cast p1, [Ljava/lang/Void;

    .line 2
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$BackdropRotationAsyncTask;->mAppContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$BackdropRotationAsyncTask;->mCollectionId:Ljava/lang/String;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$BackdropRotationAsyncTask;->mCollectionName:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$BackdropRotationAsyncTask;->mResumeToken:Ljava/lang/String;

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$BackdropRotationAsyncTask;->mListener:Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;

    .line 3
    invoke-static {p1, v0, v1, v2, p0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator;->fetchAndSetNextWallpaper(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;)V

    const/4 p0, 0x0

    return-object p0
.end method
