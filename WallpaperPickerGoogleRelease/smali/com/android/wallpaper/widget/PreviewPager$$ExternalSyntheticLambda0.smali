.class public final synthetic Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Lcom/android/wallpaper/widget/PreviewPager;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/widget/PreviewPager;I)V
    .locals 0

    iput p2, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/widget/PreviewPager;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    iget p1, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda0;->$r8$classId:I

    const/4 v0, 0x1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p0, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/widget/PreviewPager;

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/widget/PreviewPager;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    .line 2
    iget p1, p0, Landroidx/viewpager/widget/ViewPager;->mCurItem:I

    sub-int/2addr p1, v0

    .line 3
    invoke-virtual {p0, p1, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(IZ)V

    return-void

    .line 4
    :goto_0
    iget-object p0, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/widget/PreviewPager;

    .line 5
    iget-object p0, p0, Lcom/android/wallpaper/widget/PreviewPager;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    .line 6
    iget p1, p0, Landroidx/viewpager/widget/ViewPager;->mCurItem:I

    add-int/2addr p1, v0

    .line 7
    invoke-virtual {p0, p1, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(IZ)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
