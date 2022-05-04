.class public Lcom/google/android/material/resources/TextAppearance$2;
.super Lcom/google/android/gms/internal/zzgms;
.source "SourceFile"


# instance fields
.field public final synthetic this$0:Lcom/google/android/material/resources/TextAppearance;

.field public final synthetic val$callback:Lcom/google/android/gms/internal/zzgms;

.field public final synthetic val$textPaint:Landroid/text/TextPaint;


# direct methods
.method public constructor <init>(Lcom/google/android/material/resources/TextAppearance;Landroid/text/TextPaint;Lcom/google/android/gms/internal/zzgms;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/resources/TextAppearance$2;->this$0:Lcom/google/android/material/resources/TextAppearance;

    iput-object p2, p0, Lcom/google/android/material/resources/TextAppearance$2;->val$textPaint:Landroid/text/TextPaint;

    iput-object p3, p0, Lcom/google/android/material/resources/TextAppearance$2;->val$callback:Lcom/google/android/gms/internal/zzgms;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzgms;-><init>(I)V

    return-void
.end method


# virtual methods
.method public onFontRetrievalFailed(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/resources/TextAppearance$2;->val$callback:Lcom/google/android/gms/internal/zzgms;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzgms;->onFontRetrievalFailed(I)V

    return-void
.end method

.method public onFontRetrieved(Landroid/graphics/Typeface;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/resources/TextAppearance$2;->this$0:Lcom/google/android/material/resources/TextAppearance;

    iget-object v1, p0, Lcom/google/android/material/resources/TextAppearance$2;->val$textPaint:Landroid/text/TextPaint;

    invoke-virtual {v0, v1, p1}, Lcom/google/android/material/resources/TextAppearance;->updateTextPaintMeasureState(Landroid/text/TextPaint;Landroid/graphics/Typeface;)V

    .line 2
    iget-object p0, p0, Lcom/google/android/material/resources/TextAppearance$2;->val$callback:Lcom/google/android/gms/internal/zzgms;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/zzgms;->onFontRetrieved(Landroid/graphics/Typeface;Z)V

    return-void
.end method
