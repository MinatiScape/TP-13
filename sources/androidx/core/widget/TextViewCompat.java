package androidx.core.widget;

import android.graphics.Paint;
import android.widget.TextView;
import androidx.core.util.Preconditions;
/* loaded from: classes.dex */
public final class TextViewCompat {
    public static void setLastBaselineToBottomHeight(final TextView textView, int lastBaselineToBottomHeight) {
        int i;
        Preconditions.checkArgumentNonnegative(lastBaselineToBottomHeight);
        Paint.FontMetricsInt fontMetricsInt = textView.getPaint().getFontMetricsInt();
        if (textView.getIncludeFontPadding()) {
            i = fontMetricsInt.bottom;
        } else {
            i = fontMetricsInt.descent;
        }
        if (lastBaselineToBottomHeight > Math.abs(i)) {
            textView.setPadding(textView.getPaddingLeft(), textView.getPaddingTop(), textView.getPaddingRight(), lastBaselineToBottomHeight - i);
        }
    }

    public static void setLineHeight(final TextView textView, int lineHeight) {
        Preconditions.checkArgumentNonnegative(lineHeight);
        int fontMetricsInt = textView.getPaint().getFontMetricsInt(null);
        if (lineHeight != fontMetricsInt) {
            textView.setLineSpacing(lineHeight - fontMetricsInt, 1.0f);
        }
    }
}
