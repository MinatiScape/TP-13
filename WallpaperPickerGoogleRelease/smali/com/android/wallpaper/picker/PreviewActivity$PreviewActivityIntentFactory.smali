.class public Lcom/android/wallpaper/picker/PreviewActivity$PreviewActivityIntentFactory;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/model/InlinePreviewIntentFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/picker/PreviewActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PreviewActivityIntentFactory"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public newIntent(Landroid/content/Context;Lcom/android/wallpaper/model/WallpaperInfo;)Landroid/content/Intent;
    .locals 1

    .line 1
    sget p0, Lcom/android/wallpaper/picker/PreviewActivity;->$r8$clinit:I

    .line 2
    new-instance p0, Landroid/content/Intent;

    const-class v0, Lcom/android/wallpaper/picker/PreviewActivity;

    invoke-direct {p0, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string p1, "com.android.wallpaper.picker.wallpaper_info"

    .line 3
    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    return-object p0
.end method
