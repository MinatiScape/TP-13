package com.bumptech.glide.request;

import com.bumptech.glide.request.RequestCoordinator;
/* loaded from: classes.dex */
public final class ThumbnailRequestCoordinator implements RequestCoordinator, Request {
    public volatile Request full;
    public RequestCoordinator.RequestState fullState;
    public boolean isRunningDuringBegin;
    public final RequestCoordinator parent;
    public final Object requestLock;
    public volatile Request thumb;
    public RequestCoordinator.RequestState thumbState;

    @Override // com.bumptech.glide.request.Request
    public final void begin() {
        RequestCoordinator.RequestState requestState = RequestCoordinator.RequestState.RUNNING;
        synchronized (this.requestLock) {
            this.isRunningDuringBegin = true;
            if (!(this.fullState == RequestCoordinator.RequestState.SUCCESS || this.thumbState == requestState)) {
                this.thumbState = requestState;
                this.thumb.begin();
            }
            if (this.isRunningDuringBegin && this.fullState != requestState) {
                this.fullState = requestState;
                this.full.begin();
            }
            this.isRunningDuringBegin = false;
        }
    }

    @Override // com.bumptech.glide.request.RequestCoordinator
    public final boolean canNotifyCleared(Request request) {
        boolean z;
        boolean z2;
        synchronized (this.requestLock) {
            RequestCoordinator requestCoordinator = this.parent;
            z = false;
            if (requestCoordinator != null && !requestCoordinator.canNotifyCleared(this)) {
                z2 = false;
                if (z2 && request.equals(this.full) && this.fullState != RequestCoordinator.RequestState.PAUSED) {
                    z = true;
                }
            }
            z2 = true;
            if (z2) {
                z = true;
            }
        }
        return z;
    }

    @Override // com.bumptech.glide.request.RequestCoordinator
    public final boolean canNotifyStatusChanged(Request request) {
        boolean z;
        boolean z2;
        synchronized (this.requestLock) {
            RequestCoordinator requestCoordinator = this.parent;
            z = false;
            if (requestCoordinator != null && !requestCoordinator.canNotifyStatusChanged(this)) {
                z2 = false;
                if (z2 && request.equals(this.full) && !isAnyResourceSet()) {
                    z = true;
                }
            }
            z2 = true;
            if (z2) {
                z = true;
            }
        }
        return z;
    }

    @Override // com.bumptech.glide.request.RequestCoordinator
    public final boolean canSetImage(Request request) {
        boolean z;
        boolean z2;
        synchronized (this.requestLock) {
            RequestCoordinator requestCoordinator = this.parent;
            z = false;
            if (requestCoordinator != null && !requestCoordinator.canSetImage(this)) {
                z2 = false;
                if (z2 && (request.equals(this.full) || this.fullState != RequestCoordinator.RequestState.SUCCESS)) {
                    z = true;
                }
            }
            z2 = true;
            if (z2) {
                z = true;
            }
        }
        return z;
    }

    @Override // com.bumptech.glide.request.Request
    public final void clear() {
        synchronized (this.requestLock) {
            this.isRunningDuringBegin = false;
            RequestCoordinator.RequestState requestState = RequestCoordinator.RequestState.CLEARED;
            this.fullState = requestState;
            this.thumbState = requestState;
            this.thumb.clear();
            this.full.clear();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v2, types: [com.bumptech.glide.request.RequestCoordinator] */
    /* JADX WARN: Type inference failed for: r2v4 */
    @Override // com.bumptech.glide.request.RequestCoordinator
    public final RequestCoordinator getRoot() {
        ?? r2;
        synchronized (this.requestLock) {
            RequestCoordinator requestCoordinator = this.parent;
            this = this;
            if (requestCoordinator != null) {
                r2 = requestCoordinator.getRoot();
            }
        }
        return r2;
    }

    @Override // com.bumptech.glide.request.RequestCoordinator, com.bumptech.glide.request.Request
    public final boolean isAnyResourceSet() {
        boolean z;
        synchronized (this.requestLock) {
            if (!this.thumb.isAnyResourceSet() && !this.full.isAnyResourceSet()) {
                z = false;
            }
            z = true;
        }
        return z;
    }

    @Override // com.bumptech.glide.request.Request
    public final boolean isCleared() {
        boolean z;
        synchronized (this.requestLock) {
            if (this.fullState == RequestCoordinator.RequestState.CLEARED) {
                z = true;
            } else {
                z = false;
            }
        }
        return z;
    }

    @Override // com.bumptech.glide.request.Request
    public final boolean isComplete() {
        boolean z;
        synchronized (this.requestLock) {
            if (this.fullState == RequestCoordinator.RequestState.SUCCESS) {
                z = true;
            } else {
                z = false;
            }
        }
        return z;
    }

    @Override // com.bumptech.glide.request.Request
    public final boolean isEquivalentTo(Request request) {
        if (!(request instanceof ThumbnailRequestCoordinator)) {
            return false;
        }
        ThumbnailRequestCoordinator thumbnailRequestCoordinator = (ThumbnailRequestCoordinator) request;
        if (this.full == null) {
            if (thumbnailRequestCoordinator.full != null) {
                return false;
            }
        } else if (!this.full.isEquivalentTo(thumbnailRequestCoordinator.full)) {
            return false;
        }
        if (this.thumb == null) {
            if (thumbnailRequestCoordinator.thumb != null) {
                return false;
            }
        } else if (!this.thumb.isEquivalentTo(thumbnailRequestCoordinator.thumb)) {
            return false;
        }
        return true;
    }

    @Override // com.bumptech.glide.request.Request
    public final boolean isRunning() {
        boolean z;
        synchronized (this.requestLock) {
            if (this.fullState == RequestCoordinator.RequestState.RUNNING) {
                z = true;
            } else {
                z = false;
            }
        }
        return z;
    }

    @Override // com.bumptech.glide.request.RequestCoordinator
    public final void onRequestFailed(Request request) {
        RequestCoordinator.RequestState requestState = RequestCoordinator.RequestState.FAILED;
        synchronized (this.requestLock) {
            if (!request.equals(this.full)) {
                this.thumbState = requestState;
                return;
            }
            this.fullState = requestState;
            RequestCoordinator requestCoordinator = this.parent;
            if (requestCoordinator != null) {
                requestCoordinator.onRequestFailed(this);
            }
        }
    }

    @Override // com.bumptech.glide.request.RequestCoordinator
    public final void onRequestSuccess(Request request) {
        RequestCoordinator.RequestState requestState = RequestCoordinator.RequestState.SUCCESS;
        synchronized (this.requestLock) {
            if (request.equals(this.thumb)) {
                this.thumbState = requestState;
                return;
            }
            this.fullState = requestState;
            RequestCoordinator requestCoordinator = this.parent;
            if (requestCoordinator != null) {
                requestCoordinator.onRequestSuccess(this);
            }
            if (!this.thumbState.isComplete()) {
                this.thumb.clear();
            }
        }
    }

    @Override // com.bumptech.glide.request.Request
    public final void pause() {
        RequestCoordinator.RequestState requestState = RequestCoordinator.RequestState.PAUSED;
        synchronized (this.requestLock) {
            if (!this.thumbState.isComplete()) {
                this.thumbState = requestState;
                this.thumb.pause();
            }
            if (!this.fullState.isComplete()) {
                this.fullState = requestState;
                this.full.pause();
            }
        }
    }

    public ThumbnailRequestCoordinator(Object obj, RequestCoordinator requestCoordinator) {
        RequestCoordinator.RequestState requestState = RequestCoordinator.RequestState.CLEARED;
        this.fullState = requestState;
        this.thumbState = requestState;
        this.requestLock = obj;
        this.parent = requestCoordinator;
    }
}
