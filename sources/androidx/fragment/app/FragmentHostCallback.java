package androidx.fragment.app;

import android.app.Activity;
import android.content.Context;
import android.os.Handler;
import android.view.LayoutInflater;
/* loaded from: classes.dex */
public abstract class FragmentHostCallback<E> extends FragmentContainer {
    public final Activity mActivity;
    public final Context mContext;
    public final FragmentManagerImpl mFragmentManager = new FragmentManagerImpl();
    public final Handler mHandler;

    public abstract FragmentActivity onGetHost$1();

    public abstract LayoutInflater onGetLayoutInflater();

    public abstract void onSupportInvalidateOptionsMenu();

    public FragmentHostCallback(FragmentActivity fragmentActivity) {
        Handler handler = new Handler();
        this.mActivity = fragmentActivity;
        if (fragmentActivity != null) {
            this.mContext = fragmentActivity;
            this.mHandler = handler;
            return;
        }
        throw new NullPointerException("context == null");
    }
}
