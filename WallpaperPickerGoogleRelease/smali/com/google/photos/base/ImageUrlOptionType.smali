.class public final enum Lcom/google/photos/base/ImageUrlOptionType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/photos/base/ImageUrlOptionType;",
        ">;"
    }
.end annotation


# static fields
.field public static final synthetic $VALUES:[Lcom/google/photos/base/ImageUrlOptionType;

.field public static final enum BOOLEAN:Lcom/google/photos/base/ImageUrlOptionType;

.field public static final enum FIXED_LENGTH_BASE_64:Lcom/google/photos/base/ImageUrlOptionType;

.field public static final enum FLOAT:Lcom/google/photos/base/ImageUrlOptionType;

.field public static final enum INTEGER:Lcom/google/photos/base/ImageUrlOptionType;

.field public static final enum LONG:Lcom/google/photos/base/ImageUrlOptionType;

.field public static final enum PREFIX_HEX:Lcom/google/photos/base/ImageUrlOptionType;

.field public static final enum STRING:Lcom/google/photos/base/ImageUrlOptionType;


# direct methods
.method public static constructor <clinit>()V
    .locals 15

    .line 1
    new-instance v0, Lcom/google/photos/base/ImageUrlOptionType;

    const-string v1, "FIXED_LENGTH_BASE_64"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/photos/base/ImageUrlOptionType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/photos/base/ImageUrlOptionType;->FIXED_LENGTH_BASE_64:Lcom/google/photos/base/ImageUrlOptionType;

    .line 2
    new-instance v1, Lcom/google/photos/base/ImageUrlOptionType;

    const-string v3, "BOOLEAN"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/google/photos/base/ImageUrlOptionType;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/google/photos/base/ImageUrlOptionType;->BOOLEAN:Lcom/google/photos/base/ImageUrlOptionType;

    .line 3
    new-instance v3, Lcom/google/photos/base/ImageUrlOptionType;

    const-string v5, "STRING"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/google/photos/base/ImageUrlOptionType;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/google/photos/base/ImageUrlOptionType;->STRING:Lcom/google/photos/base/ImageUrlOptionType;

    .line 4
    new-instance v5, Lcom/google/photos/base/ImageUrlOptionType;

    const-string v7, "INTEGER"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/google/photos/base/ImageUrlOptionType;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/google/photos/base/ImageUrlOptionType;->INTEGER:Lcom/google/photos/base/ImageUrlOptionType;

    .line 5
    new-instance v7, Lcom/google/photos/base/ImageUrlOptionType;

    const-string v9, "LONG"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/google/photos/base/ImageUrlOptionType;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/google/photos/base/ImageUrlOptionType;->LONG:Lcom/google/photos/base/ImageUrlOptionType;

    .line 6
    new-instance v9, Lcom/google/photos/base/ImageUrlOptionType;

    const-string v11, "FLOAT"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/google/photos/base/ImageUrlOptionType;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/google/photos/base/ImageUrlOptionType;->FLOAT:Lcom/google/photos/base/ImageUrlOptionType;

    .line 7
    new-instance v11, Lcom/google/photos/base/ImageUrlOptionType;

    const-string v13, "PREFIX_HEX"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/google/photos/base/ImageUrlOptionType;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/google/photos/base/ImageUrlOptionType;->PREFIX_HEX:Lcom/google/photos/base/ImageUrlOptionType;

    const/4 v13, 0x7

    new-array v13, v13, [Lcom/google/photos/base/ImageUrlOptionType;

    aput-object v0, v13, v2

    aput-object v1, v13, v4

    aput-object v3, v13, v6

    aput-object v5, v13, v8

    aput-object v7, v13, v10

    aput-object v9, v13, v12

    aput-object v11, v13, v14

    .line 8
    sput-object v13, Lcom/google/photos/base/ImageUrlOptionType;->$VALUES:[Lcom/google/photos/base/ImageUrlOptionType;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "$enum$name",
            "$enum$ordinal"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/photos/base/ImageUrlOptionType;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            "name"
        }
    .end annotation

    .line 1
    const-class v0, Lcom/google/photos/base/ImageUrlOptionType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/photos/base/ImageUrlOptionType;

    return-object p0
.end method

.method public static values()[Lcom/google/photos/base/ImageUrlOptionType;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/photos/base/ImageUrlOptionType;->$VALUES:[Lcom/google/photos/base/ImageUrlOptionType;

    invoke-virtual {v0}, [Lcom/google/photos/base/ImageUrlOptionType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/photos/base/ImageUrlOptionType;

    return-object v0
.end method
