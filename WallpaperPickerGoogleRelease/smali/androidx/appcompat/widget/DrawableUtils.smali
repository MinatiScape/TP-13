.class public Landroidx/appcompat/widget/DrawableUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "RestrictedAPI"
    }
.end annotation


# static fields
.field public static final CHECKED_STATE_SET:[I

.field public static final EMPTY_STATE_SET:[I

.field public static final INSETS_NONE:Landroid/graphics/Rect;


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x10100a0

    aput v2, v0, v1

    .line 1
    sput-object v0, Landroidx/appcompat/widget/DrawableUtils;->CHECKED_STATE_SET:[I

    new-array v0, v1, [I

    .line 2
    sput-object v0, Landroidx/appcompat/widget/DrawableUtils;->EMPTY_STATE_SET:[I

    .line 3
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Landroidx/appcompat/widget/DrawableUtils;->INSETS_NONE:Landroid/graphics/Rect;

    :try_start_0
    const-string v0, "android.graphics.Insets"

    .line 4
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public static canSafelyMutateDrawable(Landroid/graphics/drawable/Drawable;)Z
    .locals 4

    .line 1
    instance-of v0, p0, Landroid/graphics/drawable/DrawableContainer;

    if-eqz v0, :cond_1

    .line 2
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object p0

    .line 3
    instance-of v0, p0, Landroid/graphics/drawable/DrawableContainer$DrawableContainerState;

    if-eqz v0, :cond_4

    .line 4
    check-cast p0, Landroid/graphics/drawable/DrawableContainer$DrawableContainerState;

    .line 5
    invoke-virtual {p0}, Landroid/graphics/drawable/DrawableContainer$DrawableContainerState;->getChildren()[Landroid/graphics/drawable/Drawable;

    move-result-object p0

    array-length v0, p0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_4

    aget-object v3, p0, v2

    .line 6
    invoke-static {v3}, Landroidx/appcompat/widget/DrawableUtils;->canSafelyMutateDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v3

    if-nez v3, :cond_0

    return v1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 7
    :cond_1
    instance-of v0, p0, Landroidx/core/graphics/drawable/WrappedDrawable;

    if-eqz v0, :cond_2

    .line 8
    check-cast p0, Landroidx/core/graphics/drawable/WrappedDrawable;

    .line 9
    invoke-interface {p0}, Landroidx/core/graphics/drawable/WrappedDrawable;->getWrappedDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    .line 10
    invoke-static {p0}, Landroidx/appcompat/widget/DrawableUtils;->canSafelyMutateDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result p0

    return p0

    .line 11
    :cond_2
    instance-of v0, p0, Landroidx/appcompat/graphics/drawable/DrawableWrapper;

    if-eqz v0, :cond_3

    .line 12
    check-cast p0, Landroidx/appcompat/graphics/drawable/DrawableWrapper;

    .line 13
    iget-object p0, p0, Landroidx/appcompat/graphics/drawable/DrawableWrapper;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 14
    invoke-static {p0}, Landroidx/appcompat/widget/DrawableUtils;->canSafelyMutateDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result p0

    return p0

    .line 15
    :cond_3
    instance-of v0, p0, Landroid/graphics/drawable/ScaleDrawable;

    if-eqz v0, :cond_4

    .line 16
    check-cast p0, Landroid/graphics/drawable/ScaleDrawable;

    invoke-virtual {p0}, Landroid/graphics/drawable/ScaleDrawable;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-static {p0}, Landroidx/appcompat/widget/DrawableUtils;->canSafelyMutateDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result p0

    return p0

    :cond_4
    const/4 p0, 0x1

    return p0
.end method

.method public static getOpticalBounds(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Rect;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getOpticalInsets()Landroid/graphics/Insets;

    move-result-object p0

    .line 2
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 3
    iget v1, p0, Landroid/graphics/Insets;->left:I

    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 4
    iget v1, p0, Landroid/graphics/Insets;->right:I

    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 5
    iget v1, p0, Landroid/graphics/Insets;->top:I

    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 6
    iget p0, p0, Landroid/graphics/Insets;->bottom:I

    iput p0, v0, Landroid/graphics/Rect;->bottom:I

    return-object v0
.end method

.method public static parseTintMode(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;
    .locals 1

    const/4 v0, 0x3

    if-eq p0, v0, :cond_2

    const/4 v0, 0x5

    if-eq p0, v0, :cond_1

    const/16 v0, 0x9

    if-eq p0, v0, :cond_0

    packed-switch p0, :pswitch_data_0

    return-object p1

    .line 1
    :pswitch_0
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->ADD:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    .line 2
    :pswitch_1
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->SCREEN:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    .line 3
    :pswitch_2
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    .line 4
    :cond_0
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    .line 5
    :cond_1
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    .line 6
    :cond_2
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->SRC_OVER:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    :pswitch_data_0
    .packed-switch 0xe
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
