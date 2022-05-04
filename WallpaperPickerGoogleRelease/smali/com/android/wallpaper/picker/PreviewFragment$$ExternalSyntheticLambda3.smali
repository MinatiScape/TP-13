.class public final synthetic Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Supplier;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/android/customization/model/color/ColorSectionController;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda3;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda3;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/PreviewFragment;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda3;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda3;->f$0:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 1

    iget v0, p0, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda3;->$r8$classId:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda3;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/wallpaper/picker/PreviewFragment;

    .line 1
    iget-boolean p0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mViewAsHome:Z

    xor-int/lit8 p0, p0, 0x1

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    .line 2
    :goto_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda3;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/customization/model/color/ColorSectionController;

    .line 3
    iget-object p0, p0, Lcom/android/customization/model/color/ColorSectionController;->mColorManager:Lcom/android/customization/model/color/ColorCustomizationManager;

    invoke-virtual {p0}, Lcom/android/customization/model/color/ColorCustomizationManager;->getCurrentColorSource()Ljava/lang/String;

    move-result-object p0

    const-string v0, "preset"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
