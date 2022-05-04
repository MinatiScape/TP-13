package androidx.core.view;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import androidx.appcompat.view.menu.MenuItemImpl;
import androidx.appcompat.view.menu.SubMenuBuilder;
/* loaded from: classes.dex */
public abstract class ActionProvider {
    public VisibilityListener mVisibilityListener;

    /* loaded from: classes.dex */
    public interface VisibilityListener {
    }

    public boolean hasSubMenu() {
        return false;
    }

    public boolean isVisible() {
        return true;
    }

    public abstract View onCreateActionView();

    public boolean onPerformDefaultAction() {
        return false;
    }

    public void onPrepareSubMenu(SubMenuBuilder subMenuBuilder) {
    }

    public boolean overridesItemVisibility() {
        return false;
    }

    public void setVisibilityListener(MenuItemImpl.AnonymousClass1 r3) {
        if (this.mVisibilityListener != null) {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("setVisibilityListener: Setting a new ActionProvider.VisibilityListener when one is already set. Are you reusing this ");
            m.append(getClass().getSimpleName());
            m.append(" instance while it is still in use somewhere else?");
            Log.w("ActionProvider(support)", m.toString());
        }
        this.mVisibilityListener = r3;
    }

    public View onCreateActionView(MenuItem menuItem) {
        return onCreateActionView();
    }
}
