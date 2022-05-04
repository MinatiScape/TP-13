package androidx.slice;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.AlignmentSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.RelativeSizeSpan;
import android.text.style.StyleSpan;
import androidx.core.util.Pair;
import androidx.versionedparcelable.CustomVersionedParcelable;
/* loaded from: classes.dex */
public final class SliceItem extends CustomVersionedParcelable {
    public String mFormat;
    public String[] mHints;
    public SliceItemHolder mHolder;
    public Object mObj;
    public CharSequence mSanitizedText;
    public String mSubType;

    /* loaded from: classes.dex */
    public interface ActionHandler {
        void onAction(SliceItem item, Context context, Intent intent);
    }

    public SliceItem(Object obj, String format, String subType, String[] hints) {
        this.mHints = Slice.NO_HINTS;
        this.mFormat = "text";
        this.mSubType = null;
        this.mHints = hints;
        this.mFormat = format;
        this.mSubType = subType;
        this.mObj = obj;
    }

    public static boolean checkSpan(Object span) {
        return (span instanceof AlignmentSpan) || (span instanceof ForegroundColorSpan) || (span instanceof RelativeSizeSpan) || (span instanceof StyleSpan);
    }

    public static void fixSpannableText(Spannable text) {
        Object[] spans;
        for (Object obj : text.getSpans(0, text.length(), Object.class)) {
            Object obj2 = checkSpan(obj) ? obj : null;
            if (obj2 != obj) {
                if (obj2 != null) {
                    text.setSpan(obj2, text.getSpanStart(obj), text.getSpanEnd(obj), text.getSpanFlags(obj));
                }
                text.removeSpan(obj);
            }
        }
    }

    public boolean fireActionInternal(Context context, Intent i) throws PendingIntent.CanceledException {
        F f = ((Pair) this.mObj).first;
        if (f instanceof PendingIntent) {
            ((PendingIntent) f).send(context, 0, i, null, null);
            return false;
        }
        ((ActionHandler) f).onAction(this, context, i);
        return true;
    }

    public PendingIntent getAction() {
        F f = ((Pair) this.mObj).first;
        if (f instanceof PendingIntent) {
            return (PendingIntent) f;
        }
        return null;
    }

    public int getInt() {
        return ((Integer) this.mObj).intValue();
    }

    public long getLong() {
        return ((Long) this.mObj).longValue();
    }

    public CharSequence getSanitizedText() {
        if (this.mSanitizedText == null) {
            CharSequence charSequence = (CharSequence) this.mObj;
            if (charSequence instanceof Spannable) {
                fixSpannableText((Spannable) charSequence);
            } else if (charSequence instanceof Spanned) {
                Spanned spanned = (Spanned) charSequence;
                boolean z = false;
                Object[] spans = spanned.getSpans(0, spanned.length(), Object.class);
                int length = spans.length;
                int i = 0;
                while (true) {
                    if (i >= length) {
                        z = true;
                        break;
                    } else if (!checkSpan(spans[i])) {
                        break;
                    } else {
                        i++;
                    }
                }
                if (!z) {
                    SpannableString spannableString = new SpannableString(charSequence);
                    fixSpannableText(spannableString);
                    charSequence = spannableString;
                }
            }
            this.mSanitizedText = charSequence;
        }
        return this.mSanitizedText;
    }

    public Slice getSlice() {
        if ("action".equals(this.mFormat)) {
            return (Slice) ((Pair) this.mObj).second;
        }
        return (Slice) this.mObj;
    }

    public boolean hasAnyHints(String... hints) {
        for (String str : hints) {
            if (ArrayUtils.contains(this.mHints, str)) {
                return true;
            }
        }
        return false;
    }

    public boolean hasHint(String hint) {
        return ArrayUtils.contains(this.mHints, hint);
    }

    public String toString() {
        return toString("");
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code restructure failed: missing block: B:71:0x01d1, code lost:
        if (r14.equals("image") == false) goto L84;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.String toString(java.lang.String r15) {
        /*
            Method dump skipped, instructions count: 638
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.slice.SliceItem.toString(java.lang.String):java.lang.String");
    }

    public SliceItem() {
        this.mHints = Slice.NO_HINTS;
        this.mFormat = "text";
        this.mSubType = null;
    }

    public SliceItem(PendingIntent intent, Slice slice, String format, String subType, String[] hints) {
        this(new Pair(intent, slice), format, null, hints);
    }
}
