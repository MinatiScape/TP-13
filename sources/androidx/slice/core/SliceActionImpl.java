package androidx.slice.core;

import androidx.core.graphics.drawable.IconCompat;
import androidx.slice.SliceItem;
/* loaded from: classes.dex */
public final class SliceActionImpl implements SliceAction {
    public SliceItem mActionItem;
    public ActionType mActionType;
    public CharSequence mContentDescription;
    public IconCompat mIcon;
    public int mImageMode;
    public boolean mIsChecked;
    public int mPriority;
    public SliceItem mSliceItem;
    public CharSequence mTitle;

    /* loaded from: classes.dex */
    public enum ActionType {
        DEFAULT,
        TOGGLE,
        DATE_PICKER,
        TIME_PICKER
    }

    public SliceActionImpl(IconCompat iconCompat, int i, CharSequence charSequence) {
        this.mActionType = ActionType.DEFAULT;
        this.mPriority = -1;
        this.mIcon = iconCompat;
        this.mTitle = charSequence;
        this.mImageMode = i;
    }

    public static int parseImageMode(SliceItem sliceItem) {
        if (sliceItem.hasHint("show_label")) {
            return 6;
        }
        if (!sliceItem.hasHint("no_tint")) {
            return 0;
        }
        if (sliceItem.hasHint("raw")) {
            if (sliceItem.hasHint("large")) {
                return 4;
            }
            return 3;
        } else if (sliceItem.hasHint("large")) {
            return 2;
        } else {
            return 1;
        }
    }

    public final String getSubtype() {
        int ordinal = this.mActionType.ordinal();
        if (ordinal == 1) {
            return "toggle";
        }
        if (ordinal == 2) {
            return "date_picker";
        }
        if (ordinal != 3) {
            return null;
        }
        return "time_picker";
    }

    public final boolean isDefaultToggle() {
        if (this.mActionType == ActionType.TOGGLE && this.mIcon == null) {
            return true;
        }
        return false;
    }

    @Override // androidx.slice.core.SliceAction
    public final boolean isToggle() {
        if (this.mActionType == ActionType.TOGGLE) {
            return true;
        }
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x00aa  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00cd  */
    @android.annotation.SuppressLint({"InlinedApi"})
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public SliceActionImpl(androidx.slice.SliceItem r9) {
        /*
            Method dump skipped, instructions count: 264
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.slice.core.SliceActionImpl.<init>(androidx.slice.SliceItem):void");
    }

    @Override // androidx.slice.core.SliceAction
    public final int getPriority() {
        return this.mPriority;
    }
}
