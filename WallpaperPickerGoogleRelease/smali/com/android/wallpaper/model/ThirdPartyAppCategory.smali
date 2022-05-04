.class public Lcom/android/wallpaper/model/ThirdPartyAppCategory;
.super Lcom/android/wallpaper/model/Category;
.source "SourceFile"


# instance fields
.field public final mResolveInfo:Landroid/content/pm/ResolveInfo;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/content/pm/ResolveInfo;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    .line 2
    invoke-direct {p0, p1, p3, p4}, Lcom/android/wallpaper/model/Category;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 3
    iput-object p2, p0, Lcom/android/wallpaper/model/ThirdPartyAppCategory;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    return-void
.end method


# virtual methods
.method public containsThirdParty(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/model/ThirdPartyAppCategory;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object p0, p0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object p0, p0, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public getOverlayIcon(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/model/ThirdPartyAppCategory;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/content/pm/ResolveInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public getOverlayIconSizeDp()I
    .locals 0

    const/16 p0, 0x30

    return p0
.end method

.method public getThumbnail(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public show(Landroid/app/Activity;Lcom/android/wallpaper/model/PickerIntentFactory;I)V
    .locals 1

    .line 1
    new-instance p2, Landroid/content/ComponentName;

    iget-object p0, p0, Lcom/android/wallpaper/model/ThirdPartyAppCategory;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object p0, p0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v0, p0, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object p0, p0, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-direct {p2, v0, p0}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    new-instance p0, Landroid/content/Intent;

    const-string v0, "android.intent.action.SET_WALLPAPER"

    invoke-direct {p0, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 3
    invoke-virtual {p0, p2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 4
    invoke-static {p1, p0, p3}, Lcom/android/wallpaper/util/ActivityUtils;->startActivityForResultSafely(Landroid/app/Activity;Landroid/content/Intent;I)V

    return-void
.end method
