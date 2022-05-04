package androidx.lifecycle;

import android.annotation.SuppressLint;
import android.app.Application;
import android.os.Bundle;
import androidx.lifecycle.ViewModelProvider;
import androidx.savedstate.SavedStateRegistry;
import androidx.savedstate.SavedStateRegistryOwner;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import kotlin.jvm.internal.Intrinsics;
/* loaded from: classes.dex */
public final class SavedStateViewModelFactory extends ViewModelProvider.KeyedFactory {
    public static final Class<?>[] ANDROID_VIEWMODEL_SIGNATURE = {Application.class, SavedStateHandle.class};
    public static final Class<?>[] VIEWMODEL_SIGNATURE = {SavedStateHandle.class};
    public final Application mApplication;
    public final Bundle mDefaultArgs;
    public final ViewModelProvider.NewInstanceFactory mFactory;
    public final Lifecycle mLifecycle;
    public final SavedStateRegistry mSavedStateRegistry;

    @Override // androidx.lifecycle.ViewModelProvider.KeyedFactory
    public final <T extends ViewModel> T create(String str, Class<T> cls) {
        SavedStateHandle savedStateHandle;
        T t;
        Constructor<?>[] constructors;
        Constructor<?>[] constructors2;
        boolean isAssignableFrom = AndroidViewModel.class.isAssignableFrom(cls);
        Constructor<?> constructor = null;
        if (!isAssignableFrom || this.mApplication == null) {
            Class<?>[] clsArr = VIEWMODEL_SIGNATURE;
            for (Constructor<?> constructor2 : cls.getConstructors()) {
                if (Arrays.equals(clsArr, constructor2.getParameterTypes())) {
                    constructor = constructor2;
                    break;
                }
            }
        } else {
            Class<?>[] clsArr2 = ANDROID_VIEWMODEL_SIGNATURE;
            for (Constructor<?> constructor22 : cls.getConstructors()) {
                if (Arrays.equals(clsArr2, constructor22.getParameterTypes())) {
                    constructor = constructor22;
                    break;
                }
            }
        }
        if (constructor == null) {
            return (T) this.mFactory.create(cls);
        }
        SavedStateRegistry savedStateRegistry = this.mSavedStateRegistry;
        Lifecycle lifecycle = this.mLifecycle;
        Bundle bundle = this.mDefaultArgs;
        Bundle consumeRestoredStateForKey = savedStateRegistry.consumeRestoredStateForKey(str);
        Class[] clsArr3 = SavedStateHandle.ACCEPTABLE_CLASSES;
        if (consumeRestoredStateForKey == null && bundle == null) {
            savedStateHandle = new SavedStateHandle();
        } else {
            HashMap hashMap = new HashMap();
            if (bundle != null) {
                for (String str2 : bundle.keySet()) {
                    hashMap.put(str2, bundle.get(str2));
                }
            }
            if (consumeRestoredStateForKey == null) {
                savedStateHandle = new SavedStateHandle(hashMap);
            } else {
                ArrayList parcelableArrayList = consumeRestoredStateForKey.getParcelableArrayList("keys");
                ArrayList parcelableArrayList2 = consumeRestoredStateForKey.getParcelableArrayList("values");
                if (parcelableArrayList == null || parcelableArrayList2 == null || parcelableArrayList.size() != parcelableArrayList2.size()) {
                    throw new IllegalStateException("Invalid bundle passed as restored state");
                }
                for (int i = 0; i < parcelableArrayList.size(); i++) {
                    hashMap.put((String) parcelableArrayList.get(i), parcelableArrayList2.get(i));
                }
                savedStateHandle = new SavedStateHandle(hashMap);
            }
        }
        SavedStateHandleController savedStateHandleController = new SavedStateHandleController(str, savedStateHandle);
        savedStateHandleController.attachToLifecycle(savedStateRegistry, lifecycle);
        SavedStateHandleController.tryToAddRecreator(savedStateRegistry, lifecycle);
        if (isAssignableFrom) {
            try {
                Application application = this.mApplication;
                if (application != null) {
                    t = (T) constructor.newInstance(application, savedStateHandle);
                    t.setTagIfAbsent(savedStateHandleController);
                    return t;
                }
            } catch (IllegalAccessException e) {
                throw new RuntimeException("Failed to access " + cls, e);
            } catch (InstantiationException e2) {
                throw new RuntimeException("A " + cls + " cannot be instantiated.", e2);
            } catch (InvocationTargetException e3) {
                throw new RuntimeException("An exception happened in constructor of " + cls, e3.getCause());
            }
        }
        t = (T) constructor.newInstance(savedStateHandle);
        t.setTagIfAbsent(savedStateHandleController);
        return t;
    }

    @Override // androidx.lifecycle.ViewModelProvider.OnRequeryFactory
    public final void onRequery(ViewModel viewModel) {
        SavedStateHandleController.attachHandleIfNeeded(viewModel, this.mSavedStateRegistry, this.mLifecycle);
    }

    @SuppressLint({"LambdaLast"})
    public SavedStateViewModelFactory(Application application, SavedStateRegistryOwner savedStateRegistryOwner, Bundle bundle) {
        ViewModelProvider.NewInstanceFactory newInstanceFactory;
        this.mSavedStateRegistry = savedStateRegistryOwner.getSavedStateRegistry();
        this.mLifecycle = savedStateRegistryOwner.getLifecycle();
        this.mDefaultArgs = bundle;
        this.mApplication = application;
        if (application != null) {
            if (ViewModelProvider.AndroidViewModelFactory.sInstance == null) {
                ViewModelProvider.AndroidViewModelFactory.sInstance = new ViewModelProvider.AndroidViewModelFactory(application);
            }
            newInstanceFactory = ViewModelProvider.AndroidViewModelFactory.sInstance;
            Intrinsics.checkNotNull(newInstanceFactory);
        } else {
            if (ViewModelProvider.NewInstanceFactory.sInstance == null) {
                ViewModelProvider.NewInstanceFactory.sInstance = new ViewModelProvider.NewInstanceFactory();
            }
            newInstanceFactory = ViewModelProvider.NewInstanceFactory.sInstance;
            Intrinsics.checkNotNull(newInstanceFactory);
        }
        this.mFactory = newInstanceFactory;
    }

    @Override // androidx.lifecycle.ViewModelProvider.KeyedFactory, androidx.lifecycle.ViewModelProvider.Factory
    public final <T extends ViewModel> T create(Class<T> cls) {
        String canonicalName = cls.getCanonicalName();
        if (canonicalName != null) {
            return (T) create(canonicalName, cls);
        }
        throw new IllegalArgumentException("Local and anonymous classes can not be ViewModels");
    }
}
