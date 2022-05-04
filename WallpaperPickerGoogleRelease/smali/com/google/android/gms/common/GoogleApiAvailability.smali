.class public Lcom/google/android/gms/common/GoogleApiAvailability;
.super Lcom/google/android/gms/common/GoogleApiAvailabilityLight;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/GoogleApiAvailability$zza;
    }
.end annotation


# static fields
.field public static final GOOGLE_PLAY_SERVICES_VERSION_CODE:I

.field public static final zza:Ljava/lang/Object;

.field public static final zzb:Lcom/google/android/gms/common/GoogleApiAvailability;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/GoogleApiAvailability;->zza:Ljava/lang/Object;

    .line 2
    new-instance v0, Lcom/google/android/gms/common/GoogleApiAvailability;

    invoke-direct {v0}, Lcom/google/android/gms/common/GoogleApiAvailability;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/GoogleApiAvailability;->zzb:Lcom/google/android/gms/common/GoogleApiAvailability;

    .line 3
    sget v0, Lcom/google/android/gms/common/GoogleApiAvailabilityLight;->GOOGLE_PLAY_SERVICES_VERSION_CODE:I

    sput v0, Lcom/google/android/gms/common/GoogleApiAvailability;->GOOGLE_PLAY_SERVICES_VERSION_CODE:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/common/GoogleApiAvailabilityLight;-><init>()V

    return-void
.end method

.method public static zza(Landroid/content/Context;ILcom/google/android/gms/common/internal/zzg;Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/Dialog;
    .locals 5

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 4
    :cond_0
    new-instance v1, Landroid/util/TypedValue;

    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    const v3, 0x1010309

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v1, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 6
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget v1, v1, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Theme.Dialog.Alert"

    .line 7
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 8
    new-instance v0, Landroid/app/AlertDialog$Builder;

    const/4 v1, 0x5

    invoke-direct {v0, p0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    :cond_1
    if-nez v0, :cond_2

    .line 9
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 10
    :cond_2
    invoke-static {p0, p1}, Lcom/google/android/gms/common/internal/zzf;->zzc(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    if-eqz p3, :cond_3

    .line 11
    invoke-virtual {v0, p3}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    .line 12
    :cond_3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    if-eq p1, v4, :cond_6

    const/4 v1, 0x2

    if-eq p1, v1, :cond_5

    const/4 v1, 0x3

    if-eq p1, v1, :cond_4

    const v1, 0x104000a

    .line 13
    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p3

    goto :goto_0

    :cond_4
    const v1, 0x7f110059

    .line 14
    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p3

    goto :goto_0

    :cond_5
    const v1, 0x7f110063

    .line 15
    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p3

    goto :goto_0

    :cond_6
    const v1, 0x7f11005c

    .line 16
    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p3

    :goto_0
    if-eqz p3, :cond_7

    .line 17
    invoke-virtual {v0, p3, p2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 18
    :cond_7
    invoke-static {p0, p1}, Lcom/google/android/gms/common/internal/zzf;->zza(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_8

    .line 19
    invoke-virtual {v0, p0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 20
    :cond_8
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    return-object p0
.end method

.method private final zza()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object p0, Lcom/google/android/gms/common/GoogleApiAvailability;->zza:Ljava/lang/Object;

    monitor-enter p0

    const/4 v0, 0x0

    .line 2
    :try_start_0
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    .line 3
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static zza(Landroid/app/Activity;Landroid/app/Dialog;Ljava/lang/String;Landroid/content/DialogInterface$OnCancelListener;)V
    .locals 3

    .line 21
    instance-of v0, p0, Landroidx/fragment/app/FragmentActivity;

    const/4 v1, 0x0

    const-string v2, "Cannot display null dialog"

    if-eqz v0, :cond_1

    .line 22
    check-cast p0, Landroidx/fragment/app/FragmentActivity;

    .line 23
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    .line 24
    new-instance v0, Lcom/google/android/gms/common/SupportErrorDialogFragment;

    invoke-direct {v0}, Lcom/google/android/gms/common/SupportErrorDialogFragment;-><init>()V

    .line 25
    invoke-static {p1, v2}, Landroidx/preference/R$string;->zza(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    invoke-virtual {p1, v1}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 27
    invoke-virtual {p1, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 28
    iput-object p1, v0, Lcom/google/android/gms/common/SupportErrorDialogFragment;->zza:Landroid/app/Dialog;

    if-eqz p3, :cond_0

    .line 29
    iput-object p3, v0, Lcom/google/android/gms/common/SupportErrorDialogFragment;->zzb:Landroid/content/DialogInterface$OnCancelListener;

    .line 30
    :cond_0
    invoke-virtual {v0, p0, p2}, Lcom/google/android/gms/common/SupportErrorDialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void

    .line 31
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    .line 32
    new-instance v0, Lcom/google/android/gms/common/ErrorDialogFragment;

    invoke-direct {v0}, Lcom/google/android/gms/common/ErrorDialogFragment;-><init>()V

    .line 33
    invoke-static {p1, v2}, Landroidx/preference/R$string;->zza(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    invoke-virtual {p1, v1}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 35
    invoke-virtual {p1, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 36
    iput-object p1, v0, Lcom/google/android/gms/common/ErrorDialogFragment;->zza:Landroid/app/Dialog;

    if-eqz p3, :cond_2

    .line 37
    iput-object p3, v0, Lcom/google/android/gms/common/ErrorDialogFragment;->zzb:Landroid/content/DialogInterface$OnCancelListener;

    .line 38
    :cond_2
    invoke-virtual {v0, p0, p2}, Lcom/google/android/gms/common/ErrorDialogFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getErrorResolutionIntent(Landroid/content/Context;ILjava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/google/android/gms/common/GoogleApiAvailabilityLight;->getErrorResolutionIntent(Landroid/content/Context;ILjava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public getErrorResolutionPendingIntent(Landroid/content/Context;IILjava/lang/String;)Landroid/app/PendingIntent;
    .locals 0

    const/4 p4, 0x0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/google/android/gms/common/GoogleApiAvailabilityLight;->getErrorResolutionPendingIntent(Landroid/content/Context;IILjava/lang/String;)Landroid/app/PendingIntent;

    move-result-object p0

    return-object p0
.end method

.method public isGooglePlayServicesAvailable(Landroid/content/Context;)I
    .locals 1

    .line 1
    sget v0, Lcom/google/android/gms/common/GoogleApiAvailabilityLight;->GOOGLE_PLAY_SERVICES_VERSION_CODE:I

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/common/GoogleApiAvailabilityLight;->isGooglePlayServicesAvailable(Landroid/content/Context;I)I

    move-result p0

    return p0
.end method

.method public final isUserResolvableError(I)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/google/android/gms/common/GoogleApiAvailabilityLight;->isUserResolvableError(I)Z

    move-result p0

    return p0
.end method

.method public showErrorDialogFragment(Landroid/app/Activity;IILandroid/content/DialogInterface$OnCancelListener;)Z
    .locals 1

    const-string v0, "d"

    .line 1
    invoke-super {p0, p1, p2, v0}, Lcom/google/android/gms/common/GoogleApiAvailabilityLight;->getErrorResolutionIntent(Landroid/content/Context;ILjava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    .line 2
    new-instance v0, Lcom/google/android/gms/common/internal/zzh;

    invoke-direct {v0, p0, p1, p3}, Lcom/google/android/gms/common/internal/zzh;-><init>(Landroid/content/Intent;Landroid/app/Activity;I)V

    .line 3
    invoke-static {p1, p2, v0, p4}, Lcom/google/android/gms/common/GoogleApiAvailability;->zza(Landroid/content/Context;ILcom/google/android/gms/common/internal/zzg;Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/Dialog;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const-string p2, "GooglePlayServicesErrorDialog"

    .line 4
    invoke-static {p1, p0, p2, p4}, Lcom/google/android/gms/common/GoogleApiAvailability;->zza(Landroid/app/Activity;Landroid/app/Dialog;Ljava/lang/String;Landroid/content/DialogInterface$OnCancelListener;)V

    const/4 p0, 0x1

    return p0
.end method

.method public showErrorNotification(Landroid/content/Context;I)V
    .locals 2

    const/4 v0, 0x0

    const-string v1, "n"

    .line 1
    invoke-super {p0, p1, p2, v0, v1}, Lcom/google/android/gms/common/GoogleApiAvailabilityLight;->getErrorResolutionPendingIntent(Landroid/content/Context;IILjava/lang/String;)Landroid/app/PendingIntent;

    move-result-object v0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/google/android/gms/common/GoogleApiAvailability;->zza(Landroid/content/Context;ILandroid/app/PendingIntent;)V

    return-void
.end method

.method public final zza(Landroid/content/Context;Landroid/app/NotificationManager;)Ljava/lang/String;
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x1a
    .end annotation

    .line 39
    invoke-direct {p0}, Lcom/google/android/gms/common/GoogleApiAvailability;->zza()Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_1

    const-string p0, "com.google.android.gms.availability"

    .line 40
    invoke-virtual {p2, p0}, Landroid/app/NotificationManager;->getNotificationChannel(Ljava/lang/String;)Landroid/app/NotificationChannel;

    move-result-object v0

    .line 41
    sget-object v1, Lcom/google/android/gms/common/internal/zzf;->zza:Landroidx/collection/SimpleArrayMap;

    .line 42
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f11005f

    .line 43
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    if-nez v0, :cond_0

    .line 44
    new-instance v0, Landroid/app/NotificationChannel;

    const/4 v1, 0x4

    invoke-direct {v0, p0, p1, v1}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    invoke-virtual {p2, v0}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    goto :goto_0

    .line 45
    :cond_0
    invoke-virtual {v0}, Landroid/app/NotificationChannel;->getName()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 46
    invoke-virtual {v0, p1}, Landroid/app/NotificationChannel;->setName(Ljava/lang/CharSequence;)V

    .line 47
    invoke-virtual {p2, v0}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    :cond_1
    :goto_0
    return-object p0
.end method

.method public final zza(Landroid/content/Context;ILandroid/app/PendingIntent;)V
    .locals 17
    .annotation build Landroid/annotation/TargetApi;
        value = 0x14
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move-object/from16 v3, p3

    const/4 v4, 0x1

    const/16 v5, 0x12

    if-ne v2, v5, :cond_0

    .line 48
    new-instance v2, Lcom/google/android/gms/common/GoogleApiAvailability$zza;

    invoke-direct {v2, v0, v1}, Lcom/google/android/gms/common/GoogleApiAvailability$zza;-><init>(Lcom/google/android/gms/common/GoogleApiAvailability;Landroid/content/Context;)V

    const-wide/32 v0, 0x1d4c0

    .line 49
    invoke-virtual {v2, v4, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void

    :cond_0
    const/4 v5, 0x6

    if-nez v3, :cond_2

    if-ne v2, v5, :cond_1

    const-string v0, "GoogleApiAvailability"

    const-string v1, "Missing resolution for ConnectionResult.RESOLUTION_REQUIRED. Call GoogleApiAvailability#showErrorNotification(Context, ConnectionResult) instead."

    .line 50
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    return-void

    :cond_2
    if-ne v2, v5, :cond_3

    const-string v6, "common_google_play_services_resolution_required_title"

    .line 51
    invoke-static {v1, v6}, Lcom/google/android/gms/common/internal/zzf;->zza(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    .line 52
    :cond_3
    invoke-static/range {p1 .. p2}, Lcom/google/android/gms/common/internal/zzf;->zza(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v6

    :goto_0
    const v7, 0x7f110060

    if-nez v6, :cond_4

    .line 53
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    .line 54
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    :cond_4
    if-ne v2, v5, :cond_5

    .line 55
    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/common/internal/zzf;->zzb(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    const-string v8, "common_google_play_services_resolution_required_text"

    .line 56
    invoke-static {v1, v8, v5}, Lcom/google/android/gms/common/internal/zzf;->zza(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 57
    :cond_5
    invoke-static/range {p1 .. p2}, Lcom/google/android/gms/common/internal/zzf;->zzc(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v5

    .line 58
    :goto_1
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const-string v9, "notification"

    .line 59
    invoke-virtual {v1, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/app/NotificationManager;

    .line 60
    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/common/util/zzi;->zzb(Landroid/content/Context;)Z

    move-result v10

    const/4 v11, 0x0

    const/4 v12, 0x2

    if-eqz v10, :cond_6

    .line 61
    new-instance v7, Landroid/app/Notification$Builder;

    invoke-direct {v7, v1}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 62
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v10

    iget v10, v10, Landroid/content/pm/ApplicationInfo;->icon:I

    invoke-virtual {v7, v10}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v7

    .line 63
    invoke-virtual {v7, v12}, Landroid/app/Notification$Builder;->setPriority(I)Landroid/app/Notification$Builder;

    move-result-object v7

    .line 64
    invoke-virtual {v7, v4}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    move-result-object v7

    .line 65
    invoke-virtual {v7, v6}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v6

    new-instance v7, Landroid/app/Notification$BigTextStyle;

    invoke-direct {v7}, Landroid/app/Notification$BigTextStyle;-><init>()V

    .line 66
    invoke-virtual {v7, v5}, Landroid/app/Notification$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    move-result-object v5

    invoke-virtual {v6, v5}, Landroid/app/Notification$Builder;->setStyle(Landroid/app/Notification$Style;)Landroid/app/Notification$Builder;

    move-result-object v5

    const v6, 0x7f08007c

    const v7, 0x7f110068

    .line 67
    invoke-virtual {v8, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 68
    invoke-virtual {v5, v6, v7, v3}, Landroid/app/Notification$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v3

    .line 69
    invoke-virtual {v0, v1, v9}, Lcom/google/android/gms/common/GoogleApiAvailability;->zza(Landroid/content/Context;Landroid/app/NotificationManager;)Ljava/lang/String;

    move-result-object v0

    .line 70
    invoke-virtual {v3, v0}, Landroid/app/Notification$Builder;->setChannelId(Ljava/lang/String;)Landroid/app/Notification$Builder;

    .line 71
    invoke-virtual {v3}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    goto/16 :goto_a

    .line 72
    :cond_6
    new-instance v10, Landroidx/core/app/NotificationCompat$Builder;

    invoke-direct {v10, v1}, Landroidx/core/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    const v13, 0x108008a

    .line 73
    iget-object v14, v10, Landroidx/core/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    iput v13, v14, Landroid/app/Notification;->icon:I

    .line 74
    invoke-virtual {v8, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 75
    iget-object v8, v10, Landroidx/core/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    invoke-static {v7}, Landroidx/core/app/NotificationCompat$Builder;->limitCharSequenceLength(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v7

    iput-object v7, v8, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    .line 76
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 77
    iget-object v13, v10, Landroidx/core/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    iput-wide v7, v13, Landroid/app/Notification;->when:J

    .line 78
    iget v7, v13, Landroid/app/Notification;->flags:I

    or-int/lit8 v7, v7, 0x10

    iput v7, v13, Landroid/app/Notification;->flags:I

    .line 79
    iput-object v3, v10, Landroidx/core/app/NotificationCompat$Builder;->mContentIntent:Landroid/app/PendingIntent;

    .line 80
    invoke-static {v6}, Landroidx/core/app/NotificationCompat$Builder;->limitCharSequenceLength(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    iput-object v3, v10, Landroidx/core/app/NotificationCompat$Builder;->mContentTitle:Ljava/lang/CharSequence;

    .line 81
    invoke-static {v5}, Landroidx/core/app/NotificationCompat$Builder;->limitCharSequenceLength(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    iput-object v3, v10, Landroidx/core/app/NotificationCompat$Builder;->mContentText:Ljava/lang/CharSequence;

    .line 82
    iput-boolean v4, v10, Landroidx/core/app/NotificationCompat$Builder;->mLocalOnly:Z

    .line 83
    new-instance v3, Landroidx/core/app/NotificationCompat$BigTextStyle;

    invoke-direct {v3}, Landroidx/core/app/NotificationCompat$BigTextStyle;-><init>()V

    .line 84
    invoke-static {v5}, Landroidx/core/app/NotificationCompat$Builder;->limitCharSequenceLength(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v5

    iput-object v5, v3, Landroidx/core/app/NotificationCompat$BigTextStyle;->mBigText:Ljava/lang/CharSequence;

    .line 85
    iget-object v5, v10, Landroidx/core/app/NotificationCompat$Builder;->mStyle:Landroidx/core/app/NotificationCompat$Style;

    if-eq v5, v3, :cond_7

    .line 86
    iput-object v3, v10, Landroidx/core/app/NotificationCompat$Builder;->mStyle:Landroidx/core/app/NotificationCompat$Style;

    .line 87
    iget-object v5, v3, Landroidx/core/app/NotificationCompat$Style;->mBuilder:Landroidx/core/app/NotificationCompat$Builder;

    if-eq v5, v10, :cond_7

    .line 88
    iput-object v10, v3, Landroidx/core/app/NotificationCompat$Style;->mBuilder:Landroidx/core/app/NotificationCompat$Builder;

    .line 89
    invoke-virtual {v10, v3}, Landroidx/core/app/NotificationCompat$Builder;->setStyle(Landroidx/core/app/NotificationCompat$Style;)Landroidx/core/app/NotificationCompat$Builder;

    .line 90
    :cond_7
    invoke-virtual {v0, v1, v9}, Lcom/google/android/gms/common/GoogleApiAvailability;->zza(Landroid/content/Context;Landroid/app/NotificationManager;)Ljava/lang/String;

    move-result-object v0

    .line 91
    iput-object v0, v10, Landroidx/core/app/NotificationCompat$Builder;->mChannelId:Ljava/lang/String;

    .line 92
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 93
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 94
    new-instance v1, Landroid/app/Notification$Builder;

    iget-object v3, v10, Landroidx/core/app/NotificationCompat$Builder;->mContext:Landroid/content/Context;

    iget-object v5, v10, Landroidx/core/app/NotificationCompat$Builder;->mChannelId:Ljava/lang/String;

    invoke-direct {v1, v3, v5}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 95
    iget-object v3, v10, Landroidx/core/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    .line 96
    iget-wide v5, v3, Landroid/app/Notification;->when:J

    invoke-virtual {v1, v5, v6}, Landroid/app/Notification$Builder;->setWhen(J)Landroid/app/Notification$Builder;

    move-result-object v5

    iget v6, v3, Landroid/app/Notification;->icon:I

    iget v7, v3, Landroid/app/Notification;->iconLevel:I

    .line 97
    invoke-virtual {v5, v6, v7}, Landroid/app/Notification$Builder;->setSmallIcon(II)Landroid/app/Notification$Builder;

    move-result-object v5

    iget-object v6, v3, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    .line 98
    invoke-virtual {v5, v6}, Landroid/app/Notification$Builder;->setContent(Landroid/widget/RemoteViews;)Landroid/app/Notification$Builder;

    move-result-object v5

    iget-object v6, v3, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    const/4 v7, 0x0

    .line 99
    invoke-virtual {v5, v6, v7}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;Landroid/widget/RemoteViews;)Landroid/app/Notification$Builder;

    move-result-object v5

    iget-object v6, v3, Landroid/app/Notification;->vibrate:[J

    .line 100
    invoke-virtual {v5, v6}, Landroid/app/Notification$Builder;->setVibrate([J)Landroid/app/Notification$Builder;

    move-result-object v5

    iget v6, v3, Landroid/app/Notification;->ledARGB:I

    iget v8, v3, Landroid/app/Notification;->ledOnMS:I

    iget v13, v3, Landroid/app/Notification;->ledOffMS:I

    .line 101
    invoke-virtual {v5, v6, v8, v13}, Landroid/app/Notification$Builder;->setLights(III)Landroid/app/Notification$Builder;

    move-result-object v5

    iget v6, v3, Landroid/app/Notification;->flags:I

    and-int/2addr v6, v12

    if-eqz v6, :cond_8

    move v6, v4

    goto :goto_2

    :cond_8
    move v6, v11

    .line 102
    :goto_2
    invoke-virtual {v5, v6}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    move-result-object v5

    iget v6, v3, Landroid/app/Notification;->flags:I

    and-int/lit8 v6, v6, 0x8

    if-eqz v6, :cond_9

    move v6, v4

    goto :goto_3

    :cond_9
    move v6, v11

    .line 103
    :goto_3
    invoke-virtual {v5, v6}, Landroid/app/Notification$Builder;->setOnlyAlertOnce(Z)Landroid/app/Notification$Builder;

    move-result-object v5

    iget v6, v3, Landroid/app/Notification;->flags:I

    and-int/lit8 v6, v6, 0x10

    if-eqz v6, :cond_a

    move v6, v4

    goto :goto_4

    :cond_a
    move v6, v11

    .line 104
    :goto_4
    invoke-virtual {v5, v6}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    move-result-object v5

    iget v6, v3, Landroid/app/Notification;->defaults:I

    .line 105
    invoke-virtual {v5, v6}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    move-result-object v5

    iget-object v6, v10, Landroidx/core/app/NotificationCompat$Builder;->mContentTitle:Ljava/lang/CharSequence;

    .line 106
    invoke-virtual {v5, v6}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v5

    iget-object v6, v10, Landroidx/core/app/NotificationCompat$Builder;->mContentText:Ljava/lang/CharSequence;

    .line 107
    invoke-virtual {v5, v6}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v5

    .line 108
    invoke-virtual {v5, v7}, Landroid/app/Notification$Builder;->setContentInfo(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v5

    iget-object v6, v10, Landroidx/core/app/NotificationCompat$Builder;->mContentIntent:Landroid/app/PendingIntent;

    .line 109
    invoke-virtual {v5, v6}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v5

    iget-object v6, v3, Landroid/app/Notification;->deleteIntent:Landroid/app/PendingIntent;

    .line 110
    invoke-virtual {v5, v6}, Landroid/app/Notification$Builder;->setDeleteIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v5

    iget v6, v3, Landroid/app/Notification;->flags:I

    and-int/lit16 v6, v6, 0x80

    if-eqz v6, :cond_b

    move v6, v4

    goto :goto_5

    :cond_b
    move v6, v11

    .line 111
    :goto_5
    invoke-virtual {v5, v7, v6}, Landroid/app/Notification$Builder;->setFullScreenIntent(Landroid/app/PendingIntent;Z)Landroid/app/Notification$Builder;

    move-result-object v5

    .line 112
    invoke-virtual {v5, v7}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    move-result-object v5

    .line 113
    invoke-virtual {v5, v11}, Landroid/app/Notification$Builder;->setNumber(I)Landroid/app/Notification$Builder;

    move-result-object v5

    .line 114
    invoke-virtual {v5, v11, v11, v11}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    .line 115
    invoke-virtual {v1, v7}, Landroid/app/Notification$Builder;->setSubText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v5

    .line 116
    invoke-virtual {v5, v11}, Landroid/app/Notification$Builder;->setUsesChronometer(Z)Landroid/app/Notification$Builder;

    move-result-object v5

    .line 117
    invoke-virtual {v5, v11}, Landroid/app/Notification$Builder;->setPriority(I)Landroid/app/Notification$Builder;

    .line 118
    iget-object v5, v10, Landroidx/core/app/NotificationCompat$Builder;->mActions:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_6
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    const-string v8, "android.support.allowGeneratedReplies"

    if-eqz v6, :cond_c

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/core/app/NotificationCompat$Action;

    .line 119
    invoke-static {v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    new-instance v6, Landroid/app/Notification$Action$Builder;

    .line 121
    invoke-direct {v6, v7, v7, v7}, Landroid/app/Notification$Action$Builder;-><init>(Landroid/graphics/drawable/Icon;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 122
    new-instance v13, Landroid/os/Bundle;

    invoke-direct {v13}, Landroid/os/Bundle;-><init>()V

    .line 123
    invoke-virtual {v13, v8, v11}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 124
    invoke-virtual {v6, v11}, Landroid/app/Notification$Action$Builder;->setAllowGeneratedReplies(Z)Landroid/app/Notification$Action$Builder;

    const-string v8, "android.support.action.semanticAction"

    .line 125
    invoke-virtual {v13, v8, v11}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 126
    invoke-virtual {v6, v11}, Landroid/app/Notification$Action$Builder;->setSemanticAction(I)Landroid/app/Notification$Action$Builder;

    .line 127
    invoke-virtual {v6, v11}, Landroid/app/Notification$Action$Builder;->setContextual(Z)Landroid/app/Notification$Action$Builder;

    const-string v8, "android.support.action.showsUserInterface"

    .line 128
    invoke-virtual {v13, v8, v11}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 129
    invoke-virtual {v6, v13}, Landroid/app/Notification$Action$Builder;->addExtras(Landroid/os/Bundle;)Landroid/app/Notification$Action$Builder;

    .line 130
    invoke-virtual {v6}, Landroid/app/Notification$Action$Builder;->build()Landroid/app/Notification$Action;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/app/Notification$Builder;->addAction(Landroid/app/Notification$Action;)Landroid/app/Notification$Builder;

    goto :goto_6

    .line 131
    :cond_c
    iget-object v5, v10, Landroidx/core/app/NotificationCompat$Builder;->mExtras:Landroid/os/Bundle;

    if-eqz v5, :cond_d

    .line 132
    invoke-virtual {v0, v5}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    .line 133
    :cond_d
    iget-boolean v5, v10, Landroidx/core/app/NotificationCompat$Builder;->mShowWhen:Z

    invoke-virtual {v1, v5}, Landroid/app/Notification$Builder;->setShowWhen(Z)Landroid/app/Notification$Builder;

    .line 134
    iget-boolean v5, v10, Landroidx/core/app/NotificationCompat$Builder;->mLocalOnly:Z

    invoke-virtual {v1, v5}, Landroid/app/Notification$Builder;->setLocalOnly(Z)Landroid/app/Notification$Builder;

    move-result-object v5

    .line 135
    invoke-virtual {v5, v7}, Landroid/app/Notification$Builder;->setGroup(Ljava/lang/String;)Landroid/app/Notification$Builder;

    move-result-object v5

    .line 136
    invoke-virtual {v5, v11}, Landroid/app/Notification$Builder;->setGroupSummary(Z)Landroid/app/Notification$Builder;

    move-result-object v5

    .line 137
    invoke-virtual {v5, v7}, Landroid/app/Notification$Builder;->setSortKey(Ljava/lang/String;)Landroid/app/Notification$Builder;

    .line 138
    invoke-virtual {v1, v7}, Landroid/app/Notification$Builder;->setCategory(Ljava/lang/String;)Landroid/app/Notification$Builder;

    move-result-object v5

    .line 139
    invoke-virtual {v5, v11}, Landroid/app/Notification$Builder;->setColor(I)Landroid/app/Notification$Builder;

    move-result-object v5

    .line 140
    invoke-virtual {v5, v11}, Landroid/app/Notification$Builder;->setVisibility(I)Landroid/app/Notification$Builder;

    move-result-object v5

    .line 141
    invoke-virtual {v5, v7}, Landroid/app/Notification$Builder;->setPublicVersion(Landroid/app/Notification;)Landroid/app/Notification$Builder;

    move-result-object v5

    iget-object v6, v3, Landroid/app/Notification;->sound:Landroid/net/Uri;

    iget-object v3, v3, Landroid/app/Notification;->audioAttributes:Landroid/media/AudioAttributes;

    .line 142
    invoke-virtual {v5, v6, v3}, Landroid/app/Notification$Builder;->setSound(Landroid/net/Uri;Landroid/media/AudioAttributes;)Landroid/app/Notification$Builder;

    .line 143
    iget-object v3, v10, Landroidx/core/app/NotificationCompat$Builder;->mPeople:Ljava/util/ArrayList;

    if-eqz v3, :cond_e

    .line 144
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_e

    .line 145
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_7
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 146
    invoke-virtual {v1, v5}, Landroid/app/Notification$Builder;->addPerson(Ljava/lang/String;)Landroid/app/Notification$Builder;

    goto :goto_7

    .line 147
    :cond_e
    iget-object v3, v10, Landroidx/core/app/NotificationCompat$Builder;->mInvisibleActions:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_13

    .line 148
    iget-object v3, v10, Landroidx/core/app/NotificationCompat$Builder;->mExtras:Landroid/os/Bundle;

    if-nez v3, :cond_f

    .line 149
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    iput-object v3, v10, Landroidx/core/app/NotificationCompat$Builder;->mExtras:Landroid/os/Bundle;

    .line 150
    :cond_f
    iget-object v3, v10, Landroidx/core/app/NotificationCompat$Builder;->mExtras:Landroid/os/Bundle;

    const-string v5, "android.car.EXTENSIONS"

    .line 151
    invoke-virtual {v3, v5}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v3

    if-nez v3, :cond_10

    .line 152
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 153
    :cond_10
    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6, v3}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .line 154
    new-instance v13, Landroid/os/Bundle;

    invoke-direct {v13}, Landroid/os/Bundle;-><init>()V

    move v14, v11

    .line 155
    :goto_8
    iget-object v15, v10, Landroidx/core/app/NotificationCompat$Builder;->mInvisibleActions:Ljava/util/ArrayList;

    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v15

    if-ge v14, v15, :cond_11

    .line 156
    invoke-static {v14}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v15

    iget-object v12, v10, Landroidx/core/app/NotificationCompat$Builder;->mInvisibleActions:Ljava/util/ArrayList;

    .line 157
    invoke-virtual {v12, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroidx/core/app/NotificationCompat$Action;

    .line 158
    sget-object v16, Landroidx/core/app/NotificationCompatJellybean;->sExtrasLock:Ljava/lang/Object;

    .line 159
    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    .line 160
    invoke-static {v12}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const-string v12, "icon"

    .line 161
    invoke-virtual {v4, v12, v11}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v12, "title"

    .line 162
    invoke-virtual {v4, v12, v7}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    const-string v12, "actionIntent"

    .line 163
    invoke-virtual {v4, v12, v7}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 164
    new-instance v12, Landroid/os/Bundle;

    invoke-direct {v12}, Landroid/os/Bundle;-><init>()V

    .line 165
    invoke-virtual {v12, v8, v11}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v11, "extras"

    .line 166
    invoke-virtual {v4, v11, v12}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 167
    invoke-static {v7}, Landroidx/core/app/NotificationCompatJellybean;->toBundleArray([Landroidx/core/app/RemoteInput;)[Landroid/os/Bundle;

    move-result-object v11

    const-string v12, "remoteInputs"

    invoke-virtual {v4, v12, v11}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    const-string v11, "showsUserInterface"

    const/4 v12, 0x0

    .line 168
    invoke-virtual {v4, v11, v12}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v11, "semanticAction"

    .line 169
    invoke-virtual {v4, v11, v12}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 170
    invoke-virtual {v13, v15, v4}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    add-int/lit8 v14, v14, 0x1

    const/4 v4, 0x1

    const/4 v11, 0x0

    const/4 v12, 0x2

    goto :goto_8

    :cond_11
    const-string v4, "invisible_actions"

    .line 171
    invoke-virtual {v3, v4, v13}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 172
    invoke-virtual {v6, v4, v13}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 173
    iget-object v4, v10, Landroidx/core/app/NotificationCompat$Builder;->mExtras:Landroid/os/Bundle;

    if-nez v4, :cond_12

    .line 174
    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    iput-object v4, v10, Landroidx/core/app/NotificationCompat$Builder;->mExtras:Landroid/os/Bundle;

    .line 175
    :cond_12
    iget-object v4, v10, Landroidx/core/app/NotificationCompat$Builder;->mExtras:Landroid/os/Bundle;

    .line 176
    invoke-virtual {v4, v5, v3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 177
    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 178
    :cond_13
    iget-object v0, v10, Landroidx/core/app/NotificationCompat$Builder;->mExtras:Landroid/os/Bundle;

    invoke-virtual {v1, v0}, Landroid/app/Notification$Builder;->setExtras(Landroid/os/Bundle;)Landroid/app/Notification$Builder;

    move-result-object v0

    .line 179
    invoke-virtual {v0, v7}, Landroid/app/Notification$Builder;->setRemoteInputHistory([Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    const/4 v0, 0x0

    .line 180
    invoke-virtual {v1, v0}, Landroid/app/Notification$Builder;->setBadgeIconType(I)Landroid/app/Notification$Builder;

    move-result-object v3

    .line 181
    invoke-virtual {v3, v7}, Landroid/app/Notification$Builder;->setSettingsText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v3

    .line 182
    invoke-virtual {v3, v7}, Landroid/app/Notification$Builder;->setShortcutId(Ljava/lang/String;)Landroid/app/Notification$Builder;

    move-result-object v3

    const-wide/16 v4, 0x0

    .line 183
    invoke-virtual {v3, v4, v5}, Landroid/app/Notification$Builder;->setTimeoutAfter(J)Landroid/app/Notification$Builder;

    move-result-object v3

    .line 184
    invoke-virtual {v3, v0}, Landroid/app/Notification$Builder;->setGroupAlertBehavior(I)Landroid/app/Notification$Builder;

    .line 185
    iget-object v3, v10, Landroidx/core/app/NotificationCompat$Builder;->mChannelId:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_14

    .line 186
    invoke-virtual {v1, v7}, Landroid/app/Notification$Builder;->setSound(Landroid/net/Uri;)Landroid/app/Notification$Builder;

    move-result-object v3

    .line 187
    invoke-virtual {v3, v0}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    move-result-object v3

    .line 188
    invoke-virtual {v3, v0, v0, v0}, Landroid/app/Notification$Builder;->setLights(III)Landroid/app/Notification$Builder;

    move-result-object v3

    .line 189
    invoke-virtual {v3, v7}, Landroid/app/Notification$Builder;->setVibrate([J)Landroid/app/Notification$Builder;

    .line 190
    :cond_14
    iget-object v0, v10, Landroidx/core/app/NotificationCompat$Builder;->mPersonList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_15

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/core/app/Person;

    .line 191
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    new-instance v3, Landroid/app/Person$Builder;

    invoke-direct {v3}, Landroid/app/Person$Builder;-><init>()V

    .line 193
    invoke-virtual {v3, v7}, Landroid/app/Person$Builder;->setName(Ljava/lang/CharSequence;)Landroid/app/Person$Builder;

    move-result-object v3

    .line 194
    invoke-virtual {v3, v7}, Landroid/app/Person$Builder;->setIcon(Landroid/graphics/drawable/Icon;)Landroid/app/Person$Builder;

    move-result-object v3

    .line 195
    invoke-virtual {v3, v7}, Landroid/app/Person$Builder;->setUri(Ljava/lang/String;)Landroid/app/Person$Builder;

    move-result-object v3

    .line 196
    invoke-virtual {v3, v7}, Landroid/app/Person$Builder;->setKey(Ljava/lang/String;)Landroid/app/Person$Builder;

    move-result-object v3

    const/4 v4, 0x0

    .line 197
    invoke-virtual {v3, v4}, Landroid/app/Person$Builder;->setBot(Z)Landroid/app/Person$Builder;

    move-result-object v3

    .line 198
    invoke-virtual {v3, v4}, Landroid/app/Person$Builder;->setImportant(Z)Landroid/app/Person$Builder;

    move-result-object v3

    .line 199
    invoke-virtual {v3}, Landroid/app/Person$Builder;->build()Landroid/app/Person;

    move-result-object v3

    .line 200
    invoke-virtual {v1, v3}, Landroid/app/Notification$Builder;->addPerson(Landroid/app/Person;)Landroid/app/Notification$Builder;

    goto :goto_9

    .line 201
    :cond_15
    iget-boolean v0, v10, Landroidx/core/app/NotificationCompat$Builder;->mAllowSystemGeneratedContextualActions:Z

    invoke-virtual {v1, v0}, Landroid/app/Notification$Builder;->setAllowSystemGeneratedContextualActions(Z)Landroid/app/Notification$Builder;

    .line 202
    invoke-virtual {v1, v7}, Landroid/app/Notification$Builder;->setBubbleMetadata(Landroid/app/Notification$BubbleMetadata;)Landroid/app/Notification$Builder;

    .line 203
    iget-object v0, v10, Landroidx/core/app/NotificationCompat$Builder;->mStyle:Landroidx/core/app/NotificationCompat$Style;

    if-eqz v0, :cond_16

    .line 204
    move-object v3, v0

    check-cast v3, Landroidx/core/app/NotificationCompat$BigTextStyle;

    .line 205
    new-instance v4, Landroid/app/Notification$BigTextStyle;

    .line 206
    invoke-direct {v4, v1}, Landroid/app/Notification$BigTextStyle;-><init>(Landroid/app/Notification$Builder;)V

    .line 207
    invoke-virtual {v4, v7}, Landroid/app/Notification$BigTextStyle;->setBigContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    move-result-object v4

    iget-object v3, v3, Landroidx/core/app/NotificationCompat$BigTextStyle;->mBigText:Ljava/lang/CharSequence;

    .line 208
    invoke-virtual {v4, v3}, Landroid/app/Notification$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    .line 209
    :cond_16
    invoke-virtual {v1}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v1

    if-eqz v0, :cond_17

    .line 210
    iget-object v3, v10, Landroidx/core/app/NotificationCompat$Builder;->mStyle:Landroidx/core/app/NotificationCompat$Style;

    .line 211
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_17
    if-eqz v0, :cond_18

    .line 212
    iget-object v0, v1, Landroid/app/Notification;->extras:Landroid/os/Bundle;

    if-eqz v0, :cond_18

    const-string v3, "androidx.core.app.extra.COMPAT_TEMPLATE"

    const-string v4, "androidx.core.app.NotificationCompat$BigTextStyle"

    .line 213
    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_18
    move-object v0, v1

    :goto_a
    const/4 v1, 0x1

    if-eq v2, v1, :cond_19

    const/4 v1, 0x2

    if-eq v2, v1, :cond_19

    const/4 v1, 0x3

    if-eq v2, v1, :cond_19

    const v1, 0x9b6d

    goto :goto_b

    :cond_19
    const/16 v1, 0x28c4

    .line 214
    sget-object v2, Lcom/google/android/gms/common/GooglePlayServicesUtilLight;->zza:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 215
    :goto_b
    invoke-virtual {v9, v1, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    return-void
.end method
