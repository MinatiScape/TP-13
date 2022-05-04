.class public Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory$WallpaperInfoCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/picker/TopLevelPickerActivity;->refreshCurrentWallpapers(Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter$RefreshListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

.field public final synthetic val$appContext:Landroid/content/Context;

.field public final synthetic val$injector:Lcom/android/wallpaper/module/Injector;

.field public final synthetic val$refreshListener:Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter$RefreshListener;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/TopLevelPickerActivity;Landroid/content/Context;Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter$RefreshListener;Lcom/android/wallpaper/module/Injector;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    iput-object p2, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->val$appContext:Landroid/content/Context;

    iput-object p3, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->val$refreshListener:Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter$RefreshListener;

    iput-object p4, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->val$injector:Lcom/android/wallpaper/module/Injector;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onWallpaperInfoCreated(Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/model/WallpaperInfo;I)V
    .locals 7

    .line 1
    iget-object p2, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    invoke-virtual {p2}, Landroid/app/Activity;->isDestroyed()Z

    move-result p2

    if-eqz p2, :cond_0

    return-void

    .line 2
    :cond_0
    iget-object p2, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->val$appContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->val$refreshListener:Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter$RefreshListener;

    new-instance v1, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1, p2, v0}, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/content/Context;Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter$RefreshListener;)V

    .line 3
    new-instance p2, Lcom/android/wallpaper/picker/TopLevelPickerActivity$FetchThumbAssetTask;

    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->val$appContext:Landroid/content/Context;

    invoke-direct {p2, v0, p1, v1}, Lcom/android/wallpaper/picker/TopLevelPickerActivity$FetchThumbAssetTask;-><init>(Landroid/content/Context;Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/picker/TopLevelPickerActivity$AssetReceiver;)V

    sget-object v0, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Void;

    invoke-virtual {p2, v0, v2}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 4
    iget-object p2, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 5
    iget-object v0, p2, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mCurrentWallpaperPresentationMode:Landroid/widget/TextView;

    .line 6
    invoke-virtual {p2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const-string v2, ""

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eq p3, v4, :cond_2

    if-eq p3, v3, :cond_1

    .line 7
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "No matching human-readable string for wallpaper presentation mode: "

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v5, "AttributionFormatter"

    invoke-static {v5, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    const v5, 0x7f11010f

    .line 8
    invoke-virtual {p2, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    goto :goto_1

    :cond_2
    :goto_0
    move-object p2, v2

    .line 9
    :goto_1
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    iget-object p2, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->val$appContext:Landroid/content/Context;

    invoke-virtual {p1, p2}, Lcom/android/wallpaper/model/WallpaperInfo;->getAttributions(Landroid/content/Context;)Ljava/util/List;

    move-result-object p2

    .line 11
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_3

    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 12
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 13
    iget-object v0, v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mCurrentWallpaperTitle:Landroid/widget/TextView;

    .line 14
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/CharSequence;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    :cond_3
    iget-object p2, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 16
    iget-object p2, p2, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mCurrentWallpaperSubtitle:Landroid/widget/TextView;

    .line 17
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->val$appContext:Landroid/content/Context;

    .line 18
    invoke-virtual {p1, v0}, Lcom/android/wallpaper/model/WallpaperInfo;->getAttributions(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    .line 19
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    if-le v5, v4, :cond_4

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_4

    .line 20
    invoke-static {v2}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 21
    :cond_4
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    if-le v5, v3, :cond_5

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_5

    .line 22
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " \u2022 "

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 23
    :cond_5
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    iget-object p2, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->val$appContext:Landroid/content/Context;

    invoke-virtual {p1, p2}, Lcom/android/wallpaper/model/WallpaperInfo;->getActionUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    const/16 v0, 0x8

    if-eqz p2, :cond_6

    .line 25
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_6

    .line 26
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    .line 27
    iget-object v2, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->val$injector:Lcom/android/wallpaper/module/Injector;

    iget-object v5, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->val$appContext:Landroid/content/Context;

    invoke-interface {v2, v5}, Lcom/android/wallpaper/module/Injector;->getExploreIntentChecker(Landroid/content/Context;)Lcom/android/wallpaper/module/ExploreIntentChecker;

    move-result-object v2

    .line 28
    iget-object v5, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->val$appContext:Landroid/content/Context;

    new-instance v6, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$$ExternalSyntheticLambda0;

    invoke-direct {v6, p0, p1, v5}, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/content/Context;)V

    check-cast v2, Lcom/android/wallpaper/module/DefaultExploreIntentChecker;

    invoke-virtual {v2, p2, v6}, Lcom/android/wallpaper/module/DefaultExploreIntentChecker;->fetchValidActionViewIntent(Landroid/net/Uri;Lcom/android/wallpaper/module/ExploreIntentChecker$IntentReceiver;)V

    goto :goto_2

    .line 29
    :cond_6
    iget-object p2, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 30
    iget-object p2, p2, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mCurrentWallpaperExploreButton:Landroid/widget/Button;

    .line 31
    invoke-virtual {p2, v0}, Landroid/widget/Button;->setVisibility(I)V

    .line 32
    :goto_2
    iget-object p2, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    invoke-virtual {p1, p2}, Lcom/android/wallpaper/model/WallpaperInfo;->getCollectionId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    .line 33
    iget-object p2, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 34
    iget-object v2, p2, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mWallpaperPositionOptions:Landroid/widget/LinearLayout;

    if-eqz v2, :cond_7

    if-eqz p1, :cond_7

    const v2, 0x7f11009e

    .line 35
    invoke-virtual {p2, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_7

    .line 36
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 37
    iget-object p1, p1, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mWallpaperPositionOptions:Landroid/widget/LinearLayout;

    .line 38
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    :cond_7
    if-ne p3, v3, :cond_8

    move p1, v4

    goto :goto_3

    :cond_8
    move p1, v1

    :goto_3
    if-eqz p1, :cond_9

    .line 39
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 40
    iget-object p1, p1, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mCurrentWallpaperSkipWallpaperButton:Landroid/widget/Button;

    .line 41
    invoke-virtual {p1, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 42
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 43
    iget-object p1, p1, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mCurrentWallpaperSkipWallpaperButton:Landroid/widget/Button;

    .line 44
    new-instance p2, Lcom/android/wallpaper/picker/AppbarFragment$$ExternalSyntheticLambda0;

    invoke-direct {p2, p0}, Lcom/android/wallpaper/picker/AppbarFragment$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;)V

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_4

    .line 45
    :cond_9
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 46
    iget-object p1, p1, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mCurrentWallpaperSkipWallpaperButton:Landroid/widget/Button;

    .line 47
    invoke-virtual {p1, v0}, Landroid/widget/Button;->setVisibility(I)V

    .line 48
    :goto_4
    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->val$refreshListener:Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter$RefreshListener;

    if-eqz p0, :cond_a

    .line 49
    check-cast p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    .line 50
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCurrentWallpaperBottomSheetPresenter:Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter;

    check-cast p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    invoke-virtual {p0, v4}, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->setCurrentWallpapersExpanded(Z)V

    :cond_a
    return-void
.end method
