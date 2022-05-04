.class public final synthetic Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic f$0:Lcom/android/wallpaper/picker/LivePreviewFragment;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/LivePreviewFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/picker/LivePreviewFragment;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    iget-object p0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/picker/LivePreviewFragment;

    sget p1, Lcom/android/wallpaper/picker/LivePreviewFragment;->$r8$clinit:I

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    sget-object p1, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->DELETE:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/widget/BottomActionBar;->deselectAction(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    return-void
.end method
