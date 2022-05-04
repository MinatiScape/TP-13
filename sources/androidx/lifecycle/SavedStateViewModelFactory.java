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
/* loaded from: classes.dex */
public final class SavedStateViewModelFactory extends ViewModelProvider.KeyedFactory {
    public static final Class<?>[] ANDROID_VIEWMODEL_SIGNATURE = {Application.class, SavedStateHandle.class};
    public static final Class<?>[] VIEWMODEL_SIGNATURE = {SavedStateHandle.class};
    public final Application mApplication;
    public final Bundle mDefaultArgs;
    public final ViewModelProvider.Factory mFactory;
    public final Lifecycle mLifecycle;
    public final SavedStateRegistry mSavedStateRegistry;

    @SuppressLint({"LambdaLast"})
    public SavedStateViewModelFactory(Application application, SavedStateRegistryOwner owner, Bundle defaultArgs) {
        ViewModelProvider.Factory factory;
        this.mSavedStateRegistry = owner.getSavedStateRegistry();
        this.mLifecycle = owner.getLifecycle();
        this.mDefaultArgs = defaultArgs;
        this.mApplication = application;
        if (application != null) {
            if (ViewModelProvider.AndroidViewModelFactory.sInstance == null) {
                ViewModelProvider.AndroidViewModelFactory.sInstance = new ViewModelProvider.AndroidViewModelFactory(application);
            }
            factory = ViewModelProvider.AndroidViewModelFactory.sInstance;
        } else {
            if (ViewModelProvider.NewInstanceFactory.sInstance == null) {
                ViewModelProvider.NewInstanceFactory.sInstance = new ViewModelProvider.NewInstanceFactory();
            }
            factory = ViewModelProvider.NewInstanceFactory.sInstance;
        }
        this.mFactory = factory;
    }

    public static <T> Constructor<T> findMatchingConstructor(Class<T> modelClass, Class<?>[] signature) {
        for (Constructor<?> constructor : modelClass.getConstructors()) {
            Constructor<T> constructor2 = (Constructor<T>) constructor;
            if (Arrays.equals(signature, constructor2.getParameterTypes())) {
                return constructor2;
            }
        }
        return null;
    }

    @Override // androidx.lifecycle.ViewModelProvider.KeyedFactory
    public <T extends ViewModel> T create(String key, Class<T> modelClass) {
        Constructor constructor;
        SavedStateHandle savedStateHandle;
        T t;
        boolean isAssignableFrom = AndroidViewModel.class.isAssignableFrom(modelClass);
        if (!isAssignableFrom || this.mApplication == null) {
            constructor = findMatchingConstructor(modelClass, VIEWMODEL_SIGNATURE);
        } else {
            constructor = findMatchingConstructor(modelClass, ANDROID_VIEWMODEL_SIGNATURE);
        }
        if (constructor == null) {
            return (T) this.mFactory.create(modelClass);
        }
        SavedStateRegistry savedStateRegistry = this.mSavedStateRegistry;
        Lifecycle lifecycle = this.mLifecycle;
        Bundle bundle = this.mDefaultArgs;
        Bundle consumeRestoredStateForKey = savedStateRegistry.consumeRestoredStateForKey(key);
        Class[] clsArr = SavedStateHandle.ACCEPTABLE_CLASSES;
        if (consumeRestoredStateForKey == null && bundle == null) {
            savedStateHandle = new SavedStateHandle();
        } else {
            HashMap hashMap = new HashMap();
            if (bundle != null) {
                for (String str : bundle.keySet()) {
                    hashMap.put(str, bundle.get(str));
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
        SavedStateHandleController savedStateHandleController = new SavedStateHandleController(key, savedStateHandle);
        savedStateHandleController.attachToLifecycle(savedStateRegistry, lifecycle);
        SavedStateHandleController.tryToAddRecreator(savedStateRegistry, lifecycle);
        if (isAssignableFrom) {
            try {
                Application application = this.mApplication;
                if (application != null) {
                    t = (T) constructor.newInstance(application, savedStateHandle);
                    t.setTagIfAbsent("androidx.lifecycle.savedstate.vm.tag", savedStateHandleController);
                    return t;
                }
            } catch (IllegalAccessException e) {
                throw new RuntimeException("Failed to access " + modelClass, e);
            } catch (InstantiationException e2) {
                throw new RuntimeException("A " + modelClass + " cannot be instantiated.", e2);
            } catch (InvocationTargetException e3) {
                throw new RuntimeException("An exception happened in constructor of " + modelClass, e3.getCause());
            }
        }
        t = (T) constructor.newInstance(savedStateHandle);
        t.setTagIfAbsent("androidx.lifecycle.savedstate.vm.tag", savedStateHandleController);
        return t;
    }

    @Override // androidx.lifecycle.ViewModelProvider.OnRequeryFactory
    public void onRequery(ViewModel viewModel) {
        SavedStateHandleController.attachHandleIfNeeded(viewModel, this.mSavedStateRegistry, this.mLifecycle);
    }

    @Override // androidx.lifecycle.ViewModelProvider.KeyedFactory, androidx.lifecycle.ViewModelProvider.Factory
    public <T extends ViewModel> T create(Class<T> modelClass) {
        String canonicalName = modelClass.getCanonicalName();
        if (canonicalName != null) {
            return (T) create(canonicalName, modelClass);
        }
        throw new IllegalArgumentException("Local and anonymous classes can not be ViewModels");
    }
}
