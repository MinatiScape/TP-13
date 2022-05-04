.class public final synthetic Lcom/android/wallpaper/picker/CustomizationPickerFragment$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnApplyWindowInsetsListener;


# static fields
.field public static final synthetic INSTANCE:Lcom/android/wallpaper/picker/CustomizationPickerFragment$$ExternalSyntheticLambda0;


# direct methods
.method public static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/android/wallpaper/picker/CustomizationPickerFragment$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lcom/android/wallpaper/picker/CustomizationPickerFragment$$ExternalSyntheticLambda0;-><init>()V

    sput-object v0, Lcom/android/wallpaper/picker/CustomizationPickerFragment$$ExternalSyntheticLambda0;->INSTANCE:Lcom/android/wallpaper/picker/CustomizationPickerFragment$$ExternalSyntheticLambda0;

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

    sget p0, Lcom/android/wallpaper/picker/CustomizationPickerFragment;->$r8$clinit:I

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result p0

    .line 2
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    .line 4
    invoke-virtual {p2}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    move-result v2

    .line 5
    invoke-virtual {p1, p0, v0, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 6
    invoke-virtual {p2}, Landroid/view/WindowInsets;->consumeSystemWindowInsets()Landroid/view/WindowInsets;

    move-result-object p0

    return-object p0
.end method
