.class public Lcom/android/wallpaper/module/WallpaperSetter$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/lifecycle/LifecycleEventObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/module/WallpaperSetter;->setCurrentWallpaper(Landroid/app/Activity;Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/asset/Asset;IFLandroid/graphics/Rect;Landroid/app/WallpaperColors;Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/module/WallpaperSetter;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/module/WallpaperSetter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/module/WallpaperSetter$1;->this$0:Lcom/android/wallpaper/module/WallpaperSetter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onStateChanged(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Lifecycle$Event;)V
    .locals 0

    .line 1
    sget-object p1, Landroidx/lifecycle/Lifecycle$Event;->ON_DESTROY:Landroidx/lifecycle/Lifecycle$Event;

    if-ne p2, p1, :cond_0

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/module/WallpaperSetter$1;->this$0:Lcom/android/wallpaper/module/WallpaperSetter;

    .line 3
    iget-object p1, p1, Lcom/android/wallpaper/module/WallpaperSetter;->mProgressDialog:Landroid/app/ProgressDialog;

    if-eqz p1, :cond_0

    .line 4
    invoke-virtual {p1}, Landroid/app/ProgressDialog;->dismiss()V

    .line 5
    iget-object p0, p0, Lcom/android/wallpaper/module/WallpaperSetter$1;->this$0:Lcom/android/wallpaper/module/WallpaperSetter;

    const/4 p1, 0x0

    .line 6
    iput-object p1, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mProgressDialog:Landroid/app/ProgressDialog;

    :cond_0
    return-void
.end method
