.class public Lcom/android/wallpaper/model/SetWallpaperViewModel;
.super Landroidx/lifecycle/ViewModel;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;
    }
.end annotation


# instance fields
.field public mDestination:I

.field public final mStatus:Landroidx/lifecycle/MutableLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/MutableLiveData<",
            "Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/lifecycle/ViewModel;-><init>()V

    .line 2
    new-instance v0, Landroidx/lifecycle/MutableLiveData;

    invoke-direct {v0}, Landroidx/lifecycle/MutableLiveData;-><init>()V

    iput-object v0, p0, Lcom/android/wallpaper/model/SetWallpaperViewModel;->mStatus:Landroidx/lifecycle/MutableLiveData;

    .line 3
    sget-object p0, Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;->UNKNOWN:Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;

    invoke-virtual {v0, p0}, Landroidx/lifecycle/MutableLiveData;->setValue(Ljava/lang/Object;)V

    return-void
.end method
