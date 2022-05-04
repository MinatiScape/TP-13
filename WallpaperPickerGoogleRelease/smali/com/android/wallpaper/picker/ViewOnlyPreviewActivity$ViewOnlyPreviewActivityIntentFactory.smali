.class public Lcom/android/wallpaper/picker/ViewOnlyPreviewActivity$ViewOnlyPreviewActivityIntentFactory;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/model/InlinePreviewIntentFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/picker/ViewOnlyPreviewActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ViewOnlyPreviewActivityIntentFactory"
.end annotation


# instance fields
.field public mIsHomeAndLockPreviews:Z

.field public mIsViewAsHome:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public newIntent(Landroid/content/Context;Lcom/android/wallpaper/model/WallpaperInfo;)Landroid/content/Intent;
    .locals 3

    .line 1
    const-class v0, Lcom/android/wallpaper/picker/ViewOnlyPreviewActivity;

    iget-boolean v1, p0, Lcom/android/wallpaper/picker/ViewOnlyPreviewActivity$ViewOnlyPreviewActivityIntentFactory;->mIsHomeAndLockPreviews:Z

    const-string v2, "com.android.wallpaper.picker.wallpaper_info"

    if-eqz v1, :cond_0

    .line 2
    iget-boolean p0, p0, Lcom/android/wallpaper/picker/ViewOnlyPreviewActivity$ViewOnlyPreviewActivityIntentFactory;->mIsViewAsHome:Z

    sget v1, Lcom/android/wallpaper/picker/ViewOnlyPreviewActivity;->$r8$clinit:I

    .line 3
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 4
    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object p1

    const-string p2, "com.android.wallpaper.picker.view_as_home"

    .line 5
    invoke-virtual {p1, p2, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p0

    return-object p0

    .line 6
    :cond_0
    sget p0, Lcom/android/wallpaper/picker/ViewOnlyPreviewActivity;->$r8$clinit:I

    .line 7
    new-instance p0, Landroid/content/Intent;

    invoke-direct {p0, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 8
    invoke-virtual {p0, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method
