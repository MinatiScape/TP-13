.class public Landroidx/core/graphics/TypefaceCompatApi29Impl;
.super Landroidx/core/graphics/TypefaceCompatBaseImpl;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/core/graphics/TypefaceCompatBaseImpl;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromFontFamilyFilesResourceEntry(Landroid/content/Context;Landroidx/core/content/res/FontResourcesParserCompat$FontFamilyFilesResourceEntry;Landroid/content/res/Resources;I)Landroid/graphics/Typeface;
    .locals 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "familyEntry",
            "resources",
            "style"
        }
    .end annotation

    const/4 p0, 0x0

    .line 1
    :try_start_0
    iget-object p1, p2, Landroidx/core/content/res/FontResourcesParserCompat$FontFamilyFilesResourceEntry;->mEntries:[Landroidx/core/content/res/FontResourcesParserCompat$FontFileResourceEntry;

    .line 2
    array-length p2, p1

    const/4 v0, 0x0

    move-object v2, p0

    move v1, v0

    :goto_0
    const/4 v3, 0x1

    if-ge v1, p2, :cond_2

    aget-object v4, p1, v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 3
    :try_start_1
    new-instance v5, Landroid/graphics/fonts/Font$Builder;

    .line 4
    iget v6, v4, Landroidx/core/content/res/FontResourcesParserCompat$FontFileResourceEntry;->mResourceId:I

    .line 5
    invoke-direct {v5, p3, v6}, Landroid/graphics/fonts/Font$Builder;-><init>(Landroid/content/res/Resources;I)V

    .line 6
    iget v6, v4, Landroidx/core/content/res/FontResourcesParserCompat$FontFileResourceEntry;->mWeight:I

    .line 7
    invoke-virtual {v5, v6}, Landroid/graphics/fonts/Font$Builder;->setWeight(I)Landroid/graphics/fonts/Font$Builder;

    move-result-object v5

    .line 8
    iget-boolean v6, v4, Landroidx/core/content/res/FontResourcesParserCompat$FontFileResourceEntry;->mItalic:Z

    if-eqz v6, :cond_0

    goto :goto_1

    :cond_0
    move v3, v0

    .line 9
    :goto_1
    invoke-virtual {v5, v3}, Landroid/graphics/fonts/Font$Builder;->setSlant(I)Landroid/graphics/fonts/Font$Builder;

    move-result-object v3

    .line 10
    iget v5, v4, Landroidx/core/content/res/FontResourcesParserCompat$FontFileResourceEntry;->mTtcIndex:I

    .line 11
    invoke-virtual {v3, v5}, Landroid/graphics/fonts/Font$Builder;->setTtcIndex(I)Landroid/graphics/fonts/Font$Builder;

    move-result-object v3

    .line 12
    iget-object v4, v4, Landroidx/core/content/res/FontResourcesParserCompat$FontFileResourceEntry;->mVariationSettings:Ljava/lang/String;

    .line 13
    invoke-virtual {v3, v4}, Landroid/graphics/fonts/Font$Builder;->setFontVariationSettings(Ljava/lang/String;)Landroid/graphics/fonts/Font$Builder;

    move-result-object v3

    .line 14
    invoke-virtual {v3}, Landroid/graphics/fonts/Font$Builder;->build()Landroid/graphics/fonts/Font;

    move-result-object v3

    if-nez v2, :cond_1

    .line 15
    new-instance v4, Landroid/graphics/fonts/FontFamily$Builder;

    invoke-direct {v4, v3}, Landroid/graphics/fonts/FontFamily$Builder;-><init>(Landroid/graphics/fonts/Font;)V

    move-object v2, v4

    goto :goto_2

    .line 16
    :cond_1
    invoke-virtual {v2, v3}, Landroid/graphics/fonts/FontFamily$Builder;->addFont(Landroid/graphics/fonts/Font;)Landroid/graphics/fonts/FontFamily$Builder;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :catch_0
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    if-nez v2, :cond_3

    return-object p0

    .line 17
    :cond_3
    :try_start_2
    new-instance p1, Landroid/graphics/fonts/FontStyle;

    and-int/lit8 p2, p4, 0x1

    if-eqz p2, :cond_4

    const/16 p2, 0x2bc

    goto :goto_3

    :cond_4
    const/16 p2, 0x190

    :goto_3
    and-int/lit8 p3, p4, 0x2

    if-eqz p3, :cond_5

    move v0, v3

    .line 18
    :cond_5
    invoke-direct {p1, p2, v0}, Landroid/graphics/fonts/FontStyle;-><init>(II)V

    .line 19
    new-instance p2, Landroid/graphics/Typeface$CustomFallbackBuilder;

    invoke-virtual {v2}, Landroid/graphics/fonts/FontFamily$Builder;->build()Landroid/graphics/fonts/FontFamily;

    move-result-object p3

    invoke-direct {p2, p3}, Landroid/graphics/Typeface$CustomFallbackBuilder;-><init>(Landroid/graphics/fonts/FontFamily;)V

    .line 20
    invoke-virtual {p2, p1}, Landroid/graphics/Typeface$CustomFallbackBuilder;->setStyle(Landroid/graphics/fonts/FontStyle;)Landroid/graphics/Typeface$CustomFallbackBuilder;

    move-result-object p1

    .line 21
    invoke-virtual {p1}, Landroid/graphics/Typeface$CustomFallbackBuilder;->build()Landroid/graphics/Typeface;

    move-result-object p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :catch_1
    return-object p0
.end method
