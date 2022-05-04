package androidx.core.view.accessibility;

import android.graphics.Rect;
import android.text.SpannableString;
import android.text.TextUtils;
import android.view.accessibility.AccessibilityNodeInfo;
import androidx.core.view.accessibility.AccessibilityViewCommand;
import com.android.systemui.shared.system.QuickStepContract;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
/* loaded from: classes.dex */
public final class AccessibilityNodeInfoCompat {
    public final AccessibilityNodeInfo mInfo;
    public int mParentVirtualDescendantId = -1;
    public int mVirtualDescendantId = -1;

    /* loaded from: classes.dex */
    public static class AccessibilityActionCompat {
        public final Object mAction;
        public final AccessibilityViewCommand mCommand;
        public final int mId;
        public final Class<? extends AccessibilityViewCommand.CommandArguments> mViewCommandArgumentClass;
        public static final AccessibilityActionCompat ACTION_CLICK = new AccessibilityActionCompat(16);
        public static final AccessibilityActionCompat ACTION_SCROLL_FORWARD = new AccessibilityActionCompat(QuickStepContract.SYSUI_STATE_TRACING_ENABLED);
        public static final AccessibilityActionCompat ACTION_SCROLL_BACKWARD = new AccessibilityActionCompat(QuickStepContract.SYSUI_STATE_ASSIST_GESTURE_CONSTRAINED);
        public static final AccessibilityActionCompat ACTION_EXPAND = new AccessibilityActionCompat(QuickStepContract.SYSUI_STATE_IME_SHOWING);
        public static final AccessibilityActionCompat ACTION_COLLAPSE = new AccessibilityActionCompat(QuickStepContract.SYSUI_STATE_MAGNIFICATION_OVERLAP);
        public static final AccessibilityActionCompat ACTION_DISMISS = new AccessibilityActionCompat(QuickStepContract.SYSUI_STATE_IME_SWITCHER_SHOWING);
        public static final AccessibilityActionCompat ACTION_SCROLL_UP = new AccessibilityActionCompat(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_UP, 16908344, null, null, null);
        public static final AccessibilityActionCompat ACTION_SCROLL_DOWN = new AccessibilityActionCompat(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_DOWN, 16908346, null, null, null);

        public AccessibilityActionCompat(int i) {
            this(null, i, null, null, null);
        }

        public final boolean equals(Object obj) {
            if (obj == null || !(obj instanceof AccessibilityActionCompat)) {
                return false;
            }
            AccessibilityActionCompat accessibilityActionCompat = (AccessibilityActionCompat) obj;
            Object obj2 = this.mAction;
            return obj2 == null ? accessibilityActionCompat.mAction == null : obj2.equals(accessibilityActionCompat.mAction);
        }

        static {
            new AccessibilityActionCompat(1);
            new AccessibilityActionCompat(2);
            new AccessibilityActionCompat(4);
            new AccessibilityActionCompat(8);
            new AccessibilityActionCompat(32);
            new AccessibilityActionCompat(64);
            new AccessibilityActionCompat(128);
            new AccessibilityActionCompat(256, AccessibilityViewCommand.MoveAtGranularityArguments.class);
            new AccessibilityActionCompat(QuickStepContract.SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING_OCCLUDED, AccessibilityViewCommand.MoveAtGranularityArguments.class);
            new AccessibilityActionCompat(QuickStepContract.SYSUI_STATE_SEARCH_DISABLED, AccessibilityViewCommand.MoveHtmlArguments.class);
            new AccessibilityActionCompat(QuickStepContract.SYSUI_STATE_QUICK_SETTINGS_EXPANDED, AccessibilityViewCommand.MoveHtmlArguments.class);
            new AccessibilityActionCompat(QuickStepContract.SYSUI_STATE_BUBBLES_EXPANDED);
            new AccessibilityActionCompat(QuickStepContract.SYSUI_STATE_DIALOG_SHOWING);
            new AccessibilityActionCompat(QuickStepContract.SYSUI_STATE_ONE_HANDED_ACTIVE);
            new AccessibilityActionCompat(QuickStepContract.SYSUI_STATE_ALLOW_GESTURE_IGNORING_BAR_VISIBILITY, AccessibilityViewCommand.SetSelectionArguments.class);
            new AccessibilityActionCompat(QuickStepContract.SYSUI_STATE_DEVICE_DOZING, AccessibilityViewCommand.SetTextArguments.class);
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

        public AccessibilityActionCompat(int i, Class cls) {
            this(null, i, null, null, cls);
        }

        public final int getId() {
            return ((AccessibilityNodeInfo.AccessibilityAction) this.mAction).getId();
        }

        public final int hashCode() {
            Object obj = this.mAction;
            if (obj != null) {
                return obj.hashCode();
            }
            return 0;
        }

        public AccessibilityActionCompat(Object obj, int i, String str, AccessibilityViewCommand accessibilityViewCommand, Class cls) {
            this.mId = i;
            this.mCommand = accessibilityViewCommand;
            if (obj == null) {
                this.mAction = new AccessibilityNodeInfo.AccessibilityAction(i, str);
            } else {
                this.mAction = obj;
            }
            this.mViewCommandArgumentClass = cls;
        }
    }

    /* loaded from: classes.dex */
    public static class CollectionInfoCompat {
        public final Object mInfo;

        public static CollectionInfoCompat obtain(int i, int i2, int i3) {
            return new CollectionInfoCompat(AccessibilityNodeInfo.CollectionInfo.obtain(i, i2, false, i3));
        }

        public CollectionInfoCompat(AccessibilityNodeInfo.CollectionInfo collectionInfo) {
            this.mInfo = collectionInfo;
        }
    }

    /* loaded from: classes.dex */
    public static class CollectionItemInfoCompat {
        public final Object mInfo;

        public static CollectionItemInfoCompat obtain(int i, int i2, int i3, int i4, boolean z) {
            return new CollectionItemInfoCompat(AccessibilityNodeInfo.CollectionItemInfo.obtain(i, i2, i3, i4, false, z));
        }

        public CollectionItemInfoCompat(AccessibilityNodeInfo.CollectionItemInfo collectionItemInfo) {
            this.mInfo = collectionItemInfo;
        }
    }

    public final void addAction(int i) {
        this.mInfo.addAction(i);
    }

    public final boolean equals(Object obj) {
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

    public final void addAction(AccessibilityActionCompat accessibilityActionCompat) {
        this.mInfo.addAction((AccessibilityNodeInfo.AccessibilityAction) accessibilityActionCompat.mAction);
    }

    public final ArrayList extrasIntList(String str) {
        ArrayList<Integer> integerArrayList = this.mInfo.getExtras().getIntegerArrayList(str);
        if (integerArrayList != null) {
            return integerArrayList;
        }
        ArrayList<Integer> arrayList = new ArrayList<>();
        this.mInfo.getExtras().putIntegerArrayList(str, arrayList);
        return arrayList;
    }

    public final CharSequence getText() {
        if (!(!extrasIntList("androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_START_KEY").isEmpty())) {
            return this.mInfo.getText();
        }
        ArrayList extrasIntList = extrasIntList("androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_START_KEY");
        ArrayList extrasIntList2 = extrasIntList("androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_END_KEY");
        ArrayList extrasIntList3 = extrasIntList("androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_FLAGS_KEY");
        ArrayList extrasIntList4 = extrasIntList("androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_ID_KEY");
        SpannableString spannableString = new SpannableString(TextUtils.substring(this.mInfo.getText(), 0, this.mInfo.getText().length()));
        for (int i = 0; i < extrasIntList.size(); i++) {
            spannableString.setSpan(new AccessibilityClickableSpanCompat(((Integer) extrasIntList4.get(i)).intValue(), this, this.mInfo.getExtras().getInt("androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_ACTION_ID_KEY")), ((Integer) extrasIntList.get(i)).intValue(), ((Integer) extrasIntList2.get(i)).intValue(), ((Integer) extrasIntList3.get(i)).intValue());
        }
        return spannableString;
    }

    public final int hashCode() {
        AccessibilityNodeInfo accessibilityNodeInfo = this.mInfo;
        if (accessibilityNodeInfo == null) {
            return 0;
        }
        return accessibilityNodeInfo.hashCode();
    }

    public final void setCollectionItemInfo(CollectionItemInfoCompat collectionItemInfoCompat) {
        this.mInfo.setCollectionItemInfo((AccessibilityNodeInfo.CollectionItemInfo) collectionItemInfoCompat.mInfo);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v10, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r2v8, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r2v9, types: [java.util.List] */
    public final String toString() {
        ?? r2;
        String str;
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
        sb.append(this.mInfo.getContentDescription());
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
            int id = accessibilityActionCompat.getId();
            if (id == 1) {
                str = "ACTION_FOCUS";
            } else if (id != 2) {
                switch (id) {
                    case 4:
                        str = "ACTION_SELECT";
                        break;
                    case 8:
                        str = "ACTION_CLEAR_SELECTION";
                        break;
                    case 16:
                        str = "ACTION_CLICK";
                        break;
                    case 32:
                        str = "ACTION_LONG_CLICK";
                        break;
                    case 64:
                        str = "ACTION_ACCESSIBILITY_FOCUS";
                        break;
                    case 128:
                        str = "ACTION_CLEAR_ACCESSIBILITY_FOCUS";
                        break;
                    case 256:
                        str = "ACTION_NEXT_AT_MOVEMENT_GRANULARITY";
                        break;
                    case QuickStepContract.SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING_OCCLUDED /* 512 */:
                        str = "ACTION_PREVIOUS_AT_MOVEMENT_GRANULARITY";
                        break;
                    case QuickStepContract.SYSUI_STATE_SEARCH_DISABLED /* 1024 */:
                        str = "ACTION_NEXT_HTML_ELEMENT";
                        break;
                    case QuickStepContract.SYSUI_STATE_QUICK_SETTINGS_EXPANDED /* 2048 */:
                        str = "ACTION_PREVIOUS_HTML_ELEMENT";
                        break;
                    case QuickStepContract.SYSUI_STATE_TRACING_ENABLED /* 4096 */:
                        str = "ACTION_SCROLL_FORWARD";
                        break;
                    case QuickStepContract.SYSUI_STATE_ASSIST_GESTURE_CONSTRAINED /* 8192 */:
                        str = "ACTION_SCROLL_BACKWARD";
                        break;
                    case QuickStepContract.SYSUI_STATE_BUBBLES_EXPANDED /* 16384 */:
                        str = "ACTION_COPY";
                        break;
                    case QuickStepContract.SYSUI_STATE_DIALOG_SHOWING /* 32768 */:
                        str = "ACTION_PASTE";
                        break;
                    case QuickStepContract.SYSUI_STATE_ONE_HANDED_ACTIVE /* 65536 */:
                        str = "ACTION_CUT";
                        break;
                    case QuickStepContract.SYSUI_STATE_ALLOW_GESTURE_IGNORING_BAR_VISIBILITY /* 131072 */:
                        str = "ACTION_SET_SELECTION";
                        break;
                    case QuickStepContract.SYSUI_STATE_IME_SHOWING /* 262144 */:
                        str = "ACTION_EXPAND";
                        break;
                    case QuickStepContract.SYSUI_STATE_MAGNIFICATION_OVERLAP /* 524288 */:
                        str = "ACTION_COLLAPSE";
                        break;
                    case QuickStepContract.SYSUI_STATE_DEVICE_DOZING /* 2097152 */:
                        str = "ACTION_SET_TEXT";
                        break;
                    case 16908354:
                        str = "ACTION_MOVE_WINDOW";
                        break;
                    case 16908372:
                        str = "ACTION_IME_ENTER";
                        break;
                    default:
                        switch (id) {
                            case 16908342:
                                str = "ACTION_SHOW_ON_SCREEN";
                                break;
                            case 16908343:
                                str = "ACTION_SCROLL_TO_POSITION";
                                break;
                            case 16908344:
                                str = "ACTION_SCROLL_UP";
                                break;
                            case 16908345:
                                str = "ACTION_SCROLL_LEFT";
                                break;
                            case 16908346:
                                str = "ACTION_SCROLL_DOWN";
                                break;
                            case 16908347:
                                str = "ACTION_SCROLL_RIGHT";
                                break;
                            case 16908348:
                                str = "ACTION_CONTEXT_CLICK";
                                break;
                            case 16908349:
                                str = "ACTION_SET_PROGRESS";
                                break;
                            default:
                                switch (id) {
                                    case 16908356:
                                        str = "ACTION_SHOW_TOOLTIP";
                                        break;
                                    case 16908357:
                                        str = "ACTION_HIDE_TOOLTIP";
                                        break;
                                    case 16908358:
                                        str = "ACTION_PAGE_UP";
                                        break;
                                    case 16908359:
                                        str = "ACTION_PAGE_DOWN";
                                        break;
                                    case 16908360:
                                        str = "ACTION_PAGE_LEFT";
                                        break;
                                    case 16908361:
                                        str = "ACTION_PAGE_RIGHT";
                                        break;
                                    case 16908362:
                                        str = "ACTION_PRESS_AND_HOLD";
                                        break;
                                    default:
                                        str = "ACTION_UNKNOWN";
                                        break;
                                }
                        }
                }
            } else {
                str = "ACTION_CLEAR_FOCUS";
            }
            if (str.equals("ACTION_UNKNOWN") && ((AccessibilityNodeInfo.AccessibilityAction) accessibilityActionCompat.mAction).getLabel() != null) {
                str = ((AccessibilityNodeInfo.AccessibilityAction) accessibilityActionCompat.mAction).getLabel().toString();
            }
            sb.append(str);
            if (i2 != r2.size() - 1) {
                sb.append(", ");
            }
        }
        sb.append("]");
        return sb.toString();
    }

    public AccessibilityNodeInfoCompat(AccessibilityNodeInfo accessibilityNodeInfo) {
        this.mInfo = accessibilityNodeInfo;
    }
}
