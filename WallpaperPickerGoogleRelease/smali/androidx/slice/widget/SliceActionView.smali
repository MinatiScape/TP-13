.class public Landroidx/slice/widget/SliceActionView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/slice/widget/SliceActionView$ImageToggle;,
        Landroidx/slice/widget/SliceActionView$SliceActionLoadingListener;
    }
.end annotation


# static fields
.field public static final CHECKED_STATE_SET:[I


# instance fields
.field public mActionView:Landroid/view/View;

.field public mEventInfo:Landroidx/slice/widget/EventInfo;

.field public mIconSize:I

.field public mImageSize:I

.field public mLoadingListener:Landroidx/slice/widget/SliceActionView$SliceActionLoadingListener;

.field public mObserver:Landroidx/slice/widget/SliceView$OnSliceActionListener;

.field public mProgressView:Landroid/widget/ProgressBar;

.field public mSliceAction:Landroidx/slice/core/SliceActionImpl;

.field public mTextActionPadding:I


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x10100a0

    aput v2, v0, v1

    .line 1
    sput-object v0, Landroidx/slice/widget/SliceActionView;->CHECKED_STATE_SET:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroidx/slice/widget/RowStyle;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "style",
            "rowStyle"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f070048

    .line 3
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Landroidx/slice/widget/SliceActionView;->mIconSize:I

    const v0, 0x7f070057

    .line 4
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Landroidx/slice/widget/SliceActionView;->mImageSize:I

    const/4 p1, 0x0

    .line 5
    iput p1, p0, Landroidx/slice/widget/SliceActionView;->mTextActionPadding:I

    if-eqz p2, :cond_0

    .line 6
    iget p1, p2, Landroidx/slice/widget/RowStyle;->mIconSize:I

    .line 7
    iput p1, p0, Landroidx/slice/widget/SliceActionView;->mIconSize:I

    .line 8
    iget p1, p2, Landroidx/slice/widget/RowStyle;->mImageSize:I

    .line 9
    iput p1, p0, Landroidx/slice/widget/SliceActionView;->mImageSize:I

    .line 10
    iget p1, p2, Landroidx/slice/widget/RowStyle;->mTextActionPadding:I

    .line 11
    iput p1, p0, Landroidx/slice/widget/SliceActionView;->mTextActionPadding:I

    :cond_0
    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "buttonView",
            "isChecked"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Landroidx/slice/widget/SliceActionView;->mSliceAction:Landroidx/slice/core/SliceActionImpl;

    if-eqz p1, :cond_1

    iget-object p1, p0, Landroidx/slice/widget/SliceActionView;->mActionView:Landroid/view/View;

    if-nez p1, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    invoke-virtual {p0}, Landroidx/slice/widget/SliceActionView;->sendActionInternal()V

    :cond_1
    :goto_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "v"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Landroidx/slice/widget/SliceActionView;->mSliceAction:Landroidx/slice/core/SliceActionImpl;

    if-eqz p1, :cond_1

    iget-object p1, p0, Landroidx/slice/widget/SliceActionView;->mActionView:Landroid/view/View;

    if-nez p1, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    invoke-virtual {p0}, Landroidx/slice/widget/SliceActionView;->sendActionInternal()V

    :cond_1
    :goto_0
    return-void
.end method

.method public final sendActionInternal()V
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/SliceActionView;->mSliceAction:Landroidx/slice/core/SliceActionImpl;

    if-eqz v0, :cond_6

    .line 2
    iget-object v1, v0, Landroidx/slice/core/SliceActionImpl;->mActionItem:Landroidx/slice/SliceItem;

    if-nez v1, :cond_0

    goto/16 :goto_2

    :cond_0
    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 3
    :try_start_0
    invoke-virtual {v0}, Landroidx/slice/core/SliceActionImpl;->isToggle()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 4
    iget-object v0, p0, Landroidx/slice/widget/SliceActionView;->mActionView:Landroid/view/View;

    check-cast v0, Landroid/widget/Checkable;

    invoke-interface {v0}, Landroid/widget/Checkable;->isChecked()Z

    move-result v0

    .line 5
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const/high16 v3, 0x10000000

    .line 6
    invoke-virtual {v1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v1

    const-string v3, "android.app.slice.extra.TOGGLE_STATE"

    .line 7
    invoke-virtual {v1, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v1

    .line 8
    iget-object v3, p0, Landroidx/slice/widget/SliceActionView;->mEventInfo:Landroidx/slice/widget/EventInfo;

    if-eqz v3, :cond_2

    if-eqz v0, :cond_1

    move v0, v2

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 9
    :goto_0
    iput v0, v3, Landroidx/slice/widget/EventInfo;->state:I

    .line 10
    :cond_2
    iget-object v0, p0, Landroidx/slice/widget/SliceActionView;->mSliceAction:Landroidx/slice/core/SliceActionImpl;

    .line 11
    iget-object v0, v0, Landroidx/slice/core/SliceActionImpl;->mActionItem:Landroidx/slice/SliceItem;

    .line 12
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v0, v3, v1}, Landroidx/slice/SliceItem;->fireActionInternal(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 13
    invoke-virtual {p0, v2}, Landroidx/slice/widget/SliceActionView;->setLoading(Z)V

    .line 14
    iget-object v0, p0, Landroidx/slice/widget/SliceActionView;->mLoadingListener:Landroidx/slice/widget/SliceActionView$SliceActionLoadingListener;

    if-eqz v0, :cond_4

    .line 15
    iget-object v1, p0, Landroidx/slice/widget/SliceActionView;->mEventInfo:Landroidx/slice/widget/EventInfo;

    if-eqz v1, :cond_3

    iget v1, v1, Landroidx/slice/widget/EventInfo;->rowIndex:I

    goto :goto_1

    :cond_3
    const/4 v1, -0x1

    .line 16
    :goto_1
    iget-object v3, p0, Landroidx/slice/widget/SliceActionView;->mSliceAction:Landroidx/slice/core/SliceActionImpl;

    .line 17
    iget-object v3, v3, Landroidx/slice/core/SliceActionImpl;->mSliceItem:Landroidx/slice/SliceItem;

    .line 18
    check-cast v0, Landroidx/slice/widget/SliceAdapter;

    invoke-virtual {v0, v3, v1}, Landroidx/slice/widget/SliceAdapter;->onSliceActionLoading(Landroidx/slice/SliceItem;I)V

    .line 19
    :cond_4
    iget-object v0, p0, Landroidx/slice/widget/SliceActionView;->mObserver:Landroidx/slice/widget/SliceView$OnSliceActionListener;

    if-eqz v0, :cond_6

    iget-object v1, p0, Landroidx/slice/widget/SliceActionView;->mEventInfo:Landroidx/slice/widget/EventInfo;

    if-eqz v1, :cond_6

    .line 20
    iget-object v3, p0, Landroidx/slice/widget/SliceActionView;->mSliceAction:Landroidx/slice/core/SliceActionImpl;

    .line 21
    iget-object v3, v3, Landroidx/slice/core/SliceActionImpl;->mSliceItem:Landroidx/slice/SliceItem;

    .line 22
    invoke-interface {v0, v1, v3}, Landroidx/slice/widget/SliceView$OnSliceActionListener;->onSliceAction(Landroidx/slice/widget/EventInfo;Landroidx/slice/SliceItem;)V
    :try_end_0
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    .line 23
    iget-object p0, p0, Landroidx/slice/widget/SliceActionView;->mActionView:Landroid/view/View;

    instance-of v1, p0, Landroid/widget/Checkable;

    if-eqz v1, :cond_5

    .line 24
    move-object v1, p0

    check-cast v1, Landroid/widget/Checkable;

    invoke-interface {v1}, Landroid/widget/Checkable;->isChecked()Z

    move-result v1

    xor-int/2addr v1, v2

    invoke-virtual {p0, v1}, Landroid/view/View;->setSelected(Z)V

    :cond_5
    const-string p0, "SliceActionView"

    const-string v1, "PendingIntent for slice cannot be sent"

    .line 25
    invoke-static {p0, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_6
    :goto_2
    return-void
.end method

.method public setAction(Landroidx/slice/core/SliceActionImpl;Landroidx/slice/widget/EventInfo;Landroidx/slice/widget/SliceView$OnSliceActionListener;ILandroidx/slice/widget/SliceActionView$SliceActionLoadingListener;)V
    .locals 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "action",
            "info",
            "listener",
            "color",
            "loadingListener"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/SliceActionView;->mActionView:Landroid/view/View;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 3
    iput-object v1, p0, Landroidx/slice/widget/SliceActionView;->mActionView:Landroid/view/View;

    .line 4
    :cond_0
    iget-object v0, p0, Landroidx/slice/widget/SliceActionView;->mProgressView:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_1

    .line 5
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 6
    iput-object v1, p0, Landroidx/slice/widget/SliceActionView;->mProgressView:Landroid/widget/ProgressBar;

    .line 7
    :cond_1
    iput-object p1, p0, Landroidx/slice/widget/SliceActionView;->mSliceAction:Landroidx/slice/core/SliceActionImpl;

    .line 8
    iput-object p2, p0, Landroidx/slice/widget/SliceActionView;->mEventInfo:Landroidx/slice/widget/EventInfo;

    .line 9
    iput-object p3, p0, Landroidx/slice/widget/SliceActionView;->mObserver:Landroidx/slice/widget/SliceView$OnSliceActionListener;

    .line 10
    iput-object v1, p0, Landroidx/slice/widget/SliceActionView;->mActionView:Landroid/view/View;

    .line 11
    iput-object p5, p0, Landroidx/slice/widget/SliceActionView;->mLoadingListener:Landroidx/slice/widget/SliceActionView$SliceActionLoadingListener;

    .line 12
    iget p2, p1, Landroidx/slice/core/SliceActionImpl;->mActionType:I

    const/4 p3, 0x1

    const/4 p5, 0x0

    const/4 v0, 0x2

    if-ne p2, v0, :cond_2

    iget-object p2, p1, Landroidx/slice/core/SliceActionImpl;->mIcon:Landroidx/core/graphics/drawable/IconCompat;

    if-nez p2, :cond_2

    move p2, p3

    goto :goto_0

    :cond_2
    move p2, p5

    :goto_0
    const/4 v1, -0x1

    if-eqz p2, :cond_5

    .line 13
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v2, 0x7f0d002c

    invoke-virtual {p2, v2, p0, p5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Switch;

    .line 14
    iget-boolean v2, p1, Landroidx/slice/core/SliceActionImpl;->mIsChecked:Z

    .line 15
    invoke-virtual {p2, v2}, Landroid/widget/Switch;->setChecked(Z)V

    .line 16
    invoke-virtual {p2, p0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 17
    iget v2, p0, Landroidx/slice/widget/SliceActionView;->mImageSize:I

    invoke-virtual {p2, v2}, Landroid/widget/Switch;->setMinimumHeight(I)V

    .line 18
    iget v2, p0, Landroidx/slice/widget/SliceActionView;->mImageSize:I

    invoke-virtual {p2, v2}, Landroid/widget/Switch;->setMinimumWidth(I)V

    .line 19
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    if-eq p4, v1, :cond_4

    .line 20
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x1010030

    invoke-static {v1, v2}, Landroidx/slice/widget/SliceViewUtil;->getColorAttr(Landroid/content/Context;I)I

    move-result v1

    .line 21
    new-instance v2, Landroid/content/res/ColorStateList;

    new-array v3, v0, [[I

    sget-object v4, Landroidx/slice/widget/SliceActionView;->CHECKED_STATE_SET:[I

    aput-object v4, v3, p5

    sget-object v5, Landroid/widget/FrameLayout;->EMPTY_STATE_SET:[I

    aput-object v5, v3, p3

    new-array v6, v0, [I

    aput p4, v6, p5

    aput v1, v6, p3

    invoke-direct {v2, v3, v6}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    .line 22
    invoke-virtual {p2}, Landroid/widget/Switch;->getTrackDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 23
    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    .line 24
    invoke-virtual {p2, v1}, Landroid/widget/Switch;->setTrackDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 25
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0400d6

    invoke-static {v1, v2}, Landroidx/slice/widget/SliceViewUtil;->getColorAttr(Landroid/content/Context;I)I

    move-result v1

    if-nez v1, :cond_3

    .line 26
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f06010a

    sget-object v3, Landroidx/core/content/ContextCompat;->sLock:Ljava/lang/Object;

    .line 27
    invoke-virtual {v1, v2}, Landroid/content/Context;->getColor(I)I

    move-result v1

    .line 28
    :cond_3
    new-instance v2, Landroid/content/res/ColorStateList;

    new-array v3, v0, [[I

    aput-object v4, v3, p5

    aput-object v5, v3, p3

    new-array v0, v0, [I

    aput p4, v0, p5

    aput v1, v0, p3

    invoke-direct {v2, v3, v0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    .line 29
    invoke-virtual {p2}, Landroid/widget/Switch;->getThumbDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p3

    .line 30
    invoke-virtual {p3, v2}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    .line 31
    invoke-virtual {p2, p3}, Landroid/widget/Switch;->setThumbDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 32
    :cond_4
    iput-object p2, p0, Landroidx/slice/widget/SliceActionView;->mActionView:Landroid/view/View;

    goto/16 :goto_3

    .line 33
    :cond_5
    iget p2, p1, Landroidx/slice/core/SliceActionImpl;->mImageMode:I

    const/4 p3, 0x6

    if-ne p2, p3, :cond_6

    .line 34
    new-instance p2, Landroid/widget/Button;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-direct {p2, p3}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 35
    iput-object p2, p0, Landroidx/slice/widget/SliceActionView;->mActionView:Landroid/view/View;

    .line 36
    iget-object p3, p1, Landroidx/slice/core/SliceActionImpl;->mTitle:Ljava/lang/CharSequence;

    .line 37
    invoke-virtual {p2, p3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 38
    iget-object p2, p0, Landroidx/slice/widget/SliceActionView;->mActionView:Landroid/view/View;

    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 39
    iget-object p2, p0, Landroidx/slice/widget/SliceActionView;->mActionView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    check-cast p2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 p3, -0x2

    .line 40
    iput p3, p2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 41
    iput p3, p2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 42
    iget-object p3, p0, Landroidx/slice/widget/SliceActionView;->mActionView:Landroid/view/View;

    invoke-virtual {p3, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 43
    iget p2, p0, Landroidx/slice/widget/SliceActionView;->mTextActionPadding:I

    .line 44
    iget-object p3, p0, Landroidx/slice/widget/SliceActionView;->mActionView:Landroid/view/View;

    invoke-virtual {p3, p2, p2, p2, p2}, Landroid/view/View;->setPadding(IIII)V

    .line 45
    iget-object p2, p0, Landroidx/slice/widget/SliceActionView;->mActionView:Landroid/view/View;

    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_3

    .line 46
    :cond_6
    iget-object p2, p1, Landroidx/slice/core/SliceActionImpl;->mIcon:Landroidx/core/graphics/drawable/IconCompat;

    if-eqz p2, :cond_b

    .line 47
    invoke-virtual {p1}, Landroidx/slice/core/SliceActionImpl;->isToggle()Z

    move-result p2

    if-eqz p2, :cond_7

    .line 48
    new-instance p2, Landroidx/slice/widget/SliceActionView$ImageToggle;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-direct {p2, p3}, Landroidx/slice/widget/SliceActionView$ImageToggle;-><init>(Landroid/content/Context;)V

    .line 49
    iget-boolean p3, p1, Landroidx/slice/core/SliceActionImpl;->mIsChecked:Z

    .line 50
    invoke-virtual {p2, p3}, Landroidx/slice/widget/SliceActionView$ImageToggle;->setChecked(Z)V

    .line 51
    iput-object p2, p0, Landroidx/slice/widget/SliceActionView;->mActionView:Landroid/view/View;

    goto :goto_1

    .line 52
    :cond_7
    new-instance p2, Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-direct {p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Landroidx/slice/widget/SliceActionView;->mActionView:Landroid/view/View;

    .line 53
    :goto_1
    iget-object p2, p0, Landroidx/slice/widget/SliceActionView;->mActionView:Landroid/view/View;

    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 54
    iget-object p2, p0, Landroidx/slice/widget/SliceActionView;->mSliceAction:Landroidx/slice/core/SliceActionImpl;

    .line 55
    iget-object p2, p2, Landroidx/slice/core/SliceActionImpl;->mIcon:Landroidx/core/graphics/drawable/IconCompat;

    .line 56
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroidx/core/graphics/drawable/IconCompat;->loadDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    .line 57
    iget-object p3, p0, Landroidx/slice/widget/SliceActionView;->mActionView:Landroid/view/View;

    check-cast p3, Landroid/widget/ImageView;

    invoke-virtual {p3, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    if-eq p4, v1, :cond_8

    .line 58
    iget-object p3, p0, Landroidx/slice/widget/SliceActionView;->mSliceAction:Landroidx/slice/core/SliceActionImpl;

    .line 59
    iget p3, p3, Landroidx/slice/core/SliceActionImpl;->mImageMode:I

    if-nez p3, :cond_8

    if-eqz p2, :cond_8

    .line 60
    invoke-virtual {p2, p4}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 61
    :cond_8
    iget-object p2, p0, Landroidx/slice/widget/SliceActionView;->mActionView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    check-cast p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 62
    iget p3, p0, Landroidx/slice/widget/SliceActionView;->mImageSize:I

    iput p3, p2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 63
    iput p3, p2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 64
    iget-object p3, p0, Landroidx/slice/widget/SliceActionView;->mActionView:Landroid/view/View;

    invoke-virtual {p3, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 65
    iget p2, p1, Landroidx/slice/core/SliceActionImpl;->mImageMode:I

    if-nez p2, :cond_a

    .line 66
    iget p2, p0, Landroidx/slice/widget/SliceActionView;->mImageSize:I

    if-ne p2, v1, :cond_9

    .line 67
    iget p2, p0, Landroidx/slice/widget/SliceActionView;->mIconSize:I

    goto :goto_2

    :cond_9
    iget p3, p0, Landroidx/slice/widget/SliceActionView;->mIconSize:I

    sub-int/2addr p2, p3

    :goto_2
    div-int/lit8 p5, p2, 0x2

    .line 68
    :cond_a
    iget-object p2, p0, Landroidx/slice/widget/SliceActionView;->mActionView:Landroid/view/View;

    invoke-virtual {p2, p5, p5, p5, p5}, Landroid/view/View;->setPadding(IIII)V

    const p2, 0x101045c

    .line 69
    iget-object p3, p0, Landroidx/slice/widget/SliceActionView;->mActionView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p4

    invoke-static {p4, p2}, Landroidx/slice/widget/SliceViewUtil;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p3, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 70
    iget-object p2, p0, Landroidx/slice/widget/SliceActionView;->mActionView:Landroid/view/View;

    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 71
    :cond_b
    :goto_3
    iget-object p0, p0, Landroidx/slice/widget/SliceActionView;->mActionView:Landroid/view/View;

    if-eqz p0, :cond_d

    .line 72
    iget-object p2, p1, Landroidx/slice/core/SliceActionImpl;->mContentDescription:Ljava/lang/CharSequence;

    if-eqz p2, :cond_c

    goto :goto_4

    .line 73
    :cond_c
    iget-object p2, p1, Landroidx/slice/core/SliceActionImpl;->mTitle:Ljava/lang/CharSequence;

    .line 74
    :goto_4
    invoke-virtual {p0, p2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_d
    return-void
.end method

.method public setLoading(Z)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "isLoading"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 1
    iget-object v1, p0, Landroidx/slice/widget/SliceActionView;->mProgressView:Landroid/widget/ProgressBar;

    if-nez v1, :cond_0

    .line 2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0d0023

    invoke-virtual {v1, v2, p0, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    iput-object v1, p0, Landroidx/slice/widget/SliceActionView;->mProgressView:Landroid/widget/ProgressBar;

    .line 3
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 4
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Landroidx/slice/widget/SliceActionView;->mProgressView:Landroid/widget/ProgressBar;

    invoke-static {v1, v2}, Landroidx/slice/widget/SliceViewUtil;->tintIndeterminateProgressBar(Landroid/content/Context;Landroid/widget/ProgressBar;)V

    .line 5
    :cond_1
    iget-object v1, p0, Landroidx/slice/widget/SliceActionView;->mActionView:Landroid/view/View;

    const/16 v2, 0x8

    if-eqz p1, :cond_2

    move v3, v2

    goto :goto_0

    :cond_2
    move v3, v0

    :goto_0
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 6
    iget-object p0, p0, Landroidx/slice/widget/SliceActionView;->mProgressView:Landroid/widget/ProgressBar;

    if-eqz p1, :cond_3

    goto :goto_1

    :cond_3
    move v0, v2

    :goto_1
    invoke-virtual {p0, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    return-void
.end method
