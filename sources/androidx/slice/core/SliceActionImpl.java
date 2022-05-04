package androidx.slice.core;

import android.app.PendingIntent;
import androidx.constraintlayout.solver.SolverVariable$Type$r8$EnumUnboxingUtility;
import androidx.core.graphics.drawable.IconCompat;
import androidx.slice.ArrayUtils;
import androidx.slice.SliceItem;
/* loaded from: classes.dex */
public class SliceActionImpl implements SliceAction {
    public SliceItem mActionItem;
    public int mActionType;
    public CharSequence mContentDescription;
    public IconCompat mIcon;
    public int mImageMode;
    public boolean mIsChecked;
    public int mPriority;
    public SliceItem mSliceItem;
    public CharSequence mTitle;

    public SliceActionImpl(PendingIntent action, IconCompat actionIcon, int imageMode, CharSequence actionTitle) {
        this.mImageMode = 5;
        this.mActionType = 1;
        this.mPriority = -1;
        this.mIcon = actionIcon;
        this.mTitle = actionTitle;
        this.mImageMode = imageMode;
    }

    public static int parseImageMode(SliceItem iconItem) {
        if (ArrayUtils.contains(iconItem.mHints, "show_label")) {
            return 6;
        }
        if (!ArrayUtils.contains(iconItem.mHints, "no_tint")) {
            return 0;
        }
        return ArrayUtils.contains(iconItem.mHints, "raw") ? ArrayUtils.contains(iconItem.mHints, "large") ? 4 : 3 : ArrayUtils.contains(iconItem.mHints, "large") ? 2 : 1;
    }

    @Override // androidx.slice.core.SliceAction
    public int getPriority() {
        return this.mPriority;
    }

    public String getSubtype() {
        int $enumboxing$ordinal = SolverVariable$Type$r8$EnumUnboxingUtility.$enumboxing$ordinal(this.mActionType);
        if ($enumboxing$ordinal == 1) {
            return "toggle";
        }
        if ($enumboxing$ordinal == 2) {
            return "date_picker";
        }
        if ($enumboxing$ordinal != 3) {
            return null;
        }
        return "time_picker";
    }

    @Override // androidx.slice.core.SliceAction
    public boolean isToggle() {
        return this.mActionType == 2;
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x009f  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00c0  */
    @android.annotation.SuppressLint({"InlinedApi"})
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public SliceActionImpl(androidx.slice.SliceItem r8) {
        /*
            Method dump skipped, instructions count: 253
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.slice.core.SliceActionImpl.<init>(androidx.slice.SliceItem):void");
    }
}
