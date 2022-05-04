.class public Landroidx/lifecycle/MethodCallsLogger;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/internal/zzfiy;


# instance fields
.field public final synthetic $r8$classId:I

.field public mCalledMethods:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
    .locals 1

    iput p1, p0, Landroidx/lifecycle/MethodCallsLogger;->$r8$classId:I

    const/4 v0, 0x5

    if-eq p1, v0, :cond_0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Landroidx/lifecycle/MethodCallsLogger;->mCalledMethods:Ljava/lang/Object;

    return-void

    .line 3
    :cond_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    new-instance p1, Ljava/util/WeakHashMap;

    invoke-direct {p1}, Ljava/util/WeakHashMap;-><init>()V

    .line 5
    invoke-static {p1}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object p1

    iput-object p1, p0, Landroidx/lifecycle/MethodCallsLogger;->mCalledMethods:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x3

    iput v0, p0, Landroidx/lifecycle/MethodCallsLogger;->$r8$classId:I

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "alarm"

    .line 7
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/AlarmManager;

    iput-object p1, p0, Landroidx/lifecycle/MethodCallsLogger;->mCalledMethods:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public zza()Ljava/lang/Object;
    .locals 1

    iget-object p0, p0, Landroidx/lifecycle/MethodCallsLogger;->mCalledMethods:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/gms/internal/zzfis;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/zzfis;->zzc:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object p0, p0, Lcom/google/android/gms/internal/zzfis;->zzh:Ljava/lang/String;

    invoke-static {v0, p0}, Lcom/google/android/gms/internal/zzfib;->zza(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
