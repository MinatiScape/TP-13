.class public Lcom/google/android/material/textfield/TextInputLayout;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/textfield/TextInputLayout$AccessibilityDelegate;,
        Lcom/google/android/material/textfield/TextInputLayout$SavedState;,
        Lcom/google/android/material/textfield/TextInputLayout$OnEndIconChangedListener;,
        Lcom/google/android/material/textfield/TextInputLayout$OnEditTextAttachedListener;
    }
.end annotation


# instance fields
.field public animator:Landroid/animation/ValueAnimator;

.field public boxBackground:Lcom/google/android/material/shape/MaterialShapeDrawable;

.field public boxBackgroundColor:I

.field public boxBackgroundMode:I

.field public boxCollapsedPaddingTopPx:I

.field public boxLabelCutoutHeight:I

.field public final boxLabelCutoutPaddingPx:I

.field public boxStrokeColor:I

.field public boxStrokeWidthDefaultPx:I

.field public boxStrokeWidthFocusedPx:I

.field public boxStrokeWidthPx:I

.field public boxUnderline:Lcom/google/android/material/shape/MaterialShapeDrawable;

.field public final collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

.field public counterEnabled:Z

.field public counterMaxLength:I

.field public counterOverflowTextAppearance:I

.field public counterOverflowTextColor:Landroid/content/res/ColorStateList;

.field public counterOverflowed:Z

.field public counterTextAppearance:I

.field public counterTextColor:Landroid/content/res/ColorStateList;

.field public counterView:Landroid/widget/TextView;

.field public defaultFilledBackgroundColor:I

.field public defaultHintTextColor:Landroid/content/res/ColorStateList;

.field public defaultStrokeColor:I

.field public disabledColor:I

.field public disabledFilledBackgroundColor:I

.field public editText:Landroid/widget/EditText;

.field public final editTextAttachedListeners:Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashSet<",
            "Lcom/google/android/material/textfield/TextInputLayout$OnEditTextAttachedListener;",
            ">;"
        }
    .end annotation
.end field

.field public endDummyDrawable:Landroid/graphics/drawable/Drawable;

.field public endDummyDrawableWidth:I

.field public final endIconChangedListeners:Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashSet<",
            "Lcom/google/android/material/textfield/TextInputLayout$OnEndIconChangedListener;",
            ">;"
        }
    .end annotation
.end field

.field public final endIconDelegates:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/google/android/material/textfield/EndIconDelegate;",
            ">;"
        }
    .end annotation
.end field

.field public final endIconFrame:Landroid/widget/FrameLayout;

.field public endIconMode:I

.field public endIconOnLongClickListener:Landroid/view/View$OnLongClickListener;

.field public endIconTintList:Landroid/content/res/ColorStateList;

.field public endIconTintMode:Landroid/graphics/PorterDuff$Mode;

.field public final endIconView:Lcom/google/android/material/internal/CheckableImageButton;

.field public final endLayout:Landroid/widget/LinearLayout;

.field public errorIconTintList:Landroid/content/res/ColorStateList;

.field public final errorIconView:Lcom/google/android/material/internal/CheckableImageButton;

.field public expandedHintEnabled:Z

.field public focusedFilledBackgroundColor:I

.field public focusedStrokeColor:I

.field public focusedTextColor:Landroid/content/res/ColorStateList;

.field public hasEndIconTintList:Z

.field public hasEndIconTintMode:Z

.field public hasStartIconTintList:Z

.field public hasStartIconTintMode:Z

.field public hint:Ljava/lang/CharSequence;

.field public hintAnimationEnabled:Z

.field public hintEnabled:Z

.field public hintExpanded:Z

.field public hoveredFilledBackgroundColor:I

.field public hoveredStrokeColor:I

.field public inDrawableStateChanged:Z

.field public final indicatorViewController:Lcom/google/android/material/textfield/IndicatorViewController;

.field public final inputFrame:Landroid/widget/FrameLayout;

.field public isProvidingHint:Z

.field public maxWidth:I

.field public minWidth:I

.field public originalEditTextEndDrawable:Landroid/graphics/drawable/Drawable;

.field public originalHint:Ljava/lang/CharSequence;

.field public placeholderEnabled:Z

.field public placeholderText:Ljava/lang/CharSequence;

.field public placeholderTextAppearance:I

.field public placeholderTextColor:Landroid/content/res/ColorStateList;

.field public placeholderTextView:Landroid/widget/TextView;

.field public prefixText:Ljava/lang/CharSequence;

.field public final prefixTextView:Landroid/widget/TextView;

.field public restoringSavedState:Z

.field public shapeAppearanceModel:Lcom/google/android/material/shape/ShapeAppearanceModel;

.field public startDummyDrawable:Landroid/graphics/drawable/Drawable;

.field public startDummyDrawableWidth:I

.field public startIconOnLongClickListener:Landroid/view/View$OnLongClickListener;

.field public startIconTintList:Landroid/content/res/ColorStateList;

.field public startIconTintMode:Landroid/graphics/PorterDuff$Mode;

.field public final startIconView:Lcom/google/android/material/internal/CheckableImageButton;

.field public final startLayout:Landroid/widget/LinearLayout;

.field public strokeErrorColor:Landroid/content/res/ColorStateList;

.field public suffixText:Ljava/lang/CharSequence;

.field public final suffixTextView:Landroid/widget/TextView;

.field public final tmpBoundsRect:Landroid/graphics/Rect;

.field public final tmpRect:Landroid/graphics/Rect;

.field public final tmpRectF:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/textfield/TextInputLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const v0, 0x7f04039d

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/textfield/TextInputLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 40

    move-object/from16 v6, p0

    move-object/from16 v7, p2

    move/from16 v8, p3

    const v9, 0x7f1202b3

    move-object/from16 v0, p1

    .line 3
    invoke-static {v0, v7, v8, v9}, Lcom/google/android/material/theme/overlay/MaterialThemeOverlay;->wrap(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;

    move-result-object v0

    invoke-direct {v6, v0, v7, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v10, -0x1

    .line 4
    iput v10, v6, Lcom/google/android/material/textfield/TextInputLayout;->minWidth:I

    .line 5
    iput v10, v6, Lcom/google/android/material/textfield/TextInputLayout;->maxWidth:I

    .line 6
    new-instance v11, Lcom/google/android/material/textfield/IndicatorViewController;

    invoke-direct {v11, v6}, Lcom/google/android/material/textfield/IndicatorViewController;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    iput-object v11, v6, Lcom/google/android/material/textfield/TextInputLayout;->indicatorViewController:Lcom/google/android/material/textfield/IndicatorViewController;

    .line 7
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->tmpRect:Landroid/graphics/Rect;

    .line 8
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->tmpBoundsRect:Landroid/graphics/Rect;

    .line 9
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->tmpRectF:Landroid/graphics/RectF;

    .line 10
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->editTextAttachedListeners:Ljava/util/LinkedHashSet;

    const/4 v12, 0x0

    .line 11
    iput v12, v6, Lcom/google/android/material/textfield/TextInputLayout;->endIconMode:I

    .line 12
    new-instance v13, Landroid/util/SparseArray;

    invoke-direct {v13}, Landroid/util/SparseArray;-><init>()V

    iput-object v13, v6, Lcom/google/android/material/textfield/TextInputLayout;->endIconDelegates:Landroid/util/SparseArray;

    .line 13
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->endIconChangedListeners:Ljava/util/LinkedHashSet;

    .line 14
    new-instance v14, Lcom/google/android/material/internal/CollapsingTextHelper;

    invoke-direct {v14, v6}, Lcom/google/android/material/internal/CollapsingTextHelper;-><init>(Landroid/view/View;)V

    iput-object v14, v6, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    .line 15
    invoke-virtual/range {p0 .. p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v15

    const/4 v5, 0x1

    .line 16
    invoke-virtual {v6, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 17
    invoke-virtual {v6, v12}, Landroid/widget/LinearLayout;->setWillNotDraw(Z)V

    .line 18
    invoke-virtual {v6, v5}, Landroid/widget/LinearLayout;->setAddStatesFromChildren(Z)V

    .line 19
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, v15}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->inputFrame:Landroid/widget/FrameLayout;

    .line 20
    invoke-virtual {v0, v5}, Landroid/widget/FrameLayout;->setAddStatesFromChildren(Z)V

    .line 21
    invoke-virtual {v6, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 22
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, v15}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v4, v6, Lcom/google/android/material/textfield/TextInputLayout;->startLayout:Landroid/widget/LinearLayout;

    .line 23
    invoke-virtual {v4, v12}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 24
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v3, -0x2

    const v2, 0x800003

    invoke-direct {v1, v3, v10, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v4, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 26
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v15}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, v6, Lcom/google/android/material/textfield/TextInputLayout;->endLayout:Landroid/widget/LinearLayout;

    .line 27
    invoke-virtual {v2, v12}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 28
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const v5, 0x800005

    invoke-direct {v1, v3, v10, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 29
    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 30
    new-instance v5, Landroid/widget/FrameLayout;

    invoke-direct {v5, v15}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v5, v6, Lcom/google/android/material/textfield/TextInputLayout;->endIconFrame:Landroid/widget/FrameLayout;

    .line 31
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v3, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 32
    sget-object v0, Lcom/google/android/material/animation/AnimationUtils;->LINEAR_INTERPOLATOR:Landroid/animation/TimeInterpolator;

    .line 33
    iput-object v0, v14, Lcom/google/android/material/internal/CollapsingTextHelper;->textSizeInterpolator:Landroid/animation/TimeInterpolator;

    .line 34
    invoke-virtual {v14, v12}, Lcom/google/android/material/internal/CollapsingTextHelper;->recalculate(Z)V

    .line 35
    iput-object v0, v14, Lcom/google/android/material/internal/CollapsingTextHelper;->positionInterpolator:Landroid/animation/TimeInterpolator;

    .line 36
    invoke-virtual {v14, v12}, Lcom/google/android/material/internal/CollapsingTextHelper;->recalculate(Z)V

    const v0, 0x800033

    .line 37
    invoke-virtual {v14, v0}, Lcom/google/android/material/internal/CollapsingTextHelper;->setCollapsedTextGravity(I)V

    .line 38
    sget-object v1, Lcom/google/android/material/R$styleable;->TextInputLayout:[I

    const/4 v0, 0x5

    new-array v12, v0, [I

    fill-array-data v12, :array_0

    .line 39
    invoke-static {v15, v7, v8, v9}, Lcom/google/android/material/internal/ThemeEnforcement;->checkCompatibleTheme(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const v16, 0x7f1202b3

    move-object v0, v15

    move-object/from16 v17, v1

    move-object/from16 v1, p2

    move-object/from16 v18, v2

    move-object/from16 v2, v17

    move/from16 v3, p3

    move-object/from16 v19, v4

    move/from16 v4, v16

    move-object/from16 v20, v5

    const/4 v10, 0x1

    move-object v5, v12

    .line 40
    invoke-static/range {v0 .. v5}, Lcom/google/android/material/internal/ThemeEnforcement;->checkTextAppearance(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)V

    .line 41
    new-instance v12, Landroidx/appcompat/widget/TintTypedArray;

    move-object/from16 v0, v17

    .line 42
    invoke-virtual {v15, v7, v0, v8, v9}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v5

    invoke-direct {v12, v15, v5}, Landroidx/appcompat/widget/TintTypedArray;-><init>(Landroid/content/Context;Landroid/content/res/TypedArray;)V

    const/16 v0, 0x29

    .line 43
    invoke-virtual {v12, v0, v10}, Landroidx/appcompat/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result v0

    iput-boolean v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->hintEnabled:Z

    const/4 v0, 0x4

    .line 44
    invoke-virtual {v12, v0}, Landroidx/appcompat/widget/TintTypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v6, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setHint(Ljava/lang/CharSequence;)V

    const/16 v0, 0x28

    .line 45
    invoke-virtual {v12, v0, v10}, Landroidx/appcompat/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result v0

    iput-boolean v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->hintAnimationEnabled:Z

    const/16 v0, 0x23

    .line 46
    invoke-virtual {v12, v0, v10}, Landroidx/appcompat/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result v0

    iput-boolean v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->expandedHintEnabled:Z

    const/4 v4, 0x3

    .line 47
    invoke-virtual {v12, v4}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    .line 48
    invoke-virtual {v12, v4, v0}, Landroidx/appcompat/widget/TintTypedArray;->getDimensionPixelSize(II)I

    move-result v1

    .line 49
    iput v1, v6, Lcom/google/android/material/textfield/TextInputLayout;->minWidth:I

    .line 50
    iget-object v2, v6, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-eqz v2, :cond_1

    if-eq v1, v0, :cond_1

    .line 51
    invoke-virtual {v2, v1}, Landroid/widget/EditText;->setMinWidth(I)V

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    :cond_1
    :goto_0
    const/4 v3, 0x2

    .line 52
    invoke-virtual {v12, v3}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 53
    invoke-virtual {v12, v3, v0}, Landroidx/appcompat/widget/TintTypedArray;->getDimensionPixelSize(II)I

    move-result v1

    .line 54
    iput v1, v6, Lcom/google/android/material/textfield/TextInputLayout;->maxWidth:I

    .line 55
    iget-object v2, v6, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-eqz v2, :cond_2

    if-eq v1, v0, :cond_2

    .line 56
    invoke-virtual {v2, v1}, Landroid/widget/EditText;->setMaxWidth(I)V

    .line 57
    :cond_2
    invoke-static {v15, v7, v8, v9}, Lcom/google/android/material/shape/ShapeAppearanceModel;->builder(Landroid/content/Context;Landroid/util/AttributeSet;II)Lcom/google/android/material/shape/ShapeAppearanceModel$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/material/shape/ShapeAppearanceModel$Builder;->build()Lcom/google/android/material/shape/ShapeAppearanceModel;

    move-result-object v0

    iput-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->shapeAppearanceModel:Lcom/google/android/material/shape/ShapeAppearanceModel;

    .line 58
    invoke-virtual {v15}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f070203

    .line 59
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    iput v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->boxLabelCutoutPaddingPx:I

    const/4 v0, 0x7

    const/4 v1, 0x0

    .line 60
    invoke-virtual {v12, v0, v1}, Landroidx/appcompat/widget/TintTypedArray;->getDimensionPixelOffset(II)I

    move-result v0

    iput v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->boxCollapsedPaddingTopPx:I

    const/16 v0, 0xe

    .line 61
    invoke-virtual {v15}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f070204

    .line 62
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 63
    invoke-virtual {v12, v0, v1}, Landroidx/appcompat/widget/TintTypedArray;->getDimensionPixelSize(II)I

    move-result v0

    iput v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeWidthDefaultPx:I

    const/16 v0, 0xf

    .line 64
    invoke-virtual {v15}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f070205

    .line 65
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 66
    invoke-virtual {v12, v0, v1}, Landroidx/appcompat/widget/TintTypedArray;->getDimensionPixelSize(II)I

    move-result v0

    iput v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeWidthFocusedPx:I

    .line 67
    iget v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeWidthDefaultPx:I

    iput v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeWidthPx:I

    const/16 v0, 0xb

    const/high16 v1, -0x40800000    # -1.0f

    .line 68
    invoke-virtual {v12, v0, v1}, Landroidx/appcompat/widget/TintTypedArray;->getDimension(IF)F

    move-result v0

    const/16 v2, 0xa

    .line 69
    invoke-virtual {v12, v2, v1}, Landroidx/appcompat/widget/TintTypedArray;->getDimension(IF)F

    move-result v2

    const/16 v7, 0x8

    .line 70
    invoke-virtual {v12, v7, v1}, Landroidx/appcompat/widget/TintTypedArray;->getDimension(IF)F

    move-result v8

    const/16 v9, 0x9

    .line 71
    invoke-virtual {v12, v9, v1}, Landroidx/appcompat/widget/TintTypedArray;->getDimension(IF)F

    move-result v1

    .line 72
    iget-object v9, v6, Lcom/google/android/material/textfield/TextInputLayout;->shapeAppearanceModel:Lcom/google/android/material/shape/ShapeAppearanceModel;

    invoke-static {v9}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    new-instance v4, Lcom/google/android/material/shape/ShapeAppearanceModel$Builder;

    invoke-direct {v4, v9}, Lcom/google/android/material/shape/ShapeAppearanceModel$Builder;-><init>(Lcom/google/android/material/shape/ShapeAppearanceModel;)V

    const/4 v9, 0x0

    cmpl-float v17, v0, v9

    if-ltz v17, :cond_3

    .line 74
    invoke-virtual {v4, v0}, Lcom/google/android/material/shape/ShapeAppearanceModel$Builder;->setTopLeftCornerSize(F)Lcom/google/android/material/shape/ShapeAppearanceModel$Builder;

    :cond_3
    cmpl-float v0, v2, v9

    if-ltz v0, :cond_4

    .line 75
    invoke-virtual {v4, v2}, Lcom/google/android/material/shape/ShapeAppearanceModel$Builder;->setTopRightCornerSize(F)Lcom/google/android/material/shape/ShapeAppearanceModel$Builder;

    :cond_4
    cmpl-float v0, v8, v9

    if-ltz v0, :cond_5

    .line 76
    invoke-virtual {v4, v8}, Lcom/google/android/material/shape/ShapeAppearanceModel$Builder;->setBottomRightCornerSize(F)Lcom/google/android/material/shape/ShapeAppearanceModel$Builder;

    :cond_5
    cmpl-float v0, v1, v9

    if-ltz v0, :cond_6

    .line 77
    invoke-virtual {v4, v1}, Lcom/google/android/material/shape/ShapeAppearanceModel$Builder;->setBottomLeftCornerSize(F)Lcom/google/android/material/shape/ShapeAppearanceModel$Builder;

    .line 78
    :cond_6
    invoke-virtual {v4}, Lcom/google/android/material/shape/ShapeAppearanceModel$Builder;->build()Lcom/google/android/material/shape/ShapeAppearanceModel;

    move-result-object v0

    iput-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->shapeAppearanceModel:Lcom/google/android/material/shape/ShapeAppearanceModel;

    const/4 v0, 0x5

    .line 79
    invoke-static {v15, v12, v0}, Lcom/google/android/material/resources/MaterialResources;->getColorStateList(Landroid/content/Context;Landroidx/appcompat/widget/TintTypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    const v1, -0x101009e

    if-eqz v0, :cond_8

    .line 80
    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v2

    iput v2, v6, Lcom/google/android/material/textfield/TextInputLayout;->defaultFilledBackgroundColor:I

    .line 81
    iput v2, v6, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundColor:I

    .line 82
    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v2

    if-eqz v2, :cond_7

    new-array v2, v10, [I

    const/4 v4, 0x0

    aput v1, v2, v4

    const/4 v4, -0x1

    .line 83
    invoke-virtual {v0, v2, v4}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v2

    iput v2, v6, Lcom/google/android/material/textfield/TextInputLayout;->disabledFilledBackgroundColor:I

    new-array v2, v3, [I

    .line 84
    fill-array-data v2, :array_1

    .line 85
    invoke-virtual {v0, v2, v4}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v2

    iput v2, v6, Lcom/google/android/material/textfield/TextInputLayout;->focusedFilledBackgroundColor:I

    new-array v2, v3, [I

    .line 86
    fill-array-data v2, :array_2

    .line 87
    invoke-virtual {v0, v2, v4}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    iput v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->hoveredFilledBackgroundColor:I

    const/4 v8, 0x0

    goto :goto_1

    :cond_7
    const/4 v4, -0x1

    .line 88
    iget v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->defaultFilledBackgroundColor:I

    iput v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->focusedFilledBackgroundColor:I

    const v0, 0x7f0600b3

    .line 89
    sget-object v2, Landroidx/appcompat/content/res/AppCompatResources;->TL_TYPED_VALUE:Ljava/lang/ThreadLocal;

    .line 90
    invoke-virtual {v15, v0}, Landroid/content/Context;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    new-array v2, v10, [I

    const/4 v8, 0x0

    aput v1, v2, v8

    .line 91
    invoke-virtual {v0, v2, v4}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v2

    iput v2, v6, Lcom/google/android/material/textfield/TextInputLayout;->disabledFilledBackgroundColor:I

    new-array v2, v10, [I

    const v9, 0x1010367

    aput v9, v2, v8

    .line 92
    invoke-virtual {v0, v2, v4}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    iput v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->hoveredFilledBackgroundColor:I

    goto :goto_1

    :cond_8
    const/4 v8, 0x0

    .line 93
    iput v8, v6, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundColor:I

    .line 94
    iput v8, v6, Lcom/google/android/material/textfield/TextInputLayout;->defaultFilledBackgroundColor:I

    .line 95
    iput v8, v6, Lcom/google/android/material/textfield/TextInputLayout;->disabledFilledBackgroundColor:I

    .line 96
    iput v8, v6, Lcom/google/android/material/textfield/TextInputLayout;->focusedFilledBackgroundColor:I

    .line 97
    iput v8, v6, Lcom/google/android/material/textfield/TextInputLayout;->hoveredFilledBackgroundColor:I

    .line 98
    :goto_1
    invoke-virtual {v12, v10}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 99
    invoke-virtual {v12, v10}, Landroidx/appcompat/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->focusedTextColor:Landroid/content/res/ColorStateList;

    iput-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->defaultHintTextColor:Landroid/content/res/ColorStateList;

    :cond_9
    const/16 v0, 0xc

    .line 100
    invoke-static {v15, v12, v0}, Lcom/google/android/material/resources/MaterialResources;->getColorStateList(Landroid/content/Context;Landroidx/appcompat/widget/TintTypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v2

    .line 101
    invoke-virtual {v12, v0, v8}, Landroidx/appcompat/widget/TintTypedArray;->getColor(II)I

    move-result v0

    iput v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->focusedStrokeColor:I

    const v0, 0x7f0600ca

    .line 102
    sget-object v4, Landroidx/core/content/ContextCompat;->sLock:Ljava/lang/Object;

    .line 103
    invoke-virtual {v15, v0}, Landroid/content/Context;->getColor(I)I

    move-result v0

    .line 104
    iput v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->defaultStrokeColor:I

    const v0, 0x7f0600cb

    .line 105
    invoke-virtual {v15, v0}, Landroid/content/Context;->getColor(I)I

    move-result v0

    .line 106
    iput v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->disabledColor:I

    const v0, 0x7f0600ce

    .line 107
    invoke-virtual {v15, v0}, Landroid/content/Context;->getColor(I)I

    move-result v0

    .line 108
    iput v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->hoveredStrokeColor:I

    if-eqz v2, :cond_c

    .line 109
    invoke-virtual {v2}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 110
    invoke-virtual {v2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    iput v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->defaultStrokeColor:I

    new-array v0, v10, [I

    const/4 v4, 0x0

    aput v1, v0, v4

    const/4 v1, -0x1

    .line 111
    invoke-virtual {v2, v0, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    iput v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->disabledColor:I

    new-array v0, v3, [I

    .line 112
    fill-array-data v0, :array_3

    .line 113
    invoke-virtual {v2, v0, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    iput v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->hoveredStrokeColor:I

    new-array v0, v3, [I

    .line 114
    fill-array-data v0, :array_4

    .line 115
    invoke-virtual {v2, v0, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    iput v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->focusedStrokeColor:I

    goto :goto_2

    .line 116
    :cond_a
    iget v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->focusedStrokeColor:I

    invoke-virtual {v2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v1

    if-eq v0, v1, :cond_b

    .line 117
    invoke-virtual {v2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    iput v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->focusedStrokeColor:I

    .line 118
    :cond_b
    :goto_2
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateTextInputBoxState()V

    :cond_c
    const/16 v0, 0xd

    .line 119
    invoke-virtual {v12, v0}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 120
    invoke-static {v15, v12, v0}, Lcom/google/android/material/resources/MaterialResources;->getColorStateList(Landroid/content/Context;Landroidx/appcompat/widget/TintTypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    .line 121
    iget-object v1, v6, Lcom/google/android/material/textfield/TextInputLayout;->strokeErrorColor:Landroid/content/res/ColorStateList;

    if-eq v1, v0, :cond_d

    .line 122
    iput-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->strokeErrorColor:Landroid/content/res/ColorStateList;

    .line 123
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateTextInputBoxState()V

    :cond_d
    const/16 v0, 0x2a

    const/4 v1, -0x1

    .line 124
    invoke-virtual {v12, v0, v1}, Landroidx/appcompat/widget/TintTypedArray;->getResourceId(II)I

    move-result v2

    if-eq v2, v1, :cond_e

    const/4 v1, 0x0

    .line 125
    invoke-virtual {v12, v0, v1}, Landroidx/appcompat/widget/TintTypedArray;->getResourceId(II)I

    move-result v0

    .line 126
    invoke-virtual {v14, v0}, Lcom/google/android/material/internal/CollapsingTextHelper;->setCollapsedTextAppearance(I)V

    .line 127
    iget-object v0, v14, Lcom/google/android/material/internal/CollapsingTextHelper;->collapsedTextColor:Landroid/content/res/ColorStateList;

    .line 128
    iput-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->focusedTextColor:Landroid/content/res/ColorStateList;

    .line 129
    iget-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-eqz v0, :cond_f

    .line 130
    invoke-virtual {v6, v1, v1}, Lcom/google/android/material/textfield/TextInputLayout;->updateLabelState(ZZ)V

    .line 131
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateInputLayoutMargins()V

    goto :goto_3

    :cond_e
    const/4 v1, 0x0

    :cond_f
    :goto_3
    const/16 v0, 0x21

    .line 132
    invoke-virtual {v12, v0, v1}, Landroidx/appcompat/widget/TintTypedArray;->getResourceId(II)I

    move-result v8

    const/16 v0, 0x1c

    .line 133
    invoke-virtual {v12, v0}, Landroidx/appcompat/widget/TintTypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v9

    const/16 v0, 0x1d

    .line 134
    invoke-virtual {v12, v0, v1}, Landroidx/appcompat/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result v4

    .line 135
    invoke-virtual/range {p0 .. p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v2, 0x7f0d0052

    move-object/from16 v10, v18

    .line 136
    invoke-virtual {v0, v2, v10, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/internal/CheckableImageButton;

    iput-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->errorIconView:Lcom/google/android/material/internal/CheckableImageButton;

    const v2, 0x7f0a024a

    .line 137
    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setId(I)V

    .line 138
    invoke-virtual {v0, v7}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 139
    invoke-static {v15}, Lcom/google/android/material/resources/MaterialResources;->isFontScaleAtLeast1_3(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 140
    invoke-virtual {v0}, Landroid/widget/ImageButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 141
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    :cond_10
    const/16 v1, 0x1e

    .line 142
    invoke-virtual {v12, v1}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_11

    .line 143
    invoke-virtual {v12, v1}, Landroidx/appcompat/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v6, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setErrorIconDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_11
    const/16 v1, 0x1f

    .line 144
    invoke-virtual {v12, v1}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_13

    .line 145
    invoke-static {v15, v12, v1}, Lcom/google/android/material/resources/MaterialResources;->getColorStateList(Landroid/content/Context;Landroidx/appcompat/widget/TintTypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 146
    iput-object v1, v6, Lcom/google/android/material/textfield/TextInputLayout;->errorIconTintList:Landroid/content/res/ColorStateList;

    .line 147
    invoke-virtual {v0}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_12

    .line 148
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 149
    invoke-virtual {v2, v1}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    .line 150
    :cond_12
    invoke-virtual {v0}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eq v1, v2, :cond_13

    .line 151
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_13
    const/16 v1, 0x20

    .line 152
    invoke-virtual {v12, v1}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v2

    const/4 v7, 0x0

    if-eqz v2, :cond_15

    const/4 v2, -0x1

    .line 153
    invoke-virtual {v12, v1, v2}, Landroidx/appcompat/widget/TintTypedArray;->getInt(II)I

    move-result v1

    .line 154
    invoke-static {v1, v7}, Lcom/google/android/material/internal/ViewUtils;->parseTintMode(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v1

    .line 155
    invoke-virtual {v0}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_14

    .line 156
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 157
    invoke-virtual {v2, v1}, Landroid/graphics/drawable/Drawable;->setTintMode(Landroid/graphics/PorterDuff$Mode;)V

    .line 158
    :cond_14
    invoke-virtual {v0}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eq v1, v2, :cond_15

    .line 159
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 160
    :cond_15
    invoke-virtual/range {p0 .. p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f11007e

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    .line 161
    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 162
    sget-object v1, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 163
    invoke-virtual {v0, v3}, Landroid/view/View;->setImportantForAccessibility(I)V

    const/4 v1, 0x0

    .line 164
    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setClickable(Z)V

    .line 165
    iput-boolean v1, v0, Lcom/google/android/material/internal/CheckableImageButton;->pressable:Z

    .line 166
    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setFocusable(Z)V

    const/16 v2, 0x26

    .line 167
    invoke-virtual {v12, v2, v1}, Landroidx/appcompat/widget/TintTypedArray;->getResourceId(II)I

    move-result v2

    const/16 v3, 0x25

    .line 168
    invoke-virtual {v12, v3, v1}, Landroidx/appcompat/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result v3

    const/16 v7, 0x24

    .line 169
    invoke-virtual {v12, v7}, Landroidx/appcompat/widget/TintTypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v7

    move-object/from16 v21, v0

    const/16 v0, 0x32

    .line 170
    invoke-virtual {v12, v0, v1}, Landroidx/appcompat/widget/TintTypedArray;->getResourceId(II)I

    move-result v0

    const/16 v1, 0x31

    .line 171
    invoke-virtual {v12, v1}, Landroidx/appcompat/widget/TintTypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    move/from16 v22, v0

    const/16 v0, 0x35

    move-object/from16 v23, v1

    const/4 v1, 0x0

    .line 172
    invoke-virtual {v12, v0, v1}, Landroidx/appcompat/widget/TintTypedArray;->getResourceId(II)I

    move-result v0

    const/16 v1, 0x34

    .line 173
    invoke-virtual {v12, v1}, Landroidx/appcompat/widget/TintTypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    move/from16 v24, v0

    const/16 v0, 0x3f

    move-object/from16 v25, v1

    const/4 v1, 0x0

    .line 174
    invoke-virtual {v12, v0, v1}, Landroidx/appcompat/widget/TintTypedArray;->getResourceId(II)I

    move-result v0

    const/16 v1, 0x3e

    .line 175
    invoke-virtual {v12, v1}, Landroidx/appcompat/widget/TintTypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    move/from16 v26, v0

    const/16 v0, 0x10

    move-object/from16 v27, v1

    const/4 v1, 0x0

    .line 176
    invoke-virtual {v12, v0, v1}, Landroidx/appcompat/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result v0

    const/16 v1, 0x11

    move/from16 v28, v0

    const/4 v0, -0x1

    .line 177
    invoke-virtual {v12, v1, v0}, Landroidx/appcompat/widget/TintTypedArray;->getInt(II)I

    move-result v1

    .line 178
    iget v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->counterMaxLength:I

    if-eq v0, v1, :cond_17

    if-lez v1, :cond_16

    .line 179
    iput v1, v6, Lcom/google/android/material/textfield/TextInputLayout;->counterMaxLength:I

    goto :goto_4

    :cond_16
    const/4 v0, -0x1

    .line 180
    iput v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->counterMaxLength:I

    .line 181
    :goto_4
    iget-boolean v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->counterEnabled:Z

    if-eqz v0, :cond_17

    .line 182
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateCounter()V

    :cond_17
    const/16 v0, 0x14

    const/4 v1, 0x0

    .line 183
    invoke-virtual {v12, v0, v1}, Landroidx/appcompat/widget/TintTypedArray;->getResourceId(II)I

    move-result v0

    iput v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->counterTextAppearance:I

    const/16 v0, 0x12

    .line 184
    invoke-virtual {v12, v0, v1}, Landroidx/appcompat/widget/TintTypedArray;->getResourceId(II)I

    move-result v0

    iput v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->counterOverflowTextAppearance:I

    .line 185
    invoke-virtual/range {p0 .. p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    move/from16 v29, v2

    const v2, 0x7f0d0053

    move-object/from16 v30, v14

    move-object/from16 v14, v19

    .line 186
    invoke-virtual {v0, v2, v14, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lcom/google/android/material/internal/CheckableImageButton;

    iput-object v2, v6, Lcom/google/android/material/textfield/TextInputLayout;->startIconView:Lcom/google/android/material/internal/CheckableImageButton;

    const/16 v0, 0x8

    .line 187
    invoke-virtual {v2, v0}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 188
    invoke-static {v15}, Lcom/google/android/material/resources/MaterialResources;->isFontScaleAtLeast1_3(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 189
    invoke-virtual {v2}, Landroid/widget/ImageButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 190
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 191
    :cond_18
    iget-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->startIconOnLongClickListener:Landroid/view/View$OnLongClickListener;

    const/4 v1, 0x0

    .line 192
    invoke-virtual {v2, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 193
    invoke-static {v2, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setIconClickable(Lcom/google/android/material/internal/CheckableImageButton;Landroid/view/View$OnLongClickListener;)V

    .line 194
    iput-object v1, v6, Lcom/google/android/material/textfield/TextInputLayout;->startIconOnLongClickListener:Landroid/view/View$OnLongClickListener;

    .line 195
    invoke-virtual {v2, v1}, Landroid/widget/ImageButton;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 196
    invoke-static {v2, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setIconClickable(Lcom/google/android/material/internal/CheckableImageButton;Landroid/view/View$OnLongClickListener;)V

    const/16 v0, 0x3b

    .line 197
    invoke-virtual {v12, v0}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 198
    invoke-virtual {v12, v0}, Landroidx/appcompat/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 199
    invoke-virtual {v2, v0}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    if-eqz v0, :cond_19

    const/4 v0, 0x1

    .line 200
    invoke-virtual {v6, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setStartIconVisible(Z)V

    .line 201
    iget-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->startIconTintList:Landroid/content/res/ColorStateList;

    invoke-virtual {v6, v2, v0}, Lcom/google/android/material/textfield/TextInputLayout;->refreshIconDrawableState(Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;)V

    goto :goto_5

    :cond_19
    const/4 v0, 0x0

    .line 202
    invoke-virtual {v6, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setStartIconVisible(Z)V

    .line 203
    iget-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->startIconOnLongClickListener:Landroid/view/View$OnLongClickListener;

    const/4 v1, 0x0

    .line 204
    invoke-virtual {v2, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 205
    invoke-static {v2, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setIconClickable(Lcom/google/android/material/internal/CheckableImageButton;Landroid/view/View$OnLongClickListener;)V

    .line 206
    iput-object v1, v6, Lcom/google/android/material/textfield/TextInputLayout;->startIconOnLongClickListener:Landroid/view/View$OnLongClickListener;

    .line 207
    invoke-virtual {v2, v1}, Landroid/widget/ImageButton;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 208
    invoke-static {v2, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setIconClickable(Lcom/google/android/material/internal/CheckableImageButton;Landroid/view/View$OnLongClickListener;)V

    .line 209
    invoke-virtual {v2}, Landroid/widget/ImageButton;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_1a

    .line 210
    invoke-virtual {v2, v1}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_1a
    :goto_5
    const/16 v0, 0x3a

    .line 211
    invoke-virtual {v12, v0}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 212
    invoke-virtual {v12, v0}, Landroidx/appcompat/widget/TintTypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    .line 213
    invoke-virtual {v2}, Landroid/widget/ImageButton;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v1

    if-eq v1, v0, :cond_1b

    .line 214
    invoke-virtual {v2, v0}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_1b
    const/16 v0, 0x39

    const/4 v1, 0x1

    .line 215
    invoke-virtual {v12, v0, v1}, Landroidx/appcompat/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result v0

    .line 216
    iget-boolean v1, v2, Lcom/google/android/material/internal/CheckableImageButton;->checkable:Z

    if-eq v1, v0, :cond_1c

    .line 217
    iput-boolean v0, v2, Lcom/google/android/material/internal/CheckableImageButton;->checkable:Z

    const/4 v0, 0x0

    .line 218
    invoke-virtual {v2, v0}, Landroid/widget/ImageButton;->sendAccessibilityEvent(I)V

    :cond_1c
    const/16 v0, 0x3c

    .line 219
    invoke-virtual {v12, v0}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 220
    invoke-static {v15, v12, v0}, Lcom/google/android/material/resources/MaterialResources;->getColorStateList(Landroid/content/Context;Landroidx/appcompat/widget/TintTypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 221
    iget-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->startIconTintList:Landroid/content/res/ColorStateList;

    if-eq v0, v1, :cond_1d

    .line 222
    iput-object v1, v6, Lcom/google/android/material/textfield/TextInputLayout;->startIconTintList:Landroid/content/res/ColorStateList;

    const/4 v0, 0x1

    .line 223
    iput-boolean v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->hasStartIconTintList:Z

    .line 224
    iget-boolean v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->hasStartIconTintMode:Z

    move-object/from16 v19, v5

    iget-object v5, v6, Lcom/google/android/material/textfield/TextInputLayout;->startIconTintMode:Landroid/graphics/PorterDuff$Mode;

    const/16 v31, 0x1

    move-object/from16 v32, v9

    move-object/from16 v9, v21

    move/from16 v33, v22

    move/from16 v34, v24

    move/from16 v35, v26

    move/from16 v36, v28

    move/from16 v21, v0

    move-object/from16 v0, p0

    move-object/from16 v37, v23

    move-object/from16 v22, v25

    move-object/from16 v23, v1

    move-object v1, v2

    move-object/from16 p2, v2

    move/from16 v24, v8

    const v8, 0x7f0d0052

    move/from16 v2, v31

    move/from16 v38, v3

    move-object/from16 v3, v23

    move/from16 v39, v4

    move/from16 v4, v21

    move-object/from16 v16, v19

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/material/textfield/TextInputLayout;->applyIconTint(Lcom/google/android/material/internal/CheckableImageButton;ZLandroid/content/res/ColorStateList;ZLandroid/graphics/PorterDuff$Mode;)V

    goto :goto_6

    :cond_1d
    move-object/from16 p2, v2

    move/from16 v38, v3

    move/from16 v39, v4

    move-object/from16 v16, v5

    move-object/from16 v32, v9

    move-object/from16 v9, v21

    move/from16 v33, v22

    move-object/from16 v37, v23

    move/from16 v34, v24

    move-object/from16 v22, v25

    move/from16 v35, v26

    move/from16 v36, v28

    move/from16 v24, v8

    const v8, 0x7f0d0052

    :goto_6
    const/16 v0, 0x3d

    .line 225
    invoke-virtual {v12, v0}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_1e

    const/4 v1, -0x1

    .line 226
    invoke-virtual {v12, v0, v1}, Landroidx/appcompat/widget/TintTypedArray;->getInt(II)I

    move-result v0

    const/4 v1, 0x0

    .line 227
    invoke-static {v0, v1}, Lcom/google/android/material/internal/ViewUtils;->parseTintMode(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v5

    .line 228
    iget-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->startIconTintMode:Landroid/graphics/PorterDuff$Mode;

    if-eq v0, v5, :cond_1e

    .line 229
    iput-object v5, v6, Lcom/google/android/material/textfield/TextInputLayout;->startIconTintMode:Landroid/graphics/PorterDuff$Mode;

    const/4 v0, 0x1

    .line 230
    iput-boolean v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->hasStartIconTintMode:Z

    .line 231
    iget-boolean v2, v6, Lcom/google/android/material/textfield/TextInputLayout;->hasStartIconTintList:Z

    iget-object v3, v6, Lcom/google/android/material/textfield/TextInputLayout;->startIconTintList:Landroid/content/res/ColorStateList;

    const/4 v4, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/material/textfield/TextInputLayout;->applyIconTint(Lcom/google/android/material/internal/CheckableImageButton;ZLandroid/content/res/ColorStateList;ZLandroid/graphics/PorterDuff$Mode;)V

    :cond_1e
    const/4 v0, 0x6

    const/4 v1, 0x0

    .line 232
    invoke-virtual {v12, v0, v1}, Landroidx/appcompat/widget/TintTypedArray;->getInt(II)I

    move-result v0

    .line 233
    iget v1, v6, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundMode:I

    if-ne v0, v1, :cond_1f

    goto :goto_7

    .line 234
    :cond_1f
    iput v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundMode:I

    .line 235
    iget-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-eqz v0, :cond_20

    .line 236
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/textfield/TextInputLayout;->onApplyBoxBackgroundMode()V

    .line 237
    :cond_20
    :goto_7
    invoke-virtual/range {p0 .. p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    move-object/from16 v1, v20

    const/4 v2, 0x0

    .line 238
    invoke-virtual {v0, v8, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/internal/CheckableImageButton;

    iput-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->endIconView:Lcom/google/android/material/internal/CheckableImageButton;

    .line 239
    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    const/16 v3, 0x8

    .line 240
    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 241
    invoke-static {v15}, Lcom/google/android/material/resources/MaterialResources;->isFontScaleAtLeast1_3(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_21

    .line 242
    invoke-virtual {v0}, Landroid/widget/ImageButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 243
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 244
    :cond_21
    new-instance v0, Lcom/google/android/material/textfield/CustomEndIconDelegate;

    invoke-direct {v0, v6}, Lcom/google/android/material/textfield/CustomEndIconDelegate;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    const/4 v3, -0x1

    invoke-virtual {v13, v3, v0}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 245
    new-instance v0, Lcom/google/android/material/textfield/NoEndIconDelegate;

    invoke-direct {v0, v6}, Lcom/google/android/material/textfield/NoEndIconDelegate;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    invoke-virtual {v13, v2, v0}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 246
    new-instance v0, Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate;

    invoke-direct {v0, v6}, Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    const/4 v2, 0x1

    invoke-virtual {v13, v2, v0}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 247
    new-instance v0, Lcom/google/android/material/textfield/ClearTextEndIconDelegate;

    invoke-direct {v0, v6}, Lcom/google/android/material/textfield/ClearTextEndIconDelegate;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    const/4 v2, 0x2

    invoke-virtual {v13, v2, v0}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 248
    new-instance v0, Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;

    invoke-direct {v0, v6}, Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    const/4 v3, 0x3

    invoke-virtual {v13, v3, v0}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    const/16 v0, 0x19

    .line 249
    invoke-virtual {v12, v0}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v3

    const/16 v4, 0x2e

    if-eqz v3, :cond_24

    const/4 v3, 0x0

    .line 250
    invoke-virtual {v12, v0, v3}, Landroidx/appcompat/widget/TintTypedArray;->getInt(II)I

    move-result v0

    invoke-virtual {v6, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconMode(I)V

    const/16 v0, 0x18

    .line 251
    invoke-virtual {v12, v0}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_22

    .line 252
    invoke-virtual {v12, v0}, Landroidx/appcompat/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v6, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_22
    const/16 v0, 0x17

    .line 253
    invoke-virtual {v12, v0}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_23

    .line 254
    invoke-virtual {v12, v0}, Landroidx/appcompat/widget/TintTypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    .line 255
    invoke-virtual {v6, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconContentDescription(Ljava/lang/CharSequence;)V

    :cond_23
    const/16 v0, 0x16

    const/4 v3, 0x1

    .line 256
    invoke-virtual {v12, v0, v3}, Landroidx/appcompat/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result v0

    invoke-virtual {v6, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconCheckable(Z)V

    goto :goto_8

    .line 257
    :cond_24
    invoke-virtual {v12, v4}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_26

    const/4 v0, 0x0

    .line 258
    invoke-virtual {v12, v4, v0}, Landroidx/appcompat/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result v3

    .line 259
    invoke-virtual {v6, v3}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconMode(I)V

    const/16 v0, 0x2d

    .line 260
    invoke-virtual {v12, v0}, Landroidx/appcompat/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v6, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconDrawable(Landroid/graphics/drawable/Drawable;)V

    const/16 v0, 0x2c

    .line 261
    invoke-virtual {v12, v0}, Landroidx/appcompat/widget/TintTypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    .line 262
    invoke-virtual {v6, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconContentDescription(Ljava/lang/CharSequence;)V

    const/16 v0, 0x2f

    .line 263
    invoke-virtual {v12, v0}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_25

    .line 264
    invoke-static {v15, v12, v0}, Lcom/google/android/material/resources/MaterialResources;->getColorStateList(Landroid/content/Context;Landroidx/appcompat/widget/TintTypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    .line 265
    iget-object v3, v6, Lcom/google/android/material/textfield/TextInputLayout;->endIconTintList:Landroid/content/res/ColorStateList;

    if-eq v3, v0, :cond_25

    .line 266
    iput-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->endIconTintList:Landroid/content/res/ColorStateList;

    const/4 v0, 0x1

    .line 267
    iput-boolean v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->hasEndIconTintList:Z

    .line 268
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/textfield/TextInputLayout;->applyEndIconTint()V

    :cond_25
    const/16 v0, 0x30

    .line 269
    invoke-virtual {v12, v0}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_26

    const/4 v3, -0x1

    .line 270
    invoke-virtual {v12, v0, v3}, Landroidx/appcompat/widget/TintTypedArray;->getInt(II)I

    move-result v0

    const/4 v3, 0x0

    .line 271
    invoke-static {v0, v3}, Lcom/google/android/material/internal/ViewUtils;->parseTintMode(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    .line 272
    iget-object v3, v6, Lcom/google/android/material/textfield/TextInputLayout;->endIconTintMode:Landroid/graphics/PorterDuff$Mode;

    if-eq v3, v0, :cond_26

    .line 273
    iput-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->endIconTintMode:Landroid/graphics/PorterDuff$Mode;

    const/4 v0, 0x1

    .line 274
    iput-boolean v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->hasEndIconTintMode:Z

    .line 275
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/textfield/TextInputLayout;->applyEndIconTint()V

    .line 276
    :cond_26
    :goto_8
    invoke-virtual {v12, v4}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v0

    if-nez v0, :cond_28

    const/16 v0, 0x1a

    .line 277
    invoke-virtual {v12, v0}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_27

    .line 278
    invoke-static {v15, v12, v0}, Lcom/google/android/material/resources/MaterialResources;->getColorStateList(Landroid/content/Context;Landroidx/appcompat/widget/TintTypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    .line 279
    iget-object v3, v6, Lcom/google/android/material/textfield/TextInputLayout;->endIconTintList:Landroid/content/res/ColorStateList;

    if-eq v3, v0, :cond_27

    .line 280
    iput-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->endIconTintList:Landroid/content/res/ColorStateList;

    const/4 v0, 0x1

    .line 281
    iput-boolean v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->hasEndIconTintList:Z

    .line 282
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/textfield/TextInputLayout;->applyEndIconTint()V

    :cond_27
    const/16 v0, 0x1b

    .line 283
    invoke-virtual {v12, v0}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_28

    const/4 v3, -0x1

    .line 284
    invoke-virtual {v12, v0, v3}, Landroidx/appcompat/widget/TintTypedArray;->getInt(II)I

    move-result v0

    const/4 v3, 0x0

    .line 285
    invoke-static {v0, v3}, Lcom/google/android/material/internal/ViewUtils;->parseTintMode(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    .line 286
    iget-object v3, v6, Lcom/google/android/material/textfield/TextInputLayout;->endIconTintMode:Landroid/graphics/PorterDuff$Mode;

    if-eq v3, v0, :cond_28

    .line 287
    iput-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->endIconTintMode:Landroid/graphics/PorterDuff$Mode;

    const/4 v0, 0x1

    .line 288
    iput-boolean v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->hasEndIconTintMode:Z

    .line 289
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/textfield/TextInputLayout;->applyEndIconTint()V

    .line 290
    :cond_28
    new-instance v0, Landroidx/appcompat/widget/AppCompatTextView;

    invoke-direct {v0, v15}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;)V

    iput-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->prefixTextView:Landroid/widget/TextView;

    const v3, 0x7f0a0253

    .line 291
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setId(I)V

    .line 292
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x2

    invoke-direct {v3, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v3, 0x1

    .line 293
    invoke-virtual {v0, v3}, Landroid/view/View;->setAccessibilityLiveRegion(I)V

    move-object/from16 v3, p2

    .line 294
    invoke-virtual {v14, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 295
    invoke-virtual {v14, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 296
    new-instance v3, Landroidx/appcompat/widget/AppCompatTextView;

    invoke-direct {v3, v15}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;)V

    iput-object v3, v6, Lcom/google/android/material/textfield/TextInputLayout;->suffixTextView:Landroid/widget/TextView;

    const v5, 0x7f0a0254

    .line 297
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setId(I)V

    .line 298
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v8, 0x50

    invoke-direct {v5, v4, v4, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v4, 0x1

    .line 299
    invoke-virtual {v3, v4}, Landroid/view/View;->setAccessibilityLiveRegion(I)V

    .line 300
    invoke-virtual {v10, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 301
    invoke-virtual {v10, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 302
    invoke-virtual {v10, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    move/from16 v1, v38

    .line 303
    invoke-virtual {v6, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setHelperTextEnabled(Z)V

    .line 304
    invoke-virtual {v6, v7}, Lcom/google/android/material/textfield/TextInputLayout;->setHelperText(Ljava/lang/CharSequence;)V

    move/from16 v1, v29

    .line 305
    iput v1, v11, Lcom/google/android/material/textfield/IndicatorViewController;->helperTextTextAppearance:I

    .line 306
    iget-object v4, v11, Lcom/google/android/material/textfield/IndicatorViewController;->helperTextView:Landroid/widget/TextView;

    if-eqz v4, :cond_29

    .line 307
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setTextAppearance(I)V

    :cond_29
    move/from16 v1, v39

    .line 308
    invoke-virtual {v6, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setErrorEnabled(Z)V

    move/from16 v1, v24

    .line 309
    iput v1, v11, Lcom/google/android/material/textfield/IndicatorViewController;->errorTextAppearance:I

    .line 310
    iget-object v4, v11, Lcom/google/android/material/textfield/IndicatorViewController;->errorView:Landroid/widget/TextView;

    if-eqz v4, :cond_2a

    .line 311
    iget-object v5, v11, Lcom/google/android/material/textfield/IndicatorViewController;->textInputView:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v5, v4, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setTextAppearanceCompatWithErrorFallback(Landroid/widget/TextView;I)V

    :cond_2a
    move-object/from16 v1, v32

    .line 312
    iput-object v1, v11, Lcom/google/android/material/textfield/IndicatorViewController;->errorViewContentDescription:Ljava/lang/CharSequence;

    .line 313
    iget-object v4, v11, Lcom/google/android/material/textfield/IndicatorViewController;->errorView:Landroid/widget/TextView;

    if-eqz v4, :cond_2b

    .line 314
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_2b
    move-object/from16 v1, v37

    .line 315
    invoke-virtual {v6, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setPlaceholderText(Ljava/lang/CharSequence;)V

    move/from16 v1, v33

    .line 316
    iput v1, v6, Lcom/google/android/material/textfield/TextInputLayout;->placeholderTextAppearance:I

    .line 317
    iget-object v4, v6, Lcom/google/android/material/textfield/TextInputLayout;->placeholderTextView:Landroid/widget/TextView;

    if-eqz v4, :cond_2c

    .line 318
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setTextAppearance(I)V

    .line 319
    :cond_2c
    invoke-static/range {v22 .. v22}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2d

    const/4 v1, 0x0

    goto :goto_9

    :cond_2d
    move-object/from16 v1, v22

    :goto_9
    iput-object v1, v6, Lcom/google/android/material/textfield/TextInputLayout;->prefixText:Ljava/lang/CharSequence;

    move-object/from16 v1, v22

    .line 320
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 321
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/textfield/TextInputLayout;->updatePrefixTextVisibility()V

    move/from16 v1, v34

    .line 322
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextAppearance(I)V

    .line 323
    invoke-static/range {v27 .. v27}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2e

    const/4 v1, 0x0

    goto :goto_a

    :cond_2e
    move-object/from16 v1, v27

    :goto_a
    iput-object v1, v6, Lcom/google/android/material/textfield/TextInputLayout;->suffixText:Ljava/lang/CharSequence;

    move-object/from16 v1, v27

    .line 324
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 325
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateSuffixTextVisibility()V

    move/from16 v1, v35

    .line 326
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setTextAppearance(I)V

    const/16 v1, 0x22

    .line 327
    invoke-virtual {v12, v1}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_2f

    .line 328
    invoke-virtual {v12, v1}, Landroidx/appcompat/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 329
    iput-object v1, v11, Lcom/google/android/material/textfield/IndicatorViewController;->errorViewTextColor:Landroid/content/res/ColorStateList;

    .line 330
    iget-object v4, v11, Lcom/google/android/material/textfield/IndicatorViewController;->errorView:Landroid/widget/TextView;

    if-eqz v4, :cond_2f

    if-eqz v1, :cond_2f

    .line 331
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_2f
    const/16 v1, 0x27

    .line 332
    invoke-virtual {v12, v1}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_30

    .line 333
    invoke-virtual {v12, v1}, Landroidx/appcompat/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 334
    iput-object v1, v11, Lcom/google/android/material/textfield/IndicatorViewController;->helperTextViewTextColor:Landroid/content/res/ColorStateList;

    .line 335
    iget-object v4, v11, Lcom/google/android/material/textfield/IndicatorViewController;->helperTextView:Landroid/widget/TextView;

    if-eqz v4, :cond_30

    if-eqz v1, :cond_30

    .line 336
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_30
    const/16 v1, 0x2b

    .line 337
    invoke-virtual {v12, v1}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_32

    const/16 v1, 0x2b

    .line 338
    invoke-virtual {v12, v1}, Landroidx/appcompat/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 339
    iget-object v4, v6, Lcom/google/android/material/textfield/TextInputLayout;->focusedTextColor:Landroid/content/res/ColorStateList;

    if-eq v4, v1, :cond_32

    .line 340
    iget-object v4, v6, Lcom/google/android/material/textfield/TextInputLayout;->defaultHintTextColor:Landroid/content/res/ColorStateList;

    if-nez v4, :cond_31

    move-object/from16 v4, v30

    .line 341
    iget-object v5, v4, Lcom/google/android/material/internal/CollapsingTextHelper;->collapsedTextColor:Landroid/content/res/ColorStateList;

    if-eq v5, v1, :cond_31

    .line 342
    iput-object v1, v4, Lcom/google/android/material/internal/CollapsingTextHelper;->collapsedTextColor:Landroid/content/res/ColorStateList;

    const/4 v5, 0x0

    .line 343
    invoke-virtual {v4, v5}, Lcom/google/android/material/internal/CollapsingTextHelper;->recalculate(Z)V

    goto :goto_b

    :cond_31
    const/4 v5, 0x0

    .line 344
    :goto_b
    iput-object v1, v6, Lcom/google/android/material/textfield/TextInputLayout;->focusedTextColor:Landroid/content/res/ColorStateList;

    .line 345
    iget-object v1, v6, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-eqz v1, :cond_32

    .line 346
    invoke-virtual {v6, v5, v5}, Lcom/google/android/material/textfield/TextInputLayout;->updateLabelState(ZZ)V

    :cond_32
    const/16 v1, 0x15

    .line 347
    invoke-virtual {v12, v1}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_33

    const/16 v1, 0x15

    .line 348
    invoke-virtual {v12, v1}, Landroidx/appcompat/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 349
    iget-object v4, v6, Lcom/google/android/material/textfield/TextInputLayout;->counterTextColor:Landroid/content/res/ColorStateList;

    if-eq v4, v1, :cond_33

    .line 350
    iput-object v1, v6, Lcom/google/android/material/textfield/TextInputLayout;->counterTextColor:Landroid/content/res/ColorStateList;

    .line 351
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateCounterTextAppearanceAndColor()V

    :cond_33
    const/16 v1, 0x13

    .line 352
    invoke-virtual {v12, v1}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_34

    const/16 v1, 0x13

    .line 353
    invoke-virtual {v12, v1}, Landroidx/appcompat/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 354
    iget-object v4, v6, Lcom/google/android/material/textfield/TextInputLayout;->counterOverflowTextColor:Landroid/content/res/ColorStateList;

    if-eq v4, v1, :cond_34

    .line 355
    iput-object v1, v6, Lcom/google/android/material/textfield/TextInputLayout;->counterOverflowTextColor:Landroid/content/res/ColorStateList;

    .line 356
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateCounterTextAppearanceAndColor()V

    :cond_34
    const/16 v1, 0x33

    .line 357
    invoke-virtual {v12, v1}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_35

    const/16 v1, 0x33

    .line 358
    invoke-virtual {v12, v1}, Landroidx/appcompat/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 359
    iget-object v4, v6, Lcom/google/android/material/textfield/TextInputLayout;->placeholderTextColor:Landroid/content/res/ColorStateList;

    if-eq v4, v1, :cond_35

    .line 360
    iput-object v1, v6, Lcom/google/android/material/textfield/TextInputLayout;->placeholderTextColor:Landroid/content/res/ColorStateList;

    .line 361
    iget-object v4, v6, Lcom/google/android/material/textfield/TextInputLayout;->placeholderTextView:Landroid/widget/TextView;

    if-eqz v4, :cond_35

    if-eqz v1, :cond_35

    .line 362
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_35
    const/16 v1, 0x36

    .line 363
    invoke-virtual {v12, v1}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_36

    const/16 v1, 0x36

    .line 364
    invoke-virtual {v12, v1}, Landroidx/appcompat/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 365
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_36
    const/16 v0, 0x40

    .line 366
    invoke-virtual {v12, v0}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_37

    const/16 v0, 0x40

    .line 367
    invoke-virtual {v12, v0}, Landroidx/appcompat/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    .line 368
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 369
    :cond_37
    iget-boolean v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->counterEnabled:Z

    move/from16 v1, v36

    if-eq v0, v1, :cond_39

    if-eqz v1, :cond_38

    .line 370
    new-instance v0, Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual/range {p0 .. p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v0, v3}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;)V

    iput-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->counterView:Landroid/widget/TextView;

    const v3, 0x7f0a024f

    .line 371
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setId(I)V

    .line 372
    iget-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->counterView:Landroid/widget/TextView;

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 373
    iget-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->counterView:Landroid/widget/TextView;

    invoke-virtual {v11, v0, v2}, Lcom/google/android/material/textfield/IndicatorViewController;->addIndicator(Landroid/widget/TextView;I)V

    .line 374
    iget-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->counterView:Landroid/widget/TextView;

    .line 375
    invoke-virtual {v0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 376
    invoke-virtual/range {p0 .. p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f070206

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v3

    .line 377
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 378
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateCounterTextAppearanceAndColor()V

    .line 379
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateCounter()V

    goto :goto_c

    .line 380
    :cond_38
    iget-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->counterView:Landroid/widget/TextView;

    invoke-virtual {v11, v0, v2}, Lcom/google/android/material/textfield/IndicatorViewController;->removeIndicator(Landroid/widget/TextView;I)V

    const/4 v0, 0x0

    .line 381
    iput-object v0, v6, Lcom/google/android/material/textfield/TextInputLayout;->counterView:Landroid/widget/TextView;

    .line 382
    :goto_c
    iput-boolean v1, v6, Lcom/google/android/material/textfield/TextInputLayout;->counterEnabled:Z

    :cond_39
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 383
    invoke-virtual {v12, v1, v0}, Landroidx/appcompat/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result v1

    invoke-virtual {v6, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setEnabled(Z)V

    .line 384
    invoke-virtual/range {v16 .. v16}, Landroid/content/res/TypedArray;->recycle()V

    .line 385
    invoke-virtual {v6, v2}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 386
    invoke-virtual {v6, v0}, Landroid/view/View;->setImportantForAutofill(I)V

    return-void

    :array_0
    .array-data 4
        0x14
        0x12
        0x21
        0x26
        0x2a
    .end array-data

    :array_1
    .array-data 4
        0x101009c
        0x101009e
    .end array-data

    :array_2
    .array-data 4
        0x1010367
        0x101009e
    .end array-data

    :array_3
    .array-data 4
        0x1010367
        0x101009e
    .end array-data

    :array_4
    .array-data 4
        0x101009c
        0x101009e
    .end array-data
.end method

.method public static recursiveSetEnabled(Landroid/view/ViewGroup;Z)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 2
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 3
    invoke-virtual {v2, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 4
    instance-of v3, v2, Landroid/view/ViewGroup;

    if-eqz v3, :cond_0

    .line 5
    check-cast v2, Landroid/view/ViewGroup;

    invoke-static {v2, p1}, Lcom/google/android/material/textfield/TextInputLayout;->recursiveSetEnabled(Landroid/view/ViewGroup;Z)V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public static setIconClickable(Lcom/google/android/material/internal/CheckableImageButton;Landroid/view/View$OnLongClickListener;)V
    .locals 3

    .line 1
    sget-object v0, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->hasOnClickListeners()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz p1, :cond_0

    move p1, v2

    goto :goto_0

    :cond_0
    move p1, v1

    :goto_0
    if-nez v0, :cond_1

    if-eqz p1, :cond_2

    :cond_1
    move v1, v2

    .line 3
    :cond_2
    invoke-virtual {p0, v1}, Landroid/widget/ImageButton;->setFocusable(Z)V

    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/ImageButton;->setClickable(Z)V

    .line 5
    iput-boolean v0, p0, Lcom/google/android/material/internal/CheckableImageButton;->pressable:Z

    .line 6
    invoke-virtual {p0, p1}, Landroid/widget/ImageButton;->setLongClickable(Z)V

    if-eqz v1, :cond_3

    goto :goto_1

    :cond_3
    const/4 v2, 0x2

    .line 7
    :goto_1
    invoke-virtual {p0, v2}, Landroid/view/View;->setImportantForAccessibility(I)V

    return-void
.end method


# virtual methods
.method public addOnEditTextAttachedListener(Lcom/google/android/material/textfield/TextInputLayout$OnEditTextAttachedListener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editTextAttachedListeners:Ljava/util/LinkedHashSet;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    .line 3
    invoke-interface {p1, p0}, Lcom/google/android/material/textfield/TextInputLayout$OnEditTextAttachedListener;->onEditTextAttached(Lcom/google/android/material/textfield/TextInputLayout;)V

    :cond_0
    return-void
.end method

.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 4

    .line 1
    instance-of v0, p1, Landroid/widget/EditText;

    if-eqz v0, :cond_12

    .line 2
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {p2, p3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 3
    iget v0, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    and-int/lit8 v0, v0, -0x71

    or-int/lit8 v0, v0, 0x10

    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 4
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->inputFrame:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p1, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 5
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->inputFrame:Landroid/widget/FrameLayout;

    invoke-virtual {p2, p3}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 6
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateInputLayoutMargins()V

    .line 7
    check-cast p1, Landroid/widget/EditText;

    .line 8
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-nez p2, :cond_11

    .line 9
    iget p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconMode:I

    const/4 p3, 0x3

    if-eq p2, p3, :cond_0

    instance-of p2, p1, Lcom/google/android/material/textfield/TextInputEditText;

    if-nez p2, :cond_0

    const-string p2, "TextInputLayout"

    const-string p3, "EditText added is not a TextInputEditText. Please switch to using that class instead."

    .line 10
    invoke-static {p2, p3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    :cond_0
    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    .line 12
    iget p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->minWidth:I

    .line 13
    iput p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->minWidth:I

    const/4 p3, -0x1

    if-eqz p1, :cond_1

    if-eq p2, p3, :cond_1

    .line 14
    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setMinWidth(I)V

    .line 15
    :cond_1
    iget p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->maxWidth:I

    .line 16
    iput p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->maxWidth:I

    .line 17
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-eqz v0, :cond_2

    if-eq p2, p3, :cond_2

    .line 18
    invoke-virtual {v0, p2}, Landroid/widget/EditText;->setMaxWidth(I)V

    .line 19
    :cond_2
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->onApplyBoxBackgroundMode()V

    .line 20
    new-instance p2, Lcom/google/android/material/textfield/TextInputLayout$AccessibilityDelegate;

    invoke-direct {p2, p0}, Lcom/google/android/material/textfield/TextInputLayout$AccessibilityDelegate;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    .line 21
    iget-object p3, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-eqz p3, :cond_3

    .line 22
    invoke-static {p3, p2}, Landroidx/core/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroidx/core/view/AccessibilityDelegateCompat;)V

    .line 23
    :cond_3
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    iget-object p3, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    invoke-virtual {p3}, Landroid/widget/EditText;->getTypeface()Landroid/graphics/Typeface;

    move-result-object p3

    .line 24
    iget-object v0, p2, Lcom/google/android/material/internal/CollapsingTextHelper;->collapsedFontCallback:Lcom/google/android/material/resources/CancelableFontCallback;

    const/4 v1, 0x1

    if-eqz v0, :cond_4

    .line 25
    iput-boolean v1, v0, Lcom/google/android/material/resources/CancelableFontCallback;->cancelled:Z

    .line 26
    :cond_4
    iget-object v0, p2, Lcom/google/android/material/internal/CollapsingTextHelper;->collapsedTypeface:Landroid/graphics/Typeface;

    const/4 v2, 0x0

    if-eq v0, p3, :cond_5

    .line 27
    iput-object p3, p2, Lcom/google/android/material/internal/CollapsingTextHelper;->collapsedTypeface:Landroid/graphics/Typeface;

    move v0, v1

    goto :goto_0

    :cond_5
    move v0, v2

    .line 28
    :goto_0
    iget-object v3, p2, Lcom/google/android/material/internal/CollapsingTextHelper;->expandedFontCallback:Lcom/google/android/material/resources/CancelableFontCallback;

    if-eqz v3, :cond_6

    .line 29
    iput-boolean v1, v3, Lcom/google/android/material/resources/CancelableFontCallback;->cancelled:Z

    .line 30
    :cond_6
    iget-object v3, p2, Lcom/google/android/material/internal/CollapsingTextHelper;->expandedTypeface:Landroid/graphics/Typeface;

    if-eq v3, p3, :cond_7

    .line 31
    iput-object p3, p2, Lcom/google/android/material/internal/CollapsingTextHelper;->expandedTypeface:Landroid/graphics/Typeface;

    move p3, v1

    goto :goto_1

    :cond_7
    move p3, v2

    :goto_1
    if-nez v0, :cond_8

    if-eqz p3, :cond_9

    .line 32
    :cond_8
    invoke-virtual {p2, v2}, Lcom/google/android/material/internal/CollapsingTextHelper;->recalculate(Z)V

    .line 33
    :cond_9
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    iget-object p3, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    invoke-virtual {p3}, Landroid/widget/EditText;->getTextSize()F

    move-result p3

    .line 34
    iget v0, p2, Lcom/google/android/material/internal/CollapsingTextHelper;->expandedTextSize:F

    cmpl-float v0, v0, p3

    if-eqz v0, :cond_a

    .line 35
    iput p3, p2, Lcom/google/android/material/internal/CollapsingTextHelper;->expandedTextSize:F

    .line 36
    invoke-virtual {p2, v2}, Lcom/google/android/material/internal/CollapsingTextHelper;->recalculate(Z)V

    .line 37
    :cond_a
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getGravity()I

    move-result p2

    .line 38
    iget-object p3, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    and-int/lit8 v0, p2, -0x71

    or-int/lit8 v0, v0, 0x30

    invoke-virtual {p3, v0}, Lcom/google/android/material/internal/CollapsingTextHelper;->setCollapsedTextGravity(I)V

    .line 39
    iget-object p3, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    invoke-virtual {p3, p2}, Lcom/google/android/material/internal/CollapsingTextHelper;->setExpandedTextGravity(I)V

    .line 40
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    new-instance p3, Lcom/google/android/material/textfield/TextInputLayout$1;

    invoke-direct {p3, p0}, Lcom/google/android/material/textfield/TextInputLayout$1;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    invoke-virtual {p2, p3}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 41
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->defaultHintTextColor:Landroid/content/res/ColorStateList;

    if-nez p2, :cond_b

    .line 42
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getHintTextColors()Landroid/content/res/ColorStateList;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->defaultHintTextColor:Landroid/content/res/ColorStateList;

    .line 43
    :cond_b
    iget-boolean p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->hintEnabled:Z

    if-eqz p2, :cond_d

    .line 44
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->hint:Ljava/lang/CharSequence;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_c

    .line 45
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getHint()Ljava/lang/CharSequence;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->originalHint:Ljava/lang/CharSequence;

    .line 46
    invoke-virtual {p0, p2}, Lcom/google/android/material/textfield/TextInputLayout;->setHint(Ljava/lang/CharSequence;)V

    .line 47
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    const/4 p3, 0x0

    invoke-virtual {p2, p3}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 48
    :cond_c
    iput-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->isProvidingHint:Z

    .line 49
    :cond_d
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterView:Landroid/widget/TextView;

    if-eqz p2, :cond_e

    .line 50
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-interface {p2}, Landroid/text/Editable;->length()I

    move-result p2

    invoke-virtual {p0, p2}, Lcom/google/android/material/textfield/TextInputLayout;->updateCounter(I)V

    .line 51
    :cond_e
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateEditTextBackground()V

    .line 52
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->indicatorViewController:Lcom/google/android/material/textfield/IndicatorViewController;

    invoke-virtual {p2}, Lcom/google/android/material/textfield/IndicatorViewController;->adjustIndicatorPadding()V

    .line 53
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->startLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p2}, Landroid/widget/LinearLayout;->bringToFront()V

    .line 54
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->endLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p2}, Landroid/widget/LinearLayout;->bringToFront()V

    .line 55
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconFrame:Landroid/widget/FrameLayout;

    invoke-virtual {p2}, Landroid/widget/FrameLayout;->bringToFront()V

    .line 56
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->errorIconView:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {p2}, Landroid/widget/ImageButton;->bringToFront()V

    .line 57
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->editTextAttachedListeners:Ljava/util/LinkedHashSet;

    invoke-virtual {p2}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_f

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/google/android/material/textfield/TextInputLayout$OnEditTextAttachedListener;

    .line 58
    invoke-interface {p3, p0}, Lcom/google/android/material/textfield/TextInputLayout$OnEditTextAttachedListener;->onEditTextAttached(Lcom/google/android/material/textfield/TextInputLayout;)V

    goto :goto_2

    .line 59
    :cond_f
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->updatePrefixTextViewPadding()V

    .line 60
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateSuffixTextViewPadding()V

    .line 61
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isEnabled()Z

    move-result p2

    if-nez p2, :cond_10

    .line 62
    invoke-virtual {p1, v2}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 63
    :cond_10
    invoke-virtual {p0, v2, v1}, Lcom/google/android/material/textfield/TextInputLayout;->updateLabelState(ZZ)V

    goto :goto_3

    .line 64
    :cond_11
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "We already have an EditText, can only have one"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 65
    :cond_12
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    :goto_3
    return-void
.end method

.method public animateToExpansionFraction(F)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    .line 2
    iget v0, v0, Lcom/google/android/material/internal/CollapsingTextHelper;->expandedFraction:F

    cmpl-float v0, v0, p1

    if-nez v0, :cond_0

    return-void

    .line 3
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->animator:Landroid/animation/ValueAnimator;

    if-nez v0, :cond_1

    .line 4
    new-instance v0, Landroid/animation/ValueAnimator;

    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->animator:Landroid/animation/ValueAnimator;

    .line 5
    sget-object v1, Lcom/google/android/material/animation/AnimationUtils;->FAST_OUT_SLOW_IN_INTERPOLATOR:Landroid/animation/TimeInterpolator;

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 6
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->animator:Landroid/animation/ValueAnimator;

    const-wide/16 v1, 0xa7

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 7
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->animator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/google/android/material/textfield/TextInputLayout$4;

    invoke-direct {v1, p0}, Lcom/google/android/material/textfield/TextInputLayout$4;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 8
    :cond_1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->animator:Landroid/animation/ValueAnimator;

    const/4 v1, 0x2

    new-array v1, v1, [F

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    .line 9
    iget v3, v3, Lcom/google/android/material/internal/CollapsingTextHelper;->expandedFraction:F

    aput v3, v1, v2

    const/4 v2, 0x1

    aput p1, v1, v2

    .line 10
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 11
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->animator:Landroid/animation/ValueAnimator;

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method

.method public final applyEndIconTint()V
    .locals 6

    .line 1
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconView:Lcom/google/android/material/internal/CheckableImageButton;

    iget-boolean v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->hasEndIconTintList:Z

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconTintList:Landroid/content/res/ColorStateList;

    iget-boolean v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->hasEndIconTintMode:Z

    iget-object v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconTintMode:Landroid/graphics/PorterDuff$Mode;

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/material/textfield/TextInputLayout;->applyIconTint(Lcom/google/android/material/internal/CheckableImageButton;ZLandroid/content/res/ColorStateList;ZLandroid/graphics/PorterDuff$Mode;)V

    return-void
.end method

.method public final applyIconTint(Lcom/google/android/material/internal/CheckableImageButton;ZLandroid/content/res/ColorStateList;ZLandroid/graphics/PorterDuff$Mode;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    if-eqz p0, :cond_2

    if-nez p2, :cond_0

    if-eqz p4, :cond_2

    .line 2
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    if-eqz p2, :cond_1

    .line 3
    invoke-virtual {p0, p3}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    :cond_1
    if-eqz p4, :cond_2

    .line 4
    invoke-virtual {p0, p5}, Landroid/graphics/drawable/Drawable;->setTintMode(Landroid/graphics/PorterDuff$Mode;)V

    .line 5
    :cond_2
    invoke-virtual {p1}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p2

    if-eq p2, p0, :cond_3

    .line 6
    invoke-virtual {p1, p0}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_3
    return-void
.end method

.method public final calculateLabelMarginTop()I
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->hintEnabled:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 2
    :cond_0
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundMode:I

    if-eqz v0, :cond_2

    const/4 v2, 0x1

    if-eq v0, v2, :cond_2

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1

    return v1

    .line 3
    :cond_1
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    invoke-virtual {p0}, Lcom/google/android/material/internal/CollapsingTextHelper;->getCollapsedTextHeight()F

    move-result p0

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p0, v0

    :goto_0
    float-to-int p0, p0

    return p0

    .line 4
    :cond_2
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    invoke-virtual {p0}, Lcom/google/android/material/internal/CollapsingTextHelper;->getCollapsedTextHeight()F

    move-result p0

    goto :goto_0
.end method

.method public final cutoutEnabled()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->hintEnabled:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->hint:Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackground:Lcom/google/android/material/shape/MaterialShapeDrawable;

    instance-of p0, p0, Lcom/google/android/material/textfield/CutoutDrawable;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public cutoutIsOpen()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->cutoutEnabled()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackground:Lcom/google/android/material/shape/MaterialShapeDrawable;

    check-cast p0, Lcom/google/android/material/textfield/CutoutDrawable;

    .line 2
    iget-object p0, p0, Lcom/google/android/material/textfield/CutoutDrawable;->cutoutBounds:Landroid/graphics/RectF;

    invoke-virtual {p0}, Landroid/graphics/RectF;->isEmpty()Z

    move-result p0

    xor-int/2addr p0, v1

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public dispatchProvideAutofillStructure(Landroid/view/ViewStructure;I)V
    .locals 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0x1a
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-nez v0, :cond_0

    .line 2
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->dispatchProvideAutofillStructure(Landroid/view/ViewStructure;I)V

    return-void

    .line 3
    :cond_0
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->originalHint:Ljava/lang/CharSequence;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 4
    iget-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->isProvidingHint:Z

    .line 5
    iput-boolean v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->isProvidingHint:Z

    .line 6
    invoke-virtual {v0}, Landroid/widget/EditText;->getHint()Ljava/lang/CharSequence;

    move-result-object v0

    .line 7
    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->originalHint:Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 8
    :try_start_0
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->dispatchProvideAutofillStructure(Landroid/view/ViewStructure;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 10
    iput-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->isProvidingHint:Z

    goto :goto_1

    :catchall_0
    move-exception p1

    .line 11
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    invoke-virtual {p2, v0}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 12
    iput-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->isProvidingHint:Z

    .line 13
    throw p1

    .line 14
    :cond_1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getAutofillId()Landroid/view/autofill/AutofillId;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/ViewStructure;->setAutofillId(Landroid/view/autofill/AutofillId;)V

    .line 15
    invoke-virtual {p0, p1, p2}, Landroid/widget/LinearLayout;->onProvideAutofillStructure(Landroid/view/ViewStructure;I)V

    .line 16
    invoke-virtual {p0, p1, p2}, Landroid/widget/LinearLayout;->onProvideAutofillVirtualStructure(Landroid/view/ViewStructure;I)V

    .line 17
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->inputFrame:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getChildCount()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/ViewStructure;->setChildCount(I)V

    .line 18
    :goto_0
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->inputFrame:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getChildCount()I

    move-result v0

    if-ge v2, v0, :cond_3

    .line 19
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->inputFrame:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 20
    invoke-virtual {p1, v2}, Landroid/view/ViewStructure;->newChild(I)Landroid/view/ViewStructure;

    move-result-object v1

    .line 21
    invoke-virtual {v0, v1, p2}, Landroid/view/View;->dispatchProvideAutofillStructure(Landroid/view/ViewStructure;I)V

    .line 22
    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-ne v0, v3, :cond_2

    .line 23
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getHint()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/view/ViewStructure;->setHint(Ljava/lang/CharSequence;)V

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    return-void
.end method

.method public dispatchRestoreInstanceState(Landroid/util/SparseArray;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Landroid/os/Parcelable;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->restoringSavedState:Z

    .line 2
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchRestoreInstanceState(Landroid/util/SparseArray;)V

    const/4 p1, 0x0

    .line 3
    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->restoringSavedState:Z

    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 2
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->hintEnabled:Z

    if-eqz v0, :cond_0

    .line 3
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    invoke-virtual {v0, p1}, Lcom/google/android/material/internal/CollapsingTextHelper;->draw(Landroid/graphics/Canvas;)V

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxUnderline:Lcom/google/android/material/shape/MaterialShapeDrawable;

    if-eqz v0, :cond_1

    .line 5
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 6
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    iget v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeWidthPx:I

    sub-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 7
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxUnderline:Lcom/google/android/material/shape/MaterialShapeDrawable;

    invoke-virtual {p0, p1}, Lcom/google/android/material/shape/MaterialShapeDrawable;->draw(Landroid/graphics/Canvas;)V

    :cond_1
    return-void
.end method

.method public drawableStateChanged()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->inDrawableStateChanged:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->inDrawableStateChanged:Z

    .line 3
    invoke-super {p0}, Landroid/view/ViewGroup;->drawableStateChanged()V

    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getDrawableState()[I

    move-result-object v1

    .line 5
    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    .line 6
    invoke-virtual {v2, v1}, Lcom/google/android/material/internal/CollapsingTextHelper;->setState([I)Z

    move-result v1

    or-int/2addr v1, v3

    goto :goto_0

    :cond_1
    move v1, v3

    .line 7
    :goto_0
    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-eqz v2, :cond_3

    .line 8
    sget-object v2, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->isLaidOut()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 10
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_1

    :cond_2
    move v0, v3

    .line 11
    :goto_1
    invoke-virtual {p0, v0, v3}, Lcom/google/android/material/textfield/TextInputLayout;->updateLabelState(ZZ)V

    .line 12
    :cond_3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateEditTextBackground()V

    .line 13
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateTextInputBoxState()V

    if-eqz v1, :cond_4

    .line 14
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->invalidate()V

    .line 15
    :cond_4
    iput-boolean v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->inDrawableStateChanged:Z

    return-void
.end method

.method public getBaseline()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {v0}, Landroid/widget/EditText;->getBaseline()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingTop()I

    move-result v1

    add-int/2addr v1, v0

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->calculateLabelMarginTop()I

    move-result p0

    add-int/2addr p0, v1

    return p0

    .line 3
    :cond_0
    invoke-super {p0}, Landroid/widget/LinearLayout;->getBaseline()I

    move-result p0

    return p0
.end method

.method public final getEndIconDelegate()Lcom/google/android/material/textfield/EndIconDelegate;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconDelegates:Landroid/util/SparseArray;

    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconMode:I

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/EndIconDelegate;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconDelegates:Landroid/util/SparseArray;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    move-object v0, p0

    check-cast v0, Lcom/google/android/material/textfield/EndIconDelegate;

    :goto_0
    return-object v0
.end method

.method public getError()Ljava/lang/CharSequence;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->indicatorViewController:Lcom/google/android/material/textfield/IndicatorViewController;

    .line 2
    iget-boolean v0, p0, Lcom/google/android/material/textfield/IndicatorViewController;->errorEnabled:Z

    if-eqz v0, :cond_0

    .line 3
    iget-object p0, p0, Lcom/google/android/material/textfield/IndicatorViewController;->errorText:Ljava/lang/CharSequence;

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method public final getErrorTextCurrentColor()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->indicatorViewController:Lcom/google/android/material/textfield/IndicatorViewController;

    invoke-virtual {p0}, Lcom/google/android/material/textfield/IndicatorViewController;->getErrorViewCurrentTextColor()I

    move-result p0

    return p0
.end method

.method public getHint()Ljava/lang/CharSequence;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->hintEnabled:Z

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->hint:Ljava/lang/CharSequence;

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method public final getHintCollapsedTextHeight()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    invoke-virtual {p0}, Lcom/google/android/material/internal/CollapsingTextHelper;->getCollapsedTextHeight()F

    move-result p0

    return p0
.end method

.method public final getHintCurrentCollapsedTextColor()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    invoke-virtual {p0}, Lcom/google/android/material/internal/CollapsingTextHelper;->getCurrentCollapsedTextColor()I

    move-result p0

    return p0
.end method

.method public final getLabelLeftBoundAlightWithPrefix(IZ)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getCompoundPaddingLeft()I

    move-result v0

    add-int/2addr v0, p1

    .line 2
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->prefixText:Ljava/lang/CharSequence;

    if-eqz p1, :cond_0

    if-nez p2, :cond_0

    .line 3
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->prefixTextView:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result p1

    sub-int/2addr v0, p1

    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->prefixTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingLeft()I

    move-result p0

    add-int/2addr v0, p0

    :cond_0
    return v0
.end method

.method public final getLabelRightBoundAlignedWithSuffix(IZ)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getCompoundPaddingRight()I

    move-result v0

    sub-int/2addr p1, v0

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->prefixText:Ljava/lang/CharSequence;

    if-eqz v0, :cond_0

    if-eqz p2, :cond_0

    .line 3
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->prefixTextView:Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result p2

    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->prefixTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingRight()I

    move-result p0

    sub-int/2addr p2, p0

    add-int/2addr p1, p2

    :cond_0
    return p1
.end method

.method public final hasEndIcon()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconMode:I

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public isEndIconVisible()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconFrame:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconView:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {p0}, Landroid/widget/ImageButton;->getVisibility()I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public final isHelperTextDisplayed()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->indicatorViewController:Lcom/google/android/material/textfield/IndicatorViewController;

    .line 2
    iget v0, p0, Lcom/google/android/material/textfield/IndicatorViewController;->captionDisplayed:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 3
    iget-object v0, p0, Lcom/google/android/material/textfield/IndicatorViewController;->helperTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/android/material/textfield/IndicatorViewController;->helperText:Ljava/lang/CharSequence;

    .line 4
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public final isHintExpanded()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->hintExpanded:Z

    return p0
.end method

.method public final onApplyBoxBackgroundMode()V
    .locals 6

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundMode:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_3

    if-eq v0, v2, :cond_2

    const/4 v3, 0x2

    if-ne v0, v3, :cond_1

    .line 2
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->hintEnabled:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackground:Lcom/google/android/material/shape/MaterialShapeDrawable;

    instance-of v0, v0, Lcom/google/android/material/textfield/CutoutDrawable;

    if-nez v0, :cond_0

    .line 3
    new-instance v0, Lcom/google/android/material/textfield/CutoutDrawable;

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->shapeAppearanceModel:Lcom/google/android/material/shape/ShapeAppearanceModel;

    invoke-direct {v0, v3}, Lcom/google/android/material/textfield/CutoutDrawable;-><init>(Lcom/google/android/material/shape/ShapeAppearanceModel;)V

    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackground:Lcom/google/android/material/shape/MaterialShapeDrawable;

    goto :goto_0

    .line 4
    :cond_0
    new-instance v0, Lcom/google/android/material/shape/MaterialShapeDrawable;

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->shapeAppearanceModel:Lcom/google/android/material/shape/ShapeAppearanceModel;

    invoke-direct {v0, v3}, Lcom/google/android/material/shape/MaterialShapeDrawable;-><init>(Lcom/google/android/material/shape/ShapeAppearanceModel;)V

    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackground:Lcom/google/android/material/shape/MaterialShapeDrawable;

    .line 5
    :goto_0
    iput-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxUnderline:Lcom/google/android/material/shape/MaterialShapeDrawable;

    goto :goto_1

    .line 6
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundMode:I

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " is illegal; only @BoxBackgroundMode constants are supported."

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 7
    :cond_2
    new-instance v0, Lcom/google/android/material/shape/MaterialShapeDrawable;

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->shapeAppearanceModel:Lcom/google/android/material/shape/ShapeAppearanceModel;

    invoke-direct {v0, v1}, Lcom/google/android/material/shape/MaterialShapeDrawable;-><init>(Lcom/google/android/material/shape/ShapeAppearanceModel;)V

    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackground:Lcom/google/android/material/shape/MaterialShapeDrawable;

    .line 8
    new-instance v0, Lcom/google/android/material/shape/MaterialShapeDrawable;

    invoke-direct {v0}, Lcom/google/android/material/shape/MaterialShapeDrawable;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxUnderline:Lcom/google/android/material/shape/MaterialShapeDrawable;

    goto :goto_1

    .line 9
    :cond_3
    iput-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackground:Lcom/google/android/material/shape/MaterialShapeDrawable;

    .line 10
    iput-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxUnderline:Lcom/google/android/material/shape/MaterialShapeDrawable;

    .line 11
    :goto_1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-eqz v0, :cond_4

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackground:Lcom/google/android/material/shape/MaterialShapeDrawable;

    if-eqz v1, :cond_4

    .line 12
    invoke-virtual {v0}, Landroid/widget/EditText;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_4

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundMode:I

    if-eqz v0, :cond_4

    move v0, v2

    goto :goto_2

    :cond_4
    const/4 v0, 0x0

    :goto_2
    if-eqz v0, :cond_5

    .line 13
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackground:Lcom/google/android/material/shape/MaterialShapeDrawable;

    sget-object v3, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 15
    :cond_5
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateTextInputBoxState()V

    .line 16
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundMode:I

    if-ne v0, v2, :cond_7

    .line 17
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/material/resources/MaterialResources;->isFontScaleAtLeast2_0(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 18
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f070139

    .line 19
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxCollapsedPaddingTopPx:I

    goto :goto_3

    .line 20
    :cond_6
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/material/resources/MaterialResources;->isFontScaleAtLeast1_3(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 21
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f070138

    .line 22
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxCollapsedPaddingTopPx:I

    .line 23
    :cond_7
    :goto_3
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-eqz v0, :cond_a

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundMode:I

    if-eq v0, v2, :cond_8

    goto :goto_4

    .line 24
    :cond_8
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/material/resources/MaterialResources;->isFontScaleAtLeast2_0(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 25
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    .line 26
    sget-object v1, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 27
    invoke-virtual {v0}, Landroid/view/View;->getPaddingStart()I

    move-result v1

    .line 28
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070137

    .line 29
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    .line 30
    invoke-virtual {v3}, Landroid/view/View;->getPaddingEnd()I

    move-result v3

    .line 31
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f070136

    .line 32
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    .line 33
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPaddingRelative(IIII)V

    goto :goto_4

    .line 34
    :cond_9
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/material/resources/MaterialResources;->isFontScaleAtLeast1_3(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 35
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    .line 36
    sget-object v1, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 37
    invoke-virtual {v0}, Landroid/view/View;->getPaddingStart()I

    move-result v1

    .line 38
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070135

    .line 39
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    .line 40
    invoke-virtual {v3}, Landroid/view/View;->getPaddingEnd()I

    move-result v3

    .line 41
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f070134

    .line 42
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    .line 43
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPaddingRelative(IIII)V

    .line 44
    :cond_a
    :goto_4
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundMode:I

    if-eqz v0, :cond_b

    .line 45
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateInputLayoutMargins()V

    :cond_b
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 4

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    .line 2
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-eqz p1, :cond_d

    .line 3
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->tmpRect:Landroid/graphics/Rect;

    .line 4
    invoke-static {p0, p1, p2}, Lcom/google/android/material/internal/DescendantOffsetUtils;->getDescendantRect(Landroid/view/ViewGroup;Landroid/view/View;Landroid/graphics/Rect;)V

    .line 5
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxUnderline:Lcom/google/android/material/shape/MaterialShapeDrawable;

    if-eqz p1, :cond_0

    .line 6
    iget p3, p2, Landroid/graphics/Rect;->bottom:I

    iget p4, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeWidthFocusedPx:I

    sub-int p4, p3, p4

    .line 7
    iget p5, p2, Landroid/graphics/Rect;->left:I

    iget v0, p2, Landroid/graphics/Rect;->right:I

    invoke-virtual {p1, p5, p4, v0, p3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 8
    :cond_0
    iget-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->hintEnabled:Z

    if-eqz p1, :cond_d

    .line 9
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    iget-object p3, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    invoke-virtual {p3}, Landroid/widget/EditText;->getTextSize()F

    move-result p3

    .line 10
    iget p4, p1, Lcom/google/android/material/internal/CollapsingTextHelper;->expandedTextSize:F

    cmpl-float p4, p4, p3

    const/4 p5, 0x0

    if-eqz p4, :cond_1

    .line 11
    iput p3, p1, Lcom/google/android/material/internal/CollapsingTextHelper;->expandedTextSize:F

    .line 12
    invoke-virtual {p1, p5}, Lcom/google/android/material/internal/CollapsingTextHelper;->recalculate(Z)V

    .line 13
    :cond_1
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getGravity()I

    move-result p1

    .line 14
    iget-object p3, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    and-int/lit8 p4, p1, -0x71

    or-int/lit8 p4, p4, 0x30

    invoke-virtual {p3, p4}, Lcom/google/android/material/internal/CollapsingTextHelper;->setCollapsedTextGravity(I)V

    .line 15
    iget-object p3, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    invoke-virtual {p3, p1}, Lcom/google/android/material/internal/CollapsingTextHelper;->setExpandedTextGravity(I)V

    .line 16
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    .line 17
    iget-object p3, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-eqz p3, :cond_c

    .line 18
    iget-object p3, p0, Lcom/google/android/material/textfield/TextInputLayout;->tmpBoundsRect:Landroid/graphics/Rect;

    .line 19
    sget-object p4, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getLayoutDirection()I

    move-result p4

    const/4 v0, 0x1

    if-ne p4, v0, :cond_2

    move p4, v0

    goto :goto_0

    :cond_2
    move p4, p5

    .line 21
    :goto_0
    iget v1, p2, Landroid/graphics/Rect;->bottom:I

    iput v1, p3, Landroid/graphics/Rect;->bottom:I

    .line 22
    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundMode:I

    if-eq v1, v0, :cond_4

    const/4 v2, 0x2

    if-eq v1, v2, :cond_3

    .line 23
    iget v1, p2, Landroid/graphics/Rect;->left:I

    invoke-virtual {p0, v1, p4}, Lcom/google/android/material/textfield/TextInputLayout;->getLabelLeftBoundAlightWithPrefix(IZ)I

    move-result v1

    iput v1, p3, Landroid/graphics/Rect;->left:I

    .line 24
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingTop()I

    move-result v1

    iput v1, p3, Landroid/graphics/Rect;->top:I

    .line 25
    iget v1, p2, Landroid/graphics/Rect;->right:I

    invoke-virtual {p0, v1, p4}, Lcom/google/android/material/textfield/TextInputLayout;->getLabelRightBoundAlignedWithSuffix(IZ)I

    move-result p4

    iput p4, p3, Landroid/graphics/Rect;->right:I

    goto :goto_1

    .line 26
    :cond_3
    iget p4, p2, Landroid/graphics/Rect;->left:I

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getPaddingLeft()I

    move-result v1

    add-int/2addr v1, p4

    iput v1, p3, Landroid/graphics/Rect;->left:I

    .line 27
    iget p4, p2, Landroid/graphics/Rect;->top:I

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->calculateLabelMarginTop()I

    move-result v1

    sub-int/2addr p4, v1

    iput p4, p3, Landroid/graphics/Rect;->top:I

    .line 28
    iget p4, p2, Landroid/graphics/Rect;->right:I

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getPaddingRight()I

    move-result v1

    sub-int/2addr p4, v1

    iput p4, p3, Landroid/graphics/Rect;->right:I

    goto :goto_1

    .line 29
    :cond_4
    iget v1, p2, Landroid/graphics/Rect;->left:I

    invoke-virtual {p0, v1, p4}, Lcom/google/android/material/textfield/TextInputLayout;->getLabelLeftBoundAlightWithPrefix(IZ)I

    move-result v1

    iput v1, p3, Landroid/graphics/Rect;->left:I

    .line 30
    iget v1, p2, Landroid/graphics/Rect;->top:I

    iget v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxCollapsedPaddingTopPx:I

    add-int/2addr v1, v2

    iput v1, p3, Landroid/graphics/Rect;->top:I

    .line 31
    iget v1, p2, Landroid/graphics/Rect;->right:I

    invoke-virtual {p0, v1, p4}, Lcom/google/android/material/textfield/TextInputLayout;->getLabelRightBoundAlignedWithSuffix(IZ)I

    move-result p4

    iput p4, p3, Landroid/graphics/Rect;->right:I

    .line 32
    :goto_1
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    iget p4, p3, Landroid/graphics/Rect;->left:I

    iget v1, p3, Landroid/graphics/Rect;->top:I

    iget v2, p3, Landroid/graphics/Rect;->right:I

    iget p3, p3, Landroid/graphics/Rect;->bottom:I

    .line 34
    iget-object v3, p1, Lcom/google/android/material/internal/CollapsingTextHelper;->collapsedBounds:Landroid/graphics/Rect;

    invoke-static {v3, p4, v1, v2, p3}, Lcom/google/android/material/internal/CollapsingTextHelper;->rectEquals(Landroid/graphics/Rect;IIII)Z

    move-result v3

    if-nez v3, :cond_5

    .line 35
    iget-object v3, p1, Lcom/google/android/material/internal/CollapsingTextHelper;->collapsedBounds:Landroid/graphics/Rect;

    invoke-virtual {v3, p4, v1, v2, p3}, Landroid/graphics/Rect;->set(IIII)V

    .line 36
    iput-boolean v0, p1, Lcom/google/android/material/internal/CollapsingTextHelper;->boundsChanged:Z

    .line 37
    invoke-virtual {p1}, Lcom/google/android/material/internal/CollapsingTextHelper;->onBoundsChanged()V

    .line 38
    :cond_5
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    .line 39
    iget-object p3, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-eqz p3, :cond_b

    .line 40
    iget-object p3, p0, Lcom/google/android/material/textfield/TextInputLayout;->tmpBoundsRect:Landroid/graphics/Rect;

    .line 41
    iget-object p4, p1, Lcom/google/android/material/internal/CollapsingTextHelper;->tmpPaint:Landroid/text/TextPaint;

    .line 42
    iget v1, p1, Lcom/google/android/material/internal/CollapsingTextHelper;->expandedTextSize:F

    invoke-virtual {p4, v1}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 43
    iget-object v1, p1, Lcom/google/android/material/internal/CollapsingTextHelper;->expandedTypeface:Landroid/graphics/Typeface;

    invoke-virtual {p4, v1}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 44
    iget v1, p1, Lcom/google/android/material/internal/CollapsingTextHelper;->expandedLetterSpacing:F

    invoke-virtual {p4, v1}, Landroid/text/TextPaint;->setLetterSpacing(F)V

    .line 45
    iget-object p4, p1, Lcom/google/android/material/internal/CollapsingTextHelper;->tmpPaint:Landroid/text/TextPaint;

    invoke-virtual {p4}, Landroid/text/TextPaint;->ascent()F

    move-result p4

    neg-float p4, p4

    .line 46
    iget v1, p2, Landroid/graphics/Rect;->left:I

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getCompoundPaddingLeft()I

    move-result v2

    add-int/2addr v2, v1

    iput v2, p3, Landroid/graphics/Rect;->left:I

    .line 47
    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundMode:I

    if-ne v1, v0, :cond_6

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    .line 48
    invoke-virtual {v1}, Landroid/widget/EditText;->getMinLines()I

    move-result v1

    if-gt v1, v0, :cond_6

    move v1, v0

    goto :goto_2

    :cond_6
    move v1, p5

    :goto_2
    if-eqz v1, :cond_7

    .line 49
    invoke-virtual {p2}, Landroid/graphics/Rect;->centerY()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float v2, p4, v2

    sub-float/2addr v1, v2

    float-to-int v1, v1

    goto :goto_3

    .line 50
    :cond_7
    iget v1, p2, Landroid/graphics/Rect;->top:I

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getCompoundPaddingTop()I

    move-result v2

    add-int/2addr v1, v2

    .line 51
    :goto_3
    iput v1, p3, Landroid/graphics/Rect;->top:I

    .line 52
    iget v1, p2, Landroid/graphics/Rect;->right:I

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getCompoundPaddingRight()I

    move-result v2

    sub-int/2addr v1, v2

    iput v1, p3, Landroid/graphics/Rect;->right:I

    .line 53
    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundMode:I

    if-ne v1, v0, :cond_8

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    .line 54
    invoke-virtual {v1}, Landroid/widget/EditText;->getMinLines()I

    move-result v1

    if-gt v1, v0, :cond_8

    move v1, v0

    goto :goto_4

    :cond_8
    move v1, p5

    :goto_4
    if-eqz v1, :cond_9

    .line 55
    iget p2, p3, Landroid/graphics/Rect;->top:I

    int-to-float p2, p2

    add-float/2addr p2, p4

    float-to-int p2, p2

    goto :goto_5

    .line 56
    :cond_9
    iget p2, p2, Landroid/graphics/Rect;->bottom:I

    iget-object p4, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    invoke-virtual {p4}, Landroid/widget/EditText;->getCompoundPaddingBottom()I

    move-result p4

    sub-int/2addr p2, p4

    .line 57
    :goto_5
    iput p2, p3, Landroid/graphics/Rect;->bottom:I

    .line 58
    iget p4, p3, Landroid/graphics/Rect;->left:I

    iget v1, p3, Landroid/graphics/Rect;->top:I

    iget p3, p3, Landroid/graphics/Rect;->right:I

    .line 59
    iget-object v2, p1, Lcom/google/android/material/internal/CollapsingTextHelper;->expandedBounds:Landroid/graphics/Rect;

    invoke-static {v2, p4, v1, p3, p2}, Lcom/google/android/material/internal/CollapsingTextHelper;->rectEquals(Landroid/graphics/Rect;IIII)Z

    move-result v2

    if-nez v2, :cond_a

    .line 60
    iget-object v2, p1, Lcom/google/android/material/internal/CollapsingTextHelper;->expandedBounds:Landroid/graphics/Rect;

    invoke-virtual {v2, p4, v1, p3, p2}, Landroid/graphics/Rect;->set(IIII)V

    .line 61
    iput-boolean v0, p1, Lcom/google/android/material/internal/CollapsingTextHelper;->boundsChanged:Z

    .line 62
    invoke-virtual {p1}, Lcom/google/android/material/internal/CollapsingTextHelper;->onBoundsChanged()V

    .line 63
    :cond_a
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    .line 64
    invoke-virtual {p1, p5}, Lcom/google/android/material/internal/CollapsingTextHelper;->recalculate(Z)V

    .line 65
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->cutoutEnabled()Z

    move-result p1

    if-eqz p1, :cond_d

    iget-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->hintExpanded:Z

    if-nez p1, :cond_d

    .line 66
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->openCutout()V

    goto :goto_6

    .line 67
    :cond_b
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    throw p0

    .line 68
    :cond_c
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    throw p0

    :cond_d
    :goto_6
    return-void
.end method

.method public onMeasure(II)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 2
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    const/4 p2, 0x0

    if-nez p1, :cond_0

    goto :goto_0

    .line 3
    :cond_0
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->endLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    move-result p1

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->startLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    move-result v0

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 4
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getMeasuredHeight()I

    move-result v0

    if-ge v0, p1, :cond_1

    .line 5
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    invoke-virtual {p2, p1}, Landroid/widget/EditText;->setMinimumHeight(I)V

    const/4 p2, 0x1

    .line 6
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateDummyDrawables()Z

    move-result p1

    if-nez p2, :cond_2

    if-eqz p1, :cond_3

    .line 7
    :cond_2
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    new-instance p2, Lcom/google/android/material/textfield/TextInputLayout$3;

    invoke-direct {p2, p0}, Lcom/google/android/material/textfield/TextInputLayout$3;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->post(Ljava/lang/Runnable;)Z

    .line 8
    :cond_3
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderTextView:Landroid/widget/TextView;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-eqz p1, :cond_4

    .line 9
    invoke-virtual {p1}, Landroid/widget/EditText;->getGravity()I

    move-result p1

    .line 10
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderTextView:Landroid/widget/TextView;

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setGravity(I)V

    .line 11
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderTextView:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    .line 12
    invoke-virtual {p2}, Landroid/widget/EditText;->getCompoundPaddingLeft()I

    move-result p2

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    .line 13
    invoke-virtual {v0}, Landroid/widget/EditText;->getCompoundPaddingTop()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    .line 14
    invoke-virtual {v1}, Landroid/widget/EditText;->getCompoundPaddingRight()I

    move-result v1

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    .line 15
    invoke-virtual {v2}, Landroid/widget/EditText;->getCompoundPaddingBottom()I

    move-result v2

    .line 16
    invoke-virtual {p1, p2, v0, v1, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 17
    :cond_4
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->updatePrefixTextViewPadding()V

    .line 18
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateSuffixTextViewPadding()V

    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/google/android/material/textfield/TextInputLayout$SavedState;

    if-nez v0, :cond_0

    .line 2
    invoke-super {p0, p1}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    return-void

    .line 3
    :cond_0
    check-cast p1, Lcom/google/android/material/textfield/TextInputLayout$SavedState;

    .line 4
    iget-object v0, p1, Landroidx/customview/view/AbsSavedState;->mSuperState:Landroid/os/Parcelable;

    .line 5
    invoke-super {p0, v0}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 6
    iget-object v0, p1, Lcom/google/android/material/textfield/TextInputLayout$SavedState;->error:Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setError(Ljava/lang/CharSequence;)V

    .line 7
    iget-boolean v0, p1, Lcom/google/android/material/textfield/TextInputLayout$SavedState;->isEndIconChecked:Z

    if-eqz v0, :cond_1

    .line 8
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconView:Lcom/google/android/material/internal/CheckableImageButton;

    new-instance v1, Lcom/google/android/material/textfield/TextInputLayout$2;

    invoke-direct {v1, p0}, Lcom/google/android/material/textfield/TextInputLayout$2;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->post(Ljava/lang/Runnable;)Z

    .line 9
    :cond_1
    iget-object v0, p1, Lcom/google/android/material/textfield/TextInputLayout$SavedState;->hintText:Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setHint(Ljava/lang/CharSequence;)V

    .line 10
    iget-object v0, p1, Lcom/google/android/material/textfield/TextInputLayout$SavedState;->helperText:Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setHelperText(Ljava/lang/CharSequence;)V

    .line 11
    iget-object p1, p1, Lcom/google/android/material/textfield/TextInputLayout$SavedState;->placeholderText:Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setPlaceholderText(Ljava/lang/CharSequence;)V

    .line 12
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestLayout()V

    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    .line 2
    new-instance v1, Lcom/google/android/material/textfield/TextInputLayout$SavedState;

    invoke-direct {v1, v0}, Lcom/google/android/material/textfield/TextInputLayout$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 3
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->indicatorViewController:Lcom/google/android/material/textfield/IndicatorViewController;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/IndicatorViewController;->errorShouldBeShown()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getError()Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, v1, Lcom/google/android/material/textfield/TextInputLayout$SavedState;->error:Ljava/lang/CharSequence;

    .line 5
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->hasEndIcon()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconView:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Lcom/google/android/material/internal/CheckableImageButton;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, v1, Lcom/google/android/material/textfield/TextInputLayout$SavedState;->isEndIconChecked:Z

    .line 6
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getHint()Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, v1, Lcom/google/android/material/textfield/TextInputLayout$SavedState;->hintText:Ljava/lang/CharSequence;

    .line 7
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->indicatorViewController:Lcom/google/android/material/textfield/IndicatorViewController;

    .line 8
    iget-boolean v2, v0, Lcom/google/android/material/textfield/IndicatorViewController;->helperTextEnabled:Z

    const/4 v3, 0x0

    if-eqz v2, :cond_2

    .line 9
    iget-object v0, v0, Lcom/google/android/material/textfield/IndicatorViewController;->helperText:Ljava/lang/CharSequence;

    goto :goto_1

    :cond_2
    move-object v0, v3

    .line 10
    :goto_1
    iput-object v0, v1, Lcom/google/android/material/textfield/TextInputLayout$SavedState;->helperText:Ljava/lang/CharSequence;

    .line 11
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderEnabled:Z

    if-eqz v0, :cond_3

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderText:Ljava/lang/CharSequence;

    .line 12
    :cond_3
    iput-object v3, v1, Lcom/google/android/material/textfield/TextInputLayout$SavedState;->placeholderText:Ljava/lang/CharSequence;

    return-object v1
.end method

.method public final openCutout()V
    .locals 12

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->cutoutEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 2
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->tmpRectF:Landroid/graphics/RectF;

    .line 3
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    .line 4
    invoke-virtual {v2}, Landroid/widget/EditText;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getGravity()I

    move-result v3

    .line 5
    iget-object v4, v1, Lcom/google/android/material/internal/CollapsingTextHelper;->text:Ljava/lang/CharSequence;

    invoke-virtual {v1, v4}, Lcom/google/android/material/internal/CollapsingTextHelper;->calculateIsRtl(Ljava/lang/CharSequence;)Z

    move-result v4

    iput-boolean v4, v1, Lcom/google/android/material/internal/CollapsingTextHelper;->isRtl:Z

    const v5, 0x800005

    const/4 v6, 0x1

    const/high16 v7, 0x40000000    # 2.0f

    const/16 v8, 0x11

    const/4 v9, 0x5

    if-eq v3, v8, :cond_6

    and-int/lit8 v10, v3, 0x7

    if-ne v10, v6, :cond_1

    goto :goto_2

    :cond_1
    and-int v10, v3, v5

    if-eq v10, v5, :cond_4

    and-int/lit8 v10, v3, 0x5

    if-ne v10, v9, :cond_2

    goto :goto_0

    :cond_2
    if-eqz v4, :cond_3

    .line 6
    iget-object v4, v1, Lcom/google/android/material/internal/CollapsingTextHelper;->collapsedBounds:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->right:I

    int-to-float v4, v4

    invoke-virtual {v1}, Lcom/google/android/material/internal/CollapsingTextHelper;->calculateCollapsedTextWidth()F

    move-result v10

    goto :goto_3

    :cond_3
    iget-object v4, v1, Lcom/google/android/material/internal/CollapsingTextHelper;->collapsedBounds:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->left:I

    goto :goto_1

    :cond_4
    :goto_0
    if-eqz v4, :cond_5

    .line 7
    iget-object v4, v1, Lcom/google/android/material/internal/CollapsingTextHelper;->collapsedBounds:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->left:I

    :goto_1
    int-to-float v4, v4

    goto :goto_4

    :cond_5
    iget-object v4, v1, Lcom/google/android/material/internal/CollapsingTextHelper;->collapsedBounds:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->right:I

    int-to-float v4, v4

    invoke-virtual {v1}, Lcom/google/android/material/internal/CollapsingTextHelper;->calculateCollapsedTextWidth()F

    move-result v10

    goto :goto_3

    :cond_6
    :goto_2
    int-to-float v4, v2

    div-float/2addr v4, v7

    .line 8
    invoke-virtual {v1}, Lcom/google/android/material/internal/CollapsingTextHelper;->calculateCollapsedTextWidth()F

    move-result v10

    div-float/2addr v10, v7

    :goto_3
    sub-float/2addr v4, v10

    .line 9
    :goto_4
    iput v4, v0, Landroid/graphics/RectF;->left:F

    .line 10
    iget-object v10, v1, Lcom/google/android/material/internal/CollapsingTextHelper;->collapsedBounds:Landroid/graphics/Rect;

    iget v11, v10, Landroid/graphics/Rect;->top:I

    int-to-float v11, v11

    iput v11, v0, Landroid/graphics/RectF;->top:F

    if-eq v3, v8, :cond_c

    and-int/lit8 v8, v3, 0x7

    if-ne v8, v6, :cond_7

    goto :goto_8

    :cond_7
    and-int v2, v3, v5

    if-eq v2, v5, :cond_a

    and-int/lit8 v2, v3, 0x5

    if-ne v2, v9, :cond_8

    goto :goto_5

    .line 11
    :cond_8
    iget-boolean v2, v1, Lcom/google/android/material/internal/CollapsingTextHelper;->isRtl:Z

    if-eqz v2, :cond_9

    iget v2, v10, Landroid/graphics/Rect;->right:I

    goto :goto_7

    :cond_9
    invoke-virtual {v1}, Lcom/google/android/material/internal/CollapsingTextHelper;->calculateCollapsedTextWidth()F

    move-result v2

    goto :goto_6

    .line 12
    :cond_a
    :goto_5
    iget-boolean v2, v1, Lcom/google/android/material/internal/CollapsingTextHelper;->isRtl:Z

    if-eqz v2, :cond_b

    invoke-virtual {v1}, Lcom/google/android/material/internal/CollapsingTextHelper;->calculateCollapsedTextWidth()F

    move-result v2

    :goto_6
    add-float/2addr v2, v4

    goto :goto_9

    :cond_b
    iget v2, v10, Landroid/graphics/Rect;->right:I

    :goto_7
    int-to-float v2, v2

    goto :goto_9

    :cond_c
    :goto_8
    int-to-float v2, v2

    div-float/2addr v2, v7

    .line 13
    invoke-virtual {v1}, Lcom/google/android/material/internal/CollapsingTextHelper;->calculateCollapsedTextWidth()F

    move-result v3

    div-float/2addr v3, v7

    add-float/2addr v2, v3

    .line 14
    :goto_9
    iput v2, v0, Landroid/graphics/RectF;->right:F

    .line 15
    iget-object v2, v1, Lcom/google/android/material/internal/CollapsingTextHelper;->collapsedBounds:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    invoke-virtual {v1}, Lcom/google/android/material/internal/CollapsingTextHelper;->getCollapsedTextHeight()F

    move-result v1

    add-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 16
    iget v1, v0, Landroid/graphics/RectF;->left:F

    iget v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxLabelCutoutPaddingPx:I

    int-to-float v2, v2

    sub-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 17
    iget v1, v0, Landroid/graphics/RectF;->right:F

    add-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 18
    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeWidthPx:I

    iput v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxLabelCutoutHeight:I

    const/4 v2, 0x0

    .line 19
    iput v2, v0, Landroid/graphics/RectF;->top:F

    int-to-float v1, v1

    .line 20
    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 21
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    move-result v1

    neg-int v1, v1

    int-to-float v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/graphics/RectF;->offset(FF)V

    .line 22
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackground:Lcom/google/android/material/shape/MaterialShapeDrawable;

    check-cast p0, Lcom/google/android/material/textfield/CutoutDrawable;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    iget v1, v0, Landroid/graphics/RectF;->left:F

    iget v2, v0, Landroid/graphics/RectF;->top:F

    iget v3, v0, Landroid/graphics/RectF;->right:F

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p0, v1, v2, v3, v0}, Lcom/google/android/material/textfield/CutoutDrawable;->setCutout(FFFF)V

    return-void
.end method

.method public refreshEndIconDrawableState()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconView:Lcom/google/android/material/internal/CheckableImageButton;

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconTintList:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->refreshIconDrawableState(Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final refreshIconDrawableState(Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 2
    invoke-virtual {p1}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_1

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 3
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getDrawableState()[I

    move-result-object p0

    .line 4
    invoke-virtual {p1}, Landroid/widget/ImageButton;->getDrawableState()[I

    move-result-object v1

    .line 5
    array-length v2, p0

    .line 6
    array-length v3, p0

    array-length v4, v1

    add-int/2addr v3, v4

    invoke-static {p0, v3}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object p0

    .line 7
    array-length v3, v1

    const/4 v4, 0x0

    invoke-static {v1, v4, p0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 8
    invoke-virtual {p2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v1

    invoke-virtual {p2, p0, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p0

    .line 9
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p2

    .line 10
    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    .line 11
    invoke-virtual {p2, p0}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    .line 12
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public setEnabled(Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->recursiveSetEnabled(Landroid/view/ViewGroup;Z)V

    .line 2
    invoke-super {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method public setEndIconCheckable(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconView:Lcom/google/android/material/internal/CheckableImageButton;

    .line 2
    iget-boolean v0, p0, Lcom/google/android/material/internal/CheckableImageButton;->checkable:Z

    if-eq v0, p1, :cond_0

    .line 3
    iput-boolean p1, p0, Lcom/google/android/material/internal/CheckableImageButton;->checkable:Z

    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Landroid/widget/ImageButton;->sendAccessibilityEvent(I)V

    :cond_0
    return-void
.end method

.method public setEndIconContentDescription(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconView:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    if-eq v0, p1, :cond_0

    .line 2
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconView:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {p0, p1}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method public setEndIconDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconView:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->refreshEndIconDrawableState()V

    return-void
.end method

.method public setEndIconMode(I)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconMode:I

    .line 2
    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconMode:I

    .line 3
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconChangedListeners:Ljava/util/LinkedHashSet;

    invoke-virtual {v1}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/textfield/TextInputLayout$OnEndIconChangedListener;

    .line 4
    invoke-interface {v2, p0, v0}, Lcom/google/android/material/textfield/TextInputLayout$OnEndIconChangedListener;->onEndIconChanged(Lcom/google/android/material/textfield/TextInputLayout;I)V

    goto :goto_0

    :cond_0
    if-eqz p1, :cond_1

    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    .line 5
    :goto_1
    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconVisible(Z)V

    .line 6
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getEndIconDelegate()Lcom/google/android/material/textfield/EndIconDelegate;

    move-result-object v0

    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundMode:I

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/EndIconDelegate;->isBoxBackgroundModeSupported(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 7
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getEndIconDelegate()Lcom/google/android/material/textfield/EndIconDelegate;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/material/textfield/EndIconDelegate;->initialize()V

    .line 8
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->applyEndIconTint()V

    return-void

    .line 9
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "The current box background mode "

    invoke-static {v1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundMode:I

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " is not supported by the end icon mode "

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setEndIconOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconView:Lcom/google/android/material/internal/CheckableImageButton;

    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconOnLongClickListener:Landroid/view/View$OnLongClickListener;

    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 3
    invoke-static {p1, p0}, Lcom/google/android/material/textfield/TextInputLayout;->setIconClickable(Lcom/google/android/material/internal/CheckableImageButton;Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public setEndIconVisible(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->isEndIconVisible()Z

    move-result v0

    if-eq v0, p1, :cond_1

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconView:Lcom/google/android/material/internal/CheckableImageButton;

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/16 p1, 0x8

    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateSuffixTextViewPadding()V

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateDummyDrawables()Z

    :cond_1
    return-void
.end method

.method public setError(Ljava/lang/CharSequence;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->indicatorViewController:Lcom/google/android/material/textfield/IndicatorViewController;

    .line 2
    iget-boolean v0, v0, Lcom/google/android/material/textfield/IndicatorViewController;->errorEnabled:Z

    const/4 v1, 0x1

    if-nez v0, :cond_1

    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 4
    :cond_0
    invoke-virtual {p0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setErrorEnabled(Z)V

    .line 5
    :cond_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 6
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->indicatorViewController:Lcom/google/android/material/textfield/IndicatorViewController;

    .line 7
    invoke-virtual {p0}, Lcom/google/android/material/textfield/IndicatorViewController;->cancelCaptionAnimator()V

    .line 8
    iput-object p1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->errorText:Ljava/lang/CharSequence;

    .line 9
    iget-object v0, p0, Lcom/google/android/material/textfield/IndicatorViewController;->errorView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    iget v0, p0, Lcom/google/android/material/textfield/IndicatorViewController;->captionDisplayed:I

    if-eq v0, v1, :cond_2

    .line 11
    iput v1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->captionToShow:I

    .line 12
    :cond_2
    iget v1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->captionToShow:I

    iget-object v2, p0, Lcom/google/android/material/textfield/IndicatorViewController;->errorView:Landroid/widget/TextView;

    .line 13
    invoke-virtual {p0, v2, p1}, Lcom/google/android/material/textfield/IndicatorViewController;->shouldAnimateCaptionView(Landroid/widget/TextView;Ljava/lang/CharSequence;)Z

    move-result p1

    .line 14
    invoke-virtual {p0, v0, v1, p1}, Lcom/google/android/material/textfield/IndicatorViewController;->updateCaptionViewsVisibility(IIZ)V

    goto :goto_0

    .line 15
    :cond_3
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->indicatorViewController:Lcom/google/android/material/textfield/IndicatorViewController;

    invoke-virtual {p0}, Lcom/google/android/material/textfield/IndicatorViewController;->hideError()V

    :goto_0
    return-void
.end method

.method public setErrorEnabled(Z)V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->indicatorViewController:Lcom/google/android/material/textfield/IndicatorViewController;

    .line 2
    iget-boolean v0, p0, Lcom/google/android/material/textfield/IndicatorViewController;->errorEnabled:Z

    if-ne v0, p1, :cond_0

    goto :goto_1

    .line 3
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/material/textfield/IndicatorViewController;->cancelCaptionAnimator()V

    const/4 v0, 0x0

    if-eqz p1, :cond_4

    .line 4
    new-instance v1, Landroidx/appcompat/widget/AppCompatTextView;

    iget-object v2, p0, Lcom/google/android/material/textfield/IndicatorViewController;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->errorView:Landroid/widget/TextView;

    const v2, 0x7f0a0250

    .line 5
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setId(I)V

    .line 6
    iget-object v1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->errorView:Landroid/widget/TextView;

    const/4 v2, 0x5

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextAlignment(I)V

    .line 7
    iget v1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->errorTextAppearance:I

    .line 8
    iput v1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->errorTextAppearance:I

    .line 9
    iget-object v2, p0, Lcom/google/android/material/textfield/IndicatorViewController;->errorView:Landroid/widget/TextView;

    if-eqz v2, :cond_1

    .line 10
    iget-object v3, p0, Lcom/google/android/material/textfield/IndicatorViewController;->textInputView:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v3, v2, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setTextAppearanceCompatWithErrorFallback(Landroid/widget/TextView;I)V

    .line 11
    :cond_1
    iget-object v1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->errorViewTextColor:Landroid/content/res/ColorStateList;

    .line 12
    iput-object v1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->errorViewTextColor:Landroid/content/res/ColorStateList;

    .line 13
    iget-object v2, p0, Lcom/google/android/material/textfield/IndicatorViewController;->errorView:Landroid/widget/TextView;

    if-eqz v2, :cond_2

    if-eqz v1, :cond_2

    .line 14
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 15
    :cond_2
    iget-object v1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->errorViewContentDescription:Ljava/lang/CharSequence;

    .line 16
    iput-object v1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->errorViewContentDescription:Ljava/lang/CharSequence;

    .line 17
    iget-object v2, p0, Lcom/google/android/material/textfield/IndicatorViewController;->errorView:Landroid/widget/TextView;

    if-eqz v2, :cond_3

    .line 18
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 19
    :cond_3
    iget-object v1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->errorView:Landroid/widget/TextView;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 20
    iget-object v1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->errorView:Landroid/widget/TextView;

    const/4 v2, 0x1

    sget-object v3, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 21
    invoke-virtual {v1, v2}, Landroid/view/View;->setAccessibilityLiveRegion(I)V

    .line 22
    iget-object v1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->errorView:Landroid/widget/TextView;

    invoke-virtual {p0, v1, v0}, Lcom/google/android/material/textfield/IndicatorViewController;->addIndicator(Landroid/widget/TextView;I)V

    goto :goto_0

    .line 23
    :cond_4
    invoke-virtual {p0}, Lcom/google/android/material/textfield/IndicatorViewController;->hideError()V

    .line 24
    iget-object v1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->errorView:Landroid/widget/TextView;

    invoke-virtual {p0, v1, v0}, Lcom/google/android/material/textfield/IndicatorViewController;->removeIndicator(Landroid/widget/TextView;I)V

    const/4 v0, 0x0

    .line 25
    iput-object v0, p0, Lcom/google/android/material/textfield/IndicatorViewController;->errorView:Landroid/widget/TextView;

    .line 26
    iget-object v0, p0, Lcom/google/android/material/textfield/IndicatorViewController;->textInputView:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputLayout;->updateEditTextBackground()V

    .line 27
    iget-object v0, p0, Lcom/google/android/material/textfield/IndicatorViewController;->textInputView:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputLayout;->updateTextInputBoxState()V

    .line 28
    :goto_0
    iput-boolean p1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->errorEnabled:Z

    :goto_1
    return-void
.end method

.method public setErrorIconDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->errorIconView:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    if-eqz p1, :cond_0

    .line 2
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->indicatorViewController:Lcom/google/android/material/textfield/IndicatorViewController;

    .line 3
    iget-boolean p1, p1, Lcom/google/android/material/textfield/IndicatorViewController;->errorEnabled:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 4
    :goto_0
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setErrorIconVisible(Z)V

    return-void
.end method

.method public final setErrorIconVisible(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->errorIconView:Lcom/google/android/material/internal/CheckableImageButton;

    const/4 v1, 0x0

    const/16 v2, 0x8

    if-eqz p1, :cond_0

    move v3, v1

    goto :goto_0

    :cond_0
    move v3, v2

    :goto_0
    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconFrame:Landroid/widget/FrameLayout;

    if-eqz p1, :cond_1

    move v1, v2

    :cond_1
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateSuffixTextViewPadding()V

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->hasEndIcon()Z

    move-result p1

    if-nez p1, :cond_2

    .line 5
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateDummyDrawables()Z

    :cond_2
    return-void
.end method

.method public setHelperText(Ljava/lang/CharSequence;)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->indicatorViewController:Lcom/google/android/material/textfield/IndicatorViewController;

    .line 3
    iget-boolean p1, p1, Lcom/google/android/material/textfield/IndicatorViewController;->helperTextEnabled:Z

    if-eqz p1, :cond_3

    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setHelperTextEnabled(Z)V

    goto :goto_0

    .line 5
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->indicatorViewController:Lcom/google/android/material/textfield/IndicatorViewController;

    .line 6
    iget-boolean v0, v0, Lcom/google/android/material/textfield/IndicatorViewController;->helperTextEnabled:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    .line 7
    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setHelperTextEnabled(Z)V

    .line 8
    :cond_1
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->indicatorViewController:Lcom/google/android/material/textfield/IndicatorViewController;

    .line 9
    invoke-virtual {p0}, Lcom/google/android/material/textfield/IndicatorViewController;->cancelCaptionAnimator()V

    .line 10
    iput-object p1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->helperText:Ljava/lang/CharSequence;

    .line 11
    iget-object v0, p0, Lcom/google/android/material/textfield/IndicatorViewController;->helperTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    iget v0, p0, Lcom/google/android/material/textfield/IndicatorViewController;->captionDisplayed:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    .line 13
    iput v1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->captionToShow:I

    .line 14
    :cond_2
    iget v1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->captionToShow:I

    iget-object v2, p0, Lcom/google/android/material/textfield/IndicatorViewController;->helperTextView:Landroid/widget/TextView;

    .line 15
    invoke-virtual {p0, v2, p1}, Lcom/google/android/material/textfield/IndicatorViewController;->shouldAnimateCaptionView(Landroid/widget/TextView;Ljava/lang/CharSequence;)Z

    move-result p1

    .line 16
    invoke-virtual {p0, v0, v1, p1}, Lcom/google/android/material/textfield/IndicatorViewController;->updateCaptionViewsVisibility(IIZ)V

    :cond_3
    :goto_0
    return-void
.end method

.method public setHelperTextEnabled(Z)V
    .locals 5

    .line 1
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->indicatorViewController:Lcom/google/android/material/textfield/IndicatorViewController;

    .line 2
    iget-boolean v0, p0, Lcom/google/android/material/textfield/IndicatorViewController;->helperTextEnabled:Z

    if-ne v0, p1, :cond_0

    goto :goto_1

    .line 3
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/material/textfield/IndicatorViewController;->cancelCaptionAnimator()V

    const/4 v0, 0x1

    if-eqz p1, :cond_3

    .line 4
    new-instance v1, Landroidx/appcompat/widget/AppCompatTextView;

    iget-object v2, p0, Lcom/google/android/material/textfield/IndicatorViewController;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->helperTextView:Landroid/widget/TextView;

    const v2, 0x7f0a0251

    .line 5
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setId(I)V

    .line 6
    iget-object v1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->helperTextView:Landroid/widget/TextView;

    const/4 v2, 0x5

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextAlignment(I)V

    .line 7
    iget-object v1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->helperTextView:Landroid/widget/TextView;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 8
    iget-object v1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->helperTextView:Landroid/widget/TextView;

    sget-object v2, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 9
    invoke-virtual {v1, v0}, Landroid/view/View;->setAccessibilityLiveRegion(I)V

    .line 10
    iget v1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->helperTextTextAppearance:I

    .line 11
    iput v1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->helperTextTextAppearance:I

    .line 12
    iget-object v2, p0, Lcom/google/android/material/textfield/IndicatorViewController;->helperTextView:Landroid/widget/TextView;

    if-eqz v2, :cond_1

    .line 13
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextAppearance(I)V

    .line 14
    :cond_1
    iget-object v1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->helperTextViewTextColor:Landroid/content/res/ColorStateList;

    .line 15
    iput-object v1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->helperTextViewTextColor:Landroid/content/res/ColorStateList;

    .line 16
    iget-object v2, p0, Lcom/google/android/material/textfield/IndicatorViewController;->helperTextView:Landroid/widget/TextView;

    if-eqz v2, :cond_2

    if-eqz v1, :cond_2

    .line 17
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 18
    :cond_2
    iget-object v1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->helperTextView:Landroid/widget/TextView;

    invoke-virtual {p0, v1, v0}, Lcom/google/android/material/textfield/IndicatorViewController;->addIndicator(Landroid/widget/TextView;I)V

    goto :goto_0

    .line 19
    :cond_3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/IndicatorViewController;->cancelCaptionAnimator()V

    .line 20
    iget v1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->captionDisplayed:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_4

    const/4 v2, 0x0

    .line 21
    iput v2, p0, Lcom/google/android/material/textfield/IndicatorViewController;->captionToShow:I

    .line 22
    :cond_4
    iget v2, p0, Lcom/google/android/material/textfield/IndicatorViewController;->captionToShow:I

    iget-object v3, p0, Lcom/google/android/material/textfield/IndicatorViewController;->helperTextView:Landroid/widget/TextView;

    const/4 v4, 0x0

    .line 23
    invoke-virtual {p0, v3, v4}, Lcom/google/android/material/textfield/IndicatorViewController;->shouldAnimateCaptionView(Landroid/widget/TextView;Ljava/lang/CharSequence;)Z

    move-result v3

    .line 24
    invoke-virtual {p0, v1, v2, v3}, Lcom/google/android/material/textfield/IndicatorViewController;->updateCaptionViewsVisibility(IIZ)V

    .line 25
    iget-object v1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->helperTextView:Landroid/widget/TextView;

    invoke-virtual {p0, v1, v0}, Lcom/google/android/material/textfield/IndicatorViewController;->removeIndicator(Landroid/widget/TextView;I)V

    .line 26
    iput-object v4, p0, Lcom/google/android/material/textfield/IndicatorViewController;->helperTextView:Landroid/widget/TextView;

    .line 27
    iget-object v0, p0, Lcom/google/android/material/textfield/IndicatorViewController;->textInputView:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputLayout;->updateEditTextBackground()V

    .line 28
    iget-object v0, p0, Lcom/google/android/material/textfield/IndicatorViewController;->textInputView:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputLayout;->updateTextInputBoxState()V

    .line 29
    :goto_0
    iput-boolean p1, p0, Lcom/google/android/material/textfield/IndicatorViewController;->helperTextEnabled:Z

    :goto_1
    return-void
.end method

.method public setHint(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->hintEnabled:Z

    if-eqz v0, :cond_1

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->hint:Ljava/lang/CharSequence;

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 3
    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->hint:Ljava/lang/CharSequence;

    .line 4
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    invoke-virtual {v0, p1}, Lcom/google/android/material/internal/CollapsingTextHelper;->setText(Ljava/lang/CharSequence;)V

    .line 5
    iget-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->hintExpanded:Z

    if-nez p1, :cond_0

    .line 6
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->openCutout()V

    :cond_0
    const/16 p1, 0x800

    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->sendAccessibilityEvent(I)V

    :cond_1
    return-void
.end method

.method public setPlaceholderText(Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderEnabled:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setPlaceholderTextEnabled(Z)V

    goto :goto_0

    .line 3
    :cond_0
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderEnabled:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setPlaceholderTextEnabled(Z)V

    .line 5
    :cond_1
    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderText:Ljava/lang/CharSequence;

    .line 6
    :goto_0
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-nez p1, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v1

    :goto_1
    invoke-virtual {p0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->updatePlaceholderText(I)V

    return-void
.end method

.method public final setPlaceholderTextEnabled(Z)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderEnabled:Z

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_2

    .line 2
    new-instance v0, Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderTextView:Landroid/widget/TextView;

    const v1, 0x7f0a0252

    .line 3
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setId(I)V

    .line 4
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderTextView:Landroid/widget/TextView;

    const/4 v1, 0x1

    sget-object v2, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setAccessibilityLiveRegion(I)V

    .line 6
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderTextAppearance:I

    .line 7
    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderTextAppearance:I

    .line 8
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderTextView:Landroid/widget/TextView;

    if-eqz v1, :cond_1

    .line 9
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextAppearance(I)V

    .line 10
    :cond_1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_4

    .line 11
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->inputFrame:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 12
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderTextView:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 13
    :cond_2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_3

    const/16 v1, 0x8

    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_3
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderTextView:Landroid/widget/TextView;

    .line 16
    :cond_4
    :goto_0
    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderEnabled:Z

    return-void
.end method

.method public setStartIconVisible(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->startIconView:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    if-eq v0, p1, :cond_2

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->startIconView:Lcom/google/android/material/internal/CheckableImageButton;

    if-eqz p1, :cond_1

    goto :goto_1

    :cond_1
    const/16 v1, 0x8

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->updatePrefixTextViewPadding()V

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateDummyDrawables()Z

    :cond_2
    return-void
.end method

.method public setTextAppearanceCompatWithErrorFallback(Landroid/widget/TextView;I)V
    .locals 2

    const/4 v0, 0x1

    .line 1
    :try_start_0
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextAppearance(I)V

    .line 2
    invoke-virtual {p1}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const v1, -0xff01

    if-ne p2, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    move v0, p2

    :catch_0
    :goto_0
    if-eqz v0, :cond_1

    const p2, 0x7f12017c

    .line 3
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextAppearance(I)V

    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p0

    const p2, 0x7f06005b

    sget-object v0, Landroidx/core/content/ContextCompat;->sLock:Ljava/lang/Object;

    .line 5
    invoke-virtual {p0, p2}, Landroid/content/Context;->getColor(I)I

    move-result p0

    .line 6
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_1
    return-void
.end method

.method public final updateCounter()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterView:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v0

    :goto_0
    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->updateCounter(I)V

    :cond_1
    return-void
.end method

.method public updateCounter(I)V
    .locals 12

    .line 3
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterOverflowed:Z

    .line 4
    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterMaxLength:I

    const/4 v2, 0x0

    const/4 v3, -0x1

    const/4 v4, 0x0

    if-ne v1, v3, :cond_0

    .line 5
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterView:Landroid/widget/TextView;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterView:Landroid/widget/TextView;

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 7
    iput-boolean v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterOverflowed:Z

    goto/16 :goto_c

    :cond_0
    const/4 v5, 0x1

    if-le p1, v1, :cond_1

    move v1, v5

    goto :goto_0

    :cond_1
    move v1, v4

    .line 8
    :goto_0
    iput-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterOverflowed:Z

    .line 9
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterView:Landroid/widget/TextView;

    iget v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterMaxLength:I

    iget-boolean v8, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterOverflowed:Z

    if-eqz v8, :cond_2

    const v8, 0x7f11004b

    goto :goto_1

    :cond_2
    const v8, 0x7f11004a

    :goto_1
    const/4 v9, 0x2

    new-array v10, v9, [Ljava/lang/Object;

    .line 10
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v4

    .line 11
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v10, v5

    .line 12
    invoke-virtual {v1, v8, v10}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 13
    invoke-virtual {v6, v1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 14
    iget-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterOverflowed:Z

    if-eq v0, v1, :cond_3

    .line 15
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateCounterTextAppearanceAndColor()V

    .line 16
    :cond_3
    sget-object v1, Landroidx/core/text/BidiFormatter;->DEFAULT_TEXT_DIRECTION_HEURISTIC:Landroidx/core/text/TextDirectionHeuristicCompat;

    .line 17
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    .line 18
    sget v6, Landroidx/core/text/TextUtilsCompat;->$r8$clinit:I

    .line 19
    invoke-static {v1}, Landroid/text/TextUtils;->getLayoutDirectionFromLocale(Ljava/util/Locale;)I

    move-result v1

    if-ne v1, v5, :cond_4

    move v1, v5

    goto :goto_2

    :cond_4
    move v1, v4

    .line 20
    :goto_2
    sget-object v6, Landroidx/core/text/BidiFormatter;->DEFAULT_TEXT_DIRECTION_HEURISTIC:Landroidx/core/text/TextDirectionHeuristicCompat;

    if-eqz v1, :cond_5

    .line 21
    sget-object v1, Landroidx/core/text/BidiFormatter;->DEFAULT_RTL_INSTANCE:Landroidx/core/text/BidiFormatter;

    goto :goto_3

    :cond_5
    sget-object v1, Landroidx/core/text/BidiFormatter;->DEFAULT_LTR_INSTANCE:Landroidx/core/text/BidiFormatter;

    .line 22
    :goto_3
    iget-object v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterView:Landroid/widget/TextView;

    .line 23
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v7

    const v8, 0x7f11004c

    new-array v10, v9, [Ljava/lang/Object;

    .line 24
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v10, v4

    iget p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterMaxLength:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v10, v5

    invoke-virtual {v7, v8, v10}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 25
    iget-object v7, v1, Landroidx/core/text/BidiFormatter;->mDefaultTextDirectionHeuristicCompat:Landroidx/core/text/TextDirectionHeuristicCompat;

    if-nez p1, :cond_6

    goto/16 :goto_b

    .line 26
    :cond_6
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    check-cast v7, Landroidx/core/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicImpl;

    invoke-virtual {v7, p1, v4, v2}, Landroidx/core/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicImpl;->isRtl(Ljava/lang/CharSequence;II)Z

    move-result v2

    .line 27
    new-instance v7, Landroid/text/SpannableStringBuilder;

    invoke-direct {v7}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 28
    iget v8, v1, Landroidx/core/text/BidiFormatter;->mFlags:I

    and-int/2addr v8, v9

    if-eqz v8, :cond_7

    move v8, v5

    goto :goto_4

    :cond_7
    move v8, v4

    :goto_4
    const-string v9, ""

    if-eqz v8, :cond_d

    if-eqz v2, :cond_8

    .line 29
    sget-object v8, Landroidx/core/text/TextDirectionHeuristicsCompat;->RTL:Landroidx/core/text/TextDirectionHeuristicCompat;

    goto :goto_5

    :cond_8
    sget-object v8, Landroidx/core/text/TextDirectionHeuristicsCompat;->LTR:Landroidx/core/text/TextDirectionHeuristicCompat;

    .line 30
    :goto_5
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v10

    check-cast v8, Landroidx/core/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicImpl;

    invoke-virtual {v8, p1, v4, v10}, Landroidx/core/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicImpl;->isRtl(Ljava/lang/CharSequence;II)Z

    move-result v8

    .line 31
    iget-boolean v10, v1, Landroidx/core/text/BidiFormatter;->mIsRtlContext:Z

    if-nez v10, :cond_a

    if-nez v8, :cond_9

    invoke-static {p1}, Landroidx/core/text/BidiFormatter;->getEntryDir(Ljava/lang/CharSequence;)I

    move-result v10

    if-ne v10, v5, :cond_a

    .line 32
    :cond_9
    sget-object v8, Landroidx/core/text/BidiFormatter;->LRM_STRING:Ljava/lang/String;

    goto :goto_6

    .line 33
    :cond_a
    iget-boolean v10, v1, Landroidx/core/text/BidiFormatter;->mIsRtlContext:Z

    if-eqz v10, :cond_c

    if-eqz v8, :cond_b

    invoke-static {p1}, Landroidx/core/text/BidiFormatter;->getEntryDir(Ljava/lang/CharSequence;)I

    move-result v8

    if-ne v8, v3, :cond_c

    .line 34
    :cond_b
    sget-object v8, Landroidx/core/text/BidiFormatter;->RLM_STRING:Ljava/lang/String;

    goto :goto_6

    :cond_c
    move-object v8, v9

    .line 35
    :goto_6
    invoke-virtual {v7, v8}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 36
    :cond_d
    iget-boolean v8, v1, Landroidx/core/text/BidiFormatter;->mIsRtlContext:Z

    if-eq v2, v8, :cond_f

    if-eqz v2, :cond_e

    const/16 v8, 0x202b

    goto :goto_7

    :cond_e
    const/16 v8, 0x202a

    .line 37
    :goto_7
    invoke-virtual {v7, v8}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 38
    invoke-virtual {v7, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    const/16 v8, 0x202c

    .line 39
    invoke-virtual {v7, v8}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    goto :goto_8

    .line 40
    :cond_f
    invoke-virtual {v7, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    :goto_8
    if-eqz v2, :cond_10

    .line 41
    sget-object v2, Landroidx/core/text/TextDirectionHeuristicsCompat;->RTL:Landroidx/core/text/TextDirectionHeuristicCompat;

    goto :goto_9

    :cond_10
    sget-object v2, Landroidx/core/text/TextDirectionHeuristicsCompat;->LTR:Landroidx/core/text/TextDirectionHeuristicCompat;

    .line 42
    :goto_9
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    check-cast v2, Landroidx/core/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicImpl;

    invoke-virtual {v2, p1, v4, v8}, Landroidx/core/text/TextDirectionHeuristicsCompat$TextDirectionHeuristicImpl;->isRtl(Ljava/lang/CharSequence;II)Z

    move-result v2

    .line 43
    iget-boolean v8, v1, Landroidx/core/text/BidiFormatter;->mIsRtlContext:Z

    if-nez v8, :cond_12

    if-nez v2, :cond_11

    invoke-static {p1}, Landroidx/core/text/BidiFormatter;->getExitDir(Ljava/lang/CharSequence;)I

    move-result v8

    if-ne v8, v5, :cond_12

    .line 44
    :cond_11
    sget-object v9, Landroidx/core/text/BidiFormatter;->LRM_STRING:Ljava/lang/String;

    goto :goto_a

    .line 45
    :cond_12
    iget-boolean v1, v1, Landroidx/core/text/BidiFormatter;->mIsRtlContext:Z

    if-eqz v1, :cond_14

    if-eqz v2, :cond_13

    invoke-static {p1}, Landroidx/core/text/BidiFormatter;->getExitDir(Ljava/lang/CharSequence;)I

    move-result p1

    if-ne p1, v3, :cond_14

    .line 46
    :cond_13
    sget-object v9, Landroidx/core/text/BidiFormatter;->RLM_STRING:Ljava/lang/String;

    .line 47
    :cond_14
    :goto_a
    invoke-virtual {v7, v9}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 48
    invoke-virtual {v7}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 49
    :goto_b
    invoke-virtual {v6, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    :goto_c
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-eqz p1, :cond_15

    iget-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterOverflowed:Z

    if-eq v0, p1, :cond_15

    .line 51
    invoke-virtual {p0, v4, v4}, Lcom/google/android/material/textfield/TextInputLayout;->updateLabelState(ZZ)V

    .line 52
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateTextInputBoxState()V

    .line 53
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateEditTextBackground()V

    :cond_15
    return-void
.end method

.method public final updateCounterTextAppearanceAndColor()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterView:Landroid/widget/TextView;

    if-eqz v0, :cond_2

    .line 2
    iget-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterOverflowed:Z

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterOverflowTextAppearance:I

    goto :goto_0

    :cond_0
    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterTextAppearance:I

    :goto_0
    invoke-virtual {p0, v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setTextAppearanceCompatWithErrorFallback(Landroid/widget/TextView;I)V

    .line 3
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterOverflowed:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterTextColor:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_1

    .line 4
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterView:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 5
    :cond_1
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterOverflowed:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterOverflowTextColor:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_2

    .line 6
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterView:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_2
    return-void
.end method

.method public final updateDummyDrawables()Z
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 2
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->startIconView:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v2, 0x1

    if-nez v0, :cond_1

    .line 3
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->prefixText:Ljava/lang/CharSequence;

    if-eqz v0, :cond_2

    :cond_1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->startLayout:Landroid/widget/LinearLayout;

    .line 4
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    move-result v0

    if-lez v0, :cond_2

    move v0, v2

    goto :goto_0

    :cond_2
    move v0, v1

    :goto_0
    const/4 v3, 0x0

    const/4 v4, 0x3

    const/4 v5, 0x2

    if-eqz v0, :cond_6

    .line 5
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->startLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    move-result v0

    iget-object v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getPaddingLeft()I

    move-result v6

    sub-int/2addr v0, v6

    .line 6
    iget-object v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->startDummyDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v6, :cond_3

    iget v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->startDummyDrawableWidth:I

    if-eq v6, v0, :cond_4

    .line 7
    :cond_3
    new-instance v6, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v6}, Landroid/graphics/drawable/ColorDrawable;-><init>()V

    iput-object v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->startDummyDrawable:Landroid/graphics/drawable/Drawable;

    .line 8
    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->startDummyDrawableWidth:I

    .line 9
    invoke-virtual {v6, v1, v1, v0, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 10
    :cond_4
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    .line 11
    invoke-virtual {v0}, Landroid/widget/TextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 12
    aget-object v6, v0, v1

    iget-object v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->startDummyDrawable:Landroid/graphics/drawable/Drawable;

    if-eq v6, v7, :cond_5

    .line 13
    iget-object v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    aget-object v8, v0, v2

    aget-object v9, v0, v5

    aget-object v0, v0, v4

    .line 14
    invoke-virtual {v6, v7, v8, v9, v0}, Landroid/widget/TextView;->setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    :goto_1
    move v0, v2

    goto :goto_2

    :cond_5
    move v0, v1

    goto :goto_2

    .line 15
    :cond_6
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->startDummyDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_5

    .line 16
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    .line 17
    invoke-virtual {v0}, Landroid/widget/TextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 18
    iget-object v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    aget-object v7, v0, v2

    aget-object v8, v0, v5

    aget-object v0, v0, v4

    .line 19
    invoke-virtual {v6, v3, v7, v8, v0}, Landroid/widget/TextView;->setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 20
    iput-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->startDummyDrawable:Landroid/graphics/drawable/Drawable;

    goto :goto_1

    .line 21
    :goto_2
    iget-object v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->errorIconView:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v6}, Landroid/widget/ImageButton;->getVisibility()I

    move-result v6

    if-eqz v6, :cond_8

    .line 22
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->hasEndIcon()Z

    move-result v6

    if-eqz v6, :cond_7

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->isEndIconVisible()Z

    move-result v6

    if-nez v6, :cond_8

    :cond_7
    iget-object v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->suffixText:Ljava/lang/CharSequence;

    if-eqz v6, :cond_9

    :cond_8
    iget-object v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->endLayout:Landroid/widget/LinearLayout;

    .line 23
    invoke-virtual {v6}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    move-result v6

    if-lez v6, :cond_9

    move v6, v2

    goto :goto_3

    :cond_9
    move v6, v1

    :goto_3
    if-eqz v6, :cond_10

    .line 24
    iget-object v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->suffixTextView:Landroid/widget/TextView;

    invoke-virtual {v6}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v6

    iget-object v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    invoke-virtual {v7}, Landroid/widget/EditText;->getPaddingRight()I

    move-result v7

    sub-int/2addr v6, v7

    .line 25
    iget-object v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->errorIconView:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v7}, Landroid/widget/ImageButton;->getVisibility()I

    move-result v7

    if-nez v7, :cond_a

    .line 26
    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->errorIconView:Lcom/google/android/material/internal/CheckableImageButton;

    goto :goto_4

    .line 27
    :cond_a
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->hasEndIcon()Z

    move-result v7

    if-eqz v7, :cond_b

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->isEndIconVisible()Z

    move-result v7

    if-eqz v7, :cond_b

    .line 28
    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconView:Lcom/google/android/material/internal/CheckableImageButton;

    :cond_b
    :goto_4
    if-eqz v3, :cond_c

    .line 29
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    add-int/2addr v7, v6

    .line 30
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 31
    invoke-virtual {v3}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I

    move-result v3

    add-int v6, v7, v3

    .line 32
    :cond_c
    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    .line 33
    invoke-virtual {v3}, Landroid/widget/TextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 34
    iget-object v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->endDummyDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v7, :cond_d

    iget v8, p0, Lcom/google/android/material/textfield/TextInputLayout;->endDummyDrawableWidth:I

    if-eq v8, v6, :cond_d

    .line 35
    iput v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->endDummyDrawableWidth:I

    .line 36
    invoke-virtual {v7, v1, v1, v6, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 37
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    aget-object v1, v3, v1

    aget-object v5, v3, v2

    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->endDummyDrawable:Landroid/graphics/drawable/Drawable;

    aget-object v3, v3, v4

    .line 38
    invoke-virtual {v0, v1, v5, p0, v3}, Landroid/widget/TextView;->setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_6

    :cond_d
    if-nez v7, :cond_e

    .line 39
    new-instance v7, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v7}, Landroid/graphics/drawable/ColorDrawable;-><init>()V

    iput-object v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->endDummyDrawable:Landroid/graphics/drawable/Drawable;

    .line 40
    iput v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->endDummyDrawableWidth:I

    .line 41
    invoke-virtual {v7, v1, v1, v6, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 42
    :cond_e
    aget-object v6, v3, v5

    iget-object v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->endDummyDrawable:Landroid/graphics/drawable/Drawable;

    if-eq v6, v7, :cond_f

    .line 43
    aget-object v0, v3, v5

    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->originalEditTextEndDrawable:Landroid/graphics/drawable/Drawable;

    .line 44
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    aget-object v0, v3, v1

    aget-object v1, v3, v2

    aget-object v3, v3, v4

    .line 45
    invoke-virtual {p0, v0, v1, v7, v3}, Landroid/widget/TextView;->setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_6

    :cond_f
    move v2, v0

    goto :goto_6

    .line 46
    :cond_10
    iget-object v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->endDummyDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v6, :cond_12

    .line 47
    iget-object v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    .line 48
    invoke-virtual {v6}, Landroid/widget/TextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    move-result-object v6

    .line 49
    aget-object v5, v6, v5

    iget-object v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->endDummyDrawable:Landroid/graphics/drawable/Drawable;

    if-ne v5, v7, :cond_11

    .line 50
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    aget-object v1, v6, v1

    aget-object v5, v6, v2

    iget-object v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->originalEditTextEndDrawable:Landroid/graphics/drawable/Drawable;

    aget-object v4, v6, v4

    .line 51
    invoke-virtual {v0, v1, v5, v7, v4}, Landroid/widget/TextView;->setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_5

    :cond_11
    move v2, v0

    .line 52
    :goto_5
    iput-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->endDummyDrawable:Landroid/graphics/drawable/Drawable;

    :goto_6
    move v0, v2

    :cond_12
    return v0
.end method

.method public updateEditTextBackground()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-eqz v0, :cond_5

    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundMode:I

    if-eqz v1, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    invoke-virtual {v0}, Landroid/widget/EditText;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    .line 3
    :cond_1
    invoke-static {v0}, Landroidx/appcompat/widget/DrawableUtils;->canSafelyMutateDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 4
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 5
    :cond_2
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->indicatorViewController:Lcom/google/android/material/textfield/IndicatorViewController;

    invoke-virtual {v1}, Lcom/google/android/material/textfield/IndicatorViewController;->errorShouldBeShown()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 6
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->indicatorViewController:Lcom/google/android/material/textfield/IndicatorViewController;

    .line 7
    invoke-virtual {p0}, Lcom/google/android/material/textfield/IndicatorViewController;->getErrorViewCurrentTextColor()I

    move-result p0

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 8
    invoke-static {p0, v1}, Landroidx/appcompat/widget/AppCompatDrawableManager;->getPorterDuffColorFilter(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    goto :goto_0

    .line 10
    :cond_3
    iget-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterOverflowed:Z

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterView:Landroid/widget/TextView;

    if-eqz v1, :cond_4

    .line 11
    invoke-virtual {v1}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result p0

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 12
    invoke-static {p0, v1}, Landroidx/appcompat/widget/AppCompatDrawableManager;->getPorterDuffColorFilter(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object p0

    .line 13
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    goto :goto_0

    .line 14
    :cond_4
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    .line 15
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    invoke-virtual {p0}, Landroid/widget/EditText;->refreshDrawableState()V

    :cond_5
    :goto_0
    return-void
.end method

.method public final updateInputLayoutMargins()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundMode:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->inputFrame:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->calculateLabelMarginTop()I

    move-result v1

    .line 4
    iget v2, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    if-eq v1, v2, :cond_0

    .line 5
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 6
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->inputFrame:Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->requestLayout()V

    :cond_0
    return-void
.end method

.method public final updateLabelState(ZZ)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isEnabled()Z

    move-result v0

    .line 2
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    move v1, v3

    goto :goto_0

    :cond_0
    move v1, v2

    .line 3
    :goto_0
    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-eqz v4, :cond_1

    invoke-virtual {v4}, Landroid/widget/EditText;->hasFocus()Z

    move-result v4

    if-eqz v4, :cond_1

    move v4, v3

    goto :goto_1

    :cond_1
    move v4, v2

    .line 4
    :goto_1
    iget-object v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->indicatorViewController:Lcom/google/android/material/textfield/IndicatorViewController;

    invoke-virtual {v5}, Lcom/google/android/material/textfield/IndicatorViewController;->errorShouldBeShown()Z

    move-result v5

    .line 5
    iget-object v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->defaultHintTextColor:Landroid/content/res/ColorStateList;

    if-eqz v6, :cond_3

    .line 6
    iget-object v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    .line 7
    iget-object v8, v7, Lcom/google/android/material/internal/CollapsingTextHelper;->collapsedTextColor:Landroid/content/res/ColorStateList;

    if-eq v8, v6, :cond_2

    .line 8
    iput-object v6, v7, Lcom/google/android/material/internal/CollapsingTextHelper;->collapsedTextColor:Landroid/content/res/ColorStateList;

    .line 9
    invoke-virtual {v7, v2}, Lcom/google/android/material/internal/CollapsingTextHelper;->recalculate(Z)V

    .line 10
    :cond_2
    iget-object v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    iget-object v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->defaultHintTextColor:Landroid/content/res/ColorStateList;

    .line 11
    iget-object v8, v6, Lcom/google/android/material/internal/CollapsingTextHelper;->expandedTextColor:Landroid/content/res/ColorStateList;

    if-eq v8, v7, :cond_3

    .line 12
    iput-object v7, v6, Lcom/google/android/material/internal/CollapsingTextHelper;->expandedTextColor:Landroid/content/res/ColorStateList;

    .line 13
    invoke-virtual {v6, v2}, Lcom/google/android/material/internal/CollapsingTextHelper;->recalculate(Z)V

    :cond_3
    const/4 v6, 0x0

    if-nez v0, :cond_5

    .line 14
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->defaultHintTextColor:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_4

    new-array v5, v3, [I

    const v7, -0x101009e

    aput v7, v5, v2

    iget v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->disabledColor:I

    .line 15
    invoke-virtual {v0, v5, v7}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    goto :goto_2

    :cond_4
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->disabledColor:I

    .line 16
    :goto_2
    iget-object v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v7

    invoke-virtual {v5, v7}, Lcom/google/android/material/internal/CollapsingTextHelper;->setCollapsedTextColor(Landroid/content/res/ColorStateList;)V

    .line 17
    iget-object v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    .line 18
    iget-object v7, v5, Lcom/google/android/material/internal/CollapsingTextHelper;->expandedTextColor:Landroid/content/res/ColorStateList;

    if-eq v7, v0, :cond_9

    .line 19
    iput-object v0, v5, Lcom/google/android/material/internal/CollapsingTextHelper;->expandedTextColor:Landroid/content/res/ColorStateList;

    .line 20
    invoke-virtual {v5, v2}, Lcom/google/android/material/internal/CollapsingTextHelper;->recalculate(Z)V

    goto :goto_4

    :cond_5
    if-eqz v5, :cond_7

    .line 21
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    iget-object v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->indicatorViewController:Lcom/google/android/material/textfield/IndicatorViewController;

    .line 22
    iget-object v5, v5, Lcom/google/android/material/textfield/IndicatorViewController;->errorView:Landroid/widget/TextView;

    if-eqz v5, :cond_6

    invoke-virtual {v5}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v5

    goto :goto_3

    :cond_6
    move-object v5, v6

    .line 23
    :goto_3
    invoke-virtual {v0, v5}, Lcom/google/android/material/internal/CollapsingTextHelper;->setCollapsedTextColor(Landroid/content/res/ColorStateList;)V

    goto :goto_4

    .line 24
    :cond_7
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterOverflowed:Z

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterView:Landroid/widget/TextView;

    if-eqz v0, :cond_8

    .line 25
    iget-object v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    invoke-virtual {v0}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v5, v0}, Lcom/google/android/material/internal/CollapsingTextHelper;->setCollapsedTextColor(Landroid/content/res/ColorStateList;)V

    goto :goto_4

    :cond_8
    if-eqz v4, :cond_9

    .line 26
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->focusedTextColor:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_9

    .line 27
    iget-object v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    .line 28
    iget-object v7, v5, Lcom/google/android/material/internal/CollapsingTextHelper;->collapsedTextColor:Landroid/content/res/ColorStateList;

    if-eq v7, v0, :cond_9

    .line 29
    iput-object v0, v5, Lcom/google/android/material/internal/CollapsingTextHelper;->collapsedTextColor:Landroid/content/res/ColorStateList;

    .line 30
    invoke-virtual {v5, v2}, Lcom/google/android/material/internal/CollapsingTextHelper;->recalculate(Z)V

    :cond_9
    :goto_4
    if-nez v1, :cond_10

    .line 31
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->expandedHintEnabled:Z

    if-eqz v0, :cond_10

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_a

    if-eqz v4, :cond_a

    goto :goto_6

    :cond_a
    if-nez p2, :cond_b

    .line 32
    iget-boolean p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->hintExpanded:Z

    if-nez p2, :cond_16

    .line 33
    :cond_b
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->animator:Landroid/animation/ValueAnimator;

    if-eqz p2, :cond_c

    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result p2

    if-eqz p2, :cond_c

    .line 34
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->animator:Landroid/animation/ValueAnimator;

    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_c
    const/4 p2, 0x0

    if-eqz p1, :cond_d

    .line 35
    iget-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->hintAnimationEnabled:Z

    if-eqz p1, :cond_d

    .line 36
    invoke-virtual {p0, p2}, Lcom/google/android/material/textfield/TextInputLayout;->animateToExpansionFraction(F)V

    goto :goto_5

    .line 37
    :cond_d
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    invoke-virtual {p1, p2}, Lcom/google/android/material/internal/CollapsingTextHelper;->setExpansionFraction(F)V

    .line 38
    :goto_5
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->cutoutEnabled()Z

    move-result p1

    if-eqz p1, :cond_e

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackground:Lcom/google/android/material/shape/MaterialShapeDrawable;

    check-cast p1, Lcom/google/android/material/textfield/CutoutDrawable;

    .line 39
    iget-object p1, p1, Lcom/google/android/material/textfield/CutoutDrawable;->cutoutBounds:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/RectF;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v3

    if-eqz p1, :cond_e

    .line 40
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->cutoutEnabled()Z

    move-result p1

    if-eqz p1, :cond_e

    .line 41
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackground:Lcom/google/android/material/shape/MaterialShapeDrawable;

    check-cast p1, Lcom/google/android/material/textfield/CutoutDrawable;

    .line 42
    invoke-virtual {p1, p2, p2, p2, p2}, Lcom/google/android/material/textfield/CutoutDrawable;->setCutout(FFFF)V

    .line 43
    :cond_e
    iput-boolean v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->hintExpanded:Z

    .line 44
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderTextView:Landroid/widget/TextView;

    if-eqz p1, :cond_f

    iget-boolean p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderEnabled:Z

    if-eqz p2, :cond_f

    .line 45
    invoke-virtual {p1, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderTextView:Landroid/widget/TextView;

    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 47
    :cond_f
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->updatePrefixTextVisibility()V

    .line 48
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateSuffixTextVisibility()V

    goto :goto_9

    :cond_10
    :goto_6
    if-nez p2, :cond_11

    .line 49
    iget-boolean p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->hintExpanded:Z

    if-eqz p2, :cond_16

    .line 50
    :cond_11
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->animator:Landroid/animation/ValueAnimator;

    if-eqz p2, :cond_12

    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result p2

    if-eqz p2, :cond_12

    .line 51
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->animator:Landroid/animation/ValueAnimator;

    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_12
    const/high16 p2, 0x3f800000    # 1.0f

    if-eqz p1, :cond_13

    .line 52
    iget-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->hintAnimationEnabled:Z

    if-eqz p1, :cond_13

    .line 53
    invoke-virtual {p0, p2}, Lcom/google/android/material/textfield/TextInputLayout;->animateToExpansionFraction(F)V

    goto :goto_7

    .line 54
    :cond_13
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    invoke-virtual {p1, p2}, Lcom/google/android/material/internal/CollapsingTextHelper;->setExpansionFraction(F)V

    .line 55
    :goto_7
    iput-boolean v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->hintExpanded:Z

    .line 56
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->cutoutEnabled()Z

    move-result p1

    if-eqz p1, :cond_14

    .line 57
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->openCutout()V

    .line 58
    :cond_14
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-nez p1, :cond_15

    goto :goto_8

    :cond_15
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v2

    :goto_8
    invoke-virtual {p0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->updatePlaceholderText(I)V

    .line 59
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->updatePrefixTextVisibility()V

    .line 60
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateSuffixTextVisibility()V

    :cond_16
    :goto_9
    return-void
.end method

.method public final updatePlaceholderText(I)V
    .locals 1

    if-nez p1, :cond_0

    .line 1
    iget-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->hintExpanded:Z

    if-nez p1, :cond_0

    .line 2
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderTextView:Landroid/widget/TextView;

    if-eqz p1, :cond_1

    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderEnabled:Z

    if-eqz v0, :cond_1

    .line 3
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderText:Ljava/lang/CharSequence;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderTextView:Landroid/widget/TextView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 5
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/widget/TextView;->bringToFront()V

    goto :goto_0

    .line 6
    :cond_0
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderTextView:Landroid/widget/TextView;

    if-eqz p1, :cond_1

    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderEnabled:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->placeholderTextView:Landroid/widget/TextView;

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_1
    :goto_0
    return-void
.end method

.method public final updatePrefixTextViewPadding()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-nez v0, :cond_0

    return-void

    .line 2
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->startIconView:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    move v0, v1

    :goto_0
    if-eqz v0, :cond_2

    goto :goto_1

    .line 3
    :cond_2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    sget-object v1, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 4
    invoke-virtual {v0}, Landroid/view/View;->getPaddingStart()I

    move-result v1

    .line 5
    :goto_1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->prefixTextView:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    .line 6
    invoke-virtual {v2}, Landroid/widget/EditText;->getCompoundPaddingTop()I

    move-result v2

    .line 7
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v3

    .line 8
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f07013d

    .line 9
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    .line 10
    invoke-virtual {p0}, Landroid/widget/EditText;->getCompoundPaddingBottom()I

    move-result p0

    .line 11
    sget-object v4, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 12
    invoke-virtual {v0, v1, v2, v3, p0}, Landroid/view/View;->setPaddingRelative(IIII)V

    return-void
.end method

.method public final updatePrefixTextVisibility()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->prefixTextView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->prefixText:Ljava/lang/CharSequence;

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->isHintExpanded()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/16 v1, 0x8

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateDummyDrawables()Z

    return-void
.end method

.method public final updateStrokeErrorColor(ZZ)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->strokeErrorColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    .line 2
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->strokeErrorColor:Landroid/content/res/ColorStateList;

    const/4 v2, 0x2

    new-array v3, v2, [I

    fill-array-data v3, :array_0

    .line 3
    invoke-virtual {v1, v3, v0}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v1

    .line 4
    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->strokeErrorColor:Landroid/content/res/ColorStateList;

    new-array v2, v2, [I

    fill-array-data v2, :array_1

    .line 5
    invoke-virtual {v3, v2, v0}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v2

    if-eqz p1, :cond_0

    .line 6
    iput v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeColor:I

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_1

    .line 7
    iput v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeColor:I

    goto :goto_0

    .line 8
    :cond_1
    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeColor:I

    :goto_0
    return-void

    :array_0
    .array-data 4
        0x1010367
        0x101009e
    .end array-data

    :array_1
    .array-data 4
        0x10102fe
        0x101009e
    .end array-data
.end method

.method public final updateSuffixTextViewPadding()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-nez v0, :cond_0

    return-void

    .line 2
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->isEndIconVisible()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_3

    .line 3
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->errorIconView:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    move v0, v1

    :goto_0
    if-eqz v0, :cond_2

    goto :goto_1

    .line 4
    :cond_2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    sget-object v1, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getPaddingEnd()I

    move-result v1

    .line 6
    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->suffixTextView:Landroid/widget/TextView;

    .line 7
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 8
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f07013d

    .line 9
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    .line 10
    invoke-virtual {v3}, Landroid/widget/EditText;->getPaddingTop()I

    move-result v3

    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    .line 11
    invoke-virtual {p0}, Landroid/widget/EditText;->getPaddingBottom()I

    move-result p0

    .line 12
    sget-object v4, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 13
    invoke-virtual {v0, v2, v3, v1, p0}, Landroid/view/View;->setPaddingRelative(IIII)V

    return-void
.end method

.method public final updateSuffixTextVisibility()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->suffixTextView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    .line 2
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->suffixText:Ljava/lang/CharSequence;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->isHintExpanded()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    move v1, v2

    .line 3
    :goto_0
    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->suffixTextView:Landroid/widget/TextView;

    if-eqz v1, :cond_1

    goto :goto_1

    :cond_1
    const/16 v2, 0x8

    :goto_1
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 4
    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->suffixTextView:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getVisibility()I

    move-result v2

    if-eq v0, v2, :cond_2

    .line 5
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getEndIconDelegate()Lcom/google/android/material/textfield/EndIconDelegate;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/EndIconDelegate;->onSuffixVisibilityChanged(Z)V

    .line 6
    :cond_2
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->updateDummyDrawables()Z

    return-void
.end method

.method public updateTextInputBoxState()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackground:Lcom/google/android/material/shape/MaterialShapeDrawable;

    if-eqz v0, :cond_1f

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundMode:I

    if-nez v0, :cond_0

    goto/16 :goto_c

    .line 2
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isFocused()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/widget/EditText;->hasFocus()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_1

    :cond_2
    :goto_0
    move v0, v2

    .line 3
    :goto_1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isHovered()Z

    move-result v3

    if-nez v3, :cond_4

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-eqz v3, :cond_3

    invoke-virtual {v3}, Landroid/widget/EditText;->isHovered()Z

    move-result v3

    if-eqz v3, :cond_3

    goto :goto_2

    :cond_3
    move v3, v1

    goto :goto_3

    :cond_4
    :goto_2
    move v3, v2

    .line 4
    :goto_3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isEnabled()Z

    move-result v4

    if-nez v4, :cond_5

    .line 5
    iget v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->disabledColor:I

    iput v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeColor:I

    goto :goto_4

    .line 6
    :cond_5
    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->indicatorViewController:Lcom/google/android/material/textfield/IndicatorViewController;

    invoke-virtual {v4}, Lcom/google/android/material/textfield/IndicatorViewController;->errorShouldBeShown()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 7
    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->strokeErrorColor:Landroid/content/res/ColorStateList;

    if-eqz v4, :cond_6

    .line 8
    invoke-virtual {p0, v0, v3}, Lcom/google/android/material/textfield/TextInputLayout;->updateStrokeErrorColor(ZZ)V

    goto :goto_4

    .line 9
    :cond_6
    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->indicatorViewController:Lcom/google/android/material/textfield/IndicatorViewController;

    invoke-virtual {v4}, Lcom/google/android/material/textfield/IndicatorViewController;->getErrorViewCurrentTextColor()I

    move-result v4

    iput v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeColor:I

    goto :goto_4

    .line 10
    :cond_7
    iget-boolean v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterOverflowed:Z

    if-eqz v4, :cond_9

    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->counterView:Landroid/widget/TextView;

    if-eqz v4, :cond_9

    .line 11
    iget-object v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->strokeErrorColor:Landroid/content/res/ColorStateList;

    if-eqz v5, :cond_8

    .line 12
    invoke-virtual {p0, v0, v3}, Lcom/google/android/material/textfield/TextInputLayout;->updateStrokeErrorColor(ZZ)V

    goto :goto_4

    .line 13
    :cond_8
    invoke-virtual {v4}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v4

    iput v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeColor:I

    goto :goto_4

    :cond_9
    if-eqz v0, :cond_a

    .line 14
    iget v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->focusedStrokeColor:I

    iput v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeColor:I

    goto :goto_4

    :cond_a
    if-eqz v3, :cond_b

    .line 15
    iget v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->hoveredStrokeColor:I

    iput v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeColor:I

    goto :goto_4

    .line 16
    :cond_b
    iget v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->defaultStrokeColor:I

    iput v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeColor:I

    .line 17
    :goto_4
    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->errorIconView:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v4}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    if-eqz v4, :cond_c

    .line 18
    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->indicatorViewController:Lcom/google/android/material/textfield/IndicatorViewController;

    .line 19
    iget-boolean v5, v4, Lcom/google/android/material/textfield/IndicatorViewController;->errorEnabled:Z

    if-eqz v5, :cond_c

    .line 20
    invoke-virtual {v4}, Lcom/google/android/material/textfield/IndicatorViewController;->errorShouldBeShown()Z

    move-result v4

    if-eqz v4, :cond_c

    move v4, v2

    goto :goto_5

    :cond_c
    move v4, v1

    .line 21
    :goto_5
    invoke-virtual {p0, v4}, Lcom/google/android/material/textfield/TextInputLayout;->setErrorIconVisible(Z)V

    .line 22
    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->errorIconView:Lcom/google/android/material/internal/CheckableImageButton;

    iget-object v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->errorIconTintList:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v4, v5}, Lcom/google/android/material/textfield/TextInputLayout;->refreshIconDrawableState(Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;)V

    .line 23
    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->startIconView:Lcom/google/android/material/internal/CheckableImageButton;

    iget-object v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->startIconTintList:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v4, v5}, Lcom/google/android/material/textfield/TextInputLayout;->refreshIconDrawableState(Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;)V

    .line 24
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->refreshEndIconDrawableState()V

    .line 25
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getEndIconDelegate()Lcom/google/android/material/textfield/EndIconDelegate;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    instance-of v4, v4, Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;

    if-eqz v4, :cond_e

    .line 27
    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->indicatorViewController:Lcom/google/android/material/textfield/IndicatorViewController;

    invoke-virtual {v4}, Lcom/google/android/material/textfield/IndicatorViewController;->errorShouldBeShown()Z

    move-result v4

    if-eqz v4, :cond_d

    .line 28
    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconView:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v4}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    if-eqz v4, :cond_d

    .line 29
    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconView:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v4}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    .line 30
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    .line 31
    iget-object v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->indicatorViewController:Lcom/google/android/material/textfield/IndicatorViewController;

    .line 32
    invoke-virtual {v5}, Lcom/google/android/material/textfield/IndicatorViewController;->getErrorViewCurrentTextColor()I

    move-result v5

    .line 33
    invoke-virtual {v4, v5}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 34
    iget-object v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconView:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v5, v4}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_6

    .line 35
    :cond_d
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->applyEndIconTint()V

    :cond_e
    :goto_6
    if-eqz v0, :cond_f

    .line 36
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isEnabled()Z

    move-result v4

    if-eqz v4, :cond_f

    .line 37
    iget v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeWidthFocusedPx:I

    iput v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeWidthPx:I

    goto :goto_7

    .line 38
    :cond_f
    iget v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeWidthDefaultPx:I

    iput v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeWidthPx:I

    .line 39
    :goto_7
    iget v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundMode:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_11

    .line 40
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->cutoutEnabled()Z

    move-result v4

    if-eqz v4, :cond_11

    iget-boolean v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->hintExpanded:Z

    if-nez v4, :cond_11

    iget v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxLabelCutoutHeight:I

    iget v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeWidthPx:I

    if-eq v4, v6, :cond_11

    .line 41
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->cutoutEnabled()Z

    move-result v4

    if-eqz v4, :cond_10

    .line 42
    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackground:Lcom/google/android/material/shape/MaterialShapeDrawable;

    check-cast v4, Lcom/google/android/material/textfield/CutoutDrawable;

    const/4 v6, 0x0

    .line 43
    invoke-virtual {v4, v6, v6, v6, v6}, Lcom/google/android/material/textfield/CutoutDrawable;->setCutout(FFFF)V

    .line 44
    :cond_10
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->openCutout()V

    .line 45
    :cond_11
    iget v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundMode:I

    if-ne v4, v2, :cond_15

    .line 46
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isEnabled()Z

    move-result v4

    if-nez v4, :cond_12

    .line 47
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->disabledFilledBackgroundColor:I

    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundColor:I

    goto :goto_8

    :cond_12
    if-eqz v3, :cond_13

    if-nez v0, :cond_13

    .line 48
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->hoveredFilledBackgroundColor:I

    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundColor:I

    goto :goto_8

    :cond_13
    if-eqz v0, :cond_14

    .line 49
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->focusedFilledBackgroundColor:I

    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundColor:I

    goto :goto_8

    .line 50
    :cond_14
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->defaultFilledBackgroundColor:I

    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundColor:I

    .line 51
    :cond_15
    :goto_8
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackground:Lcom/google/android/material/shape/MaterialShapeDrawable;

    if-nez v0, :cond_16

    goto/16 :goto_c

    .line 52
    :cond_16
    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->shapeAppearanceModel:Lcom/google/android/material/shape/ShapeAppearanceModel;

    invoke-virtual {v0, v3}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setShapeAppearanceModel(Lcom/google/android/material/shape/ShapeAppearanceModel;)V

    .line 53
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundMode:I

    const/4 v3, -0x1

    if-ne v0, v5, :cond_18

    .line 54
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeWidthPx:I

    if-le v0, v3, :cond_17

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeColor:I

    if-eqz v0, :cond_17

    move v0, v2

    goto :goto_9

    :cond_17
    move v0, v1

    :goto_9
    if-eqz v0, :cond_18

    move v0, v2

    goto :goto_a

    :cond_18
    move v0, v1

    :goto_a
    if-eqz v0, :cond_19

    .line 55
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackground:Lcom/google/android/material/shape/MaterialShapeDrawable;

    iget v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeWidthPx:I

    int-to-float v4, v4

    iget v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeColor:I

    invoke-virtual {v0, v4, v5}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setStroke(FI)V

    .line 56
    :cond_19
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundColor:I

    .line 57
    iget v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundMode:I

    if-ne v4, v2, :cond_1a

    const v0, 0x7f0400d5

    .line 58
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4, v0, v1}, Lcom/android/wallpaper/util/SizeCalculator;->getColor(Landroid/content/Context;II)I

    move-result v0

    .line 59
    iget v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundColor:I

    .line 60
    invoke-static {v4, v0}, Landroidx/core/graphics/ColorUtils;->compositeColors(II)I

    move-result v0

    .line 61
    :cond_1a
    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundColor:I

    .line 62
    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxBackground:Lcom/google/android/material/shape/MaterialShapeDrawable;

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v4, v0}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setFillColor(Landroid/content/res/ColorStateList;)V

    .line 63
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->endIconMode:I

    const/4 v4, 0x3

    if-ne v0, v4, :cond_1b

    .line 64
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 65
    :cond_1b
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxUnderline:Lcom/google/android/material/shape/MaterialShapeDrawable;

    if-nez v0, :cond_1c

    goto :goto_b

    .line 66
    :cond_1c
    iget v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeWidthPx:I

    if-le v4, v3, :cond_1d

    iget v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeColor:I

    if-eqz v3, :cond_1d

    move v1, v2

    :cond_1d
    if-eqz v1, :cond_1e

    .line 67
    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->boxStrokeColor:I

    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setFillColor(Landroid/content/res/ColorStateList;)V

    .line 68
    :cond_1e
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->invalidate()V

    .line 69
    :goto_b
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->invalidate()V

    :cond_1f
    :goto_c
    return-void
.end method
