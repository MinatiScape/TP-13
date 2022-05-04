.class public final Lcom/google/android/gms/signin/zza;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final zza:Lcom/google/android/gms/common/api/Api$zza;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api$zza<",
            "Lcom/google/android/gms/internal/zzelu;",
            "Lcom/google/android/gms/signin/SignInOptions;",
            ">;"
        }
    .end annotation
.end field

.field public static final zzb:Lcom/google/android/gms/common/api/Api;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api<",
            "Lcom/google/android/gms/signin/SignInOptions;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/google/android/gms/common/api/Api$ClientKey;

    invoke-direct {v0}, Lcom/google/android/gms/common/api/Api$ClientKey;-><init>()V

    .line 2
    new-instance v1, Lcom/google/android/gms/signin/zzb;

    invoke-direct {v1}, Lcom/google/android/gms/signin/zzb;-><init>()V

    sput-object v1, Lcom/google/android/gms/signin/zza;->zza:Lcom/google/android/gms/common/api/Api$zza;

    .line 3
    new-instance v2, Lcom/google/android/gms/common/api/Scope;

    const/4 v3, 0x1

    const-string v4, "profile"

    .line 4
    invoke-direct {v2, v3, v4}, Lcom/google/android/gms/common/api/Scope;-><init>(ILjava/lang/String;)V

    .line 5
    new-instance v2, Lcom/google/android/gms/common/api/Scope;

    const-string v4, "email"

    .line 6
    invoke-direct {v2, v3, v4}, Lcom/google/android/gms/common/api/Scope;-><init>(ILjava/lang/String;)V

    .line 7
    new-instance v2, Lcom/google/android/gms/common/api/Api;

    const-string v3, "SignIn.API"

    invoke-direct {v2, v3, v1, v0}, Lcom/google/android/gms/common/api/Api;-><init>(Ljava/lang/String;Lcom/google/android/gms/common/api/Api$zza;Lcom/google/android/gms/common/api/Api$ClientKey;)V

    sput-object v2, Lcom/google/android/gms/signin/zza;->zzb:Lcom/google/android/gms/common/api/Api;

    return-void
.end method
