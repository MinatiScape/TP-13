.class public Lcom/android/customization/model/themedicon/ThemedIconSectionController;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/model/CustomizationSectionController;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/wallpaper/model/CustomizationSectionController<",
        "Lcom/android/customization/picker/themedicon/ThemedIconSectionView;",
        ">;"
    }
.end annotation


# instance fields
.field public mSavedThemedIconEnabled:Z

.field public final mThemedIconOptionsProvider:Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;

.field public mThemedIconSectionView:Lcom/android/customization/picker/themedicon/ThemedIconSectionView;

.field public final mWorkspaceViewModel:Lcom/android/wallpaper/model/WorkspaceViewModel;


# direct methods
.method public constructor <init>(Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;Lcom/android/wallpaper/model/WorkspaceViewModel;Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/customization/model/themedicon/ThemedIconSectionController;->mSavedThemedIconEnabled:Z

    .line 3
    iput-object p1, p0, Lcom/android/customization/model/themedicon/ThemedIconSectionController;->mThemedIconOptionsProvider:Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;

    .line 4
    iput-object p2, p0, Lcom/android/customization/model/themedicon/ThemedIconSectionController;->mWorkspaceViewModel:Lcom/android/wallpaper/model/WorkspaceViewModel;

    if-eqz p3, :cond_0

    const-string p1, "SAVED_THEMED_ICON_ENABLED"

    .line 5
    invoke-virtual {p3, p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/android/customization/model/themedicon/ThemedIconSectionController;->mSavedThemedIconEnabled:Z

    :cond_0
    return-void
.end method


# virtual methods
.method public createView(Landroid/content/Context;)Lcom/android/wallpaper/picker/SectionView;
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0d00ed

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/customization/picker/themedicon/ThemedIconSectionView;

    iput-object p1, p0, Lcom/android/customization/model/themedicon/ThemedIconSectionController;->mThemedIconSectionView:Lcom/android/customization/picker/themedicon/ThemedIconSectionView;

    .line 2
    new-instance v0, Lcom/android/customization/model/themedicon/ThemedIconSectionController$$ExternalSyntheticLambda0;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/customization/model/themedicon/ThemedIconSectionController$$ExternalSyntheticLambda0;-><init>(Lcom/android/customization/model/themedicon/ThemedIconSectionController;I)V

    .line 3
    iput-object v0, p1, Lcom/android/wallpaper/picker/SectionView;->mSectionViewListener:Lcom/android/wallpaper/picker/SectionView$SectionViewListener;

    .line 4
    iget-object p1, p1, Lcom/android/customization/picker/themedicon/ThemedIconSectionView;->mSwitchView:Landroid/widget/Switch;

    .line 5
    iget-boolean v0, p0, Lcom/android/customization/model/themedicon/ThemedIconSectionController;->mSavedThemedIconEnabled:Z

    invoke-virtual {p1, v0}, Landroid/widget/Switch;->setChecked(Z)V

    .line 6
    iget-object p1, p0, Lcom/android/customization/model/themedicon/ThemedIconSectionController;->mThemedIconOptionsProvider:Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;

    new-instance v0, Lcom/android/customization/model/themedicon/ThemedIconSectionController$$ExternalSyntheticLambda0;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lcom/android/customization/model/themedicon/ThemedIconSectionController$$ExternalSyntheticLambda0;-><init>(Lcom/android/customization/model/themedicon/ThemedIconSectionController;I)V

    .line 7
    iget-object v1, p1, Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lcom/android/wallpaper/picker/ImagePreviewFragment$4$$ExternalSyntheticLambda0;

    invoke-direct {v2, p1, v0}, Lcom/android/wallpaper/picker/ImagePreviewFragment$4$$ExternalSyntheticLambda0;-><init>(Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider$FetchThemedIconEnabledCallback;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 8
    iget-object p0, p0, Lcom/android/customization/model/themedicon/ThemedIconSectionController;->mThemedIconSectionView:Lcom/android/customization/picker/themedicon/ThemedIconSectionView;

    return-object p0
.end method

.method public isAvailable(Landroid/content/Context;)Z
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_1

    .line 1
    iget-object p0, p0, Lcom/android/customization/model/themedicon/ThemedIconSectionController;->mThemedIconOptionsProvider:Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;

    .line 2
    iget-object p0, p0, Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;->mThemedIconUtils:Lcom/android/customization/model/themedicon/ThemedIconUtils;

    .line 3
    iget-object p0, p0, Lcom/android/customization/model/themedicon/ThemedIconUtils;->mProviderInfo:Landroid/content/pm/ProviderInfo;

    if-eqz p0, :cond_0

    move p0, v0

    goto :goto_0

    :cond_0
    move p0, v1

    :goto_0
    if-eqz p0, :cond_1

    goto :goto_1

    :cond_1
    move v0, v1

    :goto_1
    return v0
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/customization/model/themedicon/ThemedIconSectionController;->mThemedIconSectionView:Lcom/android/customization/picker/themedicon/ThemedIconSectionView;

    if-eqz p0, :cond_0

    .line 2
    iget-object p0, p0, Lcom/android/customization/picker/themedicon/ThemedIconSectionView;->mSwitchView:Landroid/widget/Switch;

    .line 3
    invoke-virtual {p0}, Landroid/widget/Switch;->isChecked()Z

    move-result p0

    const-string v0, "SAVED_THEMED_ICON_ENABLED"

    .line 4
    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    :cond_0
    return-void
.end method
