.class public Landroidx/appcompat/app/AlertDialog;
.super Landroidx/appcompat/app/AppCompatDialog;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/appcompat/app/AlertDialog$Builder;
    }
.end annotation


# instance fields
.field public final mAlert:Landroidx/appcompat/app/AlertController;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1

    .line 1
    invoke-static {p1, p2}, Landroidx/appcompat/app/AlertDialog;->resolveDialogTheme(Landroid/content/Context;I)I

    move-result p2

    invoke-direct {p0, p1, p2}, Landroidx/appcompat/app/AppCompatDialog;-><init>(Landroid/content/Context;I)V

    .line 2
    new-instance p1, Landroidx/appcompat/app/AlertController;

    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-direct {p1, p2, p0, v0}, Landroidx/appcompat/app/AlertController;-><init>(Landroid/content/Context;Landroidx/appcompat/app/AppCompatDialog;Landroid/view/Window;)V

    iput-object p1, p0, Landroidx/appcompat/app/AlertDialog;->mAlert:Landroidx/appcompat/app/AlertController;

    return-void
.end method

.method public static resolveDialogTheme(Landroid/content/Context;I)I
    .locals 2

    ushr-int/lit8 v0, p1, 0x18

    and-int/lit16 v0, v0, 0xff

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    return p1

    .line 1
    :cond_0
    new-instance p1, Landroid/util/TypedValue;

    invoke-direct {p1}, Landroid/util/TypedValue;-><init>()V

    .line 2
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p0

    const v0, 0x7f04002a

    invoke-virtual {p0, v0, p1, v1}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 3
    iget p0, p1, Landroid/util/TypedValue;->resourceId:I

    return p0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 16

    .line 1
    invoke-super/range {p0 .. p1}, Landroidx/appcompat/app/AppCompatDialog;->onCreate(Landroid/os/Bundle;)V

    move-object/from16 v0, p0

    .line 2
    iget-object v0, v0, Landroidx/appcompat/app/AlertDialog;->mAlert:Landroidx/appcompat/app/AlertController;

    .line 3
    iget v1, v0, Landroidx/appcompat/app/AlertController;->mButtonPanelSideLayout:I

    if-nez v1, :cond_0

    .line 4
    iget v1, v0, Landroidx/appcompat/app/AlertController;->mAlertDialogLayout:I

    goto :goto_0

    .line 5
    :cond_0
    iget v1, v0, Landroidx/appcompat/app/AlertController;->mAlertDialogLayout:I

    .line 6
    :goto_0
    iget-object v2, v0, Landroidx/appcompat/app/AlertController;->mDialog:Landroidx/appcompat/app/AppCompatDialog;

    invoke-virtual {v2, v1}, Landroidx/appcompat/app/AppCompatDialog;->setContentView(I)V

    .line 7
    iget-object v1, v0, Landroidx/appcompat/app/AlertController;->mWindow:Landroid/view/Window;

    const v2, 0x7f0a0198

    invoke-virtual {v1, v2}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f0a0270

    .line 8
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    const v4, 0x7f0a00ad

    .line 9
    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    const v6, 0x7f0a007c

    .line 10
    invoke-virtual {v1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    const v8, 0x7f0a00bd

    .line 11
    invoke-virtual {v1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 12
    iget-object v8, v0, Landroidx/appcompat/app/AlertController;->mView:Landroid/view/View;

    const/4 v9, 0x0

    if-eqz v8, :cond_1

    goto :goto_1

    .line 13
    :cond_1
    iget v8, v0, Landroidx/appcompat/app/AlertController;->mViewLayoutResId:I

    if-eqz v8, :cond_2

    .line 14
    iget-object v8, v0, Landroidx/appcompat/app/AlertController;->mContext:Landroid/content/Context;

    invoke-static {v8}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v8

    .line 15
    iget v11, v0, Landroidx/appcompat/app/AlertController;->mViewLayoutResId:I

    invoke-virtual {v8, v11, v1, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v8

    goto :goto_1

    :cond_2
    const/4 v8, 0x0

    :goto_1
    if-eqz v8, :cond_3

    const/4 v12, 0x1

    goto :goto_2

    :cond_3
    move v12, v9

    :goto_2
    if-eqz v12, :cond_4

    .line 16
    invoke-static {v8}, Landroidx/appcompat/app/AlertController;->canTextInput(Landroid/view/View;)Z

    move-result v13

    if-nez v13, :cond_5

    .line 17
    :cond_4
    iget-object v13, v0, Landroidx/appcompat/app/AlertController;->mWindow:Landroid/view/Window;

    const/high16 v14, 0x20000

    invoke-virtual {v13, v14, v14}, Landroid/view/Window;->setFlags(II)V

    :cond_5
    const/4 v13, -0x1

    const/16 v14, 0x8

    if-eqz v12, :cond_7

    .line 18
    iget-object v12, v0, Landroidx/appcompat/app/AlertController;->mWindow:Landroid/view/Window;

    const v15, 0x7f0a00bc

    invoke-virtual {v12, v15}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/FrameLayout;

    .line 19
    new-instance v15, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v15, v13, v13}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v12, v8, v15}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    iget-boolean v8, v0, Landroidx/appcompat/app/AlertController;->mViewSpacingSpecified:Z

    if-eqz v8, :cond_6

    .line 21
    iget v8, v0, Landroidx/appcompat/app/AlertController;->mViewSpacingLeft:I

    iget v15, v0, Landroidx/appcompat/app/AlertController;->mViewSpacingTop:I

    iget v11, v0, Landroidx/appcompat/app/AlertController;->mViewSpacingRight:I

    iget v10, v0, Landroidx/appcompat/app/AlertController;->mViewSpacingBottom:I

    invoke-virtual {v12, v8, v15, v11, v10}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 22
    :cond_6
    iget-object v8, v0, Landroidx/appcompat/app/AlertController;->mListView:Landroid/widget/ListView;

    if-eqz v8, :cond_8

    .line 23
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    check-cast v8, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    const/4 v10, 0x0

    iput v10, v8, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    goto :goto_3

    .line 24
    :cond_7
    invoke-virtual {v1, v14}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 25
    :cond_8
    :goto_3
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 26
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 27
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .line 28
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/app/AlertController;->resolvePanel(Landroid/view/View;Landroid/view/View;)Landroid/view/ViewGroup;

    move-result-object v2

    .line 29
    invoke-virtual {v0, v4, v5}, Landroidx/appcompat/app/AlertController;->resolvePanel(Landroid/view/View;Landroid/view/View;)Landroid/view/ViewGroup;

    move-result-object v3

    .line 30
    invoke-virtual {v0, v6, v7}, Landroidx/appcompat/app/AlertController;->resolvePanel(Landroid/view/View;Landroid/view/View;)Landroid/view/ViewGroup;

    move-result-object v4

    .line 31
    iget-object v5, v0, Landroidx/appcompat/app/AlertController;->mWindow:Landroid/view/Window;

    const v6, 0x7f0a01de

    invoke-virtual {v5, v6}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroidx/core/widget/NestedScrollView;

    iput-object v5, v0, Landroidx/appcompat/app/AlertController;->mScrollView:Landroidx/core/widget/NestedScrollView;

    .line 32
    invoke-virtual {v5, v9}, Landroid/widget/FrameLayout;->setFocusable(Z)V

    .line 33
    iget-object v5, v0, Landroidx/appcompat/app/AlertController;->mScrollView:Landroidx/core/widget/NestedScrollView;

    invoke-virtual {v5, v9}, Landroidx/core/widget/NestedScrollView;->setNestedScrollingEnabled(Z)V

    const v5, 0x102000b

    .line 34
    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v0, Landroidx/appcompat/app/AlertController;->mMessageView:Landroid/widget/TextView;

    if-nez v5, :cond_9

    goto :goto_4

    .line 35
    :cond_9
    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mMessage:Ljava/lang/CharSequence;

    if-eqz v6, :cond_a

    .line 36
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_4

    .line 37
    :cond_a
    invoke-virtual {v5, v14}, Landroid/widget/TextView;->setVisibility(I)V

    .line 38
    iget-object v5, v0, Landroidx/appcompat/app/AlertController;->mScrollView:Landroidx/core/widget/NestedScrollView;

    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mMessageView:Landroid/widget/TextView;

    invoke-virtual {v5, v6}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 39
    iget-object v5, v0, Landroidx/appcompat/app/AlertController;->mListView:Landroid/widget/ListView;

    if-eqz v5, :cond_b

    .line 40
    iget-object v5, v0, Landroidx/appcompat/app/AlertController;->mScrollView:Landroidx/core/widget/NestedScrollView;

    invoke-virtual {v5}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup;

    .line 41
    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mScrollView:Landroidx/core/widget/NestedScrollView;

    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v6

    .line 42
    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->removeViewAt(I)V

    .line 43
    iget-object v7, v0, Landroidx/appcompat/app/AlertController;->mListView:Landroid/widget/ListView;

    new-instance v8, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v8, v13, v13}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v7, v6, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    goto :goto_4

    .line 44
    :cond_b
    invoke-virtual {v3, v14}, Landroid/view/ViewGroup;->setVisibility(I)V

    :goto_4
    const v5, 0x1020019

    .line 45
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iput-object v5, v0, Landroidx/appcompat/app/AlertController;->mButtonPositive:Landroid/widget/Button;

    .line 46
    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mButtonHandler:Landroid/view/View$OnClickListener;

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 47
    iget-object v5, v0, Landroidx/appcompat/app/AlertController;->mButtonPositiveText:Ljava/lang/CharSequence;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_c

    iget-object v5, v0, Landroidx/appcompat/app/AlertController;->mButtonPositiveIcon:Landroid/graphics/drawable/Drawable;

    if-nez v5, :cond_c

    .line 48
    iget-object v5, v0, Landroidx/appcompat/app/AlertController;->mButtonPositive:Landroid/widget/Button;

    invoke-virtual {v5, v14}, Landroid/widget/Button;->setVisibility(I)V

    move v5, v9

    goto :goto_5

    .line 49
    :cond_c
    iget-object v5, v0, Landroidx/appcompat/app/AlertController;->mButtonPositive:Landroid/widget/Button;

    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mButtonPositiveText:Ljava/lang/CharSequence;

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 50
    iget-object v5, v0, Landroidx/appcompat/app/AlertController;->mButtonPositiveIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v5, :cond_d

    .line 51
    iget v6, v0, Landroidx/appcompat/app/AlertController;->mButtonIconDimen:I

    invoke-virtual {v5, v9, v9, v6, v6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 52
    iget-object v5, v0, Landroidx/appcompat/app/AlertController;->mButtonPositive:Landroid/widget/Button;

    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mButtonPositiveIcon:Landroid/graphics/drawable/Drawable;

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7, v7, v7}, Landroid/widget/Button;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 53
    :cond_d
    iget-object v5, v0, Landroidx/appcompat/app/AlertController;->mButtonPositive:Landroid/widget/Button;

    invoke-virtual {v5, v9}, Landroid/widget/Button;->setVisibility(I)V

    const/4 v5, 0x1

    :goto_5
    const v6, 0x102001a

    .line 54
    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/Button;

    iput-object v6, v0, Landroidx/appcompat/app/AlertController;->mButtonNegative:Landroid/widget/Button;

    .line 55
    iget-object v7, v0, Landroidx/appcompat/app/AlertController;->mButtonHandler:Landroid/view/View$OnClickListener;

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 56
    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mButtonNegativeText:Ljava/lang/CharSequence;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_e

    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mButtonNegativeIcon:Landroid/graphics/drawable/Drawable;

    if-nez v6, :cond_e

    .line 57
    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mButtonNegative:Landroid/widget/Button;

    invoke-virtual {v6, v14}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_6

    .line 58
    :cond_e
    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mButtonNegative:Landroid/widget/Button;

    iget-object v7, v0, Landroidx/appcompat/app/AlertController;->mButtonNegativeText:Ljava/lang/CharSequence;

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 59
    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mButtonNegativeIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v6, :cond_f

    .line 60
    iget v7, v0, Landroidx/appcompat/app/AlertController;->mButtonIconDimen:I

    invoke-virtual {v6, v9, v9, v7, v7}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 61
    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mButtonNegative:Landroid/widget/Button;

    iget-object v7, v0, Landroidx/appcompat/app/AlertController;->mButtonNegativeIcon:Landroid/graphics/drawable/Drawable;

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8, v8, v8}, Landroid/widget/Button;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 62
    :cond_f
    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mButtonNegative:Landroid/widget/Button;

    invoke-virtual {v6, v9}, Landroid/widget/Button;->setVisibility(I)V

    or-int/lit8 v5, v5, 0x2

    :goto_6
    const v6, 0x102001b

    .line 63
    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/Button;

    iput-object v6, v0, Landroidx/appcompat/app/AlertController;->mButtonNeutral:Landroid/widget/Button;

    .line 64
    iget-object v7, v0, Landroidx/appcompat/app/AlertController;->mButtonHandler:Landroid/view/View$OnClickListener;

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 65
    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mButtonNeutralText:Ljava/lang/CharSequence;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_10

    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mButtonNeutralIcon:Landroid/graphics/drawable/Drawable;

    if-nez v6, :cond_10

    .line 66
    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mButtonNeutral:Landroid/widget/Button;

    invoke-virtual {v6, v14}, Landroid/widget/Button;->setVisibility(I)V

    const/4 v8, 0x0

    goto :goto_8

    .line 67
    :cond_10
    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mButtonNeutral:Landroid/widget/Button;

    iget-object v7, v0, Landroidx/appcompat/app/AlertController;->mButtonNeutralText:Ljava/lang/CharSequence;

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 68
    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mButtonNeutralIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v6, :cond_11

    .line 69
    iget v7, v0, Landroidx/appcompat/app/AlertController;->mButtonIconDimen:I

    invoke-virtual {v6, v9, v9, v7, v7}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 70
    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mButtonNeutral:Landroid/widget/Button;

    iget-object v7, v0, Landroidx/appcompat/app/AlertController;->mButtonNeutralIcon:Landroid/graphics/drawable/Drawable;

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8, v8, v8}, Landroid/widget/Button;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_7

    :cond_11
    const/4 v8, 0x0

    .line 71
    :goto_7
    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mButtonNeutral:Landroid/widget/Button;

    invoke-virtual {v6, v9}, Landroid/widget/Button;->setVisibility(I)V

    or-int/lit8 v5, v5, 0x4

    .line 72
    :goto_8
    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mContext:Landroid/content/Context;

    .line 73
    new-instance v7, Landroid/util/TypedValue;

    invoke-direct {v7}, Landroid/util/TypedValue;-><init>()V

    .line 74
    invoke-virtual {v6}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v6

    const v10, 0x7f040028

    const/4 v11, 0x1

    invoke-virtual {v6, v10, v7, v11}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 75
    iget v6, v7, Landroid/util/TypedValue;->data:I

    if-eqz v6, :cond_12

    move v6, v11

    goto :goto_9

    :cond_12
    move v6, v9

    :goto_9
    const/4 v7, 0x2

    if-eqz v6, :cond_15

    if-ne v5, v11, :cond_13

    .line 76
    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mButtonPositive:Landroid/widget/Button;

    invoke-virtual {v0, v6}, Landroidx/appcompat/app/AlertController;->centerButton(Landroid/widget/Button;)V

    goto :goto_a

    :cond_13
    if-ne v5, v7, :cond_14

    .line 77
    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mButtonNegative:Landroid/widget/Button;

    invoke-virtual {v0, v6}, Landroidx/appcompat/app/AlertController;->centerButton(Landroid/widget/Button;)V

    goto :goto_a

    :cond_14
    const/4 v6, 0x4

    if-ne v5, v6, :cond_15

    .line 78
    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mButtonNeutral:Landroid/widget/Button;

    invoke-virtual {v0, v6}, Landroidx/appcompat/app/AlertController;->centerButton(Landroid/widget/Button;)V

    :cond_15
    :goto_a
    if-eqz v5, :cond_16

    const/4 v5, 0x1

    goto :goto_b

    :cond_16
    move v5, v9

    :goto_b
    if-nez v5, :cond_17

    .line 79
    invoke-virtual {v4, v14}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 80
    :cond_17
    iget-object v5, v0, Landroidx/appcompat/app/AlertController;->mCustomTitleView:Landroid/view/View;

    const v6, 0x7f0a026b

    if-eqz v5, :cond_18

    .line 81
    new-instance v5, Landroid/view/ViewGroup$LayoutParams;

    const/4 v10, -0x2

    invoke-direct {v5, v13, v10}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 82
    iget-object v10, v0, Landroidx/appcompat/app/AlertController;->mCustomTitleView:Landroid/view/View;

    invoke-virtual {v2, v10, v9, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 83
    iget-object v5, v0, Landroidx/appcompat/app/AlertController;->mWindow:Landroid/view/Window;

    invoke-virtual {v5, v6}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .line 84
    invoke-virtual {v5, v14}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_c

    .line 85
    :cond_18
    iget-object v5, v0, Landroidx/appcompat/app/AlertController;->mWindow:Landroid/view/Window;

    const v10, 0x1020006

    invoke-virtual {v5, v10}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    iput-object v5, v0, Landroidx/appcompat/app/AlertController;->mIconView:Landroid/widget/ImageView;

    .line 86
    iget-object v5, v0, Landroidx/appcompat/app/AlertController;->mTitle:Ljava/lang/CharSequence;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    const/4 v10, 0x1

    xor-int/2addr v5, v10

    if-eqz v5, :cond_1b

    .line 87
    iget-boolean v5, v0, Landroidx/appcompat/app/AlertController;->mShowTitle:Z

    if-eqz v5, :cond_1b

    .line 88
    iget-object v5, v0, Landroidx/appcompat/app/AlertController;->mWindow:Landroid/view/Window;

    const v6, 0x7f0a0057

    invoke-virtual {v5, v6}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v0, Landroidx/appcompat/app/AlertController;->mTitleView:Landroid/widget/TextView;

    .line 89
    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mTitle:Ljava/lang/CharSequence;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    iget v5, v0, Landroidx/appcompat/app/AlertController;->mIconId:I

    if-eqz v5, :cond_19

    .line 91
    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v6, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_c

    .line 92
    :cond_19
    iget-object v5, v0, Landroidx/appcompat/app/AlertController;->mIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v5, :cond_1a

    .line 93
    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v6, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_c

    .line 94
    :cond_1a
    iget-object v5, v0, Landroidx/appcompat/app/AlertController;->mTitleView:Landroid/widget/TextView;

    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v6}, Landroid/widget/ImageView;->getPaddingLeft()I

    move-result v6

    iget-object v10, v0, Landroidx/appcompat/app/AlertController;->mIconView:Landroid/widget/ImageView;

    .line 95
    invoke-virtual {v10}, Landroid/widget/ImageView;->getPaddingTop()I

    move-result v10

    iget-object v11, v0, Landroidx/appcompat/app/AlertController;->mIconView:Landroid/widget/ImageView;

    .line 96
    invoke-virtual {v11}, Landroid/widget/ImageView;->getPaddingRight()I

    move-result v11

    iget-object v12, v0, Landroidx/appcompat/app/AlertController;->mIconView:Landroid/widget/ImageView;

    .line 97
    invoke-virtual {v12}, Landroid/widget/ImageView;->getPaddingBottom()I

    move-result v12

    .line 98
    invoke-virtual {v5, v6, v10, v11, v12}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 99
    iget-object v5, v0, Landroidx/appcompat/app/AlertController;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v5, v14}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_c

    .line 100
    :cond_1b
    iget-object v5, v0, Landroidx/appcompat/app/AlertController;->mWindow:Landroid/view/Window;

    invoke-virtual {v5, v6}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .line 101
    invoke-virtual {v5, v14}, Landroid/view/View;->setVisibility(I)V

    .line 102
    iget-object v5, v0, Landroidx/appcompat/app/AlertController;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v5, v14}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 103
    invoke-virtual {v2, v14}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 104
    :goto_c
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v1

    if-eq v1, v14, :cond_1c

    const/4 v11, 0x1

    goto :goto_d

    :cond_1c
    move v11, v9

    :goto_d
    if-eqz v2, :cond_1d

    .line 105
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v1

    if-eq v1, v14, :cond_1d

    const/4 v1, 0x1

    goto :goto_e

    :cond_1d
    move v1, v9

    .line 106
    :goto_e
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v4

    if-eq v4, v14, :cond_1e

    const/4 v4, 0x1

    goto :goto_f

    :cond_1e
    move v4, v9

    :goto_f
    if-nez v4, :cond_1f

    const v5, 0x7f0a0245

    .line 107
    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_1f

    .line 108
    invoke-virtual {v5, v9}, Landroid/view/View;->setVisibility(I)V

    :cond_1f
    if-eqz v1, :cond_23

    .line 109
    iget-object v5, v0, Landroidx/appcompat/app/AlertController;->mScrollView:Landroidx/core/widget/NestedScrollView;

    if-eqz v5, :cond_20

    const/4 v6, 0x1

    .line 110
    invoke-virtual {v5, v6}, Landroid/widget/FrameLayout;->setClipToPadding(Z)V

    .line 111
    :cond_20
    iget-object v5, v0, Landroidx/appcompat/app/AlertController;->mMessage:Ljava/lang/CharSequence;

    if-nez v5, :cond_22

    iget-object v5, v0, Landroidx/appcompat/app/AlertController;->mListView:Landroid/widget/ListView;

    if-eqz v5, :cond_21

    goto :goto_10

    :cond_21
    move-object v10, v8

    goto :goto_11

    :cond_22
    :goto_10
    const v5, 0x7f0a026a

    .line 112
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v10

    :goto_11
    if-eqz v10, :cond_24

    .line 113
    invoke-virtual {v10, v9}, Landroid/view/View;->setVisibility(I)V

    goto :goto_12

    :cond_23
    const v2, 0x7f0a0246

    .line 114
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_24

    .line 115
    invoke-virtual {v2, v9}, Landroid/view/View;->setVisibility(I)V

    .line 116
    :cond_24
    :goto_12
    iget-object v2, v0, Landroidx/appcompat/app/AlertController;->mListView:Landroid/widget/ListView;

    instance-of v5, v2, Landroidx/appcompat/app/AlertController$RecycleListView;

    if-eqz v5, :cond_28

    .line 117
    check-cast v2, Landroidx/appcompat/app/AlertController$RecycleListView;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v4, :cond_25

    if-nez v1, :cond_28

    .line 118
    :cond_25
    invoke-virtual {v2}, Landroid/widget/ListView;->getPaddingLeft()I

    move-result v5

    if-eqz v1, :cond_26

    .line 119
    invoke-virtual {v2}, Landroid/widget/ListView;->getPaddingTop()I

    move-result v6

    goto :goto_13

    :cond_26
    iget v6, v2, Landroidx/appcompat/app/AlertController$RecycleListView;->mPaddingTopNoTitle:I

    .line 120
    :goto_13
    invoke-virtual {v2}, Landroid/widget/ListView;->getPaddingRight()I

    move-result v8

    if-eqz v4, :cond_27

    .line 121
    invoke-virtual {v2}, Landroid/widget/ListView;->getPaddingBottom()I

    move-result v10

    goto :goto_14

    :cond_27
    iget v10, v2, Landroidx/appcompat/app/AlertController$RecycleListView;->mPaddingBottomNoButtons:I

    .line 122
    :goto_14
    invoke-virtual {v2, v5, v6, v8, v10}, Landroid/widget/ListView;->setPadding(IIII)V

    :cond_28
    if-nez v11, :cond_2c

    .line 123
    iget-object v2, v0, Landroidx/appcompat/app/AlertController;->mListView:Landroid/widget/ListView;

    if-eqz v2, :cond_29

    goto :goto_15

    :cond_29
    iget-object v2, v0, Landroidx/appcompat/app/AlertController;->mScrollView:Landroidx/core/widget/NestedScrollView;

    :goto_15
    if-eqz v2, :cond_2c

    if-eqz v4, :cond_2a

    move v9, v7

    :cond_2a
    or-int/2addr v1, v9

    const/4 v4, 0x3

    .line 124
    iget-object v5, v0, Landroidx/appcompat/app/AlertController;->mWindow:Landroid/view/Window;

    const v6, 0x7f0a01dd

    invoke-virtual {v5, v6}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .line 125
    iget-object v6, v0, Landroidx/appcompat/app/AlertController;->mWindow:Landroid/view/Window;

    const v7, 0x7f0a01dc

    invoke-virtual {v6, v7}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .line 126
    sget-object v7, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 127
    invoke-virtual {v2, v1, v4}, Landroid/view/View;->setScrollIndicators(II)V

    if-eqz v5, :cond_2b

    .line 128
    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_2b
    if-eqz v6, :cond_2c

    .line 129
    invoke-virtual {v3, v6}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 130
    :cond_2c
    iget-object v1, v0, Landroidx/appcompat/app/AlertController;->mListView:Landroid/widget/ListView;

    if-eqz v1, :cond_2d

    .line 131
    iget-object v2, v0, Landroidx/appcompat/app/AlertController;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v2, :cond_2d

    .line 132
    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 133
    iget v0, v0, Landroidx/appcompat/app/AlertController;->mCheckedItem:I

    if-le v0, v13, :cond_2d

    const/4 v2, 0x1

    .line 134
    invoke-virtual {v1, v0, v2}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 135
    invoke-virtual {v1, v0}, Landroid/widget/ListView;->setSelection(I)V

    :cond_2d
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/app/AlertDialog;->mAlert:Landroidx/appcompat/app/AlertController;

    .line 2
    iget-object v0, v0, Landroidx/appcompat/app/AlertController;->mScrollView:Landroidx/core/widget/NestedScrollView;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {v0, p2}, Landroidx/core/widget/NestedScrollView;->executeKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    return v1

    .line 3
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/app/Dialog;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/app/AlertDialog;->mAlert:Landroidx/appcompat/app/AlertController;

    .line 2
    iget-object v0, v0, Landroidx/appcompat/app/AlertController;->mScrollView:Landroidx/core/widget/NestedScrollView;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {v0, p2}, Landroidx/core/widget/NestedScrollView;->executeKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    return v1

    .line 3
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/app/Dialog;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 2
    iget-object p0, p0, Landroidx/appcompat/app/AlertDialog;->mAlert:Landroidx/appcompat/app/AlertController;

    .line 3
    iput-object p1, p0, Landroidx/appcompat/app/AlertController;->mTitle:Ljava/lang/CharSequence;

    .line 4
    iget-object p0, p0, Landroidx/appcompat/app/AlertController;->mTitleView:Landroid/widget/TextView;

    if-eqz p0, :cond_0

    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method
