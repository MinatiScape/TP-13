.class public final synthetic Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/android/wallpaper/util/WallpaperConnection;

.field public final synthetic f$1:Landroid/app/WallpaperColors;

.field public final synthetic f$2:I


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/util/WallpaperConnection;Landroid/app/WallpaperColors;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$0:Lcom/android/wallpaper/util/WallpaperConnection;

    iput-object p2, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$1:Landroid/app/WallpaperColors;

    iput p3, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$2:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$0:Lcom/android/wallpaper/util/WallpaperConnection;

    iget-object v1, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$1:Landroid/app/WallpaperColors;

    iget p0, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;->f$2:I

    invoke-static {v0, v1, p0}, Lcom/android/wallpaper/util/WallpaperConnection;->$r8$lambda$1nxmYJiT3qROc-bA69duWP3-R9s(Lcom/android/wallpaper/util/WallpaperConnection;Landroid/app/WallpaperColors;I)V

    return-void
.end method
