.class public final synthetic Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;


# instance fields
.field public final synthetic f$0:Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;

.field public final synthetic f$1:Landroid/app/Activity;

.field public final synthetic f$2:Landroid/util/Size;

.field public final synthetic f$3:Landroid/app/WallpaperManager;

.field public final synthetic f$4:Lcom/android/wallpaper/model/WallpaperInfo;

.field public final synthetic f$5:Lcom/android/wallpaper/module/WallpaperPersister;

.field public final synthetic f$6:Lcom/android/wallpaper/asset/Asset;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;Landroid/app/Activity;Landroid/util/Size;Landroid/app/WallpaperManager;Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/module/WallpaperPersister;Lcom/android/wallpaper/asset/Asset;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda0;->f$0:Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda0;->f$1:Landroid/app/Activity;

    iput-object p3, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda0;->f$2:Landroid/util/Size;

    iput-object p4, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda0;->f$3:Landroid/app/WallpaperManager;

    iput-object p5, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda0;->f$4:Lcom/android/wallpaper/model/WallpaperInfo;

    iput-object p6, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda0;->f$5:Lcom/android/wallpaper/module/WallpaperPersister;

    iput-object p7, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda0;->f$6:Lcom/android/wallpaper/asset/Asset;

    return-void
.end method


# virtual methods
.method public final onDimensionsDecoded(Landroid/graphics/Point;)V
    .locals 13

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda0;->f$0:Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;

    iget-object v2, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda0;->f$1:Landroid/app/Activity;

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda0;->f$2:Landroid/util/Size;

    iget-object v3, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda0;->f$3:Landroid/app/WallpaperManager;

    iget-object v4, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda0;->f$4:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v5, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda0;->f$5:Lcom/android/wallpaper/module/WallpaperPersister;

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda0;->f$6:Lcom/android/wallpaper/asset/Asset;

    sget v6, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;->$r8$clinit:I

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1
    new-instance v6, Landroid/util/Size;

    iget v7, p1, Landroid/graphics/Point;->x:I

    iget p1, p1, Landroid/graphics/Point;->y:I

    invoke-direct {v6, v7, p1}, Landroid/util/Size;-><init>(II)V

    .line 2
    sget-object p1, Lwireless/android/learning/acmi/micropaper/frontend/MicropaperFrontend;->MICROPAPER_SERVICE:Landroid/content/ComponentName;

    .line 3
    new-instance p1, Landroid/net/Uri$Builder;

    invoke-direct {p1}, Landroid/net/Uri$Builder;-><init>()V

    const-string v7, "content"

    .line 4
    invoke-virtual {p1, v7}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v7, "com.google.pixel.dynamicwallpapers.parameters"

    .line 5
    invoke-virtual {p1, v7}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    .line 6
    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    .line 7
    new-instance v7, Landroid/os/Bundle;

    invoke-direct {v7}, Landroid/os/Bundle;-><init>()V

    const-string v8, "EXTRA_IMAGE_SIZE"

    .line 8
    invoke-virtual {v7, v8, v6}, Landroid/os/Bundle;->putSize(Ljava/lang/String;Landroid/util/Size;)V

    const-string v6, "EXTRA_SURFACE_SIZE"

    .line 9
    invoke-virtual {v7, v6, v0}, Landroid/os/Bundle;->putSize(Ljava/lang/String;Landroid/util/Size;)V

    .line 10
    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const/4 v8, 0x0

    const-string v9, "PROVIDER_GET_PREVIEW_PARAMETERS"

    invoke-virtual {v6, p1, v9, v8, v7}, Landroid/content/ContentResolver;->call(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object p1

    const/4 v8, 0x0

    const-string v6, "EXTRA_PREVIEW_IS_PLAYING"

    .line 11
    invoke-virtual {p1, v6, v8}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    const-string v7, "EXTRA_CROP_RECT"

    .line 12
    invoke-virtual {p1, v7}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/graphics/Rect;

    .line 13
    invoke-static {v6, p1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object p1

    .line 14
    iget-object v6, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    .line 15
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p1, Landroid/graphics/Rect;

    if-eqz v6, :cond_1

    .line 16
    invoke-virtual {v3}, Landroid/app/WallpaperManager;->getWallpaperInfo()Landroid/app/WallpaperInfo;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 p0, 0x2

    .line 17
    invoke-virtual {v3, p0}, Landroid/app/WallpaperManager;->getWallpaperId(I)I

    move-result p0

    if-gez p0, :cond_0

    .line 18
    invoke-static {v2, v3, v8}, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;->setMicropaperComponentAndReturn(Landroid/app/Activity;Landroid/app/WallpaperManager;Z)V

    goto :goto_0

    .line 19
    :cond_0
    iget-object p0, v1, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;->mWallpaperSetter:Lcom/android/wallpaper/module/WallpaperSetter;

    .line 20
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    .line 21
    iget-object v0, v1, Landroidx/fragment/app/Fragment;->mFragmentManager:Landroidx/fragment/app/FragmentManager;

    .line 22
    new-instance v4, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$$ExternalSyntheticLambda0;

    invoke-direct {v4, v1, v2, v3}, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$$ExternalSyntheticLambda0;-><init>(Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;Landroid/app/Activity;Landroid/app/WallpaperManager;)V

    const/4 v1, 0x1

    .line 23
    invoke-virtual {p0, p1, v0, v4, v1}, Lcom/android/wallpaper/module/WallpaperSetter;->requestDestination(Landroid/app/Activity;Landroidx/fragment/app/FragmentManager;Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$Listener;Z)V

    goto :goto_0

    .line 24
    :cond_1
    new-instance v6, Lcom/android/wallpaper/model/ImageWallpaperInfo;

    invoke-virtual {v4}, Lcom/android/wallpaper/model/WallpaperInfo;->getUri()Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v6, v3}, Lcom/android/wallpaper/model/ImageWallpaperInfo;-><init>(Landroid/net/Uri;)V

    const/high16 v3, 0x3f800000    # 1.0f

    .line 25
    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, v3

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    div-float v7, v0, v3

    .line 26
    new-instance v9, Landroid/graphics/Rect;

    iget v0, p1, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    mul-float/2addr v0, v7

    float-to-int v0, v0

    iget v3, p1, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    mul-float/2addr v3, v7

    float-to-int v3, v3

    iget v4, p1, Landroid/graphics/Rect;->right:I

    int-to-float v4, v4

    mul-float/2addr v4, v7

    float-to-int v4, v4

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    int-to-float p1, p1

    mul-float/2addr p1, v7

    float-to-int p1, p1

    invoke-direct {v9, v0, v3, v4, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 27
    iget-object p1, v1, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;->mWallpaperSetter:Lcom/android/wallpaper/module/WallpaperSetter;

    .line 28
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v10

    .line 29
    iget-object v11, v1, Landroidx/fragment/app/Fragment;->mFragmentManager:Landroidx/fragment/app/FragmentManager;

    .line 30
    new-instance v12, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda2;

    move-object v0, v12

    move-object v3, v5

    move-object v4, v6

    move-object v5, p0

    move-object v6, v9

    invoke-direct/range {v0 .. v7}, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda2;-><init>(Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;Landroid/app/Activity;Lcom/android/wallpaper/module/WallpaperPersister;Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/asset/Asset;Landroid/graphics/Rect;F)V

    .line 31
    invoke-virtual {p1, v10, v11, v12, v8}, Lcom/android/wallpaper/module/WallpaperSetter;->requestDestination(Landroid/app/Activity;Landroidx/fragment/app/FragmentManager;Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$Listener;Z)V

    :goto_0
    return-void
.end method
