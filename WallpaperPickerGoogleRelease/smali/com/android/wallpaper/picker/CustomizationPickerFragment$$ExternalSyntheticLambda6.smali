.class public final synthetic Lcom/android/wallpaper/picker/CustomizationPickerFragment$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# static fields
.field public static final synthetic INSTANCE:Lcom/android/wallpaper/picker/CustomizationPickerFragment$$ExternalSyntheticLambda6;


# direct methods
.method public static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/android/wallpaper/picker/CustomizationPickerFragment$$ExternalSyntheticLambda6;

    invoke-direct {v0}, Lcom/android/wallpaper/picker/CustomizationPickerFragment$$ExternalSyntheticLambda6;-><init>()V

    sput-object v0, Lcom/android/wallpaper/picker/CustomizationPickerFragment$$ExternalSyntheticLambda6;->INSTANCE:Lcom/android/wallpaper/picker/CustomizationPickerFragment$$ExternalSyntheticLambda6;

    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/android/wallpaper/model/CustomizationSectionController;

    invoke-interface {p1}, Lcom/android/wallpaper/model/CustomizationSectionController;->release()V

    return-void
.end method
