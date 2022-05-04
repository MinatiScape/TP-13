.class public final synthetic Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/ExploreIntentChecker$IntentReceiver;
.implements Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$Listener;


# instance fields
.field public final synthetic f$0:Ljava/lang/Object;

.field public final synthetic f$1:Ljava/lang/Object;

.field public final synthetic f$2:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    iput-object p3, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$$ExternalSyntheticLambda0;->f$2:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;Landroid/app/Activity;Landroid/app/WallpaperManager;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    iput-object p3, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$$ExternalSyntheticLambda0;->f$2:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public onIntentReceived(Landroid/content/Intent;)V
    .locals 5

    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;

    iget-object v1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    check-cast v1, Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$$ExternalSyntheticLambda0;->f$2:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p1, :cond_0

    .line 1
    iget-object v2, v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    invoke-virtual {v2}, Landroid/app/Activity;->isDestroyed()Z

    move-result v2

    if-nez v2, :cond_0

    .line 2
    iget-object v2, v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    invoke-virtual {v2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 3
    invoke-virtual {v1, p0}, Lcom/android/wallpaper/model/WallpaperInfo;->getActionIconRes(Landroid/content/Context;)I

    move-result v3

    .line 4
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 5
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v2

    .line 6
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 7
    iget-object v3, v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    const v4, 0x1010435

    .line 8
    invoke-static {v3, v4}, Landroidx/transition/R$id;->getColorAttr(Landroid/content/Context;I)I

    move-result v3

    sget-object v4, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 9
    invoke-virtual {v2, v3, v4}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 10
    iget-object v3, v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 11
    iget-object v3, v3, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mCurrentWallpaperExploreButton:Landroid/widget/Button;

    const/4 v4, 0x0

    .line 12
    invoke-virtual {v3, v2, v4, v4, v4}, Landroid/widget/Button;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 13
    iget-object v2, v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 14
    iget-object v3, v2, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mCurrentWallpaperExploreButton:Landroid/widget/Button;

    .line 15
    invoke-virtual {v1, p0}, Lcom/android/wallpaper/model/WallpaperInfo;->getActionLabelRes(Landroid/content/Context;)I

    move-result v4

    .line 16
    invoke-virtual {v2, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 17
    iget-object v2, v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 18
    iget-object v2, v2, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mCurrentWallpaperExploreButton:Landroid/widget/Button;

    const/4 v3, 0x0

    .line 19
    invoke-virtual {v2, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 20
    iget-object v2, v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 21
    iget-object v2, v2, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mCurrentWallpaperExploreButton:Landroid/widget/Button;

    .line 22
    new-instance v3, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$1;

    invoke-direct {v3, v0, v1, p0, p1}, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$1;-><init>(Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/content/Context;Landroid/content/Intent;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_0
    return-void
.end method

.method public onSet(I)V
    .locals 3

    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;

    iget-object v1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    check-cast v1, Landroid/app/Activity;

    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$$ExternalSyntheticLambda0;->f$2:Ljava/lang/Object;

    check-cast p0, Landroid/app/WallpaperManager;

    .line 1
    iget-object v0, v0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;->mSetWallpaperExecutor:Ljava/util/concurrent/Executor;

    new-instance v2, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;

    invoke-direct {v2, p1, v1, p0}, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;-><init>(ILandroid/app/Activity;Landroid/app/WallpaperManager;)V

    invoke-interface {v0, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
