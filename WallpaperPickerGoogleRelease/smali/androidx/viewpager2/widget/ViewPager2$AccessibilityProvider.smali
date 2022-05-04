.class public abstract Landroidx/viewpager2/widget/ViewPager2$AccessibilityProvider;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/viewpager2/widget/ViewPager2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401
    name = "AccessibilityProvider"
.end annotation


# direct methods
.method public constructor <init>(Landroidx/viewpager2/widget/ViewPager2;Landroidx/viewpager2/widget/ViewPager2$1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract onAttachAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
            "*>;)V"
        }
    .end annotation
.end method

.method public abstract onDetachAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
            "*>;)V"
        }
    .end annotation
.end method

.method public abstract onInitialize(Landroidx/viewpager2/widget/CompositeOnPageChangeCallback;Landroidx/recyclerview/widget/RecyclerView;)V
.end method

.method public abstract onRestorePendingState()V
.end method

.method public abstract onSetNewCurrentItem()V
.end method
