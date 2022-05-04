.class public Landroidx/activity/ComponentActivity$2$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/activity/ComponentActivity$2;->onLaunch(ILandroidx/activity/result/contract/ActivityResultContract;Ljava/lang/Object;Landroidx/core/app/ActivityOptionsCompat;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$1:Landroidx/activity/ComponentActivity$2;

.field public final synthetic val$requestCode:I

.field public final synthetic val$synchronousResult:Landroidx/activity/result/contract/ActivityResultContract$SynchronousResult;


# direct methods
.method public constructor <init>(Landroidx/activity/ComponentActivity$2;ILandroidx/activity/result/contract/ActivityResultContract$SynchronousResult;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/activity/ComponentActivity$2$1;->this$1:Landroidx/activity/ComponentActivity$2;

    iput p2, p0, Landroidx/activity/ComponentActivity$2$1;->val$requestCode:I

    iput-object p3, p0, Landroidx/activity/ComponentActivity$2$1;->val$synchronousResult:Landroidx/activity/result/contract/ActivityResultContract$SynchronousResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/activity/ComponentActivity$2$1;->this$1:Landroidx/activity/ComponentActivity$2;

    iget v1, p0, Landroidx/activity/ComponentActivity$2$1;->val$requestCode:I

    iget-object p0, p0, Landroidx/activity/ComponentActivity$2$1;->val$synchronousResult:Landroidx/activity/result/contract/ActivityResultContract$SynchronousResult;

    .line 2
    iget-object p0, p0, Landroidx/activity/result/contract/ActivityResultContract$SynchronousResult;->mValue:Ljava/lang/Object;

    .line 3
    iget-object v2, v0, Landroidx/activity/result/ActivityResultRegistry;->mRcToKey:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-nez v1, :cond_0

    goto :goto_1

    .line 4
    :cond_0
    iget-object v2, v0, Landroidx/activity/result/ActivityResultRegistry;->mKeyToCallback:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/activity/result/ActivityResultRegistry$CallbackAndContract;

    if-eqz v2, :cond_2

    .line 5
    iget-object v2, v2, Landroidx/activity/result/ActivityResultRegistry$CallbackAndContract;->mCallback:Landroidx/activity/result/ActivityResultCallback;

    if-nez v2, :cond_1

    goto :goto_0

    .line 6
    :cond_1
    invoke-interface {v2, p0}, Landroidx/activity/result/ActivityResultCallback;->onActivityResult(Ljava/lang/Object;)V

    goto :goto_1

    .line 7
    :cond_2
    :goto_0
    iget-object v2, v0, Landroidx/activity/result/ActivityResultRegistry;->mPendingResults:Landroid/os/Bundle;

    invoke-virtual {v2, v1}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 8
    iget-object v0, v0, Landroidx/activity/result/ActivityResultRegistry;->mParsedPendingResults:Ljava/util/Map;

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1
    return-void
.end method
