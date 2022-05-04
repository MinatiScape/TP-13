.class public Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/appcompat/widget/AppCompatSpinner$SpinnerPopup;
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/widget/AppCompatSpinner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DialogPopup"
.end annotation


# instance fields
.field public mListAdapter:Landroid/widget/ListAdapter;

.field public mPopup:Landroidx/appcompat/app/AlertDialog;

.field public mPrompt:Ljava/lang/CharSequence;

.field public final synthetic this$0:Landroidx/appcompat/widget/AppCompatSpinner;


# direct methods
.method public constructor <init>(Landroidx/appcompat/widget/AppCompatSpinner;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->this$0:Landroidx/appcompat/widget/AppCompatSpinner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->mPopup:Landroidx/appcompat/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatDialog;->dismiss()V

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->mPopup:Landroidx/appcompat/app/AlertDialog;

    :cond_0
    return-void
.end method

.method public getBackground()Landroid/graphics/drawable/Drawable;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getHintText()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->mPrompt:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public getHorizontalOffset()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getVerticalOffset()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isShowing()Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->mPopup:Landroidx/appcompat/app/AlertDialog;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    move-result p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 1
    iget-object p1, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->this$0:Landroidx/appcompat/widget/AppCompatSpinner;

    invoke-virtual {p1, p2}, Landroid/widget/Spinner;->setSelection(I)V

    .line 2
    iget-object p1, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->this$0:Landroidx/appcompat/widget/AppCompatSpinner;

    invoke-virtual {p1}, Landroid/widget/Spinner;->getOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 3
    iget-object p1, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->this$0:Landroidx/appcompat/widget/AppCompatSpinner;

    iget-object v1, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->mListAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v1, p2}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v1

    invoke-virtual {p1, v0, p2, v1, v2}, Landroid/widget/Spinner;->performItemClick(Landroid/view/View;IJ)Z

    .line 4
    :cond_0
    iget-object p1, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->mPopup:Landroidx/appcompat/app/AlertDialog;

    if-eqz p1, :cond_1

    .line 5
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatDialog;->dismiss()V

    .line 6
    iput-object v0, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->mPopup:Landroidx/appcompat/app/AlertDialog;

    :cond_1
    return-void
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->mListAdapter:Landroid/widget/ListAdapter;

    return-void
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    const-string p0, "AppCompatSpinner"

    const-string p1, "Cannot set popup background for MODE_DIALOG, ignoring"

    .line 1
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public setHorizontalOffset(I)V
    .locals 0

    const-string p0, "AppCompatSpinner"

    const-string p1, "Cannot set horizontal offset for MODE_DIALOG, ignoring"

    .line 1
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public setHorizontalOriginalOffset(I)V
    .locals 0

    const-string p0, "AppCompatSpinner"

    const-string p1, "Cannot set horizontal (original) offset for MODE_DIALOG, ignoring"

    .line 1
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public setPromptText(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->mPrompt:Ljava/lang/CharSequence;

    return-void
.end method

.method public setVerticalOffset(I)V
    .locals 0

    const-string p0, "AppCompatSpinner"

    const-string p1, "Cannot set vertical offset for MODE_DIALOG, ignoring"

    .line 1
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public show(II)V
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->mListAdapter:Landroid/widget/ListAdapter;

    if-nez v0, :cond_0

    return-void

    .line 2
    :cond_0
    new-instance v0, Landroidx/appcompat/app/AlertDialog$Builder;

    iget-object v1, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->this$0:Landroidx/appcompat/widget/AppCompatSpinner;

    .line 3
    iget-object v1, v1, Landroidx/appcompat/widget/AppCompatSpinner;->mPopupContext:Landroid/content/Context;

    .line 4
    invoke-direct {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 5
    iget-object v1, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->mPrompt:Ljava/lang/CharSequence;

    if-eqz v1, :cond_1

    .line 6
    iget-object v2, v0, Landroidx/appcompat/app/AlertDialog$Builder;->P:Landroidx/appcompat/app/AlertController$AlertParams;

    iput-object v1, v2, Landroidx/appcompat/app/AlertController$AlertParams;->mTitle:Ljava/lang/CharSequence;

    .line 7
    :cond_1
    iget-object v1, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->mListAdapter:Landroid/widget/ListAdapter;

    iget-object v2, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->this$0:Landroidx/appcompat/widget/AppCompatSpinner;

    .line 8
    invoke-virtual {v2}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v2

    .line 9
    iget-object v3, v0, Landroidx/appcompat/app/AlertDialog$Builder;->P:Landroidx/appcompat/app/AlertController$AlertParams;

    iput-object v1, v3, Landroidx/appcompat/app/AlertController$AlertParams;->mAdapter:Landroid/widget/ListAdapter;

    .line 10
    iput-object p0, v3, Landroidx/appcompat/app/AlertController$AlertParams;->mOnClickListener:Landroid/content/DialogInterface$OnClickListener;

    .line 11
    iput v2, v3, Landroidx/appcompat/app/AlertController$AlertParams;->mCheckedItem:I

    const/4 v1, 0x1

    .line 12
    iput-boolean v1, v3, Landroidx/appcompat/app/AlertController$AlertParams;->mIsSingleChoice:Z

    .line 13
    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->mPopup:Landroidx/appcompat/app/AlertDialog;

    .line 14
    iget-object v0, v0, Landroidx/appcompat/app/AlertDialog;->mAlert:Landroidx/appcompat/app/AlertController;

    .line 15
    iget-object v0, v0, Landroidx/appcompat/app/AlertController;->mListView:Landroid/widget/ListView;

    .line 16
    invoke-virtual {v0, p1}, Landroid/widget/ListView;->setTextDirection(I)V

    .line 17
    invoke-virtual {v0, p2}, Landroid/widget/ListView;->setTextAlignment(I)V

    .line 18
    iget-object p0, p0, Landroidx/appcompat/widget/AppCompatSpinner$DialogPopup;->mPopup:Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    return-void
.end method
