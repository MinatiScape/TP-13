.class public Lcom/android/wallpaper/util/DiskBasedLogger;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final DATE_FORMAT:Ljava/text/SimpleDateFormat;

.field public static final S_LOCK:Ljava/lang/Object;

.field public static final THREAD_CLEANUP_RUNNABLE:Ljava/lang/Runnable;

.field public static final THREAD_TIMEOUT_MILLIS:J

.field public static sHandler:Landroid/os/Handler;

.field public static sLoggerThread:Landroid/os/HandlerThread;


# direct methods
.method public static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ljava/text/SimpleDateFormat;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "EEE MMM dd HH:mm:ss.SSS z yyyy"

    invoke-direct {v0, v2, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lcom/android/wallpaper/util/DiskBasedLogger;->DATE_FORMAT:Ljava/text/SimpleDateFormat;

    .line 2
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/android/wallpaper/util/DiskBasedLogger;->S_LOCK:Ljava/lang/Object;

    .line 3
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x2

    .line 4
    invoke-virtual {v0, v2, v3, v1}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    sput-wide v0, Lcom/android/wallpaper/util/DiskBasedLogger;->THREAD_TIMEOUT_MILLIS:J

    .line 5
    new-instance v0, Lcom/android/wallpaper/util/DiskBasedLogger$1;

    invoke-direct {v0}, Lcom/android/wallpaper/util/DiskBasedLogger$1;-><init>()V

    sput-object v0, Lcom/android/wallpaper/util/DiskBasedLogger;->THREAD_CLEANUP_RUNNABLE:Ljava/lang/Runnable;

    return-void
.end method

.method public static copyLogsNewerThanDate(Ljava/io/BufferedReader;Ljava/io/OutputStream;Ljava/util/Date;)V
    .locals 4

    const-string v0, "DiskBasedLogger"

    .line 1
    :try_start_0
    invoke-virtual {p0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    :goto_0
    if-eqz v1, :cond_1

    const-string v2, "/"

    .line 2
    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aget-object v2, v2, v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 3
    :try_start_1
    sget-object v3, Lcom/android/wallpaper/util/DiskBasedLogger;->DATE_FORMAT:Ljava/text/SimpleDateFormat;

    invoke-virtual {v3, v2}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v2
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 4
    :try_start_2
    invoke-virtual {v2, p2}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 5
    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write([B)V

    const-string v1, "\n"

    .line 6
    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write([B)V

    .line 7
    :cond_0
    invoke-virtual {p0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "Error parsing date from previous logs"

    .line 8
    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    return-void

    :catch_1
    move-exception p0

    const-string p1, "IO exception while reading line from buffered reader"

    .line 9
    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2
    sget-object v0, Landroid/os/Build;->TYPE:Ljava/lang/String;

    const-string v1, "eng"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "userdebug"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 3
    :cond_0
    invoke-static {}, Lcom/android/wallpaper/util/DiskBasedLogger;->getLoggerThreadHandler()Landroid/os/Handler;

    move-result-object v0

    if-nez v0, :cond_1

    const-string p0, "DiskBasedLogger"

    const-string p1, "Something went wrong creating the logger thread handler, quitting this logging operation"

    .line 4
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 5
    :cond_1
    new-instance v1, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda1;

    invoke-direct {v1, p2, p0, p1}, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda1;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public static getHandler()Landroid/os/Handler;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/wallpaper/util/DiskBasedLogger;->sHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public static getLoggerThreadHandler()Landroid/os/Handler;
    .locals 5

    .line 1
    sget-object v0, Lcom/android/wallpaper/util/DiskBasedLogger;->S_LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 2
    :try_start_0
    sget-object v1, Lcom/android/wallpaper/util/DiskBasedLogger;->sLoggerThread:Landroid/os/HandlerThread;

    if-nez v1, :cond_0

    .line 3
    new-instance v1, Landroid/os/HandlerThread;

    const-string v2, "DiskBasedLoggerThread"

    const/16 v3, 0xa

    invoke-direct {v1, v2, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/android/wallpaper/util/DiskBasedLogger;->sLoggerThread:Landroid/os/HandlerThread;

    .line 4
    invoke-virtual {v1}, Landroid/os/HandlerThread;->start()V

    .line 5
    new-instance v1, Landroid/os/Handler;

    sget-object v2, Lcom/android/wallpaper/util/DiskBasedLogger;->sLoggerThread:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v1, Lcom/android/wallpaper/util/DiskBasedLogger;->sHandler:Landroid/os/Handler;

    goto :goto_0

    .line 6
    :cond_0
    sget-object v1, Lcom/android/wallpaper/util/DiskBasedLogger;->sHandler:Landroid/os/Handler;

    sget-object v2, Lcom/android/wallpaper/util/DiskBasedLogger;->THREAD_CLEANUP_RUNNABLE:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 7
    :goto_0
    sget-object v1, Lcom/android/wallpaper/util/DiskBasedLogger;->sHandler:Landroid/os/Handler;

    sget-object v2, Lcom/android/wallpaper/util/DiskBasedLogger;->THREAD_CLEANUP_RUNNABLE:Ljava/lang/Runnable;

    sget-wide v3, Lcom/android/wallpaper/util/DiskBasedLogger;->THREAD_TIMEOUT_MILLIS:J

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 8
    sget-object v1, Lcom/android/wallpaper/util/DiskBasedLogger;->sHandler:Landroid/os/Handler;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
