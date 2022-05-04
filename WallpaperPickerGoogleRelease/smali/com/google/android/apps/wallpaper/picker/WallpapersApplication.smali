.class public Lcom/google/android/apps/wallpaper/picker/WallpapersApplication;
.super Landroid/app/Application;
.source "SourceFile"


# static fields
.field public static final synthetic $r8$clinit:I


# instance fields
.field public mWrappedHandler:Ljava/lang/Thread$UncaughtExceptionHandler;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 2
    new-instance v0, Lcom/android/wallpaper/module/WallpapersInjector;

    invoke-direct {v0}, Lcom/android/wallpaper/module/WallpapersInjector;-><init>()V

    .line 3
    sput-object v0, Lcom/android/wallpaper/module/InjectorProvider;->sInjector:Lcom/android/wallpaper/module/Injector;

    .line 4
    invoke-virtual {v0, p0}, Lcom/android/customization/module/DefaultCustomizationInjector;->getFormFactorChecker(Landroid/content/Context;)Lcom/android/wallpaper/util/DownloadableUtils;

    move-result-object v1

    .line 5
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    invoke-virtual {p0}, Landroid/app/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 7
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/apps/wallpaper/picker/WallpapersApplication;->mWrappedHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 8
    new-instance v2, Lcom/google/android/apps/wallpaper/picker/WallpapersApplication$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, v0, v1}, Lcom/google/android/apps/wallpaper/picker/WallpapersApplication$$ExternalSyntheticLambda0;-><init>(Lcom/google/android/apps/wallpaper/picker/WallpapersApplication;Lcom/android/wallpaper/module/Injector;Landroid/content/Context;)V

    .line 9
    invoke-static {v2}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    return-void
.end method
