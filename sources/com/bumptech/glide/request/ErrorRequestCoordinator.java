package com.bumptech.glide.request;

import com.bumptech.glide.request.RequestCoordinator;
/* loaded from: classes.dex */
public final class ErrorRequestCoordinator implements RequestCoordinator, Request {
    public volatile Request error;
    public RequestCoordinator.RequestState errorState;
    public final RequestCoordinator parent;
    public volatile Request primary;
    public RequestCoordinator.RequestState primaryState;
    public final Object requestLock;

    @Override // com.bumptech.glide.request.Request
    public final void begin() {
        synchronized (this.requestLock) {
            RequestCoordinator.RequestState requestState = this.primaryState;
            RequestCoordinator.RequestState requestState2 = RequestCoordinator.RequestState.RUNNING;
            if (requestState != requestState2) {
                this.primaryState = requestState2;
                this.primary.begin();
            }
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
                if (z2 && isValidRequest(request)) {
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
                if (z2 && isValidRequest(request)) {
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
                if (z2 && isValidRequest(request)) {
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
            RequestCoordinator.RequestState requestState = RequestCoordinator.RequestState.CLEARED;
            this.primaryState = requestState;
            this.primary.clear();
            if (this.errorState != requestState) {
                this.errorState = requestState;
                this.error.clear();
            }
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
            if (!this.primary.isAnyResourceSet() && !this.error.isAnyResourceSet()) {
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
            RequestCoordinator.RequestState requestState = this.primaryState;
            RequestCoordinator.RequestState requestState2 = RequestCoordinator.RequestState.CLEARED;
            if (requestState == requestState2 && this.errorState == requestState2) {
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
            RequestCoordinator.RequestState requestState = this.primaryState;
            RequestCoordinator.RequestState requestState2 = RequestCoordinator.RequestState.SUCCESS;
            if (!(requestState == requestState2 || this.errorState == requestState2)) {
                z = false;
            }
            z = true;
        }
        return z;
    }

    @Override // com.bumptech.glide.request.Request
    public final boolean isEquivalentTo(Request request) {
        if (!(request instanceof ErrorRequestCoordinator)) {
            return false;
        }
        ErrorRequestCoordinator errorRequestCoordinator = (ErrorRequestCoordinator) request;
        if (!this.primary.isEquivalentTo(errorRequestCoordinator.primary) || !this.error.isEquivalentTo(errorRequestCoordinator.error)) {
            return false;
        }
        return true;
    }

    @Override // com.bumptech.glide.request.Request
    public final boolean isRunning() {
        boolean z;
        synchronized (this.requestLock) {
            RequestCoordinator.RequestState requestState = this.primaryState;
            RequestCoordinator.RequestState requestState2 = RequestCoordinator.RequestState.RUNNING;
            if (!(requestState == requestState2 || this.errorState == requestState2)) {
                z = false;
            }
            z = true;
        }
        return z;
    }

    public final boolean isValidRequest(Request request) {
        if (request.equals(this.primary) || (this.primaryState == RequestCoordinator.RequestState.FAILED && request.equals(this.error))) {
            return true;
        }
        return false;
    }

    @Override // com.bumptech.glide.request.RequestCoordinator
    public final void onRequestFailed(Request request) {
        RequestCoordinator.RequestState requestState = RequestCoordinator.RequestState.FAILED;
        synchronized (this.requestLock) {
            if (!request.equals(this.error)) {
                this.primaryState = requestState;
                RequestCoordinator.RequestState requestState2 = this.errorState;
                RequestCoordinator.RequestState requestState3 = RequestCoordinator.RequestState.RUNNING;
                if (requestState2 != requestState3) {
                    this.errorState = requestState3;
                    this.error.begin();
                }
                return;
            }
            this.errorState = requestState;
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
            if (request.equals(this.primary)) {
                this.primaryState = requestState;
            } else if (request.equals(this.error)) {
                this.errorState = requestState;
            }
            RequestCoordinator requestCoordinator = this.parent;
            if (requestCoordinator != null) {
                requestCoordinator.onRequestSuccess(this);
            }
        }
    }

    @Override // com.bumptech.glide.request.Request
    public final void pause() {
        RequestCoordinator.RequestState requestState = RequestCoordinator.RequestState.PAUSED;
        synchronized (this.requestLock) {
            RequestCoordinator.RequestState requestState2 = this.primaryState;
            RequestCoordinator.RequestState requestState3 = RequestCoordinator.RequestState.RUNNING;
            if (requestState2 == requestState3) {
                this.primaryState = requestState;
                this.primary.pause();
            }
            if (this.errorState == requestState3) {
                this.errorState = requestState;
                this.error.pause();
            }
        }
    }

    public ErrorRequestCoordinator(Object obj, RequestCoordinator requestCoordinator) {
        RequestCoordinator.RequestState requestState = RequestCoordinator.RequestState.CLEARED;
        this.primaryState = requestState;
        this.errorState = requestState;
        this.requestLock = obj;
        this.parent = requestCoordinator;
    }
}
