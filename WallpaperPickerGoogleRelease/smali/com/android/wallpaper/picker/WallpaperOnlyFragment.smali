.class public Lcom/android/wallpaper/picker/WallpaperOnlyFragment;
.super Lcom/android/wallpaper/picker/CustomizationPickerFragment;
.source "SourceFile"


# static fields
.field public static final synthetic $r8$clinit:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/picker/CustomizationPickerFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public getAvailableSections(Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/CustomizationSectionController<",
            "*>;>;)",
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/CustomizationSectionController<",
            "*>;>;"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    move-result-object p1

    sget-object v0, Lcom/android/wallpaper/picker/WallpaperOnlyFragment$$ExternalSyntheticLambda0;->INSTANCE:Lcom/android/wallpaper/picker/WallpaperOnlyFragment$$ExternalSyntheticLambda0;

    .line 2
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object p1

    .line 3
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    .line 4
    invoke-super {p0, p1}, Lcom/android/wallpaper/picker/CustomizationPickerFragment;->getAvailableSections(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public getDefaultTitle()Ljava/lang/CharSequence;
    .locals 1

    const v0, 0x7f110141

    .line 1
    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
