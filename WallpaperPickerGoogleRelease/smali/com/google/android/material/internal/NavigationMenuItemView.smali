.class public Lcom/google/android/material/internal/NavigationMenuItemView;
.super Lcom/google/android/material/internal/ForegroundLinearLayout;
.source "SourceFile"

# interfaces
.implements Landroidx/appcompat/view/menu/MenuView$ItemView;


# static fields
.field public static final CHECKED_STATE_SET:[I


# instance fields
.field public final accessibilityDelegate:Landroidx/core/view/AccessibilityDelegateCompat;

.field public actionArea:Landroid/widget/FrameLayout;

.field public checkable:Z

.field public iconSize:I

.field public itemData:Landroidx/appcompat/view/menu/MenuItemImpl;

.field public final textView:Landroid/widget/CheckedTextView;


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x10100a0

    aput v2, v0, v1

    .line 1
    sput-object v0, Lcom/google/android/material/internal/NavigationMenuItemView;->CHECKED_STATE_SET:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/internal/NavigationMenuItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/internal/NavigationMenuItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 3
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/material/internal/ForegroundLinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    new-instance p2, Lcom/google/android/material/internal/NavigationMenuItemView$1;

    invoke-direct {p2, p0}, Lcom/google/android/material/internal/NavigationMenuItemView$1;-><init>(Lcom/google/android/material/internal/NavigationMenuItemView;)V

    iput-object p2, p0, Lcom/google/android/material/internal/NavigationMenuItemView;->accessibilityDelegate:Landroidx/core/view/AccessibilityDelegateCompat;

    .line 5
    iget p3, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mOrientation:I

    if-eqz p3, :cond_0

    const/4 p3, 0x0

    .line 6
    iput p3, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mOrientation:I

    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestLayout()V

    .line 8
    :cond_0
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p3

    const v0, 0x7f0d0051

    const/4 v1, 0x1

    invoke-virtual {p3, v0, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p3, 0x7f0700d3

    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    .line 10
    iput p1, p0, Lcom/google/android/material/internal/NavigationMenuItemView;->iconSize:I

    const p1, 0x7f0a00d0

    .line 11
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckedTextView;

    iput-object p1, p0, Lcom/google/android/material/internal/NavigationMenuItemView;->textView:Landroid/widget/CheckedTextView;

    .line 12
    invoke-virtual {p1, v1}, Landroid/widget/CheckedTextView;->setDuplicateParentStateEnabled(Z)V

    .line 13
    invoke-static {p1, p2}, Landroidx/core/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroidx/core/view/AccessibilityDelegateCompat;)V

    return-void
.end method


# virtual methods
.method public getItemData()Landroidx/appcompat/view/menu/MenuItemImpl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/internal/NavigationMenuItemView;->itemData:Landroidx/appcompat/view/menu/MenuItemImpl;

    return-object p0
.end method

.method public initialize(Landroidx/appcompat/view/menu/MenuItemImpl;I)V
    .locals 7

    .line 1
    iput-object p1, p0, Lcom/google/android/material/internal/NavigationMenuItemView;->itemData:Landroidx/appcompat/view/menu/MenuItemImpl;

    .line 2
    iget p2, p1, Landroidx/appcompat/view/menu/MenuItemImpl;->mId:I

    if-lez p2, :cond_0

    .line 3
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->setId(I)V

    .line 4
    :cond_0
    invoke-virtual {p1}, Landroidx/appcompat/view/menu/MenuItemImpl;->isVisible()Z

    move-result p2

    const/16 v0, 0x8

    const/4 v1, 0x0

    if-eqz p2, :cond_1

    move p2, v1

    goto :goto_0

    :cond_1
    move p2, v0

    :goto_0
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p2

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez p2, :cond_3

    .line 6
    new-instance p2, Landroid/util/TypedValue;

    invoke-direct {p2}, Landroid/util/TypedValue;-><init>()V

    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v4

    .line 8
    invoke-virtual {v4}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v4

    const v5, 0x7f0400c5

    .line 9
    invoke-virtual {v4, v5, p2, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 10
    new-instance v4, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v4}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 11
    sget-object v5, Lcom/google/android/material/internal/NavigationMenuItemView;->CHECKED_STATE_SET:[I

    new-instance v6, Landroid/graphics/drawable/ColorDrawable;

    iget p2, p2, Landroid/util/TypedValue;->data:I

    invoke-direct {v6, p2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v4, v5, v6}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 12
    sget-object p2, Landroid/view/ViewGroup;->EMPTY_STATE_SET:[I

    new-instance v5, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v5, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v4, p2, v5}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    goto :goto_1

    :cond_2
    move-object v4, v3

    .line 13
    :goto_1
    sget-object p2, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 14
    invoke-virtual {p0, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 15
    :cond_3
    invoke-virtual {p1}, Landroidx/appcompat/view/menu/MenuItemImpl;->isCheckable()Z

    move-result p2

    .line 16
    invoke-virtual {p0}, Landroid/view/ViewGroup;->refreshDrawableState()V

    .line 17
    iget-boolean v4, p0, Lcom/google/android/material/internal/NavigationMenuItemView;->checkable:Z

    if-eq v4, p2, :cond_4

    .line 18
    iput-boolean p2, p0, Lcom/google/android/material/internal/NavigationMenuItemView;->checkable:Z

    .line 19
    iget-object p2, p0, Lcom/google/android/material/internal/NavigationMenuItemView;->accessibilityDelegate:Landroidx/core/view/AccessibilityDelegateCompat;

    iget-object v4, p0, Lcom/google/android/material/internal/NavigationMenuItemView;->textView:Landroid/widget/CheckedTextView;

    const/16 v5, 0x800

    invoke-virtual {p2, v4, v5}, Landroidx/core/view/AccessibilityDelegateCompat;->sendAccessibilityEvent(Landroid/view/View;I)V

    .line 20
    :cond_4
    invoke-virtual {p1}, Landroidx/appcompat/view/menu/MenuItemImpl;->isChecked()Z

    move-result p2

    .line 21
    invoke-virtual {p0}, Landroid/view/ViewGroup;->refreshDrawableState()V

    .line 22
    iget-object v4, p0, Lcom/google/android/material/internal/NavigationMenuItemView;->textView:Landroid/widget/CheckedTextView;

    invoke-virtual {v4, p2}, Landroid/widget/CheckedTextView;->setChecked(Z)V

    .line 23
    invoke-virtual {p1}, Landroidx/appcompat/view/menu/MenuItemImpl;->isEnabled()Z

    move-result p2

    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->setEnabled(Z)V

    .line 24
    iget-object p2, p1, Landroidx/appcompat/view/menu/MenuItemImpl;->mTitle:Ljava/lang/CharSequence;

    .line 25
    iget-object v4, p0, Lcom/google/android/material/internal/NavigationMenuItemView;->textView:Landroid/widget/CheckedTextView;

    invoke-virtual {v4, p2}, Landroid/widget/CheckedTextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    invoke-virtual {p1}, Landroidx/appcompat/view/menu/MenuItemImpl;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object p2

    if-eqz p2, :cond_5

    .line 27
    iget v4, p0, Lcom/google/android/material/internal/NavigationMenuItemView;->iconSize:I

    invoke-virtual {p2, v1, v1, v4, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 28
    :cond_5
    iget-object v4, p0, Lcom/google/android/material/internal/NavigationMenuItemView;->textView:Landroid/widget/CheckedTextView;

    .line 29
    invoke-virtual {v4, p2, v3, v3, v3}, Landroid/widget/TextView;->setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 30
    invoke-virtual {p1}, Landroidx/appcompat/view/menu/MenuItemImpl;->getActionView()Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_7

    .line 31
    iget-object v3, p0, Lcom/google/android/material/internal/NavigationMenuItemView;->actionArea:Landroid/widget/FrameLayout;

    if-nez v3, :cond_6

    const v3, 0x7f0a00cf

    .line 32
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewStub;

    invoke-virtual {v3}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/FrameLayout;

    iput-object v3, p0, Lcom/google/android/material/internal/NavigationMenuItemView;->actionArea:Landroid/widget/FrameLayout;

    .line 33
    :cond_6
    iget-object v3, p0, Lcom/google/android/material/internal/NavigationMenuItemView;->actionArea:Landroid/widget/FrameLayout;

    invoke-virtual {v3}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 34
    iget-object v3, p0, Lcom/google/android/material/internal/NavigationMenuItemView;->actionArea:Landroid/widget/FrameLayout;

    invoke-virtual {v3, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 35
    :cond_7
    iget-object p2, p1, Landroidx/appcompat/view/menu/MenuItemImpl;->mContentDescription:Ljava/lang/CharSequence;

    .line 36
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 37
    iget-object p1, p1, Landroidx/appcompat/view/menu/MenuItemImpl;->mTooltipText:Ljava/lang/CharSequence;

    .line 38
    invoke-virtual {p0, p1}, Landroid/view/View;->setTooltipText(Ljava/lang/CharSequence;)V

    .line 39
    iget-object p1, p0, Lcom/google/android/material/internal/NavigationMenuItemView;->itemData:Landroidx/appcompat/view/menu/MenuItemImpl;

    .line 40
    iget-object p2, p1, Landroidx/appcompat/view/menu/MenuItemImpl;->mTitle:Ljava/lang/CharSequence;

    if-nez p2, :cond_8

    .line 41
    invoke-virtual {p1}, Landroidx/appcompat/view/menu/MenuItemImpl;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-nez p1, :cond_8

    iget-object p1, p0, Lcom/google/android/material/internal/NavigationMenuItemView;->itemData:Landroidx/appcompat/view/menu/MenuItemImpl;

    .line 42
    invoke-virtual {p1}, Landroidx/appcompat/view/menu/MenuItemImpl;->getActionView()Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_8

    goto :goto_2

    :cond_8
    move v2, v1

    :goto_2
    if-eqz v2, :cond_9

    .line 43
    iget-object p1, p0, Lcom/google/android/material/internal/NavigationMenuItemView;->textView:Landroid/widget/CheckedTextView;

    invoke-virtual {p1, v0}, Landroid/widget/CheckedTextView;->setVisibility(I)V

    .line 44
    iget-object p1, p0, Lcom/google/android/material/internal/NavigationMenuItemView;->actionArea:Landroid/widget/FrameLayout;

    if-eqz p1, :cond_a

    .line 45
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    const/4 p2, -0x1

    .line 46
    iput p2, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 47
    iget-object p0, p0, Lcom/google/android/material/internal/NavigationMenuItemView;->actionArea:Landroid/widget/FrameLayout;

    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_3

    .line 48
    :cond_9
    iget-object p1, p0, Lcom/google/android/material/internal/NavigationMenuItemView;->textView:Landroid/widget/CheckedTextView;

    invoke-virtual {p1, v1}, Landroid/widget/CheckedTextView;->setVisibility(I)V

    .line 49
    iget-object p1, p0, Lcom/google/android/material/internal/NavigationMenuItemView;->actionArea:Landroid/widget/FrameLayout;

    if-eqz p1, :cond_a

    .line 50
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    const/4 p2, -0x2

    .line 51
    iput p2, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 52
    iget-object p0, p0, Lcom/google/android/material/internal/NavigationMenuItemView;->actionArea:Landroid/widget/FrameLayout;

    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_a
    :goto_3
    return-void
.end method

.method public onCreateDrawableState(I)[I
    .locals 1

    add-int/lit8 p1, p1, 0x1

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onCreateDrawableState(I)[I

    move-result-object p1

    .line 2
    iget-object v0, p0, Lcom/google/android/material/internal/NavigationMenuItemView;->itemData:Landroidx/appcompat/view/menu/MenuItemImpl;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/appcompat/view/menu/MenuItemImpl;->isCheckable()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/android/material/internal/NavigationMenuItemView;->itemData:Landroidx/appcompat/view/menu/MenuItemImpl;

    invoke-virtual {p0}, Landroidx/appcompat/view/menu/MenuItemImpl;->isChecked()Z

    move-result p0

    if-eqz p0, :cond_0

    .line 3
    sget-object p0, Lcom/google/android/material/internal/NavigationMenuItemView;->CHECKED_STATE_SET:[I

    invoke-static {p1, p0}, Landroid/view/ViewGroup;->mergeDrawableStates([I[I)[I

    :cond_0
    return-object p1
.end method
