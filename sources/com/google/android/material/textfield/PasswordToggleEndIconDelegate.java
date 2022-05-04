package com.google.android.material.textfield;

import android.text.method.PasswordTransformationMethod;
import android.view.View;
import android.widget.EditText;
import com.android.systemui.shared.R;
import com.google.android.material.internal.CheckableImageButton;
import com.google.android.material.internal.TextWatcherAdapter;
import com.google.android.material.textfield.TextInputLayout;
/* loaded from: classes.dex */
public final class PasswordToggleEndIconDelegate extends EndIconDelegate {
    public final AnonymousClass1 textWatcher = new TextWatcherAdapter() { // from class: com.google.android.material.textfield.PasswordToggleEndIconDelegate.1
        @Override // com.google.android.material.internal.TextWatcherAdapter, android.text.TextWatcher
        public final void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
            PasswordToggleEndIconDelegate passwordToggleEndIconDelegate = PasswordToggleEndIconDelegate.this;
            passwordToggleEndIconDelegate.endIconView.setChecked(!PasswordToggleEndIconDelegate.access$000(passwordToggleEndIconDelegate));
        }
    };
    public final AnonymousClass2 onEditTextAttachedListener = new AnonymousClass2();
    public final AnonymousClass3 onEndIconChangedListener = new TextInputLayout.OnEndIconChangedListener() { // from class: com.google.android.material.textfield.PasswordToggleEndIconDelegate.3
        @Override // com.google.android.material.textfield.TextInputLayout.OnEndIconChangedListener
        public final void onEndIconChanged(TextInputLayout textInputLayout, int i) {
            final EditText editText = textInputLayout.editText;
            if (editText != null && i == 1) {
                editText.setTransformationMethod(PasswordTransformationMethod.getInstance());
                editText.post(new Runnable() { // from class: com.google.android.material.textfield.PasswordToggleEndIconDelegate.3.1
                    @Override // java.lang.Runnable
                    public final void run() {
                        editText.removeTextChangedListener(PasswordToggleEndIconDelegate.this.textWatcher);
                    }
                });
            }
        }
    };

    /* renamed from: com.google.android.material.textfield.PasswordToggleEndIconDelegate$2  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass2 implements TextInputLayout.OnEditTextAttachedListener {
        public AnonymousClass2() {
        }

        @Override // com.google.android.material.textfield.TextInputLayout.OnEditTextAttachedListener
        public final void onEditTextAttached(TextInputLayout textInputLayout) {
            EditText editText = textInputLayout.editText;
            PasswordToggleEndIconDelegate passwordToggleEndIconDelegate = PasswordToggleEndIconDelegate.this;
            passwordToggleEndIconDelegate.endIconView.setChecked(!PasswordToggleEndIconDelegate.access$000(passwordToggleEndIconDelegate));
            editText.removeTextChangedListener(PasswordToggleEndIconDelegate.this.textWatcher);
            editText.addTextChangedListener(PasswordToggleEndIconDelegate.this.textWatcher);
        }
    }

    public static boolean access$000(PasswordToggleEndIconDelegate passwordToggleEndIconDelegate) {
        EditText editText = passwordToggleEndIconDelegate.textInputLayout.editText;
        if (editText == null || !(editText.getTransformationMethod() instanceof PasswordTransformationMethod)) {
            return false;
        }
        return true;
    }

    @Override // com.google.android.material.textfield.EndIconDelegate
    public final void initialize() {
        TextInputLayout textInputLayout = this.textInputLayout;
        int i = this.customEndIcon;
        if (i == 0) {
            i = R.drawable.design_password_eye;
        }
        textInputLayout.setEndIconDrawable(i);
        TextInputLayout textInputLayout2 = this.textInputLayout;
        textInputLayout2.setEndIconContentDescription(textInputLayout2.getResources().getText(R.string.password_toggle_content_description));
        boolean z = true;
        this.textInputLayout.setEndIconVisible(true);
        CheckableImageButton checkableImageButton = this.textInputLayout.endIconView;
        if (!checkableImageButton.checkable) {
            checkableImageButton.checkable = true;
            checkableImageButton.sendAccessibilityEvent(0);
        }
        TextInputLayout textInputLayout3 = this.textInputLayout;
        View.OnClickListener onClickListener = new View.OnClickListener() { // from class: com.google.android.material.textfield.PasswordToggleEndIconDelegate.4
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                EditText editText = PasswordToggleEndIconDelegate.this.textInputLayout.editText;
                if (editText != null) {
                    int selectionEnd = editText.getSelectionEnd();
                    if (PasswordToggleEndIconDelegate.access$000(PasswordToggleEndIconDelegate.this)) {
                        editText.setTransformationMethod(null);
                    } else {
                        editText.setTransformationMethod(PasswordTransformationMethod.getInstance());
                    }
                    if (selectionEnd >= 0) {
                        editText.setSelection(selectionEnd);
                    }
                    TextInputLayout textInputLayout4 = PasswordToggleEndIconDelegate.this.textInputLayout;
                    textInputLayout4.refreshIconDrawableState(textInputLayout4.endIconView, textInputLayout4.endIconTintList);
                }
            }
        };
        CheckableImageButton checkableImageButton2 = textInputLayout3.endIconView;
        View.OnLongClickListener onLongClickListener = textInputLayout3.endIconOnLongClickListener;
        checkableImageButton2.setOnClickListener(onClickListener);
        TextInputLayout.setIconClickable(checkableImageButton2, onLongClickListener);
        TextInputLayout textInputLayout4 = this.textInputLayout;
        AnonymousClass2 r2 = this.onEditTextAttachedListener;
        textInputLayout4.editTextAttachedListeners.add(r2);
        if (textInputLayout4.editText != null) {
            r2.onEditTextAttached(textInputLayout4);
        }
        this.textInputLayout.endIconChangedListeners.add(this.onEndIconChangedListener);
        EditText editText = this.textInputLayout.editText;
        if (editText == null || !(editText.getInputType() == 16 || editText.getInputType() == 128 || editText.getInputType() == 144 || editText.getInputType() == 224)) {
            z = false;
        }
        if (z) {
            editText.setTransformationMethod(PasswordTransformationMethod.getInstance());
        }
    }

    /* JADX WARN: Type inference failed for: r1v1, types: [com.google.android.material.textfield.PasswordToggleEndIconDelegate$1] */
    /* JADX WARN: Type inference failed for: r1v3, types: [com.google.android.material.textfield.PasswordToggleEndIconDelegate$3] */
    public PasswordToggleEndIconDelegate(TextInputLayout textInputLayout, int i) {
        super(textInputLayout, i);
    }
}
