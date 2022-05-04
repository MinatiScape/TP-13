.class public final synthetic Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/widget/WallpaperColorsLoader$Callback;
.implements Lcom/android/wallpaper/util/TimeUtils$TimeTicker$TimeListener;


# instance fields
.field public final synthetic f$0:Lcom/android/wallpaper/widget/LockScreenPreviewer;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/widget/LockScreenPreviewer;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda4;->f$0:Lcom/android/wallpaper/widget/LockScreenPreviewer;

    return-void
.end method


# virtual methods
.method public onLoaded(Landroid/app/WallpaperColors;)V
    .locals 0

    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda4;->f$0:Lcom/android/wallpaper/widget/LockScreenPreviewer;

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/widget/LockScreenPreviewer;->setColor(Landroid/app/WallpaperColors;)V

    return-void
.end method
