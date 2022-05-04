.class public interface abstract Lkotlinx/coroutines/CoroutineExceptionHandler;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/coroutines/CoroutineContext$Element;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlinx/coroutines/CoroutineExceptionHandler$Key;
    }
.end annotation


# static fields
.field public static final synthetic $r8$clinit:I


# virtual methods
.method public abstract handleException(Lkotlin/coroutines/CoroutineContext;Ljava/lang/Throwable;)V
    .param p1    # Lkotlin/coroutines/CoroutineContext;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Throwable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method
