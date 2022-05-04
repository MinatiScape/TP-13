.class public final synthetic Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;I)V
    .locals 1

    iput p2, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger$$ExternalSyntheticLambda0;->$r8$classId:I

    const/4 v0, 0x1

    if-eq p2, v0, :cond_0

    const/4 v0, 0x2

    if-eq p2, v0, :cond_0

    const/4 v0, 0x3

    :cond_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger$$ExternalSyntheticLambda0;->f$0:Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    iget v0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger$$ExternalSyntheticLambda0;->$r8$classId:I

    const/4 v1, 0x2

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_3

    :pswitch_0
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger$$ExternalSyntheticLambda0;->f$0:Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1
    invoke-static {}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->newBuilder()Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Builder;

    move-result-object v0

    sget-object v1, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->SNAPSHOT:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    .line 2
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->copyOnWrite()V

    .line 3
    iget-object v2, v0, Lcom/google/protobuf/GeneratedMessageLite$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v2, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;

    invoke-static {v2, v1}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->access$100(Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;)V

    .line 4
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 5
    iget-object v2, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mWallpaperStatusChecker:Lcom/google/android/material/shape/EdgeTreatment;

    iget-object v3, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/google/android/material/shape/EdgeTreatment;->isLockWallpaperSet(Landroid/content/Context;)Z

    move-result v2

    .line 6
    invoke-static {}, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->newBuilder()Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot$Builder;

    move-result-object v3

    .line 7
    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getAppLaunchCount()I

    move-result v4

    .line 8
    invoke-virtual {v3}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->copyOnWrite()V

    .line 9
    iget-object v5, v3, Lcom/google/protobuf/GeneratedMessageLite$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v5, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;

    invoke-static {v5, v4}, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->access$500(Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;I)V

    .line 10
    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getFirstLaunchDateSinceSetup()I

    move-result v4

    if-eqz v4, :cond_0

    .line 11
    invoke-virtual {v3}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->copyOnWrite()V

    .line 12
    iget-object v5, v3, Lcom/google/protobuf/GeneratedMessageLite$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v5, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;

    invoke-static {v5, v4}, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->access$100(Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;I)V

    .line 13
    :cond_0
    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getFirstWallpaperApplyDateSinceSetup()I

    move-result v4

    if-eqz v4, :cond_1

    .line 14
    invoke-virtual {v3}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->copyOnWrite()V

    .line 15
    iget-object v5, v3, Lcom/google/protobuf/GeneratedMessageLite$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v5, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;

    invoke-static {v5, v4}, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->access$300(Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;I)V

    .line 16
    :cond_1
    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperCollectionId()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 17
    invoke-virtual {v3}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->copyOnWrite()V

    .line 18
    iget-object v5, v3, Lcom/google/protobuf/GeneratedMessageLite$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v5, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;

    invoke-static {v5, v4}, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->access$700(Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;Ljava/lang/String;)V

    .line 19
    :cond_2
    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperRemoteId()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 20
    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperServiceName()Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    .line 21
    :cond_3
    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperRemoteId()Ljava/lang/String;

    move-result-object v5

    :goto_0
    if-eqz v5, :cond_4

    .line 22
    invoke-virtual {v3}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->copyOnWrite()V

    .line 23
    iget-object v6, v3, Lcom/google/protobuf/GeneratedMessageLite$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v6, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;

    invoke-static {v6, v5}, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->access$1000(Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;Ljava/lang/String;)V

    :cond_4
    if-eqz v2, :cond_5

    .line 24
    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getLockWallpaperCollectionId()Ljava/lang/String;

    move-result-object v4

    :cond_5
    if-eqz v4, :cond_6

    .line 25
    invoke-virtual {v3}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->copyOnWrite()V

    .line 26
    iget-object v6, v3, Lcom/google/protobuf/GeneratedMessageLite$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v6, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;

    invoke-static {v6, v4}, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->access$1300(Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;Ljava/lang/String;)V

    :cond_6
    if-eqz v2, :cond_7

    .line 27
    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getLockWallpaperRemoteId()Ljava/lang/String;

    move-result-object v5

    :cond_7
    if-eqz v5, :cond_8

    .line 28
    invoke-virtual {v3}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->copyOnWrite()V

    .line 29
    iget-object v1, v3, Lcom/google/protobuf/GeneratedMessageLite$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v1, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;

    invoke-static {v1, v5}, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->access$1600(Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;Ljava/lang/String;)V

    .line 30
    :cond_8
    invoke-virtual {v3}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v1

    check-cast v1, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;

    .line 31
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->copyOnWrite()V

    .line 32
    iget-object v2, v0, Lcom/google/protobuf/GeneratedMessageLite$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v2, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;

    invoke-static {v2, v1}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->access$2600(Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;)V

    .line 33
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v0

    check-cast v0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;

    .line 34
    invoke-virtual {p0, v0}, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->log(Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;)V

    return-void

    .line 35
    :pswitch_1
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger$$ExternalSyntheticLambda0;->f$0:Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;

    .line 36
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    const-string v1, "WallpaperPresentationMode"

    .line 37
    invoke-virtual {v0, v1}, Lcom/google/android/gms/clearcut/Counters;->getIntegerHistogram(Ljava/lang/String;)Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;

    move-result-object v0

    .line 38
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getWallpaperPresentationMode()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;->increment(I)V

    .line 39
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    .line 40
    iget-object v0, p0, Lcom/google/android/gms/clearcut/Counters;->zzf:Lcom/google/android/gms/clearcut/Counters$LogEventModifier;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/clearcut/Counters;->logAllAsync(Lcom/google/android/gms/clearcut/Counters$LogEventModifier;)V

    return-void

    .line 41
    :pswitch_2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger$$ExternalSyntheticLambda0;->f$0:Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;

    .line 42
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    const-string v1, "DailyWallpaper.RotationEnabled"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/clearcut/Counters;->getCounter(Ljava/lang/String;)Lcom/google/android/gms/clearcut/Counters$Counter;

    move-result-object v0

    const-wide/16 v1, 0x0

    const-wide/16 v3, 0x1

    .line 43
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->incrementBase(JJ)V

    .line 44
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    .line 45
    iget-object v0, p0, Lcom/google/android/gms/clearcut/Counters;->zzf:Lcom/google/android/gms/clearcut/Counters$LogEventModifier;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/clearcut/Counters;->logAllAsync(Lcom/google/android/gms/clearcut/Counters$LogEventModifier;)V

    return-void

    .line 46
    :pswitch_3
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger$$ExternalSyntheticLambda0;->f$0:Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;

    .line 47
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-interface {v0}, Lcom/android/wallpaper/module/WallpaperPreferences;->getWallpaperPresentationMode()I

    move-result v0

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    goto :goto_1

    :cond_9
    const/4 v0, 0x0

    .line 48
    :goto_1
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getDailyRotationsInLastWeek()Ljava/util/List;

    move-result-object v1

    if-eqz v0, :cond_b

    if-nez v1, :cond_a

    goto :goto_2

    .line 49
    :cond_a
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    const-string v2, "DailyWallpaper.NumRotationsInLastWeek"

    .line 50
    invoke-virtual {v0, v2}, Lcom/google/android/gms/clearcut/Counters;->getIntegerHistogram(Ljava/lang/String;)Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;

    move-result-object v0

    .line 51
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;->increment(I)V

    .line 52
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    .line 53
    iget-object v0, p0, Lcom/google/android/gms/clearcut/Counters;->zzf:Lcom/google/android/gms/clearcut/Counters$LogEventModifier;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/clearcut/Counters;->logAllAsync(Lcom/google/android/gms/clearcut/Counters$LogEventModifier;)V

    :cond_b
    :goto_2
    return-void

    .line 54
    :goto_3
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger$$ExternalSyntheticLambda0;->f$0:Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;

    .line 55
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-interface {v0}, Lcom/android/wallpaper/module/WallpaperPreferences;->getWallpaperPresentationMode()I

    move-result v0

    if-eq v0, v1, :cond_c

    goto :goto_4

    .line 56
    :cond_c
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-interface {v0}, Lcom/android/wallpaper/module/WallpaperPreferences;->getDailyRotationsPreviousDay()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_d

    goto :goto_4

    .line 57
    :cond_d
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    const-string v2, "DailyWallpaper.NumRotationsPreviousDay"

    .line 58
    invoke-virtual {v1, v2}, Lcom/google/android/gms/clearcut/Counters;->getIntegerHistogram(Ljava/lang/String;)Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;

    move-result-object v1

    .line 59
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;->increment(I)V

    .line 60
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    .line 61
    iget-object v0, p0, Lcom/google/android/gms/clearcut/Counters;->zzf:Lcom/google/android/gms/clearcut/Counters$LogEventModifier;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/clearcut/Counters;->logAllAsync(Lcom/google/android/gms/clearcut/Counters$LogEventModifier;)V

    :goto_4
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
