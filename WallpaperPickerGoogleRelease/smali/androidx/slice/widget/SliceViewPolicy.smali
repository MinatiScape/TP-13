.class public Landroidx/slice/widget/SliceViewPolicy;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/slice/widget/SliceViewPolicy$PolicyChangeListener;
    }
.end annotation


# instance fields
.field public mListener:Landroidx/slice/widget/SliceViewPolicy$PolicyChangeListener;

.field public mMaxHeight:I

.field public mMaxSmallHeight:I

.field public mMode:I

.field public mScrollable:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Landroidx/slice/widget/SliceViewPolicy;->mMaxHeight:I

    .line 3
    iput v0, p0, Landroidx/slice/widget/SliceViewPolicy;->mMaxSmallHeight:I

    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p0, Landroidx/slice/widget/SliceViewPolicy;->mScrollable:Z

    const/4 v0, 0x2

    .line 5
    iput v0, p0, Landroidx/slice/widget/SliceViewPolicy;->mMode:I

    return-void
.end method
