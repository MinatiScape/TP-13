.class public Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$2;
.super Lcom/android/wallpaper/model/WallpaperInfo;
.source "SourceFile"


# instance fields
.field public final synthetic val$collectionIdHeader:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$2;->val$collectionIdHeader:Ljava/lang/String;

    invoke-direct {p0}, Lcom/android/wallpaper/model/WallpaperInfo;-><init>()V

    return-void
.end method


# virtual methods
.method public getAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getAttributions(Landroid/content/Context;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public getCollectionId(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$2;->val$collectionIdHeader:Ljava/lang/String;

    return-object p0
.end method

.method public getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public showPreview(Landroid/app/Activity;Lcom/android/wallpaper/model/InlinePreviewIntentFactory;I)V
    .locals 0

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    return-void
.end method
