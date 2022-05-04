.class public final synthetic Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Ljava/lang/Object;

.field public final synthetic f$1:I


# direct methods
.method public synthetic constructor <init>(Lcom/android/systemui/shared/rotation/RotationButtonController$1;I)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    iput p2, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->f$1:I

    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;II)V
    .locals 0

    iput p3, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->$r8$classId:I

    packed-switch p3, :pswitch_data_0

    :pswitch_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    iput p2, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->f$1:I

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final run()V
    .locals 6

    iget v0, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->$r8$classId:I

    const-wide/16 v1, 0x1

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_0

    :pswitch_0
    iget-object v0, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;

    iget p0, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->f$1:I

    .line 1
    iget-object v3, v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    const-string v4, "DailyWallpaper.SetNextWallpaperResult"

    .line 2
    invoke-virtual {v3, v4}, Lcom/google/android/gms/clearcut/Counters;->getIntegerHistogram(Ljava/lang/String;)Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;

    move-result-object v3

    int-to-long v4, p0

    .line 3
    invoke-virtual {v3, v4, v5, v1, v2}, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->incrementBase(JJ)V

    .line 4
    iget-object p0, v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    .line 5
    iget-object v0, p0, Lcom/google/android/gms/clearcut/Counters;->zzf:Lcom/google/android/gms/clearcut/Counters$LogEventModifier;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/clearcut/Counters;->logAllAsync(Lcom/google/android/gms/clearcut/Counters$LogEventModifier;)V

    return-void

    .line 6
    :pswitch_1
    iget-object v0, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;

    iget p0, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->f$1:I

    .line 7
    iget-object v3, v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    const-string v4, "DailyWallpaper.RotationHourOfDay"

    .line 8
    invoke-virtual {v3, v4}, Lcom/google/android/gms/clearcut/Counters;->getIntegerHistogram(Ljava/lang/String;)Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;

    move-result-object v3

    int-to-long v4, p0

    .line 9
    invoke-virtual {v3, v4, v5, v1, v2}, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->incrementBase(JJ)V

    .line 10
    iget-object p0, v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    .line 11
    iget-object v0, p0, Lcom/google/android/gms/clearcut/Counters;->zzf:Lcom/google/android/gms/clearcut/Counters$LogEventModifier;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/clearcut/Counters;->logAllAsync(Lcom/google/android/gms/clearcut/Counters$LogEventModifier;)V

    return-void

    .line 12
    :pswitch_2
    iget-object v0, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;

    iget p0, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->f$1:I

    .line 13
    iget-object v3, v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    const-string v4, "IndividualWallpaperSetResult"

    .line 14
    invoke-virtual {v3, v4}, Lcom/google/android/gms/clearcut/Counters;->getIntegerHistogram(Ljava/lang/String;)Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;

    move-result-object v3

    int-to-long v4, p0

    .line 15
    invoke-virtual {v3, v4, v5, v1, v2}, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->incrementBase(JJ)V

    .line 16
    iget-object p0, v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    .line 17
    iget-object v0, p0, Lcom/google/android/gms/clearcut/Counters;->zzf:Lcom/google/android/gms/clearcut/Counters$LogEventModifier;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/clearcut/Counters;->logAllAsync(Lcom/google/android/gms/clearcut/Counters$LogEventModifier;)V

    return-void

    .line 18
    :pswitch_3
    iget-object v0, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;

    iget p0, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->f$1:I

    .line 19
    iget-object v3, v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    const-string v4, "DailyWallpaper.NumDaysInNotAttemptedState"

    .line 20
    invoke-virtual {v3, v4}, Lcom/google/android/gms/clearcut/Counters;->getIntegerHistogram(Ljava/lang/String;)Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;

    move-result-object v3

    int-to-long v4, p0

    .line 21
    invoke-virtual {v3, v4, v5, v1, v2}, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->incrementBase(JJ)V

    .line 22
    iget-object p0, v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    .line 23
    iget-object v0, p0, Lcom/google/android/gms/clearcut/Counters;->zzf:Lcom/google/android/gms/clearcut/Counters$LogEventModifier;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/clearcut/Counters;->logAllAsync(Lcom/google/android/gms/clearcut/Counters$LogEventModifier;)V

    return-void

    .line 24
    :pswitch_4
    iget-object v0, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;

    iget p0, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->f$1:I

    .line 25
    iget-object v3, v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    const-string v4, "IndividualWallpaperSetFailureReason"

    .line 26
    invoke-virtual {v3, v4}, Lcom/google/android/gms/clearcut/Counters;->getIntegerHistogram(Ljava/lang/String;)Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;

    move-result-object v3

    int-to-long v4, p0

    .line 27
    invoke-virtual {v3, v4, v5, v1, v2}, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->incrementBase(JJ)V

    .line 28
    iget-object p0, v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    .line 29
    iget-object v0, p0, Lcom/google/android/gms/clearcut/Counters;->zzf:Lcom/google/android/gms/clearcut/Counters$LogEventModifier;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/clearcut/Counters;->logAllAsync(Lcom/google/android/gms/clearcut/Counters$LogEventModifier;)V

    return-void

    .line 30
    :pswitch_5
    iget-object v0, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;

    iget p0, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->f$1:I

    sget-boolean v1, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->IS_VERBOSE:Z

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    invoke-static {}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->newBuilder()Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Builder;

    move-result-object v1

    .line 32
    invoke-static {p0}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->forNumber(I)Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    move-result-object p0

    invoke-virtual {v1, p0}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Builder;->setType(Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;)Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Builder;

    .line 33
    invoke-virtual {v1}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;

    .line 34
    invoke-virtual {v0, p0}, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->log(Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;)V

    return-void

    .line 35
    :pswitch_6
    iget-object v0, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;

    iget p0, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->f$1:I

    .line 36
    iget-object v3, v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    const-string v4, "DailyWallpaper.RotationStatus"

    .line 37
    invoke-virtual {v3, v4}, Lcom/google/android/gms/clearcut/Counters;->getIntegerHistogram(Ljava/lang/String;)Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;

    move-result-object v3

    int-to-long v4, p0

    .line 38
    invoke-virtual {v3, v4, v5, v1, v2}, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->incrementBase(JJ)V

    .line 39
    iget-object v1, v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    const-string v2, "DailyWallpaper.DailyRotationResult"

    .line 40
    invoke-virtual {v1, v2}, Lcom/google/android/gms/clearcut/Counters;->getIntegerHistogram(Ljava/lang/String;)Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;

    move-result-object v1

    const/4 v2, 0x2

    if-eq v2, p0, :cond_0

    const/4 v2, 0x3

    if-eq v2, p0, :cond_0

    const/4 v2, 0x4

    if-ne v2, p0, :cond_1

    :cond_0
    const/4 v2, 0x0

    .line 41
    invoke-virtual {v1, v2}, Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;->increment(I)V

    :cond_1
    if-eqz p0, :cond_2

    const/4 v2, 0x5

    if-ne v2, p0, :cond_3

    :cond_2
    const/4 p0, 0x1

    .line 42
    invoke-virtual {v1, p0}, Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;->increment(I)V

    .line 43
    :cond_3
    iget-object p0, v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    .line 44
    iget-object v0, p0, Lcom/google/android/gms/clearcut/Counters;->zzf:Lcom/google/android/gms/clearcut/Counters$LogEventModifier;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/clearcut/Counters;->logAllAsync(Lcom/google/android/gms/clearcut/Counters$LogEventModifier;)V

    return-void

    .line 45
    :pswitch_7
    iget-object v0, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;

    iget p0, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->f$1:I

    .line 46
    iget-object v3, v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    const-string v4, "DailyWallpaper.NumDaysInFailedState"

    .line 47
    invoke-virtual {v3, v4}, Lcom/google/android/gms/clearcut/Counters;->getIntegerHistogram(Ljava/lang/String;)Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;

    move-result-object v3

    int-to-long v4, p0

    .line 48
    invoke-virtual {v3, v4, v5, v1, v2}, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->incrementBase(JJ)V

    .line 49
    iget-object p0, v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    .line 50
    iget-object v0, p0, Lcom/google/android/gms/clearcut/Counters;->zzf:Lcom/google/android/gms/clearcut/Counters$LogEventModifier;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/clearcut/Counters;->logAllAsync(Lcom/google/android/gms/clearcut/Counters$LogEventModifier;)V

    return-void

    .line 51
    :pswitch_8
    iget-object v0, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;

    iget p0, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->f$1:I

    .line 52
    iget-object v3, v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    const-string v4, "DailyWallpaper.MetadataRequestFailureReason"

    .line 53
    invoke-virtual {v3, v4}, Lcom/google/android/gms/clearcut/Counters;->getIntegerHistogram(Ljava/lang/String;)Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;

    move-result-object v3

    int-to-long v4, p0

    .line 54
    invoke-virtual {v3, v4, v5, v1, v2}, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->incrementBase(JJ)V

    .line 55
    iget-object p0, v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    .line 56
    iget-object v0, p0, Lcom/google/android/gms/clearcut/Counters;->zzf:Lcom/google/android/gms/clearcut/Counters$LogEventModifier;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/clearcut/Counters;->logAllAsync(Lcom/google/android/gms/clearcut/Counters$LogEventModifier;)V

    return-void

    .line 57
    :pswitch_9
    iget-object v0, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/systemui/shared/rotation/RotationButtonController$1;

    iget p0, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->f$1:I

    invoke-static {v0, p0}, Lcom/android/systemui/shared/rotation/RotationButtonController$1;->$r8$lambda$tbcz1Y9L5CjhHvmrEgBc0MOywbA(Lcom/android/systemui/shared/rotation/RotationButtonController$1;I)V

    return-void

    :goto_0
    iget-object v0, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;

    iget p0, p0, Lcom/android/systemui/shared/rotation/RotationButtonController$1$$ExternalSyntheticLambda0;->f$1:I

    .line 58
    iget-object v3, v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    const-string v4, "DailyWallpaper.SetNextWallpaperCrash"

    .line 59
    invoke-virtual {v3, v4}, Lcom/google/android/gms/clearcut/Counters;->getIntegerHistogram(Ljava/lang/String;)Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;

    move-result-object v3

    int-to-long v4, p0

    .line 60
    invoke-virtual {v3, v4, v5, v1, v2}, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->incrementBase(JJ)V

    .line 61
    iget-object p0, v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->mCounters:Lcom/google/android/gms/clearcut/Counters;

    .line 62
    iget-object v0, p0, Lcom/google/android/gms/clearcut/Counters;->zzf:Lcom/google/android/gms/clearcut/Counters$LogEventModifier;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/clearcut/Counters;->logAllAsync(Lcom/google/android/gms/clearcut/Counters$LogEventModifier;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
