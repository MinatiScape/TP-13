package androidx.activity.result;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import androidx.activity.result.contract.ActivityResultContract;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleEventObserver;
import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.LifecycleRegistry;
import com.android.systemui.shared.system.QuickStepContract;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Random;
/* loaded from: classes.dex */
public abstract class ActivityResultRegistry {
    public Random mRandom = new Random();
    public final HashMap mRcToKey = new HashMap();
    public final HashMap mKeyToRc = new HashMap();
    public final HashMap mKeyToLifecycleContainers = new HashMap();
    public ArrayList<String> mLaunchedKeys = new ArrayList<>();
    public final transient HashMap mKeyToCallback = new HashMap();
    public final HashMap mParsedPendingResults = new HashMap();
    public final Bundle mPendingResults = new Bundle();

    /* renamed from: androidx.activity.result.ActivityResultRegistry$3  reason: invalid class name */
    /* loaded from: classes.dex */
    public final class AnonymousClass3 extends ActivityResultLauncher<Object> {
        public final /* synthetic */ ActivityResultContract val$contract;
        public final /* synthetic */ String val$key;

        public AnonymousClass3(String str, ActivityResultContract activityResultContract) {
            this.val$key = str;
            this.val$contract = activityResultContract;
        }

        @Override // androidx.activity.result.ActivityResultLauncher
        public final void launch(Object obj) {
            Integer num = (Integer) ActivityResultRegistry.this.mKeyToRc.get(this.val$key);
            if (num != null) {
                ActivityResultRegistry.this.mLaunchedKeys.add(this.val$key);
                ActivityResultRegistry.this.onLaunch(num.intValue(), this.val$contract, (Parcelable) obj);
                return;
            }
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Attempting to launch an unregistered ActivityResultLauncher with contract ");
            m.append(this.val$contract);
            m.append(" and input ");
            m.append(obj);
            m.append(". You must ensure the ActivityResultLauncher is registered before calling launch().");
            throw new IllegalStateException(m.toString());
        }

        @Override // androidx.activity.result.ActivityResultLauncher
        public final void unregister() {
            ActivityResultRegistry.this.unregister(this.val$key);
        }
    }

    public abstract void onLaunch(int i, ActivityResultContract activityResultContract, @SuppressLint({"UnknownNullness"}) Parcelable parcelable);

    public final AnonymousClass3 register(String str, ActivityResultContract activityResultContract, ActivityResultCallback activityResultCallback) {
        registerKey(str);
        this.mKeyToCallback.put(str, new CallbackAndContract(activityResultCallback, activityResultContract));
        if (this.mParsedPendingResults.containsKey(str)) {
            Object obj = this.mParsedPendingResults.get(str);
            this.mParsedPendingResults.remove(str);
            activityResultCallback.onActivityResult(obj);
        }
        ActivityResult activityResult = (ActivityResult) this.mPendingResults.getParcelable(str);
        if (activityResult != null) {
            this.mPendingResults.remove(str);
            activityResultCallback.onActivityResult(activityResultContract.parseResult(activityResult.mResultCode, activityResult.mData));
        }
        return new AnonymousClass3(str, activityResultContract);
    }

    /* loaded from: classes.dex */
    public static class CallbackAndContract<O> {
        public final ActivityResultCallback<O> mCallback;
        public final ActivityResultContract<?, O> mContract;

        public CallbackAndContract(ActivityResultCallback<O> activityResultCallback, ActivityResultContract<?, O> activityResultContract) {
            this.mCallback = activityResultCallback;
            this.mContract = activityResultContract;
        }
    }

    /* loaded from: classes.dex */
    public static class LifecycleContainer {
        public final Lifecycle mLifecycle;
        public final ArrayList<LifecycleEventObserver> mObservers = new ArrayList<>();

        public LifecycleContainer(Lifecycle lifecycle) {
            this.mLifecycle = lifecycle;
        }
    }

    public final boolean dispatchResult(int i, int i2, Intent intent) {
        ActivityResultCallback<O> activityResultCallback;
        String str = (String) this.mRcToKey.get(Integer.valueOf(i));
        if (str == null) {
            return false;
        }
        this.mLaunchedKeys.remove(str);
        CallbackAndContract callbackAndContract = (CallbackAndContract) this.mKeyToCallback.get(str);
        if (callbackAndContract == null || (activityResultCallback = callbackAndContract.mCallback) == 0) {
            this.mParsedPendingResults.remove(str);
            this.mPendingResults.putParcelable(str, new ActivityResult(i2, intent));
            return true;
        }
        activityResultCallback.onActivityResult(callbackAndContract.mContract.parseResult(i2, intent));
        return true;
    }

    public final void registerKey(String str) {
        if (((Integer) this.mKeyToRc.get(str)) == null) {
            int nextInt = this.mRandom.nextInt(2147418112);
            while (true) {
                int i = nextInt + QuickStepContract.SYSUI_STATE_ONE_HANDED_ACTIVE;
                if (this.mRcToKey.containsKey(Integer.valueOf(i))) {
                    nextInt = this.mRandom.nextInt(2147418112);
                } else {
                    this.mRcToKey.put(Integer.valueOf(i), str);
                    this.mKeyToRc.put(str, Integer.valueOf(i));
                    return;
                }
            }
        }
    }

    public final void unregister(String str) {
        Integer num;
        if (!this.mLaunchedKeys.contains(str) && (num = (Integer) this.mKeyToRc.remove(str)) != null) {
            this.mRcToKey.remove(num);
        }
        this.mKeyToCallback.remove(str);
        if (this.mParsedPendingResults.containsKey(str)) {
            Log.w("ActivityResultRegistry", "Dropping pending result for request " + str + ": " + this.mParsedPendingResults.get(str));
            this.mParsedPendingResults.remove(str);
        }
        if (this.mPendingResults.containsKey(str)) {
            Log.w("ActivityResultRegistry", "Dropping pending result for request " + str + ": " + this.mPendingResults.getParcelable(str));
            this.mPendingResults.remove(str);
        }
        LifecycleContainer lifecycleContainer = (LifecycleContainer) this.mKeyToLifecycleContainers.get(str);
        if (lifecycleContainer != null) {
            Iterator<LifecycleEventObserver> it = lifecycleContainer.mObservers.iterator();
            while (it.hasNext()) {
                lifecycleContainer.mLifecycle.removeObserver(it.next());
            }
            lifecycleContainer.mObservers.clear();
            this.mKeyToLifecycleContainers.remove(str);
        }
    }

    /* JADX WARN: Type inference failed for: r5v8, types: [androidx.activity.result.ActivityResultRegistry$2] */
    public final AnonymousClass2 register(final String str, Fragment fragment, final ActivityResultContract activityResultContract, final ActivityResultCallback activityResultCallback) {
        LifecycleRegistry lifecycleRegistry = fragment.mLifecycleRegistry;
        if (!lifecycleRegistry.mState.isAtLeast(Lifecycle.State.STARTED)) {
            registerKey(str);
            LifecycleContainer lifecycleContainer = (LifecycleContainer) this.mKeyToLifecycleContainers.get(str);
            if (lifecycleContainer == null) {
                lifecycleContainer = new LifecycleContainer(lifecycleRegistry);
            }
            LifecycleEventObserver lifecycleEventObserver = new LifecycleEventObserver() { // from class: androidx.activity.result.ActivityResultRegistry.1
                @Override // androidx.lifecycle.LifecycleEventObserver
                public final void onStateChanged(LifecycleOwner lifecycleOwner, Lifecycle.Event event) {
                    if (Lifecycle.Event.ON_START.equals(event)) {
                        ActivityResultRegistry.this.mKeyToCallback.put(str, new CallbackAndContract(activityResultCallback, activityResultContract));
                        if (ActivityResultRegistry.this.mParsedPendingResults.containsKey(str)) {
                            Object obj = ActivityResultRegistry.this.mParsedPendingResults.get(str);
                            ActivityResultRegistry.this.mParsedPendingResults.remove(str);
                            activityResultCallback.onActivityResult(obj);
                        }
                        ActivityResult activityResult = (ActivityResult) ActivityResultRegistry.this.mPendingResults.getParcelable(str);
                        if (activityResult != null) {
                            ActivityResultRegistry.this.mPendingResults.remove(str);
                            activityResultCallback.onActivityResult(activityResultContract.parseResult(activityResult.mResultCode, activityResult.mData));
                        }
                    } else if (Lifecycle.Event.ON_STOP.equals(event)) {
                        ActivityResultRegistry.this.mKeyToCallback.remove(str);
                    } else if (Lifecycle.Event.ON_DESTROY.equals(event)) {
                        ActivityResultRegistry.this.unregister(str);
                    }
                }
            };
            lifecycleContainer.mLifecycle.addObserver(lifecycleEventObserver);
            lifecycleContainer.mObservers.add(lifecycleEventObserver);
            this.mKeyToLifecycleContainers.put(str, lifecycleContainer);
            return new ActivityResultLauncher<Object>() { // from class: androidx.activity.result.ActivityResultRegistry.2
                @Override // androidx.activity.result.ActivityResultLauncher
                public final void launch(Object obj) {
                    Integer num = (Integer) ActivityResultRegistry.this.mKeyToRc.get(str);
                    if (num != null) {
                        ActivityResultRegistry.this.mLaunchedKeys.add(str);
                        ActivityResultRegistry.this.onLaunch(num.intValue(), activityResultContract, (Parcelable) obj);
                        return;
                    }
                    StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Attempting to launch an unregistered ActivityResultLauncher with contract ");
                    m.append(activityResultContract);
                    m.append(" and input ");
                    m.append(obj);
                    m.append(". You must ensure the ActivityResultLauncher is registered before calling launch().");
                    throw new IllegalStateException(m.toString());
                }

                @Override // androidx.activity.result.ActivityResultLauncher
                public final void unregister() {
                    ActivityResultRegistry.this.unregister(str);
                }
            };
        }
        throw new IllegalStateException("LifecycleOwner " + fragment + " is attempting to register while current state is " + lifecycleRegistry.mState + ". LifecycleOwners must call register before they are STARTED.");
    }
}
