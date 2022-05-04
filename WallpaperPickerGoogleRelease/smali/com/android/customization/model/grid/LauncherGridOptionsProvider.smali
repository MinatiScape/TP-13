.class public Lcom/android/customization/model/grid/LauncherGridOptionsProvider;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final mContext:Landroid/content/Context;

.field public mOptions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/customization/model/grid/GridOption;",
            ">;"
        }
    .end annotation
.end field

.field public final mPreviewUtils:Lcom/android/wallpaper/util/PreviewUtils;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Lcom/android/wallpaper/util/PreviewUtils;

    invoke-direct {v0, p1, p2}, Lcom/android/wallpaper/util/PreviewUtils;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/customization/model/grid/LauncherGridOptionsProvider;->mPreviewUtils:Lcom/android/wallpaper/util/PreviewUtils;

    .line 3
    iput-object p1, p0, Lcom/android/customization/model/grid/LauncherGridOptionsProvider;->mContext:Landroid/content/Context;

    return-void
.end method
