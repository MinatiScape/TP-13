.class public Lcom/google/android/material/chip/ChipGroup;
.super Lcom/google/android/material/internal/FlowLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/chip/ChipGroup$PassThroughHierarchyChangeListener;,
        Lcom/google/android/material/chip/ChipGroup$CheckedStateTracker;,
        Lcom/google/android/material/chip/ChipGroup$LayoutParams;
    }
.end annotation


# instance fields
.field public checkedId:I

.field public final checkedStateTracker:Lcom/google/android/material/chip/ChipGroup$CheckedStateTracker;

.field public chipSpacingHorizontal:I

.field public chipSpacingVertical:I

.field public passThroughListener:Lcom/google/android/material/chip/ChipGroup$PassThroughHierarchyChangeListener;

.field public protectFromCheckedChange:Z

.field public selectionRequired:Z

.field public singleSelection:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/chip/ChipGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const v0, 0x7f040099

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/chip/ChipGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 7

    const v0, 0x7f1202da

    .line 3
    invoke-static {p1, p2, p3, v0}, Lcom/google/android/material/theme/overlay/MaterialThemeOverlay;->wrap(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/material/internal/FlowLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    new-instance p1, Lcom/google/android/material/chip/ChipGroup$CheckedStateTracker;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/google/android/material/chip/ChipGroup$CheckedStateTracker;-><init>(Lcom/google/android/material/chip/ChipGroup;Lcom/google/android/material/chip/ChipGroup$1;)V

    iput-object p1, p0, Lcom/google/android/material/chip/ChipGroup;->checkedStateTracker:Lcom/google/android/material/chip/ChipGroup$CheckedStateTracker;

    .line 5
    new-instance p1, Lcom/google/android/material/chip/ChipGroup$PassThroughHierarchyChangeListener;

    invoke-direct {p1, p0, v0}, Lcom/google/android/material/chip/ChipGroup$PassThroughHierarchyChangeListener;-><init>(Lcom/google/android/material/chip/ChipGroup;Lcom/google/android/material/chip/ChipGroup$1;)V

    iput-object p1, p0, Lcom/google/android/material/chip/ChipGroup;->passThroughListener:Lcom/google/android/material/chip/ChipGroup$PassThroughHierarchyChangeListener;

    const/4 p1, -0x1

    .line 6
    iput p1, p0, Lcom/google/android/material/chip/ChipGroup;->checkedId:I

    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/google/android/material/chip/ChipGroup;->protectFromCheckedChange:Z

    .line 8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 9
    sget-object v3, Lcom/google/android/material/R$styleable;->ChipGroup:[I

    new-array v6, v0, [I

    const v5, 0x7f1202da

    move-object v2, p2

    move v4, p3

    .line 10
    invoke-static/range {v1 .. v6}, Lcom/google/android/material/internal/ThemeEnforcement;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/content/res/TypedArray;

    move-result-object p2

    const/4 p3, 0x1

    .line 11
    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v1

    const/4 v2, 0x2

    .line 12
    invoke-virtual {p2, v2, v1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    .line 13
    iget v3, p0, Lcom/google/android/material/chip/ChipGroup;->chipSpacingHorizontal:I

    if-eq v3, v2, :cond_0

    .line 14
    iput v2, p0, Lcom/google/android/material/chip/ChipGroup;->chipSpacingHorizontal:I

    .line 15
    iput v2, p0, Lcom/google/android/material/internal/FlowLayout;->itemSpacing:I

    .line 16
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestLayout()V

    :cond_0
    const/4 v2, 0x3

    .line 17
    invoke-virtual {p2, v2, v1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v1

    .line 18
    iget v2, p0, Lcom/google/android/material/chip/ChipGroup;->chipSpacingVertical:I

    if-eq v2, v1, :cond_1

    .line 19
    iput v1, p0, Lcom/google/android/material/chip/ChipGroup;->chipSpacingVertical:I

    .line 20
    iput v1, p0, Lcom/google/android/material/internal/FlowLayout;->lineSpacing:I

    .line 21
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestLayout()V

    :cond_1
    const/4 v1, 0x5

    .line 22
    invoke-virtual {p2, v1, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    .line 23
    iput-boolean v1, p0, Lcom/google/android/material/internal/FlowLayout;->singleLine:Z

    const/4 v1, 0x6

    .line 24
    invoke-virtual {p2, v1, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    .line 25
    iget-boolean v2, p0, Lcom/google/android/material/chip/ChipGroup;->singleSelection:Z

    if-eq v2, v1, :cond_4

    .line 26
    iput-boolean v1, p0, Lcom/google/android/material/chip/ChipGroup;->singleSelection:Z

    .line 27
    iput-boolean p3, p0, Lcom/google/android/material/chip/ChipGroup;->protectFromCheckedChange:Z

    move v1, v0

    .line 28
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 29
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 30
    instance-of v3, v2, Lcom/google/android/material/chip/Chip;

    if-eqz v3, :cond_2

    .line 31
    check-cast v2, Lcom/google/android/material/chip/Chip;

    invoke-virtual {v2, v0}, Lcom/google/android/material/chip/Chip;->setChecked(Z)V

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 32
    :cond_3
    iput-boolean v0, p0, Lcom/google/android/material/chip/ChipGroup;->protectFromCheckedChange:Z

    .line 33
    iput p1, p0, Lcom/google/android/material/chip/ChipGroup;->checkedId:I

    :cond_4
    const/4 v1, 0x4

    .line 34
    invoke-virtual {p2, v1, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    .line 35
    iput-boolean v1, p0, Lcom/google/android/material/chip/ChipGroup;->selectionRequired:Z

    .line 36
    invoke-virtual {p2, v0, p1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    if-eq v0, p1, :cond_5

    .line 37
    iput v0, p0, Lcom/google/android/material/chip/ChipGroup;->checkedId:I

    .line 38
    :cond_5
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 39
    iget-object p1, p0, Lcom/google/android/material/chip/ChipGroup;->passThroughListener:Lcom/google/android/material/chip/ChipGroup$PassThroughHierarchyChangeListener;

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->setOnHierarchyChangeListener(Landroid/view/ViewGroup$OnHierarchyChangeListener;)V

    .line 40
    sget-object p1, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 41
    invoke-virtual {p0, p3}, Landroid/view/View;->setImportantForAccessibility(I)V

    return-void
.end method


# virtual methods
.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 3

    .line 1
    instance-of v0, p1, Lcom/google/android/material/chip/Chip;

    if-eqz v0, :cond_1

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/material/chip/Chip;

    .line 3
    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 4
    iget v1, p0, Lcom/google/android/material/chip/ChipGroup;->checkedId:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    iget-boolean v2, p0, Lcom/google/android/material/chip/ChipGroup;->singleSelection:Z

    if-eqz v2, :cond_0

    const/4 v2, 0x0

    .line 5
    invoke-virtual {p0, v1, v2}, Lcom/google/android/material/chip/ChipGroup;->setCheckedStateForView(IZ)V

    .line 6
    :cond_0
    invoke-virtual {v0}, Landroid/widget/CheckBox;->getId()I

    move-result v0

    .line 7
    iput v0, p0, Lcom/google/android/material/chip/ChipGroup;->checkedId:I

    .line 8
    :cond_1
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result p0

    if-eqz p0, :cond_0

    instance-of p0, p1, Lcom/google/android/material/chip/ChipGroup$LayoutParams;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .line 1
    new-instance p0, Lcom/google/android/material/chip/ChipGroup$LayoutParams;

    const/4 v0, -0x2

    invoke-direct {p0, v0, v0}, Lcom/google/android/material/chip/ChipGroup$LayoutParams;-><init>(II)V

    return-object p0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/material/chip/ChipGroup$LayoutParams;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Lcom/google/android/material/chip/ChipGroup$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 2
    new-instance p0, Lcom/google/android/material/chip/ChipGroup$LayoutParams;

    invoke-direct {p0, p1}, Lcom/google/android/material/chip/ChipGroup$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object p0
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    iget v0, p0, Lcom/google/android/material/chip/ChipGroup;->checkedId:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v1, 0x1

    .line 3
    invoke-virtual {p0, v0, v1}, Lcom/google/android/material/chip/ChipGroup;->setCheckedStateForView(IZ)V

    .line 4
    iget v0, p0, Lcom/google/android/material/chip/ChipGroup;->checkedId:I

    .line 5
    iput v0, p0, Lcom/google/android/material/chip/ChipGroup;->checkedId:I

    :cond_0
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    iget-boolean v0, p0, Lcom/google/android/material/internal/FlowLayout;->singleLine:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    move v0, v1

    move v2, v0

    .line 3
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v0, v3, :cond_2

    .line 4
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    instance-of v3, v3, Lcom/google/android/material/chip/Chip;

    if-eqz v3, :cond_0

    add-int/lit8 v2, v2, 0x1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, -0x1

    .line 5
    :cond_2
    iget v0, p0, Lcom/google/android/material/internal/FlowLayout;->rowCount:I

    .line 6
    iget-boolean p0, p0, Lcom/google/android/material/chip/ChipGroup;->singleSelection:Z

    if-eqz p0, :cond_3

    const/4 p0, 0x1

    goto :goto_1

    :cond_3
    const/4 p0, 0x2

    .line 7
    :goto_1
    invoke-static {v0, v2, v1, p0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$CollectionInfoCompat;->obtain(IIZI)Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$CollectionInfoCompat;

    move-result-object p0

    .line 8
    iget-object p0, p0, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$CollectionInfoCompat;->mInfo:Ljava/lang/Object;

    check-cast p0, Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;

    .line 9
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setCollectionInfo(Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;)V

    return-void
.end method

.method public final setCheckedStateForView(IZ)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 2
    instance-of v0, p1, Lcom/google/android/material/chip/Chip;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 3
    iput-boolean v0, p0, Lcom/google/android/material/chip/ChipGroup;->protectFromCheckedChange:Z

    .line 4
    check-cast p1, Lcom/google/android/material/chip/Chip;

    invoke-virtual {p1, p2}, Lcom/google/android/material/chip/Chip;->setChecked(Z)V

    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/google/android/material/chip/ChipGroup;->protectFromCheckedChange:Z

    :cond_0
    return-void
.end method

.method public setOnHierarchyChangeListener(Landroid/view/ViewGroup$OnHierarchyChangeListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/chip/ChipGroup;->passThroughListener:Lcom/google/android/material/chip/ChipGroup$PassThroughHierarchyChangeListener;

    .line 2
    iput-object p1, p0, Lcom/google/android/material/chip/ChipGroup$PassThroughHierarchyChangeListener;->onHierarchyChangeListener:Landroid/view/ViewGroup$OnHierarchyChangeListener;

    return-void
.end method
