.class public Lcom/google/android/libraries/imageurl/FifeImageUrlUtil;
.super Lcom/google/photos/base/BaseImageUrlUtil;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$AndroidUriWrapper;,
        Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$InvalidUrlException;,
        Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$Options;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/photos/base/BaseImageUrlUtil<",
        "Landroid/net/Uri;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/photos/base/BaseImageUrlUtil;-><init>()V

    return-void
.end method


# virtual methods
.method public isFifeHostedUri(Landroid/net/Uri;)Z
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "uri"
        }
    .end annotation

    const/4 p0, 0x1

    const/4 v0, 0x0

    .line 1
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 2
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    .line 3
    sget-object v1, Lcom/google/photos/base/ThinBaseImageUrlUtil;->FIFE_HOSTED_IMAGE_URL_RE:Ljava/util/regex/Pattern;

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    move p0, v0

    :goto_0
    if-eqz p0, :cond_1

    .line 4
    sget-object p0, Lcom/google/photos/base/ThinBaseImageUrlUtil;->FIFE_HOSTED_IMAGE_URL_RE:Ljava/util/regex/Pattern;

    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result p0

    return p0

    .line 6
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0
.end method

.method public mergeOptions(Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$Options;Landroid/net/Uri;)Landroid/net/Uri;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "options",
            "uri"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$InvalidUrlException;
        }
    .end annotation

    .line 1
    :try_start_0
    new-instance v0, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$AndroidUriWrapper;

    invoke-direct {v0, p2}, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$AndroidUriWrapper;-><init>(Landroid/net/Uri;)V

    const/4 p2, 0x0

    const/4 v1, 0x1

    .line 2
    invoke-virtual {p0, p1, v0, p2, v1}, Lcom/google/photos/base/BaseImageUrlUtil;->changeImageUrlOptions(Lcom/google/photos/base/ImageUrlOptionsStringBuilder;Lcom/google/photos/base/BaseImageUrlUtil$UriWrapper;ZZ)Ljava/lang/Object;

    move-result-object p0

    .line 3
    check-cast p0, Landroid/net/Uri;
    :try_end_0
    .catch Lcom/google/photos/base/BaseImageUrlUtil$InvalidUrlException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 4
    new-instance p1, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$InvalidUrlException;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$InvalidUrlException;-><init>(Lcom/google/photos/base/BaseImageUrlUtil$InvalidUrlException;Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$1;)V

    throw p1
.end method
