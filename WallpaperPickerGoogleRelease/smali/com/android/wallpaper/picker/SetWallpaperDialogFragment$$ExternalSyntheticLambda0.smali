.class public final synthetic Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;I)V
    .locals 1

    iput p2, p0, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$$ExternalSyntheticLambda0;->$r8$classId:I

    const/4 v0, 0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    iget p1, p0, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$$ExternalSyntheticLambda0;->$r8$classId:I

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;

    sget p1, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;->$r8$clinit:I

    const/4 p1, 0x1

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;->onSetWallpaperButtonClick(I)V

    return-void

    .line 2
    :pswitch_1
    iget-object p0, p0, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;

    sget p1, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;->$r8$clinit:I

    const/4 p1, 0x0

    .line 3
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;->onSetWallpaperButtonClick(I)V

    return-void

    .line 4
    :goto_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;

    sget p1, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;->$r8$clinit:I

    const/4 p1, 0x2

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;->onSetWallpaperButtonClick(I)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
