.class public final synthetic Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Ljava/lang/Object;

.field public final synthetic f$1:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/module/WallpaperSetter;Landroid/app/Activity;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/CustomizationPickerFragment;Landroid/view/ViewGroup;)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/widget/BottomActionBar;Ljava/util/Set;)V
    .locals 1

    const/4 v0, 0x3

    iput v0, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 3

    iget v0, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;->$r8$classId:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object v0, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/wallpaper/picker/CustomizationPickerFragment;

    iget-object p0, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    check-cast p0, Landroid/view/ViewGroup;

    check-cast p1, Lcom/android/wallpaper/model/CustomizationSectionController;

    .line 1
    iget-object v1, v0, Lcom/android/wallpaper/picker/CustomizationPickerFragment;->mNestedScrollView:Landroidx/core/widget/NestedScrollView;

    new-instance v2, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda1;

    invoke-direct {v2, v0, p0, p1}, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/picker/CustomizationPickerFragment;Landroid/view/ViewGroup;Lcom/android/wallpaper/model/CustomizationSectionController;)V

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    return-void

    .line 2
    :pswitch_1
    iget-object v0, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Thread;

    iget-object p0, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Throwable;

    check-cast p1, Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-static {v0, p0, p1}, Lcom/android/systemui/shared/plugins/PluginManagerImpl$PluginExceptionHandler;->$r8$lambda$z9t9P8v3jgTN-_uKOhiAblr02AQ(Ljava/lang/Thread;Ljava/lang/Throwable;Ljava/lang/Thread$UncaughtExceptionHandler;)V

    return-void

    :pswitch_2
    iget-object v0, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/wallpaper/module/WallpaperSetter;

    iget-object p0, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    check-cast p0, Landroid/app/Activity;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual {p0}, Landroid/app/Activity;->getRequestedOrientation()I

    move-result v1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-eq v1, v2, :cond_0

    .line 4
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 5
    :cond_0
    invoke-static {}, Ljava/util/Optional;->empty()Ljava/util/Optional;

    move-result-object p0

    iput-object p0, v0, Lcom/android/wallpaper/module/WallpaperSetter;->mCurrentScreenOrientation:Ljava/util/Optional;

    return-void

    .line 6
    :goto_0
    iget-object v0, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/wallpaper/widget/BottomActionBar;

    iget-object p0, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    check-cast p0, Ljava/util/Set;

    check-cast p1, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    sget v1, Lcom/android/wallpaper/widget/BottomActionBar;->$r8$clinit:I

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz p0, :cond_1

    new-array p0, v2, [Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    aput-object p1, p0, v1

    .line 8
    invoke-virtual {v0, p0}, Lcom/android/wallpaper/widget/BottomActionBar;->showActions([Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    goto :goto_1

    :cond_1
    new-array p0, v2, [Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    aput-object p1, p0, v1

    .line 9
    invoke-virtual {v0, p0}, Lcom/android/wallpaper/widget/BottomActionBar;->hideActions([Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
