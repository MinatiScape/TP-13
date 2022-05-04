package androidx.concurrent.futures;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import androidx.concurrent.futures.AbstractResolvableFuture;
import com.google.common.util.concurrent.ListenableFuture;
import java.lang.ref.WeakReference;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
/* loaded from: classes.dex */
public final class CallbackToFutureAdapter$SafeFuture<T> implements ListenableFuture<T> {
    public final WeakReference<CallbackToFutureAdapter$Completer<T>> completerWeakReference;
    public final AnonymousClass1 delegate = new AbstractResolvableFuture<T>() { // from class: androidx.concurrent.futures.CallbackToFutureAdapter$SafeFuture.1
        @Override // androidx.concurrent.futures.AbstractResolvableFuture
        public final String pendingToString() {
            CallbackToFutureAdapter$Completer<T> callbackToFutureAdapter$Completer = CallbackToFutureAdapter$SafeFuture.this.completerWeakReference.get();
            if (callbackToFutureAdapter$Completer == null) {
                return "Completer object has been garbage collected, future will fail soon";
            }
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("tag=[");
            m.append(callbackToFutureAdapter$Completer.tag);
            m.append("]");
            return m.toString();
        }
    };

    @Override // java.util.concurrent.Future
    public final T get() throws InterruptedException, ExecutionException {
        return get();
    }

    @Override // java.util.concurrent.Future
    public final boolean cancel(boolean z) {
        CallbackToFutureAdapter$Completer<T> callbackToFutureAdapter$Completer = this.completerWeakReference.get();
        boolean cancel = cancel(z);
        if (cancel && callbackToFutureAdapter$Completer != null) {
            callbackToFutureAdapter$Completer.tag = null;
            callbackToFutureAdapter$Completer.future = null;
            callbackToFutureAdapter$Completer.cancellationFuture.set(null);
        }
        return cancel;
    }

    @Override // java.util.concurrent.Future
    public final T get(long j, TimeUnit timeUnit) throws InterruptedException, ExecutionException, TimeoutException {
        return get(j, timeUnit);
    }

    @Override // java.util.concurrent.Future
    public final boolean isCancelled() {
        return this.delegate.value instanceof AbstractResolvableFuture.Cancellation;
    }

    @Override // java.util.concurrent.Future
    public final boolean isDone() {
        return isDone();
    }

    public final String toString() {
        return toString();
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [androidx.concurrent.futures.CallbackToFutureAdapter$SafeFuture$1] */
    public CallbackToFutureAdapter$SafeFuture(CallbackToFutureAdapter$Completer<T> callbackToFutureAdapter$Completer) {
        this.completerWeakReference = new WeakReference<>(callbackToFutureAdapter$Completer);
    }
}
