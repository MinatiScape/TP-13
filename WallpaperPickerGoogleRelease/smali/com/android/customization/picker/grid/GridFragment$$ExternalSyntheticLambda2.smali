.class public final synthetic Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x5

    iput v0, p0, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Landroid/provider/DeviceConfig$Properties;)V
    .locals 1

    const/4 v0, 0x6

    iput v0, p0, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/customization/model/grid/GridOption;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/customization/model/grid/GridSectionController;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/customization/picker/grid/GridFragment;)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/CustomizationPickerFragment;)V
    .locals 1

    const/4 v0, 0x3

    iput v0, p0, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x4

    iput v0, p0, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 3

    iget v0, p0, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;->$r8$classId:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_1

    :pswitch_0
    iget-object p0, p0, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    check-cast p1, Lcom/android/wallpaper/model/WallpaperInfo;

    sget v0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;->$r8$clinit:I

    .line 1
    invoke-virtual {p1, p0}, Lcom/android/wallpaper/model/WallpaperInfo;->getCollectionId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "unlock_additionals_header"

    .line 2
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    xor-int/2addr p0, v1

    return p0

    .line 3
    :pswitch_1
    iget-object p0, p0, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    check-cast p1, Lcom/android/wallpaper/model/WallpaperInfo;

    sget v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->$r8$clinit:I

    .line 4
    invoke-virtual {p1}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    .line 5
    :pswitch_2
    iget-object p0, p0, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/wallpaper/picker/CustomizationPickerFragment;

    check-cast p1, Lcom/android/wallpaper/model/CustomizationSectionController;

    sget v0, Lcom/android/wallpaper/picker/CustomizationPickerFragment;->$r8$clinit:I

    .line 6
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-interface {p1, p0}, Lcom/android/wallpaper/model/CustomizationSectionController;->isAvailable(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    .line 7
    :cond_0
    invoke-interface {p1}, Lcom/android/wallpaper/model/CustomizationSectionController;->release()V

    .line 8
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Section is not available: "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "CustomizationPickerFragment"

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v1, v2

    :goto_0
    return v1

    .line 9
    :pswitch_3
    iget-object p0, p0, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/customization/picker/grid/GridFragment;

    check-cast p1, Lcom/android/customization/model/grid/GridOption;

    sget v0, Lcom/android/customization/picker/grid/GridFragment;->$r8$clinit:I

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    iget-boolean p0, p1, Lcom/android/customization/model/grid/GridOption;->mIsCurrent:Z

    return p0

    .line 11
    :pswitch_4
    iget-object p0, p0, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/customization/model/grid/GridSectionController;

    check-cast p1, Lcom/android/customization/model/grid/GridOption;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    iget-boolean p0, p1, Lcom/android/customization/model/grid/GridOption;->mIsCurrent:Z

    return p0

    .line 13
    :pswitch_5
    iget-object p0, p0, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/customization/model/grid/GridOption;

    check-cast p1, Lcom/android/customization/model/grid/GridOption;

    sget v0, Lcom/android/customization/picker/grid/GridFragment;->$r8$clinit:I

    .line 14
    invoke-virtual {p1, p0}, Lcom/android/customization/model/grid/GridOption;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    .line 15
    :goto_1
    iget-object p0, p0, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    check-cast p0, Landroid/provider/DeviceConfig$Properties;

    check-cast p1, Ljava/lang/String;

    .line 16
    invoke-virtual {p0, p1, v2}, Landroid/provider/DeviceConfig$Properties;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
