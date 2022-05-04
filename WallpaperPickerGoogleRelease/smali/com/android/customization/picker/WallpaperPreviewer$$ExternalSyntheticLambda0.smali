.class public final synthetic Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/widget/WallpaperColorsLoader$Callback;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Lcom/android/customization/picker/WallpaperPreviewer$WallpaperColorsListener;


# direct methods
.method public synthetic constructor <init>(Lcom/android/customization/picker/WallpaperPreviewer$WallpaperColorsListener;I)V
    .locals 0

    iput p2, p0, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda0;->f$0:Lcom/android/customization/picker/WallpaperPreviewer$WallpaperColorsListener;

    return-void
.end method


# virtual methods
.method public final onLoaded(Landroid/app/WallpaperColors;)V
    .locals 1

    iget v0, p0, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda0;->$r8$classId:I

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    iget-object p0, p0, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda0;->f$0:Lcom/android/customization/picker/WallpaperPreviewer$WallpaperColorsListener;

    invoke-interface {p0, p1}, Lcom/android/customization/picker/WallpaperPreviewer$WallpaperColorsListener;->onWallpaperColorsChanged(Landroid/app/WallpaperColors;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
