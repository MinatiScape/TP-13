.class public final Lcom/android/wallpaper/model/WorkspaceViewModel;
.super Landroidx/lifecycle/ViewModel;
.source "SourceFile"


# instance fields
.field public final updateWorkspace$delegate:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/lifecycle/ViewModel;-><init>()V

    .line 2
    sget-object v0, Lcom/android/wallpaper/model/WorkspaceViewModel$updateWorkspace$2;->INSTANCE:Lcom/android/wallpaper/model/WorkspaceViewModel$updateWorkspace$2;

    invoke-static {v0}, Lkotlin/LazyKt__LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wallpaper/model/WorkspaceViewModel;->updateWorkspace$delegate:Lkotlin/Lazy;

    return-void
.end method
