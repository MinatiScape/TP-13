package androidx.emoji2.viewsintegration;

import android.text.InputFilter;
import android.text.method.PasswordTransformationMethod;
import android.text.method.TransformationMethod;
import android.util.SparseArray;
import android.widget.TextView;
import androidx.emoji2.text.EmojiCompat;
/* loaded from: classes.dex */
public final class EmojiTextViewHelper {
    public final HelperInternal mHelper;

    /* loaded from: classes.dex */
    public static class HelperInternal {
        public InputFilter[] getFilters(InputFilter[] inputFilterArr) {
            throw null;
        }

        public boolean isEnabled() {
            throw null;
        }

        public void setAllCaps(boolean z) {
            throw null;
        }

        public void setEnabled(boolean z) {
            throw null;
        }

        public TransformationMethod wrapTransformationMethod(TransformationMethod transformationMethod) {
            throw null;
        }
    }

    /* loaded from: classes.dex */
    public static class HelperInternal19 extends HelperInternal {
        public final EmojiInputFilter mEmojiInputFilter;
        public boolean mEnabled = true;
        public final TextView mTextView;

        @Override // androidx.emoji2.viewsintegration.EmojiTextViewHelper.HelperInternal
        public final InputFilter[] getFilters(InputFilter[] inputFilterArr) {
            if (!this.mEnabled) {
                SparseArray sparseArray = new SparseArray(1);
                for (int i = 0; i < inputFilterArr.length; i++) {
                    InputFilter inputFilter = inputFilterArr[i];
                    if (inputFilter instanceof EmojiInputFilter) {
                        sparseArray.put(i, inputFilter);
                    }
                }
                if (sparseArray.size() == 0) {
                    return inputFilterArr;
                }
                int length = inputFilterArr.length;
                InputFilter[] inputFilterArr2 = new InputFilter[inputFilterArr.length - sparseArray.size()];
                int i2 = 0;
                for (int i3 = 0; i3 < length; i3++) {
                    if (sparseArray.indexOfKey(i3) < 0) {
                        inputFilterArr2[i2] = inputFilterArr[i3];
                        i2++;
                    }
                }
                return inputFilterArr2;
            }
            int length2 = inputFilterArr.length;
            for (InputFilter inputFilter2 : inputFilterArr) {
                if (inputFilter2 == this.mEmojiInputFilter) {
                    return inputFilterArr;
                }
            }
            InputFilter[] inputFilterArr3 = new InputFilter[inputFilterArr.length + 1];
            System.arraycopy(inputFilterArr, 0, inputFilterArr3, 0, length2);
            inputFilterArr3[length2] = this.mEmojiInputFilter;
            return inputFilterArr3;
        }

        @Override // androidx.emoji2.viewsintegration.EmojiTextViewHelper.HelperInternal
        public final void setAllCaps(boolean z) {
            if (z) {
                this.mTextView.setTransformationMethod(wrapTransformationMethod(this.mTextView.getTransformationMethod()));
            }
        }

        @Override // androidx.emoji2.viewsintegration.EmojiTextViewHelper.HelperInternal
        public final void setEnabled(boolean z) {
            this.mEnabled = z;
            this.mTextView.setTransformationMethod(wrapTransformationMethod(this.mTextView.getTransformationMethod()));
            this.mTextView.setFilters(getFilters(this.mTextView.getFilters()));
        }

        @Override // androidx.emoji2.viewsintegration.EmojiTextViewHelper.HelperInternal
        public final TransformationMethod wrapTransformationMethod(TransformationMethod transformationMethod) {
            if (this.mEnabled) {
                if (!(transformationMethod instanceof EmojiTransformationMethod) && !(transformationMethod instanceof PasswordTransformationMethod)) {
                    return new EmojiTransformationMethod(transformationMethod);
                }
                return transformationMethod;
            } else if (transformationMethod instanceof EmojiTransformationMethod) {
                return ((EmojiTransformationMethod) transformationMethod).mTransformationMethod;
            } else {
                return transformationMethod;
            }
        }

        public HelperInternal19(TextView textView) {
            this.mTextView = textView;
            this.mEmojiInputFilter = new EmojiInputFilter(textView);
        }

        @Override // androidx.emoji2.viewsintegration.EmojiTextViewHelper.HelperInternal
        public final boolean isEnabled() {
            return this.mEnabled;
        }
    }

    /* loaded from: classes.dex */
    public static class SkippingHelper19 extends HelperInternal {
        public final HelperInternal19 mHelperDelegate;

        @Override // androidx.emoji2.viewsintegration.EmojiTextViewHelper.HelperInternal
        public final boolean isEnabled() {
            return this.mHelperDelegate.mEnabled;
        }

        @Override // androidx.emoji2.viewsintegration.EmojiTextViewHelper.HelperInternal
        public final void setEnabled(boolean z) {
            Object obj = EmojiCompat.INSTANCE_LOCK;
            this.mHelperDelegate.mEnabled = z;
        }

        public SkippingHelper19(TextView textView) {
            this.mHelperDelegate = new HelperInternal19(textView);
        }

        @Override // androidx.emoji2.viewsintegration.EmojiTextViewHelper.HelperInternal
        public final InputFilter[] getFilters(InputFilter[] inputFilterArr) {
            Object obj = EmojiCompat.INSTANCE_LOCK;
            return inputFilterArr;
        }

        @Override // androidx.emoji2.viewsintegration.EmojiTextViewHelper.HelperInternal
        public final void setAllCaps(boolean z) {
            Object obj = EmojiCompat.INSTANCE_LOCK;
        }

        @Override // androidx.emoji2.viewsintegration.EmojiTextViewHelper.HelperInternal
        public final TransformationMethod wrapTransformationMethod(TransformationMethod transformationMethod) {
            Object obj = EmojiCompat.INSTANCE_LOCK;
            return transformationMethod;
        }
    }

    public EmojiTextViewHelper(TextView textView) {
        if (textView != null) {
            this.mHelper = new SkippingHelper19(textView);
            return;
        }
        throw new NullPointerException("textView cannot be null");
    }
}
