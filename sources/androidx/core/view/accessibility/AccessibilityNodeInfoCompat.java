package androidx.core.view.accessibility;

import android.graphics.Rect;
import android.os.Bundle;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.style.ClickableSpan;
import android.view.accessibility.AccessibilityNodeInfo;
import androidx.core.view.accessibility.AccessibilityViewCommand;
import com.android.systemui.shared.system.QuickStepContract;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
/* loaded from: classes.dex */
public class AccessibilityNodeInfoCompat {
    public final AccessibilityNodeInfo mInfo;
    public int mParentVirtualDescendantId = -1;
    public int mVirtualDescendantId = -1;

    /* loaded from: classes.dex */
    public static class AccessibilityActionCompat {
        public final Object mAction;
        public final AccessibilityViewCommand mCommand;
        public final int mId;
        public final Class<? extends AccessibilityViewCommand.CommandArguments> mViewCommandArgumentClass;
        public static final AccessibilityActionCompat ACTION_CLICK = new AccessibilityActionCompat(16, null);
        public static final AccessibilityActionCompat ACTION_SCROLL_FORWARD = new AccessibilityActionCompat(QuickStepContract.SYSUI_STATE_TRACING_ENABLED, null);
        public static final AccessibilityActionCompat ACTION_SCROLL_BACKWARD = new AccessibilityActionCompat(QuickStepContract.SYSUI_STATE_ASSIST_GESTURE_CONSTRAINED, null);
        public static final AccessibilityActionCompat ACTION_EXPAND = new AccessibilityActionCompat(QuickStepContract.SYSUI_STATE_IME_SHOWING, null);
        public static final AccessibilityActionCompat ACTION_COLLAPSE = new AccessibilityActionCompat(QuickStepContract.SYSUI_STATE_MAGNIFICATION_OVERLAP, null);
        public static final AccessibilityActionCompat ACTION_DISMISS = new AccessibilityActionCompat(QuickStepContract.SYSUI_STATE_IME_SWITCHER_SHOWING, null);
        public static final AccessibilityActionCompat ACTION_SCROLL_UP = new AccessibilityActionCompat(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_UP, 16908344, null, null, null);
        public static final AccessibilityActionCompat ACTION_SCROLL_DOWN = new AccessibilityActionCompat(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_DOWN, 16908346, null, null, null);

        static {
            new AccessibilityActionCompat(1, null);
            new AccessibilityActionCompat(2, null);
            new AccessibilityActionCompat(4, null);
            new AccessibilityActionCompat(8, null);
            new AccessibilityActionCompat(32, null);
            new AccessibilityActionCompat(64, null);
            new AccessibilityActionCompat(128, null);
            new AccessibilityActionCompat(256, null, AccessibilityViewCommand.MoveAtGranularityArguments.class);
            new AccessibilityActionCompat(QuickStepContract.SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING_OCCLUDED, null, AccessibilityViewCommand.MoveAtGranularityArguments.class);
            new AccessibilityActionCompat(QuickStepContract.SYSUI_STATE_SEARCH_DISABLED, null, AccessibilityViewCommand.MoveHtmlArguments.class);
            new AccessibilityActionCompat(QuickStepContract.SYSUI_STATE_QUICK_SETTINGS_EXPANDED, null, AccessibilityViewCommand.MoveHtmlArguments.class);
            new AccessibilityActionCompat(QuickStepContract.SYSUI_STATE_BUBBLES_EXPANDED, null);
            new AccessibilityActionCompat(QuickStepContract.SYSUI_STATE_GLOBAL_ACTIONS_SHOWING, null);
            new AccessibilityActionCompat(QuickStepContract.SYSUI_STATE_ONE_HANDED_ACTIVE, null);
            new AccessibilityActionCompat(QuickStepContract.SYSUI_STATE_ALLOW_GESTURE_IGNORING_BAR_VISIBILITY, null, AccessibilityViewCommand.SetSelectionArguments.class);
            new AccessibilityActionCompat(QuickStepContract.SYSUI_STATE_DEVICE_DOZING, null, AccessibilityViewCommand.SetTextArguments.class);
            new AccessibilityActionCompat(AccessibilityNodeInfo.AccessibilityAction.ACTION_SHOW_ON_SCREEN, 16908342, null, null, null);
            new AccessibilityActionCompat(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_TO_POSITION, 16908343, null, null, AccessibilityViewCommand.ScrollToPositionArguments.class);
            new AccessibilityActionCompat(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_LEFT, 16908345, null, null, null);
            new AccessibilityActionCompat(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_RIGHT, 16908347, null, null, null);
            new AccessibilityActionCompat(AccessibilityNodeInfo.AccessibilityAction.ACTION_PAGE_UP, 16908358, null, null, null);
            new AccessibilityActionCompat(AccessibilityNodeInfo.AccessibilityAction.ACTION_PAGE_DOWN, 16908359, null, null, null);
            new AccessibilityActionCompat(AccessibilityNodeInfo.AccessibilityAction.ACTION_PAGE_LEFT, 16908360, null, null, null);
            new AccessibilityActionCompat(AccessibilityNodeInfo.AccessibilityAction.ACTION_PAGE_RIGHT, 16908361, null, null, null);
            new AccessibilityActionCompat(AccessibilityNodeInfo.AccessibilityAction.ACTION_CONTEXT_CLICK, 16908348, null, null, null);
            new AccessibilityActionCompat(AccessibilityNodeInfo.AccessibilityAction.ACTION_SET_PROGRESS, 16908349, null, null, AccessibilityViewCommand.SetProgressArguments.class);
            new AccessibilityActionCompat(AccessibilityNodeInfo.AccessibilityAction.ACTION_MOVE_WINDOW, 16908354, null, null, AccessibilityViewCommand.MoveWindowArguments.class);
            new AccessibilityActionCompat(AccessibilityNodeInfo.AccessibilityAction.ACTION_SHOW_TOOLTIP, 16908356, null, null, null);
            new AccessibilityActionCompat(AccessibilityNodeInfo.AccessibilityAction.ACTION_HIDE_TOOLTIP, 16908357, null, null, null);
            new AccessibilityActionCompat(AccessibilityNodeInfo.AccessibilityAction.ACTION_PRESS_AND_HOLD, 16908362, null, null, null);
            new AccessibilityActionCompat(AccessibilityNodeInfo.AccessibilityAction.ACTION_IME_ENTER, 16908372, null, null, null);
        }

        public AccessibilityActionCompat(int actionId, CharSequence label) {
            this(null, actionId, null, null, null);
        }

        public boolean equals(Object obj) {
            if (obj == null || !(obj instanceof AccessibilityActionCompat)) {
                return false;
            }
            AccessibilityActionCompat accessibilityActionCompat = (AccessibilityActionCompat) obj;
            Object obj2 = this.mAction;
            return obj2 == null ? accessibilityActionCompat.mAction == null : obj2.equals(accessibilityActionCompat.mAction);
        }

        public int getId() {
            return ((AccessibilityNodeInfo.AccessibilityAction) this.mAction).getId();
        }

        public CharSequence getLabel() {
            return ((AccessibilityNodeInfo.AccessibilityAction) this.mAction).getLabel();
        }

        public int hashCode() {
            Object obj = this.mAction;
            if (obj != null) {
                return obj.hashCode();
            }
            return 0;
        }

        public AccessibilityActionCompat(int actionId, CharSequence label, Class<? extends AccessibilityViewCommand.CommandArguments> viewCommandArgumentClass) {
            this(null, actionId, null, null, viewCommandArgumentClass);
        }

        public AccessibilityActionCompat(Object action, int id, CharSequence label, AccessibilityViewCommand command, Class<? extends AccessibilityViewCommand.CommandArguments> viewCommandArgumentClass) {
            this.mId = id;
            this.mCommand = command;
            if (action == null) {
                this.mAction = new AccessibilityNodeInfo.AccessibilityAction(id, label);
            } else {
                this.mAction = action;
            }
            this.mViewCommandArgumentClass = viewCommandArgumentClass;
        }
    }

    /* loaded from: classes.dex */
    public static class CollectionInfoCompat {
        public final Object mInfo;

        public CollectionInfoCompat(Object info) {
            this.mInfo = info;
        }

        public static CollectionInfoCompat obtain(int rowCount, int columnCount, boolean hierarchical, int selectionMode) {
            return new CollectionInfoCompat(AccessibilityNodeInfo.CollectionInfo.obtain(rowCount, columnCount, hierarchical, selectionMode));
        }
    }

    /* loaded from: classes.dex */
    public static class CollectionItemInfoCompat {
        public final Object mInfo;

        public CollectionItemInfoCompat(Object info) {
            this.mInfo = info;
        }

        public static CollectionItemInfoCompat obtain(int rowIndex, int rowSpan, int columnIndex, int columnSpan, boolean heading, boolean selected) {
            return new CollectionItemInfoCompat(AccessibilityNodeInfo.CollectionItemInfo.obtain(rowIndex, rowSpan, columnIndex, columnSpan, heading, selected));
        }
    }

    public AccessibilityNodeInfoCompat(AccessibilityNodeInfo info) {
        this.mInfo = info;
    }

    public static String getActionSymbolicName(int action) {
        if (action == 1) {
            return "ACTION_FOCUS";
        }
        if (action == 2) {
            return "ACTION_CLEAR_FOCUS";
        }
        switch (action) {
            case 4:
                return "ACTION_SELECT";
            case 8:
                return "ACTION_CLEAR_SELECTION";
            case 16:
                return "ACTION_CLICK";
            case 32:
                return "ACTION_LONG_CLICK";
            case 64:
                return "ACTION_ACCESSIBILITY_FOCUS";
            case 128:
                return "ACTION_CLEAR_ACCESSIBILITY_FOCUS";
            case 256:
                return "ACTION_NEXT_AT_MOVEMENT_GRANULARITY";
            case QuickStepContract.SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING_OCCLUDED /* 512 */:
                return "ACTION_PREVIOUS_AT_MOVEMENT_GRANULARITY";
            case QuickStepContract.SYSUI_STATE_SEARCH_DISABLED /* 1024 */:
                return "ACTION_NEXT_HTML_ELEMENT";
            case QuickStepContract.SYSUI_STATE_QUICK_SETTINGS_EXPANDED /* 2048 */:
                return "ACTION_PREVIOUS_HTML_ELEMENT";
            case QuickStepContract.SYSUI_STATE_TRACING_ENABLED /* 4096 */:
                return "ACTION_SCROLL_FORWARD";
            case QuickStepContract.SYSUI_STATE_ASSIST_GESTURE_CONSTRAINED /* 8192 */:
                return "ACTION_SCROLL_BACKWARD";
            case QuickStepContract.SYSUI_STATE_BUBBLES_EXPANDED /* 16384 */:
                return "ACTION_COPY";
            case QuickStepContract.SYSUI_STATE_GLOBAL_ACTIONS_SHOWING /* 32768 */:
                return "ACTION_PASTE";
            case QuickStepContract.SYSUI_STATE_ONE_HANDED_ACTIVE /* 65536 */:
                return "ACTION_CUT";
            case QuickStepContract.SYSUI_STATE_ALLOW_GESTURE_IGNORING_BAR_VISIBILITY /* 131072 */:
                return "ACTION_SET_SELECTION";
            case QuickStepContract.SYSUI_STATE_IME_SHOWING /* 262144 */:
                return "ACTION_EXPAND";
            case QuickStepContract.SYSUI_STATE_MAGNIFICATION_OVERLAP /* 524288 */:
                return "ACTION_COLLAPSE";
            case QuickStepContract.SYSUI_STATE_DEVICE_DOZING /* 2097152 */:
                return "ACTION_SET_TEXT";
            case 16908354:
                return "ACTION_MOVE_WINDOW";
            case 16908372:
                return "ACTION_IME_ENTER";
            default:
                switch (action) {
                    case 16908342:
                        return "ACTION_SHOW_ON_SCREEN";
                    case 16908343:
                        return "ACTION_SCROLL_TO_POSITION";
                    case 16908344:
                        return "ACTION_SCROLL_UP";
                    case 16908345:
                        return "ACTION_SCROLL_LEFT";
                    case 16908346:
                        return "ACTION_SCROLL_DOWN";
                    case 16908347:
                        return "ACTION_SCROLL_RIGHT";
                    case 16908348:
                        return "ACTION_CONTEXT_CLICK";
                    case 16908349:
                        return "ACTION_SET_PROGRESS";
                    default:
                        switch (action) {
                            case 16908356:
                                return "ACTION_SHOW_TOOLTIP";
                            case 16908357:
                                return "ACTION_HIDE_TOOLTIP";
                            case 16908358:
                                return "ACTION_PAGE_UP";
                            case 16908359:
                                return "ACTION_PAGE_DOWN";
                            case 16908360:
                                return "ACTION_PAGE_LEFT";
                            case 16908361:
                                return "ACTION_PAGE_RIGHT";
                            case 16908362:
                                return "ACTION_PRESS_AND_HOLD";
                            default:
                                return "ACTION_UNKNOWN";
                        }
                }
        }
    }

    public static ClickableSpan[] getClickableSpans(CharSequence text) {
        if (text instanceof Spanned) {
            return (ClickableSpan[]) ((Spanned) text).getSpans(0, text.length(), ClickableSpan.class);
        }
        return null;
    }

    public void addAction(AccessibilityActionCompat action) {
        this.mInfo.addAction((AccessibilityNodeInfo.AccessibilityAction) action.mAction);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof AccessibilityNodeInfoCompat)) {
            return false;
        }
        AccessibilityNodeInfoCompat accessibilityNodeInfoCompat = (AccessibilityNodeInfoCompat) obj;
        AccessibilityNodeInfo accessibilityNodeInfo = this.mInfo;
        if (accessibilityNodeInfo == null) {
            if (accessibilityNodeInfoCompat.mInfo != null) {
                return false;
            }
        } else if (!accessibilityNodeInfo.equals(accessibilityNodeInfoCompat.mInfo)) {
            return false;
        }
        return this.mVirtualDescendantId == accessibilityNodeInfoCompat.mVirtualDescendantId && this.mParentVirtualDescendantId == accessibilityNodeInfoCompat.mParentVirtualDescendantId;
    }

    public final List<Integer> extrasIntList(String key) {
        ArrayList<Integer> integerArrayList = this.mInfo.getExtras().getIntegerArrayList(key);
        if (integerArrayList != null) {
            return integerArrayList;
        }
        ArrayList<Integer> arrayList = new ArrayList<>();
        this.mInfo.getExtras().putIntegerArrayList(key, arrayList);
        return arrayList;
    }

    public CharSequence getContentDescription() {
        return this.mInfo.getContentDescription();
    }

    public Bundle getExtras() {
        return this.mInfo.getExtras();
    }

    public CharSequence getText() {
        if (!(!extrasIntList("androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_START_KEY").isEmpty())) {
            return this.mInfo.getText();
        }
        List<Integer> extrasIntList = extrasIntList("androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_START_KEY");
        List<Integer> extrasIntList2 = extrasIntList("androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_END_KEY");
        List<Integer> extrasIntList3 = extrasIntList("androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_FLAGS_KEY");
        List<Integer> extrasIntList4 = extrasIntList("androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_ID_KEY");
        SpannableString spannableString = new SpannableString(TextUtils.substring(this.mInfo.getText(), 0, this.mInfo.getText().length()));
        for (int i = 0; i < extrasIntList.size(); i++) {
            spannableString.setSpan(new AccessibilityClickableSpanCompat(extrasIntList4.get(i).intValue(), this, getExtras().getInt("androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_ACTION_ID_KEY")), extrasIntList.get(i).intValue(), extrasIntList2.get(i).intValue(), extrasIntList3.get(i).intValue());
        }
        return spannableString;
    }

    public int hashCode() {
        AccessibilityNodeInfo accessibilityNodeInfo = this.mInfo;
        if (accessibilityNodeInfo == null) {
            return 0;
        }
        return accessibilityNodeInfo.hashCode();
    }

    public void setCollectionInfo(Object collectionInfo) {
        this.mInfo.setCollectionInfo(collectionInfo == null ? null : (AccessibilityNodeInfo.CollectionInfo) ((CollectionInfoCompat) collectionInfo).mInfo);
    }

    public void setCollectionItemInfo(Object collectionItemInfo) {
        this.mInfo.setCollectionItemInfo((AccessibilityNodeInfo.CollectionItemInfo) ((CollectionItemInfoCompat) collectionItemInfo).mInfo);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v10, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r2v8, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r2v9, types: [java.util.List] */
    public String toString() {
        ?? r2;
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString());
        Rect rect = new Rect();
        this.mInfo.getBoundsInParent(rect);
        sb.append("; boundsInParent: " + rect);
        this.mInfo.getBoundsInScreen(rect);
        sb.append("; boundsInScreen: " + rect);
        sb.append("; packageName: ");
        sb.append(this.mInfo.getPackageName());
        sb.append("; className: ");
        sb.append(this.mInfo.getClassName());
        sb.append("; text: ");
        sb.append(getText());
        sb.append("; contentDescription: ");
        sb.append(getContentDescription());
        sb.append("; viewId: ");
        sb.append(this.mInfo.getViewIdResourceName());
        sb.append("; checkable: ");
        sb.append(this.mInfo.isCheckable());
        sb.append("; checked: ");
        sb.append(this.mInfo.isChecked());
        sb.append("; focusable: ");
        sb.append(this.mInfo.isFocusable());
        sb.append("; focused: ");
        sb.append(this.mInfo.isFocused());
        sb.append("; selected: ");
        sb.append(this.mInfo.isSelected());
        sb.append("; clickable: ");
        sb.append(this.mInfo.isClickable());
        sb.append("; longClickable: ");
        sb.append(this.mInfo.isLongClickable());
        sb.append("; enabled: ");
        sb.append(this.mInfo.isEnabled());
        sb.append("; password: ");
        sb.append(this.mInfo.isPassword());
        sb.append("; scrollable: " + this.mInfo.isScrollable());
        sb.append("; [");
        List<AccessibilityNodeInfo.AccessibilityAction> actionList = this.mInfo.getActionList();
        if (actionList != null) {
            r2 = new ArrayList();
            int size = actionList.size();
            for (int i = 0; i < size; i++) {
                r2.add(new AccessibilityActionCompat(actionList.get(i), 0, null, null, null));
            }
        } else {
            r2 = Collections.emptyList();
        }
        for (int i2 = 0; i2 < r2.size(); i2++) {
            AccessibilityActionCompat accessibilityActionCompat = (AccessibilityActionCompat) r2.get(i2);
            String actionSymbolicName = getActionSymbolicName(accessibilityActionCompat.getId());
            if (actionSymbolicName.equals("ACTION_UNKNOWN") && accessibilityActionCompat.getLabel() != null) {
                actionSymbolicName = accessibilityActionCompat.getLabel().toString();
            }
            sb.append(actionSymbolicName);
            if (i2 != r2.size() - 1) {
                sb.append(", ");
            }
        }
        sb.append("]");
        return sb.toString();
    }
}
