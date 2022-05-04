.class public final synthetic Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Ljava/lang/Object;

.field public final synthetic f$1:Lcom/android/wallpaper/model/WallpaperInfo;

.field public final synthetic f$2:Z

.field public final synthetic f$3:Lcom/android/wallpaper/module/UserEventLogger;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/model/WallpaperSectionController;Lcom/android/wallpaper/model/WallpaperInfo;ZLcom/android/wallpaper/module/UserEventLogger;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda2;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda2;->f$1:Lcom/android/wallpaper/model/WallpaperInfo;

    iput-boolean p3, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda2;->f$2:Z

    iput-object p4, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda2;->f$3:Lcom/android/wallpaper/module/UserEventLogger;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/CategoryFragment;Lcom/android/wallpaper/model/WallpaperInfo;ZLcom/android/wallpaper/module/UserEventLogger;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda2;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda2;->f$1:Lcom/android/wallpaper/model/WallpaperInfo;

    iput-boolean p3, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda2;->f$2:Z

    iput-object p4, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda2;->f$3:Lcom/android/wallpaper/module/UserEventLogger;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    iget p1, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda2;->$r8$classId:I

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    check-cast p1, Lcom/android/wallpaper/picker/CategoryFragment;

    iget-object v0, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda2;->f$1:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-boolean v1, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda2;->f$2:Z

    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda2;->f$3:Lcom/android/wallpaper/module/UserEventLogger;

    sget v2, Lcom/android/wallpaper/picker/CategoryFragment;->$r8$clinit:I

    .line 1
    invoke-virtual {p1}, Lcom/android/wallpaper/picker/CategoryFragment;->getFragmentHost()Lcom/android/wallpaper/picker/CategoryFragment$CategoryFragmentHost;

    move-result-object p1

    invoke-interface {p1, v0, v1}, Lcom/android/wallpaper/picker/CategoryFragment$CategoryFragmentHost;->showViewOnlyPreview(Lcom/android/wallpaper/model/WallpaperInfo;Z)V

    .line 2
    invoke-interface {p0}, Lcom/android/wallpaper/module/UserEventLogger;->logCurrentWallpaperPreviewed()V

    return-void

    .line 3
    :goto_0
    iget-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    check-cast p1, Lcom/android/wallpaper/model/WallpaperSectionController;

    iget-object v0, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda2;->f$1:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-boolean v1, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda2;->f$2:Z

    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda2;->f$3:Lcom/android/wallpaper/module/UserEventLogger;

    .line 4
    iget-object p1, p1, Lcom/android/wallpaper/model/WallpaperSectionController;->mWallpaperPreviewNavigator:Lcom/android/wallpaper/model/WallpaperPreviewNavigator;

    invoke-interface {p1, v0, v1}, Lcom/android/wallpaper/model/WallpaperPreviewNavigator;->showViewOnlyPreview(Lcom/android/wallpaper/model/WallpaperInfo;Z)V

    .line 5
    invoke-interface {p0}, Lcom/android/wallpaper/module/UserEventLogger;->logCurrentWallpaperPreviewed()V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
