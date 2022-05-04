.class public Landroidx/transition/ViewUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final TRANSITION_ALPHA:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Landroidx/transition/ViewUtils$1;

    const-class v1, Ljava/lang/Float;

    const-string v2, "translationAlpha"

    invoke-direct {v0, v1, v2}, Landroidx/transition/ViewUtils$1;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v0, Landroidx/transition/ViewUtils;->TRANSITION_ALPHA:Landroid/util/Property;

    .line 2
    new-instance v0, Landroidx/transition/ViewUtils$2;

    const-class v1, Landroid/graphics/Rect;

    const-string v2, "clipBounds"

    invoke-direct {v0, v1, v2}, Landroidx/transition/ViewUtils$2;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method
