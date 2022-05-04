.class public final synthetic Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/asset/StreamableAsset$StreamReceiver;


# instance fields
.field public final synthetic f$0:Lcom/google/common/util/concurrent/SettableFuture;

.field public final synthetic f$1:Ljava/io/OutputStream;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/util/concurrent/SettableFuture;Ljava/io/OutputStream;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda1;->f$0:Lcom/google/common/util/concurrent/SettableFuture;

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda1;->f$1:Ljava/io/OutputStream;

    return-void
.end method


# virtual methods
.method public final onInputStreamOpened(Ljava/io/InputStream;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda1;->f$0:Lcom/google/common/util/concurrent/SettableFuture;

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda1;->f$1:Ljava/io/OutputStream;

    sget v1, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;->$r8$clinit:I

    if-nez p1, :cond_0

    .line 1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Input stream could not beopened in copyAssetToLocalFile"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Lcom/google/common/util/concurrent/SettableFuture;->setException(Ljava/lang/Throwable;)Z

    goto :goto_0

    .line 2
    :cond_0
    :try_start_0
    invoke-static {p1, p0}, Lcom/google/common/io/ByteStreams;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    if-nez p0, :cond_1

    .line 3
    sget-object p0, Lcom/google/common/util/concurrent/AbstractFuture;->NULL:Ljava/lang/Object;

    .line 4
    :cond_1
    sget-object p1, Lcom/google/common/util/concurrent/AbstractFuture;->ATOMIC_HELPER:Lcom/google/common/util/concurrent/AbstractFuture$AtomicHelper;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1, p0}, Lcom/google/common/util/concurrent/AbstractFuture$AtomicHelper;->casValue(Lcom/google/common/util/concurrent/AbstractFuture;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    .line 5
    invoke-static {v0}, Lcom/google/common/util/concurrent/AbstractFuture;->complete(Lcom/google/common/util/concurrent/AbstractFuture;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 6
    invoke-virtual {v0, p0}, Lcom/google/common/util/concurrent/SettableFuture;->setException(Ljava/lang/Throwable;)Z

    :cond_2
    :goto_0
    return-void
.end method
