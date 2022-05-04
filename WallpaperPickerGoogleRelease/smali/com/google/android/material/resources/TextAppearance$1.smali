.class public Lcom/google/android/material/resources/TextAppearance$1;
.super Landroidx/core/content/res/ResourcesCompat$FontCallback;
.source "SourceFile"


# instance fields
.field public final synthetic this$0:Lcom/google/android/material/resources/TextAppearance;

.field public final synthetic val$callback:Lcom/google/android/gms/internal/zzgms;


# direct methods
.method public constructor <init>(Lcom/google/android/material/resources/TextAppearance;Lcom/google/android/gms/internal/zzgms;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/resources/TextAppearance$1;->this$0:Lcom/google/android/material/resources/TextAppearance;

    iput-object p2, p0, Lcom/google/android/material/resources/TextAppearance$1;->val$callback:Lcom/google/android/gms/internal/zzgms;

    invoke-direct {p0}, Landroidx/core/content/res/ResourcesCompat$FontCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onFontRetrievalFailed(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/resources/TextAppearance$1;->this$0:Lcom/google/android/material/resources/TextAppearance;

    const/4 v1, 0x1

    .line 2
    iput-boolean v1, v0, Lcom/google/android/material/resources/TextAppearance;->fontResolved:Z

    .line 3
    iget-object p0, p0, Lcom/google/android/material/resources/TextAppearance$1;->val$callback:Lcom/google/android/gms/internal/zzgms;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzgms;->onFontRetrievalFailed(I)V

    return-void
.end method

.method public onFontRetrieved(Landroid/graphics/Typeface;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/resources/TextAppearance$1;->this$0:Lcom/google/android/material/resources/TextAppearance;

    iget v1, v0, Lcom/google/android/material/resources/TextAppearance;->textStyle:I

    invoke-static {p1, v1}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object p1

    .line 2
    iput-object p1, v0, Lcom/google/android/material/resources/TextAppearance;->font:Landroid/graphics/Typeface;

    .line 3
    iget-object p1, p0, Lcom/google/android/material/resources/TextAppearance$1;->this$0:Lcom/google/android/material/resources/TextAppearance;

    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p1, Lcom/google/android/material/resources/TextAppearance;->fontResolved:Z

    .line 5
    iget-object p0, p0, Lcom/google/android/material/resources/TextAppearance$1;->val$callback:Lcom/google/android/gms/internal/zzgms;

    .line 6
    iget-object p1, p1, Lcom/google/android/material/resources/TextAppearance;->font:Landroid/graphics/Typeface;

    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/zzgms;->onFontRetrieved(Landroid/graphics/Typeface;Z)V

    return-void
.end method
