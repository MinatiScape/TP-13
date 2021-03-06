package androidx.fragment.app;

import android.app.Activity;
import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.concurrent.futures.AbstractResolvableFuture$$ExternalSyntheticOutline0;
import androidx.fragment.R$styleable;
import androidx.fragment.app.strictmode.FragmentStrictMode;
/* loaded from: classes.dex */
public final class FragmentLayoutInflaterFactory implements LayoutInflater.Factory2 {
    public final FragmentManager mFragmentManager;

    @Override // android.view.LayoutInflater.Factory
    public final View onCreateView(String str, Context context, AttributeSet attributeSet) {
        return onCreateView(null, str, context, attributeSet);
    }

    @Override // android.view.LayoutInflater.Factory2
    public final View onCreateView(View view, String str, Context context, AttributeSet attributeSet) {
        boolean z;
        final FragmentStateManager fragmentStateManager;
        if (FragmentContainerView.class.getName().equals(str)) {
            return new FragmentContainerView(context, attributeSet, this.mFragmentManager);
        }
        Activity activity = null;
        if (!"fragment".equals(str)) {
            return null;
        }
        String attributeValue = attributeSet.getAttributeValue(null, "class");
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R$styleable.Fragment);
        int i = 0;
        if (attributeValue == null) {
            attributeValue = obtainStyledAttributes.getString(0);
        }
        int resourceId = obtainStyledAttributes.getResourceId(1, -1);
        String string = obtainStyledAttributes.getString(2);
        obtainStyledAttributes.recycle();
        if (attributeValue != null) {
            try {
                z = Fragment.class.isAssignableFrom(FragmentFactory.loadClass(context.getClassLoader(), attributeValue));
            } catch (ClassNotFoundException unused) {
                z = false;
            }
            if (z) {
                if (view != null) {
                    i = view.getId();
                }
                if (i == -1 && resourceId == -1 && string == null) {
                    throw new IllegalArgumentException(attributeSet.getPositionDescription() + ": Must specify unique android:id, android:tag, or have a parent with an id for " + attributeValue);
                }
                Fragment findFragmentById = resourceId != -1 ? this.mFragmentManager.findFragmentById(resourceId) : null;
                if (findFragmentById == null && string != null) {
                    findFragmentById = this.mFragmentManager.findFragmentByTag(string);
                }
                if (findFragmentById == null && i != -1) {
                    findFragmentById = this.mFragmentManager.findFragmentById(i);
                }
                if (findFragmentById == null) {
                    FragmentFactory fragmentFactory = this.mFragmentManager.getFragmentFactory();
                    context.getClassLoader();
                    findFragmentById = fragmentFactory.instantiate(attributeValue);
                    findFragmentById.mFromLayout = true;
                    findFragmentById.mFragmentId = resourceId != 0 ? resourceId : i;
                    findFragmentById.mContainerId = i;
                    findFragmentById.mTag = string;
                    findFragmentById.mInLayout = true;
                    FragmentManager fragmentManager = this.mFragmentManager;
                    findFragmentById.mFragmentManager = fragmentManager;
                    FragmentHostCallback<?> fragmentHostCallback = fragmentManager.mHost;
                    findFragmentById.mHost = fragmentHostCallback;
                    Context context2 = fragmentHostCallback.mContext;
                    findFragmentById.mCalled = true;
                    if (fragmentHostCallback != null) {
                        activity = fragmentHostCallback.mActivity;
                    }
                    if (activity != null) {
                        findFragmentById.mCalled = true;
                    }
                    fragmentStateManager = fragmentManager.addFragment(findFragmentById);
                    if (FragmentManager.isLoggingEnabled(2)) {
                        Log.v("FragmentManager", "Fragment " + findFragmentById + " has been inflated via the <fragment> tag: id=0x" + Integer.toHexString(resourceId));
                    }
                } else if (!findFragmentById.mInLayout) {
                    findFragmentById.mInLayout = true;
                    FragmentManager fragmentManager2 = this.mFragmentManager;
                    findFragmentById.mFragmentManager = fragmentManager2;
                    FragmentHostCallback<?> fragmentHostCallback2 = fragmentManager2.mHost;
                    findFragmentById.mHost = fragmentHostCallback2;
                    Context context3 = fragmentHostCallback2.mContext;
                    findFragmentById.mCalled = true;
                    if (fragmentHostCallback2 != null) {
                        activity = fragmentHostCallback2.mActivity;
                    }
                    if (activity != null) {
                        findFragmentById.mCalled = true;
                    }
                    fragmentStateManager = fragmentManager2.createOrGetFragmentStateManager(findFragmentById);
                    if (FragmentManager.isLoggingEnabled(2)) {
                        Log.v("FragmentManager", "Retained Fragment " + findFragmentById + " has been re-attached via the <fragment> tag: id=0x" + Integer.toHexString(resourceId));
                    }
                } else {
                    throw new IllegalArgumentException(attributeSet.getPositionDescription() + ": Duplicate id 0x" + Integer.toHexString(resourceId) + ", tag " + string + ", or parent id 0x" + Integer.toHexString(i) + " with another fragment for " + attributeValue);
                }
                ViewGroup viewGroup = (ViewGroup) view;
                FragmentStrictMode.onFragmentTagUsage(findFragmentById, viewGroup);
                findFragmentById.mContainer = viewGroup;
                fragmentStateManager.moveToExpectedState();
                fragmentStateManager.ensureInflatedView();
                View view2 = findFragmentById.mView;
                if (view2 != null) {
                    if (resourceId != 0) {
                        view2.setId(resourceId);
                    }
                    if (findFragmentById.mView.getTag() == null) {
                        findFragmentById.mView.setTag(string);
                    }
                    findFragmentById.mView.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() { // from class: androidx.fragment.app.FragmentLayoutInflaterFactory.1
                        @Override // android.view.View.OnAttachStateChangeListener
                        public final void onViewDetachedFromWindow(View view3) {
                        }

                        @Override // android.view.View.OnAttachStateChangeListener
                        public final void onViewAttachedToWindow(View view3) {
                            FragmentStateManager fragmentStateManager2 = fragmentStateManager;
                            Fragment fragment = fragmentStateManager2.mFragment;
                            fragmentStateManager2.moveToExpectedState();
                            SpecialEffectsController.getOrCreateController((ViewGroup) fragment.mView.getParent(), FragmentLayoutInflaterFactory.this.mFragmentManager.getSpecialEffectsControllerFactory()).forceCompleteAllOperations();
                        }
                    });
                    return findFragmentById.mView;
                }
                throw new IllegalStateException(AbstractResolvableFuture$$ExternalSyntheticOutline0.m("Fragment ", attributeValue, " did not create a view."));
            }
        }
        return null;
    }

    public FragmentLayoutInflaterFactory(FragmentManager fragmentManager) {
        this.mFragmentManager = fragmentManager;
    }
}
