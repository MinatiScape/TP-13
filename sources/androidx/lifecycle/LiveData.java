package androidx.lifecycle;

import android.os.Looper;
import androidx.arch.core.executor.ArchTaskExecutor;
import androidx.arch.core.internal.SafeIterableMap;
import androidx.concurrent.futures.AbstractResolvableFuture$$ExternalSyntheticOutline0;
import androidx.lifecycle.Lifecycle;
import androidx.slice.Slice;
import java.util.Map;
/* loaded from: classes.dex */
public abstract class LiveData<T> {
    public static final Object NOT_SET = new Object();
    public boolean mChangingActiveState;
    public volatile Object mData;
    public boolean mDispatchInvalidated;
    public boolean mDispatchingValue;
    public volatile Object mPendingData;
    public final Object mDataLock = new Object();
    public SafeIterableMap<Observer<? super T>, LiveData<T>.ObserverWrapper> mObservers = new SafeIterableMap<>();
    public int mActiveCount = 0;
    public final AnonymousClass1 mPostValueRunnable = new Runnable() { // from class: androidx.lifecycle.LiveData.1
        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.lang.Runnable
        public final void run() {
            Object obj;
            synchronized (LiveData.this.mDataLock) {
                obj = LiveData.this.mPendingData;
                LiveData.this.mPendingData = LiveData.NOT_SET;
            }
            LiveData.this.setValue(obj);
        }
    };
    public int mVersion = -1;

    /* loaded from: classes.dex */
    public class LifecycleBoundObserver extends LiveData<T>.ObserverWrapper implements LifecycleEventObserver {
        public final LifecycleOwner mOwner;

        public LifecycleBoundObserver(LifecycleOwner lifecycleOwner, Observer<? super T> observer) {
            super(observer);
            this.mOwner = lifecycleOwner;
        }

        @Override // androidx.lifecycle.LiveData.ObserverWrapper
        public final void detachObserver() {
            this.mOwner.getLifecycle().removeObserver(this);
        }

        @Override // androidx.lifecycle.LiveData.ObserverWrapper
        public final boolean isAttachedTo(LifecycleOwner lifecycleOwner) {
            if (this.mOwner == lifecycleOwner) {
                return true;
            }
            return false;
        }

        @Override // androidx.lifecycle.LifecycleEventObserver
        public final void onStateChanged(LifecycleOwner lifecycleOwner, Lifecycle.Event event) {
            Lifecycle.State state = this.mOwner.getLifecycle().mState;
            if (state == Lifecycle.State.DESTROYED) {
                LiveData.this.removeObserver(this.mObserver);
                return;
            }
            Lifecycle.State state2 = null;
            while (state2 != state) {
                activeStateChanged(shouldBeActive());
                state2 = state;
                state = this.mOwner.getLifecycle().mState;
            }
        }

        @Override // androidx.lifecycle.LiveData.ObserverWrapper
        public final boolean shouldBeActive() {
            return this.mOwner.getLifecycle().mState.isAtLeast(Lifecycle.State.STARTED);
        }
    }

    /* loaded from: classes.dex */
    public abstract class ObserverWrapper {
        public boolean mActive;
        public int mLastVersion = -1;
        public final Observer<? super T> mObserver;

        public void detachObserver() {
        }

        public boolean isAttachedTo(LifecycleOwner lifecycleOwner) {
            return false;
        }

        public abstract boolean shouldBeActive();

        public ObserverWrapper(Observer<? super T> observer) {
            this.mObserver = observer;
        }

        public final void activeStateChanged(boolean z) {
            int i;
            boolean z2;
            boolean z3;
            if (z != this.mActive) {
                this.mActive = z;
                LiveData liveData = LiveData.this;
                if (z) {
                    i = 1;
                } else {
                    i = -1;
                }
                int i2 = liveData.mActiveCount;
                liveData.mActiveCount = i + i2;
                if (!liveData.mChangingActiveState) {
                    liveData.mChangingActiveState = true;
                    while (true) {
                        try {
                            int i3 = liveData.mActiveCount;
                            if (i2 == i3) {
                                break;
                            }
                            if (i2 != 0 || i3 <= 0) {
                                z2 = false;
                            } else {
                                z2 = true;
                            }
                            if (i2 <= 0 || i3 != 0) {
                                z3 = false;
                            } else {
                                z3 = true;
                            }
                            if (z2) {
                                liveData.onActive();
                            } else if (z3) {
                                liveData.onInactive();
                            }
                            i2 = i3;
                        } finally {
                            liveData.mChangingActiveState = false;
                        }
                    }
                }
                if (this.mActive) {
                    LiveData.this.dispatchingValue(this);
                }
            }
        }
    }

    public void onActive() {
    }

    public void onInactive() {
    }

    public final void considerNotify(LiveData<T>.ObserverWrapper observerWrapper) {
        if (observerWrapper.mActive) {
            if (!observerWrapper.shouldBeActive()) {
                observerWrapper.activeStateChanged(false);
                return;
            }
            int i = observerWrapper.mLastVersion;
            int i2 = this.mVersion;
            if (i < i2) {
                observerWrapper.mLastVersion = i2;
                observerWrapper.mObserver.onChanged((Object) this.mData);
            }
        }
    }

    public final void dispatchingValue(LiveData<T>.ObserverWrapper observerWrapper) {
        if (this.mDispatchingValue) {
            this.mDispatchInvalidated = true;
            return;
        }
        this.mDispatchingValue = true;
        do {
            this.mDispatchInvalidated = false;
            if (observerWrapper == null) {
                SafeIterableMap<Observer<? super T>, LiveData<T>.ObserverWrapper> safeIterableMap = this.mObservers;
                safeIterableMap.getClass();
                SafeIterableMap.IteratorWithAdditions iteratorWithAdditions = new SafeIterableMap.IteratorWithAdditions();
                safeIterableMap.mIterators.put(iteratorWithAdditions, Boolean.FALSE);
                while (iteratorWithAdditions.hasNext()) {
                    considerNotify((ObserverWrapper) ((Map.Entry) iteratorWithAdditions.next()).getValue());
                    if (this.mDispatchInvalidated) {
                        break;
                    }
                }
            } else {
                considerNotify(observerWrapper);
                observerWrapper = null;
            }
        } while (this.mDispatchInvalidated);
        this.mDispatchingValue = false;
    }

    public final void observe(LifecycleOwner lifecycleOwner, Observer<? super T> observer) {
        LiveData<T>.ObserverWrapper observerWrapper;
        assertMainThread("observe");
        if (lifecycleOwner.getLifecycle().mState != Lifecycle.State.DESTROYED) {
            LifecycleBoundObserver lifecycleBoundObserver = new LifecycleBoundObserver(lifecycleOwner, observer);
            SafeIterableMap<Observer<? super T>, LiveData<T>.ObserverWrapper> safeIterableMap = this.mObservers;
            SafeIterableMap.Entry<Observer<? super T>, LiveData<T>.ObserverWrapper> entry = safeIterableMap.get(observer);
            if (entry != null) {
                observerWrapper = entry.mValue;
            } else {
                SafeIterableMap.Entry<K, V> entry2 = new SafeIterableMap.Entry<>(observer, lifecycleBoundObserver);
                safeIterableMap.mSize++;
                SafeIterableMap.Entry entry3 = (SafeIterableMap.Entry<Observer<? super T>, LiveData<T>.ObserverWrapper>) safeIterableMap.mEnd;
                if (entry3 == null) {
                    safeIterableMap.mStart = entry2;
                    safeIterableMap.mEnd = entry2;
                } else {
                    entry3.mNext = entry2;
                    entry2.mPrevious = entry3;
                    safeIterableMap.mEnd = entry2;
                }
                observerWrapper = null;
            }
            LiveData<T>.ObserverWrapper observerWrapper2 = observerWrapper;
            if (observerWrapper2 != null && !observerWrapper2.isAttachedTo(lifecycleOwner)) {
                throw new IllegalArgumentException("Cannot add the same observer with different lifecycles");
            } else if (observerWrapper2 == null) {
                lifecycleOwner.getLifecycle().addObserver(lifecycleBoundObserver);
            }
        }
    }

    public final void observeForever(Observer<? super T> observer) {
        LiveData<T>.ObserverWrapper observerWrapper;
        assertMainThread("observeForever");
        AlwaysActiveObserver alwaysActiveObserver = new AlwaysActiveObserver(this, observer);
        SafeIterableMap<Observer<? super T>, LiveData<T>.ObserverWrapper> safeIterableMap = this.mObservers;
        SafeIterableMap.Entry<Observer<? super T>, LiveData<T>.ObserverWrapper> entry = safeIterableMap.get(observer);
        if (entry != null) {
            observerWrapper = entry.mValue;
        } else {
            SafeIterableMap.Entry<K, V> entry2 = new SafeIterableMap.Entry<>(observer, alwaysActiveObserver);
            safeIterableMap.mSize++;
            SafeIterableMap.Entry entry3 = (SafeIterableMap.Entry<Observer<? super T>, LiveData<T>.ObserverWrapper>) safeIterableMap.mEnd;
            if (entry3 == null) {
                safeIterableMap.mStart = entry2;
                safeIterableMap.mEnd = entry2;
            } else {
                entry3.mNext = entry2;
                entry2.mPrevious = entry3;
                safeIterableMap.mEnd = entry2;
            }
            observerWrapper = null;
        }
        LiveData<T>.ObserverWrapper observerWrapper2 = observerWrapper;
        if (observerWrapper2 instanceof LifecycleBoundObserver) {
            throw new IllegalArgumentException("Cannot add the same observer with different lifecycles");
        } else if (observerWrapper2 == null) {
            alwaysActiveObserver.activeStateChanged(true);
        }
    }

    public final void postValue(Slice slice) {
        boolean z;
        synchronized (this.mDataLock) {
            if (this.mPendingData == NOT_SET) {
                z = true;
            } else {
                z = false;
            }
            this.mPendingData = slice;
        }
        if (z) {
            ArchTaskExecutor.getInstance().postToMainThread(this.mPostValueRunnable);
        }
    }

    public void removeObserver(Observer<? super T> observer) {
        assertMainThread("removeObserver");
        LiveData<T>.ObserverWrapper remove = this.mObservers.remove(observer);
        if (remove != null) {
            remove.detachObserver();
            remove.activeStateChanged(false);
        }
    }

    public void setValue(T t) {
        assertMainThread("setValue");
        this.mVersion++;
        this.mData = t;
        dispatchingValue(null);
    }

    /* JADX WARN: Type inference failed for: r1v0, types: [androidx.lifecycle.LiveData$1] */
    public LiveData() {
        Object obj = NOT_SET;
        this.mPendingData = obj;
        this.mData = obj;
    }

    public static void assertMainThread(String str) {
        boolean z;
        ArchTaskExecutor.getInstance().mDelegate.getClass();
        if (Looper.getMainLooper().getThread() == Thread.currentThread()) {
            z = true;
        } else {
            z = false;
        }
        if (!z) {
            throw new IllegalStateException(AbstractResolvableFuture$$ExternalSyntheticOutline0.m("Cannot invoke ", str, " on a background thread"));
        }
    }

    /* loaded from: classes.dex */
    public class AlwaysActiveObserver extends LiveData<T>.ObserverWrapper {
        @Override // androidx.lifecycle.LiveData.ObserverWrapper
        public final boolean shouldBeActive() {
            return true;
        }

        public AlwaysActiveObserver(LiveData liveData, Observer<? super T> observer) {
            super(observer);
        }
    }
}
