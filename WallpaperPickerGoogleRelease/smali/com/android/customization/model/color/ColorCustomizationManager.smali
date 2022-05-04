.class public Lcom/android/customization/model/color/ColorCustomizationManager;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/customization/model/CustomizationManager;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/customization/model/CustomizationManager<",
        "Lcom/android/customization/model/color/ColorOption;",
        ">;"
    }
.end annotation


# static fields
.field public static final COLOR_OVERLAY_SETTINGS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static sColorCustomizationManager:Lcom/android/customization/model/color/ColorCustomizationManager;

.field public static final sExecutorService:Ljava/util/concurrent/ExecutorService;


# instance fields
.field public final mContentResolver:Landroid/content/ContentResolver;

.field public mCurrentOverlays:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public mCurrentSource:Ljava/lang/String;

.field public mHomeWallpaperColors:Landroid/app/WallpaperColors;

.field public mLockWallpaperColors:Landroid/app/WallpaperColors;

.field public final mOverlayManagerCompat:Lcom/android/customization/model/theme/OverlayManagerCompat;

.field public final mProvider:Lcom/android/customization/model/color/ColorOptionsProvider;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/android/customization/model/color/ColorCustomizationManager;->sExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 2
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/android/customization/model/color/ColorCustomizationManager;->COLOR_OVERLAY_SETTINGS:Ljava/util/Set;

    const-string v1, "android.theme.customization.system_palette"

    .line 3
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    const-string v1, "android.theme.customization.accent_color"

    .line 4
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    const-string v1, "android.theme.customization.color_source"

    .line 5
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public constructor <init>(Lcom/android/customization/model/color/ColorOptionsProvider;Landroid/content/ContentResolver;Lcom/android/customization/model/theme/OverlayManagerCompat;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/customization/model/color/ColorCustomizationManager;->mProvider:Lcom/android/customization/model/color/ColorOptionsProvider;

    .line 3
    iput-object p2, p0, Lcom/android/customization/model/color/ColorCustomizationManager;->mContentResolver:Landroid/content/ContentResolver;

    .line 4
    new-instance p1, Lcom/android/customization/model/color/ColorCustomizationManager$1;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/android/customization/model/color/ColorCustomizationManager$1;-><init>(Lcom/android/customization/model/color/ColorCustomizationManager;Landroid/os/Handler;)V

    .line 5
    sget-object v0, Landroid/provider/Settings$Secure;->CONTENT_URI:Landroid/net/Uri;

    const/4 v1, 0x1

    invoke-virtual {p2, v0, v1, p1}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 6
    iput-object p3, p0, Lcom/android/customization/model/color/ColorCustomizationManager;->mOverlayManagerCompat:Lcom/android/customization/model/theme/OverlayManagerCompat;

    return-void
.end method

.method public static getInstance(Landroid/content/Context;Lcom/android/customization/model/theme/OverlayManagerCompat;)Lcom/android/customization/model/color/ColorCustomizationManager;
    .locals 3

    .line 1
    sget-object v0, Lcom/android/customization/model/color/ColorCustomizationManager;->sColorCustomizationManager:Lcom/android/customization/model/color/ColorCustomizationManager;

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 3
    new-instance v0, Lcom/android/customization/model/color/ColorCustomizationManager;

    new-instance v1, Lcom/android/customization/model/color/ColorProvider;

    const v2, 0x7f110138

    .line 4
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/android/customization/model/color/ColorProvider;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-direct {v0, v1, p0, p1}, Lcom/android/customization/model/color/ColorCustomizationManager;-><init>(Lcom/android/customization/model/color/ColorOptionsProvider;Landroid/content/ContentResolver;Lcom/android/customization/model/theme/OverlayManagerCompat;)V

    sput-object v0, Lcom/android/customization/model/color/ColorCustomizationManager;->sColorCustomizationManager:Lcom/android/customization/model/color/ColorCustomizationManager;

    .line 6
    :cond_0
    sget-object p0, Lcom/android/customization/model/color/ColorCustomizationManager;->sColorCustomizationManager:Lcom/android/customization/model/color/ColorCustomizationManager;

    return-object p0
.end method


# virtual methods
.method public getCurrentColorSource()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/customization/model/color/ColorCustomizationManager;->mCurrentSource:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p0}, Lcom/android/customization/model/color/ColorCustomizationManager;->getStoredOverlays()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/customization/model/color/ColorCustomizationManager;->parseSettings(Ljava/lang/String;)V

    .line 3
    :cond_0
    iget-object p0, p0, Lcom/android/customization/model/color/ColorCustomizationManager;->mCurrentSource:Ljava/lang/String;

    return-object p0
.end method

.method public getStoredOverlays()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/customization/model/color/ColorCustomizationManager;->mContentResolver:Landroid/content/ContentResolver;

    const-string v0, "theme_customization_overlay_packages"

    invoke-static {p0, v0}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public parseSettings(Ljava/lang/String;)V
    .locals 8

    const-string v0, "parseColorOverlays: "

    const-string v1, "ColorCustomizationManager"

    .line 1
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    if-eqz p1, :cond_1

    .line 2
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 3
    invoke-virtual {v3}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object p1

    if-eqz p1, :cond_1

    const/4 v4, 0x0

    .line 4
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v4, v5, :cond_1

    .line 5
    invoke-virtual {p1, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 6
    sget-object v6, Lcom/android/customization/model/color/ColorCustomizationManager;->COLOR_OVERLAY_SETTINGS:Ljava/util/Set;

    check-cast v6, Ljava/util/HashSet;

    invoke-virtual {v6, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v6
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v6, :cond_0

    .line 7
    :try_start_1
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v5

    .line 8
    :try_start_2
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Lorg/json/JSONException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v6, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    :cond_0
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :catch_1
    move-exception p1

    .line 9
    invoke-static {v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lorg/json/JSONException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    const-string p1, "android.theme.customization.color_source"

    .line 10
    invoke-virtual {v2, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lcom/android/customization/model/color/ColorCustomizationManager;->mCurrentSource:Ljava/lang/String;

    .line 11
    iput-object v2, p0, Lcom/android/customization/model/color/ColorCustomizationManager;->mCurrentOverlays:Ljava/util/Map;

    return-void
.end method
