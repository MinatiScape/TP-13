.class public Lcom/android/wallpaper/util/DownloadableUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1

    const/4 v0, 0x1

    if-eq p2, v0, :cond_0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/util/DownloadableUtils;->mContext:Landroid/content/Context;

    return-void

    .line 3
    :cond_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    iput-object p1, p0, Lcom/android/wallpaper/util/DownloadableUtils;->mContext:Landroid/content/Context;

    return-void
.end method
