.class public Landroidx/fragment/app/DefaultSpecialEffectsController$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/core/os/CancellationSignal$OnCancelListener;


# instance fields
.field public final synthetic val$animator:Landroid/animation/Animator;


# direct methods
.method public constructor <init>(Landroidx/fragment/app/DefaultSpecialEffectsController;Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iput-object p2, p0, Landroidx/fragment/app/DefaultSpecialEffectsController$3;->val$animator:Landroid/animation/Animator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/DefaultSpecialEffectsController$3;->val$animator:Landroid/animation/Animator;

    invoke-virtual {p0}, Landroid/animation/Animator;->end()V

    return-void
.end method
