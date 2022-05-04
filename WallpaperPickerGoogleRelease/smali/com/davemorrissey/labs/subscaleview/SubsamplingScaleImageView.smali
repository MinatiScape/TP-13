.class public Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$DefaultOnStateChangedListener;,
        Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnStateChangedListener;,
        Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;,
        Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;,
        Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;,
        Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;,
        Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;,
        Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$BitmapLoadTask;,
        Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;,
        Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TilesInitTask;
    }
.end annotation


# static fields
.field public static final VALID_EASING_STYLES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final VALID_ORIENTATIONS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final VALID_PAN_LIMITS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final VALID_SCALE_TYPES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final VALID_ZOOM_STYLES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

.field public bitmap:Landroid/graphics/Bitmap;

.field public bitmapDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory<",
            "+",
            "Lcom/davemorrissey/labs/subscaleview/decoder/ImageDecoder;",
            ">;"
        }
    .end annotation
.end field

.field public bitmapIsCached:Z

.field public bitmapIsPreview:Z

.field public bitmapPaint:Landroid/graphics/Paint;

.field public decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

.field public final decoderLock:Ljava/util/concurrent/locks/ReadWriteLock;

.field public final density:F

.field public detector:Landroid/view/GestureDetector;

.field public doubleTapZoomDuration:I

.field public doubleTapZoomScale:F

.field public doubleTapZoomStyle:I

.field public final dstArray:[F

.field public eagerLoadingEnabled:Z

.field public executor:Ljava/util/concurrent/Executor;

.field public fullImageSampleSize:I

.field public final handler:Landroid/os/Handler;

.field public imageLoadedSent:Z

.field public isPanning:Z

.field public isQuickScaling:Z

.field public isZooming:Z

.field public matrix:Landroid/graphics/Matrix;

.field public maxScale:F

.field public maxTileHeight:I

.field public maxTileWidth:I

.field public maxTouchCount:I

.field public minScale:F

.field public minimumScaleType:I

.field public minimumTileDpi:I

.field public onLongClickListener:Landroid/view/View$OnLongClickListener;

.field public onStateChangedListener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnStateChangedListener;

.field public orientation:I

.field public panEnabled:Z

.field public panLimit:I

.field public pendingScale:Ljava/lang/Float;

.field public quickScaleEnabled:Z

.field public quickScaleLastDistance:F

.field public quickScaleMoved:Z

.field public quickScaleSCenter:Landroid/graphics/PointF;

.field public final quickScaleThreshold:F

.field public quickScaleVLastPoint:Landroid/graphics/PointF;

.field public quickScaleVStart:Landroid/graphics/PointF;

.field public readySent:Z

.field public regionDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory<",
            "+",
            "Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;",
            ">;"
        }
    .end annotation
.end field

.field public sHeight:I

.field public sOrientation:I

.field public sPendingCenter:Landroid/graphics/PointF;

.field public sRect:Landroid/graphics/RectF;

.field public sRequestedCenter:Landroid/graphics/PointF;

.field public sWidth:I

.field public satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

.field public scale:F

.field public scaleStart:F

.field public singleDetector:Landroid/view/GestureDetector;

.field public final srcArray:[F

.field public tileBgPaint:Landroid/graphics/Paint;

.field public tileMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;",
            ">;>;"
        }
    .end annotation
.end field

.field public uri:Landroid/net/Uri;

.field public vCenterStart:Landroid/graphics/PointF;

.field public vDistStart:F

.field public vTranslate:Landroid/graphics/PointF;

.field public vTranslateBefore:Landroid/graphics/PointF;

.field public vTranslateStart:Landroid/graphics/PointF;

.field public zoomEnabled:Z


# direct methods
.method public static constructor <clinit>()V
    .locals 10

    .line 1
    const-class v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Integer;

    const/4 v1, 0x0

    .line 2
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v2, 0x5a

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    .line 3
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v2, v0, v3

    const/16 v2, 0xb4

    .line 4
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v5, 0x2

    .line 5
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v2, v0, v5

    const/16 v2, 0x10e

    .line 6
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v7, 0x3

    .line 7
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v2, v0, v7

    const/4 v2, -0x1

    .line 8
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v9, 0x4

    aput-object v2, v0, v9

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_ORIENTATIONS:Ljava/util/List;

    new-array v0, v7, [Ljava/lang/Integer;

    aput-object v4, v0, v1

    aput-object v6, v0, v3

    aput-object v8, v0, v5

    .line 9
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_ZOOM_STYLES:Ljava/util/List;

    new-array v0, v5, [Ljava/lang/Integer;

    aput-object v6, v0, v1

    aput-object v4, v0, v3

    .line 10
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_EASING_STYLES:Ljava/util/List;

    new-array v0, v7, [Ljava/lang/Integer;

    aput-object v4, v0, v1

    aput-object v6, v0, v3

    aput-object v8, v0, v5

    .line 11
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_PAN_LIMITS:Ljava/util/List;

    new-array v0, v9, [Ljava/lang/Integer;

    aput-object v6, v0, v1

    aput-object v4, v0, v3

    aput-object v8, v0, v5

    .line 12
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v7

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_SCALE_TYPES:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 81
    invoke-direct {p0, p1, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 7

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->orientation:I

    const/high16 v1, 0x40000000    # 2.0f

    .line 3
    iput v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxScale:F

    .line 4
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale()F

    move-result v2

    iput v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale:F

    const/4 v2, -0x1

    .line 5
    iput v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minimumTileDpi:I

    const/4 v2, 0x1

    .line 6
    iput v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panLimit:I

    .line 7
    iput v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minimumScaleType:I

    const v3, 0x7fffffff

    .line 8
    iput v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTileWidth:I

    .line 9
    iput v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTileHeight:I

    .line 10
    sget-object v3, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    iput-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->executor:Ljava/util/concurrent/Executor;

    .line 11
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->eagerLoadingEnabled:Z

    .line 12
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panEnabled:Z

    .line 13
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->zoomEnabled:Z

    .line 14
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleEnabled:Z

    const/high16 v3, 0x3f800000    # 1.0f

    .line 15
    iput v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoomScale:F

    .line 16
    iput v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoomStyle:I

    const/16 v3, 0x1f4

    .line 17
    iput v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoomDuration:I

    .line 18
    new-instance v3, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-direct {v3, v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>(Z)V

    iput-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoderLock:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 19
    new-instance v3, Lcom/davemorrissey/labs/subscaleview/decoder/CompatDecoderFactory;

    const-class v4, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageDecoder;

    invoke-direct {v3, v4}, Lcom/davemorrissey/labs/subscaleview/decoder/CompatDecoderFactory;-><init>(Ljava/lang/Class;)V

    iput-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;

    .line 20
    new-instance v3, Lcom/davemorrissey/labs/subscaleview/decoder/CompatDecoderFactory;

    const-class v4, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageRegionDecoder;

    invoke-direct {v3, v4}, Lcom/davemorrissey/labs/subscaleview/decoder/CompatDecoderFactory;-><init>(Ljava/lang/Class;)V

    iput-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->regionDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;

    const/16 v3, 0x8

    new-array v4, v3, [F

    .line 21
    iput-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->srcArray:[F

    new-array v3, v3, [F

    .line 22
    iput-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->dstArray:[F

    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    iput v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->density:F

    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    .line 25
    iget v4, v3, Landroid/util/DisplayMetrics;->xdpi:F

    iget v3, v3, Landroid/util/DisplayMetrics;->ydpi:F

    add-float/2addr v4, v3

    div-float/2addr v4, v1

    const/16 v3, 0xa0

    int-to-float v3, v3

    div-float/2addr v4, v3

    .line 26
    iput v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxScale:F

    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    .line 28
    iget v5, v4, Landroid/util/DisplayMetrics;->xdpi:F

    iget v4, v4, Landroid/util/DisplayMetrics;->ydpi:F

    add-float/2addr v5, v4

    div-float/2addr v5, v1

    div-float/2addr v5, v3

    .line 29
    iput v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoomScale:F

    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    .line 31
    iget v4, v3, Landroid/util/DisplayMetrics;->xdpi:F

    iget v3, v3, Landroid/util/DisplayMetrics;->ydpi:F

    add-float/2addr v4, v3

    div-float/2addr v4, v1

    const/16 v1, 0x140

    int-to-float v1, v1

    .line 32
    invoke-static {v4, v1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minimumTileDpi:I

    .line 33
    iget-boolean v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z

    if-eqz v1, :cond_0

    .line 34
    invoke-virtual {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->reset(Z)V

    .line 35
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 36
    :cond_0
    invoke-virtual {p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setGestureDetector(Landroid/content/Context;)V

    .line 37
    new-instance v1, Landroid/os/Handler;

    new-instance v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;

    invoke-direct {v3, p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)V

    invoke-direct {v1, v3}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->handler:Landroid/os/Handler;

    if-eqz p2, :cond_a

    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v3, Lcom/davemorrissey/labs/subscaleview/R$styleable;->SubsamplingScaleImageView:[I

    invoke-virtual {v1, p2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 39
    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 40
    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 41
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_3

    .line 42
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "file:///android_asset/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v3, "Uri must not be null"

    .line 43
    invoke-static {v1, v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v3, "://"

    .line 44
    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "/"

    .line 45
    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 46
    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    :cond_1
    const-string v3, "file:///"

    .line 47
    invoke-static {v3, v1}, Landroidx/appcompat/view/SupportMenuInflater$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 48
    :cond_2
    new-instance v3, Lcom/davemorrissey/labs/subscaleview/ImageSource;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-direct {v3, v1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;-><init>(Landroid/net/Uri;)V

    .line 49
    iput-boolean v2, v3, Lcom/davemorrissey/labs/subscaleview/ImageSource;->tile:Z

    .line 50
    invoke-virtual {p0, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setImage(Lcom/davemorrissey/labs/subscaleview/ImageSource;)V

    :cond_3
    const/4 v1, 0x3

    .line 51
    invoke-virtual {p2, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 52
    invoke-virtual {p2, v1, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    if-lez v1, :cond_4

    .line 53
    new-instance v3, Lcom/davemorrissey/labs/subscaleview/ImageSource;

    invoke-direct {v3, v1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;-><init>(I)V

    .line 54
    iput-boolean v2, v3, Lcom/davemorrissey/labs/subscaleview/ImageSource;->tile:Z

    .line 55
    invoke-virtual {p0, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setImage(Lcom/davemorrissey/labs/subscaleview/ImageSource;)V

    .line 56
    :cond_4
    invoke-virtual {p2, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    const/4 v3, 0x2

    if-eqz v1, :cond_5

    .line 57
    invoke-virtual {p2, v2, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    .line 58
    iput-boolean v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panEnabled:Z

    if-nez v1, :cond_5

    .line 59
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-eqz v1, :cond_5

    .line 60
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v4

    div-int/2addr v4, v3

    int-to-float v4, v4

    iget v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v6

    div-int/2addr v6, v3

    int-to-float v6, v6

    mul-float/2addr v5, v6

    sub-float/2addr v4, v5

    iput v4, v1, Landroid/graphics/PointF;->x:F

    .line 61
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v4

    div-int/2addr v4, v3

    int-to-float v4, v4

    iget v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v6

    div-int/2addr v6, v3

    int-to-float v6, v6

    mul-float/2addr v5, v6

    sub-float/2addr v4, v5

    iput v4, v1, Landroid/graphics/PointF;->y:F

    .line 62
    iget-boolean v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z

    if-eqz v1, :cond_5

    .line 63
    invoke-virtual {p0, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->refreshRequiredTiles(Z)V

    .line 64
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_5
    const/4 v1, 0x5

    .line 65
    invoke-virtual {p2, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 66
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    .line 67
    iput-boolean v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->zoomEnabled:Z

    .line 68
    :cond_6
    invoke-virtual {p2, v3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 69
    invoke-virtual {p2, v3, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    .line 70
    iput-boolean v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleEnabled:Z

    :cond_7
    const/4 v1, 0x4

    .line 71
    invoke-virtual {p2, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 72
    invoke-static {v0, v0, v0, v0}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    invoke-virtual {p2, v1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v0

    .line 73
    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    if-nez v1, :cond_8

    const/4 v0, 0x0

    .line 74
    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileBgPaint:Landroid/graphics/Paint;

    goto :goto_0

    .line 75
    :cond_8
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileBgPaint:Landroid/graphics/Paint;

    .line 76
    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 77
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileBgPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 78
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 79
    :cond_9
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    :cond_a
    const/high16 p2, 0x41a00000    # 20.0f

    .line 80
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    invoke-static {v2, p2, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleThreshold:F

    return-void
.end method

.method public static synthetic access$201(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/view/View$OnLongClickListener;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public static synthetic access$301(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/view/View$OnLongClickListener;)V
    .locals 0

    const/4 p1, 0x0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public static access$5200(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/content/Context;Ljava/lang/String;)I
    .locals 9

    const-string p0, "content"

    .line 1
    invoke-virtual {p2, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    const/4 v0, 0x0

    const-string v1, "SubsamplingScaleImageView"

    if-eqz p0, :cond_3

    const/4 p0, 0x0

    :try_start_0
    const-string v2, "orientation"

    .line 2
    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v5

    .line 3
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 4
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 5
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    .line 6
    sget-object p2, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_ORIENTATIONS:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {p2, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    const/4 p2, -0x1

    if-eq p1, p2, :cond_0

    move v0, p1

    goto :goto_0

    .line 7
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported orientation: "

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    :goto_0
    if-eqz p0, :cond_9

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_0
    :try_start_1
    const-string p1, "Could not get orientation of image from media store"

    .line 8
    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz p0, :cond_9

    .line 9
    :goto_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    goto/16 :goto_6

    :goto_2
    if-eqz p0, :cond_2

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 10
    :cond_2
    throw p1

    :cond_3
    const-string p0, "file:///"

    .line 11
    invoke-virtual {p2, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_9

    const-string p0, "file:///android_asset/"

    invoke-virtual {p2, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_9

    .line 12
    :try_start_2
    new-instance p0, Landroid/support/media/ExifInterface;

    const/4 p1, 0x7

    invoke-virtual {p2, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/support/media/ExifInterface;-><init>(Ljava/lang/String;)V

    const-string p1, "Orientation"

    .line 13
    invoke-virtual {p0, p1}, Landroid/support/media/ExifInterface;->getExifAttribute(Ljava/lang/String;)Landroid/support/media/ExifInterface$ExifAttribute;

    move-result-object p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    const/4 p2, 0x1

    if-nez p1, :cond_4

    goto :goto_3

    .line 14
    :cond_4
    :try_start_3
    iget-object p0, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    invoke-virtual {p1, p0}, Landroid/support/media/ExifInterface$ExifAttribute;->getIntValue(Ljava/nio/ByteOrder;)I

    move-result p0
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_4

    :catch_1
    :goto_3
    move p0, p2

    :goto_4
    if-eq p0, p2, :cond_9

    if-nez p0, :cond_5

    goto :goto_6

    :cond_5
    const/4 p1, 0x6

    if-ne p0, p1, :cond_6

    const/16 p0, 0x5a

    :goto_5
    move v0, p0

    goto :goto_6

    :cond_6
    const/4 p1, 0x3

    if-ne p0, p1, :cond_7

    const/16 p0, 0xb4

    goto :goto_5

    :cond_7
    const/16 p1, 0x8

    if-ne p0, p1, :cond_8

    const/16 p0, 0x10e

    goto :goto_5

    .line 15
    :cond_8
    :try_start_4
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Unsupported EXIF orientation: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_6

    :catch_2
    const-string p0, "Could not get EXIF orientation of image"

    .line 16
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_9
    :goto_6
    return v0
.end method


# virtual methods
.method public final calculateInSampleSize(F)I
    .locals 3

    .line 1
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minimumTileDpi:I

    if-lez v0, :cond_0

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 3
    iget v1, v0, Landroid/util/DisplayMetrics;->xdpi:F

    iget v0, v0, Landroid/util/DisplayMetrics;->ydpi:F

    add-float/2addr v1, v0

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr v1, v0

    .line 4
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minimumTileDpi:I

    int-to-float v0, v0

    div-float/2addr v0, v1

    mul-float/2addr p1, v0

    .line 5
    :cond_0
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, p1

    float-to-int v0, v0

    .line 6
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, p1

    float-to-int p1, v1

    if-eqz v0, :cond_6

    if-nez p1, :cond_1

    goto :goto_2

    .line 7
    :cond_1
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v1

    const/4 v2, 0x1

    if-gt v1, p1, :cond_3

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v1

    if-le v1, v0, :cond_2

    goto :goto_0

    :cond_2
    move p1, v2

    goto :goto_1

    .line 8
    :cond_3
    :goto_0
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v1

    int-to-float v1, v1

    int-to-float p1, p1

    div-float/2addr v1, p1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result p1

    .line 9
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result p0

    int-to-float p0, p0

    int-to-float v0, v0

    div-float/2addr p0, v0

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    if-ge p1, p0, :cond_4

    goto :goto_1

    :cond_4
    move p1, p0

    :goto_1
    mul-int/lit8 p0, v2, 0x2

    if-ge p0, p1, :cond_5

    move v2, p0

    goto :goto_1

    :cond_5
    return v2

    :cond_6
    :goto_2
    const/16 p0, 0x20

    return p0
.end method

.method public final checkImageLoaded()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isBaseLayerReady()Z

    move-result v0

    .line 2
    iget-boolean v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->imageLoadedSent:Z

    if-nez v1, :cond_0

    if-eqz v0, :cond_0

    .line 3
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->preDraw()V

    const/4 v1, 0x1

    .line 4
    iput-boolean v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->imageLoadedSent:Z

    :cond_0
    return v0
.end method

.method public final checkReady()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    const/4 v1, 0x1

    if-lez v0, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    if-lez v0, :cond_1

    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    if-lez v0, :cond_1

    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isBaseLayerReady()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    move v0, v1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z

    if-nez v2, :cond_2

    if-eqz v0, :cond_2

    .line 3
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->preDraw()V

    .line 4
    iput-boolean v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z

    :cond_2
    return v0
.end method

.method public final distance(FFFF)F
    .locals 0

    sub-float/2addr p1, p2

    sub-float/2addr p3, p4

    mul-float/2addr p1, p1

    mul-float/2addr p3, p3

    add-float/2addr p3, p1

    float-to-double p0, p3

    .line 1
    invoke-static {p0, p1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide p0

    double-to-float p0, p0

    return p0
.end method

.method public final doubleTapZoom(Landroid/graphics/PointF;Landroid/graphics/PointF;)V
    .locals 12

    .line 1
    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panEnabled:Z

    const/4 v1, 0x2

    if-nez v0, :cond_1

    .line 2
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    if-eqz v0, :cond_0

    .line 3
    iget v2, v0, Landroid/graphics/PointF;->x:F

    iput v2, p1, Landroid/graphics/PointF;->x:F

    .line 4
    iget v0, v0, Landroid/graphics/PointF;->y:F

    iput v0, p1, Landroid/graphics/PointF;->y:F

    goto :goto_0

    .line 5
    :cond_0
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v0

    div-int/2addr v0, v1

    int-to-float v0, v0

    iput v0, p1, Landroid/graphics/PointF;->x:F

    .line 6
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v0

    div-int/2addr v0, v1

    int-to-float v0, v0

    iput v0, p1, Landroid/graphics/PointF;->y:F

    .line 7
    :cond_1
    :goto_0
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxScale:F

    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoomScale:F

    invoke-static {v0, v2}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 8
    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    float-to-double v3, v2

    float-to-double v5, v0

    const-wide v7, 0x3feccccccccccccdL    # 0.9

    mul-double/2addr v5, v7

    cmpg-double v3, v3, v5

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-lez v3, :cond_3

    iget v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_2

    goto :goto_1

    :cond_2
    move v2, v5

    goto :goto_2

    :cond_3
    :goto_1
    move v2, v4

    :goto_2
    if-eqz v2, :cond_4

    goto :goto_3

    .line 9
    :cond_4
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale()F

    move-result v0

    :goto_3
    move v8, v0

    .line 10
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoomStyle:I

    const/4 v3, 0x3

    const/4 v6, 0x0

    if-ne v0, v3, :cond_5

    .line 11
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 12
    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    iput-object p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pendingScale:Ljava/lang/Float;

    .line 13
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sPendingCenter:Landroid/graphics/PointF;

    .line 14
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    goto :goto_5

    :cond_5
    const/4 v3, 0x4

    if-eq v0, v1, :cond_7

    if-eqz v2, :cond_7

    .line 16
    iget-boolean v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panEnabled:Z

    if-nez v1, :cond_6

    goto :goto_4

    :cond_6
    if-ne v0, v4, :cond_8

    .line 17
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;

    const/4 v11, 0x0

    move-object v6, v0

    move-object v7, p0

    move-object v9, p1

    move-object v10, p2

    invoke-direct/range {v6 .. v11}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;FLandroid/graphics/PointF;Landroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    .line 18
    iput-boolean v5, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->interruptible:Z

    .line 19
    iget p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoomDuration:I

    int-to-long p1, p1

    .line 20
    iput-wide p1, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->duration:J

    .line 21
    iput v3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->origin:I

    .line 22
    invoke-virtual {v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->start()V

    goto :goto_5

    .line 23
    :cond_7
    :goto_4
    new-instance p2, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;

    invoke-direct {p2, p0, v8, p1, v6}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;FLandroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    .line 24
    iput-boolean v5, p2, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->interruptible:Z

    .line 25
    iget p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoomDuration:I

    int-to-long v0, p1

    .line 26
    iput-wide v0, p2, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->duration:J

    .line 27
    iput v3, p2, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->origin:I

    .line 28
    invoke-virtual {p2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->start()V

    .line 29
    :cond_8
    :goto_5
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final ease(IJFFJ)F
    .locals 1

    const/4 p0, 0x1

    const/high16 v0, 0x40000000    # 2.0f

    if-eq p1, p0, :cond_2

    const/4 p0, 0x2

    if-ne p1, p0, :cond_1

    long-to-float p0, p2

    long-to-float p1, p6

    div-float/2addr p1, v0

    div-float/2addr p0, p1

    const/high16 p1, 0x3f800000    # 1.0f

    cmpg-float p2, p0, p1

    if-gez p2, :cond_0

    div-float/2addr p5, v0

    mul-float/2addr p5, p0

    mul-float/2addr p5, p0

    add-float/2addr p5, p4

    goto :goto_0

    :cond_0
    sub-float/2addr p0, p1

    neg-float p2, p5

    div-float/2addr p2, v0

    sub-float p3, p0, v0

    mul-float/2addr p3, p0

    sub-float/2addr p3, p1

    mul-float/2addr p3, p2

    add-float p5, p3, p4

    :goto_0
    return p5

    .line 1
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p2, "Unexpected easing type: "

    invoke-static {p2, p1}, Landroid/support/media/ExifInterface$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    long-to-float p0, p2

    long-to-float p1, p6

    div-float/2addr p0, p1

    neg-float p1, p5

    mul-float/2addr p1, p0

    invoke-static {p0, v0, p1, p4}, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph$$ExternalSyntheticOutline0;->m(FFFF)F

    move-result p0

    return p0
.end method

.method public final fileSRect(Landroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v0

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p2, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    goto :goto_0

    .line 3
    :cond_0
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v0

    const/16 v1, 0x5a

    if-ne v0, v1, :cond_1

    .line 4
    iget v0, p1, Landroid/graphics/Rect;->top:I

    iget p0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    iget v1, p1, Landroid/graphics/Rect;->right:I

    sub-int v1, p0, v1

    iget v2, p1, Landroid/graphics/Rect;->bottom:I

    iget p1, p1, Landroid/graphics/Rect;->left:I

    sub-int/2addr p0, p1

    invoke-virtual {p2, v0, v1, v2, p0}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    .line 5
    :cond_1
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v0

    const/16 v1, 0xb4

    if-ne v0, v1, :cond_2

    .line 6
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    iget v1, p1, Landroid/graphics/Rect;->right:I

    sub-int v1, v0, v1

    iget p0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    iget v2, p1, Landroid/graphics/Rect;->bottom:I

    sub-int v2, p0, v2

    iget v3, p1, Landroid/graphics/Rect;->left:I

    sub-int/2addr v0, v3

    iget p1, p1, Landroid/graphics/Rect;->top:I

    sub-int/2addr p0, p1

    invoke-virtual {p2, v1, v2, v0, p0}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    .line 7
    :cond_2
    iget p0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    sub-int v0, p0, v0

    iget v1, p1, Landroid/graphics/Rect;->left:I

    iget v2, p1, Landroid/graphics/Rect;->top:I

    sub-int/2addr p0, v2

    iget p1, p1, Landroid/graphics/Rect;->right:I

    invoke-virtual {p2, v0, v1, p0, p1}, Landroid/graphics/Rect;->set(IIII)V

    :goto_0
    return-void
.end method

.method public final fitToBounds(Z)V
    .locals 5

    .line 30
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 31
    new-instance v2, Landroid/graphics/PointF;

    invoke-direct {v2, v1, v1}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 32
    :goto_0
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    if-nez v2, :cond_1

    .line 33
    new-instance v2, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    new-instance v3, Landroid/graphics/PointF;

    invoke-direct {v3, v1, v1}, Landroid/graphics/PointF;-><init>(FF)V

    const/4 v4, 0x0

    invoke-direct {v2, v1, v3, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;-><init>(FLandroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    iput-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    .line 34
    :cond_1
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 35
    iput v2, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->scale:F

    .line 36
    iget-object v1, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->vTranslate:Landroid/graphics/PointF;

    .line 37
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    invoke-virtual {v1, v2}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 38
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    invoke-virtual {p0, p1, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(ZLcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)V

    .line 39
    iget-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    .line 40
    iget v1, p1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->scale:F

    .line 41
    iput v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 42
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    .line 43
    iget-object p1, p1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->vTranslate:Landroid/graphics/PointF;

    .line 44
    invoke-virtual {v1, p1}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    if-eqz v0, :cond_2

    .line 45
    iget p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minimumScaleType:I

    const/4 v0, 0x4

    if-eq p1, v0, :cond_2

    .line 46
    iget-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    invoke-virtual {p0, v0, v1, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateForSCenter(FFF)Landroid/graphics/PointF;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    :cond_2
    return-void
.end method

.method public final fitToBounds(ZLcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)V
    .locals 11

    .line 1
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panLimit:I

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    .line 2
    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z

    if-eqz v0, :cond_0

    move p1, v1

    .line 3
    :cond_0
    iget-object v0, p2, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->vTranslate:Landroid/graphics/PointF;

    .line 4
    iget v3, p2, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->scale:F

    .line 5
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale()F

    move-result v4

    invoke-static {v4, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 6
    iget v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxScale:F

    invoke-static {v4, v3}, Ljava/lang/Math;->min(FF)F

    move-result v3

    .line 7
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v3

    .line 8
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v3

    .line 9
    iget v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panLimit:I

    const/4 v7, 0x3

    if-ne v6, v7, :cond_1

    .line 10
    iget-boolean v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z

    if-eqz v6, :cond_1

    .line 11
    iget v6, v0, Landroid/graphics/PointF;->x:F

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v8

    div-int/2addr v8, v2

    int-to-float v8, v8

    sub-float/2addr v8, v4

    invoke-static {v6, v8}, Ljava/lang/Math;->max(FF)F

    move-result v6

    iput v6, v0, Landroid/graphics/PointF;->x:F

    .line 12
    iget v6, v0, Landroid/graphics/PointF;->y:F

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v8

    div-int/2addr v8, v2

    int-to-float v8, v8

    sub-float/2addr v8, v5

    invoke-static {v6, v8}, Ljava/lang/Math;->max(FF)F

    move-result v6

    iput v6, v0, Landroid/graphics/PointF;->y:F

    goto :goto_0

    :cond_1
    if-eqz p1, :cond_2

    .line 13
    iget v6, v0, Landroid/graphics/PointF;->x:F

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v8

    int-to-float v8, v8

    sub-float/2addr v8, v4

    invoke-static {v6, v8}, Ljava/lang/Math;->max(FF)F

    move-result v6

    iput v6, v0, Landroid/graphics/PointF;->x:F

    .line 14
    iget v6, v0, Landroid/graphics/PointF;->y:F

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v8

    int-to-float v8, v8

    sub-float/2addr v8, v5

    invoke-static {v6, v8}, Ljava/lang/Math;->max(FF)F

    move-result v6

    iput v6, v0, Landroid/graphics/PointF;->y:F

    goto :goto_0

    .line 15
    :cond_2
    iget v6, v0, Landroid/graphics/PointF;->x:F

    neg-float v8, v4

    invoke-static {v6, v8}, Ljava/lang/Math;->max(FF)F

    move-result v6

    iput v6, v0, Landroid/graphics/PointF;->x:F

    .line 16
    iget v6, v0, Landroid/graphics/PointF;->y:F

    neg-float v8, v5

    invoke-static {v6, v8}, Ljava/lang/Math;->max(FF)F

    move-result v6

    iput v6, v0, Landroid/graphics/PointF;->y:F

    .line 17
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v6

    const/high16 v8, 0x3f000000    # 0.5f

    if-gtz v6, :cond_4

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v6

    if-lez v6, :cond_3

    goto :goto_1

    :cond_3
    move v6, v8

    goto :goto_2

    :cond_4
    :goto_1
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v9

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v10

    add-int/2addr v10, v9

    int-to-float v9, v10

    div-float/2addr v6, v9

    .line 18
    :goto_2
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v9

    if-gtz v9, :cond_5

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v9

    if-lez v9, :cond_6

    :cond_5
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v9

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v10

    add-int/2addr v10, v9

    int-to-float v9, v10

    div-float/2addr v8, v9

    .line 19
    :cond_6
    iget v9, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panLimit:I

    if-ne v9, v7, :cond_7

    .line 20
    iget-boolean v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z

    if-eqz v7, :cond_7

    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p1

    div-int/2addr p1, v2

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    int-to-float p1, p1

    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    div-int/2addr p0, v2

    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    goto :goto_3

    :cond_7
    if-eqz p1, :cond_8

    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p1

    int-to-float p1, p1

    sub-float/2addr p1, v4

    mul-float/2addr p1, v6

    const/4 v1, 0x0

    invoke-static {v1, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    int-to-float p0, p0

    sub-float/2addr p0, v5

    mul-float/2addr p0, v8

    invoke-static {v1, p0}, Ljava/lang/Math;->max(FF)F

    move-result p0

    goto :goto_4

    .line 25
    :cond_8
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p1

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    int-to-float p1, p1

    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    :goto_3
    int-to-float p0, p0

    .line 27
    :goto_4
    iget v1, v0, Landroid/graphics/PointF;->x:F

    invoke-static {v1, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    iput p1, v0, Landroid/graphics/PointF;->x:F

    .line 28
    iget p1, v0, Landroid/graphics/PointF;->y:F

    invoke-static {p1, p0}, Ljava/lang/Math;->min(FF)F

    move-result p0

    iput p0, v0, Landroid/graphics/PointF;->y:F

    .line 29
    iput v3, p2, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->scale:F

    return-void
.end method

.method public final getCenter()Landroid/graphics/PointF;
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v0, v0

    int-to-float v1, v1

    .line 3
    new-instance v2, Landroid/graphics/PointF;

    invoke-direct {v2}, Landroid/graphics/PointF;-><init>()V

    .line 4
    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-nez v3, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    .line 5
    :cond_0
    invoke-virtual {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceX(F)F

    move-result v0

    invoke-virtual {p0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceY(F)F

    move-result p0

    invoke-virtual {v2, v0, p0}, Landroid/graphics/PointF;->set(FF)V

    :goto_0
    return-object v2
.end method

.method public final getRequiredRotation()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->orientation:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 2
    iget p0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sOrientation:I

    return p0

    :cond_0
    return v0
.end method

.method public final declared-synchronized initialiseBaseLayer(Landroid/graphics/Point;)V
    .locals 10

    monitor-enter p0

    .line 1
    :try_start_0
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    new-instance v1, Landroid/graphics/PointF;

    const/4 v2, 0x0

    invoke-direct {v1, v2, v2}, Landroid/graphics/PointF;-><init>(FF)V

    const/4 v3, 0x0

    invoke-direct {v0, v2, v1, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;-><init>(FLandroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    const/4 v1, 0x1

    .line 2
    invoke-virtual {p0, v1, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(ZLcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)V

    .line 3
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    .line 4
    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->scale:F

    .line 5
    invoke-virtual {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->calculateInSampleSize(F)I

    move-result v0

    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    if-le v0, v1, :cond_0

    .line 6
    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    .line 7
    :cond_0
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v0

    iget v4, p1, Landroid/graphics/Point;->x:I

    if-ge v0, v4, :cond_1

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v0

    iget v4, p1, Landroid/graphics/Point;->y:I

    if-ge v0, v4, :cond_1

    .line 8
    iget-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    invoke-interface {p1}, Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;->recycle()V

    .line 9
    iput-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    .line 10
    new-instance p1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$BitmapLoadTask;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    iget-object v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;

    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->uri:Landroid/net/Uri;

    const/4 v9, 0x0

    move-object v4, p1

    move-object v5, p0

    invoke-direct/range {v4 .. v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$BitmapLoadTask;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/content/Context;Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;Landroid/net/Uri;Z)V

    .line 11
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->executor:Ljava/util/concurrent/Executor;

    new-array v1, v2, [Ljava/lang/Void;

    invoke-virtual {p1, v0, v1}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_1

    .line 12
    :cond_1
    invoke-virtual {p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->initialiseTileMap(Landroid/graphics/Point;)V

    .line 13
    iget-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    .line 14
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    .line 15
    new-instance v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;

    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    invoke-direct {v3, p0, v4, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)V

    .line 16
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->executor:Ljava/util/concurrent/Executor;

    new-array v4, v2, [Ljava/lang/Void;

    invoke-virtual {v3, v0, v4}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 17
    :cond_2
    invoke-virtual {p0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->refreshRequiredTiles(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    :goto_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final initialiseTileMap(Landroid/graphics/Point;)V
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 1
    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    .line 2
    iget v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    const/4 v3, 0x1

    move v4, v3

    move v5, v4

    .line 3
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v6

    div-int/2addr v6, v4

    .line 4
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v7

    div-int/2addr v7, v5

    .line 5
    div-int v8, v6, v2

    .line 6
    div-int v9, v7, v2

    :goto_1
    add-int v10, v8, v4

    add-int/2addr v10, v3

    .line 7
    iget v11, v1, Landroid/graphics/Point;->x:I

    if-gt v10, v11, :cond_9

    int-to-double v10, v8

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getWidth()I

    move-result v8

    int-to-double v12, v8

    const-wide/high16 v14, 0x3ff4000000000000L    # 1.25

    mul-double/2addr v12, v14

    cmpl-double v8, v10, v12

    if-lez v8, :cond_0

    iget v8, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    if-ge v2, v8, :cond_0

    goto/16 :goto_9

    :cond_0
    :goto_2
    add-int v8, v9, v5

    add-int/2addr v8, v3

    .line 8
    iget v10, v1, Landroid/graphics/Point;->y:I

    if-gt v8, v10, :cond_8

    int-to-double v8, v9

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getHeight()I

    move-result v10

    int-to-double v10, v10

    mul-double/2addr v10, v14

    cmpl-double v8, v8, v10

    if-lez v8, :cond_1

    iget v8, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    if-ge v2, v8, :cond_1

    goto/16 :goto_8

    .line 9
    :cond_1
    new-instance v8, Ljava/util/ArrayList;

    mul-int v9, v4, v5

    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v10, 0x0

    :goto_3
    if-ge v10, v4, :cond_6

    const/4 v11, 0x0

    :goto_4
    if-ge v11, v5, :cond_5

    .line 10
    new-instance v12, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    const/4 v13, 0x0

    invoke-direct {v12, v13}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    .line 11
    iput v2, v12, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sampleSize:I

    .line 12
    iget v13, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    if-ne v2, v13, :cond_2

    move v13, v3

    goto :goto_5

    :cond_2
    const/4 v13, 0x0

    .line 13
    :goto_5
    iput-boolean v13, v12, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->visible:Z

    .line 14
    new-instance v13, Landroid/graphics/Rect;

    mul-int v14, v10, v6

    mul-int v15, v11, v7

    add-int/lit8 v3, v4, -0x1

    if-ne v10, v3, :cond_3

    .line 15
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v3

    goto :goto_6

    :cond_3
    add-int/lit8 v3, v10, 0x1

    mul-int/2addr v3, v6

    :goto_6
    add-int/lit8 v9, v5, -0x1

    if-ne v11, v9, :cond_4

    .line 16
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v9

    goto :goto_7

    :cond_4
    add-int/lit8 v9, v11, 0x1

    mul-int/2addr v9, v7

    :goto_7
    invoke-direct {v13, v14, v15, v3, v9}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 17
    iput-object v13, v12, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;

    .line 18
    new-instance v3, Landroid/graphics/Rect;

    const/4 v9, 0x0

    invoke-direct {v3, v9, v9, v9, v9}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 19
    iput-object v3, v12, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;

    .line 20
    new-instance v3, Landroid/graphics/Rect;

    .line 21
    iget-object v13, v12, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;

    .line 22
    invoke-direct {v3, v13}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 23
    iput-object v3, v12, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->fileSRect:Landroid/graphics/Rect;

    .line 24
    invoke-virtual {v8, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v11, v11, 0x1

    const/4 v3, 0x1

    goto :goto_4

    :cond_5
    const/4 v9, 0x0

    add-int/lit8 v10, v10, 0x1

    const/4 v3, 0x1

    goto :goto_3

    .line 25
    :cond_6
    iget-object v3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v3, v6, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v3, 0x1

    if-ne v2, v3, :cond_7

    return-void

    .line 26
    :cond_7
    div-int/lit8 v2, v2, 0x2

    goto/16 :goto_0

    :cond_8
    :goto_8
    add-int/lit8 v5, v5, 0x1

    .line 27
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v7

    div-int/2addr v7, v5

    .line 28
    div-int v9, v7, v2

    goto/16 :goto_2

    :cond_9
    :goto_9
    add-int/lit8 v4, v4, 0x1

    .line 29
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v6

    div-int/2addr v6, v4

    .line 30
    div-int v8, v6, v2

    goto/16 :goto_1
.end method

.method public final isBaseLayerReady()Z
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsPreview:Z

    if-nez v0, :cond_0

    return v1

    .line 2
    :cond_0
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    const/4 v2, 0x0

    if-eqz v0, :cond_5

    .line 3
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 4
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iget v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    if-ne v4, v5, :cond_1

    .line 5
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    .line 6
    iget-boolean v5, v4, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->loading:Z

    if-nez v5, :cond_3

    .line 7
    iget-object v4, v4, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;

    if-nez v4, :cond_2

    :cond_3
    move v1, v2

    goto :goto_0

    :cond_4
    return v1

    :cond_5
    return v2
.end method

.method public final minScale()F
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    add-int/2addr v1, v0

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    add-int/2addr v2, v0

    .line 3
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minimumScaleType:I

    const/4 v3, 0x2

    if-eq v0, v3, :cond_2

    const/4 v3, 0x4

    if-ne v0, v3, :cond_0

    goto :goto_0

    :cond_0
    const/4 v3, 0x3

    if-ne v0, v3, :cond_1

    .line 4
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale:F

    const/4 v3, 0x0

    cmpl-float v3, v0, v3

    if-lez v3, :cond_1

    return v0

    .line 5
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    sub-int/2addr v0, v2

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v0, v2

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v2

    sub-int/2addr v2, v1

    int-to-float v1, v2

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result p0

    int-to-float p0, p0

    div-float/2addr v1, p0

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result p0

    return p0

    .line 6
    :cond_2
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    sub-int/2addr v0, v2

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v0, v2

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v2

    sub-int/2addr v2, v1

    int-to-float v1, v2

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result p0

    int-to-float p0, p0

    div-float/2addr v1, p0

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result p0

    return p0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 28

    move-object/from16 v11, p0

    move-object/from16 v12, p1

    .line 1
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    iget-object v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapPaint:Landroid/graphics/Paint;

    const/4 v9, 0x1

    if-nez v0, :cond_0

    .line 3
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapPaint:Landroid/graphics/Paint;

    .line 4
    invoke-virtual {v0, v9}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 5
    iget-object v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v9}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 6
    iget-object v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v9}, Landroid/graphics/Paint;->setDither(Z)V

    .line 7
    :cond_0
    iget v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    if-eqz v0, :cond_22

    iget v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    if-eqz v0, :cond_22

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getWidth()I

    move-result v0

    if-eqz v0, :cond_22

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getHeight()I

    move-result v0

    if-nez v0, :cond_1

    goto/16 :goto_f

    .line 8
    :cond_1
    iget-object v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    if-nez v0, :cond_2

    iget-object v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    if-eqz v0, :cond_2

    .line 9
    new-instance v0, Landroid/graphics/Point;

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getMaximumBitmapWidth()I

    move-result v1

    iget v2, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTileWidth:I

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getMaximumBitmapHeight()I

    move-result v2

    iget v3, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTileHeight:I

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/graphics/Point;-><init>(II)V

    .line 10
    invoke-virtual {v11, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->initialiseBaseLayer(Landroid/graphics/Point;)V

    .line 11
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->checkReady()Z

    move-result v0

    if-nez v0, :cond_3

    return-void

    .line 12
    :cond_3
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->preDraw()V

    .line 13
    iget-object v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    const/4 v10, 0x0

    const/4 v13, 0x0

    if-eqz v0, :cond_a

    .line 14
    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusStart:Landroid/graphics/PointF;

    if-eqz v0, :cond_a

    .line 15
    iget v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 16
    iget-object v1, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateBefore:Landroid/graphics/PointF;

    if-nez v1, :cond_4

    new-instance v1, Landroid/graphics/PointF;

    invoke-direct {v1, v13, v13}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v1, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateBefore:Landroid/graphics/PointF;

    .line 17
    :cond_4
    iget-object v1, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateBefore:Landroid/graphics/PointF;

    iget-object v2, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    invoke-virtual {v1, v2}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 18
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-object v3, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 19
    iget-wide v4, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->time:J

    sub-long/2addr v1, v4

    .line 20
    iget-wide v3, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->duration:J

    cmp-long v5, v1, v3

    if-lez v5, :cond_5

    move v14, v9

    goto :goto_0

    :cond_5
    move v14, v10

    .line 21
    :goto_0
    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v15

    .line 22
    iget-object v1, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 23
    iget v2, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->easing:I

    .line 24
    iget v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->scaleStart:F

    .line 25
    iget v3, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->scaleEnd:F

    sub-float v6, v3, v5

    .line 26
    iget-wide v7, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->duration:J

    move-object/from16 v1, p0

    move-wide v3, v15

    .line 27
    invoke-virtual/range {v1 .. v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->ease(IJFFJ)F

    move-result v1

    iput v1, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 28
    iget-object v1, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 29
    iget v2, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->easing:I

    .line 30
    iget-object v3, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusStart:Landroid/graphics/PointF;

    .line 31
    iget v5, v3, Landroid/graphics/PointF;->x:F

    .line 32
    iget-object v3, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusEnd:Landroid/graphics/PointF;

    .line 33
    iget v3, v3, Landroid/graphics/PointF;->x:F

    sub-float v6, v3, v5

    .line 34
    iget-wide v7, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->duration:J

    move-object/from16 v1, p0

    move-wide v3, v15

    .line 35
    invoke-virtual/range {v1 .. v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->ease(IJFFJ)F

    move-result v17

    .line 36
    iget-object v1, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 37
    iget v2, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->easing:I

    .line 38
    iget-object v3, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusStart:Landroid/graphics/PointF;

    .line 39
    iget v5, v3, Landroid/graphics/PointF;->y:F

    .line 40
    iget-object v3, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusEnd:Landroid/graphics/PointF;

    .line 41
    iget v3, v3, Landroid/graphics/PointF;->y:F

    sub-float v6, v3, v5

    .line 42
    iget-wide v7, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->duration:J

    move-object/from16 v1, p0

    move-wide v3, v15

    .line 43
    invoke-virtual/range {v1 .. v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->ease(IJFFJ)F

    move-result v1

    .line 44
    iget-object v2, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget v3, v2, Landroid/graphics/PointF;->x:F

    iget-object v4, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 45
    iget-object v4, v4, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterEnd:Landroid/graphics/PointF;

    .line 46
    iget v4, v4, Landroid/graphics/PointF;->x:F

    invoke-virtual {v11, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewX(F)F

    move-result v4

    sub-float v4, v4, v17

    sub-float/2addr v3, v4

    iput v3, v2, Landroid/graphics/PointF;->x:F

    .line 47
    iget-object v2, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget v3, v2, Landroid/graphics/PointF;->y:F

    iget-object v4, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 48
    iget-object v4, v4, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterEnd:Landroid/graphics/PointF;

    .line 49
    iget v4, v4, Landroid/graphics/PointF;->y:F

    invoke-virtual {v11, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewY(F)F

    move-result v4

    sub-float/2addr v4, v1

    sub-float/2addr v3, v4

    iput v3, v2, Landroid/graphics/PointF;->y:F

    if-nez v14, :cond_7

    .line 50
    iget-object v1, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 51
    iget v2, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->scaleStart:F

    .line 52
    iget v1, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->scaleEnd:F

    cmpl-float v1, v2, v1

    if-nez v1, :cond_6

    goto :goto_1

    :cond_6
    move v1, v10

    goto :goto_2

    :cond_7
    :goto_1
    move v1, v9

    .line 53
    :goto_2
    invoke-virtual {v11, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(Z)V

    .line 54
    iget-object v1, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateBefore:Landroid/graphics/PointF;

    iget-object v2, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 55
    iget v2, v2, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->origin:I

    .line 56
    invoke-virtual {v11, v0, v1, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sendStateChanged(FLandroid/graphics/PointF;I)V

    .line 57
    invoke-virtual {v11, v14}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->refreshRequiredTiles(Z)V

    if-eqz v14, :cond_9

    .line 58
    iget-object v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 59
    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->listener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;

    if-eqz v0, :cond_8

    .line 60
    :try_start_0
    invoke-interface {v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;->onComplete()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception v0

    move-object v1, v0

    const-string v0, "SubsamplingScaleImageView"

    const-string v2, "Error thrown by animation listener"

    .line 61
    invoke-static {v0, v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_8
    :goto_3
    const/4 v0, 0x0

    .line 62
    iput-object v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 63
    :cond_9
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->invalidate()V

    .line 64
    :cond_a
    iget-object v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    const/16 v14, 0x5a

    const/16 v15, 0xb4

    const/16 v8, 0x10e

    if-eqz v0, :cond_18

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isBaseLayerReady()Z

    move-result v0

    if-eqz v0, :cond_18

    .line 65
    iget v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    iget v1, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    invoke-virtual {v11, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->calculateInSampleSize(F)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 66
    iget-object v1, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    move v13, v10

    :cond_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 67
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v3, v0, :cond_b

    .line 68
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_c
    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    .line 69
    iget-boolean v4, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->visible:Z

    if-eqz v4, :cond_c

    .line 70
    iget-boolean v4, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->loading:Z

    if-nez v4, :cond_d

    .line 71
    iget-object v3, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;

    if-nez v3, :cond_c

    :cond_d
    move v13, v9

    goto :goto_4

    .line 72
    :cond_e
    iget-object v1, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_5
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_22

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 73
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-eq v2, v0, :cond_10

    if-eqz v13, :cond_f

    goto :goto_6

    :cond_f
    move/from16 v20, v13

    goto/16 :goto_a

    .line 74
    :cond_10
    :goto_6
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_7
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_f

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v10, v1

    check-cast v10, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    .line 75
    iget-object v1, v10, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;

    .line 76
    iget-object v2, v10, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;

    .line 77
    iget v3, v1, Landroid/graphics/Rect;->left:I

    int-to-float v3, v3

    .line 78
    invoke-virtual {v11, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewX(F)F

    move-result v3

    float-to-int v3, v3

    iget v4, v1, Landroid/graphics/Rect;->top:I

    int-to-float v4, v4

    .line 79
    invoke-virtual {v11, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewY(F)F

    move-result v4

    float-to-int v4, v4

    iget v5, v1, Landroid/graphics/Rect;->right:I

    int-to-float v5, v5

    .line 80
    invoke-virtual {v11, v5}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewX(F)F

    move-result v5

    float-to-int v5, v5

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    int-to-float v1, v1

    .line 81
    invoke-virtual {v11, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewY(F)F

    move-result v1

    float-to-int v1, v1

    .line 82
    invoke-virtual {v2, v3, v4, v5, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 83
    iget-boolean v1, v10, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->loading:Z

    if-nez v1, :cond_17

    .line 84
    iget-object v1, v10, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_17

    .line 85
    iget-object v1, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileBgPaint:Landroid/graphics/Paint;

    if-eqz v1, :cond_11

    .line 86
    iget-object v2, v10, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;

    .line 87
    invoke-virtual {v12, v2, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 88
    :cond_11
    iget-object v1, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    if-nez v1, :cond_12

    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    .line 89
    :cond_12
    iget-object v1, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    invoke-virtual {v1}, Landroid/graphics/Matrix;->reset()V

    .line 90
    iget-object v2, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->srcArray:[F

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 91
    iget-object v1, v10, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;

    .line 92
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    int-to-float v5, v1

    const/4 v6, 0x0

    .line 93
    iget-object v1, v10, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;

    .line 94
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    int-to-float v7, v1

    .line 95
    iget-object v1, v10, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;

    .line 96
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    int-to-float v9, v1

    const/16 v18, 0x0

    .line 97
    iget-object v1, v10, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;

    .line 98
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    int-to-float v1, v1

    move/from16 v19, v1

    move-object/from16 v1, p0

    move/from16 v20, v13

    move v13, v8

    move v8, v9

    move/from16 v9, v18

    move-object v13, v10

    move/from16 v10, v19

    invoke-virtual/range {v1 .. v10}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setMatrixArray([FFFFFFFFF)V

    .line 99
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v1

    if-nez v1, :cond_13

    .line 100
    iget-object v2, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->dstArray:[F

    .line 101
    iget-object v1, v13, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;

    .line 102
    iget v3, v1, Landroid/graphics/Rect;->left:I

    int-to-float v9, v3

    iget v3, v1, Landroid/graphics/Rect;->top:I

    int-to-float v6, v3

    iget v3, v1, Landroid/graphics/Rect;->right:I

    int-to-float v7, v3

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    int-to-float v10, v1

    move-object/from16 v1, p0

    move v3, v9

    move v4, v6

    move v5, v7

    move v8, v10

    invoke-virtual/range {v1 .. v10}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setMatrixArray([FFFFFFFFF)V

    goto/16 :goto_8

    .line 103
    :cond_13
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v1

    if-ne v1, v14, :cond_14

    .line 104
    iget-object v2, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->dstArray:[F

    .line 105
    iget-object v1, v13, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;

    .line 106
    iget v3, v1, Landroid/graphics/Rect;->right:I

    int-to-float v5, v3

    iget v3, v1, Landroid/graphics/Rect;->top:I

    int-to-float v10, v3

    iget v3, v1, Landroid/graphics/Rect;->bottom:I

    int-to-float v8, v3

    iget v1, v1, Landroid/graphics/Rect;->left:I

    int-to-float v9, v1

    move-object/from16 v1, p0

    move v3, v5

    move v4, v10

    move v6, v8

    move v7, v9

    invoke-virtual/range {v1 .. v10}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setMatrixArray([FFFFFFFFF)V

    goto :goto_8

    .line 107
    :cond_14
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v1

    if-ne v1, v15, :cond_15

    .line 108
    iget-object v2, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->dstArray:[F

    .line 109
    iget-object v1, v13, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;

    .line 110
    iget v3, v1, Landroid/graphics/Rect;->right:I

    int-to-float v9, v3

    iget v3, v1, Landroid/graphics/Rect;->bottom:I

    int-to-float v6, v3

    iget v3, v1, Landroid/graphics/Rect;->left:I

    int-to-float v7, v3

    iget v1, v1, Landroid/graphics/Rect;->top:I

    int-to-float v10, v1

    move-object/from16 v1, p0

    move v3, v9

    move v4, v6

    move v5, v7

    move v8, v10

    invoke-virtual/range {v1 .. v10}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setMatrixArray([FFFFFFFFF)V

    goto :goto_8

    .line 111
    :cond_15
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v1

    const/16 v2, 0x10e

    if-ne v1, v2, :cond_16

    .line 112
    iget-object v2, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->dstArray:[F

    .line 113
    iget-object v1, v13, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;

    .line 114
    iget v3, v1, Landroid/graphics/Rect;->left:I

    int-to-float v5, v3

    iget v3, v1, Landroid/graphics/Rect;->bottom:I

    int-to-float v10, v3

    iget v3, v1, Landroid/graphics/Rect;->top:I

    int-to-float v8, v3

    iget v1, v1, Landroid/graphics/Rect;->right:I

    int-to-float v9, v1

    move-object/from16 v1, p0

    move v3, v5

    move v4, v10

    move v6, v8

    move v7, v9

    invoke-virtual/range {v1 .. v10}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setMatrixArray([FFFFFFFFF)V

    .line 115
    :cond_16
    :goto_8
    iget-object v1, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    iget-object v2, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->srcArray:[F

    const/16 v23, 0x0

    iget-object v3, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->dstArray:[F

    const/16 v25, 0x0

    const/16 v26, 0x4

    move-object/from16 v21, v1

    move-object/from16 v22, v2

    move-object/from16 v24, v3

    invoke-virtual/range {v21 .. v26}, Landroid/graphics/Matrix;->setPolyToPoly([FI[FII)Z

    .line 116
    iget-object v1, v13, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;

    .line 117
    iget-object v2, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    iget-object v3, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v12, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    goto :goto_9

    :cond_17
    move/from16 v20, v13

    :goto_9
    move/from16 v13, v20

    const/16 v8, 0x10e

    goto/16 :goto_7

    :goto_a
    move/from16 v13, v20

    const/16 v8, 0x10e

    goto/16 :goto_5

    :cond_18
    move v1, v13

    .line 118
    iget-object v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_22

    .line 119
    iget v2, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 120
    iget-boolean v3, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsPreview:Z

    if-eqz v3, :cond_19

    .line 121
    iget v3, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    int-to-float v3, v3

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v3, v0

    mul-float/2addr v2, v3

    .line 122
    iget v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    iget v3, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    int-to-float v3, v3

    iget-object v4, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    mul-float/2addr v0, v3

    move/from16 v27, v2

    move v2, v0

    move/from16 v0, v27

    goto :goto_b

    :cond_19
    move v0, v2

    .line 123
    :goto_b
    iget-object v3, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    if-nez v3, :cond_1a

    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    iput-object v3, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    .line 124
    :cond_1a
    iget-object v3, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    invoke-virtual {v3}, Landroid/graphics/Matrix;->reset()V

    .line 125
    iget-object v3, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    invoke-virtual {v3, v0, v2}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 126
    iget-object v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0, v2}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 127
    iget-object v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    iget-object v2, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget v3, v2, Landroid/graphics/PointF;->x:F

    iget v2, v2, Landroid/graphics/PointF;->y:F

    invoke-virtual {v0, v3, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 128
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v0

    if-ne v0, v15, :cond_1b

    .line 129
    iget-object v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    iget v2, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    iget v3, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    int-to-float v3, v3

    mul-float/2addr v3, v2

    iget v4, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    int-to-float v4, v4

    mul-float/2addr v2, v4

    invoke-virtual {v0, v3, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_c

    .line 130
    :cond_1b
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v0

    if-ne v0, v14, :cond_1c

    .line 131
    iget-object v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    iget v2, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    iget v3, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    int-to-float v3, v3

    mul-float/2addr v2, v3

    invoke-virtual {v0, v2, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_c

    .line 132
    :cond_1c
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v0

    const/16 v2, 0x10e

    if-ne v0, v2, :cond_1d

    .line 133
    iget-object v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    iget v2, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    iget v3, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    int-to-float v3, v3

    mul-float/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 134
    :cond_1d
    :goto_c
    iget-object v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileBgPaint:Landroid/graphics/Paint;

    if-eqz v0, :cond_21

    .line 135
    iget-object v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRect:Landroid/graphics/RectF;

    if-nez v0, :cond_1e

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRect:Landroid/graphics/RectF;

    .line 136
    :cond_1e
    iget-object v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRect:Landroid/graphics/RectF;

    iget-boolean v2, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsPreview:Z

    if-eqz v2, :cond_1f

    iget-object v2, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    goto :goto_d

    :cond_1f
    iget v2, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    :goto_d
    int-to-float v2, v2

    iget-boolean v3, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsPreview:Z

    if-eqz v3, :cond_20

    iget-object v3, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    goto :goto_e

    :cond_20
    iget v3, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    :goto_e
    int-to-float v3, v3

    invoke-virtual {v0, v1, v1, v2, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 137
    iget-object v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    iget-object v1, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 138
    iget-object v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRect:Landroid/graphics/RectF;

    iget-object v1, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileBgPaint:Landroid/graphics/Paint;

    invoke-virtual {v12, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 139
    :cond_21
    iget-object v0, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    iget-object v1, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    iget-object v2, v11, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v12, v0, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    :cond_22
    :goto_f
    return-void
.end method

.method public final declared-synchronized onImageLoaded(Landroid/graphics/Bitmap;IZ)V
    .locals 3

    monitor-enter p0

    .line 1
    :try_start_0
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    const/4 v1, 0x0

    if-lez v0, :cond_1

    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    if-lez v2, :cond_1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    if-ne v0, v2, :cond_0

    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    if-eq v0, v2, :cond_1

    .line 2
    :cond_0
    invoke-virtual {p0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->reset(Z)V

    .line 3
    :cond_1
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_2

    iget-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsCached:Z

    if-nez v2, :cond_2

    .line 4
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 5
    :cond_2
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsCached:Z

    .line 6
    :cond_3
    iput-boolean v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsPreview:Z

    .line 7
    iput-boolean p3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsCached:Z

    .line 8
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    .line 9
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p3

    iput p3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    .line 10
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    .line 11
    iput p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sOrientation:I

    .line 12
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->checkReady()Z

    move-result p1

    .line 13
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->checkImageLoaded()Z

    move-result p2

    if-nez p1, :cond_4

    if-eqz p2, :cond_5

    .line 14
    :cond_4
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    :cond_5
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public onMeasure(II)V
    .locals 5

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 2
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 3
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    .line 4
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/high16 v4, 0x40000000    # 2.0f

    if-eq v0, v4, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v3

    :goto_0
    if-eq v1, v4, :cond_1

    goto :goto_1

    :cond_1
    move v2, v3

    .line 5
    :goto_1
    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    if-lez v1, :cond_4

    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    if-lez v1, :cond_4

    if-eqz v0, :cond_2

    if-eqz v2, :cond_2

    .line 6
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result p1

    .line 7
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result p2

    goto :goto_2

    :cond_2
    if-eqz v2, :cond_3

    .line 8
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result p2

    int-to-double v0, p2

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result p2

    int-to-double v2, p2

    div-double/2addr v0, v2

    int-to-double v2, p1

    mul-double/2addr v0, v2

    double-to-int p2, v0

    goto :goto_2

    :cond_3
    if-eqz v0, :cond_4

    .line 9
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result p1

    int-to-double v0, p1

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result p1

    int-to-double v2, p1

    div-double/2addr v0, v2

    int-to-double v2, p2

    mul-double/2addr v0, v2

    double-to-int p1, v0

    .line 10
    :cond_4
    :goto_2
    invoke-virtual {p0}, Landroid/view/View;->getSuggestedMinimumWidth()I

    move-result v0

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getSuggestedMinimumHeight()I

    move-result v0

    invoke-static {p2, v0}, Ljava/lang/Math;->max(II)I

    move-result p2

    .line 12
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void
.end method

.method public final declared-synchronized onPreviewLoaded(Landroid/graphics/Bitmap;)V
    .locals 1

    monitor-enter p0

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->imageLoadedSent:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    const/4 p1, 0x1

    .line 3
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsPreview:Z

    .line 4
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->checkReady()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    :cond_1
    monitor-exit p0

    return-void

    .line 8
    :cond_2
    :goto_0
    :try_start_1
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getCenter()Landroid/graphics/PointF;

    move-result-object p1

    .line 2
    iget-boolean p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z

    if-eqz p2, :cond_0

    if-eqz p1, :cond_0

    const/4 p2, 0x0

    .line 3
    iput-object p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 4
    iget p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    iput-object p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pendingScale:Ljava/lang/Float;

    .line 5
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sPendingCenter:Landroid/graphics/PointF;

    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 16

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    .line 1
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    const/4 v3, 0x1

    if-eqz v0, :cond_0

    .line 2
    iget-boolean v4, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->interruptible:Z

    if-nez v4, :cond_0

    .line 3
    invoke-virtual {v1, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->requestDisallowInterceptTouchEvent(Z)V

    return v3

    :cond_0
    if-eqz v0, :cond_1

    .line 4
    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->listener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;

    if-eqz v0, :cond_1

    .line 5
    :try_start_0
    invoke-interface {v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;->onInterruptedByUser()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    move-object v4, v0

    const-string v0, "SubsamplingScaleImageView"

    const-string v5, "Error thrown by animation listener"

    .line 6
    invoke-static {v0, v5, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 7
    iput-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 8
    iget-object v4, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-nez v4, :cond_3

    .line 9
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->singleDetector:Landroid/view/GestureDetector;

    if-eqz v0, :cond_2

    .line 10
    invoke-virtual {v0, v2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    :cond_2
    return v3

    .line 11
    :cond_3
    iget-boolean v4, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isQuickScaling:Z

    const/4 v5, 0x0

    if-nez v4, :cond_5

    iget-object v4, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->detector:Landroid/view/GestureDetector;

    if-eqz v4, :cond_4

    invoke-virtual {v4, v2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 12
    :cond_4
    iput-boolean v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z

    .line 13
    iput-boolean v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    .line 14
    iput v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    return v3

    .line 15
    :cond_5
    iget-object v4, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    const/4 v6, 0x0

    if-nez v4, :cond_6

    new-instance v4, Landroid/graphics/PointF;

    invoke-direct {v4, v6, v6}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v4, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    .line 16
    :cond_6
    iget-object v4, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateBefore:Landroid/graphics/PointF;

    if-nez v4, :cond_7

    new-instance v4, Landroid/graphics/PointF;

    invoke-direct {v4, v6, v6}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v4, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateBefore:Landroid/graphics/PointF;

    .line 17
    :cond_7
    iget-object v4, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    if-nez v4, :cond_8

    new-instance v4, Landroid/graphics/PointF;

    invoke-direct {v4, v6, v6}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v4, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    .line 18
    :cond_8
    iget v4, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 19
    iget-object v7, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateBefore:Landroid/graphics/PointF;

    iget-object v8, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    invoke-virtual {v7, v8}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 20
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v7

    .line 21
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v8

    const/high16 v9, 0x40000000    # 2.0f

    const/4 v10, 0x2

    if-eqz v8, :cond_33

    if-eq v8, v3, :cond_2a

    if-eq v8, v10, :cond_9

    const/4 v6, 0x5

    if-eq v8, v6, :cond_33

    const/4 v6, 0x6

    if-eq v8, v6, :cond_2a

    const/16 v6, 0x105

    if-eq v8, v6, :cond_33

    const/16 v0, 0x106

    if-eq v8, v0, :cond_2a

    goto/16 :goto_10

    .line 22
    :cond_9
    iget v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    if-lez v0, :cond_28

    const/high16 v0, 0x40a00000    # 5.0f

    if-lt v7, v10, :cond_11

    .line 23
    invoke-virtual {v2, v5}, Landroid/view/MotionEvent;->getX(I)F

    move-result v6

    invoke-virtual {v2, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v7

    invoke-virtual {v2, v5}, Landroid/view/MotionEvent;->getY(I)F

    move-result v8

    invoke-virtual {v2, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result v11

    invoke-virtual {v1, v6, v7, v8, v11}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->distance(FFFF)F

    move-result v6

    .line 24
    invoke-virtual {v2, v5}, Landroid/view/MotionEvent;->getX(I)F

    move-result v7

    invoke-virtual {v2, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v8

    add-float/2addr v8, v7

    div-float/2addr v8, v9

    .line 25
    invoke-virtual {v2, v5}, Landroid/view/MotionEvent;->getY(I)F

    move-result v7

    invoke-virtual {v2, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result v11

    add-float/2addr v11, v7

    div-float/2addr v11, v9

    .line 26
    iget-boolean v7, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->zoomEnabled:Z

    if-eqz v7, :cond_28

    iget-object v7, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    iget v9, v7, Landroid/graphics/PointF;->x:F

    iget v7, v7, Landroid/graphics/PointF;->y:F

    invoke-virtual {v1, v9, v8, v7, v11}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->distance(FFFF)F

    move-result v7

    cmpl-float v7, v7, v0

    if-gtz v7, :cond_a

    iget v7, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vDistStart:F

    sub-float v7, v6, v7

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    cmpl-float v0, v7, v0

    if-gtz v0, :cond_a

    iget-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    if-eqz v0, :cond_28

    .line 27
    :cond_a
    iput-boolean v3, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z

    .line 28
    iput-boolean v3, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    .line 29
    iget v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    float-to-double v12, v0

    .line 30
    iget v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxScale:F

    iget v7, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vDistStart:F

    div-float v7, v6, v7

    iget v9, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scaleStart:F

    mul-float/2addr v7, v9

    invoke-static {v0, v7}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 31
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale()F

    move-result v7

    cmpg-float v0, v0, v7

    if-gtz v0, :cond_b

    .line 32
    iput v6, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vDistStart:F

    .line 33
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale()F

    move-result v0

    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scaleStart:F

    .line 34
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    invoke-virtual {v0, v8, v11}, Landroid/graphics/PointF;->set(FF)V

    .line 35
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    iget-object v6, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    invoke-virtual {v0, v6}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    goto/16 :goto_1

    .line 36
    :cond_b
    iget-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panEnabled:Z

    if-eqz v0, :cond_e

    .line 37
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    iget v7, v0, Landroid/graphics/PointF;->x:F

    iget-object v9, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    iget v14, v9, Landroid/graphics/PointF;->x:F

    sub-float/2addr v7, v14

    .line 38
    iget v0, v0, Landroid/graphics/PointF;->y:F

    iget v9, v9, Landroid/graphics/PointF;->y:F

    sub-float/2addr v0, v9

    .line 39
    iget v9, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    iget v14, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scaleStart:F

    div-float/2addr v9, v14

    mul-float/2addr v7, v9

    mul-float/2addr v9, v0

    .line 40
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    sub-float v7, v8, v7

    iput v7, v0, Landroid/graphics/PointF;->x:F

    sub-float v7, v11, v9

    .line 41
    iput v7, v0, Landroid/graphics/PointF;->y:F

    .line 42
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v0

    int-to-double v14, v0

    mul-double/2addr v14, v12

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getHeight()I

    move-result v0

    move v7, v6

    int-to-double v5, v0

    cmpg-double v0, v14, v5

    if-gez v0, :cond_c

    iget v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v0, v5

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getHeight()I

    move-result v5

    int-to-float v5, v5

    cmpl-float v0, v0, v5

    if-gez v0, :cond_d

    :cond_c
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v0

    int-to-double v5, v0

    mul-double/2addr v12, v5

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-double v5, v0

    cmpg-double v0, v12, v5

    if-gez v0, :cond_10

    iget v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v0, v5

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getWidth()I

    move-result v5

    int-to-float v5, v5

    cmpl-float v0, v0, v5

    if-ltz v0, :cond_10

    .line 43
    :cond_d
    invoke-virtual {v1, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(Z)V

    .line 44
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    invoke-virtual {v0, v8, v11}, Landroid/graphics/PointF;->set(FF)V

    .line 45
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    iget-object v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    invoke-virtual {v0, v5}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 46
    iget v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scaleStart:F

    .line 47
    iput v7, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vDistStart:F

    goto :goto_1

    .line 48
    :cond_e
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    if-eqz v0, :cond_f

    .line 49
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getWidth()I

    move-result v5

    div-int/2addr v5, v10

    int-to-float v5, v5

    iget v6, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    iget-object v7, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    iget v7, v7, Landroid/graphics/PointF;->x:F

    mul-float/2addr v6, v7

    sub-float/2addr v5, v6

    iput v5, v0, Landroid/graphics/PointF;->x:F

    .line 50
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getHeight()I

    move-result v5

    div-int/2addr v5, v10

    int-to-float v5, v5

    iget v6, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    iget-object v7, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    iget v7, v7, Landroid/graphics/PointF;->y:F

    mul-float/2addr v6, v7

    sub-float/2addr v5, v6

    iput v5, v0, Landroid/graphics/PointF;->y:F

    goto :goto_1

    .line 51
    :cond_f
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getWidth()I

    move-result v5

    div-int/2addr v5, v10

    int-to-float v5, v5

    iget v6, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v7

    div-int/2addr v7, v10

    int-to-float v7, v7

    mul-float/2addr v6, v7

    sub-float/2addr v5, v6

    iput v5, v0, Landroid/graphics/PointF;->x:F

    .line 52
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getHeight()I

    move-result v5

    div-int/2addr v5, v10

    int-to-float v5, v5

    iget v6, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v7

    div-int/2addr v7, v10

    int-to-float v7, v7

    mul-float/2addr v6, v7

    sub-float/2addr v5, v6

    iput v5, v0, Landroid/graphics/PointF;->y:F

    .line 53
    :cond_10
    :goto_1
    invoke-virtual {v1, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(Z)V

    .line 54
    iget-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->eagerLoadingEnabled:Z

    invoke-virtual {v1, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->refreshRequiredTiles(Z)V

    goto/16 :goto_e

    .line 55
    :cond_11
    iget-boolean v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isQuickScaling:Z

    if-eqz v5, :cond_1c

    .line 56
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleVStart:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->y:F

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    sub-float/2addr v0, v5

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    mul-float/2addr v0, v9

    iget v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleThreshold:F

    add-float/2addr v0, v5

    .line 57
    iget v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastDistance:F

    const/high16 v7, -0x40800000    # -1.0f

    cmpl-float v5, v5, v7

    if-nez v5, :cond_12

    .line 58
    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastDistance:F

    .line 59
    :cond_12
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    iget-object v7, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleVLastPoint:Landroid/graphics/PointF;

    iget v8, v7, Landroid/graphics/PointF;->y:F

    cmpl-float v5, v5, v8

    if-lez v5, :cond_13

    move v5, v3

    goto :goto_2

    :cond_13
    const/4 v5, 0x0

    .line 60
    :goto_2
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v8

    invoke-virtual {v7, v6, v8}, Landroid/graphics/PointF;->set(FF)V

    .line 61
    iget v7, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastDistance:F

    div-float v7, v0, v7

    const/high16 v8, 0x3f800000    # 1.0f

    sub-float v7, v8, v7

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    const/high16 v9, 0x3f000000    # 0.5f

    mul-float/2addr v7, v9

    const v9, 0x3cf5c28f    # 0.03f

    cmpl-float v9, v7, v9

    if-gtz v9, :cond_14

    .line 62
    iget-boolean v9, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleMoved:Z

    if-eqz v9, :cond_1b

    .line 63
    :cond_14
    iput-boolean v3, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleMoved:Z

    .line 64
    iget v9, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastDistance:F

    cmpl-float v9, v9, v6

    if-lez v9, :cond_16

    if-eqz v5, :cond_15

    add-float/2addr v8, v7

    goto :goto_3

    :cond_15
    sub-float/2addr v8, v7

    .line 65
    :cond_16
    :goto_3
    iget v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    float-to-double v11, v5

    .line 66
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale()F

    move-result v5

    iget v7, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxScale:F

    iget v9, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    mul-float/2addr v9, v8

    invoke-static {v7, v9}, Ljava/lang/Math;->min(FF)F

    move-result v7

    invoke-static {v5, v7}, Ljava/lang/Math;->max(FF)F

    move-result v5

    iput v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 67
    iget-boolean v7, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panEnabled:Z

    if-eqz v7, :cond_19

    .line 68
    iget-object v7, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    iget v8, v7, Landroid/graphics/PointF;->x:F

    iget-object v9, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    iget v13, v9, Landroid/graphics/PointF;->x:F

    sub-float v13, v8, v13

    .line 69
    iget v7, v7, Landroid/graphics/PointF;->y:F

    iget v9, v9, Landroid/graphics/PointF;->y:F

    sub-float v9, v7, v9

    .line 70
    iget v14, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scaleStart:F

    div-float/2addr v5, v14

    mul-float/2addr v13, v5

    mul-float/2addr v5, v9

    .line 71
    iget-object v9, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    sub-float/2addr v8, v13

    iput v8, v9, Landroid/graphics/PointF;->x:F

    sub-float/2addr v7, v5

    .line 72
    iput v7, v9, Landroid/graphics/PointF;->y:F

    .line 73
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v5

    int-to-double v7, v5

    mul-double/2addr v7, v11

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getHeight()I

    move-result v5

    int-to-double v13, v5

    cmpg-double v5, v7, v13

    if-gez v5, :cond_17

    iget v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v7

    int-to-float v7, v7

    mul-float/2addr v5, v7

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getHeight()I

    move-result v7

    int-to-float v7, v7

    cmpl-float v5, v5, v7

    if-gez v5, :cond_18

    :cond_17
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v5

    int-to-double v7, v5

    mul-double/2addr v11, v7

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getWidth()I

    move-result v5

    int-to-double v7, v5

    cmpg-double v5, v11, v7

    if-gez v5, :cond_1b

    iget v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v7

    int-to-float v7, v7

    mul-float/2addr v5, v7

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getWidth()I

    move-result v7

    int-to-float v7, v7

    cmpl-float v5, v5, v7

    if-ltz v5, :cond_1b

    .line 74
    :cond_18
    invoke-virtual {v1, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(Z)V

    .line 75
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    iget-object v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleSCenter:Landroid/graphics/PointF;

    invoke-virtual {v1, v5}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewCoord(Landroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 76
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    iget-object v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    invoke-virtual {v0, v5}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 77
    iget v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scaleStart:F

    goto :goto_5

    .line 78
    :cond_19
    iget-object v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    if-eqz v5, :cond_1a

    .line 79
    iget-object v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getWidth()I

    move-result v6

    div-int/2addr v6, v10

    int-to-float v6, v6

    iget v7, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    iget-object v8, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    iget v8, v8, Landroid/graphics/PointF;->x:F

    mul-float/2addr v7, v8

    sub-float/2addr v6, v7

    iput v6, v5, Landroid/graphics/PointF;->x:F

    .line 80
    iget-object v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getHeight()I

    move-result v6

    div-int/2addr v6, v10

    int-to-float v6, v6

    iget v7, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    iget-object v8, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    iget v8, v8, Landroid/graphics/PointF;->y:F

    mul-float/2addr v7, v8

    sub-float/2addr v6, v7

    iput v6, v5, Landroid/graphics/PointF;->y:F

    goto :goto_4

    .line 81
    :cond_1a
    iget-object v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getWidth()I

    move-result v6

    div-int/2addr v6, v10

    int-to-float v6, v6

    iget v7, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v8

    div-int/2addr v8, v10

    int-to-float v8, v8

    mul-float/2addr v7, v8

    sub-float/2addr v6, v7

    iput v6, v5, Landroid/graphics/PointF;->x:F

    .line 82
    iget-object v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getHeight()I

    move-result v6

    div-int/2addr v6, v10

    int-to-float v6, v6

    iget v7, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v8

    div-int/2addr v8, v10

    int-to-float v8, v8

    mul-float/2addr v7, v8

    sub-float/2addr v6, v7

    iput v6, v5, Landroid/graphics/PointF;->y:F

    :cond_1b
    :goto_4
    move v6, v0

    .line 83
    :goto_5
    iput v6, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastDistance:F

    .line 84
    invoke-virtual {v1, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(Z)V

    .line 85
    iget-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->eagerLoadingEnabled:Z

    invoke-virtual {v1, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->refreshRequiredTiles(Z)V

    goto/16 :goto_e

    .line 86
    :cond_1c
    iget-boolean v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z

    if-nez v5, :cond_28

    .line 87
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    iget-object v6, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    iget v6, v6, Landroid/graphics/PointF;->x:F

    sub-float/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    .line 88
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    iget-object v7, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    iget v7, v7, Landroid/graphics/PointF;->y:F

    sub-float/2addr v6, v7

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    .line 89
    iget v7, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->density:F

    mul-float/2addr v7, v0

    cmpl-float v0, v5, v7

    if-gtz v0, :cond_1d

    cmpl-float v8, v6, v7

    if-gtz v8, :cond_1d

    .line 90
    iget-boolean v8, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    if-eqz v8, :cond_28

    .line 91
    :cond_1d
    iget-object v8, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget-object v9, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    iget v9, v9, Landroid/graphics/PointF;->x:F

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v11

    iget-object v12, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    iget v12, v12, Landroid/graphics/PointF;->x:F

    sub-float/2addr v11, v12

    add-float/2addr v11, v9

    iput v11, v8, Landroid/graphics/PointF;->x:F

    .line 92
    iget-object v8, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget-object v9, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    iget v9, v9, Landroid/graphics/PointF;->y:F

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v11

    iget-object v12, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    iget v12, v12, Landroid/graphics/PointF;->y:F

    sub-float/2addr v11, v12

    add-float/2addr v11, v9

    iput v11, v8, Landroid/graphics/PointF;->y:F

    .line 93
    iget-object v8, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget v9, v8, Landroid/graphics/PointF;->x:F

    .line 94
    iget v8, v8, Landroid/graphics/PointF;->y:F

    .line 95
    invoke-virtual {v1, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(Z)V

    .line 96
    iget-object v11, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget v12, v11, Landroid/graphics/PointF;->x:F

    cmpl-float v9, v9, v12

    if-eqz v9, :cond_1e

    move v9, v3

    goto :goto_6

    :cond_1e
    const/4 v9, 0x0

    .line 97
    :goto_6
    iget v11, v11, Landroid/graphics/PointF;->y:F

    cmpl-float v8, v8, v11

    if-eqz v8, :cond_1f

    move v11, v3

    goto :goto_7

    :cond_1f
    const/4 v11, 0x0

    :goto_7
    if-eqz v9, :cond_20

    cmpl-float v12, v5, v6

    if-lez v12, :cond_20

    .line 98
    iget-boolean v12, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    if-nez v12, :cond_20

    move v12, v3

    goto :goto_8

    :cond_20
    const/4 v12, 0x0

    :goto_8
    if-eqz v11, :cond_21

    cmpl-float v5, v6, v5

    if-lez v5, :cond_21

    .line 99
    iget-boolean v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    if-nez v5, :cond_21

    move v5, v3

    goto :goto_9

    :cond_21
    const/4 v5, 0x0

    :goto_9
    if-nez v8, :cond_22

    const/high16 v8, 0x40400000    # 3.0f

    mul-float/2addr v8, v7

    cmpl-float v8, v6, v8

    if-lez v8, :cond_22

    move v8, v3

    goto :goto_a

    :cond_22
    const/4 v8, 0x0

    :goto_a
    if-nez v12, :cond_24

    if-nez v5, :cond_24

    if-eqz v9, :cond_23

    if-eqz v11, :cond_23

    if-nez v8, :cond_23

    .line 100
    iget-boolean v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    if-eqz v5, :cond_24

    .line 101
    :cond_23
    iput-boolean v3, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    goto :goto_b

    :cond_24
    if-gtz v0, :cond_26

    cmpl-float v0, v6, v7

    if-lez v0, :cond_25

    goto :goto_c

    :cond_25
    :goto_b
    const/4 v0, 0x0

    goto :goto_d

    :cond_26
    :goto_c
    const/4 v0, 0x0

    .line 102
    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    .line 103
    iget-object v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->handler:Landroid/os/Handler;

    invoke-virtual {v5, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 104
    invoke-virtual {v1, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->requestDisallowInterceptTouchEvent(Z)V

    .line 105
    :goto_d
    iget-boolean v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panEnabled:Z

    if-nez v5, :cond_27

    .line 106
    iget-object v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget-object v6, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    iget v7, v6, Landroid/graphics/PointF;->x:F

    iput v7, v5, Landroid/graphics/PointF;->x:F

    .line 107
    iget v6, v6, Landroid/graphics/PointF;->y:F

    iput v6, v5, Landroid/graphics/PointF;->y:F

    .line 108
    invoke-virtual {v1, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->requestDisallowInterceptTouchEvent(Z)V

    .line 109
    :cond_27
    iget-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->eagerLoadingEnabled:Z

    invoke-virtual {v1, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->refreshRequiredTiles(Z)V

    :goto_e
    move v0, v3

    goto :goto_f

    :cond_28
    const/4 v0, 0x0

    :goto_f
    if-eqz v0, :cond_29

    .line 110
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->handler:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 111
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->invalidate()V

    goto/16 :goto_13

    :cond_29
    :goto_10
    const/4 v0, 0x0

    goto/16 :goto_14

    .line 112
    :cond_2a
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->handler:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 113
    iget-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isQuickScaling:Z

    if-eqz v0, :cond_2b

    const/4 v0, 0x0

    .line 114
    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isQuickScaling:Z

    .line 115
    iget-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleMoved:Z

    if-nez v0, :cond_2b

    .line 116
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleSCenter:Landroid/graphics/PointF;

    iget-object v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    invoke-virtual {v1, v0, v5}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoom(Landroid/graphics/PointF;Landroid/graphics/PointF;)V

    .line 117
    :cond_2b
    iget v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    if-lez v0, :cond_31

    iget-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z

    if-nez v0, :cond_2c

    iget-boolean v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    if-eqz v5, :cond_31

    :cond_2c
    if-eqz v0, :cond_2e

    if-ne v7, v10, :cond_2e

    .line 118
    iput-boolean v3, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    .line 119
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    iget-object v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget v6, v5, Landroid/graphics/PointF;->x:F

    iget v5, v5, Landroid/graphics/PointF;->y:F

    invoke-virtual {v0, v6, v5}, Landroid/graphics/PointF;->set(FF)V

    .line 120
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    if-ne v0, v3, :cond_2d

    .line 121
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    const/4 v5, 0x0

    invoke-virtual {v2, v5}, Landroid/view/MotionEvent;->getX(I)F

    move-result v6

    invoke-virtual {v2, v5}, Landroid/view/MotionEvent;->getY(I)F

    move-result v8

    invoke-virtual {v0, v6, v8}, Landroid/graphics/PointF;->set(FF)V

    goto :goto_11

    .line 122
    :cond_2d
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    invoke-virtual {v2, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v5

    invoke-virtual {v2, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result v6

    invoke-virtual {v0, v5, v6}, Landroid/graphics/PointF;->set(FF)V

    :cond_2e
    :goto_11
    const/4 v0, 0x3

    if-ge v7, v0, :cond_2f

    const/4 v0, 0x0

    .line 123
    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z

    goto :goto_12

    :cond_2f
    const/4 v0, 0x0

    :goto_12
    if-ge v7, v10, :cond_30

    .line 124
    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    .line 125
    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    .line 126
    :cond_30
    invoke-virtual {v1, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->refreshRequiredTiles(Z)V

    move v5, v0

    goto/16 :goto_16

    :cond_31
    const/4 v0, 0x0

    if-ne v7, v3, :cond_32

    .line 127
    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z

    .line 128
    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    .line 129
    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    :cond_32
    :goto_13
    move v0, v3

    :goto_14
    const/4 v5, 0x0

    goto/16 :goto_17

    .line 130
    :cond_33
    iput-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 131
    invoke-virtual {v1, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->requestDisallowInterceptTouchEvent(Z)V

    .line 132
    iget v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    invoke-static {v0, v7}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    if-lt v7, v10, :cond_35

    .line 133
    iget-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->zoomEnabled:Z

    if-eqz v0, :cond_34

    const/4 v0, 0x0

    .line 134
    invoke-virtual {v2, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v5

    invoke-virtual {v2, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v6

    invoke-virtual {v2, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v7

    invoke-virtual {v2, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    invoke-virtual {v1, v5, v6, v7, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->distance(FFFF)F

    move-result v0

    .line 135
    iget v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    iput v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scaleStart:F

    .line 136
    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vDistStart:F

    .line 137
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    iget-object v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget v6, v5, Landroid/graphics/PointF;->x:F

    iget v5, v5, Landroid/graphics/PointF;->y:F

    invoke-virtual {v0, v6, v5}, Landroid/graphics/PointF;->set(FF)V

    .line 138
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    const/4 v5, 0x0

    invoke-virtual {v2, v5}, Landroid/view/MotionEvent;->getX(I)F

    move-result v6

    invoke-virtual {v2, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v7

    add-float/2addr v7, v6

    div-float/2addr v7, v9

    invoke-virtual {v2, v5}, Landroid/view/MotionEvent;->getY(I)F

    move-result v6

    invoke-virtual {v2, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result v8

    add-float/2addr v8, v6

    div-float/2addr v8, v9

    invoke-virtual {v0, v7, v8}, Landroid/graphics/PointF;->set(FF)V

    goto :goto_15

    :cond_34
    const/4 v5, 0x0

    .line 139
    iput v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    .line 140
    :goto_15
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->handler:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeMessages(I)V

    goto :goto_16

    :cond_35
    const/4 v5, 0x0

    .line 141
    iget-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isQuickScaling:Z

    if-nez v0, :cond_36

    .line 142
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    iget-object v6, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget v7, v6, Landroid/graphics/PointF;->x:F

    iget v6, v6, Landroid/graphics/PointF;->y:F

    invoke-virtual {v0, v7, v6}, Landroid/graphics/PointF;->set(FF)V

    .line 143
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    invoke-virtual {v0, v6, v7}, Landroid/graphics/PointF;->set(FF)V

    .line 144
    iget-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->handler:Landroid/os/Handler;

    const-wide/16 v6, 0x258

    invoke-virtual {v0, v3, v6, v7}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    :cond_36
    :goto_16
    move v0, v3

    .line 145
    :goto_17
    iget-object v6, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateBefore:Landroid/graphics/PointF;

    invoke-virtual {v1, v4, v6, v10}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sendStateChanged(FLandroid/graphics/PointF;I)V

    if-nez v0, :cond_38

    .line 146
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_37

    goto :goto_18

    :cond_37
    move v3, v5

    :cond_38
    :goto_18
    return v3
.end method

.method public final preDraw()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    if-lez v0, :cond_3

    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    if-gtz v0, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sPendingCenter:Landroid/graphics/PointF;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pendingScale:Ljava/lang/Float;

    if-eqz v0, :cond_2

    .line 3
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 4
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-nez v0, :cond_1

    .line 5
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    .line 6
    :cond_1
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sPendingCenter:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->x:F

    mul-float/2addr v2, v3

    sub-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/PointF;->x:F

    .line 7
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sPendingCenter:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->y:F

    mul-float/2addr v2, v3

    sub-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/PointF;->y:F

    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sPendingCenter:Landroid/graphics/PointF;

    .line 9
    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pendingScale:Ljava/lang/Float;

    const/4 v0, 0x1

    .line 10
    invoke-virtual {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(Z)V

    .line 11
    invoke-virtual {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->refreshRequiredTiles(Z)V

    :cond_2
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(Z)V

    :cond_3
    :goto_0
    return-void
.end method

.method public final refreshRequiredTiles(Z)V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    if-nez v0, :cond_0

    goto/16 :goto_2

    .line 2
    :cond_0
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    invoke-virtual {p0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->calculateInSampleSize(F)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 3
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 4
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    .line 5
    iget v4, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sampleSize:I

    const/4 v5, 0x0

    const/4 v6, 0x0

    if-lt v4, v0, :cond_3

    if-le v4, v0, :cond_4

    .line 6
    iget v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    if-eq v4, v7, :cond_4

    .line 7
    :cond_3
    iput-boolean v6, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->visible:Z

    .line 8
    iget-object v4, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v4, :cond_4

    .line 9
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V

    .line 10
    iput-object v5, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;

    .line 11
    :cond_4
    iget v4, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sampleSize:I

    const/4 v7, 0x1

    if-ne v4, v0, :cond_7

    const/4 v4, 0x0

    .line 12
    invoke-virtual {p0, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceX(F)F

    move-result v8

    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v9

    int-to-float v9, v9

    invoke-virtual {p0, v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceX(F)F

    move-result v9

    .line 14
    invoke-virtual {p0, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceY(F)F

    move-result v4

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v10

    int-to-float v10, v10

    invoke-virtual {p0, v10}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceY(F)F

    move-result v10

    .line 16
    iget-object v11, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;

    .line 17
    iget v12, v11, Landroid/graphics/Rect;->right:I

    int-to-float v12, v12

    cmpl-float v8, v8, v12

    if-gtz v8, :cond_5

    iget v8, v11, Landroid/graphics/Rect;->left:I

    int-to-float v8, v8

    cmpl-float v8, v8, v9

    if-gtz v8, :cond_5

    iget v8, v11, Landroid/graphics/Rect;->bottom:I

    int-to-float v8, v8

    cmpl-float v4, v4, v8

    if-gtz v4, :cond_5

    iget v4, v11, Landroid/graphics/Rect;->top:I

    int-to-float v4, v4

    cmpl-float v4, v4, v10

    if-gtz v4, :cond_5

    move v4, v7

    goto :goto_1

    :cond_5
    move v4, v6

    :goto_1
    if-eqz v4, :cond_6

    .line 18
    iput-boolean v7, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->visible:Z

    .line 19
    iget-boolean v4, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->loading:Z

    if-nez v4, :cond_2

    .line 20
    iget-object v4, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;

    if-nez v4, :cond_2

    if-eqz p1, :cond_2

    .line 21
    new-instance v4, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;

    iget-object v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    invoke-direct {v4, p0, v5, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)V

    .line 22
    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->executor:Ljava/util/concurrent/Executor;

    new-array v5, v6, [Ljava/lang/Void;

    invoke-virtual {v4, v3, v5}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto/16 :goto_0

    .line 23
    :cond_6
    iget v4, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sampleSize:I

    .line 24
    iget v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    if-eq v4, v7, :cond_2

    .line 25
    iput-boolean v6, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->visible:Z

    .line 26
    iget-object v4, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v4, :cond_2

    .line 27
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V

    .line 28
    iput-object v5, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;

    goto/16 :goto_0

    .line 29
    :cond_7
    iget v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    if-ne v4, v5, :cond_2

    .line 30
    iput-boolean v7, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->visible:Z

    goto/16 :goto_0

    :cond_8
    :goto_2
    return-void
.end method

.method public final requestDisallowInterceptTouchEvent(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 2
    invoke-interface {p0, p1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_0
    return-void
.end method

.method public final reset(Z)V
    .locals 5

    const/4 v0, 0x0

    .line 1
    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 2
    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scaleStart:F

    const/4 v1, 0x0

    .line 3
    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    .line 4
    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    .line 5
    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateBefore:Landroid/graphics/PointF;

    .line 6
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    iput-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pendingScale:Ljava/lang/Float;

    .line 7
    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sPendingCenter:Landroid/graphics/PointF;

    .line 8
    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    const/4 v2, 0x0

    .line 9
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z

    .line 10
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    .line 11
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isQuickScaling:Z

    .line 12
    iput v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    .line 13
    iput v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    .line 14
    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    .line 15
    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vDistStart:F

    .line 16
    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastDistance:F

    .line 17
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleMoved:Z

    .line 18
    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleSCenter:Landroid/graphics/PointF;

    .line 19
    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleVLastPoint:Landroid/graphics/PointF;

    .line 20
    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleVStart:Landroid/graphics/PointF;

    .line 21
    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 22
    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    .line 23
    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    .line 24
    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRect:Landroid/graphics/RectF;

    if-eqz p1, :cond_2

    .line 25
    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->uri:Landroid/net/Uri;

    .line 26
    iget-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoderLock:Ljava/util/concurrent/locks/ReadWriteLock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 27
    :try_start_0
    iget-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    if-eqz p1, :cond_0

    .line 28
    invoke-interface {p1}, Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;->recycle()V

    .line 29
    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :cond_0
    iget-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoderLock:Ljava/util/concurrent/locks/ReadWriteLock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 31
    iget-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    if-eqz p1, :cond_1

    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsCached:Z

    if-nez v0, :cond_1

    .line 32
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 33
    :cond_1
    iput v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    .line 34
    iput v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    .line 35
    iput v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sOrientation:I

    .line 36
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z

    .line 37
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->imageLoadedSent:Z

    .line 38
    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    .line 39
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsPreview:Z

    .line 40
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsCached:Z

    goto :goto_0

    :catchall_0
    move-exception p1

    .line 41
    iget-object p0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoderLock:Ljava/util/concurrent/locks/ReadWriteLock;

    invoke-interface {p0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 42
    throw p1

    .line 43
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    if-eqz p1, :cond_6

    .line 44
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 45
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    .line 46
    iput-boolean v2, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->visible:Z

    .line 47
    iget-object v4, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v4, :cond_4

    .line 48
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V

    .line 49
    iput-object v1, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;

    goto :goto_1

    .line 50
    :cond_5
    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    .line 51
    :cond_6
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setGestureDetector(Landroid/content/Context;)V

    return-void
.end method

.method public final sHeight()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v0

    const/16 v1, 0x5a

    if-eq v0, v1, :cond_1

    const/16 v1, 0x10e

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    iget p0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    return p0

    .line 3
    :cond_1
    :goto_0
    iget p0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    return p0
.end method

.method public final sWidth()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v0

    const/16 v1, 0x5a

    if-eq v0, v1, :cond_1

    const/16 v1, 0x10e

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    iget p0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    return p0

    .line 3
    :cond_1
    :goto_0
    iget p0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    return p0
.end method

.method public final sendStateChanged(FLandroid/graphics/PointF;I)V
    .locals 2

    .line 1
    iget-object p3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onStateChangedListener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnStateChangedListener;

    if-eqz p3, :cond_0

    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    cmpl-float p1, v0, p1

    if-eqz p1, :cond_0

    .line 2
    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    :cond_0
    iget-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onStateChangedListener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnStateChangedListener;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    invoke-virtual {p1, p2}, Landroid/graphics/PointF;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 4
    iget-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onStateChangedListener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnStateChangedListener;

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getCenter()Landroid/graphics/PointF;

    check-cast p1, Lcom/android/wallpaper/picker/ImagePreviewFragment$3;

    .line 5
    iget-object p0, p1, Lcom/android/wallpaper/picker/ImagePreviewFragment$3;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    const/4 p2, 0x0

    invoke-virtual {p0, p2}, Lcom/android/wallpaper/widget/BottomActionBar;->enableActionButtonsWithBottomSheet(Z)V

    .line 6
    iget-object p0, p1, Lcom/android/wallpaper/picker/ImagePreviewFragment$3;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 7
    iget-object p0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mImageScaleChangeCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 8
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 9
    iget-object p0, p1, Lcom/android/wallpaper/picker/ImagePreviewFragment$3;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 10
    iget-object p0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mFullResImageView:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 11
    new-instance p2, Lcom/android/wallpaper/util/DiskBasedLogger$$ExternalSyntheticLambda1;

    invoke-direct {p2, p1}, Lcom/android/wallpaper/util/DiskBasedLogger$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/picker/ImagePreviewFragment$3;)V

    const-wide/16 v0, 0x64

    invoke-virtual {p0, p2, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_1
    return-void
.end method

.method public final setGestureDetector(Landroid/content/Context;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/view/GestureDetector;

    new-instance v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;

    invoke-direct {v1, p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/content/Context;)V

    invoke-direct {v0, p1, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->detector:Landroid/view/GestureDetector;

    .line 2
    new-instance v0, Landroid/view/GestureDetector;

    new-instance v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$3;

    invoke-direct {v1, p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$3;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)V

    invoke-direct {v0, p1, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->singleDetector:Landroid/view/GestureDetector;

    return-void
.end method

.method public final setImage(Lcom/davemorrissey/labs/subscaleview/ImageSource;)V
    .locals 8

    const/4 v0, 0x1

    .line 1
    invoke-virtual {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->reset(Z)V

    .line 2
    iget-object v0, p1, Lcom/davemorrissey/labs/subscaleview/ImageSource;->bitmap:Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 3
    iget-boolean p1, p1, Lcom/davemorrissey/labs/subscaleview/ImageSource;->cached:Z

    .line 4
    invoke-virtual {p0, v0, v1, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onImageLoaded(Landroid/graphics/Bitmap;IZ)V

    goto :goto_0

    .line 5
    :cond_0
    iget-object v0, p1, Lcom/davemorrissey/labs/subscaleview/ImageSource;->uri:Landroid/net/Uri;

    .line 6
    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->uri:Landroid/net/Uri;

    if-nez v0, :cond_1

    .line 7
    iget-object v0, p1, Lcom/davemorrissey/labs/subscaleview/ImageSource;->resource:Ljava/lang/Integer;

    if-eqz v0, :cond_1

    const-string v0, "android.resource://"

    .line 8
    invoke-static {v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    iget-object v2, p1, Lcom/davemorrissey/labs/subscaleview/ImageSource;->resource:Ljava/lang/Integer;

    .line 10
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->uri:Landroid/net/Uri;

    .line 11
    :cond_1
    iget-boolean p1, p1, Lcom/davemorrissey/labs/subscaleview/ImageSource;->tile:Z

    if-nez p1, :cond_2

    .line 12
    new-instance p1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$BitmapLoadTask;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    iget-object v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;

    iget-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->uri:Landroid/net/Uri;

    const/4 v7, 0x0

    move-object v2, p1

    move-object v3, p0

    invoke-direct/range {v2 .. v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$BitmapLoadTask;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/content/Context;Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;Landroid/net/Uri;Z)V

    .line 13
    iget-object p0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->executor:Ljava/util/concurrent/Executor;

    new-array v0, v1, [Ljava/lang/Void;

    invoke-virtual {p1, p0, v0}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 14
    :cond_2
    new-instance p1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TilesInitTask;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->regionDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;

    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->uri:Landroid/net/Uri;

    invoke-direct {p1, p0, v0, v2, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TilesInitTask;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/content/Context;Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;Landroid/net/Uri;)V

    .line 15
    iget-object p0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->executor:Ljava/util/concurrent/Executor;

    new-array v0, v1, [Ljava/lang/Void;

    invoke-virtual {p1, p0, v0}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    :goto_0
    return-void
.end method

.method public final setMatrixArray([FFFFFFFFF)V
    .locals 0

    const/4 p0, 0x0

    .line 1
    aput p2, p1, p0

    const/4 p0, 0x1

    .line 2
    aput p3, p1, p0

    const/4 p0, 0x2

    .line 3
    aput p4, p1, p0

    const/4 p0, 0x3

    .line 4
    aput p5, p1, p0

    const/4 p0, 0x4

    .line 5
    aput p6, p1, p0

    const/4 p0, 0x5

    .line 6
    aput p7, p1, p0

    const/4 p0, 0x6

    .line 7
    aput p8, p1, p0

    const/4 p0, 0x7

    .line 8
    aput p9, p1, p0

    return-void
.end method

.method public final setMinimumScaleType(I)V
    .locals 2

    .line 1
    sget-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_SCALE_TYPES:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minimumScaleType:I

    .line 3
    iget-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(Z)V

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_0
    return-void

    .line 6
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Invalid scale type: "

    invoke-static {v0, p1}, Landroid/support/media/ExifInterface$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onLongClickListener:Landroid/view/View$OnLongClickListener;

    return-void
.end method

.method public final setPanLimit(I)V
    .locals 2

    .line 1
    sget-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_PAN_LIMITS:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panLimit:I

    .line 3
    iget-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(Z)V

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_0
    return-void

    .line 6
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Invalid pan limit: "

    invoke-static {v0, p1}, Landroid/support/media/ExifInterface$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final sourceToViewCoord(Landroid/graphics/PointF;)Landroid/graphics/PointF;
    .locals 3

    .line 1
    iget v0, p1, Landroid/graphics/PointF;->x:F

    iget p1, p1, Landroid/graphics/PointF;->y:F

    new-instance v1, Landroid/graphics/PointF;

    invoke-direct {v1}, Landroid/graphics/PointF;-><init>()V

    .line 2
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-nez v2, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    .line 3
    :cond_0
    invoke-virtual {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewX(F)F

    move-result v0

    invoke-virtual {p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewY(F)F

    move-result p0

    invoke-virtual {v1, v0, p0}, Landroid/graphics/PointF;->set(FF)V

    :goto_0
    return-object v1
.end method

.method public final sourceToViewX(F)F
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-nez v0, :cond_0

    const/high16 p0, 0x7fc00000    # Float.NaN

    return p0

    .line 2
    :cond_0
    iget p0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    mul-float/2addr p1, p0

    iget p0, v0, Landroid/graphics/PointF;->x:F

    add-float/2addr p1, p0

    return p1
.end method

.method public final sourceToViewY(F)F
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-nez v0, :cond_0

    const/high16 p0, 0x7fc00000    # Float.NaN

    return p0

    .line 2
    :cond_0
    iget p0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    mul-float/2addr p1, p0

    iget p0, v0, Landroid/graphics/PointF;->y:F

    add-float/2addr p1, p0

    return p1
.end method

.method public final vTranslateForSCenter(FFF)Landroid/graphics/PointF;
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v2

    sub-int/2addr v1, v2

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v1, v0

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    sub-int/2addr v2, v3

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v2, v0

    .line 3
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    if-nez v0, :cond_0

    .line 4
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    new-instance v3, Landroid/graphics/PointF;

    const/4 v4, 0x0

    invoke-direct {v3, v4, v4}, Landroid/graphics/PointF;-><init>(FF)V

    const/4 v5, 0x0

    invoke-direct {v0, v4, v3, v5}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;-><init>(FLandroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    .line 5
    :cond_0
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    .line 6
    iput p3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->scale:F

    .line 7
    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->vTranslate:Landroid/graphics/PointF;

    int-to-float v1, v1

    mul-float/2addr p1, p3

    sub-float/2addr v1, p1

    int-to-float p1, v2

    mul-float/2addr p2, p3

    sub-float/2addr p1, p2

    .line 8
    invoke-virtual {v0, v1, p1}, Landroid/graphics/PointF;->set(FF)V

    const/4 p1, 0x1

    .line 9
    iget-object p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    invoke-virtual {p0, p1, p2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(ZLcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)V

    .line 10
    iget-object p0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    .line 11
    iget-object p0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->vTranslate:Landroid/graphics/PointF;

    return-object p0
.end method

.method public final viewToSourceCoord(Landroid/graphics/PointF;)Landroid/graphics/PointF;
    .locals 3

    .line 1
    iget v0, p1, Landroid/graphics/PointF;->x:F

    iget p1, p1, Landroid/graphics/PointF;->y:F

    new-instance v1, Landroid/graphics/PointF;

    invoke-direct {v1}, Landroid/graphics/PointF;-><init>()V

    .line 2
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-nez v2, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    .line 3
    :cond_0
    invoke-virtual {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceX(F)F

    move-result v0

    invoke-virtual {p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceY(F)F

    move-result p0

    invoke-virtual {v1, v0, p0}, Landroid/graphics/PointF;->set(FF)V

    :goto_0
    return-object v1
.end method

.method public final viewToSourceX(F)F
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-nez v0, :cond_0

    const/high16 p0, 0x7fc00000    # Float.NaN

    return p0

    .line 2
    :cond_0
    iget v0, v0, Landroid/graphics/PointF;->x:F

    sub-float/2addr p1, v0

    iget p0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    div-float/2addr p1, p0

    return p1
.end method

.method public final viewToSourceY(F)F
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-nez v0, :cond_0

    const/high16 p0, 0x7fc00000    # Float.NaN

    return p0

    .line 2
    :cond_0
    iget v0, v0, Landroid/graphics/PointF;->y:F

    sub-float/2addr p1, v0

    iget p0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    div-float/2addr p1, p0

    return p1
.end method
