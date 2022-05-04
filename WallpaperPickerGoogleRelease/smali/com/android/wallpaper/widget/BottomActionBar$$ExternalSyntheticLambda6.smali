.class public final synthetic Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic f$0:Z


# direct methods
.method public synthetic constructor <init>(Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda6;->f$0:Z

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    iget-boolean p0, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda6;->f$0:Z

    check-cast p1, Lcom/android/wallpaper/widget/BottomActionBar$VisibilityChangeListener;

    sget v0, Lcom/android/wallpaper/widget/BottomActionBar;->$r8$clinit:I

    .line 1
    invoke-interface {p1, p0}, Lcom/android/wallpaper/widget/BottomActionBar$VisibilityChangeListener;->onVisibilityChange(Z)V

    return-void
.end method
