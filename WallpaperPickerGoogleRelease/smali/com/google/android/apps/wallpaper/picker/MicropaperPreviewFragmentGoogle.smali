.class public Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;
.super Lcom/android/wallpaper/picker/LivePreviewFragment;
.source "SourceFile"


# static fields
.field public static final synthetic $r8$clinit:I


# instance fields
.field public mPreviewAttributions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public mScreenSize:Landroid/util/Size;

.field public final mSetWallpaperExecutor:Ljava/util/concurrent/Executor;

.field public mWallpaperManager:Landroid/app/WallpaperManager;

.field public mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;

.field public mWallpaperSetter:Lcom/android/wallpaper/module/WallpaperSetter;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/picker/LivePreviewFragment;-><init>()V

    .line 2
    sget-object v0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda4;->INSTANCE:Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda4;

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newCachedThreadPool(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;->mSetWallpaperExecutor:Ljava/util/concurrent/Executor;

    return-void
.end method

.method public static access$100(Landroid/content/Context;Ljava/io/InputStream;Ljava/lang/String;)Z
    .locals 1

    const/4 v0, 0x0

    .line 1
    :try_start_0
    invoke-virtual {p0, p2, v0}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    :try_start_1
    invoke-static {p1, p0}, Lcom/google/common/io/ByteStreams;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 p1, 0x1

    .line 3
    :try_start_2
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    move v0, p1

    goto :goto_1

    :catchall_0
    move-exception p1

    if-eqz p0, :cond_0

    .line 4
    :try_start_3
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p0

    :try_start_4
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    throw p1
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    :catch_0
    move-exception p0

    const-string p1, "MicropaperPreviewFragmentGoogle"

    const-string p2, "Failed to copy input stream to local file"

    .line 5
    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1
    return v0
.end method

.method public static setMicropaperComponentAndReturn(Landroid/app/Activity;Landroid/app/WallpaperManager;Z)V
    .locals 2

    .line 1
    sget-object v0, Lwireless/android/learning/acmi/micropaper/frontend/MicropaperFrontend;->MICROPAPER_SERVICE:Landroid/content/ComponentName;

    .line 2
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "ACTION_COMMIT_TO_HOME"

    .line 3
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 4
    sget-object v1, Lwireless/android/learning/acmi/micropaper/frontend/MicropaperFrontend;->MICROPAPER_BROADCAST_RECEIVER:Landroid/content/ComponentName;

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 6
    sget-object v0, Lwireless/android/learning/acmi/micropaper/frontend/MicropaperFrontend;->MICROPAPER_SERVICE:Landroid/content/ComponentName;

    .line 7
    invoke-virtual {p1, v0}, Landroid/app/WallpaperManager;->setWallpaperComponent(Landroid/content/ComponentName;)Z

    if-eqz p2, :cond_0

    const/4 p2, 0x2

    .line 8
    :try_start_0
    invoke-virtual {p1, p2}, Landroid/app/WallpaperManager;->clear(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "MicropaperPreviewFragmentGoogle"

    const-string v0, "Error clearing lock wallpaper"

    .line 9
    invoke-static {p2, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    const/4 p1, -0x1

    .line 10
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setResult(I)V

    .line 11
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method


# virtual methods
.method public getAttributions(Landroid/content/Context;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;->mPreviewAttributions:Ljava/util/List;

    if-nez v0, :cond_0

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/model/WallpaperInfo;->getAttributions(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getDeleteAction(Landroid/app/WallpaperInfo;)Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getSettingsActivity(Landroid/app/WallpaperInfo;)Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getSettingsSliceUri(Landroid/app/WallpaperInfo;)Landroid/net/Uri;
    .locals 0

    .line 1
    sget-object p0, Lwireless/android/learning/acmi/micropaper/frontend/MicropaperFrontend;->MICROPAPER_SERVICE:Landroid/content/ComponentName;

    .line 2
    new-instance p0, Landroid/net/Uri$Builder;

    invoke-direct {p0}, Landroid/net/Uri$Builder;-><init>()V

    const-string p1, "content"

    .line 3
    invoke-virtual {p0, p1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string p1, "com.google.pixel.dynamicwallpapers.slice"

    .line 4
    invoke-virtual {p0, p1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string p1, "settings_slice"

    .line 5
    invoke-virtual {p0, p1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    .line 6
    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public getWallpaperIntent(Landroid/app/WallpaperInfo;)Landroid/content/Intent;
    .locals 0

    .line 1
    sget-object p0, Lwireless/android/learning/acmi/micropaper/frontend/MicropaperFrontend;->MICROPAPER_SERVICE:Landroid/content/ComponentName;

    .line 2
    new-instance p0, Landroid/content/Intent;

    const-string p1, "android.service.wallpaper.WallpaperService"

    invoke-direct {p0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 3
    sget-object p1, Lwireless/android/learning/acmi/micropaper/frontend/MicropaperFrontend;->MICROPAPER_SERVICE:Landroid/content/ComponentName;

    invoke-virtual {p0, p1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    return-object p0
.end method

.method public onConnected()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    instance-of v0, v0, Lcom/google/android/apps/wallpaper/model/MicropaperWallpaperInfo;

    const-string v1, "EXTRA_IMAGE_LABELS"

    const/4 v2, 0x0

    const-string v3, "com.google.pixel.dynamicwallpapers.parameters"

    const-string v4, "content"

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    sget-object v5, Lwireless/android/learning/acmi/micropaper/frontend/MicropaperFrontend;->MICROPAPER_SERVICE:Landroid/content/ComponentName;

    .line 3
    new-instance v5, Landroid/net/Uri$Builder;

    invoke-direct {v5}, Landroid/net/Uri$Builder;-><init>()V

    .line 4
    invoke-virtual {v5, v4}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v4

    .line 5
    invoke-virtual {v4, v3}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    .line 6
    invoke-virtual {v3}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v3

    .line 7
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v4, "PROVIDER_SET_PREVIEW_FROM_HOME"

    invoke-virtual {v0, v3, v4, v2, v2}, Landroid/content/ContentResolver;->call(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v0

    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;->mPreviewAttributions:Ljava/util/List;

    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    iget-object v5, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 11
    new-instance v6, Landroid/net/Uri$Builder;

    invoke-direct {v6}, Landroid/net/Uri$Builder;-><init>()V

    .line 12
    invoke-virtual {v6, v4}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v6

    const-string v7, "com.android.wallpaper.picker.micropaperprovider"

    .line 13
    invoke-virtual {v6, v7}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v6

    .line 14
    invoke-virtual {v5}, Lcom/android/wallpaper/model/WallpaperInfo;->getUri()Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v5

    .line 15
    invoke-virtual {v5}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v5

    .line 16
    sget-object v6, Lwireless/android/learning/acmi/micropaper/frontend/MicropaperFrontend;->MICROPAPER_SERVICE:Landroid/content/ComponentName;

    .line 17
    new-instance v6, Landroid/net/Uri$Builder;

    invoke-direct {v6}, Landroid/net/Uri$Builder;-><init>()V

    .line 18
    invoke-virtual {v6, v4}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v4

    .line 19
    invoke-virtual {v4, v3}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    .line 20
    invoke-virtual {v3}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v3

    .line 21
    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    const-string v6, "EXTRA_WALLPAPER_URI"

    .line 22
    invoke-virtual {v4, v6, v5}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 23
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v5, "PROVIDER_SET_PREVIEW_URI"

    invoke-virtual {v0, v3, v5, v2, v4}, Landroid/content/ContentResolver;->call(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v0

    .line 24
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;->mPreviewAttributions:Ljava/util/List;

    :goto_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5

    .line 1
    invoke-super {p0, p1}, Lcom/android/wallpaper/picker/LivePreviewFragment;->onCreate(Landroid/os/Bundle;)V

    .line 2
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    .line 3
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 4
    invoke-static {p1}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;->mWallpaperManager:Landroid/app/WallpaperManager;

    .line 5
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v1

    .line 6
    invoke-interface {v1, p1}, Lcom/android/wallpaper/module/Injector;->getWallpaperPersister(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPersister;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;->mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;

    .line 7
    invoke-static {}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getInstance()Lcom/android/wallpaper/util/ScreenSizeCalculator;

    move-result-object v2

    .line 8
    invoke-virtual {p1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object p1

    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p1

    .line 9
    invoke-virtual {v2, p1}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getScreenSize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object p1

    .line 10
    new-instance v2, Landroid/util/Size;

    iget v3, p1, Landroid/graphics/Point;->x:I

    iget p1, p1, Landroid/graphics/Point;->y:I

    invoke-direct {v2, v3, p1}, Landroid/util/Size;-><init>(II)V

    iput-object v2, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;->mScreenSize:Landroid/util/Size;

    .line 11
    invoke-interface {v1, v0}, Lcom/android/wallpaper/module/Injector;->getUserEventLogger(Landroid/content/Context;)Lcom/android/wallpaper/module/UserEventLogger;

    move-result-object p1

    .line 12
    iget-object v2, p0, Landroidx/fragment/app/Fragment;->mArguments:Landroid/os/Bundle;

    const-string v3, "testing_mode_enabled"

    .line 13
    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    .line 14
    new-instance v3, Lcom/android/wallpaper/module/WallpaperSetter;

    .line 15
    invoke-interface {v1, v0}, Lcom/android/wallpaper/module/Injector;->getWallpaperPersister(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPersister;

    move-result-object v4

    .line 16
    invoke-interface {v1, v0}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object v0

    invoke-direct {v3, v4, v0, p1, v2}, Lcom/android/wallpaper/module/WallpaperSetter;-><init>(Lcom/android/wallpaper/module/WallpaperPersister;Lcom/android/wallpaper/module/WallpaperPreferences;Lcom/android/wallpaper/module/UserEventLogger;Z)V

    iput-object v3, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;->mWallpaperSetter:Lcom/android/wallpaper/module/WallpaperSetter;

    .line 17
    iget-object p0, p0, Landroidx/fragment/app/Fragment;->mArguments:Landroid/os/Bundle;

    const-string p1, "preview_mode"

    .line 18
    invoke-virtual {p0, p1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/android/wallpaper/picker/LivePreviewFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    .line 2
    new-instance p2, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda2;

    invoke-direct {p2, p0}, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda2;-><init>(Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-object p1
.end method

.method public onDisconnected()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    sget-object v0, Lwireless/android/learning/acmi/micropaper/frontend/MicropaperFrontend;->MICROPAPER_SERVICE:Landroid/content/ComponentName;

    .line 2
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "ACTION_CLEAR_PREVIEW_URI"

    .line 3
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 4
    sget-object v1, Lwireless/android/learning/acmi/micropaper/frontend/MicropaperFrontend;->MICROPAPER_BROADCAST_RECEIVER:Landroid/content/ComponentName;

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method public onSetWallpaperClicked(Landroid/view/View;)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    iget-object v4, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;->mWallpaperManager:Landroid/app/WallpaperManager;

    iget-object v6, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;->mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;

    iget-object v5, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v3, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;->mScreenSize:Landroid/util/Size;

    .line 2
    invoke-virtual {v5, p1}, Lcom/android/wallpaper/model/WallpaperInfo;->getAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object v8

    .line 3
    new-instance v9, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda0;

    move-object v0, v9

    move-object v1, p0

    move-object v2, p1

    move-object v7, v8

    invoke-direct/range {v0 .. v7}, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda0;-><init>(Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;Landroid/app/Activity;Landroid/util/Size;Landroid/app/WallpaperManager;Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/module/WallpaperPersister;Lcom/android/wallpaper/asset/Asset;)V

    invoke-virtual {v8, p1, v9}, Lcom/android/wallpaper/asset/Asset;->decodeRawDimensions(Landroid/app/Activity;Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;)V

    return-void
.end method
