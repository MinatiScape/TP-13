.class public abstract Lcom/google/android/apps/wallpaper/backdrop/BackdropTaskScheduler;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static sInstance:Lcom/google/android/apps/wallpaper/backdrop/BackdropTaskScheduler;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/google/android/apps/wallpaper/backdrop/BackdropTaskScheduler;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropTaskScheduler;->sInstance:Lcom/google/android/apps/wallpaper/backdrop/BackdropTaskScheduler;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Lcom/google/android/apps/wallpaper/backdrop/JobSchedulerBackdropTaskScheduler;

    invoke-direct {v0, p0}, Lcom/google/android/apps/wallpaper/backdrop/JobSchedulerBackdropTaskScheduler;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropTaskScheduler;->sInstance:Lcom/google/android/apps/wallpaper/backdrop/BackdropTaskScheduler;

    .line 3
    :cond_0
    sget-object p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropTaskScheduler;->sInstance:Lcom/google/android/apps/wallpaper/backdrop/BackdropTaskScheduler;

    return-object p0
.end method


# virtual methods
.method public abstract scheduleOneOffTask(II)V
.end method
