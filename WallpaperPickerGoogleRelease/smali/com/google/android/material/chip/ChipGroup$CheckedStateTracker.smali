.class public Lcom/google/android/material/chip/ChipGroup$CheckedStateTracker;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/chip/ChipGroup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "CheckedStateTracker"
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/google/android/material/chip/ChipGroup;


# direct methods
.method public constructor <init>(Lcom/google/android/material/chip/ChipGroup;Lcom/google/android/material/chip/ChipGroup$1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/chip/ChipGroup$CheckedStateTracker;->this$0:Lcom/google/android/material/chip/ChipGroup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/ChipGroup$CheckedStateTracker;->this$0:Lcom/google/android/material/chip/ChipGroup;

    .line 2
    iget-boolean v1, v0, Lcom/google/android/material/chip/ChipGroup;->protectFromCheckedChange:Z

    if-eqz v1, :cond_0

    return-void

    .line 3
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    move v3, v2

    .line 4
    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    if-ge v3, v4, :cond_2

    .line 5
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 6
    instance-of v5, v4, Lcom/google/android/material/chip/Chip;

    if-eqz v5, :cond_1

    .line 7
    move-object v5, v4

    check-cast v5, Lcom/google/android/material/chip/Chip;

    invoke-virtual {v5}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 8
    invoke-virtual {v4}, Landroid/view/View;->getId()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    iget-boolean v4, v0, Lcom/google/android/material/chip/ChipGroup;->singleSelection:Z

    if-eqz v4, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 10
    :cond_2
    :goto_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/google/android/material/chip/ChipGroup$CheckedStateTracker;->this$0:Lcom/google/android/material/chip/ChipGroup;

    .line 11
    iget-boolean v1, v0, Lcom/google/android/material/chip/ChipGroup;->selectionRequired:Z

    if-eqz v1, :cond_3

    .line 12
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->getId()I

    move-result p2

    const/4 v1, 0x1

    .line 13
    invoke-virtual {v0, p2, v1}, Lcom/google/android/material/chip/ChipGroup;->setCheckedStateForView(IZ)V

    .line 14
    iget-object p0, p0, Lcom/google/android/material/chip/ChipGroup$CheckedStateTracker;->this$0:Lcom/google/android/material/chip/ChipGroup;

    invoke-virtual {p1}, Landroid/widget/CompoundButton;->getId()I

    move-result p1

    .line 15
    iput p1, p0, Lcom/google/android/material/chip/ChipGroup;->checkedId:I

    return-void

    .line 16
    :cond_3
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->getId()I

    move-result p1

    const/4 v0, -0x1

    if-eqz p2, :cond_5

    .line 17
    iget-object p2, p0, Lcom/google/android/material/chip/ChipGroup$CheckedStateTracker;->this$0:Lcom/google/android/material/chip/ChipGroup;

    .line 18
    iget v1, p2, Lcom/google/android/material/chip/ChipGroup;->checkedId:I

    if-eq v1, v0, :cond_4

    if-eq v1, p1, :cond_4

    .line 19
    iget-boolean v0, p2, Lcom/google/android/material/chip/ChipGroup;->singleSelection:Z

    if-eqz v0, :cond_4

    .line 20
    invoke-virtual {p2, v1, v2}, Lcom/google/android/material/chip/ChipGroup;->setCheckedStateForView(IZ)V

    .line 21
    :cond_4
    iget-object p0, p0, Lcom/google/android/material/chip/ChipGroup$CheckedStateTracker;->this$0:Lcom/google/android/material/chip/ChipGroup;

    .line 22
    iput p1, p0, Lcom/google/android/material/chip/ChipGroup;->checkedId:I

    goto :goto_2

    .line 23
    :cond_5
    iget-object p0, p0, Lcom/google/android/material/chip/ChipGroup$CheckedStateTracker;->this$0:Lcom/google/android/material/chip/ChipGroup;

    .line 24
    iget p2, p0, Lcom/google/android/material/chip/ChipGroup;->checkedId:I

    if-ne p2, p1, :cond_6

    .line 25
    iput v0, p0, Lcom/google/android/material/chip/ChipGroup;->checkedId:I

    :cond_6
    :goto_2
    return-void
.end method
