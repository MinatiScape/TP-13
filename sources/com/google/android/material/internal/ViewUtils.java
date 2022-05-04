package com.google.android.material.internal;

import android.content.Context;
import android.graphics.PorterDuff;
import android.util.TypedValue;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public final class ViewUtils {

    /* renamed from: com.google.android.material.internal.ViewUtils$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public final class AnonymousClass1 implements Runnable {
        public final /* synthetic */ View val$view;

        public AnonymousClass1(EditText editText) {
            this.val$view = editText;
        }

        @Override // java.lang.Runnable
        public final void run() {
            ((InputMethodManager) this.val$view.getContext().getSystemService("input_method")).showSoftInput(this.val$view, 1);
        }
    }

    /* loaded from: classes.dex */
    public interface OnApplyWindowInsetsListener {
    }

    public static PorterDuff.Mode parseTintMode(int i, PorterDuff.Mode mode) {
        if (i == 3) {
            return PorterDuff.Mode.SRC_OVER;
        }
        if (i == 5) {
            return PorterDuff.Mode.SRC_IN;
        }
        if (i == 9) {
            return PorterDuff.Mode.SRC_ATOP;
        }
        switch (i) {
            case 14:
                return PorterDuff.Mode.MULTIPLY;
            case 15:
                return PorterDuff.Mode.SCREEN;
            case 16:
                return PorterDuff.Mode.ADD;
            default:
                return mode;
        }
    }

    /* loaded from: classes.dex */
    public static class RelativePadding {
        public int bottom;
        public int end;
        public int start;

        public RelativePadding(int i, int i2, int i3, int i4) {
            this.start = i;
            this.end = i3;
            this.bottom = i4;
        }
    }

    public static boolean isLayoutRtl(View view) {
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        if (ViewCompat.Api17Impl.getLayoutDirection(view) == 1) {
            return true;
        }
        return false;
    }

    public static float dpToPx(Context context, int i) {
        return TypedValue.applyDimension(1, i, context.getResources().getDisplayMetrics());
    }
}
