.class public interface abstract Lcom/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/executor/GlideExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "UncaughtThrowableStrategy"
.end annotation


# static fields
.field public static final DEFAULT:Lcom/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy$2;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy$2;-><init>()V

    .line 2
    sput-object v0, Lcom/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy;->DEFAULT:Lcom/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy;

    return-void
.end method


# virtual methods
.method public abstract handle(Ljava/lang/Throwable;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "t"
        }
    .end annotation
.end method
