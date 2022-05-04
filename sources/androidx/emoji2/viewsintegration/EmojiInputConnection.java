package androidx.emoji2.viewsintegration;

import android.text.Editable;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.InputConnectionWrapper;
import android.widget.EditText;
import android.widget.TextView;
import androidx.emoji2.text.EmojiCompat;
/* loaded from: classes.dex */
public final class EmojiInputConnection extends InputConnectionWrapper {
    public final EmojiCompatDeleteHelper mEmojiCompatDeleteHelper;
    public final TextView mTextView;

    /* loaded from: classes.dex */
    public static class EmojiCompatDeleteHelper {
        /* JADX WARN: Code restructure failed: missing block: B:28:0x0050, code lost:
            if (java.lang.Character.isHighSurrogate(r5) != false) goto L29;
         */
        /* JADX WARN: Code restructure failed: missing block: B:45:0x0080, code lost:
            if (r11 != false) goto L57;
         */
        /* JADX WARN: Code restructure failed: missing block: B:49:0x008d, code lost:
            if (java.lang.Character.isLowSurrogate(r5) != false) goto L50;
         */
        /* JADX WARN: Removed duplicated region for block: B:44:0x007e  */
        /* JADX WARN: Removed duplicated region for block: B:59:0x00ae A[ADDED_TO_REGION] */
        /* JADX WARN: Removed duplicated region for block: B:82:0x007c A[SYNTHETIC] */
        /* JADX WARN: Removed duplicated region for block: B:93:? A[ADDED_TO_REGION, RETURN, SYNTHETIC] */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public static boolean handleDeleteSurroundingText(android.view.inputmethod.InputConnection r7, android.text.Editable r8, int r9, int r10, boolean r11) {
            /*
                Method dump skipped, instructions count: 252
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: androidx.emoji2.viewsintegration.EmojiInputConnection.EmojiCompatDeleteHelper.handleDeleteSurroundingText(android.view.inputmethod.InputConnection, android.text.Editable, int, int, boolean):boolean");
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public EmojiInputConnection(EditText editText, InputConnection inputConnection) {
        super(inputConnection, false);
        EmojiCompatDeleteHelper emojiCompatDeleteHelper = new EmojiCompatDeleteHelper();
        this.mTextView = editText;
        this.mEmojiCompatDeleteHelper = emojiCompatDeleteHelper;
        Object obj = EmojiCompat.INSTANCE_LOCK;
    }

    @Override // android.view.inputmethod.InputConnectionWrapper, android.view.inputmethod.InputConnection
    public final boolean deleteSurroundingText(int i, int i2) {
        EmojiCompatDeleteHelper emojiCompatDeleteHelper = this.mEmojiCompatDeleteHelper;
        Editable editableText = this.mTextView.getEditableText();
        emojiCompatDeleteHelper.getClass();
        if (EmojiCompatDeleteHelper.handleDeleteSurroundingText(this, editableText, i, i2, false) || super.deleteSurroundingText(i, i2)) {
            return true;
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnectionWrapper, android.view.inputmethod.InputConnection
    public final boolean deleteSurroundingTextInCodePoints(int i, int i2) {
        EmojiCompatDeleteHelper emojiCompatDeleteHelper = this.mEmojiCompatDeleteHelper;
        Editable editableText = this.mTextView.getEditableText();
        emojiCompatDeleteHelper.getClass();
        if (EmojiCompatDeleteHelper.handleDeleteSurroundingText(this, editableText, i, i2, true) || super.deleteSurroundingTextInCodePoints(i, i2)) {
            return true;
        }
        return false;
    }
}
