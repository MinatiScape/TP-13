.class public final synthetic Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Consumer;


# static fields
.field public static final synthetic INSTANCE:Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda7;


# direct methods
.method public static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda7;

    invoke-direct {v0}, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda7;-><init>()V

    sput-object v0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda7;->INSTANCE:Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda7;

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

    sget p0, Lcom/android/wallpaper/widget/BottomActionBar;->$r8$clinit:I

    const/4 p0, 0x0

    .line 1
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
