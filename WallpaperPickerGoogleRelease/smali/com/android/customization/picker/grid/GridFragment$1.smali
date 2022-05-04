.class public Lcom/android/customization/picker/grid/GridFragment$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/customization/model/CustomizationManager$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/customization/picker/grid/GridFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/customization/picker/grid/GridFragment;


# direct methods
.method public constructor <init>(Lcom/android/customization/picker/grid/GridFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/customization/picker/grid/GridFragment$1;->this$0:Lcom/android/customization/picker/grid/GridFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/customization/picker/grid/GridFragment$1;->this$0:Lcom/android/customization/picker/grid/GridFragment;

    .line 2
    iget-object p1, p1, Lcom/android/customization/picker/grid/GridFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    .line 3
    invoke-virtual {p1}, Lcom/android/wallpaper/widget/BottomActionBar;->enableActions()V

    .line 4
    iget-object p1, p0, Lcom/android/customization/picker/grid/GridFragment$1;->this$0:Lcom/android/customization/picker/grid/GridFragment;

    .line 5
    iget-object p1, p1, Lcom/android/customization/picker/grid/GridFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    const/16 v0, 0x8

    .line 6
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 7
    iget-object p0, p0, Lcom/android/customization/picker/grid/GridFragment$1;->this$0:Lcom/android/customization/picker/grid/GridFragment;

    .line 8
    iget-object p0, p0, Lcom/android/customization/picker/grid/GridFragment;->mGridOptionViewModel:Lcom/android/customization/model/grid/GridOptionViewModel;

    const/4 p1, 0x0

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/customization/model/grid/GridOptionViewModel;->setBottomActionBarVisible(Z)V

    return-void
.end method

.method public onSuccess()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/customization/picker/grid/GridFragment$1;->this$0:Lcom/android/customization/picker/grid/GridFragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f110038

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 2
    iget-object v0, p0, Lcom/android/customization/picker/grid/GridFragment$1;->this$0:Lcom/android/customization/picker/grid/GridFragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f01001c

    const v2, 0x7f01001d

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 3
    iget-object v0, p0, Lcom/android/customization/picker/grid/GridFragment$1;->this$0:Lcom/android/customization/picker/grid/GridFragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 4
    iget-object p0, p0, Lcom/android/customization/picker/grid/GridFragment$1;->this$0:Lcom/android/customization/picker/grid/GridFragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Landroidx/cardview/R$style;->launchHome(Landroid/content/Context;)V

    return-void
.end method
