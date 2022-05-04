.class public final Lcom/android/wallpaper/widget/SeparatedTabLayout;
.super Lcom/google/android/material/tabs/TabLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/widget/SeparatedTabLayout$SeparatedTabLayoutOnPageChangeCallback;,
        Lcom/android/wallpaper/widget/SeparatedTabLayout$SeparatedTabLayoutOnTabSelectedListener;
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/google/android/material/tabs/TabLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public newTab()Lcom/google/android/material/tabs/TabLayout$Tab;
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/google/android/material/tabs/TabLayout;->newTab()Lcom/google/android/material/tabs/TabLayout$Tab;

    move-result-object p0

    .line 2
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout$Tab;->view:Lcom/google/android/material/tabs/TabLayout$TabView;

    const v1, 0x7f080108

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    return-object p0
.end method
