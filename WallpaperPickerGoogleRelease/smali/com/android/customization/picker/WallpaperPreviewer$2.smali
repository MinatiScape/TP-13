.class public Lcom/android/customization/picker/WallpaperPreviewer$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/util/WallpaperConnection$WallpaperConnectionListener;


# instance fields
.field public final synthetic this$0:Lcom/android/customization/picker/WallpaperPreviewer;


# direct methods
.method public constructor <init>(Lcom/android/customization/picker/WallpaperPreviewer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/customization/picker/WallpaperPreviewer$2;->this$0:Lcom/android/customization/picker/WallpaperPreviewer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onWallpaperColorsChanged(Landroid/app/WallpaperColors;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/customization/picker/WallpaperPreviewer$2;->this$0:Lcom/android/customization/picker/WallpaperPreviewer;

    .line 2
    iget-object p0, p0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaperColorsListener:Lcom/android/customization/picker/WallpaperPreviewer$WallpaperColorsListener;

    if-eqz p0, :cond_0

    .line 3
    invoke-interface {p0, p1}, Lcom/android/customization/picker/WallpaperPreviewer$WallpaperColorsListener;->onWallpaperColorsChanged(Landroid/app/WallpaperColors;)V

    :cond_0
    return-void
.end method
