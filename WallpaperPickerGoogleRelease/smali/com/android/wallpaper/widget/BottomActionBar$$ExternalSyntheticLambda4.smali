.class public final synthetic Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroid/os/Bundle;)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda4;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda4;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/systemui/unfold/util/ScopedUnfoldTransitionProgressProvider;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda4;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda4;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/widget/BottomActionBar;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda4;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda4;->f$0:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    iget v0, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda4;->$r8$classId:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p0, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda4;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/systemui/unfold/util/ScopedUnfoldTransitionProgressProvider;

    check-cast p1, Lcom/android/systemui/unfold/UnfoldTransitionProgressProvider$TransitionProgressListener;

    invoke-static {p0, p1}, Lcom/android/systemui/unfold/util/ScopedUnfoldTransitionProgressProvider;->$r8$lambda$D3AkHE_0PrzOvB4ZmVXQFH6pK2E(Lcom/android/systemui/unfold/util/ScopedUnfoldTransitionProgressProvider;Lcom/android/systemui/unfold/UnfoldTransitionProgressProvider$TransitionProgressListener;)V

    return-void

    :pswitch_1
    iget-object p0, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda4;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/wallpaper/widget/BottomActionBar;

    check-cast p1, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    sget v0, Lcom/android/wallpaper/widget/BottomActionBar;->$r8$clinit:I

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, p1, v0}, Lcom/android/wallpaper/widget/BottomActionBar;->updateSelectedState(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;Z)V

    return-void

    .line 2
    :goto_0
    iget-object p0, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda4;->f$0:Ljava/lang/Object;

    check-cast p0, Landroid/os/Bundle;

    check-cast p1, Lcom/android/wallpaper/model/CustomizationSectionController;

    sget v0, Lcom/android/wallpaper/picker/CustomizationPickerFragment;->$r8$clinit:I

    .line 3
    invoke-interface {p1, p0}, Lcom/android/wallpaper/model/CustomizationSectionController;->onSaveInstanceState(Landroid/os/Bundle;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
