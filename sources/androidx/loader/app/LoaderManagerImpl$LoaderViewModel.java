package androidx.loader.app;

import android.util.Log;
import androidx.collection.SparseArrayCompat;
import androidx.lifecycle.ViewModel;
import androidx.lifecycle.ViewModelProvider;
/* loaded from: classes.dex */
public final class LoaderManagerImpl$LoaderViewModel extends ViewModel {
    public static final AnonymousClass1 FACTORY = new ViewModelProvider.Factory() { // from class: androidx.loader.app.LoaderManagerImpl$LoaderViewModel.1
        @Override // androidx.lifecycle.ViewModelProvider.Factory
        public final <T extends ViewModel> T create(Class<T> cls) {
            return new LoaderManagerImpl$LoaderViewModel();
        }
    };
    public SparseArrayCompat<LoaderManagerImpl$LoaderInfo> mLoaders = new SparseArrayCompat<>();

    @Override // androidx.lifecycle.ViewModel
    public final void onCleared() {
        SparseArrayCompat<LoaderManagerImpl$LoaderInfo> sparseArrayCompat = this.mLoaders;
        int i = sparseArrayCompat.mSize;
        if (i > 0) {
            LoaderManagerImpl$LoaderInfo loaderManagerImpl$LoaderInfo = (LoaderManagerImpl$LoaderInfo) sparseArrayCompat.mValues[0];
            loaderManagerImpl$LoaderInfo.getClass();
            if (Log.isLoggable("LoaderManager", 3)) {
                Log.d("LoaderManager", "  Destroying: " + loaderManagerImpl$LoaderInfo);
            }
            throw null;
        }
        Object[] objArr = sparseArrayCompat.mValues;
        for (int i2 = 0; i2 < i; i2++) {
            objArr[i2] = null;
        }
        sparseArrayCompat.mSize = 0;
    }
}
