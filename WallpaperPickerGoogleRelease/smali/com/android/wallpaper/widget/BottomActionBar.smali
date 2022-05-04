.class public Lcom/android/wallpaper/widget/BottomActionBar;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;,
        Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;,
        Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;,
        Lcom/android/wallpaper/widget/BottomActionBar$AccessibilityCallback;,
        Lcom/android/wallpaper/widget/BottomActionBar$OnActionSelectedListener;,
        Lcom/android/wallpaper/widget/BottomActionBar$VisibilityChangeListener;,
        Lcom/android/wallpaper/widget/BottomActionBar$BottomActionBarHost;
    }
.end annotation


# static fields
.field public static final synthetic $r8$clinit:I


# instance fields
.field public mAccessibilityCallback:Lcom/android/wallpaper/widget/BottomActionBar$AccessibilityCallback;

.field public final mActionMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public final mActionSelectedListeners:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;",
            "Lcom/android/wallpaper/widget/BottomActionBar$OnActionSelectedListener;",
            ">;"
        }
    .end annotation
.end field

.field public final mBottomSheetBehavior:Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior<",
            "Landroid/view/ViewGroup;",
            ">;"
        }
    .end annotation
.end field

.field public final mBottomSheetView:Landroid/view/ViewGroup;

.field public final mContentViewMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;",
            "Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent<",
            "*>;>;"
        }
    .end annotation
.end field

.field public mLastSelectedAction:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

.field public mSelectedAction:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

.field public final mVisibilityChangeListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/android/wallpaper/widget/BottomActionBar$VisibilityChangeListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 9

    .line 1
    sget-object v0, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->CUSTOMIZE:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    sget-object v1, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->INFORMATION:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const-class v2, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    new-instance p2, Ljava/util/EnumMap;

    invoke-direct {p2, v2}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object p2, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mActionMap:Ljava/util/Map;

    .line 3
    new-instance v3, Ljava/util/EnumMap;

    invoke-direct {v3, v2}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object v3, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mContentViewMap:Ljava/util/Map;

    .line 4
    new-instance v3, Ljava/util/EnumMap;

    invoke-direct {v3, v2}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object v3, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mActionSelectedListeners:Ljava/util/Map;

    .line 5
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    iput-object v2, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mVisibilityChangeListeners:Ljava/util/Set;

    .line 6
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f0d003a

    const/4 v4, 0x1

    invoke-virtual {v2, v3, p0, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 7
    sget-object v2, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->ROTATION:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const v3, 0x7f0a004d

    invoke-virtual {p0, v3}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-interface {p2, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    sget-object v2, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->DELETE:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const v3, 0x7f0a0040

    invoke-virtual {p0, v3}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-interface {p2, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v2, 0x7f0a0046

    .line 9
    invoke-virtual {p0, v2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-interface {p2, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    sget-object v2, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->EDIT:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const v3, 0x7f0a0043

    invoke-virtual {p0, v3}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-interface {p2, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v2, 0x7f0a003f

    .line 11
    invoke-virtual {p0, v2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-interface {p2, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    sget-object v2, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->DOWNLOAD:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const v3, 0x7f0a0042

    invoke-virtual {p0, v3}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-interface {p2, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    sget-object v2, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->PROGRESS:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const v3, 0x7f0a004c

    invoke-virtual {p0, v3}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-interface {p2, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    sget-object v2, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->APPLY:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const v3, 0x7f0a0032

    invoke-virtual {p0, v3}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-interface {p2, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    sget-object v2, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->APPLY_TEXT:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const v3, 0x7f0a0033

    invoke-virtual {p0, v3}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-interface {p2, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const p2, 0x7f0a003c

    .line 16
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/view/ViewGroup;

    iput-object p2, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mBottomSheetView:Landroid/view/ViewGroup;

    .line 17
    invoke-virtual {p2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    check-cast v2, Landroid/graphics/drawable/GradientDrawable;

    const/4 v3, 0x0

    .line 18
    :try_start_0
    invoke-virtual {v2}, Landroid/graphics/drawable/GradientDrawable;->getCornerRadii()[F

    move-result-object v5

    if-nez v5, :cond_0

    goto :goto_1

    :cond_0
    move v6, v3

    .line 19
    :goto_0
    array-length v7, v5

    if-ge v6, v7, :cond_1

    .line 20
    aget v7, v5, v6

    const/high16 v8, 0x40000000    # 2.0f

    mul-float/2addr v7, v8

    aput v7, v5, v6

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 21
    :cond_1
    invoke-virtual {v2}, Landroid/graphics/drawable/GradientDrawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    check-cast v2, Landroid/graphics/drawable/GradientDrawable;

    .line 22
    invoke-virtual {v2, v5}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 23
    invoke-virtual {p2, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    :catch_0
    :goto_1
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/widget/BottomActionBar;->setColor(Landroid/content/Context;)V

    .line 25
    iget-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mBottomSheetView:Landroid/view/ViewGroup;

    invoke-static {p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    move-result-object p1

    check-cast p1, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;

    iput-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mBottomSheetBehavior:Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;

    const/4 p2, 0x4

    .line 26
    invoke-virtual {p1, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 27
    new-instance p2, Lcom/android/wallpaper/widget/BottomActionBar$1;

    invoke-direct {p2, p0}, Lcom/android/wallpaper/widget/BottomActionBar$1;-><init>(Lcom/android/wallpaper/widget/BottomActionBar;)V

    invoke-virtual {p1, p2}, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 28
    sget-object p1, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda0;->INSTANCE:Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda0;

    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    const/4 p1, 0x2

    new-array p2, p1, [Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    aput-object v1, p2, v3

    aput-object v0, p2, v4

    new-array v0, p1, [I

    .line 29
    fill-array-data v0, :array_0

    :goto_2
    if-ge v3, p1, :cond_2

    .line 30
    aget-object v1, p2, v3

    .line 31
    iget-object v2, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mActionMap:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 32
    new-instance v2, Lcom/android/wallpaper/widget/BottomActionBar$2;

    invoke-direct {v2, p0, v0}, Lcom/android/wallpaper/widget/BottomActionBar$2;-><init>(Lcom/android/wallpaper/widget/BottomActionBar;[I)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_2
    return-void

    nop

    :array_0
    .array-data 4
        0x1
        0x4
    .end array-data
.end method


# virtual methods
.method public bindBottomSheetContentWithAction(Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent<",
            "*>;",
            "Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mContentViewMap:Ljava/util/Map;

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mBottomSheetView:Landroid/view/ViewGroup;

    .line 3
    iget-object p1, p1, Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;->mContentView:Landroid/view/View;

    .line 4
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 5
    new-instance p1, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda1;

    invoke-direct {p1, p0, p2}, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/widget/BottomActionBar;Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    invoke-virtual {p0, p2, p1}, Lcom/android/wallpaper/widget/BottomActionBar;->setActionClickListener(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public deselectAction(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/widget/BottomActionBar;->isExpandable(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mBottomSheetBehavior:Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    :cond_0
    const/4 v0, 0x0

    .line 3
    invoke-virtual {p0, p1, v0}, Lcom/android/wallpaper/widget/BottomActionBar;->updateSelectedState(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;Z)V

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mSelectedAction:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    if-ne p1, v0, :cond_1

    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mSelectedAction:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    :cond_1
    return-void
.end method

.method public disableActions()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->values()[Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/wallpaper/widget/BottomActionBar;->disableActions([Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    return-void
.end method

.method public varargs disableActions([Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V
    .locals 5

    .line 2
    array-length v0, p1

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_0

    aget-object v3, p1, v2

    .line 3
    iget-object v4, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mActionMap:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    invoke-virtual {v3, v1}, Landroid/view/View;->setEnabled(Z)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public enableActionButtonsWithBottomSheet(Z)V
    .locals 1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mContentViewMap:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p1

    new-array v0, v0, [Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    invoke-interface {p1, v0}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/widget/BottomActionBar;->enableActions([Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    goto :goto_0

    .line 2
    :cond_0
    iget-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mContentViewMap:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p1

    new-array v0, v0, [Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    invoke-interface {p1, v0}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/widget/BottomActionBar;->disableActions([Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    :goto_0
    return-void
.end method

.method public enableActions()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->values()[Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/wallpaper/widget/BottomActionBar;->enableActions([Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    return-void
.end method

.method public varargs enableActions([Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V
    .locals 4

    .line 2
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    .line 3
    iget-object v3, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mActionMap:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/view/View;->setEnabled(Z)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public final getAccessibilityText(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;Z)Ljava/lang/CharSequence;
    .locals 1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 1
    :cond_0
    invoke-virtual {p1, p2}, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->getAccessibilityStringRes(Z)I

    move-result p1

    if-eqz p1, :cond_1

    .line 2
    iget-object p0, p0, Landroid/widget/FrameLayout;->mContext:Landroid/content/Context;

    invoke-virtual {p0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0

    :cond_1
    return-object v0
.end method

.method public varargs hideActions([Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V
    .locals 5

    .line 1
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    .line 2
    iget-object v3, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mActionMap:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 3
    invoke-virtual {p0, v2}, Lcom/android/wallpaper/widget/BottomActionBar;->isExpandable(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mSelectedAction:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    if-ne v3, v2, :cond_0

    .line 4
    invoke-virtual {p0}, Lcom/android/wallpaper/widget/BottomActionBar;->hideBottomSheetAndDeselectButtonIfExpanded()V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public final hideBottomSheetAndDeselectButtonIfExpanded()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mSelectedAction:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    invoke-virtual {p0, v0}, Lcom/android/wallpaper/widget/BottomActionBar;->isExpandable(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mBottomSheetBehavior:Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;

    .line 2
    iget v1, v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->state:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_0

    const/4 v1, 0x4

    .line 3
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mSelectedAction:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/wallpaper/widget/BottomActionBar;->updateSelectedState(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;Z)V

    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mSelectedAction:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    :cond_0
    return-void
.end method

.method public final isExpandable(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)Z
    .locals 0

    if-eqz p1, :cond_0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mContentViewMap:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public onVisibilityAggregated(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onVisibilityAggregated(Z)V

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mVisibilityChangeListeners:Ljava/util/Set;

    new-instance v0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda6;

    invoke-direct {v0, p1}, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda6;-><init>(Z)V

    invoke-interface {p0, v0}, Ljava/util/Set;->forEach(Ljava/util/function/Consumer;)V

    return-void
.end method

.method public setActionClickListener(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;Landroid/view/View$OnClickListener;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mActionMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 2
    invoke-virtual {v0}, Landroid/view/View;->hasOnClickListeners()Z

    move-result v1

    if-nez v1, :cond_0

    .line 3
    new-instance v1, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p1, p2}, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda2;-><init>(Lcom/android/wallpaper/widget/BottomActionBar;Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    .line 4
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Had already set a click listener to button: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public setColor(Landroid/content/Context;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mBottomSheetView:Landroid/view/ViewGroup;

    const v1, 0x7f080063

    invoke-virtual {p1, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mBottomSheetView:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mBottomSheetView:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mContentViewMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    new-instance v1, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0, p1}, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda5;-><init>(Lcom/android/wallpaper/widget/BottomActionBar;Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/Collection;->forEach(Ljava/util/function/Consumer;)V

    :cond_0
    const v0, 0x7f0a0050

    .line 5
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/view/ViewGroup;

    const v0, 0x1010031

    .line 6
    invoke-static {p1, v0}, Landroidx/transition/R$id;->getColorAttr(Landroid/content/Context;I)I

    move-result v0

    .line 7
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setBackgroundColor(I)V

    const/4 v0, 0x0

    .line 8
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 9
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 10
    instance-of v2, v1, Landroid/widget/ImageView;

    if-eqz v2, :cond_1

    const v2, 0x7f080061

    .line 11
    invoke-virtual {p1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 12
    check-cast v1, Landroid/widget/ImageView;

    const v2, 0x7f060023

    .line 13
    invoke-virtual {p1, v2}, Landroid/content/Context;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    .line 14
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public varargs showActions([Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V
    .locals 5

    .line 1
    array-length v0, p1

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_0

    aget-object v3, p1, v2

    .line 2
    iget-object v4, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mActionMap:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public varargs showActionsOnly([Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashSet;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mActionMap:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p1

    new-instance v1, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, v0}, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/widget/BottomActionBar;Ljava/util/Set;)V

    invoke-interface {p1, v1}, Ljava/util/Set;->forEach(Ljava/util/function/Consumer;)V

    return-void
.end method

.method public final updateSelectedState(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mActionMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 2
    invoke-virtual {v0}, Landroid/view/View;->isSelected()Z

    move-result v1

    if-ne v1, p2, :cond_0

    return-void

    .line 3
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mActionSelectedListeners:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/wallpaper/widget/BottomActionBar$OnActionSelectedListener;

    if-eqz p0, :cond_1

    .line 4
    invoke-interface {p0, p2}, Lcom/android/wallpaper/widget/BottomActionBar$OnActionSelectedListener;->onActionSelected(Z)V

    .line 5
    :cond_1
    invoke-virtual {v0, p2}, Landroid/view/View;->setSelected(Z)V

    return-void
.end method
