.class public Landroidx/slice/widget/SliceActionView$ImageToggle;
.super Landroid/widget/ImageView;
.source "SourceFile"

# interfaces
.implements Landroid/widget/Checkable;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/slice/widget/SliceActionView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ImageToggle"
.end annotation


# instance fields
.field public mIsChecked:Z

.field public mListener:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "context"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 2
    invoke-super {p0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public isChecked()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/slice/widget/SliceActionView$ImageToggle;->mIsChecked:Z

    return p0
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
    invoke-virtual {p0}, Landroidx/slice/widget/SliceActionView$ImageToggle;->toggle()V

    return-void
.end method

.method public onCreateDrawableState(I)[I
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "extraSpace"
        }
    .end annotation

    add-int/lit8 p1, p1, 0x1

    .line 1
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onCreateDrawableState(I)[I

    move-result-object p1

    .line 2
    iget-boolean p0, p0, Landroidx/slice/widget/SliceActionView$ImageToggle;->mIsChecked:Z

    if-eqz p0, :cond_0

    .line 3
    sget-object p0, Landroidx/slice/widget/SliceActionView;->CHECKED_STATE_SET:[I

    invoke-static {p1, p0}, Landroid/widget/ImageView;->mergeDrawableStates([I[I)[I

    :cond_0
    return-object p1
.end method

.method public setChecked(Z)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "checked"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Landroidx/slice/widget/SliceActionView$ImageToggle;->mIsChecked:Z

    if-eq v0, p1, :cond_0

    .line 2
    iput-boolean p1, p0, Landroidx/slice/widget/SliceActionView$ImageToggle;->mIsChecked:Z

    .line 3
    invoke-virtual {p0}, Landroid/widget/ImageView;->refreshDrawableState()V

    .line 4
    iget-object p1, p0, Landroidx/slice/widget/SliceActionView$ImageToggle;->mListener:Landroid/view/View$OnClickListener;

    if-eqz p1, :cond_0

    .line 5
    invoke-interface {p1, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "listener"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Landroidx/slice/widget/SliceActionView$ImageToggle;->mListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public toggle()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Landroidx/slice/widget/SliceActionView$ImageToggle;->mIsChecked:Z

    xor-int/lit8 v0, v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroidx/slice/widget/SliceActionView$ImageToggle;->setChecked(Z)V

    return-void
.end method
