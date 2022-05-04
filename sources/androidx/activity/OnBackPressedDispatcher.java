package androidx.activity;

import android.annotation.SuppressLint;
import androidx.activity.ComponentActivity;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleEventObserver;
import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.LifecycleRegistry;
import java.util.ArrayDeque;
import java.util.Iterator;
/* loaded from: classes.dex */
public final class OnBackPressedDispatcher {
    public final Runnable mFallbackOnBackPressed;
    public final ArrayDeque<OnBackPressedCallback> mOnBackPressedCallbacks = new ArrayDeque<>();

    /* loaded from: classes.dex */
    public class LifecycleOnBackPressedCancellable implements LifecycleEventObserver, Cancellable {
        public OnBackPressedCancellable mCurrentCancellable;
        public final Lifecycle mLifecycle;
        public final OnBackPressedCallback mOnBackPressedCallback;

        public LifecycleOnBackPressedCancellable(Lifecycle lifecycle, OnBackPressedCallback onBackPressedCallback) {
            this.mLifecycle = lifecycle;
            this.mOnBackPressedCallback = onBackPressedCallback;
            lifecycle.addObserver(this);
        }

        @Override // androidx.activity.Cancellable
        public final void cancel() {
            this.mLifecycle.removeObserver(this);
            this.mOnBackPressedCallback.mCancellables.remove(this);
            OnBackPressedCancellable onBackPressedCancellable = this.mCurrentCancellable;
            if (onBackPressedCancellable != null) {
                onBackPressedCancellable.cancel();
                this.mCurrentCancellable = null;
            }
        }

        @Override // androidx.lifecycle.LifecycleEventObserver
        public final void onStateChanged(LifecycleOwner lifecycleOwner, Lifecycle.Event event) {
            if (event == Lifecycle.Event.ON_START) {
                OnBackPressedDispatcher onBackPressedDispatcher = OnBackPressedDispatcher.this;
                OnBackPressedCallback onBackPressedCallback = this.mOnBackPressedCallback;
                onBackPressedDispatcher.mOnBackPressedCallbacks.add(onBackPressedCallback);
                OnBackPressedCancellable onBackPressedCancellable = new OnBackPressedCancellable(onBackPressedCallback);
                onBackPressedCallback.mCancellables.add(onBackPressedCancellable);
                this.mCurrentCancellable = onBackPressedCancellable;
            } else if (event == Lifecycle.Event.ON_STOP) {
                OnBackPressedCancellable onBackPressedCancellable2 = this.mCurrentCancellable;
                if (onBackPressedCancellable2 != null) {
                    onBackPressedCancellable2.cancel();
                }
            } else if (event == Lifecycle.Event.ON_DESTROY) {
                cancel();
            }
        }
    }

    /* loaded from: classes.dex */
    public class OnBackPressedCancellable implements Cancellable {
        public final OnBackPressedCallback mOnBackPressedCallback;

        public OnBackPressedCancellable(OnBackPressedCallback onBackPressedCallback) {
            this.mOnBackPressedCallback = onBackPressedCallback;
        }

        @Override // androidx.activity.Cancellable
        public final void cancel() {
            OnBackPressedDispatcher.this.mOnBackPressedCallbacks.remove(this.mOnBackPressedCallback);
            this.mOnBackPressedCallback.mCancellables.remove(this);
        }
    }

    public final void onBackPressed() {
        Iterator<OnBackPressedCallback> descendingIterator = this.mOnBackPressedCallbacks.descendingIterator();
        while (descendingIterator.hasNext()) {
            OnBackPressedCallback next = descendingIterator.next();
            if (next.mEnabled) {
                next.handleOnBackPressed();
                return;
            }
        }
        Runnable runnable = this.mFallbackOnBackPressed;
        if (runnable != null) {
            runnable.run();
        }
    }

    public OnBackPressedDispatcher(ComponentActivity.AnonymousClass1 r2) {
        this.mFallbackOnBackPressed = r2;
    }

    @SuppressLint({"LambdaLast"})
    public final void addCallback(LifecycleOwner lifecycleOwner, OnBackPressedCallback onBackPressedCallback) {
        LifecycleRegistry lifecycle = lifecycleOwner.getLifecycle();
        if (lifecycle.mState != Lifecycle.State.DESTROYED) {
            onBackPressedCallback.mCancellables.add(new LifecycleOnBackPressedCancellable(lifecycle, onBackPressedCallback));
        }
    }
}
