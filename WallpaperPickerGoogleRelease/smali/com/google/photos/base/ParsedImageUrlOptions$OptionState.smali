.class public Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final signed:Z

.field public final value:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "value",
            "signed"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;->value:Ljava/lang/Object;

    .line 3
    iput-boolean p2, p0, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;->signed:Z

    return-void
.end method
