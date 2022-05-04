package androidx.lifecycle;

import android.app.Application;
import java.lang.reflect.InvocationTargetException;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: ViewModelProvider.kt */
/* loaded from: classes.dex */
public final class ViewModelProvider {
    @NotNull
    public final Factory factory;
    @NotNull
    public final ViewModelStore store;

    /* compiled from: ViewModelProvider.kt */
    /* loaded from: classes.dex */
    public static class AndroidViewModelFactory extends NewInstanceFactory {
        @Nullable
        public static AndroidViewModelFactory sInstance;
        @NotNull
        public final Application application;

        public AndroidViewModelFactory(@NotNull Application application) {
            Intrinsics.checkNotNullParameter(application, "application");
            this.application = application;
        }

        @Override // androidx.lifecycle.ViewModelProvider.NewInstanceFactory, androidx.lifecycle.ViewModelProvider.Factory
        @NotNull
        public final <T extends ViewModel> T create(@NotNull Class<T> cls) {
            if (!AndroidViewModel.class.isAssignableFrom(cls)) {
                return (T) super.create(cls);
            }
            try {
                T newInstance = cls.getConstructor(Application.class).newInstance(this.application);
                Intrinsics.checkNotNullExpressionValue(newInstance, "{\n                try {\n…          }\n            }");
                return newInstance;
            } catch (IllegalAccessException e) {
                throw new RuntimeException(Intrinsics.stringPlus("Cannot create an instance of ", cls), e);
            } catch (InstantiationException e2) {
                throw new RuntimeException(Intrinsics.stringPlus("Cannot create an instance of ", cls), e2);
            } catch (NoSuchMethodException e3) {
                throw new RuntimeException(Intrinsics.stringPlus("Cannot create an instance of ", cls), e3);
            } catch (InvocationTargetException e4) {
                throw new RuntimeException(Intrinsics.stringPlus("Cannot create an instance of ", cls), e4);
            }
        }
    }

    /* compiled from: ViewModelProvider.kt */
    /* loaded from: classes.dex */
    public interface Factory {
        @NotNull
        <T extends ViewModel> T create(@NotNull Class<T> cls);
    }

    /* compiled from: ViewModelProvider.kt */
    /* loaded from: classes.dex */
    public static abstract class KeyedFactory extends OnRequeryFactory implements Factory {
        @NotNull
        public abstract <T extends ViewModel> T create(@NotNull String str, @NotNull Class<T> cls);

        @NotNull
        public <T extends ViewModel> T create(@NotNull Class<T> cls) {
            throw new UnsupportedOperationException("create(String, Class<?>) must be called on implementations of KeyedFactory");
        }
    }

    /* compiled from: ViewModelProvider.kt */
    /* loaded from: classes.dex */
    public static class NewInstanceFactory implements Factory {
        @Nullable
        public static NewInstanceFactory sInstance;

        @Override // androidx.lifecycle.ViewModelProvider.Factory
        @NotNull
        public <T extends ViewModel> T create(@NotNull Class<T> cls) {
            try {
                T newInstance = cls.newInstance();
                Intrinsics.checkNotNullExpressionValue(newInstance, "{\n                modelC…wInstance()\n            }");
                return newInstance;
            } catch (IllegalAccessException e) {
                throw new RuntimeException(Intrinsics.stringPlus("Cannot create an instance of ", cls), e);
            } catch (InstantiationException e2) {
                throw new RuntimeException(Intrinsics.stringPlus("Cannot create an instance of ", cls), e2);
            }
        }
    }

    /* compiled from: ViewModelProvider.kt */
    /* loaded from: classes.dex */
    public static class OnRequeryFactory {
        public void onRequery(@NotNull ViewModel viewModel) {
        }
    }

    public ViewModelProvider(@NotNull ViewModelStore store, @NotNull Factory factory) {
        Intrinsics.checkNotNullParameter(store, "store");
        this.store = store;
        this.factory = factory;
    }

    @NotNull
    public final <T extends ViewModel> T get(@NotNull Class<T> cls) {
        Object obj;
        OnRequeryFactory onRequeryFactory;
        String canonicalName = cls.getCanonicalName();
        if (canonicalName != null) {
            String key = Intrinsics.stringPlus("androidx.lifecycle.ViewModelProvider.DefaultKey:", canonicalName);
            Intrinsics.checkNotNullParameter(key, "key");
            T viewModel = (T) this.store.mMap.get(key);
            if (cls.isInstance(viewModel)) {
                Factory factory = this.factory;
                if (factory instanceof OnRequeryFactory) {
                    onRequeryFactory = (OnRequeryFactory) factory;
                } else {
                    onRequeryFactory = null;
                }
                if (onRequeryFactory != null) {
                    Intrinsics.checkNotNullExpressionValue(viewModel, "viewModel");
                    onRequeryFactory.onRequery(viewModel);
                }
                if (viewModel == null) {
                    throw new NullPointerException("null cannot be cast to non-null type T of androidx.lifecycle.ViewModelProvider.get");
                }
            } else {
                Factory factory2 = this.factory;
                if (factory2 instanceof KeyedFactory) {
                    obj = ((KeyedFactory) factory2).create(key, cls);
                } else {
                    obj = factory2.create(cls);
                }
                viewModel = (T) obj;
                ViewModel put = this.store.mMap.put(key, viewModel);
                if (put != null) {
                    put.onCleared();
                }
                Intrinsics.checkNotNullExpressionValue(viewModel, "viewModel");
            }
            return viewModel;
        }
        throw new IllegalArgumentException("Local and anonymous classes can not be ViewModels");
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public ViewModelProvider(@org.jetbrains.annotations.NotNull androidx.fragment.app.FragmentActivity r3) {
        /*
            r2 = this;
            java.lang.String r0 = "owner"
            kotlin.jvm.internal.Intrinsics.checkNotNullParameter(r3, r0)
            androidx.lifecycle.ViewModelStore r0 = r3.getViewModelStore()
            java.lang.String r1 = "owner.viewModelStore"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r0, r1)
            androidx.lifecycle.ViewModelProvider$Factory r3 = r3.getDefaultViewModelProviderFactory()
            java.lang.String r1 = "owner.defaultViewModelProviderFactory"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r3, r1)
            r2.<init>(r0, r3)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.lifecycle.ViewModelProvider.<init>(androidx.fragment.app.FragmentActivity):void");
    }
}
