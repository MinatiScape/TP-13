package androidx.slice.widget;

import android.app.PendingIntent;
import android.app.RemoteInput;
import android.content.Context;
import android.content.Intent;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.AttributeSet;
import android.util.Log;
import android.view.ActionMode;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.inputmethod.CompletionInfo;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;
import androidx.core.content.ContextCompat;
import androidx.slice.SliceItem;
import com.android.systemui.shared.R;
/* loaded from: classes.dex */
public class RemoteInputView extends LinearLayout implements View.OnClickListener, TextWatcher {
    public static final Object VIEW_TAG = new Object();
    public SliceItem mAction;
    public RemoteEditText mEditText;
    public ProgressBar mProgressBar;
    public RemoteInput mRemoteInput;
    public RemoteInput[] mRemoteInputs;
    public boolean mResetting;
    public ImageButton mSendButton;

    /* loaded from: classes.dex */
    public static class RemoteEditText extends EditText {
        public final Drawable mBackground = getBackground();
        public RemoteInputView mRemoteInputView;
        public boolean mShowImeOnInputConnection;

        public RemoteEditText(Context context, AttributeSet attrs) {
            super(context, attrs);
        }

        public final void defocusIfNeeded() {
            if (this.mRemoteInputView != null || isTemporarilyDetached()) {
                isTemporarilyDetached();
            } else if (isFocusable() && isEnabled()) {
                setInnerFocusable(false);
                RemoteInputView remoteInputView = this.mRemoteInputView;
                if (remoteInputView != null) {
                    remoteInputView.setVisibility(4);
                }
                this.mShowImeOnInputConnection = false;
            }
        }

        @Override // android.widget.TextView, android.view.View
        public void getFocusedRect(Rect r) {
            super.getFocusedRect(r);
            r.top = getScrollY();
            r.bottom = (getBottom() - getTop()) + getScrollY();
        }

        @Override // android.widget.TextView
        public void onCommitCompletion(CompletionInfo text) {
            clearComposingText();
            setText(text.getText());
            setSelection(getText().length());
        }

        @Override // android.widget.TextView, android.view.View
        public InputConnection onCreateInputConnection(EditorInfo outAttrs) {
            InputConnection onCreateInputConnection = super.onCreateInputConnection(outAttrs);
            if (this.mShowImeOnInputConnection && onCreateInputConnection != null) {
                Context context = getContext();
                Object obj = ContextCompat.sLock;
                final InputMethodManager inputMethodManager = (InputMethodManager) context.getSystemService(InputMethodManager.class);
                if (inputMethodManager != null) {
                    post(new Runnable() { // from class: androidx.slice.widget.RemoteInputView.RemoteEditText.1
                        @Override // java.lang.Runnable
                        public void run() {
                            inputMethodManager.viewClicked(RemoteEditText.this);
                            inputMethodManager.showSoftInput(RemoteEditText.this, 0);
                        }
                    });
                }
            }
            return onCreateInputConnection;
        }

        @Override // android.widget.TextView, android.view.View
        public void onFocusChanged(boolean focused, int direction, Rect previouslyFocusedRect) {
            super.onFocusChanged(focused, direction, previouslyFocusedRect);
            if (!focused) {
                defocusIfNeeded();
            }
        }

        @Override // android.widget.TextView, android.view.View, android.view.KeyEvent.Callback
        public boolean onKeyDown(int keyCode, KeyEvent event) {
            if (keyCode == 4) {
                return true;
            }
            return super.onKeyDown(keyCode, event);
        }

        @Override // android.widget.TextView, android.view.View, android.view.KeyEvent.Callback
        public boolean onKeyUp(int keyCode, KeyEvent event) {
            if (keyCode != 4) {
                return super.onKeyUp(keyCode, event);
            }
            defocusIfNeeded();
            return true;
        }

        @Override // android.widget.TextView, android.view.View
        public void onVisibilityChanged(View changedView, int visibility) {
            super.onVisibilityChanged(changedView, visibility);
            if (!isShown()) {
                defocusIfNeeded();
            }
        }

        @Override // android.widget.TextView
        public void setCustomSelectionActionModeCallback(ActionMode.Callback actionModeCallback) {
            super.setCustomSelectionActionModeCallback(actionModeCallback);
        }

        public void setInnerFocusable(boolean focusable) {
            setFocusableInTouchMode(focusable);
            setFocusable(focusable);
            setCursorVisible(focusable);
            if (focusable) {
                requestFocus();
                setBackground(this.mBackground);
                return;
            }
            setBackground(null);
        }
    }

    public RemoteInputView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override // android.text.TextWatcher
    public void afterTextChanged(Editable s) {
        updateSendButton();
    }

    @Override // android.text.TextWatcher
    public void beforeTextChanged(CharSequence s, int start, int count, int after) {
    }

    @Override // android.view.ViewGroup, android.view.View
    public void dispatchFinishTemporaryDetach() {
        if (isAttachedToWindow()) {
            RemoteEditText remoteEditText = this.mEditText;
            attachViewToParent(remoteEditText, 0, remoteEditText.getLayoutParams());
        } else {
            removeDetachedView(this.mEditText, false);
        }
        super.dispatchFinishTemporaryDetach();
    }

    @Override // android.view.ViewGroup, android.view.View
    public void dispatchStartTemporaryDetach() {
        super.dispatchStartTemporaryDetach();
        detachViewFromParent(this.mEditText);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        if (v == this.mSendButton) {
            sendRemoteInput();
        }
    }

    @Override // android.view.View
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mProgressBar = (ProgressBar) findViewById(R.id.remote_input_progress);
        ImageButton imageButton = (ImageButton) findViewById(R.id.remote_input_send);
        this.mSendButton = imageButton;
        imageButton.setOnClickListener(this);
        RemoteEditText remoteEditText = (RemoteEditText) getChildAt(0);
        this.mEditText = remoteEditText;
        remoteEditText.setOnEditorActionListener(new TextView.OnEditorActionListener() { // from class: androidx.slice.widget.RemoteInputView.1
            /* JADX WARN: Removed duplicated region for block: B:33:0x0046  */
            @Override // android.widget.TextView.OnEditorActionListener
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public boolean onEditorAction(android.widget.TextView r4, int r5, android.view.KeyEvent r6) {
                /*
                    r3 = this;
                    r4 = 1
                    r0 = 0
                    if (r6 != 0) goto Lf
                    r1 = 6
                    if (r5 == r1) goto Ld
                    r1 = 5
                    if (r5 == r1) goto Ld
                    r1 = 4
                    if (r5 != r1) goto Lf
                Ld:
                    r5 = r4
                    goto L10
                Lf:
                    r5 = r0
                L10:
                    if (r6 == 0) goto L35
                    int r1 = r6.getKeyCode()
                    java.lang.Object r2 = androidx.slice.widget.RemoteInputView.VIEW_TAG
                    r2 = 23
                    if (r1 == r2) goto L2a
                    r2 = 62
                    if (r1 == r2) goto L2a
                    r2 = 66
                    if (r1 == r2) goto L2a
                    r2 = 160(0xa0, float:2.24E-43)
                    if (r1 == r2) goto L2a
                    r1 = r0
                    goto L2b
                L2a:
                    r1 = r4
                L2b:
                    if (r1 == 0) goto L35
                    int r6 = r6.getAction()
                    if (r6 != 0) goto L35
                    r6 = r4
                    goto L36
                L35:
                    r6 = r0
                L36:
                    if (r5 != 0) goto L3c
                    if (r6 == 0) goto L3b
                    goto L3c
                L3b:
                    return r0
                L3c:
                    androidx.slice.widget.RemoteInputView r5 = androidx.slice.widget.RemoteInputView.this
                    androidx.slice.widget.RemoteInputView$RemoteEditText r5 = r5.mEditText
                    int r5 = r5.length()
                    if (r5 <= 0) goto L4b
                    androidx.slice.widget.RemoteInputView r3 = androidx.slice.widget.RemoteInputView.this
                    r3.sendRemoteInput()
                L4b:
                    return r4
                */
                throw new UnsupportedOperationException("Method not decompiled: androidx.slice.widget.RemoteInputView.AnonymousClass1.onEditorAction(android.widget.TextView, int, android.view.KeyEvent):boolean");
            }
        });
        this.mEditText.addTextChangedListener(this);
        this.mEditText.setInnerFocusable(false);
        this.mEditText.mRemoteInputView = this;
    }

    @Override // android.view.ViewGroup
    public boolean onRequestSendAccessibilityEvent(View child, AccessibilityEvent event) {
        if (!this.mResetting || child != this.mEditText) {
            return super.onRequestSendAccessibilityEvent(child, event);
        }
        return false;
    }

    @Override // android.text.TextWatcher
    public void onTextChanged(CharSequence s, int start, int before, int count) {
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        super.onTouchEvent(event);
        return true;
    }

    public final void reset() {
        this.mResetting = true;
        this.mEditText.getText().clear();
        this.mEditText.setEnabled(true);
        this.mSendButton.setVisibility(0);
        this.mProgressBar.setVisibility(4);
        updateSendButton();
        setVisibility(4);
        this.mResetting = false;
    }

    public void sendRemoteInput() {
        Bundle bundle = new Bundle();
        bundle.putString(this.mRemoteInput.getResultKey(), this.mEditText.getText().toString());
        Intent addFlags = new Intent().addFlags(268435456);
        RemoteInput.addResultsToIntent(this.mRemoteInputs, addFlags, bundle);
        this.mEditText.setEnabled(false);
        this.mSendButton.setVisibility(4);
        this.mProgressBar.setVisibility(0);
        this.mEditText.mShowImeOnInputConnection = false;
        try {
            this.mAction.fireActionInternal(getContext(), addFlags);
            reset();
        } catch (PendingIntent.CanceledException e) {
            Log.i("RemoteInput", "Unable to send remote input result", e);
            Toast.makeText(getContext(), "Failure sending pending intent for inline reply :(", 0).show();
            reset();
        }
    }

    public final void updateSendButton() {
        this.mSendButton.setEnabled(this.mEditText.getText().length() != 0);
    }
}
