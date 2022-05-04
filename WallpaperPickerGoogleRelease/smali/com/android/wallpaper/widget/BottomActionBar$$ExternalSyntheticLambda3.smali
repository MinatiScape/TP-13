.class public final synthetic Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/BiConsumer;


# instance fields
.field public final synthetic f$0:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda3;->f$0:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    iget-object p0, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda3;->f$0:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    check-cast p1, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    check-cast p2, Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;

    sget v0, Lcom/android/wallpaper/widget/BottomActionBar;->$r8$clinit:I

    .line 1
    invoke-virtual {p1, p0}, Ljava/lang/Enum;->equals(Ljava/lang/Object;)Z

    move-result p0

    .line 2
    invoke-virtual {p2, p0}, Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;->setVisibility(Z)V

    return-void
.end method
