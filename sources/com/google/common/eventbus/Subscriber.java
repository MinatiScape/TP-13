package com.google.common.eventbus;

import java.lang.reflect.InvocationTargetException;
/* loaded from: classes.dex */
public class Subscriber {
    public final Object target;

    /* loaded from: classes.dex */
    public static final class SynchronizedSubscriber extends Subscriber {
        @Override // com.google.common.eventbus.Subscriber
        public final void invokeSubscriberMethod(Object event) throws InvocationTargetException {
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

    public void invokeSubscriberMethod(Object event) throws InvocationTargetException {
        try {
            event.getClass();
            throw null;
        } catch (IllegalAccessException e) {
            String valueOf = String.valueOf(event);
            StringBuilder sb = new StringBuilder(valueOf.length() + 28);
            sb.append("Method became inaccessible: ");
            sb.append(valueOf);
            throw new Error(sb.toString(), e);
        } catch (IllegalArgumentException e2) {
            String valueOf2 = String.valueOf(event);
            StringBuilder sb2 = new StringBuilder(valueOf2.length() + 33);
            sb2.append("Method rejected target/argument: ");
            sb2.append(valueOf2);
            throw new Error(sb2.toString(), e2);
        } catch (InvocationTargetException e3) {
            if (e3.getCause() instanceof Error) {
                throw ((Error) e3.getCause());
            }
            throw e3;
        }
    }

    public final int hashCode() {
        throw null;
    }
}
