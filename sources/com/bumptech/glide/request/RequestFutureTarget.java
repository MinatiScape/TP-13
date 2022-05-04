package com.bumptech.glide.request;

import android.graphics.drawable.Drawable;
import android.os.Looper;
import androidx.recyclerview.widget.RecyclerView;
import com.bumptech.glide.load.engine.GlideException;
import com.bumptech.glide.request.target.SizeReadyCallback;
import com.bumptech.glide.request.target.Target;
import com.bumptech.glide.request.transition.Transition;
import com.bumptech.glide.util.Util;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
/* loaded from: classes.dex */
public final class RequestFutureTarget<R> implements Future, Target, RequestListener<R> {
    public static final Waiter DEFAULT_WAITER = new Waiter();
    public GlideException exception;
    public boolean isCancelled;
    public boolean loadFailed;
    public Request request;
    public R resource;
    public boolean resultReceived;
    public final Waiter waiter;
    public final int width = RecyclerView.UNDEFINED_DURATION;
    public final int height = RecyclerView.UNDEFINED_DURATION;

    /* loaded from: classes.dex */
    public static class Waiter {
    }

    @Override // java.util.concurrent.Future
    public final boolean cancel(boolean z) {
        synchronized (this) {
            if (isDone()) {
                return false;
            }
            this.isCancelled = true;
            this.waiter.getClass();
            notifyAll();
            Request request = null;
            if (z) {
                Request request2 = this.request;
                this.request = null;
                request = request2;
            }
            if (request != null) {
                request.clear();
            }
            return true;
        }
    }

    public final synchronized R doGet(Long l) throws ExecutionException, InterruptedException, TimeoutException {
        boolean z;
        if (!isDone()) {
            char[] cArr = Util.HEX_CHAR_ARRAY;
            if (Looper.myLooper() == Looper.getMainLooper()) {
                z = true;
            } else {
                z = false;
            }
            if (!(!z)) {
                throw new IllegalArgumentException("You must call this method on a background thread");
            }
        }
        if (this.isCancelled) {
            throw new CancellationException();
        } else if (this.loadFailed) {
            throw new ExecutionException(this.exception);
        } else if (this.resultReceived) {
            return this.resource;
        } else {
            if (l == null) {
                this.waiter.getClass();
                wait(0L);
            } else if (l.longValue() > 0) {
                long currentTimeMillis = System.currentTimeMillis();
                long longValue = l.longValue() + currentTimeMillis;
                while (!isDone() && currentTimeMillis < longValue) {
                    this.waiter.getClass();
                    wait(longValue - currentTimeMillis);
                    currentTimeMillis = System.currentTimeMillis();
                }
            }
            if (Thread.interrupted()) {
                throw new InterruptedException();
            } else if (this.loadFailed) {
                throw new ExecutionException(this.exception);
            } else if (this.isCancelled) {
                throw new CancellationException();
            } else if (this.resultReceived) {
                return this.resource;
            } else {
                throw new TimeoutException();
            }
        }
    }

    @Override // java.util.concurrent.Future
    public final R get() throws InterruptedException, ExecutionException {
        try {
            return doGet(null);
        } catch (TimeoutException e) {
            throw new AssertionError(e);
        }
    }

    @Override // com.bumptech.glide.request.target.Target
    public final synchronized Request getRequest() {
        return this.request;
    }

    @Override // java.util.concurrent.Future
    public final synchronized boolean isCancelled() {
        return this.isCancelled;
    }

    @Override // java.util.concurrent.Future
    public final synchronized boolean isDone() {
        boolean z;
        if (!this.isCancelled && !this.resultReceived) {
            if (!this.loadFailed) {
                z = false;
            }
        }
        z = true;
        return z;
    }

    @Override // com.bumptech.glide.manager.LifecycleListener
    public final void onDestroy() {
    }

    @Override // com.bumptech.glide.request.target.Target
    public final void onLoadCleared(Drawable drawable) {
    }

    @Override // com.bumptech.glide.request.target.Target
    public final synchronized void onLoadFailed(Drawable drawable) {
    }

    @Override // com.bumptech.glide.request.target.Target
    public final void onLoadStarted(Drawable drawable) {
    }

    @Override // com.bumptech.glide.request.target.Target
    public final synchronized void onResourceReady(R r, Transition<? super R> transition) {
    }

    @Override // com.bumptech.glide.manager.LifecycleListener
    public final void onStart() {
    }

    @Override // com.bumptech.glide.manager.LifecycleListener
    public final void onStop() {
    }

    @Override // com.bumptech.glide.request.target.Target
    public final void removeCallback(SizeReadyCallback sizeReadyCallback) {
    }

    @Override // com.bumptech.glide.request.target.Target
    public final synchronized void setRequest(Request request) {
        this.request = request;
    }

    public RequestFutureTarget() {
        Waiter waiter = DEFAULT_WAITER;
        this.waiter = waiter;
    }

    @Override // com.bumptech.glide.request.target.Target
    public final void getSize(SizeReadyCallback sizeReadyCallback) {
        sizeReadyCallback.onSizeReady(this.width, this.height);
    }

    @Override // com.bumptech.glide.request.RequestListener
    public final synchronized void onLoadFailed(GlideException glideException) {
        this.loadFailed = true;
        this.exception = glideException;
        this.waiter.getClass();
        notifyAll();
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.bumptech.glide.request.RequestListener
    public final synchronized void onResourceReady(Object obj) {
        this.resultReceived = true;
        this.resource = obj;
        this.waiter.getClass();
        notifyAll();
    }

    @Override // java.util.concurrent.Future
    public final R get(long j, TimeUnit timeUnit) throws InterruptedException, ExecutionException, TimeoutException {
        return doGet(Long.valueOf(timeUnit.toMillis(j)));
    }
}
