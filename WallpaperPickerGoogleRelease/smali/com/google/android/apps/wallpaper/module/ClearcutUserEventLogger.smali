.class public Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;
.super Lcom/android/wallpaper/module/NoOpUserEventLogger;
.source "SourceFile"

# interfaces
.implements Lcom/android/customization/module/ThemesUserEventLogger;


# static fields
.field public static final IS_VERBOSE:Z

.field public static final sNameCache:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Ljava/lang/Class;",
            "Landroid/util/SparseArray<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field public mClearcutLogger:Lcom/google/android/gms/clearcut/ClearcutLogger;

.field public mContext:Landroid/content/Context;

.field public mCounters:Lcom/google/android/gms/clearcut/Counters;

.field public mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

.field public mPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

.field public final mWallpaperStatusChecker:Lcom/google/android/material/shape/EdgeTreatment;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    const-string v0, "UserEvent"

    const/4 v1, 0x2

    .line 1
    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->IS_VERBOSE:Z

    .line 2
    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    sput-object v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->sNameCache:Landroid/util/ArrayMap;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/module/NoOpUserEventLogger;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mContext:Landroid/content/Context;

    .line 3
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    .line 4
    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 5
    new-instance v1, Lcom/google/android/gms/clearcut/ClearcutLogger;

    const-string v2, "WALLPAPER_PICKER"

    const/4 v3, 0x0

    invoke-direct {v1, p1, v2, v3}, Lcom/google/android/gms/clearcut/ClearcutLogger;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mClearcutLogger:Lcom/google/android/gms/clearcut/ClearcutLogger;

    .line 6
    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/Injector;->getLoggingOptInStatusProvider(Landroid/content/Context;)Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    .line 7
    new-instance p1, Lcom/google/android/gms/clearcut/Counters;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mClearcutLogger:Lcom/google/android/gms/clearcut/ClearcutLogger;

    .line 8
    sget-object v2, Lcom/google/android/gms/common/util/zzh;->zza:Lcom/google/android/gms/common/util/zzh;

    const-string v3, "WALLPAPER_PICKER_COUNTERS"

    const/16 v4, 0x400

    invoke-direct {p1, v1, v3, v4, v2}, Lcom/google/android/gms/clearcut/Counters;-><init>(Lcom/google/android/gms/clearcut/ClearcutLogger;Ljava/lang/String;ILcom/google/android/gms/common/util/Clock;)V

    .line 9
    iput-object p1, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    .line 10
    invoke-interface {v0}, Lcom/android/wallpaper/module/Injector;->getWallpaperStatusChecker()Lcom/google/android/material/shape/EdgeTreatment;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mWallpaperStatusChecker:Lcom/google/android/material/shape/EdgeTreatment;

    return-void
.end method


# virtual methods
.method public final log(Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;)V
    .locals 14

    .line 1
    const-class v0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;

    const-class v1, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mClearcutLogger:Lcom/google/android/gms/clearcut/ClearcutLogger;

    invoke-virtual {p1}, Lcom/google/protobuf/AbstractMessageLite;->toByteArray()[B

    move-result-object v2

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    new-instance v3, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;

    const/4 v4, 0x0

    .line 3
    invoke-direct {v3, p0, v2, v4}, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;-><init>(Lcom/google/android/gms/clearcut/ClearcutLogger;[BLcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;)V

    .line 4
    invoke-virtual {v3}, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;->logAsync()Lcom/google/android/gms/common/api/PendingResult;

    .line 5
    sget-boolean p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->IS_VERBOSE:Z

    if-nez p0, :cond_0

    return-void

    :cond_0
    const-string p0, "UserEvent"

    const-string v2, "type:"

    .line 6
    invoke-static {v2}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->getType()Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->getNumber()I

    move-result v3

    .line 7
    sget-object v5, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->sNameCache:Landroid/util/ArrayMap;

    monitor-enter v5

    .line 8
    :try_start_0
    invoke-virtual {v5, v1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/util/SparseArray;

    const/4 v7, 0x0

    if-nez v6, :cond_3

    .line 9
    new-instance v6, Landroid/util/SparseArray;

    invoke-direct {v6}, Landroid/util/SparseArray;-><init>()V

    .line 10
    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v8

    array-length v9, v8

    move v10, v7

    :goto_0
    if-ge v10, v9, :cond_2

    aget-object v11, v8, v10

    .line 11
    invoke-virtual {v11}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v12

    sget-object v13, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne v12, v13, :cond_1

    invoke-virtual {v11}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v12

    invoke-static {v12}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v12
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v12, :cond_1

    const/4 v12, 0x1

    .line 12
    :try_start_1
    invoke-virtual {v11, v12}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 13
    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v12

    invoke-virtual {v11}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v12, v11}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catch_0
    :cond_1
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 14
    :cond_2
    :try_start_2
    sget-object v4, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->sNameCache:Landroid/util/ArrayMap;

    invoke-virtual {v4, v1, v6}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    :cond_3
    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 16
    invoke-virtual {v6, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v3, :cond_4

    goto :goto_1

    :cond_4
    const-string v3, "UNKNOWN"

    .line 17
    :goto_1
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object p0

    array-length v2, p0

    :goto_2
    if-ge v7, v2, :cond_6

    aget-object v3, p0, v7

    .line 19
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 20
    invoke-virtual {v4, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 21
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_5

    instance-of v5, v4, Ljava/lang/Integer;

    if-eqz v5, :cond_5

    move-object v5, v4

    check-cast v5, Ljava/lang/Integer;

    .line 22
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-eqz v5, :cond_5

    const-string v5, "UserEvent"

    .line 23
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ":"

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/NoSuchFieldException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_3 .. :try_end_3} :catch_1

    :cond_5
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :catch_1
    :cond_6
    return-void

    :catchall_0
    move-exception p0

    .line 24
    :try_start_4
    monitor-exit v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw p0
.end method

.method public logActionClicked(Ljava/lang/String;I)V
    .locals 2

    const v0, 0x7f110045

    const/4 v1, 0x2

    if-ne p2, v0, :cond_0

    move p2, v1

    goto :goto_0

    :cond_0
    const/4 p2, 0x1

    :goto_0
    if-ne p2, v1, :cond_1

    const/16 p2, 0x8

    goto :goto_1

    :cond_1
    const/4 p2, 0x7

    .line 1
    :goto_1
    invoke-virtual {p0, p2, p1}, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->logEventWithCollectionId(ILjava/lang/String;)V

    return-void
.end method

.method public logAppLaunched(Landroid/content/Intent;)V
    .locals 0

    return-void
.end method

.method public final logBasicEvent(I)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;

    const/4 v1, 0x4

    invoke-direct {v0, p0, p1, v1}, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;-><init>(Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;II)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    check-cast p0, Lcom/google/android/apps/wallpaper/module/AlwaysLoggingOptInStatusProvider;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual {v0}, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->run()V

    return-void
.end method

.method public logCategorySelected(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x4

    .line 1
    invoke-virtual {p0, v0, p1}, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->logEventWithCollectionId(ILjava/lang/String;)V

    return-void
.end method

.method public logColorApplied(II)V
    .locals 0

    return-void
.end method

.method public logCurrentWallpaperPreviewed()V
    .locals 1

    const/4 v0, 0x6

    .line 1
    invoke-virtual {p0, v0}, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->logBasicEvent(I)V

    return-void
.end method

.method public logDailyRefreshTurnedOn()V
    .locals 2

    const/4 v0, 0x3

    .line 1
    invoke-virtual {p0, v0}, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->logBasicEvent(I)V

    .line 2
    new-instance v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger$$ExternalSyntheticLambda0;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger$$ExternalSyntheticLambda0;-><init>(Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;I)V

    .line 3
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    check-cast p0, Lcom/google/android/apps/wallpaper/module/AlwaysLoggingOptInStatusProvider;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    invoke-virtual {v0}, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger$$ExternalSyntheticLambda0;->run()V

    return-void
.end method

.method public logDailyWallpaperMetadataRequestFailure(I)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;-><init>(Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;II)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    check-cast p0, Lcom/google/android/apps/wallpaper/module/AlwaysLoggingOptInStatusProvider;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual {v0}, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->run()V

    return-void
.end method

.method public logDailyWallpaperRotationHour(I)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;

    const/16 v1, 0x8

    invoke-direct {v0, p0, p1, v1}, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;-><init>(Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;II)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    check-cast p0, Lcom/google/android/apps/wallpaper/module/AlwaysLoggingOptInStatusProvider;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual {v0}, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->run()V

    return-void
.end method

.method public logDailyWallpaperRotationStatus(I)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;

    const/4 v1, 0x3

    invoke-direct {v0, p0, p1, v1}, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;-><init>(Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;II)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    check-cast p0, Lcom/google/android/apps/wallpaper/module/AlwaysLoggingOptInStatusProvider;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual {v0}, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->run()V

    return-void
.end method

.method public logDailyWallpaperSetNextWallpaperCrash(I)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;

    const/16 v1, 0xa

    invoke-direct {v0, p0, p1, v1}, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;-><init>(Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;II)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    check-cast p0, Lcom/google/android/apps/wallpaper/module/AlwaysLoggingOptInStatusProvider;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual {v0}, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->run()V

    return-void
.end method

.method public logDailyWallpaperSetNextWallpaperResult(I)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;

    const/16 v1, 0x9

    invoke-direct {v0, p0, p1, v1}, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;-><init>(Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;II)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    check-cast p0, Lcom/google/android/apps/wallpaper/module/AlwaysLoggingOptInStatusProvider;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual {v0}, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->run()V

    return-void
.end method

.method public final logEventWithCollectionId(ILjava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p1, p2}, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;-><init>(Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;ILjava/lang/String;)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    check-cast p0, Lcom/google/android/apps/wallpaper/module/AlwaysLoggingOptInStatusProvider;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual {v0}, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->run()V

    return-void
.end method

.method public logGridApplied(Lcom/android/customization/model/grid/GridOption;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;

    const/16 v1, 0xe

    invoke-direct {v0, p0, v1, p1}, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;-><init>(Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;ILcom/android/customization/model/grid/GridOption;)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    check-cast p0, Lcom/google/android/apps/wallpaper/module/AlwaysLoggingOptInStatusProvider;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual {v0}, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->run()V

    return-void
.end method

.method public logGridSelected(Lcom/android/customization/model/grid/GridOption;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;

    const/16 v1, 0xd

    invoke-direct {v0, p0, v1, p1}, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;-><init>(Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;ILcom/android/customization/model/grid/GridOption;)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    check-cast p0, Lcom/google/android/apps/wallpaper/module/AlwaysLoggingOptInStatusProvider;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual {v0}, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->run()V

    return-void
.end method

.method public logIndividualWallpaperSelected(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x5

    .line 1
    invoke-virtual {p0, v0, p1}, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->logEventWithCollectionId(ILjava/lang/String;)V

    return-void
.end method

.method public logNumDailyWallpaperRotationsInLastWeek()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger$$ExternalSyntheticLambda0;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger$$ExternalSyntheticLambda0;-><init>(Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;I)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    check-cast p0, Lcom/google/android/apps/wallpaper/module/AlwaysLoggingOptInStatusProvider;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual {v0}, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger$$ExternalSyntheticLambda0;->run()V

    return-void
.end method

.method public logNumDailyWallpaperRotationsPreviousDay()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger$$ExternalSyntheticLambda0;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger$$ExternalSyntheticLambda0;-><init>(Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;I)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    check-cast p0, Lcom/google/android/apps/wallpaper/module/AlwaysLoggingOptInStatusProvider;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual {v0}, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger$$ExternalSyntheticLambda0;->run()V

    return-void
.end method

.method public logNumDaysDailyRotationFailed(I)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;

    const/4 v1, 0x2

    invoke-direct {v0, p0, p1, v1}, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;-><init>(Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;II)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    check-cast p0, Lcom/google/android/apps/wallpaper/module/AlwaysLoggingOptInStatusProvider;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual {v0}, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->run()V

    return-void
.end method

.method public logNumDaysDailyRotationNotAttempted(I)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;

    const/4 v1, 0x6

    invoke-direct {v0, p0, p1, v1}, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;-><init>(Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;II)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    check-cast p0, Lcom/google/android/apps/wallpaper/module/AlwaysLoggingOptInStatusProvider;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual {v0}, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->run()V

    return-void
.end method

.method public logRefreshDailyWallpaperButtonClicked()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/wallpaper/picker/ImagePreviewFragment$4$$ExternalSyntheticLambda0;

    const-string v1, "DailyWallpaper.RefreshButtonClicked"

    invoke-direct {v0, p0, v1}, Lcom/android/wallpaper/picker/ImagePreviewFragment$4$$ExternalSyntheticLambda0;-><init>(Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;Ljava/lang/String;)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    check-cast p0, Lcom/google/android/apps/wallpaper/module/AlwaysLoggingOptInStatusProvider;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual {v0}, Lcom/android/wallpaper/picker/ImagePreviewFragment$4$$ExternalSyntheticLambda0;->run()V

    return-void
.end method

.method public logRestored()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/wallpaper/picker/ImagePreviewFragment$4$$ExternalSyntheticLambda0;

    const-string v1, "BackupAndRestore.Restored"

    invoke-direct {v0, p0, v1}, Lcom/android/wallpaper/picker/ImagePreviewFragment$4$$ExternalSyntheticLambda0;-><init>(Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;Ljava/lang/String;)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    check-cast p0, Lcom/google/android/apps/wallpaper/module/AlwaysLoggingOptInStatusProvider;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual {v0}, Lcom/android/wallpaper/picker/ImagePreviewFragment$4$$ExternalSyntheticLambda0;->run()V

    return-void
.end method

.method public logResumed(ZZ)V
    .locals 0

    if-eqz p1, :cond_1

    if-eqz p2, :cond_0

    const/16 p1, 0x11

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->logBasicEvent(I)V

    goto :goto_0

    :cond_0
    const/16 p1, 0x12

    .line 2
    invoke-virtual {p0, p1}, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->logBasicEvent(I)V

    goto :goto_0

    :cond_1
    if-eqz p2, :cond_2

    const/16 p1, 0xf

    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->logBasicEvent(I)V

    goto :goto_0

    :cond_2
    const/16 p1, 0x10

    .line 4
    invoke-virtual {p0, p1}, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->logBasicEvent(I)V

    :goto_0
    return-void
.end method

.method public logSnapshot()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger$$ExternalSyntheticLambda0;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger$$ExternalSyntheticLambda0;-><init>(Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;I)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    check-cast p0, Lcom/google/android/apps/wallpaper/module/AlwaysLoggingOptInStatusProvider;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual {v0}, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger$$ExternalSyntheticLambda0;->run()V

    return-void
.end method

.method public logStandalonePreviewImageUriHasReadPermission(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    check-cast v0, Lcom/google/android/apps/wallpaper/module/AlwaysLoggingOptInStatusProvider;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    const-string v1, "StandalonePreview.ImageUriPermissionStatus"

    .line 3
    invoke-virtual {v0, v1}, Lcom/google/android/gms/clearcut/Counters;->getIntegerHistogram(Ljava/lang/String;)Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;

    move-result-object v0

    xor-int/lit8 p1, p1, 0x1

    .line 4
    invoke-virtual {v0, p1}, Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;->increment(I)V

    .line 5
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    .line 6
    iget-object p1, p0, Lcom/google/android/gms/clearcut/Counters;->zzf:Lcom/google/android/gms/clearcut/Counters$LogEventModifier;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/clearcut/Counters;->logAllAsync(Lcom/google/android/gms/clearcut/Counters$LogEventModifier;)V

    return-void
.end method

.method public logStandalonePreviewLaunched()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/wallpaper/picker/ImagePreviewFragment$4$$ExternalSyntheticLambda0;

    const-string v1, "StandalonePreview.Launched"

    invoke-direct {v0, p0, v1}, Lcom/android/wallpaper/picker/ImagePreviewFragment$4$$ExternalSyntheticLambda0;-><init>(Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;Ljava/lang/String;)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    check-cast p0, Lcom/google/android/apps/wallpaper/module/AlwaysLoggingOptInStatusProvider;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual {v0}, Lcom/android/wallpaper/picker/ImagePreviewFragment$4$$ExternalSyntheticLambda0;->run()V

    return-void
.end method

.method public logStandalonePreviewStorageDialogApproved(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    check-cast v0, Lcom/google/android/apps/wallpaper/module/AlwaysLoggingOptInStatusProvider;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    const-string v1, "StandalonePreview.StorageDialogResponse"

    .line 3
    invoke-virtual {v0, v1}, Lcom/google/android/gms/clearcut/Counters;->getIntegerHistogram(Ljava/lang/String;)Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;

    move-result-object v0

    xor-int/lit8 p1, p1, 0x1

    .line 4
    invoke-virtual {v0, p1}, Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;->increment(I)V

    .line 5
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    .line 6
    iget-object p1, p0, Lcom/google/android/gms/clearcut/Counters;->zzf:Lcom/google/android/gms/clearcut/Counters$LogEventModifier;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/clearcut/Counters;->logAllAsync(Lcom/google/android/gms/clearcut/Counters$LogEventModifier;)V

    return-void
.end method

.method public logStopped()V
    .locals 1

    const/16 v0, 0x13

    .line 1
    invoke-virtual {p0, v0}, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->logBasicEvent(I)V

    return-void
.end method

.method public logWallpaperPresentationMode()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger$$ExternalSyntheticLambda0;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger$$ExternalSyntheticLambda0;-><init>(Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;I)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    check-cast p0, Lcom/google/android/apps/wallpaper/module/AlwaysLoggingOptInStatusProvider;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual {v0}, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger$$ExternalSyntheticLambda0;->run()V

    return-void
.end method

.method public logWallpaperSet(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p1, p2}, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda1;-><init>(Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    check-cast p0, Lcom/google/android/apps/wallpaper/module/AlwaysLoggingOptInStatusProvider;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual {v0}, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda1;->run()V

    return-void
.end method

.method public logWallpaperSetFailureReason(I)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;

    const/4 v1, 0x5

    invoke-direct {v0, p0, p1, v1}, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;-><init>(Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;II)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    check-cast p0, Lcom/google/android/apps/wallpaper/module/AlwaysLoggingOptInStatusProvider;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual {v0}, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->run()V

    return-void
.end method

.method public logWallpaperSetResult(I)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;

    const/4 v1, 0x7

    invoke-direct {v0, p0, p1, v1}, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;-><init>(Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;II)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    check-cast p0, Lcom/google/android/apps/wallpaper/module/AlwaysLoggingOptInStatusProvider;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual {v0}, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->run()V

    return-void
.end method
