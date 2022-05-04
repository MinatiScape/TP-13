package androidx.concurrent.futures;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
/* loaded from: classes.dex */
public final class CallbackToFutureAdapter$Completer<T> {
    public boolean attemptedSetting;
    public ResolvableFuture<Void> cancellationFuture = new ResolvableFuture<>();
    public CallbackToFutureAdapter$SafeFuture<T> future;
    public Object tag;

    public void finalize() {
        ResolvableFuture<Void> resolvableFuture;
        CallbackToFutureAdapter$SafeFuture<T> callbackToFutureAdapter$SafeFuture = this.future;
        if (callbackToFutureAdapter$SafeFuture != null && !callbackToFutureAdapter$SafeFuture.isDone()) {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("The completer object was garbage collected - this future would otherwise never complete. The tag was: ");
            m.append(this.tag);
            final String sb = m.toString();
            callbackToFutureAdapter$SafeFuture.delegate.setException(new Throwable(sb) { // from class: androidx.concurrent.futures.CallbackToFutureAdapter$FutureGarbageCollectedException
                @Override // java.lang.Throwable
                public synchronized Throwable fillInStackTrace() {
                    return this;
                }
            });
        }
        if (!this.attemptedSetting && (resolvableFuture = this.cancellationFuture) != null) {
            resolvableFuture.set(null);
        }
    }
}
