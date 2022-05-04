.class public Landroidx/appcompat/widget/AppCompatEditText$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/core/view/inputmethod/InputConnectionCompat$OnCommitContentListener;


# instance fields
.field public final synthetic val$view:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/AppCompatEditText$1;->val$view:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCommitContent(Landroidx/core/view/inputmethod/InputContentInfoCompat;ILandroid/os/Bundle;)Z
    .locals 5

    const/4 v0, 0x1

    and-int/2addr p2, v0

    const/4 v1, 0x0

    if-eqz p2, :cond_0

    .line 1
    :try_start_0
    iget-object p2, p1, Landroidx/core/view/inputmethod/InputContentInfoCompat;->mImpl:Landroidx/core/view/inputmethod/InputContentInfoCompat$InputContentInfoCompatImpl;

    check-cast p2, Landroidx/core/view/inputmethod/InputContentInfoCompat$InputContentInfoCompatApi25Impl;

    invoke-virtual {p2}, Landroidx/core/view/inputmethod/InputContentInfoCompat$InputContentInfoCompatApi25Impl;->requestPermission()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "AppCompatEditText"

    const-string p2, "Can\'t insert content from IME; requestPermission() failed"

    .line 2
    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v1

    .line 3
    :cond_0
    :goto_0
    new-instance p2, Landroid/content/ClipData;

    .line 4
    iget-object v2, p1, Landroidx/core/view/inputmethod/InputContentInfoCompat;->mImpl:Landroidx/core/view/inputmethod/InputContentInfoCompat$InputContentInfoCompatImpl;

    check-cast v2, Landroidx/core/view/inputmethod/InputContentInfoCompat$InputContentInfoCompatApi25Impl;

    .line 5
    iget-object v2, v2, Landroidx/core/view/inputmethod/InputContentInfoCompat$InputContentInfoCompatApi25Impl;->mObject:Landroid/view/inputmethod/InputContentInfo;

    invoke-virtual {v2}, Landroid/view/inputmethod/InputContentInfo;->getDescription()Landroid/content/ClipDescription;

    move-result-object v2

    .line 6
    new-instance v3, Landroid/content/ClipData$Item;

    .line 7
    iget-object v4, p1, Landroidx/core/view/inputmethod/InputContentInfoCompat;->mImpl:Landroidx/core/view/inputmethod/InputContentInfoCompat$InputContentInfoCompatImpl;

    check-cast v4, Landroidx/core/view/inputmethod/InputContentInfoCompat$InputContentInfoCompatApi25Impl;

    .line 8
    iget-object v4, v4, Landroidx/core/view/inputmethod/InputContentInfoCompat$InputContentInfoCompatApi25Impl;->mObject:Landroid/view/inputmethod/InputContentInfo;

    invoke-virtual {v4}, Landroid/view/inputmethod/InputContentInfo;->getContentUri()Landroid/net/Uri;

    move-result-object v4

    .line 9
    invoke-direct {v3, v4}, Landroid/content/ClipData$Item;-><init>(Landroid/net/Uri;)V

    invoke-direct {p2, v2, v3}, Landroid/content/ClipData;-><init>(Landroid/content/ClipDescription;Landroid/content/ClipData$Item;)V

    .line 10
    new-instance v2, Landroidx/core/view/ContentInfoCompat$Builder;

    const/4 v3, 0x2

    invoke-direct {v2, p2, v3}, Landroidx/core/view/ContentInfoCompat$Builder;-><init>(Landroid/content/ClipData;I)V

    .line 11
    iget-object p1, p1, Landroidx/core/view/inputmethod/InputContentInfoCompat;->mImpl:Landroidx/core/view/inputmethod/InputContentInfoCompat$InputContentInfoCompatImpl;

    check-cast p1, Landroidx/core/view/inputmethod/InputContentInfoCompat$InputContentInfoCompatApi25Impl;

    .line 12
    iget-object p1, p1, Landroidx/core/view/inputmethod/InputContentInfoCompat$InputContentInfoCompatApi25Impl;->mObject:Landroid/view/inputmethod/InputContentInfo;

    invoke-virtual {p1}, Landroid/view/inputmethod/InputContentInfo;->getLinkUri()Landroid/net/Uri;

    move-result-object p1

    .line 13
    iput-object p1, v2, Landroidx/core/view/ContentInfoCompat$Builder;->mLinkUri:Landroid/net/Uri;

    .line 14
    iput-object p3, v2, Landroidx/core/view/ContentInfoCompat$Builder;->mExtras:Landroid/os/Bundle;

    .line 15
    new-instance p1, Landroidx/core/view/ContentInfoCompat;

    invoke-direct {p1, v2}, Landroidx/core/view/ContentInfoCompat;-><init>(Landroidx/core/view/ContentInfoCompat$Builder;)V

    .line 16
    iget-object p0, p0, Landroidx/appcompat/widget/AppCompatEditText$1;->val$view:Landroid/view/View;

    invoke-static {p0, p1}, Landroidx/core/view/ViewCompat;->performReceiveContent(Landroid/view/View;Landroidx/core/view/ContentInfoCompat;)Landroidx/core/view/ContentInfoCompat;

    move-result-object p0

    if-nez p0, :cond_1

    goto :goto_1

    :cond_1
    move v0, v1

    :goto_1
    return v0
.end method
