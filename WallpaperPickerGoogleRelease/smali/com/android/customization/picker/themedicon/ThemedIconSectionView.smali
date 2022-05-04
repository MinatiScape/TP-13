.class public Lcom/android/customization/picker/themedicon/ThemedIconSectionView;
.super Lcom/android/wallpaper/picker/SectionView;
.source "SourceFile"


# static fields
.field public static final synthetic $r8$clinit:I


# instance fields
.field public mSwitchView:Landroid/widget/Switch;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/wallpaper/picker/SectionView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const p0, 0x7f110137

    .line 2
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    const v0, 0x7f0a0263

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    iput-object v0, p0, Lcom/android/customization/picker/themedicon/ThemedIconSectionView;->mSwitchView:Landroid/widget/Switch;

    .line 3
    new-instance v0, Lcom/android/wallpaper/picker/AppbarFragment$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/picker/AppbarFragment$$ExternalSyntheticLambda0;-><init>(Lcom/android/customization/picker/themedicon/ThemedIconSectionView;)V

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 4
    iget-object v0, p0, Lcom/android/customization/picker/themedicon/ThemedIconSectionView;->mSwitchView:Landroid/widget/Switch;

    new-instance v1, Lcom/android/customization/picker/themedicon/ThemedIconSectionView$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/android/customization/picker/themedicon/ThemedIconSectionView$$ExternalSyntheticLambda0;-><init>(Lcom/android/customization/picker/themedicon/ThemedIconSectionView;)V

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    return-void
.end method
