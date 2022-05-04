.class public final synthetic Lcom/android/customization/model/color/ColorOption$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Predicate;


# static fields
.field public static final synthetic INSTANCE:Lcom/android/customization/model/color/ColorOption$$ExternalSyntheticLambda2;


# direct methods
.method public static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/android/customization/model/color/ColorOption$$ExternalSyntheticLambda2;

    invoke-direct {v0}, Lcom/android/customization/model/color/ColorOption$$ExternalSyntheticLambda2;-><init>()V

    sput-object v0, Lcom/android/customization/model/color/ColorOption$$ExternalSyntheticLambda2;->INSTANCE:Lcom/android/customization/model/color/ColorOption$$ExternalSyntheticLambda2;

    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 0

    check-cast p1, Ljava/util/Map$Entry;

    .line 1
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
