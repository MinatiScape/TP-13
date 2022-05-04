.class public final synthetic Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Consumer;


# static fields
.field public static final synthetic INSTANCE:Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda5;


# direct methods
.method public static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda5;

    invoke-direct {v0}, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda5;-><init>()V

    sput-object v0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda5;->INSTANCE:Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda5;

    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Landroid/view/View;

    sget p0, Lcom/android/wallpaper/picker/CategoryFragment;->$r8$clinit:I

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    return-void
.end method
