.class public Lcom/android/customization/model/color/ColorSeedOption$PreviewInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/customization/model/color/ColorSeedOption;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PreviewInfo"
.end annotation


# instance fields
.field public darkColors:[I

.field public lightColors:[I


# direct methods
.method public constructor <init>([I[ILcom/android/customization/model/color/ColorSeedOption$1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/customization/model/color/ColorSeedOption$PreviewInfo;->lightColors:[I

    .line 3
    iput-object p2, p0, Lcom/android/customization/model/color/ColorSeedOption$PreviewInfo;->darkColors:[I

    return-void
.end method
