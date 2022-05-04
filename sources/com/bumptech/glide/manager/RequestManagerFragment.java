package com.bumptech.glide.manager;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.Fragment;
import android.util.Log;
import com.bumptech.glide.Glide;
import com.bumptech.glide.RequestManager;
import java.util.HashSet;
@Deprecated
/* loaded from: classes.dex */
public final class RequestManagerFragment extends Fragment {
    public final HashSet childRequestManagerFragments;
    public final ActivityFragmentLifecycle lifecycle;
    public Fragment parentFragmentHint;
    public RequestManager requestManager;
    public final FragmentRequestManagerTreeNode requestManagerTreeNode;
    public RequestManagerFragment rootRequestManagerFragment;

    /* loaded from: classes.dex */
    public class FragmentRequestManagerTreeNode implements RequestManagerTreeNode {
        public FragmentRequestManagerTreeNode() {
        }

        public final String toString() {
            return super.toString() + "{fragment=" + RequestManagerFragment.this + "}";
        }
    }

    public RequestManagerFragment() {
        this(new ActivityFragmentLifecycle());
    }

    @SuppressLint({"ValidFragment"})
    public RequestManagerFragment(ActivityFragmentLifecycle activityFragmentLifecycle) {
        this.requestManagerTreeNode = new FragmentRequestManagerTreeNode();
        this.childRequestManagerFragments = new HashSet();
        this.lifecycle = activityFragmentLifecycle;
    }

    public final void registerFragmentWithRoot(Activity activity) {
        RequestManagerFragment requestManagerFragment = this.rootRequestManagerFragment;
        if (requestManagerFragment != null) {
            requestManagerFragment.childRequestManagerFragments.remove(this);
            this.rootRequestManagerFragment = null;
        }
        RequestManagerRetriever requestManagerRetriever = Glide.get(activity).requestManagerRetriever;
        requestManagerRetriever.getClass();
        RequestManagerFragment requestManagerFragment2 = requestManagerRetriever.getRequestManagerFragment(activity.getFragmentManager());
        this.rootRequestManagerFragment = requestManagerFragment2;
        if (!equals(requestManagerFragment2)) {
            this.rootRequestManagerFragment.childRequestManagerFragments.add(this);
        }
    }

    @Override // android.app.Fragment
    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString());
        sb.append("{parent=");
        Fragment parentFragment = getParentFragment();
        if (parentFragment == null) {
            parentFragment = this.parentFragmentHint;
        }
        sb.append(parentFragment);
        sb.append("}");
        return sb.toString();
    }

    @Override // android.app.Fragment
    public final void onAttach(Activity activity) {
        super.onAttach(activity);
        try {
            registerFragmentWithRoot(activity);
        } catch (IllegalStateException e) {
            if (Log.isLoggable("RMFragment", 5)) {
                Log.w("RMFragment", "Unable to register fragment with root", e);
            }
        }
    }

    @Override // android.app.Fragment
    public final void onDestroy() {
        super.onDestroy();
        this.lifecycle.onDestroy();
        RequestManagerFragment requestManagerFragment = this.rootRequestManagerFragment;
        if (requestManagerFragment != null) {
            requestManagerFragment.childRequestManagerFragments.remove(this);
            this.rootRequestManagerFragment = null;
        }
    }

    @Override // android.app.Fragment
    public final void onDetach() {
        super.onDetach();
        RequestManagerFragment requestManagerFragment = this.rootRequestManagerFragment;
        if (requestManagerFragment != null) {
            requestManagerFragment.childRequestManagerFragments.remove(this);
            this.rootRequestManagerFragment = null;
        }
    }

    @Override // android.app.Fragment
    public final void onStart() {
        super.onStart();
        this.lifecycle.onStart();
    }

    @Override // android.app.Fragment
    public final void onStop() {
        super.onStop();
        this.lifecycle.onStop();
    }
}
