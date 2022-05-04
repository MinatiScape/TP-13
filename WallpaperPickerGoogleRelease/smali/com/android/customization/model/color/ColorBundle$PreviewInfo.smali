.class public Lcom/android/customization/model/color/ColorBundle$PreviewInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/customization/model/color/ColorBundle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PreviewInfo"
.end annotation


# instance fields
.field public final icons:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field

.field public final secondaryColorDark:I

.field public final secondaryColorLight:I


# direct methods
.method public constructor <init>(IIIILjava/util/List;Landroid/graphics/drawable/Drawable;ILcom/android/customization/model/color/ColorBundle$1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput p1, p0, Lcom/android/customization/model/color/ColorBundle$PreviewInfo;->secondaryColorLight:I

    .line 3
    iput p2, p0, Lcom/android/customization/model/color/ColorBundle$PreviewInfo;->secondaryColorDark:I

    .line 4
    iput-object p5, p0, Lcom/android/customization/model/color/ColorBundle$PreviewInfo;->icons:Ljava/util/List;

    return-void
.end method
