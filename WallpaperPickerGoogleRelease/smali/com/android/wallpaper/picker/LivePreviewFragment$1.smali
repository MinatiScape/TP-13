.class public Lcom/android/wallpaper/picker/LivePreviewFragment$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/util/WallpaperSurfaceCallback$SurfaceListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/picker/LivePreviewFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/LivePreviewFragment;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/LivePreviewFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$1;->this$0:Lcom/android/wallpaper/picker/LivePreviewFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSurfaceCreated()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$1;->this$0:Lcom/android/wallpaper/picker/LivePreviewFragment;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/wallpaper/picker/LivePreviewFragment;->previewLiveWallpaper(Landroid/widget/ImageView;)V

    return-void
.end method
