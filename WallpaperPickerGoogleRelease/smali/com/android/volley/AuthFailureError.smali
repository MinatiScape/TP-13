.class public Lcom/android/volley/AuthFailureError;
.super Lcom/android/volley/VolleyError;
.source "SourceFile"


# instance fields
.field private mResolutionIntent:Landroid/content/Intent;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/volley/VolleyError;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/android/volley/NetworkResponse;)V
    .locals 0

    .line 2
    invoke-direct {p0, p1}, Lcom/android/volley/VolleyError;-><init>(Lcom/android/volley/NetworkResponse;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 3
    invoke-direct {p0, p1}, Lcom/android/volley/VolleyError;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getMessage()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/volley/AuthFailureError;->mResolutionIntent:Landroid/content/Intent;

    if-eqz v0, :cond_0

    const-string p0, "User needs to (re)enter credentials."

    return-object p0

    .line 2
    :cond_0
    invoke-super {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method