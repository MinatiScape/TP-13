.class public final Landroidx/dynamicanimation/animation/AnimationHandler;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/dynamicanimation/animation/AnimationHandler$FrameCallbackScheduler14;,
        Landroidx/dynamicanimation/animation/AnimationHandler$FrameCallbackScheduler16;,
        Landroidx/dynamicanimation/animation/AnimationHandler$AnimationCallbackDispatcher;,
        Landroidx/dynamicanimation/animation/AnimationHandler$FrameCallbackScheduler;,
        Landroidx/dynamicanimation/animation/AnimationHandler$AnimationFrameCallback;
    }
.end annotation


# static fields
.field public static final sAnimatorHandler:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Landroidx/dynamicanimation/animation/AnimationHandler;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final mAnimationCallbacks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/dynamicanimation/animation/AnimationHandler$AnimationFrameCallback;",
            ">;"
        }
    .end annotation
.end field

.field public final mCallbackDispatcher:Landroidx/dynamicanimation/animation/AnimationHandler$AnimationCallbackDispatcher;

.field public mCurrentFrameTime:J

.field public final mDelayedCallbackStartTime:Landroidx/collection/SimpleArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/SimpleArrayMap<",
            "Landroidx/dynamicanimation/animation/AnimationHandler$AnimationFrameCallback;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public mListDirty:Z

.field public final mRunnable:Ljava/lang/Runnable;

.field public mScheduler:Landroidx/dynamicanimation/animation/AnimationHandler$FrameCallbackScheduler;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Landroidx/dynamicanimation/animation/AnimationHandler;->sAnimatorHandler:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>(Landroidx/dynamicanimation/animation/AnimationHandler$FrameCallbackScheduler;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "scheduler"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Landroidx/collection/SimpleArrayMap;

    invoke-direct {v0}, Landroidx/collection/SimpleArrayMap;-><init>()V

    iput-object v0, p0, Landroidx/dynamicanimation/animation/AnimationHandler;->mDelayedCallbackStartTime:Landroidx/collection/SimpleArrayMap;

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/dynamicanimation/animation/AnimationHandler;->mAnimationCallbacks:Ljava/util/ArrayList;

    .line 4
    new-instance v0, Landroidx/dynamicanimation/animation/AnimationHandler$AnimationCallbackDispatcher;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroidx/dynamicanimation/animation/AnimationHandler$AnimationCallbackDispatcher;-><init>(Landroidx/dynamicanimation/animation/AnimationHandler;Landroidx/dynamicanimation/animation/AnimationHandler$1;)V

    iput-object v0, p0, Landroidx/dynamicanimation/animation/AnimationHandler;->mCallbackDispatcher:Landroidx/dynamicanimation/animation/AnimationHandler$AnimationCallbackDispatcher;

    .line 5
    new-instance v0, Lcom/android/wallpaper/util/DiskBasedLogger$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/util/DiskBasedLogger$$ExternalSyntheticLambda1;-><init>(Landroidx/dynamicanimation/animation/AnimationHandler;)V

    iput-object v0, p0, Landroidx/dynamicanimation/animation/AnimationHandler;->mRunnable:Ljava/lang/Runnable;

    const-wide/16 v0, 0x0

    .line 6
    iput-wide v0, p0, Landroidx/dynamicanimation/animation/AnimationHandler;->mCurrentFrameTime:J

    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Landroidx/dynamicanimation/animation/AnimationHandler;->mListDirty:Z

    .line 8
    iput-object p1, p0, Landroidx/dynamicanimation/animation/AnimationHandler;->mScheduler:Landroidx/dynamicanimation/animation/AnimationHandler$FrameCallbackScheduler;

    return-void
.end method


# virtual methods
.method public getScheduler()Landroidx/dynamicanimation/animation/AnimationHandler$FrameCallbackScheduler;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/dynamicanimation/animation/AnimationHandler;->mScheduler:Landroidx/dynamicanimation/animation/AnimationHandler$FrameCallbackScheduler;

    return-object p0
.end method

.method public setScheduler(Landroidx/dynamicanimation/animation/AnimationHandler$FrameCallbackScheduler;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "scheduler"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Landroidx/dynamicanimation/animation/AnimationHandler;->mScheduler:Landroidx/dynamicanimation/animation/AnimationHandler$FrameCallbackScheduler;

    return-void
.end method
