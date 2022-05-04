package com.bumptech.glide.manager;

import android.app.Activity;
import android.app.Application;
import android.app.Fragment;
import android.app.FragmentManager;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import androidx.fragment.app.BackStackRecord;
import androidx.fragment.app.FragmentActivity;
import com.bumptech.glide.Glide;
import com.bumptech.glide.RequestManager;
import com.bumptech.glide.util.Util;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
/* loaded from: classes.dex */
public class RequestManagerRetriever implements Handler.Callback {
    public static final RequestManagerFactory DEFAULT_FACTORY = new AnonymousClass1();
    public static final String FRAGMENT_TAG = "com.bumptech.glide.manager";
    public volatile RequestManager applicationManager;
    public final RequestManagerFactory factory;
    public final Handler handler;
    public final Map<FragmentManager, RequestManagerFragment> pendingRequestManagerFragments = new HashMap();
    public final Map<androidx.fragment.app.FragmentManager, SupportRequestManagerFragment> pendingSupportRequestManagerFragments = new HashMap();

    /* renamed from: com.bumptech.glide.manager.RequestManagerRetriever$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass1 implements RequestManagerFactory {
        public RequestManager build(Glide glide, Lifecycle lifecycle, RequestManagerTreeNode requestManagerTreeNode, Context context) {
            return new RequestManager(glide, lifecycle, requestManagerTreeNode, context);
        }
    }

    /* loaded from: classes.dex */
    public interface RequestManagerFactory {
    }

    public RequestManagerRetriever(RequestManagerFactory factory) {
        new Bundle();
        this.factory = factory == null ? DEFAULT_FACTORY : factory;
        this.handler = new Handler(Looper.getMainLooper(), this);
    }

    public RequestManager get(Context context) {
        if (context != null) {
            if (Util.isOnMainThread() && !(context instanceof Application)) {
                if (context instanceof FragmentActivity) {
                    return get((FragmentActivity) context);
                }
                if (context instanceof Activity) {
                    return get((Activity) context);
                }
                if (context instanceof ContextWrapper) {
                    return get(((ContextWrapper) context).getBaseContext());
                }
            }
            if (this.applicationManager == null) {
                synchronized (this) {
                    if (this.applicationManager == null) {
                        Glide glide = Glide.get(context.getApplicationContext());
                        this.applicationManager = ((AnonymousClass1) this.factory).build(glide, new ApplicationLifecycle(), new EmptyRequestManagerTreeNode(), context.getApplicationContext());
                    }
                }
            }
            return this.applicationManager;
        }
        throw new IllegalArgumentException("You cannot start a load on a null Context");
    }

    public final RequestManagerFragment getRequestManagerFragment(final FragmentManager fm, Fragment parentHint, boolean isParentVisible) {
        RequestManagerFragment requestManagerFragment = (RequestManagerFragment) fm.findFragmentByTag(FRAGMENT_TAG);
        if (requestManagerFragment == null && (requestManagerFragment = this.pendingRequestManagerFragments.get(fm)) == null) {
            requestManagerFragment = new RequestManagerFragment(new ActivityFragmentLifecycle());
            requestManagerFragment.parentFragmentHint = parentHint;
            if (!(parentHint == null || parentHint.getActivity() == null)) {
                requestManagerFragment.registerFragmentWithRoot(parentHint.getActivity());
            }
            if (isParentVisible) {
                requestManagerFragment.lifecycle.onStart();
            }
            this.pendingRequestManagerFragments.put(fm, requestManagerFragment);
            fm.beginTransaction().add(requestManagerFragment, FRAGMENT_TAG).commitAllowingStateLoss();
            this.handler.obtainMessage(1, fm).sendToTarget();
        }
        return requestManagerFragment;
    }

    public final SupportRequestManagerFragment getSupportRequestManagerFragment(final androidx.fragment.app.FragmentManager fm, androidx.fragment.app.Fragment parentHint, boolean isParentVisible) {
        SupportRequestManagerFragment supportRequestManagerFragment = (SupportRequestManagerFragment) fm.findFragmentByTag(FRAGMENT_TAG);
        if (supportRequestManagerFragment == null && (supportRequestManagerFragment = this.pendingSupportRequestManagerFragments.get(fm)) == null) {
            supportRequestManagerFragment = new SupportRequestManagerFragment();
            supportRequestManagerFragment.parentFragmentHint = parentHint;
            if (!(parentHint == null || parentHint.getActivity() == null)) {
                supportRequestManagerFragment.registerFragmentWithRoot(parentHint.getActivity());
            }
            if (isParentVisible) {
                supportRequestManagerFragment.lifecycle.onStart();
            }
            this.pendingSupportRequestManagerFragments.put(fm, supportRequestManagerFragment);
            BackStackRecord backStackRecord = new BackStackRecord(fm);
            backStackRecord.doAddOp(0, supportRequestManagerFragment, FRAGMENT_TAG, 1);
            backStackRecord.commitAllowingStateLoss();
            this.handler.obtainMessage(2, fm).sendToTarget();
        }
        return supportRequestManagerFragment;
    }

    @Override // android.os.Handler.Callback
    public boolean handleMessage(Message message) {
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
                String valueOf = String.valueOf(obj);
                StringBuilder sb = new StringBuilder(valueOf.length() + 61);
                sb.append("Failed to remove expected request manager fragment, manager: ");
                sb.append(valueOf);
                Log.w("RMRetriever", sb.toString());
            }
            return z;
        } else {
            obj3 = (androidx.fragment.app.FragmentManager) message.obj;
            obj2 = this.pendingSupportRequestManagerFragments.remove(obj3);
        }
        obj = obj3;
        obj4 = obj2;
        if (z) {
            String valueOf2 = String.valueOf(obj);
            StringBuilder sb2 = new StringBuilder(valueOf2.length() + 61);
            sb2.append("Failed to remove expected request manager fragment, manager: ");
            sb2.append(valueOf2);
            Log.w("RMRetriever", sb2.toString());
        }
        return z;
    }

    public RequestManager get(FragmentActivity activity) {
        if (Util.isOnBackgroundThread()) {
            return get(activity.getApplicationContext());
        }
        if (!activity.isDestroyed()) {
            SupportRequestManagerFragment supportRequestManagerFragment = getSupportRequestManagerFragment(activity.getSupportFragmentManager(), null, !activity.isFinishing());
            RequestManager requestManager = supportRequestManagerFragment.requestManager;
            if (requestManager != null) {
                return requestManager;
            }
            Glide glide = Glide.get(activity);
            RequestManagerFactory requestManagerFactory = this.factory;
            ActivityFragmentLifecycle activityFragmentLifecycle = supportRequestManagerFragment.lifecycle;
            RequestManagerTreeNode requestManagerTreeNode = supportRequestManagerFragment.requestManagerTreeNode;
            Objects.requireNonNull((AnonymousClass1) requestManagerFactory);
            RequestManager requestManager2 = new RequestManager(glide, activityFragmentLifecycle, requestManagerTreeNode, activity);
            supportRequestManagerFragment.requestManager = requestManager2;
            return requestManager2;
        }
        throw new IllegalArgumentException("You cannot start a load for a destroyed activity");
    }

    public RequestManager get(Activity activity) {
        if (Util.isOnBackgroundThread()) {
            return get(activity.getApplicationContext());
        }
        if (!activity.isDestroyed()) {
            RequestManagerFragment requestManagerFragment = getRequestManagerFragment(activity.getFragmentManager(), null, !activity.isFinishing());
            RequestManager requestManager = requestManagerFragment.requestManager;
            if (requestManager != null) {
                return requestManager;
            }
            Glide glide = Glide.get(activity);
            RequestManagerFactory requestManagerFactory = this.factory;
            ActivityFragmentLifecycle activityFragmentLifecycle = requestManagerFragment.lifecycle;
            RequestManagerTreeNode requestManagerTreeNode = requestManagerFragment.requestManagerTreeNode;
            Objects.requireNonNull((AnonymousClass1) requestManagerFactory);
            RequestManager requestManager2 = new RequestManager(glide, activityFragmentLifecycle, requestManagerTreeNode, activity);
            requestManagerFragment.requestManager = requestManager2;
            return requestManager2;
        }
        throw new IllegalArgumentException("You cannot start a load for a destroyed activity");
    }
}
