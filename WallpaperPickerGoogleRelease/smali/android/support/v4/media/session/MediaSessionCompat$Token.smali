.class public final Landroid/support/v4/media/session/MediaSessionCompat$Token;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Landroid/support/v4/media/session/MediaSessionCompat$Token;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public mExtraBinder:Landroid/support/v4/media/session/IMediaSession;

.field public final mInner:Ljava/lang/Object;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/support/v4/media/session/MediaSessionCompat$Token$1;

    invoke-direct {v0}, Landroid/support/v4/media/session/MediaSessionCompat$Token$1;-><init>()V

    sput-object v0, Landroid/support/v4/media/session/MediaSessionCompat$Token;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Landroid/support/v4/media/session/MediaSessionCompat$Token;->mInner:Ljava/lang/Object;

    const/4 p1, 0x0

    .line 3
    iput-object p1, p0, Landroid/support/v4/media/session/MediaSessionCompat$Token;->mExtraBinder:Landroid/support/v4/media/session/IMediaSession;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 1
    :cond_0
    instance-of v1, p1, Landroid/support/v4/media/session/MediaSessionCompat$Token;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 2
    :cond_1
    check-cast p1, Landroid/support/v4/media/session/MediaSessionCompat$Token;

    .line 3
    iget-object p0, p0, Landroid/support/v4/media/session/MediaSessionCompat$Token;->mInner:Ljava/lang/Object;

    if-nez p0, :cond_3

    .line 4
    iget-object p0, p1, Landroid/support/v4/media/session/MediaSessionCompat$Token;->mInner:Ljava/lang/Object;

    if-nez p0, :cond_2

    goto :goto_0

    :cond_2
    move v0, v2

    :goto_0
    return v0

    .line 5
    :cond_3
    iget-object p1, p1, Landroid/support/v4/media/session/MediaSessionCompat$Token;->mInner:Ljava/lang/Object;

    if-nez p1, :cond_4

    return v2

    .line 6
    :cond_4
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/session/MediaSessionCompat$Token;->mInner:Ljava/lang/Object;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 2
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/media/session/MediaSessionCompat$Token;->mInner:Ljava/lang/Object;

    check-cast p0, Landroid/os/Parcelable;

    invoke-virtual {p1, p0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    return-void
.end method
