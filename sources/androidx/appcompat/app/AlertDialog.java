package androidx.appcompat.app;

import android.content.Context;
import android.content.DialogInterface;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ListAdapter;
import android.widget.TextView;
import androidx.appcompat.app.AlertController;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.core.widget.NestedScrollView;
import com.android.systemui.shared.R;
import com.android.systemui.shared.system.QuickStepContract;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public final class AlertDialog extends AppCompatDialog {
    public final AlertController mAlert = new AlertController(getContext(), this, getWindow());

    /* loaded from: classes.dex */
    public static class Builder {
        public final AlertController.AlertParams P;
        public final int mTheme;

        public Builder(Context context) {
            int resolveDialogTheme = AlertDialog.resolveDialogTheme(context, 0);
            this.P = new AlertController.AlertParams(new ContextThemeWrapper(context, AlertDialog.resolveDialogTheme(context, resolveDialogTheme)));
            this.mTheme = resolveDialogTheme;
        }

        public final AlertDialog create() {
            int i;
            AlertDialog alertDialog = new AlertDialog(this.P.mContext, this.mTheme);
            final AlertController.AlertParams alertParams = this.P;
            final AlertController alertController = alertDialog.mAlert;
            View view = alertParams.mCustomTitleView;
            if (view != null) {
                alertController.mCustomTitleView = view;
            } else {
                CharSequence charSequence = alertParams.mTitle;
                if (charSequence != null) {
                    alertController.mTitle = charSequence;
                    TextView textView = alertController.mTitleView;
                    if (textView != null) {
                        textView.setText(charSequence);
                    }
                }
                Drawable drawable = alertParams.mIcon;
                if (drawable != null) {
                    alertController.mIcon = drawable;
                    alertController.mIconId = 0;
                    ImageView imageView = alertController.mIconView;
                    if (imageView != null) {
                        imageView.setVisibility(0);
                        alertController.mIconView.setImageDrawable(drawable);
                    }
                }
            }
            if (alertParams.mAdapter != null) {
                AlertController.RecycleListView recycleListView = (AlertController.RecycleListView) alertParams.mInflater.inflate(alertController.mListLayout, (ViewGroup) null);
                if (alertParams.mIsSingleChoice) {
                    i = alertController.mSingleChoiceItemLayout;
                } else {
                    i = alertController.mListItemLayout;
                }
                ListAdapter listAdapter = alertParams.mAdapter;
                if (listAdapter == null) {
                    listAdapter = new AlertController.CheckedItemAdapter(alertParams.mContext, i);
                }
                alertController.mAdapter = listAdapter;
                alertController.mCheckedItem = alertParams.mCheckedItem;
                if (alertParams.mOnClickListener != null) {
                    recycleListView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: androidx.appcompat.app.AlertController.AlertParams.3
                        @Override // android.widget.AdapterView.OnItemClickListener
                        public final void onItemClick(AdapterView<?> adapterView, View view2, int i2, long j) {
                            alertParams.mOnClickListener.onClick(alertController.mDialog, i2);
                            if (!alertParams.mIsSingleChoice) {
                                alertController.mDialog.dismiss();
                            }
                        }
                    });
                }
                if (alertParams.mIsSingleChoice) {
                    recycleListView.setChoiceMode(1);
                }
                alertController.mListView = recycleListView;
            }
            this.P.getClass();
            alertDialog.setCancelable(true);
            this.P.getClass();
            alertDialog.setCanceledOnTouchOutside(true);
            this.P.getClass();
            alertDialog.setOnCancelListener(null);
            this.P.getClass();
            alertDialog.setOnDismissListener(null);
            DialogInterface.OnKeyListener onKeyListener = this.P.mOnKeyListener;
            if (onKeyListener != null) {
                alertDialog.setOnKeyListener(onKeyListener);
            }
            return alertDialog;
        }
    }

    public static int resolveDialogTheme(Context context, int i) {
        if (((i >>> 24) & 255) >= 1) {
            return i;
        }
        TypedValue typedValue = new TypedValue();
        context.getTheme().resolveAttribute(R.attr.alertDialogTheme, typedValue, true);
        return typedValue.resourceId;
    }

    @Override // android.app.Dialog, android.view.KeyEvent.Callback
    public final boolean onKeyDown(int i, KeyEvent keyEvent) {
        boolean z;
        NestedScrollView nestedScrollView = this.mAlert.mScrollView;
        if (nestedScrollView == null || !nestedScrollView.executeKeyEvent(keyEvent)) {
            z = false;
        } else {
            z = true;
        }
        if (z) {
            return true;
        }
        return super.onKeyDown(i, keyEvent);
    }

    @Override // android.app.Dialog, android.view.KeyEvent.Callback
    public final boolean onKeyUp(int i, KeyEvent keyEvent) {
        boolean z;
        NestedScrollView nestedScrollView = this.mAlert.mScrollView;
        if (nestedScrollView == null || !nestedScrollView.executeKeyEvent(keyEvent)) {
            z = false;
        } else {
            z = true;
        }
        if (z) {
            return true;
        }
        return super.onKeyUp(i, keyEvent);
    }

    public AlertDialog(Context context, int i) {
        super(context, resolveDialogTheme(context, i));
    }

    @Override // androidx.appcompat.app.AppCompatDialog, android.app.Dialog
    public final void onCreate(Bundle bundle) {
        int i;
        boolean z;
        boolean z2;
        boolean z3;
        boolean z4;
        int i2;
        boolean z5;
        ListAdapter listAdapter;
        int i3;
        int i4;
        View findViewById;
        super.onCreate(bundle);
        AlertController alertController = this.mAlert;
        if (alertController.mButtonPanelSideLayout == 0) {
            i = alertController.mAlertDialogLayout;
        } else {
            i = alertController.mAlertDialogLayout;
        }
        alertController.mDialog.setContentView(i);
        View findViewById2 = alertController.mWindow.findViewById(R.id.parentPanel);
        View findViewById3 = findViewById2.findViewById(R.id.topPanel);
        View findViewById4 = findViewById2.findViewById(R.id.contentPanel);
        View findViewById5 = findViewById2.findViewById(R.id.buttonPanel);
        ViewGroup viewGroup = (ViewGroup) findViewById2.findViewById(R.id.customPanel);
        int i5 = 0;
        alertController.mWindow.setFlags(QuickStepContract.SYSUI_STATE_ALLOW_GESTURE_IGNORING_BAR_VISIBILITY, QuickStepContract.SYSUI_STATE_ALLOW_GESTURE_IGNORING_BAR_VISIBILITY);
        viewGroup.setVisibility(8);
        View findViewById6 = viewGroup.findViewById(R.id.topPanel);
        View findViewById7 = viewGroup.findViewById(R.id.contentPanel);
        View findViewById8 = viewGroup.findViewById(R.id.buttonPanel);
        ViewGroup resolvePanel = AlertController.resolvePanel(findViewById6, findViewById3);
        ViewGroup resolvePanel2 = AlertController.resolvePanel(findViewById7, findViewById4);
        ViewGroup resolvePanel3 = AlertController.resolvePanel(findViewById8, findViewById5);
        NestedScrollView nestedScrollView = (NestedScrollView) alertController.mWindow.findViewById(R.id.scrollView);
        alertController.mScrollView = nestedScrollView;
        nestedScrollView.setFocusable(false);
        alertController.mScrollView.setNestedScrollingEnabled(false);
        TextView textView = (TextView) resolvePanel2.findViewById(16908299);
        alertController.mMessageView = textView;
        if (textView != null) {
            textView.setVisibility(8);
            alertController.mScrollView.removeView(alertController.mMessageView);
            if (alertController.mListView != null) {
                ViewGroup viewGroup2 = (ViewGroup) alertController.mScrollView.getParent();
                int indexOfChild = viewGroup2.indexOfChild(alertController.mScrollView);
                viewGroup2.removeViewAt(indexOfChild);
                viewGroup2.addView(alertController.mListView, indexOfChild, new ViewGroup.LayoutParams(-1, -1));
            } else {
                resolvePanel2.setVisibility(8);
            }
        }
        Button button = (Button) resolvePanel3.findViewById(16908313);
        alertController.mButtonPositive = button;
        button.setOnClickListener(alertController.mButtonHandler);
        View view = null;
        if (TextUtils.isEmpty(null)) {
            alertController.mButtonPositive.setVisibility(8);
            z = false;
        } else {
            alertController.mButtonPositive.setText((CharSequence) null);
            alertController.mButtonPositive.setVisibility(0);
            z = true;
        }
        Button button2 = (Button) resolvePanel3.findViewById(16908314);
        alertController.mButtonNegative = button2;
        button2.setOnClickListener(alertController.mButtonHandler);
        if (TextUtils.isEmpty(null)) {
            alertController.mButtonNegative.setVisibility(8);
        } else {
            alertController.mButtonNegative.setText((CharSequence) null);
            alertController.mButtonNegative.setVisibility(0);
            z |= true;
        }
        Button button3 = (Button) resolvePanel3.findViewById(16908315);
        alertController.mButtonNeutral = button3;
        button3.setOnClickListener(alertController.mButtonHandler);
        if (TextUtils.isEmpty(null)) {
            alertController.mButtonNeutral.setVisibility(8);
        } else {
            alertController.mButtonNeutral.setText((CharSequence) null);
            alertController.mButtonNeutral.setVisibility(0);
            z |= true;
        }
        Context context = alertController.mContext;
        TypedValue typedValue = new TypedValue();
        context.getTheme().resolveAttribute(R.attr.alertDialogCenterButtons, typedValue, true);
        if (typedValue.data != 0) {
            z2 = true;
        } else {
            z2 = false;
        }
        if (z2) {
            if (z) {
                AlertController.centerButton(alertController.mButtonPositive);
            } else if (z) {
                AlertController.centerButton(alertController.mButtonNegative);
            } else if (z) {
                AlertController.centerButton(alertController.mButtonNeutral);
            }
        }
        if (z) {
            z3 = true;
        } else {
            z3 = false;
        }
        if (!z3) {
            resolvePanel3.setVisibility(8);
        }
        if (alertController.mCustomTitleView != null) {
            resolvePanel.addView(alertController.mCustomTitleView, 0, new ViewGroup.LayoutParams(-1, -2));
            alertController.mWindow.findViewById(R.id.title_template).setVisibility(8);
        } else {
            alertController.mIconView = (ImageView) alertController.mWindow.findViewById(16908294);
            if (!(!TextUtils.isEmpty(alertController.mTitle)) || !alertController.mShowTitle) {
                alertController.mWindow.findViewById(R.id.title_template).setVisibility(8);
                alertController.mIconView.setVisibility(8);
                resolvePanel.setVisibility(8);
            } else {
                TextView textView2 = (TextView) alertController.mWindow.findViewById(R.id.alertTitle);
                alertController.mTitleView = textView2;
                textView2.setText(alertController.mTitle);
                int i6 = alertController.mIconId;
                if (i6 != 0) {
                    alertController.mIconView.setImageResource(i6);
                } else {
                    Drawable drawable = alertController.mIcon;
                    if (drawable != null) {
                        alertController.mIconView.setImageDrawable(drawable);
                    } else {
                        alertController.mTitleView.setPadding(alertController.mIconView.getPaddingLeft(), alertController.mIconView.getPaddingTop(), alertController.mIconView.getPaddingRight(), alertController.mIconView.getPaddingBottom());
                        alertController.mIconView.setVisibility(8);
                    }
                }
            }
        }
        if (viewGroup.getVisibility() != 8) {
            z4 = true;
        } else {
            z4 = false;
        }
        if (resolvePanel == null || resolvePanel.getVisibility() == 8) {
            i2 = 0;
        } else {
            i2 = 1;
        }
        if (resolvePanel3.getVisibility() != 8) {
            z5 = true;
        } else {
            z5 = false;
        }
        if (!z5 && (findViewById = resolvePanel2.findViewById(R.id.textSpacerNoButtons)) != null) {
            findViewById.setVisibility(0);
        }
        if (i2 != 0) {
            NestedScrollView nestedScrollView2 = alertController.mScrollView;
            if (nestedScrollView2 != null) {
                nestedScrollView2.setClipToPadding(true);
            }
            if (alertController.mListView != null) {
                view = resolvePanel.findViewById(R.id.titleDividerNoCustom);
            }
            if (view != null) {
                view.setVisibility(0);
            }
        } else {
            View findViewById9 = resolvePanel2.findViewById(R.id.textSpacerNoTitle);
            if (findViewById9 != null) {
                findViewById9.setVisibility(0);
            }
        }
        AlertController.RecycleListView recycleListView = alertController.mListView;
        if (recycleListView instanceof AlertController.RecycleListView) {
            if (!z5 || i2 == 0) {
                int paddingLeft = recycleListView.getPaddingLeft();
                if (i2 != 0) {
                    i3 = recycleListView.getPaddingTop();
                } else {
                    i3 = recycleListView.mPaddingTopNoTitle;
                }
                int paddingRight = recycleListView.getPaddingRight();
                if (z5) {
                    i4 = recycleListView.getPaddingBottom();
                } else {
                    i4 = recycleListView.mPaddingBottomNoButtons;
                }
                recycleListView.setPadding(paddingLeft, i3, paddingRight, i4);
            } else {
                recycleListView.getClass();
            }
        }
        if (!z4) {
            View view2 = alertController.mListView;
            if (view2 == null) {
                view2 = alertController.mScrollView;
            }
            if (view2 != null) {
                if (z5) {
                    i5 = 2;
                }
                int i7 = i2 | i5;
                View findViewById10 = alertController.mWindow.findViewById(R.id.scrollIndicatorUp);
                View findViewById11 = alertController.mWindow.findViewById(R.id.scrollIndicatorDown);
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                ViewCompat.Api23Impl.setScrollIndicators(view2, i7, 3);
                if (findViewById10 != null) {
                    resolvePanel2.removeView(findViewById10);
                }
                if (findViewById11 != null) {
                    resolvePanel2.removeView(findViewById11);
                }
            }
        }
        AlertController.RecycleListView recycleListView2 = alertController.mListView;
        if (recycleListView2 != null && (listAdapter = alertController.mAdapter) != null) {
            recycleListView2.setAdapter(listAdapter);
            int i8 = alertController.mCheckedItem;
            if (i8 > -1) {
                recycleListView2.setItemChecked(i8, true);
                recycleListView2.setSelection(i8);
            }
        }
    }

    @Override // androidx.appcompat.app.AppCompatDialog, android.app.Dialog
    public final void setTitle(CharSequence charSequence) {
        super.setTitle(charSequence);
        AlertController alertController = this.mAlert;
        alertController.mTitle = charSequence;
        TextView textView = alertController.mTitleView;
        if (textView != null) {
            textView.setText(charSequence);
        }
    }
}
