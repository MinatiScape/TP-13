package androidx.savedstate;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import androidx.arch.core.internal.SafeIterableMap;
import androidx.lifecycle.SavedStateHandleController;
import androidx.savedstate.Recreator;
@SuppressLint({"RestrictedApi"})
/* loaded from: classes.dex */
public final class SavedStateRegistry {
    public Recreator.SavedStateProvider mRecreatorProvider;
    public boolean mRestored;
    public Bundle mRestoredState;
    public SafeIterableMap<String, SavedStateProvider> mComponents = new SafeIterableMap<>();
    public boolean mAllowingSavingState = true;

    /* loaded from: classes.dex */
    public interface AutoRecreated {
        void onRecreated(SavedStateRegistryOwner savedStateRegistryOwner);
    }

    /* loaded from: classes.dex */
    public interface SavedStateProvider {
        Bundle saveState();
    }

    public final Bundle consumeRestoredStateForKey(String str) {
        if (this.mRestored) {
            Bundle bundle = this.mRestoredState;
            if (bundle == null) {
                return null;
            }
            Bundle bundle2 = bundle.getBundle(str);
            this.mRestoredState.remove(str);
            if (this.mRestoredState.isEmpty()) {
                this.mRestoredState = null;
            }
            return bundle2;
        }
        throw new IllegalStateException("You can consumeRestoredStateForKey only after super.onCreate of corresponding component");
    }

    public final void registerSavedStateProvider(String str, SavedStateProvider savedStateProvider) {
        SavedStateProvider savedStateProvider2;
        SafeIterableMap<String, SavedStateProvider> safeIterableMap = this.mComponents;
        SafeIterableMap.Entry<String, SavedStateProvider> entry = safeIterableMap.get(str);
        if (entry != null) {
            savedStateProvider2 = entry.mValue;
        } else {
            SafeIterableMap.Entry<K, V> entry2 = new SafeIterableMap.Entry<>(str, savedStateProvider);
            safeIterableMap.mSize++;
            SafeIterableMap.Entry entry3 = safeIterableMap.mEnd;
            if (entry3 == null) {
                safeIterableMap.mStart = entry2;
                safeIterableMap.mEnd = entry2;
            } else {
                entry3.mNext = entry2;
                entry2.mPrevious = entry3;
                safeIterableMap.mEnd = entry2;
            }
            savedStateProvider2 = null;
        }
        if (savedStateProvider2 != null) {
            throw new IllegalArgumentException("SavedStateProvider with the given key is already registered");
        }
    }

    public final void runOnNextRecreation() {
        if (this.mAllowingSavingState) {
            if (this.mRecreatorProvider == null) {
                this.mRecreatorProvider = new Recreator.SavedStateProvider(this);
            }
            try {
                SavedStateHandleController.OnRecreation.class.getDeclaredConstructor(new Class[0]);
                Recreator.SavedStateProvider savedStateProvider = this.mRecreatorProvider;
                savedStateProvider.mClasses.add(SavedStateHandleController.OnRecreation.class.getName());
            } catch (NoSuchMethodException e) {
                StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Class");
                m.append(SavedStateHandleController.OnRecreation.class.getSimpleName());
                m.append(" must have default constructor in order to be automatically recreated");
                throw new IllegalArgumentException(m.toString(), e);
            }
        } else {
            throw new IllegalStateException("Can not perform this action after onSaveInstanceState");
        }
    }
}
