package com.bumptech.glide.manager;

import android.app.Activity;
import android.app.Application;
import android.app.FragmentManager;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import androidx.cardview.R$styleable;
import androidx.fragment.app.BackStackRecord;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentManagerImpl;
import androidx.slice.SliceSpecs;
import com.bumptech.glide.Glide;
import com.bumptech.glide.RequestManager;
import com.bumptech.glide.load.resource.bitmap.HardwareConfigState;
import com.bumptech.glide.manager.RequestManagerFragment;
import com.bumptech.glide.manager.SupportRequestManagerFragment;
import com.bumptech.glide.util.Util;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes.dex */
public final class RequestManagerRetriever implements Handler.Callback {
    public static final AnonymousClass1 DEFAULT_FACTORY = new RequestManagerFactory() { // from class: com.bumptech.glide.manager.RequestManagerRetriever.1
    };
    public static final String FRAGMENT_TAG = "com.bumptech.glide.manager";
    public volatile RequestManager applicationManager;
    public final RequestManagerFactory factory;
    public final SliceSpecs frameWaiter;
    public final Handler handler;
    public final Map<FragmentManager, RequestManagerFragment> pendingRequestManagerFragments = new HashMap();
    public final Map<androidx.fragment.app.FragmentManager, SupportRequestManagerFragment> pendingSupportRequestManagerFragments = new HashMap();

    /* loaded from: classes.dex */
    public interface RequestManagerFactory {
    }

    public final RequestManager get(Context context) {
        if (context != null) {
            char[] cArr = Util.HEX_CHAR_ARRAY;
            if ((Looper.myLooper() == Looper.getMainLooper()) && !(context instanceof Application)) {
                if (context instanceof FragmentActivity) {
                    return get((FragmentActivity) context);
                }
                if (context instanceof Activity) {
                    return get((Activity) context);
                }
                if (context instanceof ContextWrapper) {
                    ContextWrapper contextWrapper = (ContextWrapper) context;
                    if (contextWrapper.getBaseContext().getApplicationContext() != null) {
                        return get(contextWrapper.getBaseContext());
                    }
                }
            }
            if (this.applicationManager == null) {
                synchronized (this) {
                    if (this.applicationManager == null) {
                        Glide glide = Glide.get(context.getApplicationContext());
                        RequestManagerFactory requestManagerFactory = this.factory;
                        ApplicationLifecycle applicationLifecycle = new ApplicationLifecycle();
                        R$styleable r$styleable = new R$styleable();
                        Context applicationContext = context.getApplicationContext();
                        ((AnonymousClass1) requestManagerFactory).getClass();
                        this.applicationManager = new RequestManager(glide, applicationLifecycle, r$styleable, applicationContext);
                    }
                }
            }
            return this.applicationManager;
        }
        throw new IllegalArgumentException("You cannot start a load on a null Context");
    }

    public static Activity findActivity(Context context) {
        if (context instanceof Activity) {
            return (Activity) context;
        }
        if (context instanceof ContextWrapper) {
            return findActivity(((ContextWrapper) context).getBaseContext());
        }
        return null;
    }

    public final RequestManagerFragment getRequestManagerFragment(FragmentManager fragmentManager) {
        RequestManagerFragment requestManagerFragment = (RequestManagerFragment) fragmentManager.findFragmentByTag(FRAGMENT_TAG);
        if (requestManagerFragment != null) {
            return requestManagerFragment;
        }
        RequestManagerFragment requestManagerFragment2 = this.pendingRequestManagerFragments.get(fragmentManager);
        if (requestManagerFragment2 != null) {
            return requestManagerFragment2;
        }
        RequestManagerFragment requestManagerFragment3 = new RequestManagerFragment();
        requestManagerFragment3.parentFragmentHint = null;
        this.pendingRequestManagerFragments.put(fragmentManager, requestManagerFragment3);
        fragmentManager.beginTransaction().add(requestManagerFragment3, FRAGMENT_TAG).commitAllowingStateLoss();
        this.handler.obtainMessage(1, fragmentManager).sendToTarget();
        return requestManagerFragment3;
    }

    public final SupportRequestManagerFragment getSupportRequestManagerFragment(androidx.fragment.app.FragmentManager fragmentManager) {
        SupportRequestManagerFragment supportRequestManagerFragment = (SupportRequestManagerFragment) fragmentManager.findFragmentByTag(FRAGMENT_TAG);
        if (supportRequestManagerFragment != null) {
            return supportRequestManagerFragment;
        }
        SupportRequestManagerFragment supportRequestManagerFragment2 = this.pendingSupportRequestManagerFragments.get(fragmentManager);
        if (supportRequestManagerFragment2 != null) {
            return supportRequestManagerFragment2;
        }
        SupportRequestManagerFragment supportRequestManagerFragment3 = new SupportRequestManagerFragment();
        supportRequestManagerFragment3.parentFragmentHint = null;
        this.pendingSupportRequestManagerFragments.put(fragmentManager, supportRequestManagerFragment3);
        BackStackRecord backStackRecord = new BackStackRecord(fragmentManager);
        backStackRecord.doAddOp(0, supportRequestManagerFragment3, FRAGMENT_TAG, 1);
        backStackRecord.commitInternal(true);
        this.handler.obtainMessage(2, fragmentManager).sendToTarget();
        return supportRequestManagerFragment3;
    }

    @Override // android.os.Handler.Callback
    public final boolean handleMessage(Message message) {
        Object obj;
        Object obj2;
        Object obj3;
        int i = message.what;
        Object obj4 = null;
        boolean z = true;
        if (i == 1) {
            obj3 = (FragmentManager) message.obj;
            obj2 = this.pendingRequestManagerFragments.remove(obj3);
        } else if (i != 2) {
            z = false;
            obj = null;
            if (z && obj4 == null && Log.isLoggable("RMRetriever", 5)) {
                Log.w("RMRetriever", "Failed to remove expected request manager fragment, manager: " + obj);
            }
            return z;
        } else {
            obj3 = (androidx.fragment.app.FragmentManager) message.obj;
            obj2 = this.pendingSupportRequestManagerFragments.remove(obj3);
        }
        Object obj5 = obj3;
        obj4 = obj2;
        obj = obj5;
        if (z) {
            Log.w("RMRetriever", "Failed to remove expected request manager fragment, manager: " + obj);
        }
        return z;
    }

    public RequestManagerRetriever(RequestManagerFactory requestManagerFactory) {
        new Bundle();
        this.factory = requestManagerFactory == null ? DEFAULT_FACTORY : requestManagerFactory;
        this.handler = new Handler(Looper.getMainLooper(), this);
        int i = HardwareConfigState.MIN_HARDWARE_DIMENSION_O;
        this.frameWaiter = new SliceSpecs();
    }

    public final RequestManager get(FragmentActivity fragmentActivity) {
        char[] cArr = Util.HEX_CHAR_ARRAY;
        boolean z = false;
        if (!(Looper.myLooper() == Looper.getMainLooper())) {
            return get(fragmentActivity.getApplicationContext());
        }
        if (!fragmentActivity.isDestroyed()) {
            this.frameWaiter.getClass();
            FragmentManagerImpl supportFragmentManager = fragmentActivity.getSupportFragmentManager();
            Activity findActivity = findActivity(fragmentActivity);
            if (findActivity == null || !findActivity.isFinishing()) {
                z = true;
            }
            SupportRequestManagerFragment supportRequestManagerFragment = getSupportRequestManagerFragment(supportFragmentManager);
            RequestManager requestManager = supportRequestManagerFragment.requestManager;
            if (requestManager != null) {
                return requestManager;
            }
            Glide glide = Glide.get(fragmentActivity);
            RequestManagerFactory requestManagerFactory = this.factory;
            ActivityFragmentLifecycle activityFragmentLifecycle = supportRequestManagerFragment.lifecycle;
            SupportRequestManagerFragment.SupportFragmentRequestManagerTreeNode supportFragmentRequestManagerTreeNode = supportRequestManagerFragment.requestManagerTreeNode;
            ((AnonymousClass1) requestManagerFactory).getClass();
            RequestManager requestManager2 = new RequestManager(glide, activityFragmentLifecycle, supportFragmentRequestManagerTreeNode, fragmentActivity);
            if (z) {
                requestManager2.onStart();
            }
            supportRequestManagerFragment.requestManager = requestManager2;
            return requestManager2;
        }
        throw new IllegalArgumentException("You cannot start a load for a destroyed activity");
    }

    public final RequestManager get(Activity activity) {
        char[] cArr = Util.HEX_CHAR_ARRAY;
        boolean z = false;
        if (!(Looper.myLooper() == Looper.getMainLooper())) {
            return get(activity.getApplicationContext());
        }
        if (activity instanceof FragmentActivity) {
            return get((FragmentActivity) activity);
        }
        if (!activity.isDestroyed()) {
            this.frameWaiter.getClass();
            FragmentManager fragmentManager = activity.getFragmentManager();
            Activity findActivity = findActivity(activity);
            if (findActivity == null || !findActivity.isFinishing()) {
                z = true;
            }
            RequestManagerFragment requestManagerFragment = getRequestManagerFragment(fragmentManager);
            RequestManager requestManager = requestManagerFragment.requestManager;
            if (requestManager != null) {
                return requestManager;
            }
            Glide glide = Glide.get(activity);
            RequestManagerFactory requestManagerFactory = this.factory;
            ActivityFragmentLifecycle activityFragmentLifecycle = requestManagerFragment.lifecycle;
            RequestManagerFragment.FragmentRequestManagerTreeNode fragmentRequestManagerTreeNode = requestManagerFragment.requestManagerTreeNode;
            ((AnonymousClass1) requestManagerFactory).getClass();
            RequestManager requestManager2 = new RequestManager(glide, activityFragmentLifecycle, fragmentRequestManagerTreeNode, activity);
            if (z) {
                requestManager2.onStart();
            }
            requestManagerFragment.requestManager = requestManager2;
            return requestManager2;
        }
        throw new IllegalArgumentException("You cannot start a load for a destroyed activity");
    }
}
