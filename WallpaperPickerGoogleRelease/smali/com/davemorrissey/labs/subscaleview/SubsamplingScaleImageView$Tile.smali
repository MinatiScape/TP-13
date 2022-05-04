.class public Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Tile"
.end annotation


# instance fields
.field public bitmap:Landroid/graphics/Bitmap;

.field public fileSRect:Landroid/graphics/Rect;

.field public loading:Z

.field public sRect:Landroid/graphics/Rect;

.field public sampleSize:I

.field public vRect:Landroid/graphics/Rect;

.field public visible:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
