.class public Lcom/google/android/material/floatingactionbutton/FloatingActionButtonImpl$ElevateToHoveredFocusedTranslationZAnimation;
.super Lcom/google/android/material/floatingactionbutton/FloatingActionButtonImpl$ShadowAnimatorImpl;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/floatingactionbutton/FloatingActionButtonImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ElevateToHoveredFocusedTranslationZAnimation"
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/google/android/material/floatingactionbutton/FloatingActionButtonImpl;


# direct methods
.method public constructor <init>(Lcom/google/android/material/floatingactionbutton/FloatingActionButtonImpl;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButtonImpl$ElevateToHoveredFocusedTranslationZAnimation;->this$0:Lcom/google/android/material/floatingactionbutton/FloatingActionButtonImpl;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButtonImpl$ShadowAnimatorImpl;-><init>(Lcom/google/android/material/floatingactionbutton/FloatingActionButtonImpl;Lcom/google/android/material/floatingactionbutton/FloatingActionButtonImpl$1;)V

    return-void
.end method


# virtual methods
.method public getTargetShadowSize()F
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButtonImpl$ElevateToHoveredFocusedTranslationZAnimation;->this$0:Lcom/google/android/material/floatingactionbutton/FloatingActionButtonImpl;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lcom/google/android/material/floatingactionbutton/FloatingActionButtonImpl$ElevateToHoveredFocusedTranslationZAnimation;->this$0:Lcom/google/android/material/floatingactionbutton/FloatingActionButtonImpl;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p0, 0x0

    return p0
.end method
