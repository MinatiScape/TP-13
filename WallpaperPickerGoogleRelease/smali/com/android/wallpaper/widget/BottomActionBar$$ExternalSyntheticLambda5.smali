.class public final synthetic Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic f$0:Lcom/android/wallpaper/widget/BottomActionBar;

.field public final synthetic f$1:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/widget/BottomActionBar;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda5;->f$0:Lcom/android/wallpaper/widget/BottomActionBar;

    iput-object p2, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda5;->f$1:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 2

    iget-object v0, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda5;->f$0:Lcom/android/wallpaper/widget/BottomActionBar;

    iget-object p0, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda5;->f$1:Landroid/content/Context;

    check-cast p1, Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;

    sget v1, Lcom/android/wallpaper/widget/BottomActionBar;->$r8$clinit:I

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1
    iget-object v1, p1, Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;->mContentView:Landroid/view/View;

    invoke-virtual {p1, v1}, Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;->onRecreateView(Landroid/view/View;)V

    .line 2
    invoke-virtual {p1, p0}, Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object p0

    iput-object p0, p1, Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;->mContentView:Landroid/view/View;

    .line 3
    iget-boolean p0, p1, Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;->mIsVisible:Z

    invoke-virtual {p1, p0}, Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;->setVisibility(Z)V

    .line 4
    iget-object p0, v0, Lcom/android/wallpaper/widget/BottomActionBar;->mBottomSheetView:Landroid/view/ViewGroup;

    .line 5
    iget-object p1, p1, Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;->mContentView:Landroid/view/View;

    .line 6
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-void
.end method
