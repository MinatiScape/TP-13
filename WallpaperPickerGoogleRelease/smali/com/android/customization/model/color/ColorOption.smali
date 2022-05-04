.class public abstract Lcom/android/customization/model/color/ColorOption;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/customization/model/CustomizationOption;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/customization/model/CustomizationOption<",
        "Lcom/android/customization/model/color/ColorOption;",
        ">;"
    }
.end annotation


# static fields
.field public static final TIMESTAMP_FIELD:Ljava/lang/String; = "_applied_timestamp"


# instance fields
.field public mContentDescription:Ljava/lang/CharSequence;

.field public final mIndex:I

.field public final mIsDefault:Z

.field public final mPackagesByCategory:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final mTitle:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;ZI)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;ZI)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/customization/model/color/ColorOption;->mTitle:Ljava/lang/String;

    .line 3
    iput-boolean p3, p0, Lcom/android/customization/model/color/ColorOption;->mIsDefault:Z

    .line 4
    iput p4, p0, Lcom/android/customization/model/color/ColorOption;->mIndex:I

    .line 5
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    .line 6
    invoke-interface {p1}, Ljava/util/Set;->stream()Ljava/util/stream/Stream;

    move-result-object p1

    sget-object p2, Lcom/android/customization/model/color/ColorOption$$ExternalSyntheticLambda2;->INSTANCE:Lcom/android/customization/model/color/ColorOption$$ExternalSyntheticLambda2;

    .line 7
    invoke-interface {p1, p2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object p1

    sget-object p2, Lcom/android/customization/model/color/ColorOption$$ExternalSyntheticLambda0;->INSTANCE:Lcom/android/customization/model/color/ColorOption$$ExternalSyntheticLambda0;

    sget-object p3, Lcom/android/customization/model/color/ColorOption$$ExternalSyntheticLambda1;->INSTANCE:Lcom/android/customization/model/color/ColorOption$$ExternalSyntheticLambda1;

    .line 8
    invoke-static {p2, p3}, Ljava/util/stream/Collectors;->toMap(Ljava/util/function/Function;Ljava/util/function/Function;)Ljava/util/stream/Collector;

    move-result-object p2

    invoke-interface {p1, p2}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    .line 9
    invoke-static {p1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    iput-object p1, p0, Lcom/android/customization/model/color/ColorOption;->mPackagesByCategory:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public getJsonPackages(Z)Lorg/json/JSONObject;
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/customization/model/color/ColorOption;->mIsDefault:Z

    if-eqz v0, :cond_0

    .line 2
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    goto :goto_2

    .line 3
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    iget-object p0, p0, Lcom/android/customization/model/color/ColorOption;->mPackagesByCategory:Ljava/util/Map;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 4
    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object p0

    .line 5
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 6
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 7
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 8
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 9
    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 10
    :cond_2
    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 11
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    goto :goto_1

    :cond_3
    move-object p0, v0

    :goto_2
    if-eqz p1, :cond_4

    :try_start_0
    const-string p1, "_applied_timestamp"

    .line 12
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p0, p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    const-string p1, "ColorOption"

    const-string v0, "Couldn\'t add timestamp to serialized themebundle"

    .line 13
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    :goto_3
    return-object p0
.end method

.method public abstract getSource()Ljava/lang/String;
.end method

.method public getTitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/customization/model/color/ColorOption;->mTitle:Ljava/lang/String;

    return-object p0
.end method

.method public isActive(Lcom/android/customization/model/CustomizationManager;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/customization/model/CustomizationManager<",
            "Lcom/android/customization/model/color/ColorOption;",
            ">;)Z"
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/android/customization/model/color/ColorCustomizationManager;

    .line 2
    iget-boolean v0, p0, Lcom/android/customization/model/color/ColorOption;->mIsDefault:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_3

    .line 3
    invoke-virtual {p1}, Lcom/android/customization/model/color/ColorCustomizationManager;->getStoredOverlays()Ljava/lang/String;

    move-result-object p0

    .line 4
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "{}"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 5
    iget-object v0, p1, Lcom/android/customization/model/color/ColorCustomizationManager;->mCurrentOverlays:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 6
    invoke-virtual {p1}, Lcom/android/customization/model/color/ColorCustomizationManager;->getStoredOverlays()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/customization/model/color/ColorCustomizationManager;->parseSettings(Ljava/lang/String;)V

    .line 7
    :cond_0
    iget-object p1, p1, Lcom/android/customization/model/color/ColorCustomizationManager;->mCurrentOverlays:Ljava/util/Map;

    .line 8
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1

    const-string p1, "android.theme.customization.system_palette"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2

    const-string p1, "android.theme.customization.accent_color"

    .line 9
    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_2

    :cond_1
    move v1, v2

    :cond_2
    return v1

    .line 10
    :cond_3
    iget-object v0, p1, Lcom/android/customization/model/color/ColorCustomizationManager;->mCurrentOverlays:Ljava/util/Map;

    if-nez v0, :cond_4

    .line 11
    invoke-virtual {p1}, Lcom/android/customization/model/color/ColorCustomizationManager;->getStoredOverlays()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/customization/model/color/ColorCustomizationManager;->parseSettings(Ljava/lang/String;)V

    .line 12
    :cond_4
    iget-object v0, p1, Lcom/android/customization/model/color/ColorCustomizationManager;->mCurrentOverlays:Ljava/util/Map;

    .line 13
    invoke-virtual {p1}, Lcom/android/customization/model/color/ColorCustomizationManager;->getCurrentColorSource()Ljava/lang/String;

    move-result-object p1

    .line 14
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_5

    invoke-virtual {p0}, Lcom/android/customization/model/color/ColorOption;->getSource()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    :cond_5
    iget-object p0, p0, Lcom/android/customization/model/color/ColorOption;->mPackagesByCategory:Ljava/util/Map;

    .line 15
    invoke-interface {p0, v0}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_6

    move v1, v2

    :cond_6
    return v1
.end method
