.class public Landroidx/appcompat/widget/SearchView$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/widget/SearchView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Landroidx/appcompat/widget/SearchView;


# direct methods
.method public constructor <init>(Landroidx/appcompat/widget/SearchView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/SearchView$5;->this$0:Landroidx/appcompat/widget/SearchView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/SearchView$5;->this$0:Landroidx/appcompat/widget/SearchView;

    iget-object v0, p0, Landroidx/appcompat/widget/SearchView;->mSearchButton:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/SearchView;->updateViewsVisibility(Z)V

    .line 3
    iget-object p1, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->requestFocus()Z

    .line 4
    iget-object p0, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;->setImeVisibility(Z)V

    goto :goto_0

    .line 5
    :cond_0
    iget-object v0, p0, Landroidx/appcompat/widget/SearchView;->mCloseButton:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_1

    .line 6
    invoke-virtual {p0}, Landroidx/appcompat/widget/SearchView;->onCloseClicked()V

    goto :goto_0

    .line 7
    :cond_1
    iget-object v0, p0, Landroidx/appcompat/widget/SearchView;->mGoButton:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_2

    .line 8
    invoke-virtual {p0}, Landroidx/appcompat/widget/SearchView;->onSubmitQuery()V

    goto :goto_0

    .line 9
    :cond_2
    iget-object v0, p0, Landroidx/appcompat/widget/SearchView;->mVoiceButton:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_3

    goto :goto_0

    .line 10
    :cond_3
    iget-object p0, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    if-ne p1, p0, :cond_4

    .line 11
    invoke-virtual {p0}, Landroid/widget/AutoCompleteTextView;->refreshAutoCompleteResults()V

    :cond_4
    :goto_0
    return-void
.end method
