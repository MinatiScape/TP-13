.class public Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/material/textfield/TextInputLayout$OnEditTextAttachedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;


# direct methods
.method public constructor <init>(Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate$4;->this$0:Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEditTextAttached(Lcom/google/android/material/textfield/TextInputLayout;)V
    .locals 11

    .line 1
    iget-object v0, p1, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    .line 2
    invoke-static {v0}, Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;->access$000(Landroid/widget/EditText;)Landroid/widget/AutoCompleteTextView;

    move-result-object v0

    .line 3
    iget-object v1, p0, Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate$4;->this$0:Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;

    .line 4
    iget-object v2, v1, Lcom/google/android/material/textfield/EndIconDelegate;->textInputLayout:Lcom/google/android/material/textfield/TextInputLayout;

    .line 5
    iget v2, v2, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundMode:I

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-ne v2, v3, :cond_0

    .line 6
    iget-object v1, v1, Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;->outlinedPopupBackground:Lcom/google/android/material/shape/MaterialShapeDrawable;

    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->setDropDownBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    :cond_0
    if-ne v2, v4, :cond_1

    .line 7
    iget-object v1, v1, Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;->filledPopupBackground:Landroid/graphics/drawable/StateListDrawable;

    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->setDropDownBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 8
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate$4;->this$0:Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;

    .line 9
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    invoke-virtual {v0}, Landroid/widget/EditText;->getKeyListener()Landroid/text/method/KeyListener;

    move-result-object v2

    const/4 v5, 0x0

    if-eqz v2, :cond_2

    move v2, v4

    goto :goto_1

    :cond_2
    move v2, v5

    :goto_1
    if-eqz v2, :cond_3

    goto/16 :goto_3

    .line 11
    :cond_3
    iget-object v2, v1, Lcom/google/android/material/textfield/EndIconDelegate;->textInputLayout:Lcom/google/android/material/textfield/TextInputLayout;

    .line 12
    iget v6, v2, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundMode:I

    if-eq v6, v4, :cond_5

    if-ne v6, v3, :cond_4

    goto :goto_2

    .line 13
    :cond_4
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    throw p0

    .line 14
    :cond_5
    :goto_2
    iget-object v2, v2, Lcom/google/android/material/textfield/TextInputLayout;->boxBackground:Lcom/google/android/material/shape/MaterialShapeDrawable;

    const v7, 0x7f0400c5

    .line 15
    invoke-static {v0, v7}, Lcom/android/wallpaper/util/SizeCalculator;->getColor(Landroid/view/View;I)I

    move-result v7

    new-array v8, v3, [[I

    new-array v9, v4, [I

    const v10, 0x10100a7

    aput v10, v9, v5

    aput-object v9, v8, v5

    new-array v9, v5, [I

    aput-object v9, v8, v4

    const v9, 0x3dcccccd    # 0.1f

    if-ne v6, v3, :cond_6

    const v1, 0x7f0400d5

    .line 16
    invoke-static {v0, v1}, Lcom/android/wallpaper/util/SizeCalculator;->getColor(Landroid/view/View;I)I

    move-result v1

    .line 17
    new-instance v6, Lcom/google/android/material/shape/MaterialShapeDrawable;

    .line 18
    iget-object v10, v2, Lcom/google/android/material/shape/MaterialShapeDrawable;->drawableState:Lcom/google/android/material/shape/MaterialShapeDrawable$MaterialShapeDrawableState;

    iget-object v10, v10, Lcom/google/android/material/shape/MaterialShapeDrawable$MaterialShapeDrawableState;->shapeAppearanceModel:Lcom/google/android/material/shape/ShapeAppearanceModel;

    .line 19
    invoke-direct {v6, v10}, Lcom/google/android/material/shape/MaterialShapeDrawable;-><init>(Lcom/google/android/material/shape/ShapeAppearanceModel;)V

    .line 20
    invoke-static {v7, v1, v9}, Lcom/android/wallpaper/util/SizeCalculator;->layer(IIF)I

    move-result v7

    new-array v9, v3, [I

    aput v7, v9, v5

    aput v5, v9, v4

    .line 21
    new-instance v10, Landroid/content/res/ColorStateList;

    invoke-direct {v10, v8, v9}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    invoke-virtual {v6, v10}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setFillColor(Landroid/content/res/ColorStateList;)V

    .line 22
    invoke-virtual {v6, v1}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setTint(I)V

    new-array v9, v3, [I

    aput v7, v9, v5

    aput v1, v9, v4

    .line 23
    new-instance v1, Landroid/content/res/ColorStateList;

    invoke-direct {v1, v8, v9}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    .line 24
    new-instance v7, Lcom/google/android/material/shape/MaterialShapeDrawable;

    .line 25
    iget-object v8, v2, Lcom/google/android/material/shape/MaterialShapeDrawable;->drawableState:Lcom/google/android/material/shape/MaterialShapeDrawable$MaterialShapeDrawableState;

    iget-object v8, v8, Lcom/google/android/material/shape/MaterialShapeDrawable$MaterialShapeDrawableState;->shapeAppearanceModel:Lcom/google/android/material/shape/ShapeAppearanceModel;

    .line 26
    invoke-direct {v7, v8}, Lcom/google/android/material/shape/MaterialShapeDrawable;-><init>(Lcom/google/android/material/shape/ShapeAppearanceModel;)V

    const/4 v8, -0x1

    .line 27
    invoke-virtual {v7, v8}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setTint(I)V

    .line 28
    new-instance v8, Landroid/graphics/drawable/RippleDrawable;

    invoke-direct {v8, v1, v6, v7}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    new-array v1, v3, [Landroid/graphics/drawable/Drawable;

    aput-object v8, v1, v5

    aput-object v2, v1, v4

    .line 29
    new-instance v2, Landroid/graphics/drawable/LayerDrawable;

    invoke-direct {v2, v1}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 30
    sget-object v1, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 31
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_3

    :cond_6
    if-ne v6, v4, :cond_7

    .line 32
    iget-object v1, v1, Lcom/google/android/material/textfield/EndIconDelegate;->textInputLayout:Lcom/google/android/material/textfield/TextInputLayout;

    .line 33
    iget v1, v1, Lcom/google/android/material/textfield/TextInputLayout;->boxBackgroundColor:I

    .line 34
    invoke-static {v7, v1, v9}, Lcom/android/wallpaper/util/SizeCalculator;->layer(IIF)I

    move-result v6

    new-array v7, v3, [I

    aput v6, v7, v5

    aput v1, v7, v4

    .line 35
    new-instance v1, Landroid/content/res/ColorStateList;

    invoke-direct {v1, v8, v7}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    .line 36
    new-instance v6, Landroid/graphics/drawable/RippleDrawable;

    invoke-direct {v6, v1, v2, v2}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 37
    sget-object v1, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 38
    invoke-virtual {v0, v6}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 39
    :cond_7
    :goto_3
    iget-object v1, p0, Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate$4;->this$0:Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;

    .line 40
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    new-instance v2, Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate$7;

    invoke-direct {v2, v1, v0}, Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate$7;-><init>(Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;Landroid/widget/AutoCompleteTextView;)V

    invoke-virtual {v0, v2}, Landroid/widget/AutoCompleteTextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 42
    iget-object v2, v1, Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;->onFocusChangeListener:Landroid/view/View$OnFocusChangeListener;

    invoke-virtual {v0, v2}, Landroid/widget/AutoCompleteTextView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 43
    new-instance v2, Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate$8;

    invoke-direct {v2, v1}, Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate$8;-><init>(Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;)V

    invoke-virtual {v0, v2}, Landroid/widget/AutoCompleteTextView;->setOnDismissListener(Landroid/widget/AutoCompleteTextView$OnDismissListener;)V

    .line 44
    invoke-virtual {v0, v5}, Landroid/widget/AutoCompleteTextView;->setThreshold(I)V

    .line 45
    iget-object v1, p0, Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate$4;->this$0:Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;

    .line 46
    iget-object v1, v1, Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;->exposedDropdownEndIconTextWatcher:Landroid/text/TextWatcher;

    .line 47
    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 48
    iget-object v1, p0, Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate$4;->this$0:Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;

    .line 49
    iget-object v1, v1, Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;->exposedDropdownEndIconTextWatcher:Landroid/text/TextWatcher;

    .line 50
    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 51
    invoke-virtual {p1, v4}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconCheckable(Z)V

    const/4 v1, 0x0

    .line 52
    invoke-virtual {p1, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setErrorIconDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 53
    invoke-virtual {v0}, Landroid/widget/EditText;->getKeyListener()Landroid/text/method/KeyListener;

    move-result-object v0

    if-eqz v0, :cond_8

    move v5, v4

    :cond_8
    if-nez v5, :cond_9

    .line 54
    iget-object v0, p0, Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate$4;->this$0:Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;

    iget-object v0, v0, Lcom/google/android/material/textfield/EndIconDelegate;->endIconView:Lcom/google/android/material/internal/CheckableImageButton;

    sget-object v1, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 55
    invoke-virtual {v0, v3}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 56
    :cond_9
    iget-object p0, p0, Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate$4;->this$0:Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;

    .line 57
    iget-object p0, p0, Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;->accessibilityDelegate:Lcom/google/android/material/textfield/TextInputLayout$AccessibilityDelegate;

    .line 58
    iget-object v0, p1, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-eqz v0, :cond_a

    .line 59
    invoke-static {v0, p0}, Landroidx/core/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroidx/core/view/AccessibilityDelegateCompat;)V

    .line 60
    :cond_a
    invoke-virtual {p1, v4}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconVisible(Z)V

    return-void
.end method
