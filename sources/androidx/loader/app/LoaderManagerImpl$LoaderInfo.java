package androidx.loader.app;

import android.util.Log;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.Observer;
/* loaded from: classes.dex */
public final class LoaderManagerImpl$LoaderInfo<D> extends MutableLiveData<D> {
    @Override // androidx.lifecycle.LiveData
    public final void onActive() {
        if (Log.isLoggable("LoaderManager", 2)) {
            Log.v("LoaderManager", "  Starting: " + this);
        }
        throw null;
    }

    @Override // androidx.lifecycle.LiveData
    public final void onInactive() {
        if (Log.isLoggable("LoaderManager", 2)) {
            Log.v("LoaderManager", "  Stopping: " + this);
        }
        throw null;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(64);
        sb.append("LoaderInfo{");
        sb.append(Integer.toHexString(System.identityHashCode(this)));
        sb.append(" #");
        sb.append(0);
        sb.append(" : ");
        throw null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // androidx.lifecycle.LiveData
    public final void removeObserver(Observer<? super D> observer) {
        super.removeObserver(observer);
    }

    @Override // androidx.lifecycle.MutableLiveData, androidx.lifecycle.LiveData
    public final void setValue(D d) {
        super.setValue(d);
    }
}
