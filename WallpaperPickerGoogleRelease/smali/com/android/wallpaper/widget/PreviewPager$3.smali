.class public Lcom/android/wallpaper/widget/PreviewPager$3;
.super Landroid/database/DataSetObserver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/widget/PreviewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V
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
    iput-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager$3;->this$0:Lcom/android/wallpaper/widget/PreviewPager;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/widget/PreviewPager$3;->this$0:Lcom/android/wallpaper/widget/PreviewPager;

    sget v0, Lcom/android/wallpaper/widget/PreviewPager;->$r8$clinit:I

    .line 2
    invoke-virtual {p0}, Lcom/android/wallpaper/widget/PreviewPager;->initIndicator()V

    return-void
.end method
