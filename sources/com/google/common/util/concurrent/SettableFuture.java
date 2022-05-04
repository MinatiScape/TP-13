package com.google.common.util.concurrent;

import com.google.common.util.concurrent.AbstractFuture;
/* loaded from: classes.dex */
public final class SettableFuture<V> extends AbstractFuture.TrustedFuture<V> {
    public boolean setException(Throwable throwable) {
        if (!AbstractFuture.ATOMIC_HELPER.casValue(this, null, new AbstractFuture.Failure(throwable))) {
            return false;
        }
        AbstractFuture.complete(this);
        return true;
    }
}
