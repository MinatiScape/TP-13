.class public Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/asset/Asset$DrawableLoadedListener;


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$3;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDrawableLoaded()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$3;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/16 v0, 0xfa0

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$3;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mHandler:Landroid/os/Handler;

    .line 3
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mUpdateDailyWallpaperThumbRunnable:Ljava/lang/Runnable;

    int-to-long v2, v0

    .line 4
    invoke-virtual {v1, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
