.class public final Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent;
.super Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/picker/PreviewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "WallpaperInfoContent"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent<",
        "Lcom/android/wallpaper/widget/WallpaperInfoView;",
        ">;"
    }
.end annotation


# instance fields
.field public mActionLabel:Ljava/lang/CharSequence;

.field public mExploreIntent:Landroid/content/Intent;

.field public final synthetic this$0:Lcom/android/wallpaper/picker/PreviewFragment;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/PreviewFragment;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent;->this$0:Lcom/android/wallpaper/picker/PreviewFragment;

    .line 2
    invoke-direct {p0, p2}, Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public getViewId()I
    .locals 0

    const p0, 0x7f0d00ee

    return p0
.end method

.method public onViewCreated(Landroid/view/View;)V
    .locals 5

    .line 1
    check-cast p1, Lcom/android/wallpaper/widget/WallpaperInfoView;

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent;->this$0:Lcom/android/wallpaper/picker/PreviewFragment;

    iget-object v1, v0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    if-nez v1, :cond_0

    goto/16 :goto_1

    .line 3
    :cond_0
    iget-object v1, p0, Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent;->mActionLabel:Ljava/lang/CharSequence;

    if-nez v1, :cond_5

    .line 4
    new-instance v1, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent;Lcom/android/wallpaper/widget/WallpaperInfoView;)V

    .line 5
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    if-nez p1, :cond_1

    goto :goto_1

    .line 6
    :cond_1
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent;->this$0:Lcom/android/wallpaper/picker/PreviewFragment;

    iget-object v0, v0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    new-instance v2, Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, v1}, Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent;Ljava/lang/Runnable;)V

    .line 7
    invoke-virtual {v0, p1}, Lcom/android/wallpaper/model/WallpaperInfo;->getActionUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    .line 8
    instance-of v1, v0, Lcom/android/wallpaper/model/LiveWallpaperInfo;

    const/4 v3, 0x0

    if-eqz v1, :cond_2

    .line 9
    move-object v1, v0

    check-cast v1, Lcom/android/wallpaper/model/LiveWallpaperInfo;

    .line 10
    :try_start_0
    iget-object v1, v1, Lcom/android/wallpaper/model/LiveWallpaperInfo;->mInfo:Landroid/app/WallpaperInfo;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/app/WallpaperInfo;->loadContextDescription(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v1
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    :cond_2
    move-object v1, v3

    .line 11
    :goto_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 12
    invoke-virtual {v0, p1}, Lcom/android/wallpaper/model/WallpaperInfo;->getActionLabelRes(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    :cond_3
    if-eqz p0, :cond_4

    .line 13
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_4

    .line 14
    invoke-virtual {v0, p1}, Lcom/android/wallpaper/model/WallpaperInfo;->getActionUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    .line 15
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/Injector;->getExploreIntentChecker(Landroid/content/Context;)Lcom/android/wallpaper/module/ExploreIntentChecker;

    move-result-object p1

    .line 16
    new-instance v0, Lcom/android/wallpaper/picker/WallpaperInfoHelper$$ExternalSyntheticLambda0;

    invoke-direct {v0, v2, v1}, Lcom/android/wallpaper/picker/WallpaperInfoHelper$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/WallpaperInfoHelper$ExploreIntentReceiver;Ljava/lang/CharSequence;)V

    check-cast p1, Lcom/android/wallpaper/module/DefaultExploreIntentChecker;

    invoke-virtual {p1, p0, v0}, Lcom/android/wallpaper/module/DefaultExploreIntentChecker;->fetchValidActionViewIntent(Landroid/net/Uri;Lcom/android/wallpaper/module/ExploreIntentChecker$IntentReceiver;)V

    goto :goto_1

    .line 17
    :cond_4
    iget-object p0, v2, Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent;

    iget-object p1, v2, Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Runnable;

    .line 18
    iput-object v1, p0, Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent;->mActionLabel:Ljava/lang/CharSequence;

    .line 19
    iput-object v3, p0, Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent;->mExploreIntent:Landroid/content/Intent;

    if-eqz p1, :cond_6

    .line 20
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    goto :goto_1

    .line 21
    :cond_5
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent;->populateWallpaperInfo(Lcom/android/wallpaper/widget/WallpaperInfoView;)V

    :cond_6
    :goto_1
    return-void
.end method

.method public final populateWallpaperInfo(Lcom/android/wallpaper/widget/WallpaperInfoView;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent;->this$0:Lcom/android/wallpaper/picker/PreviewFragment;

    iget-object v1, v0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v2, p0, Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent;->mActionLabel:Ljava/lang/CharSequence;

    .line 2
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v3, p0, Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent;->mExploreIntent:Landroid/content/Intent;

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v3, :cond_0

    .line 3
    invoke-static {v0}, Lcom/android/wallpaper/util/ActivityUtils;->isSUWMode(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v4

    goto :goto_0

    :cond_0
    move v0, v5

    .line 4
    :goto_0
    new-instance v3, Lcom/android/wallpaper/picker/AppbarFragment$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0}, Lcom/android/wallpaper/picker/AppbarFragment$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent;)V

    .line 5
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v1, p0}, Lcom/android/wallpaper/model/WallpaperInfo;->getAttributions(Landroid/content/Context;)Ljava/util/List;

    move-result-object p0

    .line 6
    iget-object v6, p1, Lcom/android/wallpaper/widget/WallpaperInfoView;->mTitle:Landroid/widget/TextView;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 7
    iget-object v6, p1, Lcom/android/wallpaper/widget/WallpaperInfoView;->mSubtitle1:Landroid/widget/TextView;

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    iget-object v6, p1, Lcom/android/wallpaper/widget/WallpaperInfoView;->mSubtitle1:Landroid/widget/TextView;

    const/16 v8, 0x8

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 9
    iget-object v6, p1, Lcom/android/wallpaper/widget/WallpaperInfoView;->mSubtitle2:Landroid/widget/TextView;

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    iget-object v6, p1, Lcom/android/wallpaper/widget/WallpaperInfoView;->mSubtitle2:Landroid/widget/TextView;

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 11
    iget-object v6, p1, Lcom/android/wallpaper/widget/WallpaperInfoView;->mExploreButton:Landroid/widget/Button;

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 12
    iget-object v6, p1, Lcom/android/wallpaper/widget/WallpaperInfoView;->mExploreButton:Landroid/widget/Button;

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 13
    iget-object v6, p1, Lcom/android/wallpaper/widget/WallpaperInfoView;->mExploreButton:Landroid/widget/Button;

    invoke-virtual {v6, v8}, Landroid/widget/Button;->setVisibility(I)V

    .line 14
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v6

    if-lez v6, :cond_1

    invoke-interface {p0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 15
    iget-object v6, p1, Lcom/android/wallpaper/widget/WallpaperInfoView;->mTitle:Landroid/widget/TextView;

    invoke-interface {p0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/CharSequence;

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    :cond_1
    invoke-virtual {v1}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperComponent()Landroid/app/WallpaperInfo;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 17
    invoke-virtual {v1}, Landroid/app/WallpaperInfo;->getShowMetadataInPreview()Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_1

    :cond_2
    move v1, v5

    goto :goto_2

    :cond_3
    :goto_1
    move v1, v4

    :goto_2
    if-eqz v1, :cond_6

    .line 18
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    if-le v1, v4, :cond_4

    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 19
    iget-object v1, p1, Lcom/android/wallpaper/widget/WallpaperInfoView;->mSubtitle1:Landroid/widget/TextView;

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 20
    iget-object v1, p1, Lcom/android/wallpaper/widget/WallpaperInfoView;->mSubtitle1:Landroid/widget/TextView;

    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/CharSequence;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    :cond_4
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v4, 0x2

    if-le v1, v4, :cond_5

    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 22
    iget-object v1, p1, Lcom/android/wallpaper/widget/WallpaperInfoView;->mSubtitle2:Landroid/widget/TextView;

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 23
    iget-object v1, p1, Lcom/android/wallpaper/widget/WallpaperInfoView;->mSubtitle2:Landroid/widget/TextView;

    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/CharSequence;

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_5
    if-eqz v0, :cond_6

    .line 24
    iget-object p0, p1, Lcom/android/wallpaper/widget/WallpaperInfoView;->mExploreButton:Landroid/widget/Button;

    invoke-virtual {p0, v5}, Landroid/widget/Button;->setVisibility(I)V

    .line 25
    iget-object p0, p1, Lcom/android/wallpaper/widget/WallpaperInfoView;->mExploreButton:Landroid/widget/Button;

    invoke-virtual {p0, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 26
    iget-object p0, p1, Lcom/android/wallpaper/widget/WallpaperInfoView;->mExploreButton:Landroid/widget/Button;

    invoke-virtual {p0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_6
    return-void
.end method
