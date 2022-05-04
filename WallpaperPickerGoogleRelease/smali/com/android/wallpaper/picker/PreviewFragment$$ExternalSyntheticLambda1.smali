.class public final synthetic Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Lcom/android/wallpaper/picker/PreviewFragment;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/PreviewFragment;I)V
    .locals 1

    iput p2, p0, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda1;->$r8$classId:I

    const/4 v0, 0x1

    if-eq p2, v0, :cond_0

    const/4 v0, 0x2

    if-eq p2, v0, :cond_0

    const/4 v0, 0x3

    :cond_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda1;->f$0:Lcom/android/wallpaper/picker/PreviewFragment;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 5

    iget v0, p0, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda1;->$r8$classId:I

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_7

    :pswitch_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda1;->f$0:Lcom/android/wallpaper/picker/PreviewFragment;

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mFullScreenAnimation:Lcom/android/wallpaper/util/FullScreenAnimation;

    .line 2
    iget-boolean v2, v0, Lcom/android/wallpaper/util/FullScreenAnimation;->mWorkspaceVisibility:Z

    xor-int/lit8 v3, v2, 0x1

    .line 3
    invoke-virtual {v0, v3}, Lcom/android/wallpaper/util/FullScreenAnimation;->setWorkspaceVisibility(Z)V

    const v0, 0x7f0a0116

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    check-cast p1, Landroid/graphics/drawable/RippleDrawable;

    .line 6
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/RippleDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    check-cast p1, Landroid/graphics/drawable/LayerDrawable;

    .line 7
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-nez v2, :cond_0

    .line 8
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    const v0, 0x1120026

    invoke-static {p0, v0}, Landroidx/transition/R$id;->getColorAttr(Landroid/content/Context;I)I

    move-result p0

    goto :goto_0

    .line 9
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    const v0, 0x1120024

    invoke-static {p0, v0}, Landroidx/transition/R$id;->getColorAttr(Landroid/content/Context;I)I

    move-result p0

    .line 10
    :goto_0
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    return-void

    .line 11
    :pswitch_1
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda1;->f$0:Lcom/android/wallpaper/picker/PreviewFragment;

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/PreviewFragment;->onSetWallpaperClicked(Landroid/view/View;)V

    return-void

    :pswitch_2
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda1;->f$0:Lcom/android/wallpaper/picker/PreviewFragment;

    .line 12
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mFullScreenAnimation:Lcom/android/wallpaper/util/FullScreenAnimation;

    .line 13
    iget-boolean v0, v0, Lcom/android/wallpaper/util/FullScreenAnimation;->mWorkspaceVisibility:Z

    .line 14
    move-object v1, p1

    check-cast v1, Landroid/widget/Button;

    if-eqz v0, :cond_1

    const v2, 0x7f110121

    goto :goto_1

    :cond_1
    const v2, 0x7f110095

    :goto_1
    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(I)V

    .line 15
    iget-object v1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mFullScreenAnimation:Lcom/android/wallpaper/util/FullScreenAnimation;

    xor-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2}, Lcom/android/wallpaper/util/FullScreenAnimation;->setWorkspaceVisibility(Z)V

    if-eqz v0, :cond_2

    const v0, 0x7f110096

    .line 16
    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_2

    :cond_2
    const v0, 0x7f110097

    .line 17
    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p0

    .line 18
    :goto_2
    invoke-virtual {p1, p0}, Landroid/view/View;->announceForAccessibility(Ljava/lang/CharSequence;)V

    return-void

    .line 19
    :pswitch_3
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda1;->f$0:Lcom/android/wallpaper/picker/PreviewFragment;

    sget-object p1, Lcom/android/wallpaper/picker/PreviewFragment;->ALPHA_OUT:Landroid/view/animation/Interpolator;

    .line 20
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "context"

    .line 21
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 23
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.SET_WALLPAPER"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string v2, "Intent(ACTION_SET_WALLPAPER).setPackage(context.packageName)"

    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.settings.SETTINGS_EMBED_DEEP_LINK_ACTIVITY"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v3, "android.provider.extra.SETTINGS_EMBEDDED_DEEP_LINK_HIGHLIGHT_MENU_KEY"

    const-string v4, "top_level_wallpaper"

    .line 25
    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/4 v3, 0x1

    .line 26
    invoke-virtual {p1, v3}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    move-result-object p1

    const-string v4, "android.provider.extra.SETTINGS_EMBEDDED_DEEP_LINK_INTENT_URI"

    .line 27
    invoke-virtual {v2, v4, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 p1, 0x10000

    .line 28
    invoke-virtual {v0, v2, p1}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object p1

    const/4 v0, 0x0

    if-nez p1, :cond_3

    goto :goto_3

    :cond_3
    iget-object p1, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-nez p1, :cond_4

    goto :goto_3

    :cond_4
    iget-boolean p1, p1, Landroid/content/pm/ActivityInfo;->enabled:Z

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    :goto_3
    if-eqz v0, :cond_5

    move p1, v3

    goto :goto_4

    :cond_5
    move p1, v1

    :goto_4
    if-eqz p1, :cond_8

    .line 29
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    if-nez p1, :cond_6

    goto :goto_6

    .line 30
    :cond_6
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    iget-object v2, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mLastSelectedTabPositionOptional:Ljava/util/Optional;

    .line 31
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-nez v2, :cond_7

    goto :goto_5

    :cond_7
    move v3, v1

    .line 32
    :goto_5
    sget v2, Lcom/android/wallpaper/picker/FullPreviewActivity;->$r8$clinit:I

    .line 33
    new-instance v2, Landroid/content/Intent;

    const-class v4, Lcom/android/wallpaper/picker/FullPreviewActivity;

    invoke-direct {v2, v0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v0, 0x10000000

    .line 34
    invoke-virtual {v2, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const-string v0, "com.android.wallpaper.picker.wallpaper_info"

    .line 35
    invoke-virtual {v2, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string p1, "com.android.wallpaper.picker.view_as_home"

    .line 36
    invoke-virtual {v2, p1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p1

    .line 37
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    new-array v1, v1, [Landroid/util/Pair;

    invoke-static {v0, v1}, Landroid/app/ActivityOptions;->makeSceneTransitionAnimation(Landroid/app/Activity;[Landroid/util/Pair;)Landroid/app/ActivityOptions;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 38
    invoke-virtual {p0, p1, v0}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;Landroid/os/Bundle;)V

    goto :goto_6

    .line 39
    :cond_8
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mFullScreenAnimation:Lcom/android/wallpaper/util/FullScreenAnimation;

    invoke-virtual {p1, v3}, Lcom/android/wallpaper/util/FullScreenAnimation;->startAnimation(Z)V

    .line 40
    :goto_6
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    sget-object p1, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->EDIT:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/widget/BottomActionBar;->deselectAction(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    return-void

    .line 41
    :goto_7
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda1;->f$0:Lcom/android/wallpaper/picker/PreviewFragment;

    .line 42
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaperSetter:Lcom/android/wallpaper/module/WallpaperSetter;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    .line 43
    iget-object v1, p0, Landroidx/fragment/app/Fragment;->mFragmentManager:Landroidx/fragment/app/FragmentManager;

    .line 44
    iget-object v2, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    instance-of v2, v2, Lcom/android/wallpaper/model/LiveWallpaperInfo;

    invoke-virtual {p1, v0, v1, p0, v2}, Lcom/android/wallpaper/module/WallpaperSetter;->requestDestination(Landroid/app/Activity;Landroidx/fragment/app/FragmentManager;Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$Listener;Z)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
