.class public final synthetic Lcom/android/customization/model/color/ColorSectionController$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/lifecycle/Observer;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Lcom/android/customization/model/color/ColorSectionController;


# direct methods
.method public synthetic constructor <init>(Lcom/android/customization/model/color/ColorSectionController;I)V
    .locals 0

    iput p2, p0, Lcom/android/customization/model/color/ColorSectionController$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/customization/model/color/ColorSectionController$$ExternalSyntheticLambda0;->f$0:Lcom/android/customization/model/color/ColorSectionController;

    return-void
.end method


# virtual methods
.method public final onChanged(Ljava/lang/Object;)V
    .locals 2

    iget v0, p0, Lcom/android/customization/model/color/ColorSectionController$$ExternalSyntheticLambda0;->$r8$classId:I

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p0, p0, Lcom/android/customization/model/color/ColorSectionController$$ExternalSyntheticLambda0;->f$0:Lcom/android/customization/model/color/ColorSectionController;

    check-cast p1, Landroid/app/WallpaperColors;

    .line 1
    iput-object p1, p0, Lcom/android/customization/model/color/ColorSectionController;->mHomeWallpaperColors:Landroid/app/WallpaperColors;

    .line 2
    iput-boolean v1, p0, Lcom/android/customization/model/color/ColorSectionController;->mHomeWallpaperColorsReady:Z

    .line 3
    invoke-virtual {p0}, Lcom/android/customization/model/color/ColorSectionController;->maybeLoadColors()V

    return-void

    .line 4
    :goto_0
    iget-object p0, p0, Lcom/android/customization/model/color/ColorSectionController$$ExternalSyntheticLambda0;->f$0:Lcom/android/customization/model/color/ColorSectionController;

    check-cast p1, Landroid/app/WallpaperColors;

    .line 5
    iput-object p1, p0, Lcom/android/customization/model/color/ColorSectionController;->mLockWallpaperColors:Landroid/app/WallpaperColors;

    .line 6
    iput-boolean v1, p0, Lcom/android/customization/model/color/ColorSectionController;->mLockWallpaperColorsReady:Z

    .line 7
    invoke-virtual {p0}, Lcom/android/customization/model/color/ColorSectionController;->maybeLoadColors()V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
