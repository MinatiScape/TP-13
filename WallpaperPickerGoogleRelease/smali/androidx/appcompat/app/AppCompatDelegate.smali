.class public abstract Landroidx/appcompat/app/AppCompatDelegate;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final sActivityDelegates:Landroidx/collection/ArraySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/ArraySet<",
            "Ljava/lang/ref/WeakReference<",
            "Landroidx/appcompat/app/AppCompatDelegate;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final sActivityDelegatesLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroidx/collection/ArraySet;

    const/4 v1, 0x0

    .line 2
    invoke-direct {v0, v1}, Landroidx/collection/ArraySet;-><init>(I)V

    .line 3
    sput-object v0, Landroidx/appcompat/app/AppCompatDelegate;->sActivityDelegates:Landroidx/collection/ArraySet;

    .line 4
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroidx/appcompat/app/AppCompatDelegate;->sActivityDelegatesLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static removeDelegateFromActives(Landroidx/appcompat/app/AppCompatDelegate;)V
    .locals 3

    .line 1
    sget-object v0, Landroidx/appcompat/app/AppCompatDelegate;->sActivityDelegatesLock:Ljava/lang/Object;

    monitor-enter v0

    .line 2
    :try_start_0
    sget-object v1, Landroidx/appcompat/app/AppCompatDelegate;->sActivityDelegates:Landroidx/collection/ArraySet;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    new-instance v2, Landroidx/collection/ArraySet$ElementIterator;

    invoke-direct {v2, v1}, Landroidx/collection/ArraySet$ElementIterator;-><init>(Landroidx/collection/ArraySet;)V

    .line 4
    :cond_0
    :goto_0
    invoke-virtual {v2}, Landroidx/collection/IndexBasedArrayIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 5
    invoke-virtual {v2}, Landroidx/collection/IndexBasedArrayIterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/appcompat/app/AppCompatDelegate;

    if-eq v1, p0, :cond_1

    if-nez v1, :cond_0

    .line 6
    :cond_1
    invoke-virtual {v2}, Landroidx/collection/IndexBasedArrayIterator;->remove()V

    goto :goto_0

    .line 7
    :cond_2
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method


# virtual methods
.method public abstract addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
.end method

.method public attachBaseContext2(Landroid/content/Context;)Landroid/content/Context;
    .locals 0

    return-object p1
.end method

.method public abstract findViewById(I)Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(I)TT;"
        }
    .end annotation
.end method

.method public getLocalNightMode()I
    .locals 0

    const/16 p0, -0x64

    return p0
.end method

.method public abstract getMenuInflater()Landroid/view/MenuInflater;
.end method

.method public abstract getSupportActionBar()Landroidx/appcompat/app/ActionBar;
.end method

.method public abstract installViewFactory()V
.end method

.method public abstract invalidateOptionsMenu()V
.end method

.method public abstract onConfigurationChanged(Landroid/content/res/Configuration;)V
.end method

.method public abstract onCreate(Landroid/os/Bundle;)V
.end method

.method public abstract onDestroy()V
.end method

.method public abstract onPostCreate(Landroid/os/Bundle;)V
.end method

.method public abstract onPostResume()V
.end method

.method public abstract onSaveInstanceState(Landroid/os/Bundle;)V
.end method

.method public abstract onStart()V
.end method

.method public abstract onStop()V
.end method

.method public abstract requestWindowFeature(I)Z
.end method

.method public abstract setContentView(I)V
.end method

.method public abstract setContentView(Landroid/view/View;)V
.end method

.method public abstract setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
.end method

.method public abstract setSupportActionBar(Landroidx/appcompat/widget/Toolbar;)V
.end method

.method public setTheme(I)V
    .locals 0

    return-void
.end method

.method public abstract setTitle(Ljava/lang/CharSequence;)V
.end method
