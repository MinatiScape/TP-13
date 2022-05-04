.class public Lcom/android/customization/model/grid/GridSectionController;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/model/CustomizationSectionController;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/wallpaper/model/CustomizationSectionController<",
        "Lcom/android/customization/picker/grid/GridSectionView;",
        ">;"
    }
.end annotation


# instance fields
.field public final mGridOptionsManager:Lcom/android/customization/model/grid/GridOptionsManager;

.field public final mSectionNavigationController:Lcom/android/wallpaper/model/CustomizationSectionController$CustomizationSectionNavigationController;


# direct methods
.method public constructor <init>(Lcom/android/customization/model/grid/GridOptionsManager;Lcom/android/wallpaper/model/CustomizationSectionController$CustomizationSectionNavigationController;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/customization/model/grid/GridSectionController;->mGridOptionsManager:Lcom/android/customization/model/grid/GridOptionsManager;

    .line 3
    iput-object p2, p0, Lcom/android/customization/model/grid/GridSectionController;->mSectionNavigationController:Lcom/android/wallpaper/model/CustomizationSectionController$CustomizationSectionNavigationController;

    return-void
.end method


# virtual methods
.method public createView(Landroid/content/Context;)Lcom/android/wallpaper/picker/SectionView;
    .locals 5

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0d0072

    const/4 v1, 0x0

    .line 2
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/customization/picker/grid/GridSectionView;

    const v0, 0x7f0a010e

    .line 3
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v2, 0x7f0a010f

    .line 4
    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 5
    iget-object v3, p0, Lcom/android/customization/model/grid/GridSectionController;->mGridOptionsManager:Lcom/android/customization/model/grid/GridOptionsManager;

    new-instance v4, Lcom/android/customization/model/grid/GridSectionController$1;

    invoke-direct {v4, p0, v0, v2}, Lcom/android/customization/model/grid/GridSectionController$1;-><init>(Lcom/android/customization/model/grid/GridSectionController;Landroid/widget/TextView;Landroid/view/View;)V

    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    new-instance v0, Lcom/android/customization/model/grid/GridOptionsManager$FetchTask;

    iget-object v2, v3, Lcom/android/customization/model/grid/GridOptionsManager;->mProvider:Lcom/android/customization/model/grid/LauncherGridOptionsProvider;

    const/4 v3, 0x1

    invoke-direct {v0, v2, v4, v3, v1}, Lcom/android/customization/model/grid/GridOptionsManager$FetchTask;-><init>(Lcom/android/customization/model/grid/LauncherGridOptionsProvider;Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener;ZLcom/android/customization/model/grid/GridOptionsManager$1;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 7
    new-instance v0, Lcom/android/wallpaper/picker/AppbarFragment$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/picker/AppbarFragment$$ExternalSyntheticLambda0;-><init>(Lcom/android/customization/model/grid/GridSectionController;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p1
.end method

.method public isAvailable(Landroid/content/Context;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/customization/model/grid/GridSectionController;->mGridOptionsManager:Lcom/android/customization/model/grid/GridOptionsManager;

    .line 2
    iget-object p0, p0, Lcom/android/customization/model/grid/GridOptionsManager;->mProvider:Lcom/android/customization/model/grid/LauncherGridOptionsProvider;

    .line 3
    iget-object p0, p0, Lcom/android/customization/model/grid/LauncherGridOptionsProvider;->mPreviewUtils:Lcom/android/wallpaper/util/PreviewUtils;

    .line 4
    iget-object p0, p0, Lcom/android/wallpaper/util/PreviewUtils;->mProviderInfo:Landroid/content/pm/ProviderInfo;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
