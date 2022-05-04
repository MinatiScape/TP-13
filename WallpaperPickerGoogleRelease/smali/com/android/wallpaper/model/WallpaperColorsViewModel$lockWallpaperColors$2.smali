.class public final Lcom/android/wallpaper/model/WallpaperColorsViewModel$lockWallpaperColors$2;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/model/WallpaperColorsViewModel;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Landroidx/lifecycle/MutableLiveData<",
        "Landroid/app/WallpaperColors;",
        ">;>;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/android/wallpaper/model/WallpaperColorsViewModel$lockWallpaperColors$2;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/android/wallpaper/model/WallpaperColorsViewModel$lockWallpaperColors$2;

    invoke-direct {v0}, Lcom/android/wallpaper/model/WallpaperColorsViewModel$lockWallpaperColors$2;-><init>()V

    sput-object v0, Lcom/android/wallpaper/model/WallpaperColorsViewModel$lockWallpaperColors$2;->INSTANCE:Lcom/android/wallpaper/model/WallpaperColorsViewModel$lockWallpaperColors$2;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    new-instance p0, Landroidx/lifecycle/MutableLiveData;

    invoke-direct {p0}, Landroidx/lifecycle/MutableLiveData;-><init>()V

    return-object p0
.end method
