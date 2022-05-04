.class public final synthetic Lcom/android/customization/widget/OptionSelectorController$1$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcom/android/customization/widget/OptionSelectorController$1;

.field public final synthetic f$1:Lcom/android/customization/model/CustomizationOption;


# direct methods
.method public synthetic constructor <init>(Lcom/android/customization/widget/OptionSelectorController$1;Lcom/android/customization/model/CustomizationOption;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/customization/widget/OptionSelectorController$1$$ExternalSyntheticLambda0;->f$0:Lcom/android/customization/widget/OptionSelectorController$1;

    iput-object p2, p0, Lcom/android/customization/widget/OptionSelectorController$1$$ExternalSyntheticLambda0;->f$1:Lcom/android/customization/model/CustomizationOption;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    iget-object p1, p0, Lcom/android/customization/widget/OptionSelectorController$1$$ExternalSyntheticLambda0;->f$0:Lcom/android/customization/widget/OptionSelectorController$1;

    iget-object p0, p0, Lcom/android/customization/widget/OptionSelectorController$1$$ExternalSyntheticLambda0;->f$1:Lcom/android/customization/model/CustomizationOption;

    .line 1
    iget-object p1, p1, Lcom/android/customization/widget/OptionSelectorController$1;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    invoke-virtual {p1, p0}, Lcom/android/customization/widget/OptionSelectorController;->setSelectedOption(Lcom/android/customization/model/CustomizationOption;)V

    return-void
.end method
