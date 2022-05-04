.class public final synthetic Lcom/android/customization/model/color/ColorCustomizationManager$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Z

.field public final synthetic f$1:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider$FetchThemedIconEnabledCallback;Z)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, Lcom/android/customization/model/color/ColorCustomizationManager$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/customization/model/color/ColorCustomizationManager$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    iput-boolean p2, p0, Lcom/android/customization/model/color/ColorCustomizationManager$$ExternalSyntheticLambda0;->f$0:Z

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;Z)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/customization/model/color/ColorCustomizationManager$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/customization/model/color/ColorCustomizationManager$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    iput-boolean p2, p0, Lcom/android/customization/model/color/ColorCustomizationManager$$ExternalSyntheticLambda0;->f$0:Z

    return-void
.end method

.method public synthetic constructor <init>(ZLcom/android/customization/model/CustomizationManager$Callback;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/customization/model/color/ColorCustomizationManager$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/android/customization/model/color/ColorCustomizationManager$$ExternalSyntheticLambda0;->f$0:Z

    iput-object p2, p0, Lcom/android/customization/model/color/ColorCustomizationManager$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    iget v0, p0, Lcom/android/customization/model/color/ColorCustomizationManager$$ExternalSyntheticLambda0;->$r8$classId:I

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    iget-object v0, p0, Lcom/android/customization/model/color/ColorCustomizationManager$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    check-cast v0, Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;

    iget-boolean p0, p0, Lcom/android/customization/model/color/ColorCustomizationManager$$ExternalSyntheticLambda0;->f$0:Z

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 2
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const-string v4, "boolean_value"

    invoke-virtual {v2, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 3
    iget-object v3, v0, Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v4, v0, Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;->mThemedIconUtils:Lcom/android/customization/model/themedicon/ThemedIconUtils;

    const-string v5, "icon_themed"

    invoke-virtual {v4, v5}, Lcom/android/customization/model/themedicon/ThemedIconUtils;->getUriForPath(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v3, v4, v2, v1, v1}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 4
    iget-object v0, v0, Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;->mCustomizationPreferences:Lcom/android/customization/module/CustomizationPreferences;

    invoke-interface {v0, p0}, Lcom/android/customization/module/CustomizationPreferences;->setThemedIconEnabled(Z)V

    :cond_0
    return-void

    .line 5
    :pswitch_1
    iget-boolean v0, p0, Lcom/android/customization/model/color/ColorCustomizationManager$$ExternalSyntheticLambda0;->f$0:Z

    iget-object p0, p0, Lcom/android/customization/model/color/ColorCustomizationManager$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    check-cast p0, Lcom/android/customization/model/CustomizationManager$Callback;

    if-eqz v0, :cond_1

    .line 6
    invoke-interface {p0}, Lcom/android/customization/model/CustomizationManager$Callback;->onSuccess()V

    goto :goto_0

    .line 7
    :cond_1
    invoke-interface {p0, v1}, Lcom/android/customization/model/CustomizationManager$Callback;->onError(Ljava/lang/Throwable;)V

    :goto_0
    return-void

    .line 8
    :goto_1
    iget-object v0, p0, Lcom/android/customization/model/color/ColorCustomizationManager$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    check-cast v0, Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider$FetchThemedIconEnabledCallback;

    iget-boolean p0, p0, Lcom/android/customization/model/color/ColorCustomizationManager$$ExternalSyntheticLambda0;->f$0:Z

    .line 9
    check-cast v0, Lcom/android/customization/model/themedicon/ThemedIconSectionController$$ExternalSyntheticLambda0;

    iget-object v0, v0, Lcom/android/customization/model/themedicon/ThemedIconSectionController$$ExternalSyntheticLambda0;->f$0:Lcom/android/customization/model/themedicon/ThemedIconSectionController;

    .line 10
    iget-object v0, v0, Lcom/android/customization/model/themedicon/ThemedIconSectionController;->mThemedIconSectionView:Lcom/android/customization/picker/themedicon/ThemedIconSectionView;

    .line 11
    iget-object v0, v0, Lcom/android/customization/picker/themedicon/ThemedIconSectionView;->mSwitchView:Landroid/widget/Switch;

    .line 12
    invoke-virtual {v0, p0}, Landroid/widget/Switch;->setChecked(Z)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
