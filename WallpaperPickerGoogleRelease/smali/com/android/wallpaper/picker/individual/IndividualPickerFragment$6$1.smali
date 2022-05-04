.class public Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$6$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$6;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$1:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$6;

.field public final synthetic val$dy:I


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$6;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$6$1;->this$1:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$6;

    iput p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$6$1;->val$dy:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$6$1;->val$dy:I

    if-lez v0, :cond_0

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$6$1;->this$1:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$6;

    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$6;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    .line 3
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCurrentWallpaperBottomSheetPresenter:Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter;

    const/4 v0, 0x0

    .line 4
    check-cast p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    invoke-virtual {p0, v0}, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->setCurrentWallpapersExpanded(Z)V

    goto :goto_0

    .line 5
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$6$1;->this$1:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$6;

    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$6;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    .line 6
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCurrentWallpaperBottomSheetPresenter:Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter;

    const/4 v0, 0x1

    .line 7
    check-cast p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    invoke-virtual {p0, v0}, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->setCurrentWallpapersExpanded(Z)V

    :goto_0
    return-void
.end method
