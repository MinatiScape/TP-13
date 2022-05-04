package androidx.emoji2.viewsintegration;

import android.text.InputFilter;
import android.text.Spanned;
import android.widget.TextView;
import androidx.emoji2.text.EmojiCompat;
/* loaded from: classes.dex */
public final class EmojiInputFilter implements InputFilter {
    public final TextView mTextView;

    @Override // android.text.InputFilter
    public final CharSequence filter(CharSequence charSequence, int i, int i2, Spanned spanned, int i3, int i4) {
        if (this.mTextView.isInEditMode()) {
            return charSequence;
        }
        EmojiCompat.get();
        throw null;
    }

    public EmojiInputFilter(TextView textView) {
        this.mTextView = textView;
    }
}
