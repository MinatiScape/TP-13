.class public Lcom/android/customization/model/grid/GridOptionsManager;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/customization/model/CustomizationManager;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/customization/model/grid/GridOptionsManager$FetchTask;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/customization/model/CustomizationManager<",
        "Lcom/android/customization/model/grid/GridOption;",
        ">;"
    }
.end annotation


# static fields
.field public static sGridOptionsManager:Lcom/android/customization/model/grid/GridOptionsManager;


# instance fields
.field public final mEventLogger:Lcom/android/customization/module/ThemesUserEventLogger;

.field public final mProvider:Lcom/android/customization/model/grid/LauncherGridOptionsProvider;


# direct methods
.method public constructor <init>(Lcom/android/customization/model/grid/LauncherGridOptionsProvider;Lcom/android/customization/module/ThemesUserEventLogger;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/customization/model/grid/GridOptionsManager;->mProvider:Lcom/android/customization/model/grid/LauncherGridOptionsProvider;

    .line 3
    iput-object p2, p0, Lcom/android/customization/model/grid/GridOptionsManager;->mEventLogger:Lcom/android/customization/module/ThemesUserEventLogger;

    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/android/customization/model/grid/GridOptionsManager;
    .locals 4

    .line 1
    sget-object v0, Lcom/android/customization/model/grid/GridOptionsManager;->sGridOptionsManager:Lcom/android/customization/model/grid/GridOptionsManager;

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 3
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    check-cast v0, Lcom/android/customization/module/CustomizationInjector;

    .line 4
    invoke-interface {v0, p0}, Lcom/android/wallpaper/module/Injector;->getUserEventLogger(Landroid/content/Context;)Lcom/android/wallpaper/module/UserEventLogger;

    move-result-object v0

    check-cast v0, Lcom/android/customization/module/ThemesUserEventLogger;

    .line 5
    new-instance v1, Lcom/android/customization/model/grid/GridOptionsManager;

    new-instance v2, Lcom/android/customization/model/grid/LauncherGridOptionsProvider;

    const v3, 0x7f11008f

    .line 6
    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lcom/android/customization/model/grid/LauncherGridOptionsProvider;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-direct {v1, v2, v0}, Lcom/android/customization/model/grid/GridOptionsManager;-><init>(Lcom/android/customization/model/grid/LauncherGridOptionsProvider;Lcom/android/customization/module/ThemesUserEventLogger;)V

    sput-object v1, Lcom/android/customization/model/grid/GridOptionsManager;->sGridOptionsManager:Lcom/android/customization/model/grid/GridOptionsManager;

    .line 7
    :cond_0
    sget-object p0, Lcom/android/customization/model/grid/GridOptionsManager;->sGridOptionsManager:Lcom/android/customization/model/grid/GridOptionsManager;

    return-object p0
.end method
