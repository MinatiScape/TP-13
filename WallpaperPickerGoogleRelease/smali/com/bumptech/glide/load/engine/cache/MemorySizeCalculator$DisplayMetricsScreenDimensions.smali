.class public final Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$DisplayMetricsScreenDimensions;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$ScreenDimensions;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DisplayMetricsScreenDimensions"
.end annotation


# instance fields
.field public final displayMetrics:Landroid/util/DisplayMetrics;


# direct methods
.method public constructor <init>(Landroid/util/DisplayMetrics;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "displayMetrics"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$DisplayMetricsScreenDimensions;->displayMetrics:Landroid/util/DisplayMetrics;

    return-void
.end method
