.class public Lcom/android/customization/model/color/ColorSectionController$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener<",
        "Lcom/android/customization/model/color/ColorOption;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/customization/model/color/ColorSectionController;


# direct methods
.method public constructor <init>(Lcom/android/customization/model/color/ColorSectionController;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/customization/model/color/ColorSectionController$1;->this$0:Lcom/android/customization/model/color/ColorSectionController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    if-eqz p1, :cond_0

    const-string p0, "ColorSectionController"

    const-string v0, "Error loading theme bundles"

    .line 1
    invoke-static {p0, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    return-void
.end method

.method public onOptionsLoaded(Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/customization/model/color/ColorOption;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/customization/model/color/ColorSectionController$1;->this$0:Lcom/android/customization/model/color/ColorSectionController;

    .line 2
    iget-object v0, v0, Lcom/android/customization/model/color/ColorSectionController;->mWallpaperColorOptions:Ljava/util/List;

    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    iget-object v0, p0, Lcom/android/customization/model/color/ColorSectionController$1;->this$0:Lcom/android/customization/model/color/ColorSectionController;

    .line 5
    iget-object v0, v0, Lcom/android/customization/model/color/ColorSectionController;->mPresetColorOptions:Ljava/util/List;

    .line 6
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 7
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/customization/model/color/ColorOption;

    .line 8
    instance-of v1, v0, Lcom/android/customization/model/color/ColorSeedOption;

    if-eqz v1, :cond_1

    .line 9
    iget-object v1, p0, Lcom/android/customization/model/color/ColorSectionController$1;->this$0:Lcom/android/customization/model/color/ColorSectionController;

    .line 10
    iget-object v1, v1, Lcom/android/customization/model/color/ColorSectionController;->mWallpaperColorOptions:Ljava/util/List;

    .line 11
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 12
    :cond_1
    instance-of v1, v0, Lcom/android/customization/model/color/ColorBundle;

    if-eqz v1, :cond_0

    .line 13
    iget-object v1, p0, Lcom/android/customization/model/color/ColorSectionController$1;->this$0:Lcom/android/customization/model/color/ColorSectionController;

    .line 14
    iget-object v1, v1, Lcom/android/customization/model/color/ColorSectionController;->mPresetColorOptions:Ljava/util/List;

    .line 15
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 16
    :cond_2
    iget-object p1, p0, Lcom/android/customization/model/color/ColorSectionController$1;->this$0:Lcom/android/customization/model/color/ColorSectionController;

    .line 17
    iget-object v0, p1, Lcom/android/customization/model/color/ColorSectionController;->mWallpaperColorOptions:Ljava/util/List;

    .line 18
    iget-object v1, p1, Lcom/android/customization/model/color/ColorSectionController;->mPresetColorOptions:Ljava/util/List;

    .line 19
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/Iterable;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v5, 0x1

    aput-object v1, v3, v5

    move v5, v4

    :goto_1
    if-ge v5, v2, :cond_3

    .line 20
    aget-object v6, v3, v5

    .line 21
    invoke-static {v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 22
    :cond_3
    new-instance v2, Lcom/google/common/collect/FluentIterable$3;

    invoke-direct {v2, v3}, Lcom/google/common/collect/FluentIterable$3;-><init>([Ljava/lang/Iterable;)V

    .line 23
    invoke-static {v2}, Lcom/google/common/collect/Lists;->newArrayList(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/customization/model/color/ColorOption;

    .line 24
    iget-object v5, p1, Lcom/android/customization/model/color/ColorSectionController;->mColorManager:Lcom/android/customization/model/color/ColorCustomizationManager;

    invoke-virtual {v3, v5}, Lcom/android/customization/model/color/ColorOption;->isActive(Lcom/android/customization/model/CustomizationManager;)Z

    move-result v5

    if-eqz v5, :cond_4

    goto :goto_2

    :cond_5
    const/4 v3, 0x0

    :goto_2
    if-nez v3, :cond_7

    .line 25
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 26
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/customization/model/color/ColorOption;

    goto :goto_3

    .line 27
    :cond_6
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/customization/model/color/ColorOption;

    :goto_3
    move-object v3, v0

    .line 28
    :cond_7
    iput-object v3, p1, Lcom/android/customization/model/color/ColorSectionController;->mSelectedColor:Lcom/android/customization/model/color/ColorOption;

    .line 29
    iget-object p1, p0, Lcom/android/customization/model/color/ColorSectionController$1;->this$0:Lcom/android/customization/model/color/ColorSectionController;

    .line 30
    iget-object p1, p1, Lcom/android/customization/model/color/ColorSectionController;->mTabLayout:Lcom/android/wallpaper/widget/SeparatedTabLayout;

    .line 31
    new-instance v0, Lcom/android/wallpaper/util/DiskBasedLogger$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/util/DiskBasedLogger$$ExternalSyntheticLambda1;-><init>(Lcom/android/customization/model/color/ColorSectionController$1;)V

    invoke-virtual {p1, v0}, Landroid/widget/HorizontalScrollView;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
