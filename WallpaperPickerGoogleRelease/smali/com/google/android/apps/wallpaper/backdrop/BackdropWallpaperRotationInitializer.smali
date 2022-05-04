.class public Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/model/WallpaperRotationInitializer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;,
        Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$Factory;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public mCollectionId:Ljava/lang/String;

.field public mCollectionName:Ljava/lang/String;

.field public mStagedActionIconRes:I

.field public mStagedActionLabelRes:I

.field public mStagedActionUrl:Ljava/lang/String;

.field public mStagedAttributions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public mStagedRequiredNetworkState:I

.field public mStagedResumeToken:Ljava/lang/String;

.field public mStagedWallpaperId:I


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$1;

    invoke-direct {v0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$1;-><init>()V

    sput-object v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$1;)V
    .locals 0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mCollectionId:Ljava/lang/String;

    .line 6
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mCollectionName:Ljava/lang/String;

    .line 7
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedAttributions:Ljava/util/List;

    .line 8
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->readStringList(Ljava/util/List;)V

    .line 9
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedActionUrl:Ljava/lang/String;

    .line 10
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    iput p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedWallpaperId:I

    .line 11
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    iput p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedRequiredNetworkState:I

    .line 12
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedResumeToken:Ljava/lang/String;

    .line 13
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    iput p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedActionLabelRes:I

    .line 14
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedActionIconRes:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mCollectionId:Ljava/lang/String;

    .line 3
    iput-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mCollectionName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setFirstWallpaperInRotation(Landroid/content/Context;ILcom/android/wallpaper/model/WallpaperRotationInitializer$Listener;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    .line 2
    check-cast v0, Lcom/android/wallpaper/module/GoogleWallpapersInjector;

    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/GoogleWallpapersInjector;->getServerFetcher(Landroid/content/Context;)Lcom/android/wallpaper/network/ServerFetcher;

    move-result-object v0

    .line 3
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mCollectionId:Ljava/lang/String;

    new-instance v2, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;

    invoke-direct {v2, p0, p1, p2, p3}, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$NextImageCallback;-><init>(Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;Landroid/content/Context;ILcom/android/wallpaper/model/WallpaperRotationInitializer$Listener;)V

    check-cast v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;

    const/4 p0, 0x0

    invoke-virtual {v0, p1, v1, p0, v2}, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;->fetchNextImageInCollection(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/android/wallpaper/network/ServerFetcher$NextImageInCollectionCallback;)V

    return-void
.end method

.method public startRotation(Landroid/content/Context;)Z
    .locals 10

    .line 1
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    .line 2
    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object v1

    .line 3
    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/Injector;->getWallpaperPersister(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPersister;

    move-result-object v2

    .line 4
    iget-object v4, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedAttributions:Ljava/util/List;

    iget-object v5, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedActionUrl:Ljava/lang/String;

    iget v6, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedActionLabelRes:I

    iget v7, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedActionIconRes:I

    iget-object v8, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mCollectionId:Ljava/lang/String;

    iget v9, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedWallpaperId:I

    move-object v3, v2

    check-cast v3, Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 5
    invoke-virtual/range {v3 .. v9}, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->saveStaticWallpaperMetadata(Ljava/util/List;Ljava/lang/String;IILjava/lang/String;I)Z

    .line 6
    invoke-static {p1}, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->getInstance(Landroid/content/Context;)Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;

    move-result-object v2

    .line 7
    invoke-virtual {v2}, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->clear()V

    .line 8
    iget-object v3, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mCollectionId:Ljava/lang/String;

    .line 9
    iget-object v4, v2, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v5, "collection_id"

    invoke-static {v4, v5, v3}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences$$ExternalSyntheticOutline0;->m(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    iget-object v3, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mCollectionName:Ljava/lang/String;

    .line 11
    iget-object v4, v2, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v5, "collection_name"

    invoke-static {v4, v5, v3}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences$$ExternalSyntheticOutline0;->m(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    iget v3, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedRequiredNetworkState:I

    .line 13
    iget-object v4, v2, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v5, "required_network_state"

    invoke-interface {v4, v5, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 14
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedResumeToken:Ljava/lang/String;

    invoke-virtual {v2, p0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->setResumeToken(Ljava/lang/String;)V

    .line 15
    invoke-static {p1}, Lcom/google/android/apps/wallpaper/backdrop/BackdropTaskScheduler;->getInstance(Landroid/content/Context;)Lcom/google/android/apps/wallpaper/backdrop/BackdropTaskScheduler;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/wallpaper/backdrop/JobSchedulerBackdropTaskScheduler;

    .line 16
    iget-object v2, p0, Lcom/google/android/apps/wallpaper/backdrop/JobSchedulerBackdropTaskScheduler;->mJobScheduler:Landroid/app/job/JobScheduler;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/app/job/JobScheduler;->cancel(I)V

    .line 17
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/JobSchedulerBackdropTaskScheduler;->mJobScheduler:Landroid/app/job/JobScheduler;

    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Landroid/app/job/JobScheduler;->cancel(I)V

    .line 18
    invoke-static {p1}, Lcom/google/android/apps/wallpaper/backdrop/BackdropAlarmScheduler;->snoozeAlarm(Landroid/content/Context;)V

    const/4 p0, 0x2

    .line 19
    invoke-interface {v1, p0}, Lcom/android/wallpaper/module/WallpaperPreferences;->setWallpaperPresentationMode(I)V

    .line 20
    new-instance p0, Ljava/util/Date;

    invoke-direct {p0}, Ljava/util/Date;-><init>()V

    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    invoke-interface {v1, v3, v4}, Lcom/android/wallpaper/module/WallpaperPreferences;->setDailyWallpaperEnabledTimestamp(J)V

    .line 21
    invoke-static {}, Lcom/android/wallpaper/module/WallpaperChangedNotifier;->getInstance()Lcom/android/wallpaper/module/WallpaperChangedNotifier;

    move-result-object p0

    invoke-virtual {p0}, Lcom/android/wallpaper/module/WallpaperChangedNotifier;->notifyWallpaperChanged()V

    .line 22
    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/Injector;->getUserEventLogger(Landroid/content/Context;)Lcom/android/wallpaper/module/UserEventLogger;

    move-result-object p0

    .line 23
    invoke-interface {p0}, Lcom/android/wallpaper/module/UserEventLogger;->logDailyRefreshTurnedOn()V

    return v2
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mCollectionId:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 2
    iget-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mCollectionName:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 3
    iget-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedAttributions:Ljava/util/List;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeStringList(Ljava/util/List;)V

    .line 4
    iget-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedActionUrl:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 5
    iget p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedWallpaperId:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 6
    iget p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedRequiredNetworkState:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 7
    iget-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedResumeToken:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 8
    iget p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedActionLabelRes:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 9
    iget p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;->mStagedActionIconRes:I

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
