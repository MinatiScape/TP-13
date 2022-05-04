.class public final Lcom/google/android/gms/signin/SignInOptions;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/api/Api$ApiOptions;


# static fields
.field public static final DEFAULT:Lcom/google/android/gms/signin/SignInOptions;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/signin/SignInOptions;

    .line 2
    invoke-direct {v0}, Lcom/google/android/gms/signin/SignInOptions;-><init>()V

    .line 3
    sput-object v0, Lcom/google/android/gms/signin/SignInOptions;->DEFAULT:Lcom/google/android/gms/signin/SignInOptions;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
