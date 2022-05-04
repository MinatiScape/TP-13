.class public Landroidx/cardview/widget/CardViewApi21Impl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/cardview/widget/CardViewImpl;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getCardBackground(Landroidx/cardview/widget/CardViewDelegate;)Landroidx/cardview/widget/RoundRectDrawable;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "cardView"
        }
    .end annotation

    .line 1
    check-cast p1, Landroidx/cardview/widget/CardView$1;

    .line 2
    iget-object p0, p1, Landroidx/cardview/widget/CardView$1;->mCardBackground:Landroid/graphics/drawable/Drawable;

    .line 3
    check-cast p0, Landroidx/cardview/widget/RoundRectDrawable;

    return-object p0
.end method

.method public getRadius(Landroidx/cardview/widget/CardViewDelegate;)F
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "cardView"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Landroidx/cardview/widget/CardViewApi21Impl;->getCardBackground(Landroidx/cardview/widget/CardViewDelegate;)Landroidx/cardview/widget/RoundRectDrawable;

    move-result-object p0

    .line 2
    iget p0, p0, Landroidx/cardview/widget/RoundRectDrawable;->mRadius:F

    return p0
.end method
