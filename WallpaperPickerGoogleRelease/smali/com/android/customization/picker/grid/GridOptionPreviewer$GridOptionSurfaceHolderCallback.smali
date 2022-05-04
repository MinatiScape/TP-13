.class public Lcom/android/customization/picker/grid/GridOptionPreviewer$GridOptionSurfaceHolderCallback;
.super Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/customization/picker/grid/GridOptionPreviewer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "GridOptionSurfaceHolderCallback"
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/customization/picker/grid/GridOptionPreviewer;


# direct methods
.method public constructor <init>(Lcom/android/customization/picker/grid/GridOptionPreviewer;Landroid/view/SurfaceView;Landroid/content/Context;Lcom/android/customization/picker/grid/GridOptionPreviewer$1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/customization/picker/grid/GridOptionPreviewer$GridOptionSurfaceHolderCallback;->this$0:Lcom/android/customization/picker/grid/GridOptionPreviewer;

    const/4 p1, 0x0

    .line 2
    invoke-direct {p0, p2, p3, p1}, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;-><init>(Landroid/view/SurfaceView;Landroid/content/Context;Z)V

    return-void
.end method


# virtual methods
.method public requestPreview(Landroid/view/SurfaceView;Lcom/android/wallpaper/util/PreviewUtils$WorkspacePreviewCallback;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/customization/picker/grid/GridOptionPreviewer$GridOptionSurfaceHolderCallback;->this$0:Lcom/android/customization/picker/grid/GridOptionPreviewer;

    .line 2
    iget-object v0, v0, Lcom/android/customization/picker/grid/GridOptionPreviewer;->mGridManager:Lcom/android/customization/model/grid/GridOptionsManager;

    .line 3
    invoke-static {p1}, Lcom/android/wallpaper/util/SurfaceViewUtils;->createSurfaceViewRequest(Landroid/view/SurfaceView;)Landroid/os/Bundle;

    move-result-object p1

    iget-object p0, p0, Lcom/android/customization/picker/grid/GridOptionPreviewer$GridOptionSurfaceHolderCallback;->this$0:Lcom/android/customization/picker/grid/GridOptionPreviewer;

    .line 4
    iget-object p0, p0, Lcom/android/customization/picker/grid/GridOptionPreviewer;->mGridOption:Lcom/android/customization/model/grid/GridOption;

    .line 5
    iget-object p0, p0, Lcom/android/customization/model/grid/GridOption;->name:Ljava/lang/String;

    .line 6
    iget-object v0, v0, Lcom/android/customization/model/grid/GridOptionsManager;->mProvider:Lcom/android/customization/model/grid/LauncherGridOptionsProvider;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "name"

    .line 7
    invoke-virtual {p1, v1, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    iget-object p0, v0, Lcom/android/customization/model/grid/LauncherGridOptionsProvider;->mPreviewUtils:Lcom/android/wallpaper/util/PreviewUtils;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    sget-object v0, Lcom/android/wallpaper/util/PreviewUtils;->sExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1, p2}, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/util/PreviewUtils;Landroid/os/Bundle;Lcom/android/wallpaper/util/PreviewUtils$WorkspacePreviewCallback;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/customization/picker/grid/GridOptionPreviewer$GridOptionSurfaceHolderCallback;->this$0:Lcom/android/customization/picker/grid/GridOptionPreviewer;

    .line 2
    iget-object v0, v0, Lcom/android/customization/picker/grid/GridOptionPreviewer;->mGridOption:Lcom/android/customization/model/grid/GridOption;

    if-eqz v0, :cond_0

    .line 3
    invoke-super {p0, p1}, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->surfaceCreated(Landroid/view/SurfaceHolder;)V

    :cond_0
    return-void
.end method
