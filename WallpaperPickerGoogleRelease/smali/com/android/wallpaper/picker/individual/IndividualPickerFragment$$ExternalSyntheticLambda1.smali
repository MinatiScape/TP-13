.class public final synthetic Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Predicate;


# static fields
.field public static final synthetic INSTANCE:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$$ExternalSyntheticLambda1;


# direct methods
.method public static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$$ExternalSyntheticLambda1;

    invoke-direct {v0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$$ExternalSyntheticLambda1;-><init>()V

    sput-object v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$$ExternalSyntheticLambda1;->INSTANCE:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$$ExternalSyntheticLambda1;

    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 0

    check-cast p1, Lcom/android/wallpaper/model/WallpaperInfo;

    sget p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->$r8$clinit:I

    .line 1
    invoke-virtual {p1}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperId()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
