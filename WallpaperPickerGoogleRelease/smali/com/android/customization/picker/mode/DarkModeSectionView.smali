.class public final Lcom/android/customization/picker/mode/DarkModeSectionView;
.super Lcom/android/wallpaper/picker/SectionView;
.source "SourceFile"


# instance fields
.field public mIsDarkModeActivated:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/wallpaper/picker/SectionView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const p2, 0x7f1100bf

    .line 2
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 3
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    iget p1, p1, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 p1, p1, 0x20

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/android/customization/picker/mode/DarkModeSectionView;->mIsDarkModeActivated:Z

    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    const v0, 0x7f0a00c5

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    .line 3
    iget-boolean v1, p0, Lcom/android/customization/picker/mode/DarkModeSectionView;->mIsDarkModeActivated:Z

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 4
    new-instance v1, Lcom/android/customization/picker/mode/DarkModeSectionView$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, v0}, Lcom/android/customization/picker/mode/DarkModeSectionView$$ExternalSyntheticLambda0;-><init>(Lcom/android/customization/picker/mode/DarkModeSectionView;Landroid/widget/Switch;)V

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 5
    new-instance v0, Lcom/android/wallpaper/picker/AppbarFragment$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/picker/AppbarFragment$$ExternalSyntheticLambda0;-><init>(Lcom/android/customization/picker/mode/DarkModeSectionView;)V

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public setEnabled(Z)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 2
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/view/View;->setEnabled(Z)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
