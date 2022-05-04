.class public Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;->initialize()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;


# direct methods
.method public constructor <init>(Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate$6;->this$0:Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate$6;->this$0:Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;

    iget-object p1, p0, Lcom/google/android/material/textfield/EndIconDelegate;->textInputLayout:Lcom/google/android/material/textfield/TextInputLayout;

    .line 2
    iget-object p1, p1, Lcom/google/android/material/textfield/TextInputLayout;->editText:Landroid/widget/EditText;

    .line 3
    check-cast p1, Landroid/widget/AutoCompleteTextView;

    .line 4
    invoke-static {p0, p1}, Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;->access$500(Lcom/google/android/material/textfield/DropdownMenuEndIconDelegate;Landroid/widget/AutoCompleteTextView;)V

    return-void
.end method
