.class public Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate;->initialize()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate;


# direct methods
.method public constructor <init>(Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate$4;->this$0:Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate$4;->this$0:Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate;

    iget-object p1, p1, Lcom/google/android/material/textfield/EndIconDelegate;->textInputLayout:Lcom/google/android/material/textfield/TextInputLayout;

    .line 2
    iget-object p1, p1, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    if-nez p1, :cond_0

    return-void

    .line 3
    :cond_0
    invoke-virtual {p1}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v0

    .line 4
    iget-object v1, p0, Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate$4;->this$0:Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate;

    invoke-static {v1}, Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate;->access$000(Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    .line 5
    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    goto :goto_0

    .line 6
    :cond_1
    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    :goto_0
    if-ltz v0, :cond_2

    .line 7
    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setSelection(I)V

    .line 8
    :cond_2
    iget-object p0, p0, Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate$4;->this$0:Lcom/google/android/material/textfield/PasswordToggleEndIconDelegate;

    iget-object p0, p0, Lcom/google/android/material/textfield/EndIconDelegate;->textInputLayout:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->refreshEndIconDrawableState()V

    return-void
.end method
