.class public Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;
.super Lcom/google/android/gms/clearcut/Counters$AbstractCounter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/clearcut/Counters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "IntegerHistogram"
.end annotation


# direct methods
.method public constructor <init>(Lcom/google/android/gms/clearcut/Counters;Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;ZLcom/google/android/gms/clearcut/zzp;)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;-><init>(Lcom/google/android/gms/clearcut/Counters;Lcom/google/android/gms/clearcut/Counters$AbstractCounter;Z)V

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/clearcut/Counters;Ljava/lang/String;Lcom/google/android/gms/clearcut/zzp;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;-><init>(Lcom/google/android/gms/clearcut/Counters;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public increment(I)V
    .locals 4

    int-to-long v0, p1

    const-wide/16 v2, 0x1

    .line 1
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->incrementBase(JJ)V

    return-void
.end method
