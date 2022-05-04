.class public Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic this$1:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter$2;->this$1:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter$2;->this$1:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;

    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCurrentWallpaperBottomSheetPresenter:Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter;

    const/4 v0, 0x1

    .line 3
    check-cast p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    invoke-virtual {p0, v0}, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->setCurrentWallpapersExpanded(Z)V

    return-void
.end method
