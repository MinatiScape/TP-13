.class public Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;


# direct methods
.method public constructor <init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 3

    .line 1
    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 2
    iget-object v1, p1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onLongClickListener:Landroid/view/View$OnLongClickListener;

    if-eqz v1, :cond_0

    const/4 v2, 0x0

    .line 3
    iput v2, p1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    .line 4
    invoke-static {p1, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$201(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/view/View$OnLongClickListener;)V

    .line 5
    iget-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {p1}, Landroid/view/View;->performLongClick()Z

    .line 6
    iget-object p0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    const/4 p1, 0x0

    invoke-static {p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$301(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/view/View$OnLongClickListener;)V

    :cond_0
    return v0
.end method
