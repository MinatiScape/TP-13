package androidx.fragment.app;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.Window;
import androidx.activity.ComponentActivity;
import androidx.activity.OnBackPressedDispatcher;
import androidx.activity.OnBackPressedDispatcherOwner;
import androidx.activity.contextaware.OnContextAvailableListener;
import androidx.activity.result.ActivityResultRegistry;
import androidx.activity.result.ActivityResultRegistryOwner;
import androidx.collection.SparseArrayCompat;
import androidx.core.app.ActivityCompat;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleRegistry;
import androidx.lifecycle.ViewModelProvider;
import androidx.lifecycle.ViewModelStore;
import androidx.lifecycle.ViewModelStoreOwner;
import androidx.loader.app.LoaderManagerImpl$LoaderInfo;
import androidx.loader.app.LoaderManagerImpl$LoaderViewModel;
import androidx.savedstate.SavedStateRegistry;
import androidx.savedstate.SavedStateRegistryOwner;
import java.io.FileDescriptor;
import java.io.PrintWriter;
/* loaded from: classes.dex */
public class FragmentActivity extends ComponentActivity implements ActivityCompat.RequestPermissionsRequestCodeValidator {
    public boolean mCreated;
    public boolean mResumed;
    public final FragmentController mFragments = new FragmentController(new HostCallbacks());
    public final LifecycleRegistry mFragmentLifecycleRegistry = new LifecycleRegistry(this, true);
    public boolean mStopped = true;

    /* loaded from: classes.dex */
    public class HostCallbacks extends FragmentHostCallback<FragmentActivity> implements ViewModelStoreOwner, OnBackPressedDispatcherOwner, ActivityResultRegistryOwner, SavedStateRegistryOwner, FragmentOnAttachListener {
        public HostCallbacks() {
            super(FragmentActivity.this);
        }

        @Override // androidx.activity.result.ActivityResultRegistryOwner
        public final ActivityResultRegistry getActivityResultRegistry() {
            return FragmentActivity.this.mActivityResultRegistry;
        }

        @Override // androidx.lifecycle.LifecycleOwner
        public final LifecycleRegistry getLifecycle() {
            return FragmentActivity.this.mFragmentLifecycleRegistry;
        }

        @Override // androidx.activity.OnBackPressedDispatcherOwner
        public final OnBackPressedDispatcher getOnBackPressedDispatcher() {
            return FragmentActivity.this.mOnBackPressedDispatcher;
        }

        @Override // androidx.savedstate.SavedStateRegistryOwner
        public final SavedStateRegistry getSavedStateRegistry() {
            return FragmentActivity.this.mSavedStateRegistryController.mRegistry;
        }

        @Override // androidx.lifecycle.ViewModelStoreOwner
        public final ViewModelStore getViewModelStore() {
            return FragmentActivity.this.getViewModelStore();
        }

        @Override // androidx.fragment.app.FragmentOnAttachListener
        public final void onAttachFragment$1() {
            FragmentActivity.this.getClass();
        }

        @Override // androidx.fragment.app.FragmentContainer
        public final View onFindViewById(int i) {
            return FragmentActivity.this.findViewById(i);
        }

        @Override // androidx.fragment.app.FragmentHostCallback
        public final LayoutInflater onGetLayoutInflater() {
            return FragmentActivity.this.getLayoutInflater().cloneInContext(FragmentActivity.this);
        }

        @Override // androidx.fragment.app.FragmentContainer
        public final boolean onHasView() {
            Window window = FragmentActivity.this.getWindow();
            if (window == null || window.peekDecorView() == null) {
                return false;
            }
            return true;
        }

        @Override // androidx.fragment.app.FragmentHostCallback
        public final void onSupportInvalidateOptionsMenu() {
            FragmentActivity.this.supportInvalidateOptionsMenu();
        }

        @Override // androidx.fragment.app.FragmentHostCallback
        public final FragmentActivity onGetHost$1() {
            return FragmentActivity.this;
        }
    }

    @Override // android.app.Activity, android.view.LayoutInflater.Factory2
    public final View onCreateView(View view, String str, Context context, AttributeSet attributeSet) {
        View onCreateView = this.mFragments.mHost.mFragmentManager.mLayoutInflaterFactory.onCreateView(view, str, context, attributeSet);
        return onCreateView == null ? super.onCreateView(view, str, context, attributeSet) : onCreateView;
    }

    @Override // androidx.core.app.ActivityCompat.RequestPermissionsRequestCodeValidator
    @Deprecated
    public final void validateRequestPermissionsRequestCode() {
    }

    public static boolean markState(FragmentManager fragmentManager) {
        FragmentActivity fragmentActivity;
        Lifecycle.State state = Lifecycle.State.CREATED;
        Lifecycle.State state2 = Lifecycle.State.STARTED;
        boolean z = false;
        for (Fragment fragment : fragmentManager.mFragmentStore.getFragments()) {
            if (fragment != null) {
                FragmentHostCallback<?> fragmentHostCallback = fragment.mHost;
                if (fragmentHostCallback == null) {
                    fragmentActivity = null;
                } else {
                    fragmentActivity = fragmentHostCallback.onGetHost$1();
                }
                if (fragmentActivity != null) {
                    z |= markState(fragment.getChildFragmentManager());
                }
                FragmentViewLifecycleOwner fragmentViewLifecycleOwner = fragment.mViewLifecycleOwner;
                if (fragmentViewLifecycleOwner != null) {
                    fragmentViewLifecycleOwner.initialize();
                    if (fragmentViewLifecycleOwner.mLifecycleRegistry.mState.isAtLeast(state2)) {
                        LifecycleRegistry lifecycleRegistry = fragment.mViewLifecycleOwner.mLifecycleRegistry;
                        lifecycleRegistry.enforceMainThreadIfNeeded("setCurrentState");
                        lifecycleRegistry.moveToState(state);
                        z = true;
                    }
                }
                if (fragment.mLifecycleRegistry.mState.isAtLeast(state2)) {
                    LifecycleRegistry lifecycleRegistry2 = fragment.mLifecycleRegistry;
                    lifecycleRegistry2.enforceMainThreadIfNeeded("setCurrentState");
                    lifecycleRegistry2.moveToState(state);
                    z = true;
                }
            }
        }
        return z;
    }

    public final FragmentManagerImpl getSupportFragmentManager() {
        return this.mFragments.mHost.mFragmentManager;
    }

    @Override // androidx.activity.ComponentActivity, android.app.Activity
    public void onActivityResult(int i, int i2, Intent intent) {
        this.mFragments.noteStateNotSaved();
        super.onActivityResult(i, i2, intent);
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration configuration) {
        this.mFragments.noteStateNotSaved();
        super.onConfigurationChanged(configuration);
        this.mFragments.mHost.mFragmentManager.dispatchConfigurationChanged(configuration);
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public final boolean onCreatePanelMenu(int i, Menu menu) {
        if (i != 0) {
            return super.onCreatePanelMenu(i, menu);
        }
        boolean onCreatePanelMenu = super.onCreatePanelMenu(i, menu);
        FragmentController fragmentController = this.mFragments;
        getMenuInflater();
        return fragmentController.mHost.mFragmentManager.dispatchCreateOptionsMenu() | onCreatePanelMenu;
    }

    @Override // android.app.Activity
    public final void onMultiWindowModeChanged(boolean z) {
        this.mFragments.mHost.mFragmentManager.dispatchMultiWindowModeChanged(z);
    }

    @Override // android.app.Activity
    public final void onNewIntent(@SuppressLint({"UnknownNullness"}) Intent intent) {
        this.mFragments.noteStateNotSaved();
        super.onNewIntent(intent);
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public void onPanelClosed(int i, Menu menu) {
        if (i == 0) {
            this.mFragments.mHost.mFragmentManager.dispatchOptionsMenuClosed();
        }
        super.onPanelClosed(i, menu);
    }

    @Override // android.app.Activity
    public final void onPictureInPictureModeChanged(boolean z) {
        this.mFragments.mHost.mFragmentManager.dispatchPictureInPictureModeChanged(z);
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public final boolean onPreparePanel(int i, View view, Menu menu) {
        if (i != 0) {
            return super.onPreparePanel(i, view, menu);
        }
        return this.mFragments.mHost.mFragmentManager.dispatchPrepareOptionsMenu() | super.onPreparePanel(0, view, menu);
    }

    @Override // androidx.activity.ComponentActivity, android.app.Activity
    public void onRequestPermissionsResult(int i, String[] strArr, int[] iArr) {
        this.mFragments.noteStateNotSaved();
        super.onRequestPermissionsResult(i, strArr, iArr);
    }

    @Override // android.app.Activity
    public void onResume() {
        this.mFragments.noteStateNotSaved();
        super.onResume();
        this.mResumed = true;
        this.mFragments.mHost.mFragmentManager.execPendingActions(true);
    }

    @Override // android.app.Activity
    public void onStart() {
        this.mFragments.noteStateNotSaved();
        super.onStart();
        this.mStopped = false;
        if (!this.mCreated) {
            this.mCreated = true;
            FragmentManagerImpl fragmentManagerImpl = this.mFragments.mHost.mFragmentManager;
            fragmentManagerImpl.mStateSaved = false;
            fragmentManagerImpl.mStopped = false;
            fragmentManagerImpl.mNonConfig.mIsStateSaved = false;
            fragmentManagerImpl.dispatchStateChange(4);
        }
        this.mFragments.mHost.mFragmentManager.execPendingActions(true);
        this.mFragmentLifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_START);
        FragmentManagerImpl fragmentManagerImpl2 = this.mFragments.mHost.mFragmentManager;
        fragmentManagerImpl2.mStateSaved = false;
        fragmentManagerImpl2.mStopped = false;
        fragmentManagerImpl2.mNonConfig.mIsStateSaved = false;
        fragmentManagerImpl2.dispatchStateChange(5);
    }

    @Override // android.app.Activity
    public final void onStateNotSaved() {
        this.mFragments.noteStateNotSaved();
    }

    public FragmentActivity() {
        this.mSavedStateRegistryController.mRegistry.registerSavedStateProvider("android:support:lifecycle", new SavedStateRegistry.SavedStateProvider() { // from class: androidx.fragment.app.FragmentActivity$$ExternalSyntheticLambda1
            @Override // androidx.savedstate.SavedStateRegistry.SavedStateProvider
            public final Bundle saveState() {
                FragmentActivity fragmentActivity = FragmentActivity.this;
                do {
                } while (FragmentActivity.markState(fragmentActivity.getSupportFragmentManager()));
                fragmentActivity.mFragmentLifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_STOP);
                return new Bundle();
            }
        });
        addOnContextAvailableListener(new OnContextAvailableListener() { // from class: androidx.fragment.app.FragmentActivity$$ExternalSyntheticLambda0
            @Override // androidx.activity.contextaware.OnContextAvailableListener
            public final void onContextAvailable() {
                FragmentHostCallback<?> fragmentHostCallback = FragmentActivity.this.mFragments.mHost;
                fragmentHostCallback.mFragmentManager.attachController(fragmentHostCallback, fragmentHostCallback, null);
            }
        });
    }

    @Override // android.app.Activity
    public final void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        super.dump(str, fileDescriptor, printWriter, strArr);
        printWriter.print(str);
        printWriter.print("Local FragmentActivity ");
        printWriter.print(Integer.toHexString(System.identityHashCode(this)));
        printWriter.println(" State:");
        String str2 = str + "  ";
        printWriter.print(str2);
        printWriter.print("mCreated=");
        printWriter.print(this.mCreated);
        printWriter.print(" mResumed=");
        printWriter.print(this.mResumed);
        printWriter.print(" mStopped=");
        printWriter.print(this.mStopped);
        if (getApplication() != null) {
            LoaderManagerImpl$LoaderViewModel loaderManagerImpl$LoaderViewModel = (LoaderManagerImpl$LoaderViewModel) new ViewModelProvider(getViewModelStore(), LoaderManagerImpl$LoaderViewModel.FACTORY).get(LoaderManagerImpl$LoaderViewModel.class);
            if (loaderManagerImpl$LoaderViewModel.mLoaders.mSize > 0) {
                printWriter.print(str2);
                printWriter.println("Loaders:");
                SparseArrayCompat<LoaderManagerImpl$LoaderInfo> sparseArrayCompat = loaderManagerImpl$LoaderViewModel.mLoaders;
                if (sparseArrayCompat.mSize > 0) {
                    printWriter.print(str2);
                    printWriter.print("  #");
                    printWriter.print(loaderManagerImpl$LoaderViewModel.mLoaders.mKeys[0]);
                    printWriter.print(": ");
                    ((LoaderManagerImpl$LoaderInfo) sparseArrayCompat.mValues[0]).toString();
                    throw null;
                }
            }
        }
        this.mFragments.mHost.mFragmentManager.dump(str, fileDescriptor, printWriter, strArr);
    }

    @Override // androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mFragmentLifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_CREATE);
        FragmentManagerImpl fragmentManagerImpl = this.mFragments.mHost.mFragmentManager;
        fragmentManagerImpl.mStateSaved = false;
        fragmentManagerImpl.mStopped = false;
        fragmentManagerImpl.mNonConfig.mIsStateSaved = false;
        fragmentManagerImpl.dispatchStateChange(1);
    }

    @Override // android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        this.mFragments.mHost.mFragmentManager.dispatchDestroy();
        this.mFragmentLifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_DESTROY);
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks
    public final void onLowMemory() {
        super.onLowMemory();
        this.mFragments.mHost.mFragmentManager.dispatchLowMemory();
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public boolean onMenuItemSelected(int i, MenuItem menuItem) {
        if (super.onMenuItemSelected(i, menuItem)) {
            return true;
        }
        if (i == 0) {
            return this.mFragments.mHost.mFragmentManager.dispatchOptionsItemSelected();
        }
        if (i != 6) {
            return false;
        }
        return this.mFragments.mHost.mFragmentManager.dispatchContextItemSelected();
    }

    @Override // android.app.Activity
    public void onPause() {
        super.onPause();
        this.mResumed = false;
        this.mFragments.mHost.mFragmentManager.dispatchStateChange(5);
        this.mFragmentLifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_PAUSE);
    }

    @Override // android.app.Activity
    public void onPostResume() {
        super.onPostResume();
        this.mFragmentLifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_RESUME);
        FragmentManagerImpl fragmentManagerImpl = this.mFragments.mHost.mFragmentManager;
        fragmentManagerImpl.mStateSaved = false;
        fragmentManagerImpl.mStopped = false;
        fragmentManagerImpl.mNonConfig.mIsStateSaved = false;
        fragmentManagerImpl.dispatchStateChange(7);
    }

    @Override // android.app.Activity
    public void onStop() {
        super.onStop();
        this.mStopped = true;
        do {
        } while (markState(getSupportFragmentManager()));
        FragmentManagerImpl fragmentManagerImpl = this.mFragments.mHost.mFragmentManager;
        fragmentManagerImpl.mStopped = true;
        fragmentManagerImpl.mNonConfig.mIsStateSaved = true;
        fragmentManagerImpl.dispatchStateChange(4);
        this.mFragmentLifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_STOP);
    }

    @Override // android.app.Activity, android.view.LayoutInflater.Factory
    public final View onCreateView(String str, Context context, AttributeSet attributeSet) {
        View onCreateView = this.mFragments.mHost.mFragmentManager.mLayoutInflaterFactory.onCreateView(null, str, context, attributeSet);
        return onCreateView == null ? super.onCreateView(str, context, attributeSet) : onCreateView;
    }

    @Deprecated
    public void supportInvalidateOptionsMenu() {
        invalidateOptionsMenu();
    }
}
