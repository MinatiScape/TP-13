.class public abstract Lcom/google/android/gms/common/internal/GmsClientSupervisor;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;
    }
.end annotation


# static fields
.field public static final zza:Ljava/lang/Object;

.field public static zzb:Lcom/google/android/gms/common/internal/GmsClientSupervisor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/internal/GmsClientSupervisor;->zza:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract bindService(Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;Landroid/content/ServiceConnection;Ljava/lang/String;)Z
.end method

.method public abstract unbindService(Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;Landroid/content/ServiceConnection;Ljava/lang/String;)V
.end method
