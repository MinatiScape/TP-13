.class public Landroidx/viewpager2/widget/FakeDrag;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static zza$com$google$android$gms$gcm$GcmNetworkManager:Landroidx/viewpager2/widget/FakeDrag;


# instance fields
.field public final mRecyclerView:Ljava/lang/Object;

.field public final mScrollEventAdapter:Ljava/lang/Object;

.field public mViewPager:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Landroidx/collection/ArrayMap;

    invoke-direct {v0}, Landroidx/collection/ArrayMap;-><init>()V

    iput-object v0, p0, Landroidx/viewpager2/widget/FakeDrag;->mRecyclerView:Ljava/lang/Object;

    .line 3
    iput-object p1, p0, Landroidx/viewpager2/widget/FakeDrag;->mViewPager:Ljava/lang/Object;

    .line 4
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "com.google.example.invalidpackage"

    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const/4 v1, 0x0

    .line 6
    invoke-static {p1, v1, v0, v1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    iput-object p1, p0, Landroidx/viewpager2/widget/FakeDrag;->mScrollEventAdapter:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroidx/viewpager2/widget/ViewPager2;Landroidx/viewpager2/widget/ScrollEventAdapter;Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    iput-object p1, p0, Landroidx/viewpager2/widget/FakeDrag;->mViewPager:Ljava/lang/Object;

    .line 9
    iput-object p2, p0, Landroidx/viewpager2/widget/FakeDrag;->mScrollEventAdapter:Ljava/lang/Object;

    .line 10
    iput-object p3, p0, Landroidx/viewpager2/widget/FakeDrag;->mRecyclerView:Ljava/lang/Object;

    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Landroidx/viewpager2/widget/FakeDrag;
    .locals 2

    .line 1
    const-class v0, Landroidx/viewpager2/widget/FakeDrag;

    monitor-enter v0

    .line 2
    :try_start_0
    sget-object v1, Landroidx/viewpager2/widget/FakeDrag;->zza$com$google$android$gms$gcm$GcmNetworkManager:Landroidx/viewpager2/widget/FakeDrag;

    if-nez v1, :cond_0

    .line 3
    new-instance v1, Landroidx/viewpager2/widget/FakeDrag;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v1, p0}, Landroidx/viewpager2/widget/FakeDrag;-><init>(Landroid/content/Context;)V

    sput-object v1, Landroidx/viewpager2/widget/FakeDrag;->zza$com$google$android$gms$gcm$GcmNetworkManager:Landroidx/viewpager2/widget/FakeDrag;

    .line 4
    :cond_0
    sget-object p0, Landroidx/viewpager2/widget/FakeDrag;->zza$com$google$android$gms$gcm$GcmNetworkManager:Landroidx/viewpager2/widget/FakeDrag;

    monitor-exit v0

    return-object p0

    .line 5
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method


# virtual methods
.method public zza()Landroid/content/Intent;
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/viewpager2/widget/FakeDrag;->mViewPager:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/iid/Rpc;->findIidPackage(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2
    iget-object v1, p0, Landroidx/viewpager2/widget/FakeDrag;->mViewPager:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    invoke-static {v1}, Lcom/google/android/gms/gcm/GoogleCloudMessaging;->zza(Landroid/content/Context;)I

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, -0x1

    :goto_0
    if-eqz v0, :cond_2

    const v2, 0x4c4b40

    if-ge v1, v2, :cond_1

    goto :goto_1

    .line 3
    :cond_1
    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.google.android.gms.gcm.ACTION_SCHEDULE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 4
    invoke-virtual {v1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 5
    iget-object p0, p0, Landroidx/viewpager2/widget/FakeDrag;->mScrollEventAdapter:Ljava/lang/Object;

    check-cast p0, Landroid/app/PendingIntent;

    const-string v0, "app"

    invoke-virtual {v1, v0, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const/4 p0, 0x4

    const-string v0, "source"

    .line 6
    invoke-virtual {v1, v0, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const p0, 0xbf2d68

    const-string v0, "source_version"

    .line 7
    invoke-virtual {v1, v0, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    return-object v1

    :cond_2
    :goto_1
    const/16 p0, 0x5b

    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string p0, "Google Play Services is not available, dropping GcmNetworkManager request. code="

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "GcmNetworkManager"

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x0

    return-object p0
.end method

.method public declared-synchronized zza(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2

    monitor-enter p0

    .line 9
    :try_start_0
    iget-object v0, p0, Landroidx/viewpager2/widget/FakeDrag;->mRecyclerView:Ljava/lang/Object;

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-nez v0, :cond_0

    .line 10
    new-instance v0, Landroidx/collection/ArrayMap;

    invoke-direct {v0}, Landroidx/collection/ArrayMap;-><init>()V

    .line 11
    iget-object v1, p0, Landroidx/viewpager2/widget/FakeDrag;->mRecyclerView:Ljava/lang/Object;

    check-cast v1, Ljava/util/Map;

    invoke-interface {v1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    :cond_0
    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p1, :cond_1

    const/4 p1, 0x1

    :goto_0
    monitor-exit p0

    return p1

    :cond_1
    const/4 p1, 0x0

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized zzb(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    monitor-enter p0

    .line 1
    :try_start_0
    iget-object v0, p0, Landroidx/viewpager2/widget/FakeDrag;->mRecyclerView:Ljava/lang/Object;

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_1

    .line 2
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-eqz p1, :cond_1

    .line 3
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 4
    iget-object p1, p0, Landroidx/viewpager2/widget/FakeDrag;->mRecyclerView:Ljava/lang/Object;

    check-cast p1, Ljava/util/Map;

    invoke-interface {p1, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized zzb(Ljava/lang/String;)Z
    .locals 1

    monitor-enter p0

    .line 6
    :try_start_0
    iget-object v0, p0, Landroidx/viewpager2/widget/FakeDrag;->mRecyclerView:Ljava/lang/Object;

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public zzc(Ljava/lang/String;)Z
    .locals 3

    const-string v0, "GcmTaskService must not be null."

    .line 1
    invoke-static {p1, v0}, Landroidx/preference/R$string;->zza(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-virtual {p0, p1}, Landroidx/viewpager2/widget/FakeDrag;->zzd(Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    const/4 v0, 0x1

    if-nez p0, :cond_0

    move v1, v0

    goto :goto_0

    .line 3
    :cond_0
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    :goto_0
    if-eqz v1, :cond_1

    const-string p0, " is not available. This may cause the task to be lost."

    .line 4
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "GcmNetworkManager"

    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    .line 5
    :cond_1
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ResolveInfo;

    .line 6
    iget-object v1, v1, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    if-eqz v1, :cond_2

    iget-boolean v1, v1, Landroid/content/pm/ServiceInfo;->enabled:Z

    if-eqz v1, :cond_2

    return v0

    .line 7
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x76

    const-string v1, "The GcmTaskService class you provided "

    const-string v2, " does not seem to support receiving com.google.android.gms.gcm.ACTION_TASK_READY"

    invoke-static {v0, v1, p1, v2}, Landroidx/viewpager2/widget/FakeDrag$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public declared-synchronized zzc(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    monitor-enter p0

    .line 8
    :try_start_0
    iget-object v0, p0, Landroidx/viewpager2/widget/FakeDrag;->mRecyclerView:Ljava/lang/Object;

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/Map;

    const/4 v0, 0x0

    if-eqz p2, :cond_1

    .line 9
    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p1, :cond_0

    .line 10
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    .line 11
    :cond_1
    monitor-exit p0

    return v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public zzd(Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Landroid/content/pm/ResolveInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/viewpager2/widget/FakeDrag;->mViewPager:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    if-nez v0, :cond_0

    .line 2
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 3
    :cond_0
    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.google.android.gms.gcm.ACTION_TASK_READY"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Landroidx/viewpager2/widget/FakeDrag;->mViewPager:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-virtual {v1, p0, p1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const/4 p1, 0x0

    .line 4
    invoke-virtual {v0, p0, p1}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
