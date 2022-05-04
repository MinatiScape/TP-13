package androidx.activity;

import java.util.concurrent.CopyOnWriteArrayList;
/* loaded from: classes.dex */
public abstract class OnBackPressedCallback {
    public CopyOnWriteArrayList<Cancellable> mCancellables = new CopyOnWriteArrayList<>();
    public boolean mEnabled;

    public abstract void handleOnBackPressed();

    public OnBackPressedCallback(boolean z) {
        this.mEnabled = z;
    }
}
