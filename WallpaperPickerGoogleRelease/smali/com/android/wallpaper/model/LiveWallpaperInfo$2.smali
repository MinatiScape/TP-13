.class public Lcom/android/wallpaper/model/LiveWallpaperInfo$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/model/LiveWallpaperInfo;->getAllOnDevice(Landroid/content/Context;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Landroid/content/pm/ResolveInfo;",
        ">;"
    }
.end annotation


# instance fields
.field public final mCollator:Ljava/text/Collator;

.field public final synthetic val$pm:Landroid/content/pm/PackageManager;


# direct methods
.method public constructor <init>(Landroid/content/pm/PackageManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/model/LiveWallpaperInfo$2;->val$pm:Landroid/content/pm/PackageManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-static {}, Ljava/text/Collator;->getInstance()Ljava/text/Collator;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/model/LiveWallpaperInfo$2;->mCollator:Ljava/text/Collator;

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 2

    .line 1
    check-cast p1, Landroid/content/pm/ResolveInfo;

    check-cast p2, Landroid/content/pm/ResolveInfo;

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/model/LiveWallpaperInfo$2;->mCollator:Ljava/text/Collator;

    iget-object v1, p0, Lcom/android/wallpaper/model/LiveWallpaperInfo$2;->val$pm:Landroid/content/pm/PackageManager;

    invoke-virtual {p1, v1}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object p1

    iget-object p0, p0, Lcom/android/wallpaper/model/LiveWallpaperInfo$2;->val$pm:Landroid/content/pm/PackageManager;

    invoke-virtual {p2, p0}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {v0, p1, p0}, Ljava/text/Collator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
