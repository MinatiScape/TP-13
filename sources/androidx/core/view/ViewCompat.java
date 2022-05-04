package androidx.core.view;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.os.Build;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.ViewParent;
import android.view.WindowInsets;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import androidx.core.view.AccessibilityDelegateCompat;
import androidx.core.view.accessibility.AccessibilityNodeInfoCompat;
import androidx.core.view.accessibility.AccessibilityViewCommand;
import com.android.systemui.shared.R;
import com.android.systemui.shared.system.QuickStepContract;
import java.util.ArrayList;
import java.util.List;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicInteger;
@SuppressLint({"PrivateConstructorForUtilityClass"})
/* loaded from: classes.dex */
public class ViewCompat {
    public static WeakHashMap<View, ViewPropertyAnimatorCompat> sViewPropertyAnimatorMap = null;
    public static boolean sAccessibilityDelegateCheckFailed = false;
    public static final int[] ACCESSIBILITY_ACTIONS_RESOURCE_IDS = {R.id.accessibility_custom_action_0, R.id.accessibility_custom_action_1, R.id.accessibility_custom_action_2, R.id.accessibility_custom_action_3, R.id.accessibility_custom_action_4, R.id.accessibility_custom_action_5, R.id.accessibility_custom_action_6, R.id.accessibility_custom_action_7, R.id.accessibility_custom_action_8, R.id.accessibility_custom_action_9, R.id.accessibility_custom_action_10, R.id.accessibility_custom_action_11, R.id.accessibility_custom_action_12, R.id.accessibility_custom_action_13, R.id.accessibility_custom_action_14, R.id.accessibility_custom_action_15, R.id.accessibility_custom_action_16, R.id.accessibility_custom_action_17, R.id.accessibility_custom_action_18, R.id.accessibility_custom_action_19, R.id.accessibility_custom_action_20, R.id.accessibility_custom_action_21, R.id.accessibility_custom_action_22, R.id.accessibility_custom_action_23, R.id.accessibility_custom_action_24, R.id.accessibility_custom_action_25, R.id.accessibility_custom_action_26, R.id.accessibility_custom_action_27, R.id.accessibility_custom_action_28, R.id.accessibility_custom_action_29, R.id.accessibility_custom_action_30, R.id.accessibility_custom_action_31};
    public static final OnReceiveContentViewBehavior NO_OP_ON_RECEIVE_CONTENT_VIEW_BEHAVIOR = new OnReceiveContentViewBehavior() { // from class: androidx.core.view.ViewCompat.1
        @Override // androidx.core.view.OnReceiveContentViewBehavior
        public ContentInfoCompat onReceiveContent(ContentInfoCompat payload) {
            return payload;
        }
    };

    /* renamed from: androidx.core.view.ViewCompat$4  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass4 extends AccessibilityViewProperty<CharSequence> {
        public AnonymousClass4(int tagKey, Class type, int contentChangeType, int frameworkMinimumSdk) {
            super(tagKey, type, contentChangeType, frameworkMinimumSdk);
        }

        @Override // androidx.core.view.ViewCompat.AccessibilityViewProperty
        public CharSequence frameworkGet(View view) {
            return view.getStateDescription();
        }

        @Override // androidx.core.view.ViewCompat.AccessibilityViewProperty
        public void frameworkSet(View view, CharSequence value) {
            view.setStateDescription(value);
        }

        @Override // androidx.core.view.ViewCompat.AccessibilityViewProperty
        public boolean shouldUpdate(CharSequence oldValue, CharSequence newValue) {
            return !TextUtils.equals(oldValue, newValue);
        }
    }

    /* loaded from: classes.dex */
    public static class Api21Impl {
        public static WindowInsetsCompat computeSystemWindowInsets(View v, WindowInsetsCompat insets, Rect outLocalInsets) {
            WindowInsets windowInsets = insets.toWindowInsets();
            if (windowInsets != null) {
                return WindowInsetsCompat.toWindowInsetsCompat(v.computeSystemWindowInsets(windowInsets, outLocalInsets), v);
            }
            outLocalInsets.setEmpty();
            return insets;
        }

        public static void setOnApplyWindowInsetsListener(final View v, final OnApplyWindowInsetsListener listener) {
            if (listener == null) {
                v.setOnApplyWindowInsetsListener((View.OnApplyWindowInsetsListener) v.getTag(R.id.tag_window_insets_animation_callback));
            } else {
                v.setOnApplyWindowInsetsListener(new View.OnApplyWindowInsetsListener(v, listener) { // from class: androidx.core.view.ViewCompat.Api21Impl.1
                    public final /* synthetic */ OnApplyWindowInsetsListener val$listener;

                    {
                        this.val$listener = listener;
                    }

                    @Override // android.view.View.OnApplyWindowInsetsListener
                    public WindowInsets onApplyWindowInsets(final View view, final WindowInsets insets) {
                        return this.val$listener.onApplyWindowInsets(view, WindowInsetsCompat.toWindowInsetsCompat(insets, view)).toWindowInsets();
                    }
                });
            }
        }
    }

    /* loaded from: classes.dex */
    public static class Api23Impl {
        public static WindowInsetsCompat getRootWindowInsets(View v) {
            WindowInsets rootWindowInsets = v.getRootWindowInsets();
            if (rootWindowInsets == null) {
                return null;
            }
            WindowInsetsCompat windowInsetsCompat = WindowInsetsCompat.toWindowInsetsCompat(rootWindowInsets, null);
            windowInsetsCompat.mImpl.setRootWindowInsets(windowInsetsCompat);
            windowInsetsCompat.mImpl.copyRootViewBounds(v.getRootView());
            return windowInsetsCompat;
        }
    }

    /* loaded from: classes.dex */
    public static class Api29Impl {
        public static void saveAttributeDataForStyleable(View view, Context context, int[] styleable, AttributeSet attrs, TypedArray t, int defStyleAttr, int defStyleRes) {
            view.saveAttributeDataForStyleable(context, styleable, attrs, t, defStyleAttr, defStyleRes);
        }
    }

    static {
        new AtomicInteger(1);
        new WeakHashMap();
    }

    public static void addAccessibilityAction(View view, AccessibilityNodeInfoCompat.AccessibilityActionCompat action) {
        AccessibilityDelegateCompat accessibilityDelegate = getAccessibilityDelegate(view);
        if (accessibilityDelegate == null) {
            accessibilityDelegate = new AccessibilityDelegateCompat();
        }
        setAccessibilityDelegate(view, accessibilityDelegate);
        removeActionWithId(action.getId(), view);
        getActionList(view).add(action);
        notifyViewAccessibilityStateChangedIfNeeded(view, 0);
    }

    public static ViewPropertyAnimatorCompat animate(View view) {
        if (sViewPropertyAnimatorMap == null) {
            sViewPropertyAnimatorMap = new WeakHashMap<>();
        }
        ViewPropertyAnimatorCompat viewPropertyAnimatorCompat = sViewPropertyAnimatorMap.get(view);
        if (viewPropertyAnimatorCompat != null) {
            return viewPropertyAnimatorCompat;
        }
        ViewPropertyAnimatorCompat viewPropertyAnimatorCompat2 = new ViewPropertyAnimatorCompat(view);
        sViewPropertyAnimatorMap.put(view, viewPropertyAnimatorCompat2);
        return viewPropertyAnimatorCompat2;
    }

    public static WindowInsetsCompat dispatchApplyWindowInsets(View view, WindowInsetsCompat insets) {
        WindowInsets windowInsets = insets.toWindowInsets();
        if (windowInsets != null) {
            WindowInsets dispatchApplyWindowInsets = view.dispatchApplyWindowInsets(windowInsets);
            if (!dispatchApplyWindowInsets.equals(windowInsets)) {
                return WindowInsetsCompat.toWindowInsetsCompat(dispatchApplyWindowInsets, view);
            }
        }
        return insets;
    }

    public static AccessibilityDelegateCompat getAccessibilityDelegate(View view) {
        View.AccessibilityDelegate accessibilityDelegate = view.getAccessibilityDelegate();
        if (accessibilityDelegate == null) {
            return null;
        }
        if (accessibilityDelegate instanceof AccessibilityDelegateCompat.AccessibilityDelegateAdapter) {
            return ((AccessibilityDelegateCompat.AccessibilityDelegateAdapter) accessibilityDelegate).mCompat;
        }
        return new AccessibilityDelegateCompat(accessibilityDelegate);
    }

    public static CharSequence getAccessibilityPaneTitle(View view) {
        return view.getAccessibilityPaneTitle();
    }

    public static List<AccessibilityNodeInfoCompat.AccessibilityActionCompat> getActionList(View view) {
        ArrayList arrayList = (ArrayList) view.getTag(R.id.tag_accessibility_actions);
        if (arrayList != null) {
            return arrayList;
        }
        ArrayList arrayList2 = new ArrayList();
        view.setTag(R.id.tag_accessibility_actions, arrayList2);
        return arrayList2;
    }

    public static String[] getOnReceiveContentMimeTypes(View view) {
        return (String[]) view.getTag(R.id.tag_on_receive_content_mime_types);
    }

    public static void notifyViewAccessibilityStateChangedIfNeeded(View view, int changeType) {
        AccessibilityManager accessibilityManager = (AccessibilityManager) view.getContext().getSystemService("accessibility");
        if (accessibilityManager.isEnabled()) {
            boolean z = getAccessibilityPaneTitle(view) != null && view.getVisibility() == 0;
            int i = 32;
            if (view.getAccessibilityLiveRegion() != 0 || z) {
                AccessibilityEvent obtain = AccessibilityEvent.obtain();
                if (!z) {
                    i = QuickStepContract.SYSUI_STATE_QUICK_SETTINGS_EXPANDED;
                }
                obtain.setEventType(i);
                obtain.setContentChangeTypes(changeType);
                if (z) {
                    obtain.getText().add(getAccessibilityPaneTitle(view));
                    if (view.getImportantForAccessibility() == 0) {
                        view.setImportantForAccessibility(1);
                    }
                    ViewParent parent = view.getParent();
                    while (true) {
                        if (!(parent instanceof View)) {
                            break;
                        } else if (((View) parent).getImportantForAccessibility() == 4) {
                            view.setImportantForAccessibility(2);
                            break;
                        } else {
                            parent = parent.getParent();
                        }
                    }
                }
                view.sendAccessibilityEventUnchecked(obtain);
            } else if (changeType == 32) {
                AccessibilityEvent obtain2 = AccessibilityEvent.obtain();
                view.onInitializeAccessibilityEvent(obtain2);
                obtain2.setEventType(32);
                obtain2.setContentChangeTypes(changeType);
                obtain2.setSource(view);
                view.onPopulateAccessibilityEvent(obtain2);
                obtain2.getText().add(getAccessibilityPaneTitle(view));
                accessibilityManager.sendAccessibilityEvent(obtain2);
            } else if (view.getParent() != null) {
                try {
                    view.getParent().notifySubtreeAccessibilityStateChanged(view, view, changeType);
                } catch (AbstractMethodError e) {
                    Log.e("ViewCompat", view.getParent().getClass().getSimpleName() + " does not fully implement ViewParent", e);
                }
            }
        }
    }

    public static WindowInsetsCompat onApplyWindowInsets(View view, WindowInsetsCompat insets) {
        WindowInsets windowInsets = insets.toWindowInsets();
        if (windowInsets != null) {
            WindowInsets onApplyWindowInsets = view.onApplyWindowInsets(windowInsets);
            if (!onApplyWindowInsets.equals(windowInsets)) {
                return WindowInsetsCompat.toWindowInsetsCompat(onApplyWindowInsets, view);
            }
        }
        return insets;
    }

    public static ContentInfoCompat performReceiveContent(View view, ContentInfoCompat payload) {
        OnReceiveContentViewBehavior onReceiveContentViewBehavior;
        OnReceiveContentViewBehavior onReceiveContentViewBehavior2;
        if (Log.isLoggable("ViewCompat", 3)) {
            Log.d("ViewCompat", "performReceiveContent: " + payload + ", view=" + view.getClass().getSimpleName() + "[" + view.getId() + "]");
        }
        OnReceiveContentListener onReceiveContentListener = (OnReceiveContentListener) view.getTag(R.id.tag_on_receive_content_listener);
        if (onReceiveContentListener != null) {
            ContentInfoCompat onReceiveContent = onReceiveContentListener.onReceiveContent(view, payload);
            if (onReceiveContent == null) {
                return null;
            }
            if (view instanceof OnReceiveContentViewBehavior) {
                onReceiveContentViewBehavior2 = (OnReceiveContentViewBehavior) view;
            } else {
                onReceiveContentViewBehavior2 = NO_OP_ON_RECEIVE_CONTENT_VIEW_BEHAVIOR;
            }
            return onReceiveContentViewBehavior2.onReceiveContent(onReceiveContent);
        }
        if (view instanceof OnReceiveContentViewBehavior) {
            onReceiveContentViewBehavior = (OnReceiveContentViewBehavior) view;
        } else {
            onReceiveContentViewBehavior = NO_OP_ON_RECEIVE_CONTENT_VIEW_BEHAVIOR;
        }
        return onReceiveContentViewBehavior.onReceiveContent(payload);
    }

    public static void removeAccessibilityAction(View view, int actionId) {
        removeActionWithId(actionId, view);
        notifyViewAccessibilityStateChangedIfNeeded(view, 0);
    }

    public static void removeActionWithId(int actionId, View view) {
        List<AccessibilityNodeInfoCompat.AccessibilityActionCompat> actionList = getActionList(view);
        for (int i = 0; i < actionList.size(); i++) {
            if (actionList.get(i).getId() == actionId) {
                actionList.remove(i);
                return;
            }
        }
    }

    public static void replaceAccessibilityAction(View view, AccessibilityNodeInfoCompat.AccessibilityActionCompat replacedAction, CharSequence label, AccessibilityViewCommand command) {
        if (command == null) {
            removeActionWithId(replacedAction.getId(), view);
            notifyViewAccessibilityStateChangedIfNeeded(view, 0);
            return;
        }
        addAccessibilityAction(view, new AccessibilityNodeInfoCompat.AccessibilityActionCompat(null, replacedAction.mId, null, command, replacedAction.mViewCommandArgumentClass));
    }

    public static void setAccessibilityDelegate(View v, AccessibilityDelegateCompat delegate) {
        if (delegate == null && (v.getAccessibilityDelegate() instanceof AccessibilityDelegateCompat.AccessibilityDelegateAdapter)) {
            delegate = new AccessibilityDelegateCompat();
        }
        v.setAccessibilityDelegate(delegate == null ? null : delegate.mBridge);
    }

    /* loaded from: classes.dex */
    public static abstract class AccessibilityViewProperty<T> {
        public final int mContentChangeType;
        public final int mFrameworkMinimumSdk;
        public final int mTagKey;
        public final Class<T> mType;

        public AccessibilityViewProperty(int tagKey, Class<T> type, int frameworkMinimumSdk) {
            this.mTagKey = tagKey;
            this.mType = type;
            this.mContentChangeType = 0;
            this.mFrameworkMinimumSdk = frameworkMinimumSdk;
        }

        public boolean booleanNullToFalseEquals(Boolean a, Boolean b) {
            boolean z;
            boolean booleanValue = a == null ? false : a.booleanValue();
            if (b == null) {
                z = false;
            } else {
                z = b.booleanValue();
            }
            return booleanValue == z;
        }

        public abstract T frameworkGet(View view);

        public abstract void frameworkSet(View view, T value);

        public T get(View view) {
            if (Build.VERSION.SDK_INT >= this.mFrameworkMinimumSdk) {
                return frameworkGet(view);
            }
            T t = (T) view.getTag(this.mTagKey);
            if (this.mType.isInstance(t)) {
                return t;
            }
            return null;
        }

        public void set(View view, T value) {
            if (Build.VERSION.SDK_INT >= this.mFrameworkMinimumSdk) {
                frameworkSet(view, value);
            } else if (shouldUpdate(get(view), value)) {
                AccessibilityDelegateCompat accessibilityDelegate = ViewCompat.getAccessibilityDelegate(view);
                if (accessibilityDelegate == null) {
                    accessibilityDelegate = new AccessibilityDelegateCompat();
                }
                ViewCompat.setAccessibilityDelegate(view, accessibilityDelegate);
                view.setTag(this.mTagKey, value);
                ViewCompat.notifyViewAccessibilityStateChangedIfNeeded(view, this.mContentChangeType);
            }
        }

        public abstract boolean shouldUpdate(T oldValue, T newValue);

        public AccessibilityViewProperty(int tagKey, Class<T> type, int contentChangeType, int frameworkMinimumSdk) {
            this.mTagKey = tagKey;
            this.mType = type;
            this.mContentChangeType = contentChangeType;
            this.mFrameworkMinimumSdk = frameworkMinimumSdk;
        }
    }
}
