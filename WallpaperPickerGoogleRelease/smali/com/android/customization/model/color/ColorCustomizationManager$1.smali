.class public Lcom/android/customization/model/color/ColorCustomizationManager$1;
.super Landroid/database/ContentObserver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/customization/model/color/ColorCustomizationManager;-><init>(Lcom/android/customization/model/color/ColorOptionsProvider;Landroid/content/ContentResolver;Lcom/android/customization/model/theme/OverlayManagerCompat;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/customization/model/color/ColorCustomizationManager;


# direct methods
.method public constructor <init>(Lcom/android/customization/model/color/ColorCustomizationManager;Landroid/os/Handler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/customization/model/color/ColorCustomizationManager$1;->this$0:Lcom/android/customization/model/color/ColorCustomizationManager;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(ZLandroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/database/ContentObserver;->onChange(ZLandroid/net/Uri;)V

    .line 2
    invoke-virtual {p2}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object p1

    const-string p2, "theme_customization_overlay_packages"

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "Resetting "

    .line 3
    invoke-static {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object p2, p0, Lcom/android/customization/model/color/ColorCustomizationManager$1;->this$0:Lcom/android/customization/model/color/ColorCustomizationManager;

    .line 4
    iget-object p2, p2, Lcom/android/customization/model/color/ColorCustomizationManager;->mCurrentOverlays:Ljava/util/Map;

    .line 5
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, " to null"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "ColorCustomizationManager"

    invoke-static {p2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    iget-object p0, p0, Lcom/android/customization/model/color/ColorCustomizationManager$1;->this$0:Lcom/android/customization/model/color/ColorCustomizationManager;

    const/4 p1, 0x0

    .line 7
    iput-object p1, p0, Lcom/android/customization/model/color/ColorCustomizationManager;->mCurrentOverlays:Ljava/util/Map;

    :cond_0
    return-void
.end method
