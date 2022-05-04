.class public Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/model/WallpaperRotationInitializer$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->startRotation(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

.field public final synthetic val$appContext:Landroid/content/Context;

.field public final synthetic val$networkPreference:I


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;Landroid/content/Context;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$7;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iput-object p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$7;->val$appContext:Landroid/content/Context;

    iput p3, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$7;->val$networkPreference:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$7;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    .line 2
    iget-object v0, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 3
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$7;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$7;->val$networkPreference:I

    invoke-static {v0, v1}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->access$1000(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;I)V

    .line 5
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$7;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mFormFactor:I

    if-nez v0, :cond_1

    .line 6
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object p0

    check-cast p0, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;

    .line 8
    invoke-virtual {p0, v0}, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;->setSelectionState(I)V

    :cond_1
    return-void
.end method

.method public onFirstWallpaperInRotationSet()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$7;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    .line 2
    iget-object v0, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 3
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$7;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$7;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget-object v1, v1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpaperRotationInitializer:Lcom/android/wallpaper/model/WallpaperRotationInitializer;

    iget-object v2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$7;->val$appContext:Landroid/content/Context;

    invoke-interface {v1, v2}, Lcom/android/wallpaper/model/WallpaperRotationInitializer;->startRotation(Landroid/content/Context;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    if-eqz v0, :cond_1

    .line 6
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$7;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget v3, v1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mFormFactor:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    .line 7
    :try_start_0
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    const v3, 0x7f110149

    invoke-static {v1, v3, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    .line 8
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 9
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not show toast "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "IndividualPickerFrgmnt"

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    const/4 v1, -0x1

    .line 10
    invoke-virtual {v0, v1}, Landroid/app/Activity;->setResult(I)V

    .line 11
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 12
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$7;->val$appContext:Landroid/content/Context;

    invoke-static {p0}, Landroidx/cardview/R$style;->launchHome(Landroid/content/Context;)V

    goto :goto_1

    .line 13
    :cond_1
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$7;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mFormFactor:I

    if-nez v0, :cond_3

    .line 14
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mAdapter:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;

    invoke-static {p0, v2}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->access$200(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;I)V

    goto :goto_1

    .line 15
    :cond_2
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$7;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$7;->val$networkPreference:I

    invoke-static {v0, v1}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->access$1000(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;I)V

    .line 16
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$7;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mFormFactor:I

    if-nez v0, :cond_3

    .line 17
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    .line 18
    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object p0

    check-cast p0, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;

    .line 19
    invoke-virtual {p0, v2}, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;->setSelectionState(I)V

    :cond_3
    :goto_1
    return-void
.end method
