package androidx.activity;

import android.annotation.SuppressLint;
import android.app.Application;
import android.content.Intent;
import android.content.IntentSender;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcelable;
import android.os.Trace;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.text.TextUtils;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import androidx.activity.ComponentActivity;
import androidx.activity.contextaware.ContextAwareHelper;
import androidx.activity.contextaware.OnContextAvailableListener;
import androidx.activity.result.ActivityResultCallback;
import androidx.activity.result.ActivityResultRegistry;
import androidx.activity.result.ActivityResultRegistryOwner;
import androidx.activity.result.IntentSenderRequest;
import androidx.activity.result.contract.ActivityResultContract;
import androidx.core.app.ActivityCompat;
import androidx.core.view.MenuHostHelper;
import androidx.core.view.MenuProvider;
import androidx.lifecycle.HasDefaultViewModelProviderFactory;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleEventObserver;
import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.LifecycleRegistry;
import androidx.lifecycle.ReportFragment;
import androidx.lifecycle.SavedStateViewModelFactory;
import androidx.lifecycle.ViewModelProvider;
import androidx.lifecycle.ViewModelStore;
import androidx.lifecycle.ViewModelStoreOwner;
import androidx.savedstate.SavedStateRegistry;
import androidx.savedstate.SavedStateRegistryController;
import androidx.savedstate.SavedStateRegistryOwner;
import com.android.systemui.shared.R;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Random;
import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes.dex */
public class ComponentActivity extends androidx.core.app.ComponentActivity implements ViewModelStoreOwner, HasDefaultViewModelProviderFactory, SavedStateRegistryOwner, OnBackPressedDispatcherOwner, ActivityResultRegistryOwner {
    public SavedStateViewModelFactory mDefaultFactory;
    public final LifecycleRegistry mLifecycleRegistry;
    public final SavedStateRegistryController mSavedStateRegistryController;
    public ViewModelStore mViewModelStore;
    public final ContextAwareHelper mContextAwareHelper = new ContextAwareHelper();
    public final MenuHostHelper mMenuHostHelper = new MenuHostHelper();
    public final OnBackPressedDispatcher mOnBackPressedDispatcher = new OnBackPressedDispatcher(new Runnable() { // from class: androidx.activity.ComponentActivity.1
        @Override // java.lang.Runnable
        public final void run() {
            try {
                ComponentActivity.super.onBackPressed();
            } catch (IllegalStateException e) {
                if (!TextUtils.equals(e.getMessage(), "Can not perform this action after onSaveInstanceState")) {
                    throw e;
                }
            }
        }
    });
    public final AnonymousClass2 mActivityResultRegistry = new ActivityResultRegistry() { // from class: androidx.activity.ComponentActivity.2
        @Override // androidx.activity.result.ActivityResultRegistry
        public final void onLaunch(final int i, ActivityResultContract activityResultContract, Parcelable parcelable) {
            ComponentActivity componentActivity = ComponentActivity.this;
            final ActivityResultContract.SynchronousResult synchronousResult = activityResultContract.getSynchronousResult(componentActivity, parcelable);
            if (synchronousResult != null) {
                new Handler(Looper.getMainLooper()).post(new Runnable() { // from class: androidx.activity.ComponentActivity.2.1
                    /* JADX WARN: Multi-variable type inference failed */
                    @Override // java.lang.Runnable
                    public final void run() {
                        ActivityResultCallback<O> activityResultCallback;
                        AnonymousClass2 r0 = AnonymousClass2.this;
                        int i2 = i;
                        T t = synchronousResult.mValue;
                        String str = (String) r0.mRcToKey.get(Integer.valueOf(i2));
                        if (str != null) {
                            r0.mLaunchedKeys.remove(str);
                            ActivityResultRegistry.CallbackAndContract callbackAndContract = (ActivityResultRegistry.CallbackAndContract) r0.mKeyToCallback.get(str);
                            if (callbackAndContract == null || (activityResultCallback = callbackAndContract.mCallback) == 0) {
                                r0.mPendingResults.remove(str);
                                r0.mParsedPendingResults.put(str, t);
                                return;
                            }
                            activityResultCallback.onActivityResult(t);
                        }
                    }
                });
                return;
            }
            Intent createIntent = activityResultContract.createIntent(parcelable);
            Bundle bundle = null;
            if (createIntent.getExtras() != null && createIntent.getExtras().getClassLoader() == null) {
                createIntent.setExtrasClassLoader(componentActivity.getClassLoader());
            }
            if (createIntent.hasExtra("androidx.activity.result.contract.extra.ACTIVITY_OPTIONS_BUNDLE")) {
                bundle = createIntent.getBundleExtra("androidx.activity.result.contract.extra.ACTIVITY_OPTIONS_BUNDLE");
                createIntent.removeExtra("androidx.activity.result.contract.extra.ACTIVITY_OPTIONS_BUNDLE");
            }
            Bundle bundle2 = bundle;
            if ("androidx.activity.result.contract.action.REQUEST_PERMISSIONS".equals(createIntent.getAction())) {
                String[] stringArrayExtra = createIntent.getStringArrayExtra("androidx.activity.result.contract.extra.PERMISSIONS");
                if (stringArrayExtra == null) {
                    stringArrayExtra = new String[0];
                }
                int i2 = ActivityCompat.$r8$clinit;
                for (String str : stringArrayExtra) {
                    if (TextUtils.isEmpty(str)) {
                        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Permission request for permissions ");
                        m.append(Arrays.toString(stringArrayExtra));
                        m.append(" must not contain null or empty values");
                        throw new IllegalArgumentException(m.toString());
                    }
                }
                if (componentActivity instanceof ActivityCompat.RequestPermissionsRequestCodeValidator) {
                    ((ActivityCompat.RequestPermissionsRequestCodeValidator) componentActivity).validateRequestPermissionsRequestCode();
                }
                componentActivity.requestPermissions(stringArrayExtra, i);
            } else if ("androidx.activity.result.contract.action.INTENT_SENDER_REQUEST".equals(createIntent.getAction())) {
                IntentSenderRequest intentSenderRequest = (IntentSenderRequest) createIntent.getParcelableExtra("androidx.activity.result.contract.extra.INTENT_SENDER_REQUEST");
                try {
                    IntentSender intentSender = intentSenderRequest.mIntentSender;
                    Intent intent = intentSenderRequest.mFillInIntent;
                    int i3 = intentSenderRequest.mFlagsMask;
                    int i4 = intentSenderRequest.mFlagsValues;
                    int i5 = ActivityCompat.$r8$clinit;
                    componentActivity.startIntentSenderForResult(intentSender, i, intent, i3, i4, 0, bundle2);
                } catch (IntentSender.SendIntentException e) {
                    new Handler(Looper.getMainLooper()).post(new Runnable() { // from class: androidx.activity.ComponentActivity.2.2
                        @Override // java.lang.Runnable
                        public final void run() {
                            dispatchResult(i, 0, new Intent().setAction("androidx.activity.result.contract.action.INTENT_SENDER_REQUEST").putExtra("androidx.activity.result.contract.extra.SEND_INTENT_EXCEPTION", e));
                        }
                    });
                }
            } else {
                int i6 = ActivityCompat.$r8$clinit;
                componentActivity.startActivityForResult(createIntent, i, bundle2);
            }
        }
    };

    /* loaded from: classes.dex */
    public static final class NonConfigurationInstances {
        public ViewModelStore viewModelStore;
    }

    @Override // android.app.Activity
    public void setContentView(int i) {
        initViewTreeOwners();
        super.setContentView(i);
    }

    @Override // android.app.Activity
    @Deprecated
    public final void startActivityForResult(@SuppressLint({"UnknownNullness"}) Intent intent, int i) {
        super.startActivityForResult(intent, i);
    }

    @Override // android.app.Activity
    @Deprecated
    public final void startIntentSenderForResult(@SuppressLint({"UnknownNullness"}) IntentSender intentSender, int i, Intent intent, int i2, int i3, int i4) throws IntentSender.SendIntentException {
        super.startIntentSenderForResult(intentSender, i, intent, i2, i3, i4);
    }

    public final void addOnContextAvailableListener(OnContextAvailableListener onContextAvailableListener) {
        ContextAwareHelper contextAwareHelper = this.mContextAwareHelper;
        if (contextAwareHelper.mContext != null) {
            onContextAvailableListener.onContextAvailable();
        }
        contextAwareHelper.mListeners.add(onContextAvailableListener);
    }

    @Override // androidx.savedstate.SavedStateRegistryOwner
    public final SavedStateRegistry getSavedStateRegistry() {
        return this.mSavedStateRegistryController.mRegistry;
    }

    @Override // android.app.Activity
    @Deprecated
    public void onActivityResult(int i, int i2, Intent intent) {
        if (!dispatchResult(i, i2, intent)) {
            super.onActivityResult(i, i2, intent);
        }
    }

    @Override // android.app.Activity
    public void onBackPressed() {
        this.mOnBackPressedDispatcher.onBackPressed();
    }

    @Override // androidx.core.app.ComponentActivity, android.app.Activity
    public void onCreate(Bundle bundle) {
        this.mSavedStateRegistryController.performRestore(bundle);
        ContextAwareHelper contextAwareHelper = this.mContextAwareHelper;
        contextAwareHelper.mContext = this;
        Iterator it = contextAwareHelper.mListeners.iterator();
        while (it.hasNext()) {
            ((OnContextAvailableListener) it.next()).onContextAvailable();
        }
        super.onCreate(bundle);
        ReportFragment.injectIfNeededIn(this);
    }

    @Override // android.app.Activity
    @Deprecated
    public void onRequestPermissionsResult(int i, String[] strArr, int[] iArr) {
        if (!dispatchResult(i, -1, new Intent().putExtra("androidx.activity.result.contract.extra.PERMISSIONS", strArr).putExtra("androidx.activity.result.contract.extra.PERMISSION_GRANT_RESULTS", iArr))) {
            super.onRequestPermissionsResult(i, strArr, iArr);
        }
    }

    @Override // android.app.Activity
    public final Object onRetainNonConfigurationInstance() {
        NonConfigurationInstances nonConfigurationInstances;
        ViewModelStore viewModelStore = this.mViewModelStore;
        if (viewModelStore == null && (nonConfigurationInstances = (NonConfigurationInstances) getLastNonConfigurationInstance()) != null) {
            viewModelStore = nonConfigurationInstances.viewModelStore;
        }
        if (viewModelStore == null) {
            return null;
        }
        NonConfigurationInstances nonConfigurationInstances2 = new NonConfigurationInstances();
        nonConfigurationInstances2.viewModelStore = viewModelStore;
        return nonConfigurationInstances2;
    }

    @Override // androidx.core.app.ComponentActivity, android.app.Activity
    public final void onSaveInstanceState(Bundle bundle) {
        LifecycleRegistry lifecycleRegistry = this.mLifecycleRegistry;
        if (lifecycleRegistry instanceof LifecycleRegistry) {
            Lifecycle.State state = Lifecycle.State.CREATED;
            lifecycleRegistry.enforceMainThreadIfNeeded("setCurrentState");
            lifecycleRegistry.moveToState(state);
        }
        super.onSaveInstanceState(bundle);
        this.mSavedStateRegistryController.performSave(bundle);
    }

    @Override // android.app.Activity
    @Deprecated
    public final void startActivityForResult(@SuppressLint({"UnknownNullness"}) Intent intent, int i, Bundle bundle) {
        super.startActivityForResult(intent, i, bundle);
    }

    @Override // android.app.Activity
    @Deprecated
    public final void startIntentSenderForResult(@SuppressLint({"UnknownNullness"}) IntentSender intentSender, int i, Intent intent, int i2, int i3, int i4, Bundle bundle) throws IntentSender.SendIntentException {
        super.startIntentSenderForResult(intentSender, i, intent, i2, i3, i4, bundle);
    }

    /* JADX WARN: Type inference failed for: r2v2, types: [androidx.activity.ComponentActivity$2] */
    /* JADX WARN: Type inference failed for: r3v0, types: [androidx.activity.ComponentActivity$1] */
    public ComponentActivity() {
        LifecycleRegistry lifecycleRegistry = new LifecycleRegistry(this, true);
        this.mLifecycleRegistry = lifecycleRegistry;
        SavedStateRegistryController savedStateRegistryController = new SavedStateRegistryController(this);
        this.mSavedStateRegistryController = savedStateRegistryController;
        new AtomicInteger();
        lifecycleRegistry.addObserver(new LifecycleEventObserver() { // from class: androidx.activity.ComponentActivity.3
            @Override // androidx.lifecycle.LifecycleEventObserver
            public final void onStateChanged(LifecycleOwner lifecycleOwner, Lifecycle.Event event) {
                View view;
                if (event == Lifecycle.Event.ON_STOP) {
                    Window window = ComponentActivity.this.getWindow();
                    if (window != null) {
                        view = window.peekDecorView();
                    } else {
                        view = null;
                    }
                    if (view != null) {
                        view.cancelPendingInputEvents();
                    }
                }
            }
        });
        lifecycleRegistry.addObserver(new LifecycleEventObserver() { // from class: androidx.activity.ComponentActivity.4
            @Override // androidx.lifecycle.LifecycleEventObserver
            public final void onStateChanged(LifecycleOwner lifecycleOwner, Lifecycle.Event event) {
                if (event == Lifecycle.Event.ON_DESTROY) {
                    ComponentActivity.this.mContextAwareHelper.mContext = null;
                    if (!ComponentActivity.this.isChangingConfigurations()) {
                        ComponentActivity.this.getViewModelStore().clear();
                    }
                }
            }
        });
        lifecycleRegistry.addObserver(new LifecycleEventObserver() { // from class: androidx.activity.ComponentActivity.5
            @Override // androidx.lifecycle.LifecycleEventObserver
            public final void onStateChanged(LifecycleOwner lifecycleOwner, Lifecycle.Event event) {
                ComponentActivity componentActivity = ComponentActivity.this;
                if (componentActivity.mViewModelStore == null) {
                    NonConfigurationInstances nonConfigurationInstances = (NonConfigurationInstances) componentActivity.getLastNonConfigurationInstance();
                    if (nonConfigurationInstances != null) {
                        componentActivity.mViewModelStore = nonConfigurationInstances.viewModelStore;
                    }
                    if (componentActivity.mViewModelStore == null) {
                        componentActivity.mViewModelStore = new ViewModelStore();
                    }
                }
                ComponentActivity.this.mLifecycleRegistry.removeObserver(this);
            }
        });
        savedStateRegistryController.mRegistry.registerSavedStateProvider("android:support:activity-result", new SavedStateRegistry.SavedStateProvider() { // from class: androidx.activity.ComponentActivity$$ExternalSyntheticLambda1
            @Override // androidx.savedstate.SavedStateRegistry.SavedStateProvider
            public final Bundle saveState() {
                ComponentActivity componentActivity = ComponentActivity.this;
                componentActivity.getClass();
                Bundle bundle = new Bundle();
                ComponentActivity.AnonymousClass2 r3 = componentActivity.mActivityResultRegistry;
                r3.getClass();
                bundle.putIntegerArrayList("KEY_COMPONENT_ACTIVITY_REGISTERED_RCS", new ArrayList<>(r3.mKeyToRc.values()));
                bundle.putStringArrayList("KEY_COMPONENT_ACTIVITY_REGISTERED_KEYS", new ArrayList<>(r3.mKeyToRc.keySet()));
                bundle.putStringArrayList("KEY_COMPONENT_ACTIVITY_LAUNCHED_KEYS", new ArrayList<>(r3.mLaunchedKeys));
                bundle.putBundle("KEY_COMPONENT_ACTIVITY_PENDING_RESULT", (Bundle) r3.mPendingResults.clone());
                bundle.putSerializable("KEY_COMPONENT_ACTIVITY_RANDOM_OBJECT", r3.mRandom);
                return bundle;
            }
        });
        addOnContextAvailableListener(new OnContextAvailableListener() { // from class: androidx.activity.ComponentActivity$$ExternalSyntheticLambda0
            @Override // androidx.activity.contextaware.OnContextAvailableListener
            public final void onContextAvailable() {
                ComponentActivity componentActivity = ComponentActivity.this;
                Bundle consumeRestoredStateForKey = componentActivity.mSavedStateRegistryController.mRegistry.consumeRestoredStateForKey("android:support:activity-result");
                if (consumeRestoredStateForKey != null) {
                    ComponentActivity.AnonymousClass2 r7 = componentActivity.mActivityResultRegistry;
                    r7.getClass();
                    ArrayList<Integer> integerArrayList = consumeRestoredStateForKey.getIntegerArrayList("KEY_COMPONENT_ACTIVITY_REGISTERED_RCS");
                    ArrayList<String> stringArrayList = consumeRestoredStateForKey.getStringArrayList("KEY_COMPONENT_ACTIVITY_REGISTERED_KEYS");
                    if (!(stringArrayList == null || integerArrayList == null)) {
                        r7.mLaunchedKeys = consumeRestoredStateForKey.getStringArrayList("KEY_COMPONENT_ACTIVITY_LAUNCHED_KEYS");
                        r7.mRandom = (Random) consumeRestoredStateForKey.getSerializable("KEY_COMPONENT_ACTIVITY_RANDOM_OBJECT");
                        r7.mPendingResults.putAll(consumeRestoredStateForKey.getBundle("KEY_COMPONENT_ACTIVITY_PENDING_RESULT"));
                        for (int i = 0; i < stringArrayList.size(); i++) {
                            String str = stringArrayList.get(i);
                            if (r7.mKeyToRc.containsKey(str)) {
                                Integer num = (Integer) r7.mKeyToRc.remove(str);
                                if (!r7.mPendingResults.containsKey(str)) {
                                    r7.mRcToKey.remove(num);
                                }
                            }
                            int intValue = integerArrayList.get(i).intValue();
                            String str2 = stringArrayList.get(i);
                            r7.mRcToKey.put(Integer.valueOf(intValue), str2);
                            r7.mKeyToRc.put(str2, Integer.valueOf(intValue));
                        }
                    }
                }
            }
        });
    }

    @Override // android.app.Activity
    public void addContentView(@SuppressLint({"UnknownNullness", "MissingNullability"}) View view, @SuppressLint({"UnknownNullness", "MissingNullability"}) ViewGroup.LayoutParams layoutParams) {
        initViewTreeOwners();
        super.addContentView(view, layoutParams);
    }

    @Override // androidx.lifecycle.HasDefaultViewModelProviderFactory
    public final ViewModelProvider.Factory getDefaultViewModelProviderFactory() {
        Bundle bundle;
        if (getApplication() != null) {
            if (this.mDefaultFactory == null) {
                Application application = getApplication();
                if (getIntent() != null) {
                    bundle = getIntent().getExtras();
                } else {
                    bundle = null;
                }
                this.mDefaultFactory = new SavedStateViewModelFactory(application, this, bundle);
            }
            return this.mDefaultFactory;
        }
        throw new IllegalStateException("Your activity is not yet attached to the Application instance. You can't request ViewModel before onCreate call.");
    }

    @Override // androidx.lifecycle.ViewModelStoreOwner
    public final ViewModelStore getViewModelStore() {
        if (getApplication() != null) {
            if (this.mViewModelStore == null) {
                NonConfigurationInstances nonConfigurationInstances = (NonConfigurationInstances) getLastNonConfigurationInstance();
                if (nonConfigurationInstances != null) {
                    this.mViewModelStore = nonConfigurationInstances.viewModelStore;
                }
                if (this.mViewModelStore == null) {
                    this.mViewModelStore = new ViewModelStore();
                }
            }
            return this.mViewModelStore;
        }
        throw new IllegalStateException("Your activity is not yet attached to the Application instance. You can't request ViewModel before onCreate call.");
    }

    public final void initViewTreeOwners() {
        getWindow().getDecorView().setTag(R.id.view_tree_lifecycle_owner, this);
        getWindow().getDecorView().setTag(R.id.view_tree_view_model_store_owner, this);
        getWindow().getDecorView().setTag(R.id.view_tree_saved_state_registry_owner, this);
    }

    @Override // android.app.Activity
    public final boolean onCreateOptionsMenu(Menu menu) {
        super.onCreateOptionsMenu(menu);
        MenuHostHelper menuHostHelper = this.mMenuHostHelper;
        getMenuInflater();
        Iterator<MenuProvider> it = menuHostHelper.mMenuProviders.iterator();
        while (it.hasNext()) {
            it.next().onCreateMenu();
        }
        return true;
    }

    @Override // android.app.Activity
    public final boolean onOptionsItemSelected(MenuItem menuItem) {
        if (super.onOptionsItemSelected(menuItem)) {
            return true;
        }
        Iterator<MenuProvider> it = this.mMenuHostHelper.mMenuProviders.iterator();
        while (it.hasNext()) {
            if (it.next().onMenuItemSelected()) {
                return true;
            }
        }
        return false;
    }

    @Override // android.app.Activity
    public final void reportFullyDrawn() {
        try {
            if (Trace.isEnabled()) {
                Trace.beginSection("reportFullyDrawn() for ComponentActivity");
            }
            super.reportFullyDrawn();
            Trace.endSection();
        } catch (Throwable th) {
            Trace.endSection();
            throw th;
        }
    }

    @Override // android.app.Activity
    public void setContentView(@SuppressLint({"UnknownNullness", "MissingNullability"}) View view) {
        initViewTreeOwners();
        super.setContentView(view);
    }

    @Override // android.app.Activity
    public void setContentView(@SuppressLint({"UnknownNullness", "MissingNullability"}) View view, @SuppressLint({"UnknownNullness", "MissingNullability"}) ViewGroup.LayoutParams layoutParams) {
        initViewTreeOwners();
        super.setContentView(view, layoutParams);
    }

    @Override // androidx.activity.result.ActivityResultRegistryOwner
    public final ActivityResultRegistry getActivityResultRegistry() {
        return this.mActivityResultRegistry;
    }

    @Override // androidx.core.app.ComponentActivity, androidx.lifecycle.LifecycleOwner
    public final LifecycleRegistry getLifecycle() {
        return this.mLifecycleRegistry;
    }

    @Override // androidx.activity.OnBackPressedDispatcherOwner
    public final OnBackPressedDispatcher getOnBackPressedDispatcher() {
        return this.mOnBackPressedDispatcher;
    }
}
