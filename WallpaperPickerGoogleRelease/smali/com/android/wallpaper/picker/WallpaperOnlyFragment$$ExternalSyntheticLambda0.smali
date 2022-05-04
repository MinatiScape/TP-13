.class public final synthetic Lcom/android/wallpaper/picker/WallpaperOnlyFragment$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Predicate;


# static fields
.field public static final synthetic INSTANCE:Lcom/android/wallpaper/picker/WallpaperOnlyFragment$$ExternalSyntheticLambda0;


# direct methods
.method public static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/android/wallpaper/picker/WallpaperOnlyFragment$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lcom/android/wallpaper/picker/WallpaperOnlyFragment$$ExternalSyntheticLambda0;-><init>()V

    sput-object v0, Lcom/android/wallpaper/picker/WallpaperOnlyFragment$$ExternalSyntheticLambda0;->INSTANCE:Lcom/android/wallpaper/picker/WallpaperOnlyFragment$$ExternalSyntheticLambda0;

    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 0

    check-cast p1, Lcom/android/wallpaper/model/CustomizationSectionController;

    sget p0, Lcom/android/wallpaper/picker/WallpaperOnlyFragment;->$r8$clinit:I

    .line 1
    instance-of p0, p1, Lcom/android/wallpaper/model/WallpaperSectionController;

    return p0
.end method
