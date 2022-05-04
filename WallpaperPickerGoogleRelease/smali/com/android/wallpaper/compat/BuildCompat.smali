.class public Lcom/android/wallpaper/compat/BuildCompat;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static sSdk:I


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    sput v0, Lcom/android/wallpaper/compat/BuildCompat;->sSdk:I

    return-void
.end method

.method public static isAtLeastN()Z
    .locals 2

    .line 1
    sget v0, Lcom/android/wallpaper/compat/BuildCompat;->sSdk:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
