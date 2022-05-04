package androidx.appcompat.app;

import android.content.Context;
import android.content.DialogInterface;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Message;
import android.util.AttributeSet;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewStub;
import android.view.Window;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import androidx.appcompat.R$styleable;
import androidx.core.widget.NestedScrollView;
import com.android.systemui.shared.R;
import java.lang.ref.WeakReference;
/* loaded from: classes.dex */
public final class AlertController {
    public ListAdapter mAdapter;
    public int mAlertDialogLayout;
    public final int mButtonIconDimen;
    public Button mButtonNegative;
    public Button mButtonNeutral;
    public int mButtonPanelSideLayout;
    public Button mButtonPositive;
    public final Context mContext;
    public View mCustomTitleView;
    public final AppCompatDialog mDialog;
    public ButtonHandler mHandler;
    public Drawable mIcon;
    public ImageView mIconView;
    public int mListItemLayout;
    public int mListLayout;
    public RecycleListView mListView;
    public TextView mMessageView;
    public int mMultiChoiceItemLayout;
    public NestedScrollView mScrollView;
    public boolean mShowTitle;
    public int mSingleChoiceItemLayout;
    public CharSequence mTitle;
    public TextView mTitleView;
    public final Window mWindow;
    public boolean mViewSpacingSpecified = false;
    public int mIconId = 0;
    public int mCheckedItem = -1;
    public final AnonymousClass1 mButtonHandler = new View.OnClickListener() { // from class: androidx.appcompat.app.AlertController.1
        @Override // android.view.View.OnClickListener
        public final void onClick(View view) {
            AlertController alertController = AlertController.this;
            Button button = alertController.mButtonPositive;
            Button button2 = alertController.mButtonNegative;
            Button button3 = alertController.mButtonNeutral;
            alertController.mHandler.obtainMessage(1, alertController.mDialog).sendToTarget();
        }
    };

    /* loaded from: classes.dex */
    public static final class ButtonHandler extends Handler {
        public WeakReference<DialogInterface> mDialog;

        @Override // android.os.Handler
        public final void handleMessage(Message message) {
            int i = message.what;
            if (i == -3 || i == -2 || i == -1) {
                ((DialogInterface.OnClickListener) message.obj).onClick(this.mDialog.get(), message.what);
            } else if (i == 1) {
                ((DialogInterface) message.obj).dismiss();
            }
        }

        public ButtonHandler(DialogInterface dialogInterface) {
            this.mDialog = new WeakReference<>(dialogInterface);
        }
    }

    /* loaded from: classes.dex */
    public static class RecycleListView extends ListView {
        public final int mPaddingBottomNoButtons;
        public final int mPaddingTopNoTitle;

        public RecycleListView(Context context) {
            this(context, null);
        }

        public RecycleListView(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R$styleable.RecycleListView);
            this.mPaddingBottomNoButtons = obtainStyledAttributes.getDimensionPixelOffset(0, -1);
            this.mPaddingTopNoTitle = obtainStyledAttributes.getDimensionPixelOffset(1, -1);
        }
    }

    /* loaded from: classes.dex */
    public static class AlertParams {
        public ListAdapter mAdapter;
        public int mCheckedItem = -1;
        public final Context mContext;
        public View mCustomTitleView;
        public Drawable mIcon;
        public final LayoutInflater mInflater;
        public boolean mIsSingleChoice;
        public DialogInterface.OnClickListener mOnClickListener;
        public DialogInterface.OnKeyListener mOnKeyListener;
        public CharSequence mTitle;

        public AlertParams(ContextThemeWrapper contextThemeWrapper) {
            this.mContext = contextThemeWrapper;
            this.mInflater = (LayoutInflater) contextThemeWrapper.getSystemService("layout_inflater");
        }
    }

    /* loaded from: classes.dex */
    public static class CheckedItemAdapter extends ArrayAdapter<CharSequence> {
        @Override // android.widget.ArrayAdapter, android.widget.Adapter
        public final long getItemId(int i) {
            return i;
        }

        @Override // android.widget.BaseAdapter, android.widget.Adapter
        public final boolean hasStableIds() {
            return true;
        }

        public CheckedItemAdapter(Context context, int i) {
            super(context, i, 16908308, (Object[]) null);
        }
    }

    public static ViewGroup resolvePanel(View view, View view2) {
        if (view == null) {
            if (view2 instanceof ViewStub) {
                view2 = ((ViewStub) view2).inflate();
            }
            return (ViewGroup) view2;
        }
        if (view2 != null) {
            ViewParent parent = view2.getParent();
            if (parent instanceof ViewGroup) {
                ((ViewGroup) parent).removeView(view2);
            }
        }
        if (view instanceof ViewStub) {
            view = ((ViewStub) view).inflate();
        }
        return (ViewGroup) view;
    }

    /* JADX WARN: Type inference failed for: r1v1, types: [androidx.appcompat.app.AlertController$1] */
    public AlertController(Context context, AppCompatDialog appCompatDialog, Window window) {
        this.mContext = context;
        this.mDialog = appCompatDialog;
        this.mWindow = window;
        this.mHandler = new ButtonHandler(appCompatDialog);
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(null, R$styleable.AlertDialog, R.attr.alertDialogStyle, 0);
        this.mAlertDialogLayout = obtainStyledAttributes.getResourceId(0, 0);
        this.mButtonPanelSideLayout = obtainStyledAttributes.getResourceId(2, 0);
        this.mListLayout = obtainStyledAttributes.getResourceId(4, 0);
        this.mMultiChoiceItemLayout = obtainStyledAttributes.getResourceId(5, 0);
        this.mSingleChoiceItemLayout = obtainStyledAttributes.getResourceId(7, 0);
        this.mListItemLayout = obtainStyledAttributes.getResourceId(3, 0);
        this.mShowTitle = obtainStyledAttributes.getBoolean(6, true);
        this.mButtonIconDimen = obtainStyledAttributes.getDimensionPixelSize(1, 0);
        obtainStyledAttributes.recycle();
        appCompatDialog.getDelegate().requestWindowFeature(1);
    }

    public static void centerButton(Button button) {
        LinearLayout.LayoutParams layoutParams = (LinearLayout.LayoutParams) button.getLayoutParams();
        layoutParams.gravity = 1;
        layoutParams.weight = 0.5f;
        button.setLayoutParams(layoutParams);
    }
}
