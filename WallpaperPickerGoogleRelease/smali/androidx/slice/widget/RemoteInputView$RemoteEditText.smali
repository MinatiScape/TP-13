.class public Landroidx/slice/widget/RemoteInputView$RemoteEditText;
.super Landroid/widget/EditText;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/slice/widget/RemoteInputView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RemoteEditText"
.end annotation


# instance fields
.field public final mBackground:Landroid/graphics/drawable/Drawable;

.field public mRemoteInputView:Landroidx/slice/widget/RemoteInputView;

.field public mShowImeOnInputConnection:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "attrs"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    invoke-virtual {p0}, Landroid/widget/EditText;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Landroidx/slice/widget/RemoteInputView$RemoteEditText;->mBackground:Landroid/graphics/drawable/Drawable;

    return-void
.end method


# virtual methods
.method public final defocusIfNeeded()V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/RemoteInputView$RemoteEditText;->mRemoteInputView:Landroidx/slice/widget/RemoteInputView;

    if-nez v0, :cond_3

    .line 2
    invoke-virtual {p0}, Landroid/widget/EditText;->isTemporarilyDetached()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 3
    :cond_0
    invoke-virtual {p0}, Landroid/widget/EditText;->isFocusable()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Landroid/widget/EditText;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroidx/slice/widget/RemoteInputView$RemoteEditText;->setInnerFocusable(Z)V

    .line 5
    iget-object v1, p0, Landroidx/slice/widget/RemoteInputView$RemoteEditText;->mRemoteInputView:Landroidx/slice/widget/RemoteInputView;

    if-eqz v1, :cond_1

    const/4 v2, 0x4

    .line 6
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 7
    :cond_1
    iput-boolean v0, p0, Landroidx/slice/widget/RemoteInputView$RemoteEditText;->mShowImeOnInputConnection:Z

    :cond_2
    return-void

    .line 8
    :cond_3
    :goto_0
    invoke-virtual {p0}, Landroid/widget/EditText;->isTemporarilyDetached()Z

    return-void
.end method

.method public getFocusedRect(Landroid/graphics/Rect;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "r"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Landroid/widget/TextView;->getFocusedRect(Landroid/graphics/Rect;)V

    .line 2
    invoke-virtual {p0}, Landroid/widget/EditText;->getScrollY()I

    move-result v0

    iput v0, p1, Landroid/graphics/Rect;->top:I

    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->getScrollY()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/EditText;->getBottom()I

    move-result v1

    invoke-virtual {p0}, Landroid/widget/EditText;->getTop()I

    move-result p0

    sub-int/2addr v1, p0

    add-int/2addr v1, v0

    iput v1, p1, Landroid/graphics/Rect;->bottom:I

    return-void
.end method

.method public onCommitCompletion(Landroid/view/inputmethod/CompletionInfo;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "text"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/widget/EditText;->clearComposingText()V

    .line 2
    invoke-virtual {p1}, Landroid/view/inputmethod/CompletionInfo;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setSelection(I)V

    return-void
.end method

.method public onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "outAttrs"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Landroid/widget/TextView;->onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;

    move-result-object p1

    .line 2
    iget-boolean v0, p0, Landroidx/slice/widget/RemoteInputView$RemoteEditText;->mShowImeOnInputConnection:Z

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->getContext()Landroid/content/Context;

    move-result-object v0

    const-class v1, Landroid/view/inputmethod/InputMethodManager;

    sget-object v2, Landroidx/core/content/ContextCompat;->sLock:Ljava/lang/Object;

    .line 4
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    .line 5
    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    if-eqz v0, :cond_0

    .line 6
    new-instance v1, Landroidx/slice/widget/RemoteInputView$RemoteEditText$1;

    invoke-direct {v1, p0, v0}, Landroidx/slice/widget/RemoteInputView$RemoteEditText$1;-><init>(Landroidx/slice/widget/RemoteInputView$RemoteEditText;Landroid/view/inputmethod/InputMethodManager;)V

    invoke-virtual {p0, v1}, Landroid/widget/EditText;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-object p1
.end method

.method public onFocusChanged(ZILandroid/graphics/Rect;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "focused",
            "direction",
            "previouslyFocusedRect"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/widget/TextView;->onFocusChanged(ZILandroid/graphics/Rect;)V

    if-nez p1, :cond_0

    .line 2
    invoke-virtual {p0}, Landroidx/slice/widget/RemoteInputView$RemoteEditText;->defocusIfNeeded()V

    :cond_0
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "keyCode",
            "event"
        }
    .end annotation

    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    const/4 p0, 0x1

    return p0

    .line 1
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "keyCode",
            "event"
        }
    .end annotation

    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 1
    invoke-virtual {p0}, Landroidx/slice/widget/RemoteInputView$RemoteEditText;->defocusIfNeeded()V

    const/4 p0, 0x1

    return p0

    .line 2
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public onVisibilityChanged(Landroid/view/View;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "changedView",
            "visibility"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->onVisibilityChanged(Landroid/view/View;I)V

    .line 2
    invoke-virtual {p0}, Landroid/widget/EditText;->isShown()Z

    move-result p1

    if-nez p1, :cond_0

    .line 3
    invoke-virtual {p0}, Landroidx/slice/widget/RemoteInputView$RemoteEditText;->defocusIfNeeded()V

    :cond_0
    return-void
.end method

.method public setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "actionModeCallback"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Landroid/widget/TextView;->setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V

    return-void
.end method

.method public setInnerFocusable(Z)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "focusable"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setFocusableInTouchMode(Z)V

    .line 2
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setFocusable(Z)V

    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setCursorVisible(Z)V

    if-eqz p1, :cond_0

    .line 4
    invoke-virtual {p0}, Landroid/widget/EditText;->requestFocus()Z

    .line 5
    iget-object p1, p0, Landroidx/slice/widget/RemoteInputView$RemoteEditText;->mBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :goto_0
    return-void
.end method
