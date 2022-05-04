.class public final synthetic Lcom/android/customization/model/themedicon/ThemedIconSectionController$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/picker/SectionView$SectionViewListener;
.implements Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider$FetchThemedIconEnabledCallback;


# instance fields
.field public final synthetic f$0:Lcom/android/customization/model/themedicon/ThemedIconSectionController;


# direct methods
.method public synthetic constructor <init>(Lcom/android/customization/model/themedicon/ThemedIconSectionController;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/customization/model/themedicon/ThemedIconSectionController$$ExternalSyntheticLambda0;->f$0:Lcom/android/customization/model/themedicon/ThemedIconSectionController;

    return-void
.end method


# virtual methods
.method public onViewActivated(Landroid/content/Context;Z)V
    .locals 2

    iget-object p0, p0, Lcom/android/customization/model/themedicon/ThemedIconSectionController$$ExternalSyntheticLambda0;->f$0:Lcom/android/customization/model/themedicon/ThemedIconSectionController;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    if-nez p1, :cond_0

    goto :goto_0

    .line 1
    :cond_0
    iget-object p1, p0, Lcom/android/customization/model/themedicon/ThemedIconSectionController;->mThemedIconOptionsProvider:Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;

    .line 2
    iget-object v0, p1, Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/android/customization/model/color/ColorCustomizationManager$$ExternalSyntheticLambda0;

    invoke-direct {v1, p1, p2}, Lcom/android/customization/model/color/ColorCustomizationManager$$ExternalSyntheticLambda0;-><init>(Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;Z)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 3
    iget-object p0, p0, Lcom/android/customization/model/themedicon/ThemedIconSectionController;->mWorkspaceViewModel:Lcom/android/wallpaper/model/WorkspaceViewModel;

    .line 4
    iget-object p0, p0, Lcom/android/wallpaper/model/WorkspaceViewModel;->updateWorkspace$delegate:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/lifecycle/MutableLiveData;

    .line 5
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/lifecycle/MutableLiveData;->setValue(Ljava/lang/Object;)V

    :goto_0
    return-void
.end method
