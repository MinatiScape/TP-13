.class public Landroidx/appcompat/widget/SearchView;
.super Landroidx/appcompat/widget/LinearLayoutCompat;
.source "SourceFile"

# interfaces
.implements Landroidx/appcompat/view/CollapsibleActionView;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/appcompat/widget/SearchView$SearchAutoComplete;,
        Landroidx/appcompat/widget/SearchView$UpdatableTouchDelegate;,
        Landroidx/appcompat/widget/SearchView$SavedState;
    }
.end annotation


# static fields
.field public static final synthetic $r8$clinit:I


# instance fields
.field public mClearingFocus:Z

.field public final mCloseButton:Landroid/widget/ImageView;

.field public final mCollapsedIcon:Landroid/widget/ImageView;

.field public mCollapsedImeOptions:I

.field public final mDefaultQueryHint:Ljava/lang/CharSequence;

.field public final mDropDownAnchor:Landroid/view/View;

.field public mExpandedInActionView:Z

.field public final mGoButton:Landroid/widget/ImageView;

.field public mIconified:Z

.field public mIconifiedByDefault:Z

.field public mMaxWidth:I

.field public mQueryHint:Ljava/lang/CharSequence;

.field public mReleaseCursorRunnable:Ljava/lang/Runnable;

.field public final mSearchButton:Landroid/widget/ImageView;

.field public final mSearchEditFrame:Landroid/view/View;

.field public final mSearchHintIcon:Landroid/graphics/drawable/Drawable;

.field public final mSearchPlate:Landroid/view/View;

.field public final mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

.field public mSearchSrcTextViewBounds:Landroid/graphics/Rect;

.field public mSearchSrtTextViewBoundsExpanded:Landroid/graphics/Rect;

.field public final mSubmitArea:Landroid/view/View;

.field public mTemp:[I

.field public mTemp2:[I

.field public mTextKeyListener:Landroid/view/View$OnKeyListener;

.field public mTextWatcher:Landroid/text/TextWatcher;

.field public mTouchDelegate:Landroidx/appcompat/widget/SearchView$UpdatableTouchDelegate;

.field public final mUpdateDrawableStateRunnable:Ljava/lang/Runnable;

.field public mUserQuery:Ljava/lang/CharSequence;

.field public final mVoiceButton:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Landroidx/appcompat/widget/SearchView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const v0, 0x7f04030a

    .line 2
    invoke-direct {p0, p1, p2, v0}, Landroidx/appcompat/widget/SearchView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 3
    invoke-direct/range {p0 .. p3}, Landroidx/appcompat/widget/LinearLayoutCompat;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, v0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextViewBounds:Landroid/graphics/Rect;

    .line 5
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, v0, Landroidx/appcompat/widget/SearchView;->mSearchSrtTextViewBoundsExpanded:Landroid/graphics/Rect;

    const/4 v2, 0x2

    new-array v3, v2, [I

    .line 6
    iput-object v3, v0, Landroidx/appcompat/widget/SearchView;->mTemp:[I

    new-array v3, v2, [I

    .line 7
    iput-object v3, v0, Landroidx/appcompat/widget/SearchView;->mTemp2:[I

    .line 8
    new-instance v3, Landroidx/appcompat/widget/SearchView$1;

    invoke-direct {v3, v0}, Landroidx/appcompat/widget/SearchView$1;-><init>(Landroidx/appcompat/widget/SearchView;)V

    iput-object v3, v0, Landroidx/appcompat/widget/SearchView;->mUpdateDrawableStateRunnable:Ljava/lang/Runnable;

    .line 9
    new-instance v3, Landroidx/appcompat/widget/SearchView$2;

    invoke-direct {v3, v0}, Landroidx/appcompat/widget/SearchView$2;-><init>(Landroidx/appcompat/widget/SearchView;)V

    iput-object v3, v0, Landroidx/appcompat/widget/SearchView;->mReleaseCursorRunnable:Ljava/lang/Runnable;

    .line 10
    new-instance v3, Ljava/util/WeakHashMap;

    invoke-direct {v3}, Ljava/util/WeakHashMap;-><init>()V

    .line 11
    new-instance v3, Landroidx/appcompat/widget/SearchView$5;

    invoke-direct {v3, v0}, Landroidx/appcompat/widget/SearchView$5;-><init>(Landroidx/appcompat/widget/SearchView;)V

    .line 12
    new-instance v4, Landroidx/appcompat/widget/SearchView$6;

    invoke-direct {v4, v0}, Landroidx/appcompat/widget/SearchView$6;-><init>(Landroidx/appcompat/widget/SearchView;)V

    iput-object v4, v0, Landroidx/appcompat/widget/SearchView;->mTextKeyListener:Landroid/view/View$OnKeyListener;

    .line 13
    new-instance v4, Landroidx/appcompat/widget/SearchView$7;

    invoke-direct {v4, v0}, Landroidx/appcompat/widget/SearchView$7;-><init>(Landroidx/appcompat/widget/SearchView;)V

    .line 14
    new-instance v5, Landroidx/appcompat/widget/SearchView$8;

    invoke-direct {v5, v0}, Landroidx/appcompat/widget/SearchView$8;-><init>(Landroidx/appcompat/widget/SearchView;)V

    .line 15
    new-instance v6, Landroidx/appcompat/widget/SearchView$9;

    invoke-direct {v6, v0}, Landroidx/appcompat/widget/SearchView$9;-><init>(Landroidx/appcompat/widget/SearchView;)V

    .line 16
    new-instance v7, Landroidx/appcompat/widget/SearchView$10;

    invoke-direct {v7, v0}, Landroidx/appcompat/widget/SearchView$10;-><init>(Landroidx/appcompat/widget/SearchView;)V

    iput-object v7, v0, Landroidx/appcompat/widget/SearchView;->mTextWatcher:Landroid/text/TextWatcher;

    .line 17
    sget-object v7, Landroidx/appcompat/R$styleable;->SearchView:[I

    .line 18
    new-instance v8, Landroidx/appcompat/widget/TintTypedArray;

    const/4 v9, 0x0

    move-object/from16 v10, p2

    move/from16 v11, p3

    .line 19
    invoke-virtual {v1, v10, v7, v11, v9}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v7

    invoke-direct {v8, v1, v7}, Landroidx/appcompat/widget/TintTypedArray;-><init>(Landroid/content/Context;Landroid/content/res/TypedArray;)V

    .line 20
    invoke-static/range {p1 .. p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const/16 v10, 0x9

    const v11, 0x7f0d0019

    .line 21
    invoke-virtual {v8, v10, v11}, Landroidx/appcompat/widget/TintTypedArray;->getResourceId(II)I

    move-result v10

    const/4 v11, 0x1

    .line 22
    invoke-virtual {v1, v10, v0, v11}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    const v1, 0x7f0a01e9

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    iput-object v1, v0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    .line 24
    iput-object v0, v1, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;->mSearchView:Landroidx/appcompat/widget/SearchView;

    const v10, 0x7f0a01e5

    .line 25
    invoke-virtual {v0, v10}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v10

    iput-object v10, v0, Landroidx/appcompat/widget/SearchView;->mSearchEditFrame:Landroid/view/View;

    const v10, 0x7f0a01e8

    .line 26
    invoke-virtual {v0, v10}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v10

    iput-object v10, v0, Landroidx/appcompat/widget/SearchView;->mSearchPlate:Landroid/view/View;

    const v12, 0x7f0a022b

    .line 27
    invoke-virtual {v0, v12}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v12

    iput-object v12, v0, Landroidx/appcompat/widget/SearchView;->mSubmitArea:Landroid/view/View;

    const v13, 0x7f0a01e3

    .line 28
    invoke-virtual {v0, v13}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/ImageView;

    iput-object v13, v0, Landroidx/appcompat/widget/SearchView;->mSearchButton:Landroid/widget/ImageView;

    const v14, 0x7f0a01e6

    .line 29
    invoke-virtual {v0, v14}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/ImageView;

    iput-object v14, v0, Landroidx/appcompat/widget/SearchView;->mGoButton:Landroid/widget/ImageView;

    const v15, 0x7f0a01e4

    .line 30
    invoke-virtual {v0, v15}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v15

    check-cast v15, Landroid/widget/ImageView;

    iput-object v15, v0, Landroidx/appcompat/widget/SearchView;->mCloseButton:Landroid/widget/ImageView;

    const v2, 0x7f0a01ea

    .line 31
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, v0, Landroidx/appcompat/widget/SearchView;->mVoiceButton:Landroid/widget/ImageView;

    const v11, 0x7f0a01e7

    .line 32
    invoke-virtual {v0, v11}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/ImageView;

    iput-object v11, v0, Landroidx/appcompat/widget/SearchView;->mCollapsedIcon:Landroid/widget/ImageView;

    const/16 v9, 0xa

    .line 33
    invoke-virtual {v8, v9}, Landroidx/appcompat/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    .line 34
    sget-object v16, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 35
    invoke-virtual {v10, v9}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/16 v9, 0xe

    .line 36
    invoke-virtual {v8, v9}, Landroidx/appcompat/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    .line 37
    invoke-virtual {v12, v9}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/16 v9, 0xd

    .line 38
    invoke-virtual {v8, v9}, Landroidx/appcompat/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    invoke-virtual {v13, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    const/4 v10, 0x7

    .line 39
    invoke-virtual {v8, v10}, Landroidx/appcompat/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    invoke-virtual {v14, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    const/4 v10, 0x4

    .line 40
    invoke-virtual {v8, v10}, Landroidx/appcompat/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    invoke-virtual {v15, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    const/16 v10, 0x10

    .line 41
    invoke-virtual {v8, v10}, Landroidx/appcompat/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    invoke-virtual {v2, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 42
    invoke-virtual {v8, v9}, Landroidx/appcompat/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    invoke-virtual {v11, v9}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    const/16 v9, 0xc

    .line 43
    invoke-virtual {v8, v9}, Landroidx/appcompat/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    iput-object v9, v0, Landroidx/appcompat/widget/SearchView;->mSearchHintIcon:Landroid/graphics/drawable/Drawable;

    .line 44
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f110015

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 45
    invoke-virtual {v13, v9}, Landroid/view/View;->setTooltipText(Ljava/lang/CharSequence;)V

    const/16 v9, 0xf

    const v10, 0x7f0d0018

    .line 46
    invoke-virtual {v8, v9, v10}, Landroidx/appcompat/widget/TintTypedArray;->getResourceId(II)I

    const/4 v9, 0x5

    const/4 v10, 0x0

    .line 47
    invoke-virtual {v8, v9, v10}, Landroidx/appcompat/widget/TintTypedArray;->getResourceId(II)I

    .line 48
    invoke-virtual {v13, v3}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 49
    invoke-virtual {v15, v3}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    invoke-virtual {v14, v3}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 51
    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    invoke-virtual {v1, v3}, Landroid/widget/AutoCompleteTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 53
    iget-object v2, v0, Landroidx/appcompat/widget/SearchView;->mTextWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v1, v2}, Landroid/widget/AutoCompleteTextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 54
    invoke-virtual {v1, v4}, Landroid/widget/AutoCompleteTextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 55
    invoke-virtual {v1, v5}, Landroid/widget/AutoCompleteTextView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 56
    invoke-virtual {v1, v6}, Landroid/widget/AutoCompleteTextView;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 57
    iget-object v2, v0, Landroidx/appcompat/widget/SearchView;->mTextKeyListener:Landroid/view/View$OnKeyListener;

    invoke-virtual {v1, v2}, Landroid/widget/AutoCompleteTextView;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 58
    new-instance v2, Landroidx/appcompat/widget/SearchView$3;

    invoke-direct {v2, v0}, Landroidx/appcompat/widget/SearchView$3;-><init>(Landroidx/appcompat/widget/SearchView;)V

    invoke-virtual {v1, v2}, Landroid/widget/AutoCompleteTextView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    const/16 v2, 0x8

    const/4 v3, 0x1

    .line 59
    invoke-virtual {v8, v2, v3}, Landroidx/appcompat/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result v2

    .line 60
    iget-boolean v4, v0, Landroidx/appcompat/widget/SearchView;->mIconifiedByDefault:Z

    if-ne v4, v2, :cond_0

    goto :goto_0

    .line 61
    :cond_0
    iput-boolean v2, v0, Landroidx/appcompat/widget/SearchView;->mIconifiedByDefault:Z

    .line 62
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/SearchView;->updateViewsVisibility(Z)V

    .line 63
    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/SearchView;->updateQueryHint()V

    :goto_0
    const/4 v2, -0x1

    .line 64
    invoke-virtual {v8, v3, v2}, Landroidx/appcompat/widget/TintTypedArray;->getDimensionPixelSize(II)I

    move-result v4

    if-eq v4, v2, :cond_1

    .line 65
    iput v4, v0, Landroidx/appcompat/widget/SearchView;->mMaxWidth:I

    .line 66
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->requestLayout()V

    :cond_1
    const/4 v3, 0x6

    .line 67
    invoke-virtual {v8, v3}, Landroidx/appcompat/widget/TintTypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    iput-object v3, v0, Landroidx/appcompat/widget/SearchView;->mDefaultQueryHint:Ljava/lang/CharSequence;

    const/16 v3, 0xb

    .line 68
    invoke-virtual {v8, v3}, Landroidx/appcompat/widget/TintTypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    iput-object v3, v0, Landroidx/appcompat/widget/SearchView;->mQueryHint:Ljava/lang/CharSequence;

    const/4 v3, 0x3

    .line 69
    invoke-virtual {v8, v3, v2}, Landroidx/appcompat/widget/TintTypedArray;->getInt(II)I

    move-result v3

    if-eq v3, v2, :cond_2

    .line 70
    invoke-virtual {v1, v3}, Landroid/widget/AutoCompleteTextView;->setImeOptions(I)V

    :cond_2
    const/4 v3, 0x2

    .line 71
    invoke-virtual {v8, v3, v2}, Landroidx/appcompat/widget/TintTypedArray;->getInt(II)I

    move-result v3

    if-eq v3, v2, :cond_3

    .line 72
    invoke-virtual {v1, v3}, Landroid/widget/AutoCompleteTextView;->setInputType(I)V

    :cond_3
    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 73
    invoke-virtual {v8, v2, v3}, Landroidx/appcompat/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result v2

    .line 74
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setFocusable(Z)V

    .line 75
    invoke-virtual {v7}, Landroid/content/res/TypedArray;->recycle()V

    .line 76
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.speech.action.WEB_SEARCH"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v3, 0x10000000

    .line 77
    invoke-virtual {v2, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v4, "android.speech.extra.LANGUAGE_MODEL"

    const-string v5, "web_search"

    .line 78
    invoke-virtual {v2, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 79
    new-instance v2, Landroid/content/Intent;

    const-string v4, "android.speech.action.RECOGNIZE_SPEECH"

    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 80
    invoke-virtual {v2, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 81
    invoke-virtual {v1}, Landroid/widget/AutoCompleteTextView;->getDropDownAnchor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, v0, Landroidx/appcompat/widget/SearchView;->mDropDownAnchor:Landroid/view/View;

    if-eqz v1, :cond_4

    .line 82
    new-instance v2, Landroidx/appcompat/widget/SearchView$4;

    invoke-direct {v2, v0}, Landroidx/appcompat/widget/SearchView$4;-><init>(Landroidx/appcompat/widget/SearchView;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 83
    :cond_4
    iget-boolean v1, v0, Landroidx/appcompat/widget/SearchView;->mIconifiedByDefault:Z

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SearchView;->updateViewsVisibility(Z)V

    .line 84
    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/SearchView;->updateQueryHint()V

    return-void
.end method


# virtual methods
.method public clearFocus()V
    .locals 2

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/appcompat/widget/SearchView;->mClearingFocus:Z

    .line 2
    invoke-super {p0}, Landroid/view/ViewGroup;->clearFocus()V

    .line 3
    iget-object v0, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->clearFocus()V

    .line 4
    iget-object v0, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;->setImeVisibility(Z)V

    .line 5
    iput-boolean v1, p0, Landroidx/appcompat/widget/SearchView;->mClearingFocus:Z

    return-void
.end method

.method public onActionViewCollapsed()V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->setText(Ljava/lang/CharSequence;)V

    .line 2
    iget-object v0, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->length()I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/AutoCompleteTextView;->setSelection(I)V

    .line 3
    iput-object v1, p0, Landroidx/appcompat/widget/SearchView;->mUserQuery:Ljava/lang/CharSequence;

    .line 4
    invoke-virtual {p0}, Landroidx/appcompat/widget/SearchView;->clearFocus()V

    const/4 v0, 0x1

    .line 5
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/SearchView;->updateViewsVisibility(Z)V

    .line 6
    iget-object v0, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    iget v1, p0, Landroidx/appcompat/widget/SearchView;->mCollapsedImeOptions:I

    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->setImeOptions(I)V

    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Landroidx/appcompat/widget/SearchView;->mExpandedInActionView:Z

    return-void
.end method

.method public onActionViewExpanded()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Landroidx/appcompat/widget/SearchView;->mExpandedInActionView:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Landroidx/appcompat/widget/SearchView;->mExpandedInActionView:Z

    .line 3
    iget-object v1, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v1}, Landroid/widget/AutoCompleteTextView;->getImeOptions()I

    move-result v1

    iput v1, p0, Landroidx/appcompat/widget/SearchView;->mCollapsedImeOptions:I

    .line 4
    iget-object v2, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    const/high16 v3, 0x2000000

    or-int/2addr v1, v3

    invoke-virtual {v2, v1}, Landroid/widget/AutoCompleteTextView;->setImeOptions(I)V

    .line 5
    iget-object v1, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/AutoCompleteTextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0, v1}, Landroidx/appcompat/widget/SearchView;->updateViewsVisibility(Z)V

    .line 7
    iget-object v1, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v1}, Landroid/widget/AutoCompleteTextView;->requestFocus()Z

    .line 8
    iget-object p0, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;->setImeVisibility(Z)V

    return-void
.end method

.method public onCloseClicked()V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object v0

    .line 2
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 3
    iget-boolean v0, p0, Landroidx/appcompat/widget/SearchView;->mIconifiedByDefault:Z

    if-eqz v0, :cond_1

    .line 4
    invoke-virtual {p0}, Landroidx/appcompat/widget/SearchView;->clearFocus()V

    .line 5
    invoke-virtual {p0, v1}, Landroidx/appcompat/widget/SearchView;->updateViewsVisibility(Z)V

    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    const-string v2, ""

    invoke-virtual {v0, v2}, Landroid/widget/AutoCompleteTextView;->setText(Ljava/lang/CharSequence;)V

    .line 7
    iget-object v0, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->requestFocus()Z

    .line 8
    iget-object p0, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-virtual {p0, v1}, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;->setImeVisibility(Z)V

    :cond_1
    :goto_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/SearchView;->mUpdateDrawableStateRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 2
    iget-object v0, p0, Landroidx/appcompat/widget/SearchView;->mReleaseCursorRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 3
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 3

    .line 1
    invoke-super/range {p0 .. p5}, Landroidx/appcompat/widget/LinearLayoutCompat;->onLayout(ZIIII)V

    if-eqz p1, :cond_1

    .line 2
    iget-object p1, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    iget-object p2, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextViewBounds:Landroid/graphics/Rect;

    .line 3
    iget-object p4, p0, Landroidx/appcompat/widget/SearchView;->mTemp:[I

    invoke-virtual {p1, p4}, Landroid/view/View;->getLocationInWindow([I)V

    .line 4
    iget-object p4, p0, Landroidx/appcompat/widget/SearchView;->mTemp2:[I

    invoke-virtual {p0, p4}, Landroid/view/ViewGroup;->getLocationInWindow([I)V

    .line 5
    iget-object p4, p0, Landroidx/appcompat/widget/SearchView;->mTemp:[I

    const/4 v0, 0x1

    aget v1, p4, v0

    iget-object v2, p0, Landroidx/appcompat/widget/SearchView;->mTemp2:[I

    aget v0, v2, v0

    sub-int/2addr v1, v0

    const/4 v0, 0x0

    .line 6
    aget p4, p4, v0

    aget v2, v2, v0

    sub-int/2addr p4, v2

    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v2

    add-int/2addr v2, p4

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    add-int/2addr p1, v1

    invoke-virtual {p2, p4, v1, v2, p1}, Landroid/graphics/Rect;->set(IIII)V

    .line 8
    iget-object p1, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrtTextViewBoundsExpanded:Landroid/graphics/Rect;

    iget-object p2, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextViewBounds:Landroid/graphics/Rect;

    iget p4, p2, Landroid/graphics/Rect;->left:I

    iget p2, p2, Landroid/graphics/Rect;->right:I

    sub-int/2addr p5, p3

    invoke-virtual {p1, p4, v0, p2, p5}, Landroid/graphics/Rect;->set(IIII)V

    .line 9
    iget-object p1, p0, Landroidx/appcompat/widget/SearchView;->mTouchDelegate:Landroidx/appcompat/widget/SearchView$UpdatableTouchDelegate;

    if-nez p1, :cond_0

    .line 10
    new-instance p1, Landroidx/appcompat/widget/SearchView$UpdatableTouchDelegate;

    iget-object p2, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrtTextViewBoundsExpanded:Landroid/graphics/Rect;

    iget-object p3, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextViewBounds:Landroid/graphics/Rect;

    iget-object p4, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-direct {p1, p2, p3, p4}, Landroidx/appcompat/widget/SearchView$UpdatableTouchDelegate;-><init>(Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/view/View;)V

    iput-object p1, p0, Landroidx/appcompat/widget/SearchView;->mTouchDelegate:Landroidx/appcompat/widget/SearchView$UpdatableTouchDelegate;

    .line 11
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setTouchDelegate(Landroid/view/TouchDelegate;)V

    goto :goto_0

    .line 12
    :cond_0
    iget-object p2, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrtTextViewBoundsExpanded:Landroid/graphics/Rect;

    iget-object p0, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextViewBounds:Landroid/graphics/Rect;

    invoke-virtual {p1, p2, p0}, Landroidx/appcompat/widget/SearchView$UpdatableTouchDelegate;->setBounds(Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Landroidx/appcompat/widget/SearchView;->mIconified:Z

    if-eqz v0, :cond_0

    .line 2
    invoke-super {p0, p1, p2}, Landroidx/appcompat/widget/LinearLayoutCompat;->onMeasure(II)V

    return-void

    .line 3
    :cond_0
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 4
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    const v1, 0x7f070037

    const/high16 v2, -0x80000000

    const/high16 v3, 0x40000000    # 2.0f

    if-eq v0, v2, :cond_4

    if-eqz v0, :cond_2

    if-eq v0, v3, :cond_1

    goto :goto_0

    .line 5
    :cond_1
    iget v0, p0, Landroidx/appcompat/widget/SearchView;->mMaxWidth:I

    if-lez v0, :cond_6

    .line 6
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    goto :goto_0

    .line 7
    :cond_2
    iget p1, p0, Landroidx/appcompat/widget/SearchView;->mMaxWidth:I

    if-lez p1, :cond_3

    goto :goto_0

    .line 8
    :cond_3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    .line 9
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    goto :goto_0

    .line 10
    :cond_4
    iget v0, p0, Landroidx/appcompat/widget/SearchView;->mMaxWidth:I

    if-lez v0, :cond_5

    .line 11
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    goto :goto_0

    .line 12
    :cond_5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 13
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 14
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 15
    :cond_6
    :goto_0
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 16
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    const v1, 0x7f070036

    if-eq v0, v2, :cond_8

    if-eqz v0, :cond_7

    goto :goto_1

    .line 17
    :cond_7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    .line 18
    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    goto :goto_1

    .line 19
    :cond_8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 20
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 21
    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    .line 22
    :goto_1
    invoke-static {p1, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    .line 23
    invoke-static {p2, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    .line 24
    invoke-super {p0, p1, p2}, Landroidx/appcompat/widget/LinearLayoutCompat;->onMeasure(II)V

    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 1

    .line 1
    instance-of v0, p1, Landroidx/appcompat/widget/SearchView$SavedState;

    if-nez v0, :cond_0

    .line 2
    invoke-super {p0, p1}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    return-void

    .line 3
    :cond_0
    check-cast p1, Landroidx/appcompat/widget/SearchView$SavedState;

    .line 4
    iget-object v0, p1, Landroidx/customview/view/AbsSavedState;->mSuperState:Landroid/os/Parcelable;

    .line 5
    invoke-super {p0, v0}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 6
    iget-boolean p1, p1, Landroidx/appcompat/widget/SearchView$SavedState;->isIconified:Z

    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/SearchView;->updateViewsVisibility(Z)V

    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestLayout()V

    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    .line 2
    new-instance v1, Landroidx/appcompat/widget/SearchView$SavedState;

    invoke-direct {v1, v0}, Landroidx/appcompat/widget/SearchView$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 3
    iget-boolean p0, p0, Landroidx/appcompat/widget/SearchView;->mIconified:Z

    .line 4
    iput-boolean p0, v1, Landroidx/appcompat/widget/SearchView$SavedState;->isIconified:Z

    return-object v1
.end method

.method public onSubmitQuery()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2
    invoke-static {v0}, Landroid/text/TextUtils;->getTrimmedLength(Ljava/lang/CharSequence;)I

    move-result v0

    if-lez v0, :cond_0

    .line 3
    iget-object v0, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;->setImeVisibility(Z)V

    .line 4
    iget-object p0, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-virtual {p0}, Landroid/widget/AutoCompleteTextView;->dismissDropDown()V

    :cond_0
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onWindowFocusChanged(Z)V

    .line 2
    iget-object p1, p0, Landroidx/appcompat/widget/SearchView;->mUpdateDrawableStateRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public requestFocus(ILandroid/graphics/Rect;)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Landroidx/appcompat/widget/SearchView;->mClearingFocus:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 2
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isFocusable()Z

    move-result v0

    if-nez v0, :cond_1

    return v1

    .line 3
    :cond_1
    iget-boolean v0, p0, Landroidx/appcompat/widget/SearchView;->mIconified:Z

    if-nez v0, :cond_3

    .line 4
    iget-object v0, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v0, p1, p2}, Landroid/widget/AutoCompleteTextView;->requestFocus(ILandroid/graphics/Rect;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 5
    invoke-virtual {p0, v1}, Landroidx/appcompat/widget/SearchView;->updateViewsVisibility(Z)V

    :cond_2
    return p1

    .line 6
    :cond_3
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->requestFocus(ILandroid/graphics/Rect;)Z

    move-result p0

    return p0
.end method

.method public final updateCloseButton()V
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    const/4 v2, 0x0

    if-nez v0, :cond_1

    .line 2
    iget-boolean v3, p0, Landroidx/appcompat/widget/SearchView;->mIconifiedByDefault:Z

    if-eqz v3, :cond_0

    iget-boolean v3, p0, Landroidx/appcompat/widget/SearchView;->mExpandedInActionView:Z

    if-nez v3, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    .line 3
    :cond_1
    :goto_0
    iget-object v3, p0, Landroidx/appcompat/widget/SearchView;->mCloseButton:Landroid/widget/ImageView;

    if-eqz v1, :cond_2

    goto :goto_1

    :cond_2
    const/16 v2, 0x8

    :goto_1
    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 4
    iget-object p0, p0, Landroidx/appcompat/widget/SearchView;->mCloseButton:Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    if-eqz p0, :cond_4

    if-eqz v0, :cond_3

    .line 5
    sget-object v0, Landroid/view/ViewGroup;->ENABLED_STATE_SET:[I

    goto :goto_2

    :cond_3
    sget-object v0, Landroid/view/ViewGroup;->EMPTY_STATE_SET:[I

    :goto_2
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    :cond_4
    return-void
.end method

.method public updateFocusedState()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->hasFocus()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    sget-object v0, Landroid/view/ViewGroup;->FOCUSED_STATE_SET:[I

    goto :goto_0

    :cond_0
    sget-object v0, Landroid/view/ViewGroup;->EMPTY_STATE_SET:[I

    .line 3
    :goto_0
    iget-object v1, p0, Landroidx/appcompat/widget/SearchView;->mSearchPlate:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 4
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 5
    :cond_1
    iget-object v1, p0, Landroidx/appcompat/widget/SearchView;->mSubmitArea:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 6
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 7
    :cond_2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    return-void
.end method

.method public final updateQueryHint()V
    .locals 6

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/SearchView;->mQueryHint:Ljava/lang/CharSequence;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    iget-object v0, p0, Landroidx/appcompat/widget/SearchView;->mDefaultQueryHint:Ljava/lang/CharSequence;

    .line 3
    :goto_0
    iget-object v1, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    if-nez v0, :cond_1

    const-string v0, ""

    .line 4
    :cond_1
    iget-boolean v2, p0, Landroidx/appcompat/widget/SearchView;->mIconifiedByDefault:Z

    if-eqz v2, :cond_3

    iget-object v2, p0, Landroidx/appcompat/widget/SearchView;->mSearchHintIcon:Landroid/graphics/drawable/Drawable;

    if-nez v2, :cond_2

    goto :goto_1

    .line 5
    :cond_2
    invoke-virtual {v1}, Landroid/widget/AutoCompleteTextView;->getTextSize()F

    move-result v2

    float-to-double v2, v2

    const-wide/high16 v4, 0x3ff4000000000000L    # 1.25

    mul-double/2addr v2, v4

    double-to-int v2, v2

    .line 6
    iget-object v3, p0, Landroidx/appcompat/widget/SearchView;->mSearchHintIcon:Landroid/graphics/drawable/Drawable;

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v4, v2, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 7
    new-instance v2, Landroid/text/SpannableStringBuilder;

    const-string v3, "   "

    invoke-direct {v2, v3}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 8
    new-instance v3, Landroid/text/style/ImageSpan;

    iget-object p0, p0, Landroidx/appcompat/widget/SearchView;->mSearchHintIcon:Landroid/graphics/drawable/Drawable;

    invoke-direct {v3, p0}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;)V

    const/4 p0, 0x1

    const/4 v4, 0x2

    const/16 v5, 0x21

    invoke-virtual {v2, v3, p0, v4, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 9
    invoke-virtual {v2, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-object v0, v2

    .line 10
    :cond_3
    :goto_1
    invoke-virtual {v1, v0}, Landroid/widget/AutoCompleteTextView;->setHint(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final updateViewsVisibility(Z)V
    .locals 4

    .line 1
    iput-boolean p1, p0, Landroidx/appcompat/widget/SearchView;->mIconified:Z

    const/4 v0, 0x0

    const/16 v1, 0x8

    if-eqz p1, :cond_0

    move v2, v0

    goto :goto_0

    :cond_0
    move v2, v1

    .line 2
    :goto_0
    iget-object v3, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v3}, Landroid/widget/AutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 3
    iget-object v3, p0, Landroidx/appcompat/widget/SearchView;->mSearchButton:Landroid/widget/ImageView;

    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 4
    iget-object v2, p0, Landroidx/appcompat/widget/SearchView;->mGoButton:Landroid/widget/ImageView;

    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 5
    iget-object v2, p0, Landroidx/appcompat/widget/SearchView;->mSearchEditFrame:Landroid/view/View;

    if-eqz p1, :cond_1

    move p1, v1

    goto :goto_1

    :cond_1
    move p1, v0

    :goto_1
    invoke-virtual {v2, p1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    iget-object p1, p0, Landroidx/appcompat/widget/SearchView;->mCollapsedIcon:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_2

    iget-boolean p1, p0, Landroidx/appcompat/widget/SearchView;->mIconifiedByDefault:Z

    if-eqz p1, :cond_3

    :cond_2
    move v0, v1

    .line 7
    :cond_3
    iget-object p1, p0, Landroidx/appcompat/widget/SearchView;->mCollapsedIcon:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 8
    invoke-virtual {p0}, Landroidx/appcompat/widget/SearchView;->updateCloseButton()V

    .line 9
    iget-object p1, p0, Landroidx/appcompat/widget/SearchView;->mVoiceButton:Landroid/widget/ImageView;

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 10
    iget-object p0, p0, Landroidx/appcompat/widget/SearchView;->mSubmitArea:Landroid/view/View;

    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
