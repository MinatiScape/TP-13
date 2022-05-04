.class public Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate;
.super Lcom/google/android/material/textfield/EndIconDelegate;
.source "SourceFile"


# instance fields
.field public final onEditTextAttachedListener:Lcom/google/android/material/textfield/TextInputLayout$OnEditTextAttachedListener;

.field public final onEndIconChangedListener:Lcom/google/android/material/textfield/TextInputLayout$OnEndIconChangedListener;

.field public final textWatcher:Landroid/text/TextWatcher;


# direct methods
.method public constructor <init>(Lcom/google/android/material/textfield/TextInputLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/google/android/material/textfield/EndIconDelegate;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    .line 2
    new-instance p1, Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate$1;

    invoke-direct {p1, p0}, Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate$1;-><init>(Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate;)V

    iput-object p1, p0, Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate;->textWatcher:Landroid/text/TextWatcher;

    .line 3
    new-instance p1, Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate$2;

    invoke-direct {p1, p0}, Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate$2;-><init>(Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate;)V

    iput-object p1, p0, Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate;->onEditTextAttachedListener:Lcom/google/android/material/textfield/TextInputLayout$OnEditTextAttachedListener;

    .line 4
    new-instance p1, Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate$3;

    invoke-direct {p1, p0}, Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate$3;-><init>(Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate;)V

    iput-object p1, p0, Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate;->onEndIconChangedListener:Lcom/google/android/material/textfield/TextInputLayout$OnEndIconChangedListener;

    return-void
.end method

.method public static access$000(Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/textfield/EndIconDelegate;->textInputLayout:Lcom/google/android/material/textfield/TextInputLayout;

    .line 2
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-eqz p0, :cond_0

    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->getTransformationMethod()Landroid/text/method/TransformationMethod;

    move-result-object p0

    instance-of p0, p0, Landroid/text/method/PasswordTransformationMethod;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method


# virtual methods
.method public initialize()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/EndIconDelegate;->textInputLayout:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v1, p0, Lcom/google/android/material/textfield/EndIconDelegate;->context:Landroid/content/Context;

    const v2, 0x7f080092

    .line 2
    invoke-static {v1, v2}, Landroidx/appcompat/content/res/AppCompatResources;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 3
    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 4
    iget-object v0, p0, Lcom/google/android/material/textfield/EndIconDelegate;->textInputLayout:Lcom/google/android/material/textfield/TextInputLayout;

    .line 5
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f1100f9

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    .line 6
    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconContentDescription(Ljava/lang/CharSequence;)V

    .line 7
    iget-object v0, p0, Lcom/google/android/material/textfield/EndIconDelegate;->textInputLayout:Lcom/google/android/material/textfield/TextInputLayout;

    new-instance v1, Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate$4;

    invoke-direct {v1, p0}, Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate$4;-><init>(Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate;)V

    .line 8
    iget-object v2, v0, Lcom/google/android/material/textfield/TextInputLayout;->endIconView:Lcom/google/android/material/internal/CheckableImageButton;

    iget-object v0, v0, Lcom/google/android/material/textfield/TextInputLayout;->endIconOnLongClickListener:Landroid/view/View$OnLongClickListener;

    .line 9
    invoke-virtual {v2, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 10
    invoke-static {v2, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setIconClickable(Lcom/google/android/material/internal/CheckableImageButton;Landroid/view/View$OnLongClickListener;)V

    .line 11
    iget-object v0, p0, Lcom/google/android/material/textfield/EndIconDelegate;->textInputLayout:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v1, p0, Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate;->onEditTextAttachedListener:Lcom/google/android/material/textfield/TextInputLayout$OnEditTextAttachedListener;

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->addOnEditTextAttachedListener(Lcom/google/android/material/textfield/TextInputLayout$OnEditTextAttachedListener;)V

    .line 12
    iget-object v0, p0, Lcom/google/android/material/textfield/EndIconDelegate;->textInputLayout:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v1, p0, Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate;->onEndIconChangedListener:Lcom/google/android/material/textfield/TextInputLayout$OnEndIconChangedListener;

    .line 13
    iget-object v0, v0, Lcom/google/android/material/textfield/TextInputLayout;->endIconChangedListeners:Ljava/util/LinkedHashSet;

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 14
    iget-object p0, p0, Lcom/google/android/material/textfield/EndIconDelegate;->textInputLayout:Lcom/google/android/material/textfield/TextInputLayout;

    .line 15
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-eqz p0, :cond_1

    .line 16
    invoke-virtual {p0}, Landroid/widget/EditText;->getInputType()I

    move-result v0

    const/16 v1, 0x10

    if-eq v0, v1, :cond_0

    .line 17
    invoke-virtual {p0}, Landroid/widget/EditText;->getInputType()I

    move-result v0

    const/16 v1, 0x80

    if-eq v0, v1, :cond_0

    .line 18
    invoke-virtual {p0}, Landroid/widget/EditText;->getInputType()I

    move-result v0

    const/16 v1, 0x90

    if-eq v0, v1, :cond_0

    .line 19
    invoke-virtual {p0}, Landroid/widget/EditText;->getInputType()I

    move-result v0

    const/16 v1, 0xe0

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_2

    .line 20
    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    :cond_2
    return-void
.end method
