.class public Lcom/android/customization/model/color/ColorSectionController$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/customization/model/CustomizationManager$Callback;


# instance fields
.field public final synthetic this$0:Lcom/android/customization/model/color/ColorSectionController;

.field public final synthetic val$colorOption:Lcom/android/customization/model/color/ColorOption;


# direct methods
.method public constructor <init>(Lcom/android/customization/model/color/ColorSectionController;Lcom/android/customization/model/color/ColorOption;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/customization/model/color/ColorSectionController$2;->this$0:Lcom/android/customization/model/color/ColorSectionController;

    iput-object p2, p0, Lcom/android/customization/model/color/ColorSectionController$2;->val$colorOption:Lcom/android/customization/model/color/ColorOption;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    const-string p0, "ColorSectionController"

    const-string p1, "Apply theme with error: null"

    .line 1
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onSuccess()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/customization/model/color/ColorSectionController$2;->this$0:Lcom/android/customization/model/color/ColorSectionController;

    .line 2
    iget-object v0, v0, Lcom/android/customization/model/color/ColorSectionController;->mColorSectionView:Lcom/android/customization/picker/color/ColorSectionView;

    .line 3
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f110055

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 4
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->announceForAccessibility(Ljava/lang/CharSequence;)V

    .line 5
    iget-object v0, p0, Lcom/android/customization/model/color/ColorSectionController$2;->this$0:Lcom/android/customization/model/color/ColorSectionController;

    .line 6
    iget-object v1, v0, Lcom/android/customization/model/color/ColorSectionController;->mEventLogger:Lcom/android/customization/module/ThemesUserEventLogger;

    .line 7
    iget-object v2, p0, Lcom/android/customization/model/color/ColorSectionController$2;->val$colorOption:Lcom/android/customization/model/color/ColorOption;

    .line 8
    iget-object v3, v0, Lcom/android/customization/model/color/ColorSectionController;->mLockWallpaperColors:Landroid/app/WallpaperColors;

    const/4 v4, 0x0

    if-eqz v3, :cond_1

    iget-object v0, v0, Lcom/android/customization/model/color/ColorSectionController;->mHomeWallpaperColors:Landroid/app/WallpaperColors;

    invoke-virtual {v3, v0}, Landroid/app/WallpaperColors;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    move v0, v4

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 9
    :goto_1
    invoke-virtual {v2}, Lcom/android/customization/model/color/ColorOption;->getSource()Ljava/lang/String;

    move-result-object v3

    const-string v5, "preset"

    invoke-static {v3, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/16 v4, 0x1a

    goto :goto_2

    :cond_2
    if-eqz v0, :cond_3

    const/16 v4, 0x19

    goto :goto_2

    .line 10
    :cond_3
    invoke-virtual {v2}, Lcom/android/customization/model/color/ColorOption;->getSource()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "lock_wallpaper"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "home_wallpaper"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    goto :goto_2

    :cond_4
    const/16 v4, 0x17

    goto :goto_2

    :cond_5
    const/16 v4, 0x18

    .line 11
    :goto_2
    iget-object p0, p0, Lcom/android/customization/model/color/ColorSectionController$2;->val$colorOption:Lcom/android/customization/model/color/ColorOption;

    .line 12
    iget p0, p0, Lcom/android/customization/model/color/ColorOption;->mIndex:I

    .line 13
    invoke-interface {v1, v4, p0}, Lcom/android/customization/module/ThemesUserEventLogger;->logColorApplied(II)V

    return-void
.end method
