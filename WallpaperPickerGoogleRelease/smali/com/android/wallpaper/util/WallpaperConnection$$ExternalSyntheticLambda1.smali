.class public final synthetic Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Ljava/lang/Object;

.field public final synthetic f$1:Ljava/lang/Object;

.field public final synthetic f$2:I


# direct methods
.method public synthetic constructor <init>(ILandroid/app/Activity;Landroid/app/WallpaperManager;)V
    .locals 1

    const/4 v0, 0x3

    iput v0, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$2:I

    iput-object p2, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    iput-object p3, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/util/WallpaperConnection;Landroid/app/WallpaperColors;I)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    iput p3, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$2:I

    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;ILcom/android/customization/model/grid/GridOption;)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    iput p2, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$2:I

    iput-object p3, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;ILjava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    iput p2, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$2:I

    iput-object p3, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    iget v0, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->$r8$classId:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;

    iget v1, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$2:I

    iget-object p0, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    check-cast p0, Lcom/android/customization/model/grid/GridOption;

    sget-boolean v2, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->IS_VERBOSE:Z

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1
    invoke-static {}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->newBuilder()Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Builder;

    move-result-object v2

    .line 2
    invoke-static {v1}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->forNumber(I)Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Builder;->setType(Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;)Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Builder;

    .line 3
    iget-object p0, p0, Lcom/android/customization/model/grid/GridOption;->mTitle:Ljava/lang/String;

    .line 4
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    .line 5
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->copyOnWrite()V

    .line 6
    iget-object v1, v2, Lcom/google/protobuf/GeneratedMessageLite$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v1, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;

    invoke-static {v1, p0}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->access$2400(Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;I)V

    .line 7
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;

    .line 8
    invoke-virtual {v0, p0}, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->log(Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;)V

    return-void

    .line 9
    :pswitch_1
    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;

    iget v1, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$2:I

    iget-object p0, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    sget-boolean v2, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->IS_VERBOSE:Z

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    invoke-static {}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->newBuilder()Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Builder;

    move-result-object v2

    .line 11
    invoke-static {v1}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->forNumber(I)Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Builder;->setType(Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;)Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Builder;

    if-eqz p0, :cond_0

    .line 12
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->copyOnWrite()V

    .line 13
    iget-object v1, v2, Lcom/google/protobuf/GeneratedMessageLite$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v1, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;

    invoke-static {v1, p0}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->access$800(Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;Ljava/lang/String;)V

    .line 14
    :cond_0
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;

    invoke-virtual {v0, p0}, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;->log(Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;)V

    return-void

    .line 15
    :pswitch_2
    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/wallpaper/util/WallpaperConnection;

    iget-object v1, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    check-cast v1, Landroid/app/WallpaperColors;

    iget p0, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$2:I

    .line 16
    iget-object v0, v0, Lcom/android/wallpaper/util/WallpaperConnection;->mListener:Lcom/android/wallpaper/util/WallpaperConnection$WallpaperConnectionListener;

    if-eqz v0, :cond_1

    .line 17
    invoke-interface {v0, v1, p0}, Lcom/android/wallpaper/util/WallpaperConnection$WallpaperConnectionListener;->onWallpaperColorsChanged(Landroid/app/WallpaperColors;I)V

    :cond_1
    return-void

    .line 18
    :goto_0
    iget v0, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$2:I

    iget-object v1, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast v1, Landroid/app/Activity;

    iget-object p0, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    check-cast p0, Landroid/app/WallpaperManager;

    sget v2, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;->$r8$clinit:I

    const/4 v2, 0x1

    if-ne v0, v2, :cond_2

    const-string v3, "MicropaperPreviewFragmentGoogle"

    const-string v4, "Can not set micropaper on lock screen only."

    .line 19
    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    const/4 v3, 0x2

    if-ne v0, v3, :cond_3

    goto :goto_1

    :cond_3
    const/4 v2, 0x0

    .line 20
    :goto_1
    invoke-static {v1, p0, v2}, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;->setMicropaperComponentAndReturn(Landroid/app/Activity;Landroid/app/WallpaperManager;Z)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
