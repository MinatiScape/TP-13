package com.bumptech.glide.manager;

import android.annotation.SuppressLint;
import android.content.Context;
import android.util.Log;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import com.bumptech.glide.Glide;
import com.bumptech.glide.RequestManager;
import java.util.HashSet;
/* loaded from: classes.dex */
public class SupportRequestManagerFragment extends Fragment {
    public final HashSet childRequestManagerFragments;
    public final ActivityFragmentLifecycle lifecycle;
    public Fragment parentFragmentHint;
    public RequestManager requestManager;
    public final SupportFragmentRequestManagerTreeNode requestManagerTreeNode;
    public SupportRequestManagerFragment rootRequestManagerFragment;

    /* loaded from: classes.dex */
    public class SupportFragmentRequestManagerTreeNode implements RequestManagerTreeNode {
        public SupportFragmentRequestManagerTreeNode() {
        }

        public final String toString() {
            return super.toString() + "{fragment=" + SupportRequestManagerFragment.this + "}";
        }
    }

    public SupportRequestManagerFragment() {
        this(new ActivityFragmentLifecycle());
    }

    @Override // androidx.fragment.app.Fragment
    public final void onDestroy() {
        this.mCalled = true;
        this.lifecycle.onDestroy();
        SupportRequestManagerFragment supportRequestManagerFragment = this.rootRequestManagerFragment;
        if (supportRequestManagerFragment != null) {
            supportRequestManagerFragment.childRequestManagerFragments.remove(this);
            this.rootRequestManagerFragment = null;
        }
    }

    @Override // androidx.fragment.app.Fragment
    public final void onDetach() {
        this.mCalled = true;
        this.parentFragmentHint = null;
        SupportRequestManagerFragment supportRequestManagerFragment = this.rootRequestManagerFragment;
        if (supportRequestManagerFragment != null) {
            supportRequestManagerFragment.childRequestManagerFragments.remove(this);
            this.rootRequestManagerFragment = null;
        }
    }

    @Override // androidx.fragment.app.Fragment
    public final void onStart() {
        this.mCalled = true;
        this.lifecycle.onStart();
    }

    @Override // androidx.fragment.app.Fragment
    public final void onStop() {
        this.mCalled = true;
        this.lifecycle.onStop();
    }

    @SuppressLint({"ValidFragment"})
    public SupportRequestManagerFragment(ActivityFragmentLifecycle activityFragmentLifecycle) {
        this.requestManagerTreeNode = new SupportFragmentRequestManagerTreeNode();
        this.childRequestManagerFragments = new HashSet();
        this.lifecycle = activityFragmentLifecycle;
    }

    public final void registerFragmentWithRoot(Context context, FragmentManager fragmentManager) {
        SupportRequestManagerFragment supportRequestManagerFragment = this.rootRequestManagerFragment;
        if (supportRequestManagerFragment != null) {
            supportRequestManagerFragment.childRequestManagerFragments.remove(this);
            this.rootRequestManagerFragment = null;
        }
        SupportRequestManagerFragment supportRequestManagerFragment2 = Glide.get(context).requestManagerRetriever.getSupportRequestManagerFragment(fragmentManager);
        this.rootRequestManagerFragment = supportRequestManagerFragment2;
        if (!equals(supportRequestManagerFragment2)) {
            this.rootRequestManagerFragment.childRequestManagerFragments.add(this);
        }
    }

    @Override // androidx.fragment.app.Fragment
    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString());
        sb.append("{parent=");
        Fragment fragment = this.mParentFragment;
        if (fragment == null) {
            fragment = this.parentFragmentHint;
        }
        sb.append(fragment);
        sb.append("}");
        return sb.toString();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0, types: [androidx.fragment.app.Fragment] */
    @Override // androidx.fragment.app.Fragment
    public final void onAttach(Context context) {
        super.onAttach(context);
        SupportRequestManagerFragment supportRequestManagerFragment = this;
        while (true) {
            ?? r0 = supportRequestManagerFragment.mParentFragment;
            if (r0 == 0) {
                break;
            }
            supportRequestManagerFragment = r0;
        }
        FragmentManager fragmentManager = supportRequestManagerFragment.mFragmentManager;
        if (fragmentManager != null) {
            try {
                registerFragmentWithRoot(getContext(), fragmentManager);
            } catch (IllegalStateException e) {
                if (Log.isLoggable("SupportRMFragment", 5)) {
                    Log.w("SupportRMFragment", "Unable to register fragment with root", e);
                }
            }
        } else if (Log.isLoggable("SupportRMFragment", 5)) {
            Log.w("SupportRMFragment", "Unable to register fragment with root, ancestor detached");
        }
    }
}
