package androidx.emoji2.viewsintegration;

import android.text.Editable;
import android.text.Spannable;
import android.text.TextWatcher;
import android.widget.EditText;
import androidx.emoji2.text.EmojiCompat;
/* loaded from: classes.dex */
public final class EmojiTextWatcher implements TextWatcher {
    public final EditText mEditText;
    public InitCallbackImpl mInitCallback;
    public final boolean mExpectInitializedEmojiCompat = false;
    public boolean mEnabled = true;

    /* loaded from: classes.dex */
    public static class InitCallbackImpl extends EmojiCompat.InitCallback {
    }

    @Override // android.text.TextWatcher
    public final void afterTextChanged(Editable editable) {
    }

    @Override // android.text.TextWatcher
    public final void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
    }

    @Override // android.text.TextWatcher
    public final void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        boolean z;
        if (!this.mEditText.isInEditMode()) {
            if (this.mEnabled) {
                if (!this.mExpectInitializedEmojiCompat) {
                    Object obj = EmojiCompat.INSTANCE_LOCK;
                } else {
                    z = false;
                    if (!z && i2 <= i3 && (charSequence instanceof Spannable)) {
                        EmojiCompat.get();
                        throw null;
                    }
                    return;
                }
            }
            z = true;
            if (!z) {
                EmojiCompat.get();
                throw null;
            }
        }
    }

    public EmojiTextWatcher(EditText editText) {
        this.mEditText = editText;
    }
}
