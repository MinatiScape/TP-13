.class public Lcom/google/photos/base/BaseImageUrlUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/photos/base/BaseImageUrlUtil$UriWrapper;,
        Lcom/google/photos/base/BaseImageUrlUtil$InvalidUrlException;,
        Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final JOIN_ON_DASH:Lcom/google/common/base/Joiner;

.field public static final JOIN_ON_EQUALS:Lcom/google/common/base/Joiner;

.field public static final JOIN_ON_SLASH:Lcom/google/common/base/Joiner;

.field public static final OPTIONS:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final SPLIT_ON_DASH:Lcom/google/common/base/Splitter;

.field public static final SPLIT_ON_EQUALS:Lcom/google/common/base/Splitter;

.field public static final SPLIT_ON_SLASH:Lcom/google/common/base/Splitter;


# direct methods
.method public static constructor <clinit>()V
    .locals 22

    const/16 v0, 0x3d

    .line 1
    invoke-static {v0}, Lcom/google/common/base/Splitter;->on(C)Lcom/google/common/base/Splitter;

    move-result-object v1

    .line 2
    iget-object v2, v1, Lcom/google/common/base/Splitter;->strategy:Lcom/google/common/base/Splitter$Strategy;

    iget-object v1, v1, Lcom/google/common/base/Splitter;->trimmer:Lcom/google/common/base/CharMatcher;

    .line 3
    new-instance v3, Lcom/google/common/base/Splitter;

    const/4 v4, 0x1

    const/4 v5, 0x2

    invoke-direct {v3, v2, v4, v1, v5}, Lcom/google/common/base/Splitter;-><init>(Lcom/google/common/base/Splitter$Strategy;ZLcom/google/common/base/CharMatcher;I)V

    .line 4
    sput-object v3, Lcom/google/photos/base/BaseImageUrlUtil;->SPLIT_ON_EQUALS:Lcom/google/common/base/Splitter;

    const/16 v1, 0x2f

    .line 5
    invoke-static {v1}, Lcom/google/common/base/Splitter;->on(C)Lcom/google/common/base/Splitter;

    move-result-object v2

    sput-object v2, Lcom/google/photos/base/BaseImageUrlUtil;->SPLIT_ON_SLASH:Lcom/google/common/base/Splitter;

    const/16 v2, 0x2d

    .line 6
    invoke-static {v2}, Lcom/google/common/base/Splitter;->on(C)Lcom/google/common/base/Splitter;

    move-result-object v3

    sput-object v3, Lcom/google/photos/base/BaseImageUrlUtil;->SPLIT_ON_DASH:Lcom/google/common/base/Splitter;

    const/16 v3, 0x3a

    .line 7
    invoke-static {v3}, Lcom/google/common/base/Splitter;->on(C)Lcom/google/common/base/Splitter;

    .line 8
    new-instance v6, Lcom/google/common/base/Joiner;

    const-string v7, "/"

    invoke-direct {v6, v7}, Lcom/google/common/base/Joiner;-><init>(Ljava/lang/String;)V

    .line 9
    sput-object v6, Lcom/google/photos/base/BaseImageUrlUtil;->JOIN_ON_SLASH:Lcom/google/common/base/Joiner;

    .line 10
    new-instance v6, Lcom/google/common/base/Joiner;

    const-string v7, "-"

    invoke-direct {v6, v7}, Lcom/google/common/base/Joiner;-><init>(Ljava/lang/String;)V

    .line 11
    sput-object v6, Lcom/google/photos/base/BaseImageUrlUtil;->JOIN_ON_DASH:Lcom/google/common/base/Joiner;

    .line 12
    new-instance v6, Lcom/google/common/base/Joiner;

    const-string v7, "="

    invoke-direct {v6, v7}, Lcom/google/common/base/Joiner;-><init>(Ljava/lang/String;)V

    .line 13
    sput-object v6, Lcom/google/photos/base/BaseImageUrlUtil;->JOIN_ON_EQUALS:Lcom/google/common/base/Joiner;

    .line 14
    new-instance v6, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v7, "s"

    const/4 v8, 0x0

    invoke-direct {v6, v7, v8}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    new-instance v9, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v10, "w"

    invoke-direct {v9, v10, v8}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    new-instance v10, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v11, "c"

    invoke-direct {v10, v11, v4}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    new-instance v12, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v13, "d"

    invoke-direct {v12, v13, v4}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    new-instance v13, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v14, "h"

    invoke-direct {v13, v14, v8}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    new-instance v15, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    invoke-direct {v15, v7, v4}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    new-instance v7, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    invoke-direct {v7, v14, v4}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    new-instance v14, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v0, "p"

    invoke-direct {v14, v0, v4}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    new-instance v3, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "pp"

    invoke-direct {v3, v1, v4}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    new-instance v1, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v2, "pf"

    invoke-direct {v1, v2, v4}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    new-instance v2, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v5, "n"

    invoke-direct {v2, v5, v4}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    new-instance v5, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v4, "r"

    invoke-direct {v5, v4, v8}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v8, 0x3e

    move-object/from16 v17, v5

    new-array v5, v8, [Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    new-instance v8, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    move-object/from16 v18, v2

    const/4 v2, 0x1

    invoke-direct {v8, v4, v2}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/4 v4, 0x0

    aput-object v8, v5, v4

    new-instance v8, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v4, "o"

    invoke-direct {v8, v4, v2}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    aput-object v8, v5, v2

    new-instance v2, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const/4 v8, 0x0

    invoke-direct {v2, v4, v8}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/4 v4, 0x2

    aput-object v2, v5, v4

    new-instance v2, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v4, "j"

    invoke-direct {v2, v4, v8}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/4 v4, 0x3

    aput-object v2, v5, v4

    new-instance v2, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v4, "x"

    invoke-direct {v2, v4, v8}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/4 v4, 0x4

    aput-object v2, v5, v4

    new-instance v2, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v4, "y"

    invoke-direct {v2, v4, v8}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/4 v4, 0x5

    aput-object v2, v5, v4

    new-instance v2, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v4, "z"

    invoke-direct {v2, v4, v8}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/4 v4, 0x6

    aput-object v2, v5, v4

    new-instance v2, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v4, "g"

    const/4 v8, 0x1

    invoke-direct {v2, v4, v8}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/4 v4, 0x7

    aput-object v2, v5, v4

    new-instance v2, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v8, "e"

    const/4 v4, 0x0

    invoke-direct {v2, v8, v4}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v8, 0x8

    aput-object v2, v5, v8

    new-instance v2, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v8, "f"

    invoke-direct {v2, v8, v4}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v4, 0x9

    aput-object v2, v5, v4

    new-instance v2, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v8, "k"

    const/4 v4, 0x1

    invoke-direct {v2, v8, v4}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v19, 0xa

    aput-object v2, v5, v19

    new-instance v2, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    move-object/from16 v20, v1

    const-string v1, "u"

    invoke-direct {v2, v1, v4}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0xb

    aput-object v2, v5, v1

    new-instance v2, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "ut"

    invoke-direct {v2, v1, v4}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0xc

    aput-object v2, v5, v1

    new-instance v2, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "i"

    invoke-direct {v2, v1, v4}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0xd

    aput-object v2, v5, v1

    new-instance v1, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v2, "a"

    invoke-direct {v1, v2, v4}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v16, 0xe

    aput-object v1, v5, v16

    new-instance v1, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    move-object/from16 v21, v3

    const-string v3, "b"

    invoke-direct {v1, v3, v4}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v4, 0xf

    aput-object v1, v5, v4

    new-instance v1, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const/4 v4, 0x0

    invoke-direct {v1, v3, v4}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v3, 0x10

    aput-object v1, v5, v3

    new-instance v1, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    invoke-direct {v1, v11, v4}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v3, 0x11

    aput-object v1, v5, v3

    new-instance v1, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v3, "t"

    invoke-direct {v1, v3, v4}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v3, 0x12

    aput-object v1, v5, v3

    new-instance v1, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v3, "nt0"

    invoke-direct {v1, v3, v4}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v3, 0x13

    aput-object v1, v5, v3

    new-instance v1, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v3, "v"

    const/4 v11, 0x1

    invoke-direct {v1, v3, v11}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v16, 0x14

    aput-object v1, v5, v16

    new-instance v1, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v11, "q"

    invoke-direct {v1, v11, v4}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v4, 0x15

    aput-object v1, v5, v4

    new-instance v1, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v4, "fh"

    const/4 v11, 0x1

    invoke-direct {v1, v4, v11}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v4, 0x16

    aput-object v1, v5, v4

    new-instance v1, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v4, "fv"

    invoke-direct {v1, v4, v11}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v4, 0x17

    aput-object v1, v5, v4

    new-instance v1, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v4, "fg"

    invoke-direct {v1, v4, v11}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v4, 0x18

    aput-object v1, v5, v4

    new-instance v1, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v4, "ci"

    invoke-direct {v1, v4, v11}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v4, 0x19

    aput-object v1, v5, v4

    new-instance v1, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v4, "rw"

    invoke-direct {v1, v4, v11}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v4, 0x1a

    aput-object v1, v5, v4

    new-instance v1, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v4, "rwu"

    invoke-direct {v1, v4, v11}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v4, 0x1b

    aput-object v1, v5, v4

    new-instance v1, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v4, "rwa"

    invoke-direct {v1, v4, v11}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v4, 0x1c

    aput-object v1, v5, v4

    new-instance v1, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v4, "nw"

    invoke-direct {v1, v4, v11}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v4, 0x1d

    aput-object v1, v5, v4

    new-instance v1, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v4, "rh"

    invoke-direct {v1, v4, v11}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v4, 0x1e

    aput-object v1, v5, v4

    new-instance v1, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v4, "no"

    invoke-direct {v1, v4, v11}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v4, 0x1f

    aput-object v1, v5, v4

    new-instance v1, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v4, "ns"

    invoke-direct {v1, v4, v11}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v4, 0x20

    aput-object v1, v5, v4

    new-instance v1, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const/4 v4, 0x0

    invoke-direct {v1, v8, v4}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v8, 0x21

    aput-object v1, v5, v8

    new-instance v1, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    invoke-direct {v1, v0, v4}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v0, 0x22

    aput-object v1, v5, v0

    new-instance v0, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "l"

    invoke-direct {v0, v1, v4}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0x23

    aput-object v0, v5, v1

    new-instance v0, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    invoke-direct {v0, v3, v4}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0x24

    aput-object v0, v5, v1

    new-instance v0, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "nu"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0x25

    aput-object v0, v5, v1

    new-instance v0, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "ft"

    invoke-direct {v0, v1, v3}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0x26

    aput-object v0, v5, v1

    new-instance v0, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "cc"

    invoke-direct {v0, v1, v3}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0x27

    aput-object v0, v5, v1

    new-instance v0, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "nd"

    invoke-direct {v0, v1, v3}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0x28

    aput-object v0, v5, v1

    new-instance v0, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "ip"

    invoke-direct {v0, v1, v3}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0x29

    aput-object v0, v5, v1

    new-instance v0, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "nc"

    invoke-direct {v0, v1, v3}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0x2a

    aput-object v0, v5, v1

    new-instance v0, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const/4 v1, 0x0

    invoke-direct {v0, v2, v1}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0x2b

    aput-object v0, v5, v1

    new-instance v0, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "rj"

    invoke-direct {v0, v1, v3}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0x2c

    aput-object v0, v5, v1

    new-instance v0, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "rp"

    invoke-direct {v0, v1, v3}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0x2d

    aput-object v0, v5, v1

    new-instance v0, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "rg"

    invoke-direct {v0, v1, v3}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0x2e

    aput-object v0, v5, v1

    new-instance v0, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "pd"

    invoke-direct {v0, v1, v3}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0x2f

    aput-object v0, v5, v1

    new-instance v0, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "pa"

    invoke-direct {v0, v1, v3}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0x30

    aput-object v0, v5, v1

    new-instance v0, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "m"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0x31

    aput-object v0, v5, v1

    new-instance v0, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "vb"

    invoke-direct {v0, v1, v2}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0x32

    aput-object v0, v5, v1

    new-instance v0, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "vl"

    invoke-direct {v0, v1, v2}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0x33

    aput-object v0, v5, v1

    new-instance v0, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "lf"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0x34

    aput-object v0, v5, v1

    new-instance v0, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "mv"

    invoke-direct {v0, v1, v2}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0x35

    aput-object v0, v5, v1

    new-instance v0, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "id"

    invoke-direct {v0, v1, v2}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0x36

    aput-object v0, v5, v1

    new-instance v0, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "al"

    invoke-direct {v0, v1, v2}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0x37

    aput-object v0, v5, v1

    new-instance v0, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "ic"

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0x38

    aput-object v0, v5, v1

    new-instance v0, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "pg"

    invoke-direct {v0, v1, v2}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0x39

    aput-object v0, v5, v1

    new-instance v0, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "mo"

    invoke-direct {v0, v1, v2}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0x3a

    aput-object v0, v5, v1

    new-instance v0, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "iv"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0x3b

    aput-object v0, v5, v1

    new-instance v0, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "il"

    invoke-direct {v0, v1, v2}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0x3c

    aput-object v0, v5, v1

    new-instance v0, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    const-string v1, "ba"

    invoke-direct {v0, v1, v2}, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;-><init>(Ljava/lang/String;Z)V

    const/16 v1, 0x3d

    aput-object v0, v5, v1

    sget-object v0, Lcom/google/common/collect/ImmutableList;->EMPTY_ITR:Lcom/google/common/collect/AbstractIndexedListIterator;

    const/16 v0, 0x4a

    new-array v0, v0, [Ljava/lang/Object;

    aput-object v6, v0, v2

    const/4 v1, 0x1

    aput-object v9, v0, v1

    const/4 v1, 0x2

    aput-object v10, v0, v1

    const/4 v1, 0x3

    aput-object v12, v0, v1

    const/4 v1, 0x4

    aput-object v13, v0, v1

    const/4 v1, 0x5

    aput-object v15, v0, v1

    const/4 v1, 0x6

    aput-object v7, v0, v1

    const/4 v1, 0x7

    aput-object v14, v0, v1

    const/16 v1, 0x8

    aput-object v21, v0, v1

    const/16 v1, 0x9

    aput-object v20, v0, v1

    aput-object v18, v0, v19

    const/16 v1, 0xb

    aput-object v17, v0, v1

    const/16 v1, 0xc

    const/16 v2, 0x3e

    const/4 v3, 0x0

    .line 15
    invoke-static {v5, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 16
    invoke-static {v0}, Lcom/google/common/collect/ImmutableList;->construct([Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    .line 17
    sput-object v0, Lcom/google/photos/base/BaseImageUrlUtil;->OPTIONS:Lcom/google/common/collect/ImmutableList;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getPathComponents(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "path"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/google/photos/base/BaseImageUrlUtil;->SPLIT_ON_SLASH:Lcom/google/common/base/Splitter;

    invoke-virtual {v0, p0}, Lcom/google/common/base/Splitter;->split(Ljava/lang/CharSequence;)Ljava/lang/Iterable;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/collect/Lists;->newArrayList(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object p0

    .line 2
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p0, v1, v0}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p0

    :cond_0
    return-object p0
.end method

.method public static makeOptions(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "oldOptions",
            "newOptions",
            "merge"
        }
    .end annotation

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p0, :cond_0

    move v2, v0

    goto :goto_0

    :cond_0
    move v2, v1

    :goto_0
    const-string v3, "oldOptions is null"

    .line 1
    invoke-static {v2, v3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    if-eqz p1, :cond_1

    move v2, v0

    goto :goto_1

    :cond_1
    move v2, v1

    :goto_1
    const-string v3, "newOptions is null"

    .line 2
    invoke-static {v2, v3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    return-object p1

    :cond_2
    xor-int/2addr p2, v0

    .line 4
    invoke-static {p0, p2}, Lcom/google/photos/base/BaseImageUrlUtil;->splitOptions(Ljava/lang/String;Z)Ljava/util/List;

    move-result-object p0

    .line 5
    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_3

    return-object p1

    .line 6
    :cond_3
    invoke-static {p1, v1}, Lcom/google/photos/base/BaseImageUrlUtil;->splitOptions(Ljava/lang/String;Z)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    const-string p1, "options is null"

    .line 7
    invoke-static {v0, p1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 8
    new-instance p1, Lcom/google/common/collect/ArrayListMultimap;

    invoke-direct {p1}, Lcom/google/common/collect/ArrayListMultimap;-><init>()V

    .line 9
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 10
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const/4 v2, 0x0

    .line 11
    sget-object v3, Lcom/google/photos/base/BaseImageUrlUtil;->OPTIONS:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v3}, Lcom/google/common/collect/ImmutableList;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object v3

    :cond_4
    :goto_3
    move-object v4, v3

    check-cast v4, Lcom/google/common/collect/AbstractIndexedListIterator;

    invoke-virtual {v4}, Lcom/google/common/collect/AbstractIndexedListIterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-virtual {v4}, Lcom/google/common/collect/AbstractIndexedListIterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    .line 12
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    iget-object v6, v4, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;->key:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 13
    iget-boolean v5, v4, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;->isBool:Z

    if-eqz v5, :cond_5

    .line 14
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    iget-object v6, v4, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;->key:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-ne v5, v6, :cond_4

    move-object v2, v4

    goto :goto_4

    :cond_5
    move-object v2, v4

    goto :goto_3

    :cond_6
    :goto_4
    if-eqz v2, :cond_7

    .line 15
    invoke-virtual {p1, v2, v0}, Lcom/google/common/collect/AbstractListMultimap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_2

    .line 16
    :cond_7
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 17
    :cond_8
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    sget-object v0, Lcom/google/photos/base/BaseImageUrlUtil;->OPTIONS:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object v0

    :cond_9
    :goto_5
    move-object v2, v0

    check-cast v2, Lcom/google/common/collect/AbstractIndexedListIterator;

    invoke-virtual {v2}, Lcom/google/common/collect/AbstractIndexedListIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_c

    invoke-virtual {v2}, Lcom/google/common/collect/AbstractIndexedListIterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/photos/base/BaseImageUrlUtil$OptionInfo;

    .line 19
    invoke-virtual {p1, v2}, Lcom/google/common/collect/AbstractListMultimap;->get(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const-string v3, ""

    :goto_6
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 20
    invoke-virtual {v4, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 21
    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6

    :cond_a
    move-object v3, v4

    goto :goto_6

    .line 22
    :cond_b
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_9

    .line 23
    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 24
    :cond_c
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 25
    sget-object p1, Lcom/google/photos/base/BaseImageUrlUtil;->JOIN_ON_DASH:Lcom/google/common/base/Joiner;

    invoke-virtual {p1, p0}, Lcom/google/common/base/Joiner;->join(Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static splitOptions(Ljava/lang/String;Z)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "options",
            "stripUnsigned"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    move v1, v0

    :goto_0
    const-string v2, "options is null"

    .line 1
    invoke-static {v1, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 2
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 3
    sget-object v2, Lcom/google/photos/base/BaseImageUrlUtil;->SPLIT_ON_DASH:Lcom/google/common/base/Splitter;

    invoke-virtual {v2, p0}, Lcom/google/common/base/Splitter;->split(Ljava/lang/CharSequence;)Ljava/lang/Iterable;

    move-result-object p0

    check-cast p0, Lcom/google/common/base/Splitter$5;

    invoke-virtual {p0}, Lcom/google/common/base/Splitter$5;->iterator()Ljava/util/Iterator;

    move-result-object p0

    .line 4
    :cond_1
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 5
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 6
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    const-string v3, "O"

    .line 7
    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    const-string v4, ""

    if-nez v3, :cond_2

    const-string v3, "J"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 8
    :cond_2
    :goto_2
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v5, 0xc

    if-ge v3, v5, :cond_4

    .line 9
    sget-object v3, Lcom/google/photos/base/BaseImageUrlUtil;->JOIN_ON_DASH:Lcom/google/common/base/Joiner;

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    goto :goto_3

    :cond_3
    move-object v5, v4

    :goto_3
    new-array v6, v0, [Ljava/lang/Object;

    invoke-virtual {v3, v2, v5, v6}, Lcom/google/common/base/Joiner;->join(Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    :cond_4
    const-string v3, "pi"

    .line 10
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    const-string v3, "ya"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    const-string v3, "ro"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 11
    :cond_5
    sget-object v3, Lcom/google/photos/base/BaseImageUrlUtil;->JOIN_ON_DASH:Lcom/google/common/base/Joiner;

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    :cond_6
    new-array v5, v0, [Ljava/lang/Object;

    invoke-virtual {v3, v2, v4, v5}, Lcom/google/common/base/Joiner;->join(Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    :cond_7
    if-eqz p1, :cond_8

    .line 12
    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 13
    :cond_8
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_9
    return-object v1
.end method


# virtual methods
.method public changeImageUrlOptions(Lcom/google/photos/base/ImageUrlOptionsStringBuilder;Lcom/google/photos/base/BaseImageUrlUtil$UriWrapper;ZZ)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "options",
            "url",
            "signedOnly",
            "merge"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/photos/base/ImageUrlOptionsStringBuilder;",
            "Lcom/google/photos/base/BaseImageUrlUtil$UriWrapper<",
            "TT;>;ZZ)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/photos/base/BaseImageUrlUtil$InvalidUrlException;
        }
    .end annotation

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    move v2, v0

    goto :goto_0

    :cond_0
    move v2, v1

    :goto_0
    const-string v3, "options is null"

    .line 1
    invoke-static {v2, v3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    if-eqz p2, :cond_1

    move v2, v0

    goto :goto_1

    :cond_1
    move v2, v1

    :goto_1
    const-string v3, "url is null"

    .line 2
    invoke-static {v2, v3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 3
    move-object v2, p2

    check-cast v2, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$AndroidUriWrapper;

    invoke-virtual {v2}, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$AndroidUriWrapper;->getPath()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_c

    .line 4
    invoke-virtual {p0, v2}, Lcom/google/photos/base/BaseImageUrlUtil;->getPathComponents(Lcom/google/photos/base/BaseImageUrlUtil$UriWrapper;)Ljava/util/List;

    move-result-object v3

    .line 5
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_2

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    const-string v5, "image"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 6
    invoke-interface {v3, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 7
    :cond_2
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x2

    if-ne v4, v5, :cond_3

    .line 8
    invoke-interface {v3, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 9
    :cond_3
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x4

    if-ge v4, v5, :cond_4

    :goto_2
    move v4, v1

    goto :goto_3

    :cond_4
    if-ne v4, v5, :cond_5

    const/4 v5, 0x3

    .line 10
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_5

    goto :goto_2

    :cond_5
    const/4 v5, 0x6

    if-le v4, v5, :cond_6

    goto :goto_2

    :cond_6
    move v4, v0

    :goto_3
    if-eqz v4, :cond_7

    .line 11
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/photos/base/BaseImageUrlUtil;->setLegacyImageUrlOptions(Lcom/google/photos/base/ImageUrlOptionsStringBuilder;Lcom/google/photos/base/BaseImageUrlUtil$UriWrapper;ZZ)Ljava/lang/Object;

    move-result-object p0

    goto :goto_5

    .line 12
    :cond_7
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-lt v4, v0, :cond_9

    if-le v4, v0, :cond_8

    goto :goto_4

    :cond_8
    sub-int/2addr v4, v0

    .line 13
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_a

    :cond_9
    :goto_4
    move v0, v1

    :cond_a
    if-eqz v0, :cond_b

    .line 14
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/photos/base/BaseImageUrlUtil;->setContentImageUrlOptions(Lcom/google/photos/base/ImageUrlOptionsStringBuilder;Lcom/google/photos/base/BaseImageUrlUtil$UriWrapper;ZZ)Ljava/lang/Object;

    move-result-object p0

    :goto_5
    return-object p0

    .line 15
    :cond_b
    new-instance p0, Lcom/google/photos/base/BaseImageUrlUtil$InvalidUrlException;

    invoke-virtual {v2}, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$AndroidUriWrapper;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/google/photos/base/BaseImageUrlUtil$InvalidUrlException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 16
    :cond_c
    new-instance p0, Lcom/google/photos/base/BaseImageUrlUtil$InvalidUrlException;

    const-string p1, "url path is null"

    invoke-direct {p0, p1}, Lcom/google/photos/base/BaseImageUrlUtil$InvalidUrlException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public getPathComponents(Lcom/google/photos/base/BaseImageUrlUtil$UriWrapper;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "uri"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/photos/base/BaseImageUrlUtil$UriWrapper<",
            "TT;>;)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 4
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    check-cast p1, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$AndroidUriWrapper;

    invoke-virtual {p1}, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$AndroidUriWrapper;->getPath()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/google/photos/base/BaseImageUrlUtil;->getPathComponents(Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public setContentImageUrlOptions(Lcom/google/photos/base/ImageUrlOptionsStringBuilder;Lcom/google/photos/base/BaseImageUrlUtil$UriWrapper;ZZ)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "options",
            "url",
            "signedOnly",
            "merge"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/photos/base/ImageUrlOptionsStringBuilder;",
            "Lcom/google/photos/base/BaseImageUrlUtil$UriWrapper<",
            "TT;>;ZZ)TT;"
        }
    .end annotation

    const/4 p0, 0x1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    move v1, p0

    goto :goto_0

    :cond_0
    move v1, v0

    :goto_0
    const-string v2, "options is null"

    .line 1
    invoke-static {v1, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    if-eqz p2, :cond_1

    move v1, p0

    goto :goto_1

    :cond_1
    move v1, v0

    :goto_1
    const-string v2, "url is null"

    .line 2
    invoke-static {v1, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 3
    check-cast p2, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$AndroidUriWrapper;

    invoke-virtual {p2}, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$AndroidUriWrapper;->getPath()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    move v1, p0

    goto :goto_2

    :cond_2
    move v1, v0

    :goto_2
    const-string v2, "url path is null"

    invoke-static {v1, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 4
    sget-object v1, Lcom/google/photos/base/BaseImageUrlUtil;->SPLIT_ON_EQUALS:Lcom/google/common/base/Splitter;

    .line 5
    invoke-virtual {p2}, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$AndroidUriWrapper;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/common/base/Splitter;->split(Ljava/lang/CharSequence;)Ljava/lang/Iterable;

    move-result-object v2

    invoke-static {v2}, Lcom/google/common/collect/Lists;->newArrayList(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v2

    const-string v3, ""

    .line 6
    invoke-virtual {p1, v3, p3}, Lcom/google/photos/base/ImageUrlOptionsStringBuilder;->toString(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    .line 7
    invoke-virtual {p2}, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$AndroidUriWrapper;->getPath()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v1, p3}, Lcom/google/common/base/Splitter;->split(Ljava/lang/CharSequence;)Ljava/lang/Iterable;

    move-result-object p3

    invoke-static {p3}, Lcom/google/common/collect/Lists;->newArrayList(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object p3

    .line 8
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v1

    const/4 v4, 0x2

    if-ne v1, v4, :cond_3

    invoke-interface {p3, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    move-object v3, p0

    check-cast v3, Ljava/lang/String;

    .line 9
    :cond_3
    invoke-static {v3, p1, p4}, Lcom/google/photos/base/BaseImageUrlUtil;->makeOptions(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    .line 10
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 11
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p3

    if-nez p3, :cond_4

    .line 12
    sget-object p3, Lcom/google/photos/base/BaseImageUrlUtil;->JOIN_ON_EQUALS:Lcom/google/common/base/Joiner;

    new-array p4, v0, [Ljava/lang/Object;

    invoke-virtual {p3, p1, p0, p4}, Lcom/google/common/base/Joiner;->join(Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 13
    :cond_4
    iget-object p0, p2, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$AndroidUriWrapper;->uri:Landroid/net/Uri;

    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/net/Uri$Builder;->encodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public setLegacyImageUrlOptions(Lcom/google/photos/base/ImageUrlOptionsStringBuilder;Lcom/google/photos/base/BaseImageUrlUtil$UriWrapper;ZZ)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "options",
            "url",
            "signedOnly",
            "merge"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/photos/base/ImageUrlOptionsStringBuilder;",
            "Lcom/google/photos/base/BaseImageUrlUtil$UriWrapper<",
            "TT;>;ZZ)TT;"
        }
    .end annotation

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    move v2, v0

    goto :goto_0

    :cond_0
    move v2, v1

    :goto_0
    const-string v3, "options is null"

    .line 1
    invoke-static {v2, v3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    if-eqz p2, :cond_1

    move v2, v0

    goto :goto_1

    :cond_1
    move v2, v1

    :goto_1
    const-string v3, "url is null"

    .line 2
    invoke-static {v2, v3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 3
    check-cast p2, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$AndroidUriWrapper;

    invoke-virtual {p2}, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$AndroidUriWrapper;->getPath()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    move v2, v0

    goto :goto_2

    :cond_2
    move v2, v1

    :goto_2
    const-string v3, "url path is null"

    invoke-static {v2, v3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 4
    invoke-virtual {p0, p2}, Lcom/google/photos/base/BaseImageUrlUtil;->getPathComponents(Lcom/google/photos/base/BaseImageUrlUtil$UriWrapper;)Ljava/util/List;

    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    const-string v3, "image"

    if-lez v2, :cond_3

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 6
    invoke-interface {p0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_3

    :cond_3
    move v0, v1

    :goto_3
    const-string v2, ""

    .line 7
    invoke-virtual {p1, v2, p3}, Lcom/google/photos/base/ImageUrlOptionsStringBuilder;->toString(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    .line 8
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p3

    const/4 v4, 0x5

    const/4 v5, 0x4

    if-ne p3, v5, :cond_4

    .line 9
    invoke-interface {p0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 10
    :cond_4
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p3

    if-ne p3, v4, :cond_5

    .line 11
    invoke-interface {p0, v5, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 12
    :cond_5
    :goto_4
    invoke-interface {p0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    .line 13
    invoke-static {p3, p1, p4}, Lcom/google/photos/base/BaseImageUrlUtil;->makeOptions(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    .line 14
    invoke-interface {p0, v5, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 15
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p1

    if-le p1, v4, :cond_6

    .line 16
    invoke-interface {p0, v5}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    :cond_6
    if-eqz v0, :cond_7

    .line 17
    invoke-interface {p0, v1, v3}, Ljava/util/List;->add(ILjava/lang/Object;)V

    :cond_7
    const-string p1, "/"

    .line 18
    sget-object p3, Lcom/google/photos/base/BaseImageUrlUtil;->JOIN_ON_SLASH:Lcom/google/common/base/Joiner;

    invoke-virtual {p3, p0}, Lcom/google/common/base/Joiner;->join(Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p3

    if-eqz p3, :cond_8

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_5

    :cond_8
    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, p1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 19
    :goto_5
    iget-object p1, p2, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$AndroidUriWrapper;->uri:Landroid/net/Uri;

    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/net/Uri$Builder;->encodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method
