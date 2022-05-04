.class public Lcom/android/customization/model/color/WallpaperColorResources;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final mColorOverlay:Landroid/util/SparseIntArray;


# direct methods
.method public constructor <init>(Landroid/app/WallpaperColors;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Lcom/android/customization/model/color/WallpaperColorResources;->mColorOverlay:Landroid/util/SparseIntArray;

    .line 3
    new-instance v0, Lcom/android/systemui/monet/ColorScheme;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/android/systemui/monet/ColorScheme;-><init>(Landroid/app/WallpaperColors;Z)V

    .line 4
    invoke-virtual {v0}, Lcom/android/systemui/monet/ColorScheme;->getNeutral1()Ljava/util/List;

    move-result-object p1

    const v1, 0x106001e

    invoke-virtual {p0, p1, v1}, Lcom/android/customization/model/color/WallpaperColorResources;->addOverlayColor(Ljava/util/List;I)V

    .line 5
    invoke-virtual {v0}, Lcom/android/systemui/monet/ColorScheme;->getNeutral2()Ljava/util/List;

    move-result-object p1

    const v1, 0x106002b

    invoke-virtual {p0, p1, v1}, Lcom/android/customization/model/color/WallpaperColorResources;->addOverlayColor(Ljava/util/List;I)V

    .line 6
    invoke-virtual {v0}, Lcom/android/systemui/monet/ColorScheme;->getAccent1()Ljava/util/List;

    move-result-object p1

    const v1, 0x1060038

    invoke-virtual {p0, p1, v1}, Lcom/android/customization/model/color/WallpaperColorResources;->addOverlayColor(Ljava/util/List;I)V

    .line 7
    invoke-virtual {v0}, Lcom/android/systemui/monet/ColorScheme;->getAccent2()Ljava/util/List;

    move-result-object p1

    const v1, 0x1060045

    invoke-virtual {p0, p1, v1}, Lcom/android/customization/model/color/WallpaperColorResources;->addOverlayColor(Ljava/util/List;I)V

    .line 8
    invoke-virtual {v0}, Lcom/android/systemui/monet/ColorScheme;->getAccent3()Ljava/util/List;

    move-result-object p1

    const v0, 0x1060052

    invoke-virtual {p0, p1, v0}, Lcom/android/customization/model/color/WallpaperColorResources;->addOverlayColor(Ljava/util/List;I)V

    return-void
.end method


# virtual methods
.method public final addOverlayColor(Ljava/util/List;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 2
    iget-object v1, p0, Lcom/android/customization/model/color/WallpaperColorResources;->mColorOverlay:Landroid/util/SparseIntArray;

    invoke-virtual {v1, p2, v0}, Landroid/util/SparseIntArray;->put(II)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
