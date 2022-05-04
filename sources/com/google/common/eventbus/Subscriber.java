package com.google.common.eventbus;

import com.bumptech.glide.Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0;
import java.lang.reflect.InvocationTargetException;
import java.util.Objects;
/* loaded from: classes.dex */
public class Subscriber {
    public final Object target;

    /* loaded from: classes.dex */
    public static final class SynchronizedSubscriber extends Subscriber {
        @Override // com.google.common.eventbus.Subscriber
        public void invokeSubscriberMethod(Object event) throws InvocationTargetException {
            synchronized (this) {
                Subscriber.super.invokeSubscriberMethod(event);
            }
        }
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof Subscriber) || this.target != ((Subscriber) obj).target) {
            return false;
        }
        throw null;
    }

    public final int hashCode() {
        throw null;
    }

    public void invokeSubscriberMethod(Object event) throws InvocationTargetException {
        try {
            Objects.requireNonNull(event);
            throw null;
        } catch (IllegalAccessException e) {
            String valueOf = String.valueOf(event);
            throw new Error(Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0.m(valueOf.length() + 28, "Method became inaccessible: ", valueOf), e);
        } catch (IllegalArgumentException e2) {
            String valueOf2 = String.valueOf(event);
            throw new Error(Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0.m(valueOf2.length() + 33, "Method rejected target/argument: ", valueOf2), e2);
        } catch (InvocationTargetException e3) {
            if (e3.getCause() instanceof Error) {
                throw ((Error) e3.getCause());
            }
            throw e3;
        }
    }
}
