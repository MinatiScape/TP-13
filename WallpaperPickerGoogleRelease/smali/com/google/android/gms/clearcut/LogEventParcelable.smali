.class public Lcom/google/android/gms/clearcut/LogEventParcelable;
.super Lcom/google/android/gms/internal/zzbkv;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/clearcut/LogEventParcelable;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public addPhenotypeExperimentTokens:Z

.field public final clientVisualElementsProducer:Lcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;

.field public experimentIds:[I

.field public experimentTokens:[[B

.field public experimentTokensParcelables:[Lcom/google/android/gms/phenotype/ExperimentTokens;

.field public final extensionProducer:Lcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;

.field public final logEvent:Lcom/google/android/gms/internal/zzgsv;

.field public logEventBytes:[B

.field public mendelPackages:[Ljava/lang/String;

.field public playLoggerContext:Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;

.field public testCodes:[I


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/clearcut/zzq;

    invoke-direct {v0}, Lcom/google/android/gms/clearcut/zzq;-><init>()V

    sput-object v0, Lcom/google/android/gms/clearcut/LogEventParcelable;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;Lcom/google/android/gms/internal/zzgsv;Lcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;Lcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;[I[Ljava/lang/String;[I[[B[Lcom/google/android/gms/phenotype/ExperimentTokens;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->playLoggerContext:Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;

    .line 3
    iput-object p2, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->logEvent:Lcom/google/android/gms/internal/zzgsv;

    .line 4
    iput-object p3, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->extensionProducer:Lcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;

    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->clientVisualElementsProducer:Lcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;

    .line 6
    iput-object p5, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->testCodes:[I

    .line 7
    iput-object p1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->mendelPackages:[Ljava/lang/String;

    .line 8
    iput-object p7, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->experimentIds:[I

    .line 9
    iput-object p1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->experimentTokens:[[B

    .line 10
    iput-object p1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->experimentTokensParcelables:[Lcom/google/android/gms/phenotype/ExperimentTokens;

    .line 11
    iput-boolean p10, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->addPhenotypeExperimentTokens:Z

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;[B[I[Ljava/lang/String;[I[[BZ[Lcom/google/android/gms/phenotype/ExperimentTokens;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->playLoggerContext:Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;

    .line 14
    iput-object p2, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->logEventBytes:[B

    .line 15
    iput-object p3, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->testCodes:[I

    .line 16
    iput-object p4, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->mendelPackages:[Ljava/lang/String;

    const/4 p1, 0x0

    .line 17
    iput-object p1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->logEvent:Lcom/google/android/gms/internal/zzgsv;

    .line 18
    iput-object p1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->extensionProducer:Lcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;

    .line 19
    iput-object p1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->clientVisualElementsProducer:Lcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;

    .line 20
    iput-object p5, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->experimentIds:[I

    .line 21
    iput-object p6, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->experimentTokens:[[B

    .line 22
    iput-object p8, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->experimentTokensParcelables:[Lcom/google/android/gms/phenotype/ExperimentTokens;

    .line 23
    iput-boolean p7, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->addPhenotypeExperimentTokens:Z

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 1
    :cond_0
    instance-of v1, p1, Lcom/google/android/gms/clearcut/LogEventParcelable;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 2
    check-cast p1, Lcom/google/android/gms/clearcut/LogEventParcelable;

    .line 3
    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->playLoggerContext:Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;

    iget-object v3, p1, Lcom/google/android/gms/clearcut/LogEventParcelable;->playLoggerContext:Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;

    invoke-static {v1, v3}, Landroidx/core/R$id;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->logEventBytes:[B

    iget-object v3, p1, Lcom/google/android/gms/clearcut/LogEventParcelable;->logEventBytes:[B

    .line 4
    invoke-static {v1, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->testCodes:[I

    iget-object v3, p1, Lcom/google/android/gms/clearcut/LogEventParcelable;->testCodes:[I

    .line 5
    invoke-static {v1, v3}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->mendelPackages:[Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/clearcut/LogEventParcelable;->mendelPackages:[Ljava/lang/String;

    .line 6
    invoke-static {v1, v3}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->logEvent:Lcom/google/android/gms/internal/zzgsv;

    iget-object v3, p1, Lcom/google/android/gms/clearcut/LogEventParcelable;->logEvent:Lcom/google/android/gms/internal/zzgsv;

    .line 7
    invoke-static {v1, v3}, Landroidx/core/R$id;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->extensionProducer:Lcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;

    iget-object v3, p1, Lcom/google/android/gms/clearcut/LogEventParcelable;->extensionProducer:Lcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;

    .line 8
    invoke-static {v1, v3}, Landroidx/core/R$id;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->clientVisualElementsProducer:Lcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;

    iget-object v3, p1, Lcom/google/android/gms/clearcut/LogEventParcelable;->clientVisualElementsProducer:Lcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;

    .line 9
    invoke-static {v1, v3}, Landroidx/core/R$id;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->experimentIds:[I

    iget-object v3, p1, Lcom/google/android/gms/clearcut/LogEventParcelable;->experimentIds:[I

    .line 10
    invoke-static {v1, v3}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->experimentTokens:[[B

    iget-object v3, p1, Lcom/google/android/gms/clearcut/LogEventParcelable;->experimentTokens:[[B

    .line 11
    invoke-static {v1, v3}, Ljava/util/Arrays;->deepEquals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->experimentTokensParcelables:[Lcom/google/android/gms/phenotype/ExperimentTokens;

    iget-object v3, p1, Lcom/google/android/gms/clearcut/LogEventParcelable;->experimentTokensParcelables:[Lcom/google/android/gms/phenotype/ExperimentTokens;

    .line 12
    invoke-static {v1, v3}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-boolean p0, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->addPhenotypeExperimentTokens:Z

    iget-boolean p1, p1, Lcom/google/android/gms/clearcut/LogEventParcelable;->addPhenotypeExperimentTokens:Z

    if-ne p0, p1, :cond_1

    return v0

    :cond_1
    return v2
.end method

.method public hashCode()I
    .locals 3

    const/16 v0, 0xb

    new-array v0, v0, [Ljava/lang/Object;

    .line 1
    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->playLoggerContext:Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->logEventBytes:[B

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->testCodes:[I

    const/4 v2, 0x2

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->mendelPackages:[Ljava/lang/String;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->logEvent:Lcom/google/android/gms/internal/zzgsv;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->extensionProducer:Lcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->clientVisualElementsProducer:Lcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->experimentIds:[I

    const/4 v2, 0x7

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->experimentTokens:[[B

    const/16 v2, 0x8

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->experimentTokensParcelables:[Lcom/google/android/gms/phenotype/ExperimentTokens;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    iget-boolean p0, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->addPhenotypeExperimentTokens:Z

    .line 2
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    const/16 v1, 0xa

    aput-object p0, v0, v1

    .line 3
    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "LogEventParcelable["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->playLoggerContext:Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;

    .line 2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", LogEventBytes: "

    .line 3
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4
    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->logEventBytes:[B

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v1}, Ljava/lang/String;-><init>([B)V

    move-object v1, v2

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", TestCodes: "

    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 6
    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->testCodes:[I

    .line 7
    invoke-static {v1}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", MendelPackages: "

    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->mendelPackages:[Ljava/lang/String;

    .line 10
    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", LogEvent: "

    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->logEvent:Lcom/google/android/gms/internal/zzgsv;

    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", ExtensionProducer: "

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->extensionProducer:Lcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", VeProducer: "

    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->clientVisualElementsProducer:Lcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;

    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", ExperimentIDs: "

    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->experimentIds:[I

    .line 22
    invoke-static {v1}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", ExperimentTokens: "

    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->experimentTokens:[[B

    .line 25
    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", ExperimentTokensParcelables: "

    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->experimentTokensParcelables:[Lcom/google/android/gms/phenotype/ExperimentTokens;

    .line 28
    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", AddPhenotypeExperimentTokens: "

    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    iget-boolean p0, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->addPhenotypeExperimentTokens:Z

    .line 31
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p0, "]"

    .line 32
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 5

    const/16 v0, 0x4f45

    .line 1
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result v0

    const/4 v1, 0x2

    .line 2
    iget-object v2, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->playLoggerContext:Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;

    const/4 v3, 0x0

    invoke-static {p1, v1, v2, p2, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILandroid/os/Parcelable;IZ)V

    const/4 v1, 0x3

    .line 3
    iget-object v2, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->logEventBytes:[B

    invoke-static {p1, v1, v2, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;I[BZ)V

    .line 4
    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->testCodes:[I

    const/4 v2, 0x4

    invoke-static {p1, v2, v1, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;I[IZ)V

    const/4 v1, 0x5

    .line 5
    iget-object v4, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->mendelPackages:[Ljava/lang/String;

    invoke-static {p1, v1, v4, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;I[Ljava/lang/String;Z)V

    const/4 v1, 0x6

    .line 6
    iget-object v4, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->experimentIds:[I

    invoke-static {p1, v1, v4, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;I[IZ)V

    const/4 v1, 0x7

    .line 7
    iget-object v3, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->experimentTokens:[[B

    invoke-static {p1, v1, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;I[[B)V

    const/16 v1, 0x8

    .line 8
    iget-boolean v3, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->addPhenotypeExperimentTokens:Z

    .line 9
    invoke-static {p1, v1, v2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 10
    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeInt(I)V

    const/16 v1, 0x9

    .line 11
    iget-object p0, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->experimentTokensParcelables:[Lcom/google/android/gms/phenotype/ExperimentTokens;

    invoke-static {p1, v1, p0, p2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;I[Landroid/os/Parcelable;I)V

    .line 12
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method
