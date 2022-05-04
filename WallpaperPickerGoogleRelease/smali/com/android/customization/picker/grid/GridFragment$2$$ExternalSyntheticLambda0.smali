.class public final synthetic Lcom/android/customization/picker/grid/GridFragment$2$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/customization/widget/OptionSelectorController$OptionSelectedListener;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/android/customization/model/color/ColorSectionController;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/customization/picker/grid/GridFragment$2$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/customization/picker/grid/GridFragment$2$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/customization/picker/grid/GridFragment$2;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/customization/picker/grid/GridFragment$2$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/customization/picker/grid/GridFragment$2$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onOptionSelected(Lcom/android/customization/model/CustomizationOption;)V
    .locals 6

    iget v0, p0, Lcom/android/customization/picker/grid/GridFragment$2$$ExternalSyntheticLambda0;->$r8$classId:I

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    iget-object p0, p0, Lcom/android/customization/picker/grid/GridFragment$2$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/customization/picker/grid/GridFragment$2;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1
    invoke-interface {p1}, Lcom/android/customization/model/CustomizationOption;->getTitle()Ljava/lang/String;

    move-result-object v0

    .line 2
    iget-object v1, p0, Lcom/android/customization/picker/grid/GridFragment$2;->this$0:Lcom/android/customization/picker/grid/GridFragment;

    .line 3
    iget-object v1, v1, Lcom/android/customization/picker/grid/GridFragment;->mGridManager:Lcom/android/customization/model/grid/GridOptionsManager;

    .line 4
    invoke-interface {p1, v1}, Lcom/android/customization/model/CustomizationOption;->isActive(Lcom/android/customization/model/CustomizationManager;)Z

    move-result v1

    if-eqz v1, :cond_0

    const v1, 0x7f1100f6

    goto :goto_0

    :cond_0
    const v1, 0x7f1100f8

    .line 5
    :goto_0
    iget-object v2, p0, Lcom/android/customization/picker/grid/GridFragment$2;->this$0:Lcom/android/customization/picker/grid/GridFragment;

    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    invoke-virtual {v2, v1, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 6
    iget-object v1, p0, Lcom/android/customization/picker/grid/GridFragment$2;->this$0:Lcom/android/customization/picker/grid/GridFragment;

    .line 7
    iget-object v1, v1, Lcom/android/customization/picker/grid/GridFragment;->mOptionsContainer:Landroidx/recyclerview/widget/RecyclerView;

    .line 8
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->announceForAccessibility(Ljava/lang/CharSequence;)V

    .line 9
    iget-object v0, p0, Lcom/android/customization/picker/grid/GridFragment$2;->this$0:Lcom/android/customization/picker/grid/GridFragment;

    invoke-static {v0, p1}, Lcom/android/customization/picker/grid/GridFragment;->access$800(Lcom/android/customization/picker/grid/GridFragment;Lcom/android/customization/model/CustomizationOption;)V

    .line 10
    iget-object p1, p0, Lcom/android/customization/picker/grid/GridFragment$2;->this$0:Lcom/android/customization/picker/grid/GridFragment;

    .line 11
    iget-object p1, p1, Lcom/android/customization/picker/grid/GridFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    .line 12
    invoke-virtual {p1, v5}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 13
    iget-object p0, p0, Lcom/android/customization/picker/grid/GridFragment$2;->this$0:Lcom/android/customization/picker/grid/GridFragment;

    .line 14
    iget-object p0, p0, Lcom/android/customization/picker/grid/GridFragment;->mGridOptionViewModel:Lcom/android/customization/model/grid/GridOptionViewModel;

    .line 15
    invoke-virtual {p0, v3}, Lcom/android/customization/model/grid/GridOptionViewModel;->setBottomActionBarVisible(Z)V

    return-void

    .line 16
    :goto_1
    iget-object p0, p0, Lcom/android/customization/picker/grid/GridFragment$2$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/customization/model/color/ColorSectionController;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    check-cast p1, Lcom/android/customization/model/color/ColorOption;

    .line 18
    iget-object v0, p0, Lcom/android/customization/model/color/ColorSectionController;->mSelectedColor:Lcom/android/customization/model/color/ColorOption;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_2

    .line 19
    :cond_1
    iput-object p1, p0, Lcom/android/customization/model/color/ColorSectionController;->mSelectedColor:Lcom/android/customization/model/color/ColorOption;

    .line 20
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    new-instance v0, Lcom/android/wallpaper/util/DiskBasedLogger$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/util/DiskBasedLogger$$ExternalSyntheticLambda1;-><init>(Lcom/android/customization/model/color/ColorSectionController;)V

    const-wide/16 v1, 0x64

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :goto_2
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
