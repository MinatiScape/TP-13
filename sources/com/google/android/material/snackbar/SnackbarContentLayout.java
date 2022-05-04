package com.google.android.material.snackbar;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import com.android.systemui.shared.R;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public class SnackbarContentLayout extends LinearLayout implements ContentViewCallback {
    public Button actionView;
    public int maxInlineActionWidth;
    public TextView messageView;

    public SnackbarContentLayout(Context context) {
        this(context, null);
    }

    public SnackbarContentLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        this.messageView = (TextView) findViewById(R.id.snackbar_text);
        this.actionView = (Button) findViewById(R.id.snackbar_action);
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x0047, code lost:
        if (updateViewsWithinLayout(1, r0, r0 - r2) != false) goto L21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0052, code lost:
        if (updateViewsWithinLayout(0, r0, r0) != false) goto L21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0055, code lost:
        r1 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0056, code lost:
        if (r1 == false) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0058, code lost:
        super.onMeasure(r8, r9);
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x005b, code lost:
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:?, code lost:
        return;
     */
    @Override // android.widget.LinearLayout, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void onMeasure(int r8, int r9) {
        /*
            r7 = this;
            super.onMeasure(r8, r9)
            int r0 = r7.getOrientation()
            r1 = 1
            if (r0 != r1) goto Lb
            return
        Lb:
            android.content.res.Resources r0 = r7.getResources()
            r2 = 2131165406(0x7f0700de, float:1.7945028E38)
            int r0 = r0.getDimensionPixelSize(r2)
            android.content.res.Resources r2 = r7.getResources()
            r3 = 2131165405(0x7f0700dd, float:1.7945026E38)
            int r2 = r2.getDimensionPixelSize(r3)
            android.widget.TextView r3 = r7.messageView
            android.text.Layout r3 = r3.getLayout()
            int r3 = r3.getLineCount()
            r4 = 0
            if (r3 <= r1) goto L30
            r3 = r1
            goto L31
        L30:
            r3 = r4
        L31:
            if (r3 == 0) goto L4a
            int r5 = r7.maxInlineActionWidth
            if (r5 <= 0) goto L4a
            android.widget.Button r5 = r7.actionView
            int r5 = r5.getMeasuredWidth()
            int r6 = r7.maxInlineActionWidth
            if (r5 <= r6) goto L4a
            int r2 = r0 - r2
            boolean r0 = r7.updateViewsWithinLayout(r1, r0, r2)
            if (r0 == 0) goto L55
            goto L56
        L4a:
            if (r3 == 0) goto L4d
            goto L4e
        L4d:
            r0 = r2
        L4e:
            boolean r0 = r7.updateViewsWithinLayout(r4, r0, r0)
            if (r0 == 0) goto L55
            goto L56
        L55:
            r1 = r4
        L56:
            if (r1 == 0) goto L5b
            super.onMeasure(r8, r9)
        L5b:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.snackbar.SnackbarContentLayout.onMeasure(int, int):void");
    }

    public final boolean updateViewsWithinLayout(int i, int i2, int i3) {
        boolean z;
        if (i != getOrientation()) {
            setOrientation(i);
            z = true;
        } else {
            z = false;
        }
        if (this.messageView.getPaddingTop() == i2 && this.messageView.getPaddingBottom() == i3) {
            return z;
        }
        TextView textView = this.messageView;
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        if (ViewCompat.Api17Impl.isPaddingRelative(textView)) {
            ViewCompat.Api17Impl.setPaddingRelative(textView, ViewCompat.Api17Impl.getPaddingStart(textView), i2, ViewCompat.Api17Impl.getPaddingEnd(textView), i3);
            return true;
        }
        textView.setPadding(textView.getPaddingLeft(), i2, textView.getPaddingRight(), i3);
        return true;
    }
}
