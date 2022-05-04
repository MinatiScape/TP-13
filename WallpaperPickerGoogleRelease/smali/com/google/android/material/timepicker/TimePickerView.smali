.class public Lcom/google/android/material/timepicker/TimePickerView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# static fields
.field public static final synthetic $r8$clinit:I


# instance fields
.field public final hourView:Lcom/google/android/material/chip/Chip;

.field public final minuteView:Lcom/google/android/material/chip/Chip;

.field public final selectionListener:Landroid/view/View$OnClickListener;

.field public final toggle:Lcom/google/android/material/button/MaterialButtonToggleGroup;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/timepicker/TimePickerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/timepicker/TimePickerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    new-instance p2, Lcom/google/android/material/timepicker/TimePickerView$1;

    invoke-direct {p2, p0}, Lcom/google/android/material/timepicker/TimePickerView$1;-><init>(Lcom/google/android/material/timepicker/TimePickerView;)V

    iput-object p2, p0, Lcom/google/android/material/timepicker/TimePickerView;->selectionListener:Landroid/view/View$OnClickListener;

    .line 5
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p3, 0x7f0d0080

    invoke-virtual {p1, p3, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const p1, 0x7f0a0143

    .line 6
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/timepicker/ClockFaceView;

    const p1, 0x7f0a0147

    .line 7
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/button/MaterialButtonToggleGroup;

    iput-object p1, p0, Lcom/google/android/material/timepicker/TimePickerView;->toggle:Lcom/google/android/material/button/MaterialButtonToggleGroup;

    .line 8
    new-instance p3, Lcom/google/android/material/timepicker/TimePickerView$2;

    invoke-direct {p3, p0}, Lcom/google/android/material/timepicker/TimePickerView$2;-><init>(Lcom/google/android/material/timepicker/TimePickerView;)V

    .line 9
    iget-object p1, p1, Lcom/google/android/material/button/MaterialButtonToggleGroup;->onButtonCheckedListeners:Ljava/util/LinkedHashSet;

    invoke-virtual {p1, p3}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    const p1, 0x7f0a014c

    .line 10
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/chip/Chip;

    iput-object p1, p0, Lcom/google/android/material/timepicker/TimePickerView;->minuteView:Lcom/google/android/material/chip/Chip;

    const p3, 0x7f0a0149

    .line 11
    invoke-virtual {p0, p3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/google/android/material/chip/Chip;

    iput-object p3, p0, Lcom/google/android/material/timepicker/TimePickerView;->hourView:Lcom/google/android/material/chip/Chip;

    const v0, 0x7f0a0144

    .line 12
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/timepicker/ClockHandView;

    .line 13
    new-instance v0, Landroid/view/GestureDetector;

    .line 14
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/google/android/material/timepicker/TimePickerView$3;

    invoke-direct {v2, p0}, Lcom/google/android/material/timepicker/TimePickerView$3;-><init>(Lcom/google/android/material/timepicker/TimePickerView;)V

    invoke-direct {v0, v1, v2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 15
    new-instance v1, Lcom/google/android/material/timepicker/TimePickerView$4;

    invoke-direct {v1, p0, v0}, Lcom/google/android/material/timepicker/TimePickerView$4;-><init>(Lcom/google/android/material/timepicker/TimePickerView;Landroid/view/GestureDetector;)V

    .line 16
    invoke-virtual {p1, v1}, Landroid/widget/CheckBox;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 17
    invoke-virtual {p3, v1}, Landroid/widget/CheckBox;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const/16 p0, 0xc

    .line 18
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const v0, 0x7f0a01f1

    invoke-virtual {p1, v0, p0}, Landroid/widget/CheckBox;->setTag(ILjava/lang/Object;)V

    const/16 p0, 0xa

    .line 19
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p3, v0, p0}, Landroid/widget/CheckBox;->setTag(ILjava/lang/Object;)V

    .line 20
    invoke-virtual {p1, p2}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 21
    invoke-virtual {p3, p2}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/timepicker/TimePickerView;->updateToggleConstraints()V

    return-void
.end method

.method public onVisibilityChanged(Landroid/view/View;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onVisibilityChanged(Landroid/view/View;I)V

    if-ne p1, p0, :cond_0

    if-nez p2, :cond_0

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/timepicker/TimePickerView;->updateToggleConstraints()V

    :cond_0
    return-void
.end method

.method public final updateToggleConstraints()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/google/android/material/timepicker/TimePickerView;->toggle:Lcom/google/android/material/button/MaterialButtonToggleGroup;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_3

    .line 2
    new-instance v0, Landroidx/constraintlayout/widget/ConstraintSet;

    invoke-direct {v0}, Landroidx/constraintlayout/widget/ConstraintSet;-><init>()V

    .line 3
    invoke-virtual {v0, p0}, Landroidx/constraintlayout/widget/ConstraintSet;->clone(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 4
    sget-object v1, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getLayoutDirection()I

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_1

    const/4 v1, 0x2

    goto :goto_1

    :cond_1
    move v1, v2

    :goto_1
    const v3, 0x7f0a0142

    .line 6
    iget-object v4, v0, Landroidx/constraintlayout/widget/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 7
    iget-object v4, v0, Landroidx/constraintlayout/widget/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;

    const/4 v4, -0x1

    packed-switch v1, :pswitch_data_0

    .line 8
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "unknown constraint"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 9
    :pswitch_0
    iget-object v1, v3, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->layout:Landroidx/constraintlayout/widget/ConstraintSet$Layout;

    iput v4, v1, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->endToStart:I

    .line 10
    iput v4, v1, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->endToEnd:I

    .line 11
    iput v4, v1, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->endMargin:I

    .line 12
    iput v4, v1, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->goneEndMargin:I

    goto :goto_2

    .line 13
    :pswitch_1
    iget-object v1, v3, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->layout:Landroidx/constraintlayout/widget/ConstraintSet$Layout;

    iput v4, v1, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->startToEnd:I

    .line 14
    iput v4, v1, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->startToStart:I

    .line 15
    iput v4, v1, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->startMargin:I

    .line 16
    iput v4, v1, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->goneStartMargin:I

    goto :goto_2

    .line 17
    :pswitch_2
    iget-object v1, v3, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->layout:Landroidx/constraintlayout/widget/ConstraintSet$Layout;

    iput v4, v1, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->baselineToBaseline:I

    goto :goto_2

    .line 18
    :pswitch_3
    iget-object v1, v3, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->layout:Landroidx/constraintlayout/widget/ConstraintSet$Layout;

    iput v4, v1, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->bottomToTop:I

    .line 19
    iput v4, v1, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->bottomToBottom:I

    .line 20
    iput v4, v1, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->bottomMargin:I

    .line 21
    iput v4, v1, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->goneBottomMargin:I

    goto :goto_2

    .line 22
    :pswitch_4
    iget-object v1, v3, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->layout:Landroidx/constraintlayout/widget/ConstraintSet$Layout;

    iput v4, v1, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->topToBottom:I

    .line 23
    iput v4, v1, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->topToTop:I

    .line 24
    iput v4, v1, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->topMargin:I

    .line 25
    iput v4, v1, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->goneTopMargin:I

    goto :goto_2

    .line 26
    :pswitch_5
    iget-object v1, v3, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->layout:Landroidx/constraintlayout/widget/ConstraintSet$Layout;

    iput v4, v1, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->rightToRight:I

    .line 27
    iput v4, v1, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->rightToLeft:I

    .line 28
    iput v4, v1, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->rightMargin:I

    .line 29
    iput v4, v1, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->goneRightMargin:I

    goto :goto_2

    .line 30
    :pswitch_6
    iget-object v1, v3, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->layout:Landroidx/constraintlayout/widget/ConstraintSet$Layout;

    iput v4, v1, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->leftToRight:I

    .line 31
    iput v4, v1, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->leftToLeft:I

    .line 32
    iput v4, v1, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->leftMargin:I

    .line 33
    iput v4, v1, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->goneLeftMargin:I

    .line 34
    :cond_2
    :goto_2
    invoke-virtual {v0, p0, v2}, Landroidx/constraintlayout/widget/ConstraintSet;->applyToInternal(Landroidx/constraintlayout/widget/ConstraintLayout;Z)V

    const/4 v0, 0x0

    .line 35
    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSet:Landroidx/constraintlayout/widget/ConstraintSet;

    .line 36
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->requestLayout()V

    :cond_3
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
