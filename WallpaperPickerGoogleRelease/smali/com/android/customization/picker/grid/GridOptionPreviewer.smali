.class public Lcom/android/customization/picker/grid/GridOptionPreviewer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/customization/picker/grid/GridOptionPreviewer$GridOptionSurfaceHolderCallback;
    }
.end annotation


# instance fields
.field public final mGridManager:Lcom/android/customization/model/grid/GridOptionsManager;

.field public mGridOption:Lcom/android/customization/model/grid/GridOption;

.field public mGridOptionSurface:Landroid/view/SurfaceView;

.field public final mPreviewContainer:Landroid/view/ViewGroup;

.field public mSurfaceCallback:Lcom/android/customization/picker/grid/GridOptionPreviewer$GridOptionSurfaceHolderCallback;


# direct methods
.method public constructor <init>(Lcom/android/customization/model/grid/GridOptionsManager;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/customization/picker/grid/GridOptionPreviewer;->mGridManager:Lcom/android/customization/model/grid/GridOptionsManager;

    .line 3
    iput-object p2, p0, Lcom/android/customization/picker/grid/GridOptionPreviewer;->mPreviewContainer:Landroid/view/ViewGroup;

    return-void
.end method
