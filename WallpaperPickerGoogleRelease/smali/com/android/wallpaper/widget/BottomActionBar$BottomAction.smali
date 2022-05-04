.class public final enum Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/widget/BottomActionBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "BottomAction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;",
        ">;"
    }
.end annotation


# static fields
.field public static final synthetic $VALUES:[Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

.field public static final enum APPLY:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

.field public static final enum APPLY_TEXT:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

.field public static final enum CUSTOMIZE:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

.field public static final enum DELETE:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

.field public static final enum DOWNLOAD:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

.field public static final enum EDIT:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

.field public static final enum INFORMATION:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

.field public static final enum PROGRESS:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

.field public static final enum ROTATION:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;


# instance fields
.field private final mHiddenAccessibilityResId:I

.field private final mShownAccessibilityResId:I


# direct methods
.method public static constructor <clinit>()V
    .locals 16

    .line 1
    new-instance v0, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const-string v1, "ROTATION"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->ROTATION:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    .line 2
    new-instance v1, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const-string v3, "DELETE"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->DELETE:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    .line 3
    new-instance v3, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const-string v5, "INFORMATION"

    const/4 v6, 0x2

    const v7, 0x7f11002f

    const v8, 0x7f11002e

    invoke-direct {v3, v5, v6, v7, v8}, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;-><init>(Ljava/lang/String;III)V

    sput-object v3, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->INFORMATION:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    .line 4
    new-instance v5, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const-string v7, "EDIT"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->EDIT:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    .line 5
    new-instance v7, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const-string v9, "CUSTOMIZE"

    const/4 v10, 0x4

    const v11, 0x7f11002d

    const v12, 0x7f11002c

    invoke-direct {v7, v9, v10, v11, v12}, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;-><init>(Ljava/lang/String;III)V

    sput-object v7, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->CUSTOMIZE:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    .line 6
    new-instance v9, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const-string v11, "DOWNLOAD"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->DOWNLOAD:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    .line 7
    new-instance v11, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const-string v13, "PROGRESS"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->PROGRESS:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    .line 8
    new-instance v13, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const-string v15, "APPLY"

    const/4 v14, 0x7

    invoke-direct {v13, v15, v14}, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->APPLY:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    .line 9
    new-instance v15, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const-string v14, "APPLY_TEXT"

    const/16 v12, 0x8

    invoke-direct {v15, v14, v12}, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;-><init>(Ljava/lang/String;I)V

    sput-object v15, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->APPLY_TEXT:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const/16 v14, 0x9

    new-array v14, v14, [Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    aput-object v0, v14, v2

    aput-object v1, v14, v4

    aput-object v3, v14, v6

    aput-object v5, v14, v8

    aput-object v7, v14, v10

    const/4 v0, 0x5

    aput-object v9, v14, v0

    const/4 v0, 0x6

    aput-object v11, v14, v0

    const/4 v0, 0x7

    aput-object v13, v14, v0

    aput-object v15, v14, v12

    .line 10
    sput-object v14, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->$VALUES:[Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    const/4 p1, 0x0

    .line 2
    iput p1, p0, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->mShownAccessibilityResId:I

    .line 3
    iput p1, p0, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->mHiddenAccessibilityResId:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;III)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)V"
        }
    .end annotation

    .line 4
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 5
    iput p3, p0, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->mShownAccessibilityResId:I

    .line 6
    iput p4, p0, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->mHiddenAccessibilityResId:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;
    .locals 1

    .line 1
    const-class v0, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    return-object p0
.end method

.method public static values()[Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->$VALUES:[Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    invoke-virtual {v0}, [Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    return-object v0
.end method


# virtual methods
.method public getAccessibilityStringRes(Z)I
    .locals 0

    if-eqz p1, :cond_0

    .line 1
    iget p0, p0, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->mShownAccessibilityResId:I

    goto :goto_0

    :cond_0
    iget p0, p0, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->mHiddenAccessibilityResId:I

    :goto_0
    return p0
.end method
