.class public Lcom/android/wallpaper/widget/PreviewPager$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/widget/PreviewPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/widget/PreviewPager;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/widget/PreviewPager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager$1;->this$0:Lcom/android/wallpaper/widget/PreviewPager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/android/wallpaper/widget/PreviewPager$1;->this$0:Lcom/android/wallpaper/widget/PreviewPager;

    .line 2
    iget-object p2, p2, Lcom/android/wallpaper/widget/PreviewPager;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getPaddingEnd()I

    move-result p1

    invoke-virtual {p2, p1}, Landroidx/viewpager/widget/ViewPager;->setPageMargin(I)V

    .line 4
    iget-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager$1;->this$0:Lcom/android/wallpaper/widget/PreviewPager;

    .line 5
    iget-object p1, p1, Lcom/android/wallpaper/widget/PreviewPager;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    .line 6
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    return-void
.end method
