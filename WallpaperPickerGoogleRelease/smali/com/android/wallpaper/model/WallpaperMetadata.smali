.class public Lcom/android/wallpaper/model/WallpaperMetadata;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final mActionIconRes:I

.field public final mActionLabelRes:I

.field public final mActionUrl:Ljava/lang/String;

.field public final mAttributions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final mCollectionId:Ljava/lang/String;

.field public final mWallpaperComponent:Landroid/app/WallpaperInfo;


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Landroid/app/WallpaperInfo;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "II",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Landroid/app/WallpaperInfo;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/model/WallpaperMetadata;->mAttributions:Ljava/util/List;

    .line 3
    iput-object p2, p0, Lcom/android/wallpaper/model/WallpaperMetadata;->mActionUrl:Ljava/lang/String;

    .line 4
    iput p3, p0, Lcom/android/wallpaper/model/WallpaperMetadata;->mActionLabelRes:I

    .line 5
    iput p4, p0, Lcom/android/wallpaper/model/WallpaperMetadata;->mActionIconRes:I

    .line 6
    iput-object p5, p0, Lcom/android/wallpaper/model/WallpaperMetadata;->mCollectionId:Ljava/lang/String;

    .line 7
    iput-object p7, p0, Lcom/android/wallpaper/model/WallpaperMetadata;->mWallpaperComponent:Landroid/app/WallpaperInfo;

    return-void
.end method
