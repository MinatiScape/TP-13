.class public final synthetic Lcom/android/customization/model/color/ColorOption$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Function;


# static fields
.field public static final synthetic INSTANCE:Lcom/android/customization/model/color/ColorOption$$ExternalSyntheticLambda1;


# direct methods
.method public static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/android/customization/model/color/ColorOption$$ExternalSyntheticLambda1;

    invoke-direct {v0}, Lcom/android/customization/model/color/ColorOption$$ExternalSyntheticLambda1;-><init>()V

    sput-object v0, Lcom/android/customization/model/color/ColorOption$$ExternalSyntheticLambda1;->INSTANCE:Lcom/android/customization/model/color/ColorOption$$ExternalSyntheticLambda1;

    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Ljava/util/Map$Entry;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method
