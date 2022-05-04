package androidx.fragment.app;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.Application;
import android.content.ComponentCallbacks;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import android.util.SparseArray;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.ActivityResultRegistry;
import androidx.appcompat.view.SupportMenuInflater$$ExternalSyntheticOutline0;
import androidx.arch.core.util.Function;
import androidx.collection.SparseArrayCompat;
import androidx.core.content.ContextCompat;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.strictmode.FragmentStrictMode;
import androidx.lifecycle.HasDefaultViewModelProviderFactory;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.LifecycleRegistry;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.SavedStateViewModelFactory;
import androidx.lifecycle.ViewModelProvider;
import androidx.lifecycle.ViewModelStore;
import androidx.lifecycle.ViewModelStoreOwner;
import androidx.loader.app.LoaderManagerImpl$LoaderInfo;
import androidx.loader.app.LoaderManagerImpl$LoaderViewModel;
import androidx.savedstate.SavedStateRegistry;
import androidx.savedstate.SavedStateRegistryController;
import androidx.savedstate.SavedStateRegistryOwner;
import com.android.systemui.shared.R;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes.dex */
public class Fragment implements ComponentCallbacks, View.OnCreateContextMenuListener, LifecycleOwner, ViewModelStoreOwner, HasDefaultViewModelProviderFactory, SavedStateRegistryOwner {
    public static final Object USE_DEFAULT_TRANSITION = new Object();
    public boolean mAdded;
    public AnimationInfo mAnimationInfo;
    public Bundle mArguments;
    public int mBackStackNesting;
    public boolean mCalled;
    public ViewGroup mContainer;
    public int mContainerId;
    public boolean mDeferStart;
    public boolean mDetached;
    public int mFragmentId;
    public FragmentManager mFragmentManager;
    public boolean mFromLayout;
    public boolean mHidden;
    public boolean mHiddenChanged;
    public FragmentHostCallback<?> mHost;
    public boolean mInLayout;
    public boolean mIsCreated;
    public Fragment mParentFragment;
    public boolean mPerformedCreateView;
    public String mPreviousWho;
    public boolean mRemoving;
    public boolean mRestored;
    public boolean mRetainInstance;
    public boolean mRetainInstanceChangedWhileDetached;
    public Bundle mSavedFragmentState;
    public Bundle mSavedViewRegistryState;
    public SparseArray<Parcelable> mSavedViewState;
    public String mTag;
    public Fragment mTarget;
    public int mTargetRequestCode;
    public View mView;
    public FragmentViewLifecycleOwner mViewLifecycleOwner;
    public int mState = -1;
    public String mWho = UUID.randomUUID().toString();
    public String mTargetWho = null;
    public Boolean mIsPrimaryNavigationFragment = null;
    public FragmentManagerImpl mChildFragmentManager = new FragmentManagerImpl();
    public boolean mMenuVisible = true;
    public boolean mUserVisibleHint = true;
    public Lifecycle.State mMaxState = Lifecycle.State.RESUMED;
    public MutableLiveData<LifecycleOwner> mViewLifecycleOwnerLiveData = new MutableLiveData<>();
    public final AtomicInteger mNextLocalRequestCode = new AtomicInteger();
    public final ArrayList<OnPreAttachedListener> mOnPreAttachedListeners = new ArrayList<>();
    public LifecycleRegistry mLifecycleRegistry = new LifecycleRegistry(this, true);
    public SavedStateRegistryController mSavedStateRegistryController = new SavedStateRegistryController(this);
    public SavedStateViewModelFactory mDefaultFactory = null;

    /* renamed from: androidx.fragment.app.Fragment$4  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass4 extends FragmentContainer {
        public AnonymousClass4() {
        }

        @Override // androidx.fragment.app.FragmentContainer
        public final View onFindViewById(int i) {
            View view = Fragment.this.mView;
            if (view != null) {
                return view.findViewById(i);
            }
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Fragment ");
            m.append(Fragment.this);
            m.append(" does not have a view");
            throw new IllegalStateException(m.toString());
        }

        @Override // androidx.fragment.app.FragmentContainer
        public final boolean onHasView() {
            if (Fragment.this.mView != null) {
                return true;
            }
            return false;
        }
    }

    /* renamed from: androidx.fragment.app.Fragment$6  reason: invalid class name */
    /* loaded from: classes.dex */
    public final class AnonymousClass6 implements Function<Void, ActivityResultRegistry> {
        public AnonymousClass6() {
        }
    }

    /* renamed from: androidx.fragment.app.Fragment$9  reason: invalid class name */
    /* loaded from: classes.dex */
    public final class AnonymousClass9 extends ActivityResultLauncher<Object> {
        public final /* synthetic */ AtomicReference val$ref;

        public AnonymousClass9(AtomicReference atomicReference) {
            this.val$ref = atomicReference;
        }

        @Override // androidx.activity.result.ActivityResultLauncher
        public final void launch(Object obj) {
            ActivityResultLauncher activityResultLauncher = (ActivityResultLauncher) this.val$ref.get();
            if (activityResultLauncher != null) {
                activityResultLauncher.launch(obj);
                return;
            }
            throw new IllegalStateException("Operation cannot be started before fragment is in created state");
        }

        @Override // androidx.activity.result.ActivityResultLauncher
        public final void unregister() {
            ActivityResultLauncher activityResultLauncher = (ActivityResultLauncher) this.val$ref.getAndSet(null);
            if (activityResultLauncher != null) {
                activityResultLauncher.unregister();
            }
        }
    }

    @SuppressLint({"BanParcelableUsage, ParcelClassLoader"})
    /* loaded from: classes.dex */
    public static class SavedState implements Parcelable {
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.ClassLoaderCreator<SavedState>() { // from class: androidx.fragment.app.Fragment.SavedState.1
            @Override // android.os.Parcelable.Creator
            public final Object createFromParcel(Parcel parcel) {
                return new SavedState(parcel, null);
            }

            @Override // android.os.Parcelable.ClassLoaderCreator
            public final SavedState createFromParcel(Parcel parcel, ClassLoader classLoader) {
                return new SavedState(parcel, classLoader);
            }

            @Override // android.os.Parcelable.Creator
            public final Object[] newArray(int i) {
                return new SavedState[i];
            }
        };
        public final Bundle mState;

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i) {
            parcel.writeBundle(this.mState);
        }

        public SavedState(Parcel parcel, ClassLoader classLoader) {
            Bundle readBundle = parcel.readBundle();
            this.mState = readBundle;
            if (classLoader != null && readBundle != null) {
                readBundle.setClassLoader(classLoader);
            }
        }
    }

    @Deprecated
    public void onActivityResult(int i, int i2, Intent intent) {
        if (FragmentManager.isLoggingEnabled(2)) {
            Log.v("FragmentManager", "Fragment " + this + " received the following in onActivityResult(): requestCode: " + i + " resultCode: " + i2 + " data: " + intent);
        }
    }

    public void onAttach(Context context) {
        Activity activity;
        this.mCalled = true;
        FragmentHostCallback<?> fragmentHostCallback = this.mHost;
        if (fragmentHostCallback == null) {
            activity = null;
        } else {
            activity = fragmentHostCallback.mActivity;
        }
        if (activity != null) {
            this.mCalled = true;
        }
    }

    @Override // android.content.ComponentCallbacks
    public final void onConfigurationChanged(Configuration configuration) {
        this.mCalled = true;
    }

    public void onCreate(Bundle bundle) {
        boolean z;
        Parcelable parcelable;
        this.mCalled = true;
        if (!(bundle == null || (parcelable = bundle.getParcelable("android:support:fragments")) == null)) {
            this.mChildFragmentManager.restoreSaveStateInternal(parcelable);
            FragmentManagerImpl fragmentManagerImpl = this.mChildFragmentManager;
            fragmentManagerImpl.mStateSaved = false;
            fragmentManagerImpl.mStopped = false;
            fragmentManagerImpl.mNonConfig.mIsStateSaved = false;
            fragmentManagerImpl.dispatchStateChange(1);
        }
        FragmentManagerImpl fragmentManagerImpl2 = this.mChildFragmentManager;
        if (fragmentManagerImpl2.mCurState >= 1) {
            z = true;
        } else {
            z = false;
        }
        if (!z) {
            fragmentManagerImpl2.mStateSaved = false;
            fragmentManagerImpl2.mStopped = false;
            fragmentManagerImpl2.mNonConfig.mIsStateSaved = false;
            fragmentManagerImpl2.dispatchStateChange(1);
        }
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return null;
    }

    public void onDestroy() {
        this.mCalled = true;
    }

    public void onDestroyView() {
        this.mCalled = true;
    }

    public void onDetach() {
        this.mCalled = true;
    }

    @Override // android.content.ComponentCallbacks
    public final void onLowMemory() {
        this.mCalled = true;
    }

    public void onPause() {
        this.mCalled = true;
    }

    public void onResume() {
        this.mCalled = true;
    }

    public void onSaveInstanceState(Bundle bundle) {
    }

    public void onStart() {
        this.mCalled = true;
    }

    public void onStop() {
        this.mCalled = true;
    }

    public void onViewCreated(View view, Bundle bundle) {
    }

    public void onViewStateRestored(Bundle bundle) {
        this.mCalled = true;
    }

    /* loaded from: classes.dex */
    public static class AnimationInfo {
        public int mEnterAnim;
        public int mExitAnim;
        public boolean mIsPop;
        public int mNextTransition;
        public int mPopEnterAnim;
        public int mPopExitAnim;
        public Object mReenterTransition;
        public Object mReturnTransition;
        public Object mSharedElementReturnTransition;
        public ArrayList<String> mSharedElementSourceNames;
        public ArrayList<String> mSharedElementTargetNames;
        public float mPostOnViewCreatedAlpha = 1.0f;
        public View mFocusedView = null;

        public AnimationInfo() {
            Object obj = Fragment.USE_DEFAULT_TRANSITION;
            this.mReturnTransition = obj;
            this.mReenterTransition = obj;
            this.mSharedElementReturnTransition = obj;
        }
    }

    public FragmentContainer createFragmentContainer() {
        return new AnonymousClass4();
    }

    public final AnimationInfo ensureAnimationInfo() {
        if (this.mAnimationInfo == null) {
            this.mAnimationInfo = new AnimationInfo();
        }
        return this.mAnimationInfo;
    }

    public final FragmentActivity getActivity() {
        FragmentHostCallback<?> fragmentHostCallback = this.mHost;
        if (fragmentHostCallback == null) {
            return null;
        }
        return (FragmentActivity) fragmentHostCallback.mActivity;
    }

    public final FragmentManager getChildFragmentManager() {
        if (this.mHost != null) {
            return this.mChildFragmentManager;
        }
        throw new IllegalStateException("Fragment " + this + " has not been attached yet.");
    }

    public final Context getContext() {
        FragmentHostCallback<?> fragmentHostCallback = this.mHost;
        if (fragmentHostCallback == null) {
            return null;
        }
        return fragmentHostCallback.mContext;
    }

    @Override // androidx.lifecycle.HasDefaultViewModelProviderFactory
    public final ViewModelProvider.Factory getDefaultViewModelProviderFactory() {
        if (this.mFragmentManager != null) {
            if (this.mDefaultFactory == null) {
                Application application = null;
                Context applicationContext = requireContext().getApplicationContext();
                while (true) {
                    if (!(applicationContext instanceof ContextWrapper)) {
                        break;
                    } else if (applicationContext instanceof Application) {
                        application = (Application) applicationContext;
                        break;
                    } else {
                        applicationContext = ((ContextWrapper) applicationContext).getBaseContext();
                    }
                }
                if (application == null && FragmentManager.isLoggingEnabled(3)) {
                    StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Could not find Application instance from Context ");
                    m.append(requireContext().getApplicationContext());
                    m.append(", you will not be able to use AndroidViewModel with the default ViewModelProvider.Factory");
                    Log.d("FragmentManager", m.toString());
                }
                this.mDefaultFactory = new SavedStateViewModelFactory(application, this, this.mArguments);
            }
            return this.mDefaultFactory;
        }
        throw new IllegalStateException("Can't access ViewModels from detached fragment");
    }

    public final int getMinimumMaxLifecycleState() {
        Lifecycle.State state = this.mMaxState;
        if (state == Lifecycle.State.INITIALIZED || this.mParentFragment == null) {
            return state.ordinal();
        }
        return Math.min(state.ordinal(), this.mParentFragment.getMinimumMaxLifecycleState());
    }

    public final FragmentManager getParentFragmentManager() {
        FragmentManager fragmentManager = this.mFragmentManager;
        if (fragmentManager != null) {
            return fragmentManager;
        }
        throw new IllegalStateException("Fragment " + this + " not associated with a fragment manager.");
    }

    @Override // androidx.savedstate.SavedStateRegistryOwner
    public final SavedStateRegistry getSavedStateRegistry() {
        return this.mSavedStateRegistryController.mRegistry;
    }

    public final Fragment getTargetFragment(boolean z) {
        String str;
        if (z) {
            FragmentStrictMode.onGetTargetFragmentUsage(this);
        }
        Fragment fragment = this.mTarget;
        if (fragment != null) {
            return fragment;
        }
        FragmentManager fragmentManager = this.mFragmentManager;
        if (fragmentManager == null || (str = this.mTargetWho) == null) {
            return null;
        }
        return fragmentManager.findActiveFragment(str);
    }

    @Override // androidx.lifecycle.ViewModelStoreOwner
    public final ViewModelStore getViewModelStore() {
        if (this.mFragmentManager == null) {
            throw new IllegalStateException("Can't access ViewModels from detached fragment");
        } else if (getMinimumMaxLifecycleState() != 1) {
            FragmentManagerViewModel fragmentManagerViewModel = this.mFragmentManager.mNonConfig;
            ViewModelStore viewModelStore = fragmentManagerViewModel.mViewModelStores.get(this.mWho);
            if (viewModelStore != null) {
                return viewModelStore;
            }
            ViewModelStore viewModelStore2 = new ViewModelStore();
            fragmentManagerViewModel.mViewModelStores.put(this.mWho, viewModelStore2);
            return viewModelStore2;
        } else {
            throw new IllegalStateException("Calling getViewModelStore() before a Fragment reaches onCreate() when using setMaxLifecycle(INITIALIZED) is not supported");
        }
    }

    public LayoutInflater onGetLayoutInflater(Bundle bundle) {
        FragmentHostCallback<?> fragmentHostCallback = this.mHost;
        if (fragmentHostCallback != null) {
            LayoutInflater onGetLayoutInflater = fragmentHostCallback.onGetLayoutInflater();
            onGetLayoutInflater.setFactory2(this.mChildFragmentManager.mLayoutInflaterFactory);
            return onGetLayoutInflater;
        }
        throw new IllegalStateException("onGetLayoutInflater() cannot be executed until the Fragment is attached to the FragmentManager.");
    }

    public void performCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        this.mChildFragmentManager.noteStateNotSaved();
        boolean z = true;
        this.mPerformedCreateView = true;
        this.mViewLifecycleOwner = new FragmentViewLifecycleOwner(this, getViewModelStore());
        View onCreateView = onCreateView(layoutInflater, viewGroup, bundle);
        this.mView = onCreateView;
        if (onCreateView != null) {
            this.mViewLifecycleOwner.initialize();
            this.mView.setTag(R.id.view_tree_lifecycle_owner, this.mViewLifecycleOwner);
            this.mView.setTag(R.id.view_tree_view_model_store_owner, this.mViewLifecycleOwner);
            this.mView.setTag(R.id.view_tree_saved_state_registry_owner, this.mViewLifecycleOwner);
            this.mViewLifecycleOwnerLiveData.setValue(this.mViewLifecycleOwner);
            return;
        }
        if (this.mViewLifecycleOwner.mLifecycleRegistry == null) {
            z = false;
        }
        if (!z) {
            this.mViewLifecycleOwner = null;
            return;
        }
        throw new IllegalStateException("Called getViewLifecycleOwner() but onCreateView() returned null");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void performMultiWindowModeChanged(boolean z) {
        this.mChildFragmentManager.dispatchMultiWindowModeChanged(z);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void performPictureInPictureModeChanged(boolean z) {
        this.mChildFragmentManager.dispatchPictureInPictureModeChanged(z);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final boolean performPrepareOptionsMenu() {
        if (!this.mHidden) {
            return false | this.mChildFragmentManager.dispatchPrepareOptionsMenu();
        }
        return false;
    }

    public final View requireView() {
        View view = this.mView;
        if (view != null) {
            return view;
        }
        throw new IllegalStateException("Fragment " + this + " did not return a View from onCreateView() or this was called before onCreateView().");
    }

    public final void setAnimations(int i, int i2, int i3, int i4) {
        if (this.mAnimationInfo != null || i != 0 || i2 != 0 || i3 != 0 || i4 != 0) {
            ensureAnimationInfo().mEnterAnim = i;
            ensureAnimationInfo().mExitAnim = i2;
            ensureAnimationInfo().mPopEnterAnim = i3;
            ensureAnimationInfo().mPopExitAnim = i4;
        }
    }

    public final void setArguments(Bundle bundle) {
        boolean z;
        FragmentManager fragmentManager = this.mFragmentManager;
        if (fragmentManager != null) {
            if (fragmentManager.mStateSaved || fragmentManager.mStopped) {
                z = true;
            } else {
                z = false;
            }
            if (z) {
                throw new IllegalStateException("Fragment already added and state has been saved");
            }
        }
        this.mArguments = bundle;
    }

    @Deprecated
    public final void setTargetFragment(Fragment fragment) {
        FragmentManager fragmentManager;
        if (fragment != null) {
            FragmentStrictMode.onSetTargetFragmentUsage(this, fragment);
        }
        FragmentManager fragmentManager2 = this.mFragmentManager;
        if (fragment != null) {
            fragmentManager = fragment.mFragmentManager;
        } else {
            fragmentManager = null;
        }
        if (fragmentManager2 == null || fragmentManager == null || fragmentManager2 == fragmentManager) {
            for (Fragment fragment2 = fragment; fragment2 != null; fragment2 = fragment2.getTargetFragment(false)) {
                if (fragment2.equals(this)) {
                    throw new IllegalArgumentException("Setting " + fragment + " as the target of " + this + " would create a target cycle");
                }
            }
            if (fragment == null) {
                this.mTargetWho = null;
                this.mTarget = null;
            } else if (this.mFragmentManager == null || fragment.mFragmentManager == null) {
                this.mTargetWho = null;
                this.mTarget = fragment;
            } else {
                this.mTargetWho = fragment.mWho;
                this.mTarget = null;
            }
            this.mTargetRequestCode = 1;
            return;
        }
        throw new IllegalArgumentException("Fragment " + fragment + " must share the same FragmentManager to be set as a target fragment");
    }

    public final void startActivity(@SuppressLint({"UnknownNullness"}) Intent intent, Bundle bundle) {
        FragmentHostCallback<?> fragmentHostCallback = this.mHost;
        if (fragmentHostCallback != null) {
            Context context = fragmentHostCallback.mContext;
            Object obj = ContextCompat.sLock;
            context.startActivity(intent, bundle);
            return;
        }
        throw new IllegalStateException("Fragment " + this + " not attached to Activity");
    }

    @Deprecated
    public final void startActivityForResult(@SuppressLint({"UnknownNullness"}) Intent intent, int i) {
        if (this.mHost != null) {
            FragmentManager parentFragmentManager = getParentFragmentManager();
            if (parentFragmentManager.mStartActivityForResult != null) {
                parentFragmentManager.mLaunchedFragments.addLast(new FragmentManager.LaunchedFragmentInfo(this.mWho));
                parentFragmentManager.mStartActivityForResult.launch(intent);
                return;
            }
            parentFragmentManager.mHost.getClass();
            throw new IllegalStateException("Starting activity with a requestCode requires a FragmentActivity host");
        }
        throw new IllegalStateException("Fragment " + this + " not attached to Activity");
    }

    public String toString() {
        StringBuilder sb = new StringBuilder(128);
        sb.append(getClass().getSimpleName());
        sb.append("{");
        sb.append(Integer.toHexString(System.identityHashCode(this)));
        sb.append("}");
        sb.append(" (");
        sb.append(this.mWho);
        if (this.mFragmentId != 0) {
            sb.append(" id=0x");
            sb.append(Integer.toHexString(this.mFragmentId));
        }
        if (this.mTag != null) {
            sb.append(" tag=");
            sb.append(this.mTag);
        }
        sb.append(")");
        return sb.toString();
    }

    public final void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        boolean z;
        int i;
        int i2;
        int i3;
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        printWriter.print(str);
        printWriter.print("mFragmentId=#");
        printWriter.print(Integer.toHexString(this.mFragmentId));
        printWriter.print(" mContainerId=#");
        printWriter.print(Integer.toHexString(this.mContainerId));
        printWriter.print(" mTag=");
        printWriter.println(this.mTag);
        printWriter.print(str);
        printWriter.print("mState=");
        printWriter.print(this.mState);
        printWriter.print(" mWho=");
        printWriter.print(this.mWho);
        printWriter.print(" mBackStackNesting=");
        printWriter.println(this.mBackStackNesting);
        printWriter.print(str);
        printWriter.print("mAdded=");
        printWriter.print(this.mAdded);
        printWriter.print(" mRemoving=");
        printWriter.print(this.mRemoving);
        printWriter.print(" mFromLayout=");
        printWriter.print(this.mFromLayout);
        printWriter.print(" mInLayout=");
        printWriter.println(this.mInLayout);
        printWriter.print(str);
        printWriter.print("mHidden=");
        printWriter.print(this.mHidden);
        printWriter.print(" mDetached=");
        printWriter.print(this.mDetached);
        printWriter.print(" mMenuVisible=");
        printWriter.print(this.mMenuVisible);
        printWriter.print(" mHasMenu=");
        printWriter.println(false);
        printWriter.print(str);
        printWriter.print("mRetainInstance=");
        printWriter.print(this.mRetainInstance);
        printWriter.print(" mUserVisibleHint=");
        printWriter.println(this.mUserVisibleHint);
        if (this.mFragmentManager != null) {
            printWriter.print(str);
            printWriter.print("mFragmentManager=");
            printWriter.println(this.mFragmentManager);
        }
        if (this.mHost != null) {
            printWriter.print(str);
            printWriter.print("mHost=");
            printWriter.println(this.mHost);
        }
        if (this.mParentFragment != null) {
            printWriter.print(str);
            printWriter.print("mParentFragment=");
            printWriter.println(this.mParentFragment);
        }
        if (this.mArguments != null) {
            printWriter.print(str);
            printWriter.print("mArguments=");
            printWriter.println(this.mArguments);
        }
        if (this.mSavedFragmentState != null) {
            printWriter.print(str);
            printWriter.print("mSavedFragmentState=");
            printWriter.println(this.mSavedFragmentState);
        }
        if (this.mSavedViewState != null) {
            printWriter.print(str);
            printWriter.print("mSavedViewState=");
            printWriter.println(this.mSavedViewState);
        }
        if (this.mSavedViewRegistryState != null) {
            printWriter.print(str);
            printWriter.print("mSavedViewRegistryState=");
            printWriter.println(this.mSavedViewRegistryState);
        }
        Fragment targetFragment = getTargetFragment(false);
        if (targetFragment != null) {
            printWriter.print(str);
            printWriter.print("mTarget=");
            printWriter.print(targetFragment);
            printWriter.print(" mTargetRequestCode=");
            printWriter.println(this.mTargetRequestCode);
        }
        printWriter.print(str);
        printWriter.print("mPopDirection=");
        AnimationInfo animationInfo = this.mAnimationInfo;
        if (animationInfo == null) {
            z = false;
        } else {
            z = animationInfo.mIsPop;
        }
        printWriter.println(z);
        AnimationInfo animationInfo2 = this.mAnimationInfo;
        if (animationInfo2 == null) {
            i = 0;
        } else {
            i = animationInfo2.mEnterAnim;
        }
        if (i != 0) {
            printWriter.print(str);
            printWriter.print("getEnterAnim=");
            AnimationInfo animationInfo3 = this.mAnimationInfo;
            if (animationInfo3 == null) {
                i8 = 0;
            } else {
                i8 = animationInfo3.mEnterAnim;
            }
            printWriter.println(i8);
        }
        AnimationInfo animationInfo4 = this.mAnimationInfo;
        if (animationInfo4 == null) {
            i2 = 0;
        } else {
            i2 = animationInfo4.mExitAnim;
        }
        if (i2 != 0) {
            printWriter.print(str);
            printWriter.print("getExitAnim=");
            AnimationInfo animationInfo5 = this.mAnimationInfo;
            if (animationInfo5 == null) {
                i7 = 0;
            } else {
                i7 = animationInfo5.mExitAnim;
            }
            printWriter.println(i7);
        }
        AnimationInfo animationInfo6 = this.mAnimationInfo;
        if (animationInfo6 == null) {
            i3 = 0;
        } else {
            i3 = animationInfo6.mPopEnterAnim;
        }
        if (i3 != 0) {
            printWriter.print(str);
            printWriter.print("getPopEnterAnim=");
            AnimationInfo animationInfo7 = this.mAnimationInfo;
            if (animationInfo7 == null) {
                i6 = 0;
            } else {
                i6 = animationInfo7.mPopEnterAnim;
            }
            printWriter.println(i6);
        }
        AnimationInfo animationInfo8 = this.mAnimationInfo;
        if (animationInfo8 == null) {
            i4 = 0;
        } else {
            i4 = animationInfo8.mPopExitAnim;
        }
        if (i4 != 0) {
            printWriter.print(str);
            printWriter.print("getPopExitAnim=");
            AnimationInfo animationInfo9 = this.mAnimationInfo;
            if (animationInfo9 == null) {
                i5 = 0;
            } else {
                i5 = animationInfo9.mPopExitAnim;
            }
            printWriter.println(i5);
        }
        if (this.mContainer != null) {
            printWriter.print(str);
            printWriter.print("mContainer=");
            printWriter.println(this.mContainer);
        }
        if (this.mView != null) {
            printWriter.print(str);
            printWriter.print("mView=");
            printWriter.println(this.mView);
        }
        if (getContext() != null) {
            LoaderManagerImpl$LoaderViewModel loaderManagerImpl$LoaderViewModel = (LoaderManagerImpl$LoaderViewModel) new ViewModelProvider(getViewModelStore(), LoaderManagerImpl$LoaderViewModel.FACTORY).get(LoaderManagerImpl$LoaderViewModel.class);
            if (loaderManagerImpl$LoaderViewModel.mLoaders.mSize > 0) {
                printWriter.print(str);
                printWriter.println("Loaders:");
                SparseArrayCompat<LoaderManagerImpl$LoaderInfo> sparseArrayCompat = loaderManagerImpl$LoaderViewModel.mLoaders;
                if (sparseArrayCompat.mSize > 0) {
                    printWriter.print(str);
                    printWriter.print("  #");
                    printWriter.print(loaderManagerImpl$LoaderViewModel.mLoaders.mKeys[0]);
                    printWriter.print(": ");
                    ((LoaderManagerImpl$LoaderInfo) sparseArrayCompat.mValues[0]).toString();
                    throw null;
                }
            }
        }
        printWriter.print(str);
        printWriter.println("Child " + this.mChildFragmentManager + ":");
        this.mChildFragmentManager.dump(SupportMenuInflater$$ExternalSyntheticOutline0.m(str, "  "), fileDescriptor, printWriter, strArr);
    }

    public final boolean equals(Object obj) {
        return super.equals(obj);
    }

    public final Resources getResources() {
        return requireContext().getResources();
    }

    public final String getString(int i) {
        return getResources().getString(i);
    }

    public final int hashCode() {
        return super.hashCode();
    }

    @Override // android.view.View.OnCreateContextMenuListener
    public final void onCreateContextMenu(ContextMenu contextMenu, View view, ContextMenu.ContextMenuInfo contextMenuInfo) {
        requireActivity().onCreateContextMenu(contextMenu, view, contextMenuInfo);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void performLowMemory() {
        onLowMemory();
        this.mChildFragmentManager.dispatchLowMemory();
    }

    public final FragmentActivity requireActivity() {
        FragmentActivity activity = getActivity();
        if (activity != null) {
            return activity;
        }
        throw new IllegalStateException("Fragment " + this + " not attached to an activity.");
    }

    public final Context requireContext() {
        Context context = getContext();
        if (context != null) {
            return context;
        }
        throw new IllegalStateException("Fragment " + this + " not attached to a context.");
    }

    /* loaded from: classes.dex */
    public static class InstantiationException extends RuntimeException {
        public InstantiationException(String str, Exception exc) {
            super(str, exc);
        }
    }

    /* loaded from: classes.dex */
    public static abstract class OnPreAttachedListener {
        public OnPreAttachedListener() {
            throw null;
        }

        public abstract void onPreAttached();

        public OnPreAttachedListener(int i) {
        }
    }

    @Override // androidx.lifecycle.LifecycleOwner
    public final LifecycleRegistry getLifecycle() {
        return this.mLifecycleRegistry;
    }
}
