.class public Lcom/google/photos/base/ThinBaseImageUrlUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final FIFE_HOSTED_IMAGE_URL_RE:Ljava/util/regex/Pattern;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    const-string v0, "^((http(s)?):)?\\/\\/((((lh[3-6](-tt|-d[a-g,z])?\\.((ggpht)|(googleusercontent)|(google)))|(([1-4]\\.bp\\.blogspot)|(bp[0-3]\\.blogger))|((((cp|ci|gp)[3-6])|(ap[1-2]))\\.(ggpht|googleusercontent))|(gm[1-4]\\.ggpht)|(((yt[3-4])|(sp[1-3]))\\.(ggpht|googleusercontent)))\\.com)|(dp[3-6]\\.googleusercontent\\.cn)|(lh[3-6]\\.(googleadsserving\\.cn|xn--9kr7l\\.com))|(photos\\-image\\-(dev|qa)(-auth)?\\.corp\\.google\\.com)|((dev|dev2|dev3|qa|qa2|qa3|qa-red|qa-blue|canary)[-.]lighthouse\\.sandbox\\.google\\.com\\/image)|(image\\-(dev|qa)\\-lighthouse(-auth)?\\.sandbox\\.google\\.com(\\/image)?))\\/"

    .line 1
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/photos/base/ThinBaseImageUrlUtil;->FIFE_HOSTED_IMAGE_URL_RE:Ljava/util/regex/Pattern;

    return-void
.end method
