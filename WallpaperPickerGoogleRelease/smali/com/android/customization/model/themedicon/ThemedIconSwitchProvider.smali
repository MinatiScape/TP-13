.class public Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider$FetchThemedIconEnabledCallback;
    }
.end annotation


# static fields
.field public static sThemedIconSwitchProvider:Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;


# instance fields
.field public final mContentResolver:Landroid/content/ContentResolver;

.field public final mCustomizationPreferences:Lcom/android/customization/module/CustomizationPreferences;

.field public final mExecutorService:Ljava/util/concurrent/ExecutorService;

.field public final mThemedIconUtils:Lcom/android/customization/model/themedicon/ThemedIconUtils;


# direct methods
.method public constructor <init>(Landroid/content/ContentResolver;Lcom/android/customization/model/themedicon/ThemedIconUtils;Lcom/android/customization/module/CustomizationPreferences;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 3
    iput-object p1, p0, Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;->mContentResolver:Landroid/content/ContentResolver;

    .line 4
    iput-object p2, p0, Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;->mThemedIconUtils:Lcom/android/customization/model/themedicon/ThemedIconUtils;

    .line 5
    iput-object p3, p0, Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;->mCustomizationPreferences:Lcom/android/customization/module/CustomizationPreferences;

    return-void
.end method
