.class public final synthetic Lcom/android/wallpaper/picker/TopLevelPickerActivity$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnApplyWindowInsetsListener;


# static fields
.field public static final synthetic INSTANCE:Lcom/android/wallpaper/picker/TopLevelPickerActivity$$ExternalSyntheticLambda0;


# direct methods
.method public static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lcom/android/wallpaper/picker/TopLevelPickerActivity$$ExternalSyntheticLambda0;-><init>()V

    sput-object v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$$ExternalSyntheticLambda0;->INSTANCE:Lcom/android/wallpaper/picker/TopLevelPickerActivity$$ExternalSyntheticLambda0;

    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onApplyWindowInsets(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 3

    sget p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->$r8$clinit:I

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result p0

    invoke-virtual {p2}, Landroid/view/WindowInsets;->getSystemWindowInsetTop()I

    move-result v0

    .line 2
    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result v2

    .line 3
    invoke-virtual {p1, p0, v0, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 4
    sget p0, Lcom/android/wallpaper/compat/BuildCompat;->sSdk:I

    const/16 p1, 0x1d

    const/4 v0, 0x0

    if-lt p0, p1, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    move p0, v0

    :goto_0
    if-eqz p0, :cond_1

    .line 5
    new-instance p0, Landroid/view/WindowInsets$Builder;

    invoke-direct {p0, p2}, Landroid/view/WindowInsets$Builder;-><init>(Landroid/view/WindowInsets;)V

    .line 6
    invoke-virtual {p2}, Landroid/view/WindowInsets;->getSystemWindowInsetLeft()I

    move-result p1

    .line 7
    invoke-virtual {p2}, Landroid/view/WindowInsets;->getStableInsetRight()I

    move-result v1

    .line 8
    invoke-virtual {p2}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    move-result p2

    .line 9
    invoke-static {p1, v0, v1, p2}, Landroid/graphics/Insets;->of(IIII)Landroid/graphics/Insets;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/WindowInsets$Builder;->setSystemWindowInsets(Landroid/graphics/Insets;)Landroid/view/WindowInsets$Builder;

    .line 10
    invoke-virtual {p0}, Landroid/view/WindowInsets$Builder;->build()Landroid/view/WindowInsets;

    move-result-object p0

    goto :goto_1

    .line 11
    :cond_1
    invoke-virtual {p2}, Landroid/view/WindowInsets;->getSystemWindowInsetLeft()I

    move-result p0

    .line 12
    invoke-virtual {p2}, Landroid/view/WindowInsets;->getStableInsetRight()I

    move-result p1

    .line 13
    invoke-virtual {p2}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    move-result v1

    .line 14
    invoke-virtual {p2, p0, v0, p1, v1}, Landroid/view/WindowInsets;->replaceSystemWindowInsets(IIII)Landroid/view/WindowInsets;

    move-result-object p0

    :goto_1
    return-object p0
.end method
