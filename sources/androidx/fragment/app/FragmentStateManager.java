package androidx.fragment.app;

import android.content.res.Resources;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import android.util.SparseArray;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.exifinterface.media.ExifInterface$$ExternalSyntheticOutline0;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.SpecialEffectsController;
import androidx.fragment.app.strictmode.FragmentStrictMode;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleEventObserver;
import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.LifecycleRegistry;
import androidx.lifecycle.ViewModelProvider;
import androidx.loader.app.LoaderManagerImpl$LoaderInfo;
import androidx.loader.app.LoaderManagerImpl$LoaderViewModel;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import java.util.Iterator;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public final class FragmentStateManager {
    public final FragmentLifecycleCallbacksDispatcher mDispatcher;
    public final Fragment mFragment;
    public final FragmentStore mFragmentStore;
    public boolean mMovingToState = false;
    public int mFragmentManagerState = -1;

    public FragmentStateManager(FragmentLifecycleCallbacksDispatcher fragmentLifecycleCallbacksDispatcher, FragmentStore fragmentStore, Fragment fragment) {
        this.mDispatcher = fragmentLifecycleCallbacksDispatcher;
        this.mFragmentStore = fragmentStore;
        this.mFragment = fragment;
    }

    public final void activityCreated() {
        if (FragmentManager.isLoggingEnabled(3)) {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("moveto ACTIVITY_CREATED: ");
            m.append(this.mFragment);
            Log.d("FragmentManager", m.toString());
        }
        Fragment fragment = this.mFragment;
        Bundle bundle = fragment.mSavedFragmentState;
        fragment.mChildFragmentManager.noteStateNotSaved();
        fragment.mState = 3;
        fragment.mCalled = true;
        if (FragmentManager.isLoggingEnabled(3)) {
            Log.d("FragmentManager", "moveto RESTORE_VIEW_STATE: " + fragment);
        }
        View view = fragment.mView;
        if (view != null) {
            Bundle bundle2 = fragment.mSavedFragmentState;
            SparseArray<Parcelable> sparseArray = fragment.mSavedViewState;
            if (sparseArray != null) {
                view.restoreHierarchyState(sparseArray);
                fragment.mSavedViewState = null;
            }
            if (fragment.mView != null) {
                FragmentViewLifecycleOwner fragmentViewLifecycleOwner = fragment.mViewLifecycleOwner;
                fragmentViewLifecycleOwner.mSavedStateRegistryController.performRestore(fragment.mSavedViewRegistryState);
                fragment.mSavedViewRegistryState = null;
            }
            fragment.mCalled = false;
            fragment.onViewStateRestored(bundle2);
            if (!fragment.mCalled) {
                throw new SuperNotCalledException("Fragment " + fragment + " did not call through to super.onViewStateRestored()");
            } else if (fragment.mView != null) {
                fragment.mViewLifecycleOwner.handleLifecycleEvent(Lifecycle.Event.ON_CREATE);
            }
        }
        fragment.mSavedFragmentState = null;
        FragmentManagerImpl fragmentManagerImpl = fragment.mChildFragmentManager;
        fragmentManagerImpl.mStateSaved = false;
        fragmentManagerImpl.mStopped = false;
        fragmentManagerImpl.mNonConfig.mIsStateSaved = false;
        fragmentManagerImpl.dispatchStateChange(4);
        FragmentLifecycleCallbacksDispatcher fragmentLifecycleCallbacksDispatcher = this.mDispatcher;
        Bundle bundle3 = this.mFragment.mSavedFragmentState;
        fragmentLifecycleCallbacksDispatcher.dispatchOnFragmentActivityCreated(false);
    }

    public final void attach() {
        if (FragmentManager.isLoggingEnabled(3)) {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("moveto ATTACHED: ");
            m.append(this.mFragment);
            Log.d("FragmentManager", m.toString());
        }
        Fragment fragment = this.mFragment;
        Fragment fragment2 = fragment.mTarget;
        FragmentStateManager fragmentStateManager = null;
        if (fragment2 != null) {
            FragmentStateManager fragmentStateManager2 = this.mFragmentStore.mActive.get(fragment2.mWho);
            if (fragmentStateManager2 != null) {
                Fragment fragment3 = this.mFragment;
                fragment3.mTargetWho = fragment3.mTarget.mWho;
                fragment3.mTarget = null;
                fragmentStateManager = fragmentStateManager2;
            } else {
                StringBuilder m2 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Fragment ");
                m2.append(this.mFragment);
                m2.append(" declared target fragment ");
                m2.append(this.mFragment.mTarget);
                m2.append(" that does not belong to this FragmentManager!");
                throw new IllegalStateException(m2.toString());
            }
        } else {
            String str = fragment.mTargetWho;
            if (str != null && (fragmentStateManager = this.mFragmentStore.mActive.get(str)) == null) {
                StringBuilder m3 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Fragment ");
                m3.append(this.mFragment);
                m3.append(" declared target fragment ");
                m3.append(this.mFragment.mTargetWho);
                m3.append(" that does not belong to this FragmentManager!");
                throw new IllegalStateException(m3.toString());
            }
        }
        if (fragmentStateManager != null) {
            fragmentStateManager.moveToExpectedState();
        }
        Fragment fragment4 = this.mFragment;
        FragmentManager fragmentManager = fragment4.mFragmentManager;
        fragment4.mHost = fragmentManager.mHost;
        fragment4.mParentFragment = fragmentManager.mParent;
        this.mDispatcher.dispatchOnFragmentPreAttached(false);
        Fragment fragment5 = this.mFragment;
        Iterator<Fragment.OnPreAttachedListener> it = fragment5.mOnPreAttachedListeners.iterator();
        while (it.hasNext()) {
            it.next().onPreAttached();
        }
        fragment5.mOnPreAttachedListeners.clear();
        fragment5.mChildFragmentManager.attachController(fragment5.mHost, fragment5.createFragmentContainer(), fragment5);
        fragment5.mState = 0;
        fragment5.mCalled = false;
        fragment5.onAttach(fragment5.mHost.mContext);
        if (fragment5.mCalled) {
            Iterator<FragmentOnAttachListener> it2 = fragment5.mFragmentManager.mOnAttachListeners.iterator();
            while (it2.hasNext()) {
                it2.next().onAttachFragment$1();
            }
            FragmentManagerImpl fragmentManagerImpl = fragment5.mChildFragmentManager;
            fragmentManagerImpl.mStateSaved = false;
            fragmentManagerImpl.mStopped = false;
            fragmentManagerImpl.mNonConfig.mIsStateSaved = false;
            fragmentManagerImpl.dispatchStateChange(0);
            this.mDispatcher.dispatchOnFragmentAttached(false);
            return;
        }
        throw new SuperNotCalledException("Fragment " + fragment5 + " did not call through to super.onAttach()");
    }

    public final void create() {
        Parcelable parcelable;
        if (FragmentManager.isLoggingEnabled(3)) {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("moveto CREATED: ");
            m.append(this.mFragment);
            Log.d("FragmentManager", m.toString());
        }
        Fragment fragment = this.mFragment;
        if (!fragment.mIsCreated) {
            this.mDispatcher.dispatchOnFragmentPreCreated(false);
            final Fragment fragment2 = this.mFragment;
            Bundle bundle = fragment2.mSavedFragmentState;
            fragment2.mChildFragmentManager.noteStateNotSaved();
            fragment2.mState = 1;
            fragment2.mCalled = false;
            fragment2.mLifecycleRegistry.addObserver(new LifecycleEventObserver() { // from class: androidx.fragment.app.Fragment.5
                @Override // androidx.lifecycle.LifecycleEventObserver
                public final void onStateChanged(LifecycleOwner lifecycleOwner, Lifecycle.Event event) {
                    View view;
                    if (event == Lifecycle.Event.ON_STOP && (view = fragment2.mView) != null) {
                        view.cancelPendingInputEvents();
                    }
                }
            });
            fragment2.mSavedStateRegistryController.performRestore(bundle);
            fragment2.onCreate(bundle);
            fragment2.mIsCreated = true;
            if (fragment2.mCalled) {
                fragment2.mLifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_CREATE);
                FragmentLifecycleCallbacksDispatcher fragmentLifecycleCallbacksDispatcher = this.mDispatcher;
                Bundle bundle2 = this.mFragment.mSavedFragmentState;
                fragmentLifecycleCallbacksDispatcher.dispatchOnFragmentCreated(false);
                return;
            }
            throw new SuperNotCalledException("Fragment " + fragment2 + " did not call through to super.onCreate()");
        }
        Bundle bundle3 = fragment.mSavedFragmentState;
        if (!(bundle3 == null || (parcelable = bundle3.getParcelable("android:support:fragments")) == null)) {
            fragment.mChildFragmentManager.restoreSaveStateInternal(parcelable);
            FragmentManagerImpl fragmentManagerImpl = fragment.mChildFragmentManager;
            fragmentManagerImpl.mStateSaved = false;
            fragmentManagerImpl.mStopped = false;
            fragmentManagerImpl.mNonConfig.mIsStateSaved = false;
            fragmentManagerImpl.dispatchStateChange(1);
        }
        this.mFragment.mState = 1;
    }

    /* JADX WARN: Code restructure failed: missing block: B:36:0x0085, code lost:
        if (r5 != false) goto L37;
     */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0032  */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0040  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x012c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void destroy() {
        /*
            Method dump skipped, instructions count: 327
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.fragment.app.FragmentStateManager.destroy():void");
    }

    public final void destroyFragmentView() {
        View view;
        if (FragmentManager.isLoggingEnabled(3)) {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("movefrom CREATE_VIEW: ");
            m.append(this.mFragment);
            Log.d("FragmentManager", m.toString());
        }
        Fragment fragment = this.mFragment;
        ViewGroup viewGroup = fragment.mContainer;
        if (!(viewGroup == null || (view = fragment.mView) == null)) {
            viewGroup.removeView(view);
        }
        Fragment fragment2 = this.mFragment;
        fragment2.mChildFragmentManager.dispatchStateChange(1);
        if (fragment2.mView != null) {
            FragmentViewLifecycleOwner fragmentViewLifecycleOwner = fragment2.mViewLifecycleOwner;
            fragmentViewLifecycleOwner.initialize();
            if (fragmentViewLifecycleOwner.mLifecycleRegistry.mState.isAtLeast(Lifecycle.State.CREATED)) {
                fragment2.mViewLifecycleOwner.handleLifecycleEvent(Lifecycle.Event.ON_DESTROY);
            }
        }
        fragment2.mState = 1;
        fragment2.mCalled = false;
        fragment2.onDestroyView();
        if (fragment2.mCalled) {
            LoaderManagerImpl$LoaderViewModel loaderManagerImpl$LoaderViewModel = (LoaderManagerImpl$LoaderViewModel) new ViewModelProvider(fragment2.getViewModelStore(), LoaderManagerImpl$LoaderViewModel.FACTORY).get(LoaderManagerImpl$LoaderViewModel.class);
            int i = loaderManagerImpl$LoaderViewModel.mLoaders.mSize;
            for (int i2 = 0; i2 < i; i2++) {
                ((LoaderManagerImpl$LoaderInfo) loaderManagerImpl$LoaderViewModel.mLoaders.mValues[i2]).getClass();
            }
            fragment2.mPerformedCreateView = false;
            this.mDispatcher.dispatchOnFragmentViewDestroyed(false);
            Fragment fragment3 = this.mFragment;
            fragment3.mContainer = null;
            fragment3.mView = null;
            fragment3.mViewLifecycleOwner = null;
            fragment3.mViewLifecycleOwnerLiveData.setValue(null);
            this.mFragment.mInLayout = false;
            return;
        }
        throw new SuperNotCalledException("Fragment " + fragment2 + " did not call through to super.onDestroyView()");
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x007c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void detach() {
        /*
            Method dump skipped, instructions count: 239
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.fragment.app.FragmentStateManager.detach():void");
    }

    public final void pause() {
        if (FragmentManager.isLoggingEnabled(3)) {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("movefrom RESUMED: ");
            m.append(this.mFragment);
            Log.d("FragmentManager", m.toString());
        }
        Fragment fragment = this.mFragment;
        fragment.mChildFragmentManager.dispatchStateChange(5);
        if (fragment.mView != null) {
            fragment.mViewLifecycleOwner.handleLifecycleEvent(Lifecycle.Event.ON_PAUSE);
        }
        fragment.mLifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_PAUSE);
        fragment.mState = 6;
        fragment.mCalled = false;
        fragment.onPause();
        if (fragment.mCalled) {
            this.mDispatcher.dispatchOnFragmentPaused(false);
            return;
        }
        throw new SuperNotCalledException("Fragment " + fragment + " did not call through to super.onPause()");
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0045  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void resume() {
        /*
            Method dump skipped, instructions count: 244
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.fragment.app.FragmentStateManager.resume():void");
    }

    public final void start() {
        if (FragmentManager.isLoggingEnabled(3)) {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("moveto STARTED: ");
            m.append(this.mFragment);
            Log.d("FragmentManager", m.toString());
        }
        Fragment fragment = this.mFragment;
        fragment.mChildFragmentManager.noteStateNotSaved();
        fragment.mChildFragmentManager.execPendingActions(true);
        fragment.mState = 5;
        fragment.mCalled = false;
        fragment.onStart();
        if (fragment.mCalled) {
            LifecycleRegistry lifecycleRegistry = fragment.mLifecycleRegistry;
            Lifecycle.Event event = Lifecycle.Event.ON_START;
            lifecycleRegistry.handleLifecycleEvent(event);
            if (fragment.mView != null) {
                fragment.mViewLifecycleOwner.handleLifecycleEvent(event);
            }
            FragmentManagerImpl fragmentManagerImpl = fragment.mChildFragmentManager;
            fragmentManagerImpl.mStateSaved = false;
            fragmentManagerImpl.mStopped = false;
            fragmentManagerImpl.mNonConfig.mIsStateSaved = false;
            fragmentManagerImpl.dispatchStateChange(5);
            this.mDispatcher.dispatchOnFragmentStarted(false);
            return;
        }
        throw new SuperNotCalledException("Fragment " + fragment + " did not call through to super.onStart()");
    }

    public final void stop() {
        if (FragmentManager.isLoggingEnabled(3)) {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("movefrom STARTED: ");
            m.append(this.mFragment);
            Log.d("FragmentManager", m.toString());
        }
        Fragment fragment = this.mFragment;
        FragmentManagerImpl fragmentManagerImpl = fragment.mChildFragmentManager;
        fragmentManagerImpl.mStopped = true;
        fragmentManagerImpl.mNonConfig.mIsStateSaved = true;
        fragmentManagerImpl.dispatchStateChange(4);
        if (fragment.mView != null) {
            fragment.mViewLifecycleOwner.handleLifecycleEvent(Lifecycle.Event.ON_STOP);
        }
        fragment.mLifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_STOP);
        fragment.mState = 4;
        fragment.mCalled = false;
        fragment.onStop();
        if (fragment.mCalled) {
            this.mDispatcher.dispatchOnFragmentStopped(false);
            return;
        }
        throw new SuperNotCalledException("Fragment " + fragment + " did not call through to super.onStop()");
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0031, code lost:
        r1 = r1 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x0039, code lost:
        if (r1 >= r0.mAdded.size()) goto L26;
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x003b, code lost:
        r4 = r0.mAdded.get(r1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x0045, code lost:
        if (r4.mContainer != r2) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0047, code lost:
        r4 = r4.mView;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0049, code lost:
        if (r4 == null) goto L30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x004b, code lost:
        r3 = r2.indexOfChild(r4);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void addViewToContainer() {
        /*
            r7 = this;
            androidx.fragment.app.FragmentStore r0 = r7.mFragmentStore
            androidx.fragment.app.Fragment r1 = r7.mFragment
            r0.getClass()
            android.view.ViewGroup r2 = r1.mContainer
            r3 = -1
            if (r2 != 0) goto Ld
            goto L4f
        Ld:
            java.util.ArrayList<androidx.fragment.app.Fragment> r4 = r0.mAdded
            int r1 = r4.indexOf(r1)
            int r4 = r1 + (-1)
        L15:
            if (r4 < 0) goto L31
            java.util.ArrayList<androidx.fragment.app.Fragment> r5 = r0.mAdded
            java.lang.Object r5 = r5.get(r4)
            androidx.fragment.app.Fragment r5 = (androidx.fragment.app.Fragment) r5
            android.view.ViewGroup r6 = r5.mContainer
            if (r6 != r2) goto L2e
            android.view.View r5 = r5.mView
            if (r5 == 0) goto L2e
            int r0 = r2.indexOfChild(r5)
            int r3 = r0 + 1
            goto L4f
        L2e:
            int r4 = r4 + (-1)
            goto L15
        L31:
            int r1 = r1 + 1
            java.util.ArrayList<androidx.fragment.app.Fragment> r4 = r0.mAdded
            int r4 = r4.size()
            if (r1 >= r4) goto L4f
            java.util.ArrayList<androidx.fragment.app.Fragment> r4 = r0.mAdded
            java.lang.Object r4 = r4.get(r1)
            androidx.fragment.app.Fragment r4 = (androidx.fragment.app.Fragment) r4
            android.view.ViewGroup r5 = r4.mContainer
            if (r5 != r2) goto L31
            android.view.View r4 = r4.mView
            if (r4 == 0) goto L31
            int r3 = r2.indexOfChild(r4)
        L4f:
            androidx.fragment.app.Fragment r7 = r7.mFragment
            android.view.ViewGroup r0 = r7.mContainer
            android.view.View r7 = r7.mView
            r0.addView(r7, r3)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.fragment.app.FragmentStateManager.addViewToContainer():void");
    }

    public final int computeExpectedState() {
        SpecialEffectsController.Operation.LifecycleImpact lifecycleImpact;
        Fragment fragment = this.mFragment;
        if (fragment.mFragmentManager == null) {
            return fragment.mState;
        }
        int i = this.mFragmentManagerState;
        int ordinal = fragment.mMaxState.ordinal();
        boolean z = false;
        if (ordinal == 1) {
            i = Math.min(i, 0);
        } else if (ordinal == 2) {
            i = Math.min(i, 1);
        } else if (ordinal == 3) {
            i = Math.min(i, 5);
        } else if (ordinal != 4) {
            i = Math.min(i, -1);
        }
        Fragment fragment2 = this.mFragment;
        if (fragment2.mFromLayout) {
            if (fragment2.mInLayout) {
                i = Math.max(this.mFragmentManagerState, 2);
                View view = this.mFragment.mView;
                if (view != null && view.getParent() == null) {
                    i = Math.min(i, 2);
                }
            } else {
                i = this.mFragmentManagerState < 4 ? Math.min(i, fragment2.mState) : Math.min(i, 1);
            }
        }
        if (!this.mFragment.mAdded) {
            i = Math.min(i, 1);
        }
        Fragment fragment3 = this.mFragment;
        ViewGroup viewGroup = fragment3.mContainer;
        SpecialEffectsController.Operation.LifecycleImpact lifecycleImpact2 = null;
        SpecialEffectsController.Operation operation = null;
        if (viewGroup != null) {
            SpecialEffectsController orCreateController = SpecialEffectsController.getOrCreateController(viewGroup, fragment3.getParentFragmentManager().getSpecialEffectsControllerFactory());
            orCreateController.getClass();
            SpecialEffectsController.Operation findPendingOperation = orCreateController.findPendingOperation(this.mFragment);
            if (findPendingOperation != null) {
                lifecycleImpact = findPendingOperation.mLifecycleImpact;
            } else {
                lifecycleImpact = null;
            }
            Fragment fragment4 = this.mFragment;
            Iterator<SpecialEffectsController.Operation> it = orCreateController.mRunningOperations.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                SpecialEffectsController.Operation next = it.next();
                if (next.mFragment.equals(fragment4) && !next.mIsCanceled) {
                    operation = next;
                    break;
                }
            }
            if (operation == null || !(lifecycleImpact == null || lifecycleImpact == SpecialEffectsController.Operation.LifecycleImpact.NONE)) {
                lifecycleImpact2 = lifecycleImpact;
            } else {
                lifecycleImpact2 = operation.mLifecycleImpact;
            }
        }
        if (lifecycleImpact2 == SpecialEffectsController.Operation.LifecycleImpact.ADDING) {
            i = Math.min(i, 6);
        } else if (lifecycleImpact2 == SpecialEffectsController.Operation.LifecycleImpact.REMOVING) {
            i = Math.max(i, 3);
        } else {
            Fragment fragment5 = this.mFragment;
            if (fragment5.mRemoving) {
                if (fragment5.mBackStackNesting > 0) {
                    z = true;
                }
                if (z) {
                    i = Math.min(i, 1);
                } else {
                    i = Math.min(i, -1);
                }
            }
        }
        Fragment fragment6 = this.mFragment;
        if (fragment6.mDeferStart && fragment6.mState < 5) {
            i = Math.min(i, 4);
        }
        if (FragmentManager.isLoggingEnabled(2)) {
            StringBuilder m = ExifInterface$$ExternalSyntheticOutline0.m("computeExpectedState() of ", i, " for ");
            m.append(this.mFragment);
            Log.v("FragmentManager", m.toString());
        }
        return i;
    }

    public final void createView() {
        String str;
        if (!this.mFragment.mFromLayout) {
            if (FragmentManager.isLoggingEnabled(3)) {
                StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("moveto CREATE_VIEW: ");
                m.append(this.mFragment);
                Log.d("FragmentManager", m.toString());
            }
            Fragment fragment = this.mFragment;
            LayoutInflater onGetLayoutInflater = fragment.onGetLayoutInflater(fragment.mSavedFragmentState);
            ViewGroup viewGroup = null;
            Fragment fragment2 = this.mFragment;
            ViewGroup viewGroup2 = fragment2.mContainer;
            if (viewGroup2 != null) {
                viewGroup = viewGroup2;
            } else {
                int i = fragment2.mContainerId;
                if (i != 0) {
                    if (i != -1) {
                        viewGroup = (ViewGroup) fragment2.mFragmentManager.mContainer.onFindViewById(i);
                        if (viewGroup == null) {
                            Fragment fragment3 = this.mFragment;
                            if (!fragment3.mRestored) {
                                try {
                                    str = fragment3.getResources().getResourceName(this.mFragment.mContainerId);
                                } catch (Resources.NotFoundException unused) {
                                    str = "unknown";
                                }
                                StringBuilder m2 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("No view found for id 0x");
                                m2.append(Integer.toHexString(this.mFragment.mContainerId));
                                m2.append(" (");
                                m2.append(str);
                                m2.append(") for fragment ");
                                m2.append(this.mFragment);
                                throw new IllegalArgumentException(m2.toString());
                            }
                        } else if (!(viewGroup instanceof FragmentContainerView)) {
                            FragmentStrictMode.onWrongFragmentContainer(this.mFragment, viewGroup);
                        }
                    } else {
                        StringBuilder m3 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Cannot create fragment ");
                        m3.append(this.mFragment);
                        m3.append(" for a container view with no id");
                        throw new IllegalArgumentException(m3.toString());
                    }
                }
            }
            Fragment fragment4 = this.mFragment;
            fragment4.mContainer = viewGroup;
            fragment4.performCreateView(onGetLayoutInflater, viewGroup, fragment4.mSavedFragmentState);
            View view = this.mFragment.mView;
            if (view != null) {
                view.setSaveFromParentEnabled(false);
                Fragment fragment5 = this.mFragment;
                fragment5.mView.setTag(R.id.fragment_container_view_tag, fragment5);
                if (viewGroup != null) {
                    addViewToContainer();
                }
                Fragment fragment6 = this.mFragment;
                if (fragment6.mHidden) {
                    fragment6.mView.setVisibility(8);
                }
                View view2 = this.mFragment.mView;
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                if (ViewCompat.Api19Impl.isAttachedToWindow(view2)) {
                    ViewCompat.Api20Impl.requestApplyInsets(this.mFragment.mView);
                } else {
                    final View view3 = this.mFragment.mView;
                    view3.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() { // from class: androidx.fragment.app.FragmentStateManager.1
                        @Override // android.view.View.OnAttachStateChangeListener
                        public final void onViewDetachedFromWindow(View view4) {
                        }

                        @Override // android.view.View.OnAttachStateChangeListener
                        public final void onViewAttachedToWindow(View view4) {
                            view3.removeOnAttachStateChangeListener(this);
                            View view5 = view3;
                            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap2 = ViewCompat.sViewPropertyAnimatorMap;
                            ViewCompat.Api20Impl.requestApplyInsets(view5);
                        }
                    });
                }
                Fragment fragment7 = this.mFragment;
                fragment7.onViewCreated(fragment7.mView, fragment7.mSavedFragmentState);
                fragment7.mChildFragmentManager.dispatchStateChange(2);
                FragmentLifecycleCallbacksDispatcher fragmentLifecycleCallbacksDispatcher = this.mDispatcher;
                View view4 = this.mFragment.mView;
                fragmentLifecycleCallbacksDispatcher.dispatchOnFragmentViewCreated(false);
                int visibility = this.mFragment.mView.getVisibility();
                this.mFragment.ensureAnimationInfo().mPostOnViewCreatedAlpha = this.mFragment.mView.getAlpha();
                Fragment fragment8 = this.mFragment;
                if (fragment8.mContainer != null && visibility == 0) {
                    View findFocus = fragment8.mView.findFocus();
                    if (findFocus != null) {
                        this.mFragment.ensureAnimationInfo().mFocusedView = findFocus;
                        if (FragmentManager.isLoggingEnabled(2)) {
                            Log.v("FragmentManager", "requestFocus: Saved focused view " + findFocus + " for Fragment " + this.mFragment);
                        }
                    }
                    this.mFragment.mView.setAlpha(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                }
            }
            this.mFragment.mState = 2;
        }
    }

    public final void ensureInflatedView() {
        Fragment fragment = this.mFragment;
        if (fragment.mFromLayout && fragment.mInLayout && !fragment.mPerformedCreateView) {
            if (FragmentManager.isLoggingEnabled(3)) {
                StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("moveto CREATE_VIEW: ");
                m.append(this.mFragment);
                Log.d("FragmentManager", m.toString());
            }
            Fragment fragment2 = this.mFragment;
            fragment2.performCreateView(fragment2.onGetLayoutInflater(fragment2.mSavedFragmentState), null, this.mFragment.mSavedFragmentState);
            View view = this.mFragment.mView;
            if (view != null) {
                view.setSaveFromParentEnabled(false);
                Fragment fragment3 = this.mFragment;
                fragment3.mView.setTag(R.id.fragment_container_view_tag, fragment3);
                Fragment fragment4 = this.mFragment;
                if (fragment4.mHidden) {
                    fragment4.mView.setVisibility(8);
                }
                Fragment fragment5 = this.mFragment;
                fragment5.onViewCreated(fragment5.mView, fragment5.mSavedFragmentState);
                fragment5.mChildFragmentManager.dispatchStateChange(2);
                FragmentLifecycleCallbacksDispatcher fragmentLifecycleCallbacksDispatcher = this.mDispatcher;
                View view2 = this.mFragment.mView;
                fragmentLifecycleCallbacksDispatcher.dispatchOnFragmentViewCreated(false);
                this.mFragment.mState = 2;
            }
        }
    }

    public final void moveToExpectedState() {
        ViewGroup viewGroup;
        ViewGroup viewGroup2;
        ViewGroup viewGroup3;
        SpecialEffectsController.Operation.LifecycleImpact lifecycleImpact = SpecialEffectsController.Operation.LifecycleImpact.NONE;
        if (!this.mMovingToState) {
            try {
                this.mMovingToState = true;
                while (true) {
                    int computeExpectedState = computeExpectedState();
                    Fragment fragment = this.mFragment;
                    int i = fragment.mState;
                    if (computeExpectedState == i) {
                        if (fragment.mHiddenChanged) {
                            if (!(fragment.mView == null || (viewGroup = fragment.mContainer) == null)) {
                                SpecialEffectsController orCreateController = SpecialEffectsController.getOrCreateController(viewGroup, fragment.getParentFragmentManager().getSpecialEffectsControllerFactory());
                                if (this.mFragment.mHidden) {
                                    orCreateController.getClass();
                                    if (FragmentManager.isLoggingEnabled(2)) {
                                        Log.v("FragmentManager", "SpecialEffectsController: Enqueuing hide operation for fragment " + this.mFragment);
                                    }
                                    orCreateController.enqueue(SpecialEffectsController.Operation.State.GONE, lifecycleImpact, this);
                                } else {
                                    orCreateController.getClass();
                                    if (FragmentManager.isLoggingEnabled(2)) {
                                        Log.v("FragmentManager", "SpecialEffectsController: Enqueuing show operation for fragment " + this.mFragment);
                                    }
                                    orCreateController.enqueue(SpecialEffectsController.Operation.State.VISIBLE, lifecycleImpact, this);
                                }
                            }
                            Fragment fragment2 = this.mFragment;
                            FragmentManager fragmentManager = fragment2.mFragmentManager;
                            if (fragmentManager != null && fragment2.mAdded && FragmentManager.isMenuAvailable(fragment2)) {
                                fragmentManager.mNeedMenuInvalidate = true;
                            }
                            this.mFragment.mHiddenChanged = false;
                        }
                        return;
                    } else if (computeExpectedState > i) {
                        switch (i + 1) {
                            case 0:
                                attach();
                                continue;
                            case 1:
                                create();
                                continue;
                            case 2:
                                ensureInflatedView();
                                createView();
                                continue;
                            case 3:
                                activityCreated();
                                continue;
                            case 4:
                                if (!(fragment.mView == null || (viewGroup2 = fragment.mContainer) == null)) {
                                    SpecialEffectsController orCreateController2 = SpecialEffectsController.getOrCreateController(viewGroup2, fragment.getParentFragmentManager().getSpecialEffectsControllerFactory());
                                    SpecialEffectsController.Operation.State from = SpecialEffectsController.Operation.State.from(this.mFragment.mView.getVisibility());
                                    orCreateController2.getClass();
                                    if (FragmentManager.isLoggingEnabled(2)) {
                                        Log.v("FragmentManager", "SpecialEffectsController: Enqueuing add operation for fragment " + this.mFragment);
                                    }
                                    orCreateController2.enqueue(from, SpecialEffectsController.Operation.LifecycleImpact.ADDING, this);
                                }
                                this.mFragment.mState = 4;
                                continue;
                            case 5:
                                start();
                                continue;
                            case 6:
                                fragment.mState = 6;
                                continue;
                            case 7:
                                resume();
                                continue;
                            default:
                                continue;
                        }
                    } else {
                        switch (i - 1) {
                            case -1:
                                detach();
                                continue;
                            case 0:
                                destroy();
                                continue;
                            case 1:
                                destroyFragmentView();
                                this.mFragment.mState = 1;
                                continue;
                            case 2:
                                fragment.mInLayout = false;
                                fragment.mState = 2;
                                continue;
                            case 3:
                                if (FragmentManager.isLoggingEnabled(3)) {
                                    Log.d("FragmentManager", "movefrom ACTIVITY_CREATED: " + this.mFragment);
                                }
                                this.mFragment.getClass();
                                Fragment fragment3 = this.mFragment;
                                if (fragment3.mView != null && fragment3.mSavedViewState == null) {
                                    saveViewState();
                                }
                                Fragment fragment4 = this.mFragment;
                                if (!(fragment4.mView == null || (viewGroup3 = fragment4.mContainer) == null)) {
                                    SpecialEffectsController orCreateController3 = SpecialEffectsController.getOrCreateController(viewGroup3, fragment4.getParentFragmentManager().getSpecialEffectsControllerFactory());
                                    orCreateController3.getClass();
                                    if (FragmentManager.isLoggingEnabled(2)) {
                                        Log.v("FragmentManager", "SpecialEffectsController: Enqueuing remove operation for fragment " + this.mFragment);
                                    }
                                    orCreateController3.enqueue(SpecialEffectsController.Operation.State.REMOVED, SpecialEffectsController.Operation.LifecycleImpact.REMOVING, this);
                                }
                                this.mFragment.mState = 3;
                                continue;
                            case 4:
                                stop();
                                continue;
                            case 5:
                                fragment.mState = 5;
                                continue;
                            case 6:
                                pause();
                                continue;
                            default:
                                continue;
                        }
                    }
                }
            } finally {
                this.mMovingToState = false;
            }
        } else if (FragmentManager.isLoggingEnabled(2)) {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Ignoring re-entrant call to moveToExpectedState() for ");
            m.append(this.mFragment);
            Log.v("FragmentManager", m.toString());
        }
    }

    public final void restoreState(ClassLoader classLoader) {
        Bundle bundle = this.mFragment.mSavedFragmentState;
        if (bundle != null) {
            bundle.setClassLoader(classLoader);
            Fragment fragment = this.mFragment;
            fragment.mSavedViewState = fragment.mSavedFragmentState.getSparseParcelableArray("android:view_state");
            Fragment fragment2 = this.mFragment;
            fragment2.mSavedViewRegistryState = fragment2.mSavedFragmentState.getBundle("android:view_registry_state");
            Fragment fragment3 = this.mFragment;
            fragment3.mTargetWho = fragment3.mSavedFragmentState.getString("android:target_state");
            Fragment fragment4 = this.mFragment;
            if (fragment4.mTargetWho != null) {
                fragment4.mTargetRequestCode = fragment4.mSavedFragmentState.getInt("android:target_req_state", 0);
            }
            Fragment fragment5 = this.mFragment;
            fragment5.getClass();
            fragment5.mUserVisibleHint = fragment5.mSavedFragmentState.getBoolean("android:user_visible_hint", true);
            Fragment fragment6 = this.mFragment;
            if (!fragment6.mUserVisibleHint) {
                fragment6.mDeferStart = true;
            }
        }
    }

    public final void saveState() {
        FragmentState fragmentState = new FragmentState(this.mFragment);
        Fragment fragment = this.mFragment;
        if (fragment.mState <= -1 || fragmentState.mSavedFragmentState != null) {
            fragmentState.mSavedFragmentState = fragment.mSavedFragmentState;
        } else {
            Bundle bundle = new Bundle();
            Fragment fragment2 = this.mFragment;
            fragment2.onSaveInstanceState(bundle);
            fragment2.mSavedStateRegistryController.performSave(bundle);
            Parcelable saveAllStateInternal = fragment2.mChildFragmentManager.saveAllStateInternal();
            if (saveAllStateInternal != null) {
                bundle.putParcelable("android:support:fragments", saveAllStateInternal);
            }
            this.mDispatcher.dispatchOnFragmentSaveInstanceState(false);
            if (bundle.isEmpty()) {
                bundle = null;
            }
            if (this.mFragment.mView != null) {
                saveViewState();
            }
            if (this.mFragment.mSavedViewState != null) {
                if (bundle == null) {
                    bundle = new Bundle();
                }
                bundle.putSparseParcelableArray("android:view_state", this.mFragment.mSavedViewState);
            }
            if (this.mFragment.mSavedViewRegistryState != null) {
                if (bundle == null) {
                    bundle = new Bundle();
                }
                bundle.putBundle("android:view_registry_state", this.mFragment.mSavedViewRegistryState);
            }
            if (!this.mFragment.mUserVisibleHint) {
                if (bundle == null) {
                    bundle = new Bundle();
                }
                bundle.putBoolean("android:user_visible_hint", this.mFragment.mUserVisibleHint);
            }
            fragmentState.mSavedFragmentState = bundle;
            if (this.mFragment.mTargetWho != null) {
                if (bundle == null) {
                    fragmentState.mSavedFragmentState = new Bundle();
                }
                fragmentState.mSavedFragmentState.putString("android:target_state", this.mFragment.mTargetWho);
                int i = this.mFragment.mTargetRequestCode;
                if (i != 0) {
                    fragmentState.mSavedFragmentState.putInt("android:target_req_state", i);
                }
            }
        }
        this.mFragmentStore.setSavedState(this.mFragment.mWho, fragmentState);
    }

    public final void saveViewState() {
        if (this.mFragment.mView != null) {
            SparseArray<Parcelable> sparseArray = new SparseArray<>();
            this.mFragment.mView.saveHierarchyState(sparseArray);
            if (sparseArray.size() > 0) {
                this.mFragment.mSavedViewState = sparseArray;
            }
            Bundle bundle = new Bundle();
            this.mFragment.mViewLifecycleOwner.mSavedStateRegistryController.performSave(bundle);
            if (!bundle.isEmpty()) {
                this.mFragment.mSavedViewRegistryState = bundle;
            }
        }
    }

    public FragmentStateManager(FragmentLifecycleCallbacksDispatcher fragmentLifecycleCallbacksDispatcher, FragmentStore fragmentStore, ClassLoader classLoader, FragmentFactory fragmentFactory, FragmentState fragmentState) {
        this.mDispatcher = fragmentLifecycleCallbacksDispatcher;
        this.mFragmentStore = fragmentStore;
        Fragment instantiate = fragmentFactory.instantiate(fragmentState.mClassName);
        Bundle bundle = fragmentState.mArguments;
        if (bundle != null) {
            bundle.setClassLoader(classLoader);
        }
        instantiate.setArguments(fragmentState.mArguments);
        instantiate.mWho = fragmentState.mWho;
        instantiate.mFromLayout = fragmentState.mFromLayout;
        instantiate.mRestored = true;
        instantiate.mFragmentId = fragmentState.mFragmentId;
        instantiate.mContainerId = fragmentState.mContainerId;
        instantiate.mTag = fragmentState.mTag;
        instantiate.mRetainInstance = fragmentState.mRetainInstance;
        instantiate.mRemoving = fragmentState.mRemoving;
        instantiate.mDetached = fragmentState.mDetached;
        instantiate.mHidden = fragmentState.mHidden;
        instantiate.mMaxState = Lifecycle.State.values()[fragmentState.mMaxLifecycleState];
        Bundle bundle2 = fragmentState.mSavedFragmentState;
        if (bundle2 != null) {
            instantiate.mSavedFragmentState = bundle2;
        } else {
            instantiate.mSavedFragmentState = new Bundle();
        }
        this.mFragment = instantiate;
        if (FragmentManager.isLoggingEnabled(2)) {
            Log.v("FragmentManager", "Instantiated fragment " + instantiate);
        }
    }

    public FragmentStateManager(FragmentLifecycleCallbacksDispatcher fragmentLifecycleCallbacksDispatcher, FragmentStore fragmentStore, Fragment fragment, FragmentState fragmentState) {
        this.mDispatcher = fragmentLifecycleCallbacksDispatcher;
        this.mFragmentStore = fragmentStore;
        this.mFragment = fragment;
        fragment.mSavedViewState = null;
        fragment.mSavedViewRegistryState = null;
        fragment.mBackStackNesting = 0;
        fragment.mInLayout = false;
        fragment.mAdded = false;
        Fragment fragment2 = fragment.mTarget;
        fragment.mTargetWho = fragment2 != null ? fragment2.mWho : null;
        fragment.mTarget = null;
        Bundle bundle = fragmentState.mSavedFragmentState;
        if (bundle != null) {
            fragment.mSavedFragmentState = bundle;
        } else {
            fragment.mSavedFragmentState = new Bundle();
        }
    }
}
