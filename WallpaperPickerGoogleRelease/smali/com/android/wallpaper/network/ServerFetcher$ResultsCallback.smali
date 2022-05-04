.class public interface abstract Lcom/android/wallpaper/network/ServerFetcher$ResultsCallback;
.super Ljava/lang/Object;
.source "ServerFetcher.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract onError(Lcom/android/volley/VolleyError;)V
.end method

.method public abstract onSuccess(Lcom/google/protobuf/Internal$ProtobufList;)V
.end method
