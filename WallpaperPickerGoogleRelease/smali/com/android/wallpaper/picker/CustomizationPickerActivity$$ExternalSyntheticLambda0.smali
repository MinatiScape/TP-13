.class public final synthetic Lcom/android/wallpaper/picker/CustomizationPickerActivity$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/NetworkStatusNotifier$Listener;


# instance fields
.field public final synthetic f$0:Lcom/android/wallpaper/picker/CustomizationPickerActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/CustomizationPickerActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/picker/CustomizationPickerActivity;

    return-void
.end method


# virtual methods
.method public final onNetworkChanged(I)V
    .locals 2

    iget-object p0, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/picker/CustomizationPickerActivity;

    .line 1
    iget v0, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mNetworkStatus:I

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "CustomizationPickerActivity"

    const-string v1, "Network status changes, refresh wallpaper categories."

    .line 2
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    iput p1, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mNetworkStatus:I

    .line 4
    iget-object p0, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->initialize(Z)V

    :goto_0
    return-void
.end method
