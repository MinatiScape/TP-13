.class public final synthetic Lcom/google/android/gms/internal/zzfiv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/internal/zzfiy;


# instance fields
.field public final zza:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfiv;->zza:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final zza()Ljava/lang/Object;
    .locals 8

    iget-object p0, p0, Lcom/google/android/gms/internal/zzfiv;->zza:Ljava/lang/String;

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/zzfis;->zzc:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/google/android/gms/internal/zzfib;->zzc:Landroid/net/Uri;

    .line 2
    const-class v1, Lcom/google/android/gms/internal/zzfib;

    monitor-enter v1

    .line 3
    :try_start_0
    invoke-static {v0}, Lcom/google/android/gms/internal/zzfib;->zza(Landroid/content/ContentResolver;)V

    .line 4
    sget-object v2, Lcom/google/android/gms/internal/zzfib;->zzk:Ljava/lang/Object;

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    sget-object v1, Lcom/google/android/gms/internal/zzfib;->zzg:Ljava/util/HashMap;

    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {v1, p0, v3}, Lcom/google/android/gms/internal/zzfib;->zza(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    if-eqz v4, :cond_0

    .line 6
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    goto :goto_2

    .line 7
    :cond_0
    invoke-static {v0, p0}, Lcom/google/android/gms/internal/zzfib;->zza(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v5, 0x0

    if-eqz v0, :cond_4

    const-string v6, ""

    .line 8
    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    goto :goto_0

    .line 9
    :cond_1
    sget-object v6, Lcom/google/android/gms/internal/zzfib;->zza:Ljava/util/regex/Pattern;

    invoke-virtual {v6, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/regex/Matcher;->matches()Z

    move-result v6

    if-eqz v6, :cond_2

    const/4 v0, 0x1

    .line 10
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move v5, v0

    goto :goto_1

    .line 11
    :cond_2
    sget-object v6, Lcom/google/android/gms/internal/zzfib;->zzb:Ljava/util/regex/Pattern;

    invoke-virtual {v6, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/regex/Matcher;->matches()Z

    move-result v6

    if-eqz v6, :cond_3

    goto :goto_1

    :cond_3
    const-string v3, "Gservices"

    .line 12
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "attempt to read gservices key "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " (value \""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\") as boolean"

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    :goto_0
    move-object v3, v4

    .line 13
    :goto_1
    invoke-static {v2, v1, p0, v3}, Lcom/google/android/gms/internal/zzfib;->zza(Ljava/lang/Object;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/Object;)V

    move p0, v5

    .line 14
    :goto_2
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :catchall_0
    move-exception p0

    .line 15
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method
