.class public Lcom/android/wallpaper/module/DefaultWallpaperPersister$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/asset/StreamableAsset$StreamReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/module/DefaultWallpaperPersister;->setIndividualWallpaper(Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/asset/Asset;Landroid/graphics/Rect;FILcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

.field public final synthetic val$callback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

.field public final synthetic val$destination:I

.field public final synthetic val$wallpaper:Lcom/android/wallpaper/model/WallpaperInfo;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/module/DefaultWallpaperPersister;Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;Lcom/android/wallpaper/model/WallpaperInfo;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$1;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    iput-object p2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$1;->val$callback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

    iput-object p3, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$1;->val$wallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    iput p4, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$1;->val$destination:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onInputStreamOpened(Ljava/io/InputStream;)V
    .locals 6

    if-nez p1, :cond_0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$1;->val$callback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;->onError(Ljava/lang/Throwable;)V

    return-void

    .line 2
    :cond_0
    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$1;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$1;->val$wallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    iget v4, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$1;->val$destination:I

    iget-object v5, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$1;->val$callback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

    .line 3
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    new-instance p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;

    move-object v0, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;-><init>(Lcom/android/wallpaper/module/DefaultWallpaperPersister;Lcom/android/wallpaper/model/WallpaperInfo;Ljava/io/InputStream;ILcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Void;

    .line 5
    invoke-virtual {p0, p1}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method
