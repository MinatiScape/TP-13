.class public Lcom/android/customization/model/themedicon/ThemedIconUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final mProviderAuthority:Ljava/lang/String;

.field public mProviderInfo:Landroid/content/pm/ProviderInfo;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.category.HOME"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 3
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const v2, 0x10080

    invoke-virtual {v1, v0, v2}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 4
    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    if-eqz v0, :cond_0

    .line 5
    invoke-virtual {v0, p2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/android/customization/model/themedicon/ThemedIconUtils;->mProviderAuthority:Ljava/lang/String;

    goto :goto_0

    .line 6
    :cond_0
    iput-object v1, p0, Lcom/android/customization/model/themedicon/ThemedIconUtils;->mProviderAuthority:Ljava/lang/String;

    .line 7
    :goto_0
    iget-object p2, p0, Lcom/android/customization/model/themedicon/ThemedIconUtils;->mProviderAuthority:Ljava/lang/String;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_1

    move-object p2, v1

    goto :goto_1

    .line 8
    :cond_1
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p2

    iget-object v0, p0, Lcom/android/customization/model/themedicon/ThemedIconUtils;->mProviderAuthority:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {p2, v0, v2}, Landroid/content/pm/PackageManager;->resolveContentProvider(Ljava/lang/String;I)Landroid/content/pm/ProviderInfo;

    move-result-object p2

    :goto_1
    iput-object p2, p0, Lcom/android/customization/model/themedicon/ThemedIconUtils;->mProviderInfo:Landroid/content/pm/ProviderInfo;

    if-eqz p2, :cond_2

    .line 9
    iget-object p2, p2, Landroid/content/pm/ProviderInfo;->readPermission:Ljava/lang/String;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_2

    .line 10
    iget-object p2, p0, Lcom/android/customization/model/themedicon/ThemedIconUtils;->mProviderInfo:Landroid/content/pm/ProviderInfo;

    iget-object p2, p2, Landroid/content/pm/ProviderInfo;->readPermission:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result p1

    if-eqz p1, :cond_2

    .line 11
    iput-object v1, p0, Lcom/android/customization/model/themedicon/ThemedIconUtils;->mProviderInfo:Landroid/content/pm/ProviderInfo;

    :cond_2
    return-void
.end method


# virtual methods
.method public getUriForPath(Ljava/lang/String;)Landroid/net/Uri;
    .locals 2

    .line 1
    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    const-string v1, "content"

    .line 2
    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    iget-object p0, p0, Lcom/android/customization/model/themedicon/ThemedIconUtils;->mProviderInfo:Landroid/content/pm/ProviderInfo;

    iget-object p0, p0, Landroid/content/pm/ProviderInfo;->authority:Ljava/lang/String;

    .line 3
    invoke-virtual {v0, p0}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    .line 4
    invoke-virtual {p0, p1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method
