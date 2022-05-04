.class public Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;
.super Lcom/google/android/gms/internal/zzbkv;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/api/Api$ApiOptions;
.implements Lcom/google/android/gms/common/internal/ReflectedParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;",
            ">;"
        }
    .end annotation
.end field

.field public static final zza:Lcom/google/android/gms/common/api/Scope;

.field public static final zzc:Lcom/google/android/gms/common/api/Scope;

.field public static final zzd:Lcom/google/android/gms/common/api/Scope;

.field public static final zze:Lcom/google/android/gms/common/api/Scope;


# instance fields
.field public final zzf:I

.field public final zzg:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;"
        }
    .end annotation
.end field

.field public zzh:Landroid/accounts/Account;

.field public zzi:Z

.field public final zzj:Z

.field public final zzk:Z

.field public zzl:Ljava/lang/String;

.field public zzm:Ljava/lang/String;

.field public zzn:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/google/android/gms/auth/api/signin/internal/zzo;",
            ">;"
        }
    .end annotation
.end field

.field public zzo:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/google/android/gms/auth/api/signin/internal/zzo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .locals 13

    .line 1
    new-instance v0, Lcom/google/android/gms/common/api/Scope;

    const/4 v1, 0x1

    const-string v2, "profile"

    .line 2
    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/common/api/Scope;-><init>(ILjava/lang/String;)V

    .line 3
    sput-object v0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zza:Lcom/google/android/gms/common/api/Scope;

    .line 4
    new-instance v2, Lcom/google/android/gms/common/api/Scope;

    const-string v3, "email"

    .line 5
    invoke-direct {v2, v1, v3}, Lcom/google/android/gms/common/api/Scope;-><init>(ILjava/lang/String;)V

    .line 6
    new-instance v2, Lcom/google/android/gms/common/api/Scope;

    const-string v3, "openid"

    .line 7
    invoke-direct {v2, v1, v3}, Lcom/google/android/gms/common/api/Scope;-><init>(ILjava/lang/String;)V

    .line 8
    sput-object v2, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzc:Lcom/google/android/gms/common/api/Scope;

    .line 9
    new-instance v2, Lcom/google/android/gms/common/api/Scope;

    const-string v3, "https://www.googleapis.com/auth/games_lite"

    .line 10
    invoke-direct {v2, v1, v3}, Lcom/google/android/gms/common/api/Scope;-><init>(ILjava/lang/String;)V

    .line 11
    sput-object v2, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzd:Lcom/google/android/gms/common/api/Scope;

    .line 12
    new-instance v3, Lcom/google/android/gms/common/api/Scope;

    const-string v4, "https://www.googleapis.com/auth/games"

    .line 13
    invoke-direct {v3, v1, v4}, Lcom/google/android/gms/common/api/Scope;-><init>(ILjava/lang/String;)V

    .line 14
    sput-object v3, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zze:Lcom/google/android/gms/common/api/Scope;

    .line 15
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 16
    new-instance v12, Ljava/util/HashMap;

    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    .line 17
    sget-object v3, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzc:Lcom/google/android/gms/common/api/Scope;

    invoke-interface {v1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 18
    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 19
    sget-object v0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zze:Lcom/google/android/gms/common/api/Scope;

    invoke-interface {v1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzd:Lcom/google/android/gms/common/api/Scope;

    invoke-interface {v1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 20
    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 21
    :cond_0
    new-instance v3, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v4, 0x3

    .line 22
    invoke-direct/range {v3 .. v12}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;-><init>(ILjava/util/ArrayList;Landroid/accounts/Account;ZZZLjava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 23
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 24
    new-instance v12, Ljava/util/HashMap;

    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    const/4 v1, 0x0

    new-array v1, v1, [Lcom/google/android/gms/common/api/Scope;

    .line 25
    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 26
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 27
    sget-object v1, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zze:Lcom/google/android/gms/common/api/Scope;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    sget-object v1, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzd:Lcom/google/android/gms/common/api/Scope;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 28
    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 29
    :cond_1
    new-instance v3, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v4, 0x3

    .line 30
    invoke-direct/range {v3 .. v12}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;-><init>(ILjava/util/ArrayList;Landroid/accounts/Account;ZZZLjava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 31
    new-instance v0, Lcom/google/android/gms/auth/api/signin/zze;

    invoke-direct {v0}, Lcom/google/android/gms/auth/api/signin/zze;-><init>()V

    sput-object v0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(ILjava/util/ArrayList;Landroid/accounts/Account;ZZZLjava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;",
            "Landroid/accounts/Account;",
            "ZZZ",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/google/android/gms/auth/api/signin/internal/zzo;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    .line 2
    iput p1, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzf:I

    .line 3
    iput-object p2, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzg:Ljava/util/ArrayList;

    .line 4
    iput-object p3, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzh:Landroid/accounts/Account;

    .line 5
    iput-boolean p4, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzi:Z

    .line 6
    iput-boolean p5, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzj:Z

    .line 7
    iput-boolean p6, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzk:Z

    .line 8
    iput-object p7, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzl:Ljava/lang/String;

    .line 9
    iput-object p8, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzm:Ljava/lang/String;

    .line 10
    new-instance p1, Ljava/util/ArrayList;

    invoke-interface {p9}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object p1, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzn:Ljava/util/ArrayList;

    .line 11
    iput-object p9, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzo:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 1
    :cond_0
    :try_start_0
    check-cast p1, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;

    .line 2
    iget-object v1, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzn:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-gtz v1, :cond_5

    iget-object v1, p1, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzn:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_1

    goto :goto_2

    .line 3
    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzg:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zza()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ne v1, v2, :cond_5

    iget-object v1, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzg:Ljava/util/ArrayList;

    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zza()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->containsAll(Ljava/util/Collection;)Z

    move-result v1

    if-nez v1, :cond_2

    goto :goto_2

    .line 4
    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzh:Landroid/accounts/Account;

    if-nez v1, :cond_3

    .line 5
    iget-object v1, p1, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzh:Landroid/accounts/Account;

    if-nez v1, :cond_5

    goto :goto_0

    .line 6
    :cond_3
    iget-object v2, p1, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzh:Landroid/accounts/Account;

    .line 7
    invoke-virtual {v1, v2}, Landroid/accounts/Account;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzl:Ljava/lang/String;

    .line 8
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 9
    iget-object v1, p1, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzl:Ljava/lang/String;

    .line 10
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_5

    goto :goto_1

    :cond_4
    iget-object v1, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzl:Ljava/lang/String;

    .line 11
    iget-object v2, p1, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzl:Ljava/lang/String;

    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    :goto_1
    iget-boolean v1, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzk:Z

    .line 13
    iget-boolean v2, p1, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzk:Z

    if-ne v1, v2, :cond_5

    .line 14
    iget-boolean v1, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzi:Z

    .line 15
    iget-boolean v2, p1, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzi:Z

    if-ne v1, v2, :cond_5

    .line 16
    iget-boolean p0, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzj:Z

    .line 17
    iget-boolean p1, p1, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzj:Z
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    if-ne p0, p1, :cond_5

    const/4 p0, 0x1

    return p0

    :catch_0
    :cond_5
    :goto_2
    return v0
.end method

.method public hashCode()I
    .locals 6

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2
    iget-object v1, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzg:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_0

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Lcom/google/android/gms/common/api/Scope;

    .line 3
    iget-object v5, v5, Lcom/google/android/gms/common/api/Scope;->zzb:Ljava/lang/String;

    .line 4
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 5
    :cond_0
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    const/4 v1, 0x1

    mul-int/lit8 v1, v1, 0x1f

    .line 6
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v1, v0

    .line 7
    iget-object v0, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzh:Landroid/accounts/Account;

    mul-int/lit8 v1, v1, 0x1f

    if-nez v0, :cond_1

    move v0, v3

    goto :goto_1

    .line 8
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_1
    add-int/2addr v1, v0

    .line 9
    iget-object v0, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzl:Ljava/lang/String;

    mul-int/lit8 v1, v1, 0x1f

    if-nez v0, :cond_2

    goto :goto_2

    .line 10
    :cond_2
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_2
    add-int/2addr v1, v3

    .line 11
    iget-boolean v0, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzk:Z

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    .line 12
    iget-boolean v0, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzi:Z

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    .line 13
    iget-boolean p0, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzj:Z

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, p0

    return v1
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 5

    const/16 v0, 0x4f45

    .line 1
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result v0

    const/4 v1, 0x1

    .line 2
    iget v2, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzf:I

    const/4 v3, 0x4

    .line 3
    invoke-static {p1, v1, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 4
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v1, 0x2

    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zza()Ljava/util/ArrayList;

    move-result-object v2

    const/4 v4, 0x0

    .line 6
    invoke-static {p1, v1, v2, v4}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;ILjava/util/List;Z)V

    const/4 v1, 0x3

    .line 7
    iget-object v2, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzh:Landroid/accounts/Account;

    .line 8
    invoke-static {p1, v1, v2, p2, v4}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILandroid/os/Parcelable;IZ)V

    .line 9
    iget-boolean p2, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzi:Z

    .line 10
    invoke-static {p1, v3, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 11
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    const/4 p2, 0x5

    .line 12
    iget-boolean v1, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzj:Z

    .line 13
    invoke-static {p1, p2, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 14
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    const/4 p2, 0x6

    .line 15
    iget-boolean v1, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzk:Z

    .line 16
    invoke-static {p1, p2, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 17
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    const/4 p2, 0x7

    .line 18
    iget-object v1, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzl:Ljava/lang/String;

    .line 19
    invoke-static {p1, p2, v1, v4}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/16 p2, 0x8

    .line 20
    iget-object v1, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzm:Ljava/lang/String;

    .line 21
    invoke-static {p1, p2, v1, v4}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/16 p2, 0x9

    .line 22
    iget-object p0, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzn:Ljava/util/ArrayList;

    .line 23
    invoke-static {p1, p2, p0, v4}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;ILjava/util/List;Z)V

    .line 24
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method

.method public final zza()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    iget-object p0, p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->zzg:Ljava/util/ArrayList;

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method
