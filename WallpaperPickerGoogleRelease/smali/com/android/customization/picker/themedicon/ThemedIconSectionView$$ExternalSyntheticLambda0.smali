.class public final synthetic Lcom/android/customization/picker/themedicon/ThemedIconSectionView$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field public final synthetic f$0:Lcom/android/customization/picker/themedicon/ThemedIconSectionView;


# direct methods
.method public synthetic constructor <init>(Lcom/android/customization/picker/themedicon/ThemedIconSectionView;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/customization/picker/themedicon/ThemedIconSectionView$$ExternalSyntheticLambda0;->f$0:Lcom/android/customization/picker/themedicon/ThemedIconSectionView;

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    iget-object p0, p0, Lcom/android/customization/picker/themedicon/ThemedIconSectionView$$ExternalSyntheticLambda0;->f$0:Lcom/android/customization/picker/themedicon/ThemedIconSectionView;

    sget p1, Lcom/android/customization/picker/themedicon/ThemedIconSectionView;->$r8$clinit:I

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/picker/SectionView;->mSectionViewListener:Lcom/android/wallpaper/picker/SectionView$SectionViewListener;

    if-eqz p1, :cond_0

    .line 2
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-interface {p1, p0, p2}, Lcom/android/wallpaper/picker/SectionView$SectionViewListener;->onViewActivated(Landroid/content/Context;Z)V

    :cond_0
    return-void
.end method
