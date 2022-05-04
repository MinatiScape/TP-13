.class public Lcom/android/wallpaper/picker/PreviewFragment$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/material/tabs/TabLayout$BaseOnTabSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/picker/PreviewFragment;->setUpTabs(Lcom/google/android/material/tabs/TabLayout;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/PreviewFragment;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/PreviewFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment$2;->this$0:Lcom/android/wallpaper/picker/PreviewFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTabReselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    return-void
.end method

.method public onTabSelected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment$2;->this$0:Lcom/android/wallpaper/picker/PreviewFragment;

    .line 2
    iget v1, p1, Lcom/google/android/material/tabs/TabLayout$Tab;->position:I

    .line 3
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Optional;->of(Ljava/lang/Object;)Ljava/util/Optional;

    move-result-object v1

    iput-object v1, v0, Lcom/android/wallpaper/picker/PreviewFragment;->mLastSelectedTabPositionOptional:Ljava/util/Optional;

    .line 4
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment$2;->this$0:Lcom/android/wallpaper/picker/PreviewFragment;

    .line 5
    iget p1, p1, Lcom/google/android/material/tabs/TabLayout$Tab;->position:I

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 6
    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/PreviewFragment;->updateScreenPreview(Z)V

    return-void
.end method

.method public onTabUnselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    return-void
.end method
