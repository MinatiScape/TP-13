.class public final Lcom/google/android/gms/common/internal/ClientSettings$zza;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/ClientSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zza"
.end annotation


# instance fields
.field public zza:Landroid/accounts/Account;

.field public zzb:Landroidx/collection/ArraySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/ArraySet<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;"
        }
    .end annotation
.end field

.field public zzd:Ljava/lang/String;

.field public zze:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza()Lcom/google/android/gms/common/internal/ClientSettings;
    .locals 10

    .line 1
    new-instance v9, Lcom/google/android/gms/common/internal/ClientSettings;

    iget-object v1, p0, Lcom/google/android/gms/common/internal/ClientSettings$zza;->zza:Landroid/accounts/Account;

    iget-object v2, p0, Lcom/google/android/gms/common/internal/ClientSettings$zza;->zzb:Landroidx/collection/ArraySet;

    iget-object v6, p0, Lcom/google/android/gms/common/internal/ClientSettings$zza;->zzd:Ljava/lang/String;

    iget-object v7, p0, Lcom/google/android/gms/common/internal/ClientSettings$zza;->zze:Ljava/lang/String;

    sget-object v8, Lcom/google/android/gms/signin/SignInOptions;->DEFAULT:Lcom/google/android/gms/signin/SignInOptions;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, v9

    invoke-direct/range {v0 .. v8}, Lcom/google/android/gms/common/internal/ClientSettings;-><init>(Landroid/accounts/Account;Ljava/util/Set;Ljava/util/Map;ILandroid/view/View;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/signin/SignInOptions;)V

    return-object v9
.end method
