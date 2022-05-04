.class public Lcom/google/android/apps/wallpaper/backdrop/DefaultGcmNetworkManagerWrapper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static sInstance:Lcom/google/android/apps/wallpaper/backdrop/DefaultGcmNetworkManagerWrapper;

.field public static final sInstanceLock:Ljava/lang/Object;


# instance fields
.field public mAppContext:Landroid/content/Context;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/apps/wallpaper/backdrop/DefaultGcmNetworkManagerWrapper;->sInstanceLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/DefaultGcmNetworkManagerWrapper;->mAppContext:Landroid/content/Context;

    return-void
.end method
