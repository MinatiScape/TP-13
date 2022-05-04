package com.android.wallpaper.util;

import android.content.res.Resources;
import android.content.res.TypedArray;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.text.method.KeyListener;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.inputmethod.InputConnection;
import android.widget.EditText;
import androidx.appcompat.R$styleable;
import androidx.emoji2.text.EmojiCompat;
import androidx.emoji2.viewsintegration.EmojiEditTextHelper;
import androidx.emoji2.viewsintegration.EmojiInputConnection;
import androidx.emoji2.viewsintegration.EmojiKeyListener;
import androidx.emoji2.viewsintegration.EmojiTextWatcher;
/* loaded from: classes.dex */
public final class DisplayMetricsRetriever {
    public static DisplayMetricsRetriever sInstance;
    public Object mLandscapeDisplayMetrics;
    public Object mPortraitDisplayMetrics;

    public /* synthetic */ DisplayMetricsRetriever() {
    }

    public /* synthetic */ DisplayMetricsRetriever(EditText editText) {
        this.mPortraitDisplayMetrics = editText;
        this.mLandscapeDisplayMetrics = new EmojiEditTextHelper(editText);
    }

    public final KeyListener getKeyListener(KeyListener keyListener) {
        ((EmojiEditTextHelper) this.mLandscapeDisplayMetrics).mHelper.getClass();
        if (keyListener instanceof EmojiKeyListener) {
            return keyListener;
        }
        if (keyListener == null) {
            return null;
        }
        return new EmojiKeyListener(keyListener);
    }

    public final void initKeyListener() {
        boolean isFocusable = ((EditText) this.mPortraitDisplayMetrics).isFocusable();
        int inputType = ((EditText) this.mPortraitDisplayMetrics).getInputType();
        Object obj = this.mPortraitDisplayMetrics;
        ((EditText) obj).setKeyListener(((EditText) obj).getKeyListener());
        ((EditText) this.mPortraitDisplayMetrics).setRawInputType(inputType);
        ((EditText) this.mPortraitDisplayMetrics).setFocusable(isFocusable);
    }

    /* JADX WARN: Finally extract failed */
    public final void loadFromAttributes(AttributeSet attributeSet, int i) {
        TypedArray obtainStyledAttributes = ((EditText) this.mPortraitDisplayMetrics).getContext().obtainStyledAttributes(attributeSet, R$styleable.AppCompatTextView, i, 0);
        try {
            boolean z = true;
            if (obtainStyledAttributes.hasValue(14)) {
                z = obtainStyledAttributes.getBoolean(14, true);
            }
            obtainStyledAttributes.recycle();
            EmojiTextWatcher emojiTextWatcher = ((EmojiEditTextHelper) this.mLandscapeDisplayMetrics).mHelper.mTextWatcher;
            if (emojiTextWatcher.mEnabled == z) {
                return;
            }
            if (emojiTextWatcher.mInitCallback == null) {
                emojiTextWatcher.mEnabled = z;
                if (z) {
                    EmojiCompat.get();
                    throw null;
                }
                return;
            }
            EmojiCompat.get();
            throw null;
        } catch (Throwable th) {
            obtainStyledAttributes.recycle();
            throw th;
        }
    }

    public final InputConnection onCreateInputConnection(InputConnection inputConnection) {
        EmojiEditTextHelper emojiEditTextHelper = (EmojiEditTextHelper) this.mLandscapeDisplayMetrics;
        if (inputConnection == null) {
            emojiEditTextHelper.getClass();
            return null;
        }
        EmojiEditTextHelper.HelperInternal19 helperInternal19 = emojiEditTextHelper.mHelper;
        helperInternal19.getClass();
        if (!(inputConnection instanceof EmojiInputConnection)) {
            inputConnection = new EmojiInputConnection(helperInternal19.mEditText, inputConnection);
        }
        return inputConnection;
    }

    public final DisplayMetrics getDisplayMetrics(Resources resources, Display display) {
        int i = resources.getConfiguration().orientation;
        if (i == 1) {
            if (((DisplayMetrics) this.mPortraitDisplayMetrics) == null) {
                DisplayMetrics displayMetrics = new DisplayMetrics();
                this.mPortraitDisplayMetrics = displayMetrics;
                display.getMetrics(displayMetrics);
            }
            return (DisplayMetrics) this.mPortraitDisplayMetrics;
        } else if (i != 2) {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Unknown device orientation: ");
            m.append(resources.getConfiguration().orientation);
            Log.e("DisplayMetricsRetriever", m.toString());
            if (((DisplayMetrics) this.mPortraitDisplayMetrics) == null) {
                DisplayMetrics displayMetrics2 = new DisplayMetrics();
                this.mPortraitDisplayMetrics = displayMetrics2;
                display.getMetrics(displayMetrics2);
            }
            return (DisplayMetrics) this.mPortraitDisplayMetrics;
        } else {
            if (((DisplayMetrics) this.mLandscapeDisplayMetrics) == null) {
                DisplayMetrics displayMetrics3 = new DisplayMetrics();
                this.mLandscapeDisplayMetrics = displayMetrics3;
                display.getMetrics(displayMetrics3);
            }
            return (DisplayMetrics) this.mLandscapeDisplayMetrics;
        }
    }
}
