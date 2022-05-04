.class public Landroidx/slice/widget/SliceMetricsWrapper;
.super Landroidx/slice/widget/SliceMetrics;
.source "SourceFile"


# instance fields
.field public final mSliceMetrics:Landroid/app/slice/SliceMetrics;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/net/Uri;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "uri"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroidx/slice/widget/SliceMetrics;-><init>()V

    .line 2
    new-instance v0, Landroid/app/slice/SliceMetrics;

    invoke-direct {v0, p1, p2}, Landroid/app/slice/SliceMetrics;-><init>(Landroid/content/Context;Landroid/net/Uri;)V

    iput-object v0, p0, Landroidx/slice/widget/SliceMetricsWrapper;->mSliceMetrics:Landroid/app/slice/SliceMetrics;

    return-void
.end method
