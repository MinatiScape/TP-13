.class public Lcom/android/volley/DefaultRetryPolicy;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final mBackoffMultiplier:F

.field public mCurrentRetryCount:I

.field public mCurrentTimeoutMs:I

.field public final mMaxNumRetries:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x9c4

    .line 2
    iput v0, p0, Lcom/android/volley/DefaultRetryPolicy;->mCurrentTimeoutMs:I

    const/4 v0, 0x1

    .line 3
    iput v0, p0, Lcom/android/volley/DefaultRetryPolicy;->mMaxNumRetries:I

    const/high16 v0, 0x3f800000    # 1.0f

    .line 4
    iput v0, p0, Lcom/android/volley/DefaultRetryPolicy;->mBackoffMultiplier:F

    return-void
.end method

.method public constructor <init>(IIF)V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    iput p1, p0, Lcom/android/volley/DefaultRetryPolicy;->mCurrentTimeoutMs:I

    .line 7
    iput p2, p0, Lcom/android/volley/DefaultRetryPolicy;->mMaxNumRetries:I

    .line 8
    iput p3, p0, Lcom/android/volley/DefaultRetryPolicy;->mBackoffMultiplier:F

    return-void
.end method
