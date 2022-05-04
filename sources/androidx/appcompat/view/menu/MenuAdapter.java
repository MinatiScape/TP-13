package androidx.appcompat.view.menu;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import androidx.appcompat.view.menu.MenuView;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final class MenuAdapter extends BaseAdapter {
    public MenuBuilder mAdapterMenu;
    public int mExpandedIndex = -1;
    public boolean mForceShowIcon;
    public final LayoutInflater mInflater;
    public final int mItemLayoutRes;
    public final boolean mOverflowOnly;

    @Override // android.widget.Adapter
    public final long getItemId(int i) {
        return i;
    }

    @Override // android.widget.Adapter
    public final View getView(int i, View view, ViewGroup viewGroup) {
        int i2;
        boolean z;
        int i3 = 0;
        if (view == null) {
            view = this.mInflater.inflate(this.mItemLayoutRes, viewGroup, false);
        }
        int i4 = getItem(i).mGroup;
        int i5 = i - 1;
        if (i5 >= 0) {
            i2 = getItem(i5).mGroup;
        } else {
            i2 = i4;
        }
        ListMenuItemView listMenuItemView = (ListMenuItemView) view;
        if (!this.mAdapterMenu.isGroupDividerEnabled() || i4 == i2) {
            z = false;
        } else {
            z = true;
        }
        ImageView imageView = listMenuItemView.mGroupDivider;
        if (imageView != null) {
            if (listMenuItemView.mHasListDivider || !z) {
                i3 = 8;
            }
            imageView.setVisibility(i3);
        }
        MenuView.ItemView itemView = (MenuView.ItemView) view;
        if (this.mForceShowIcon) {
            listMenuItemView.mForceShowIcon = true;
            listMenuItemView.mPreserveIconSpacing = true;
        }
        itemView.initialize(getItem(i));
        return view;
    }

    public final void findExpandedIndex() {
        MenuBuilder menuBuilder = this.mAdapterMenu;
        MenuItemImpl menuItemImpl = menuBuilder.mExpandedItem;
        if (menuItemImpl != null) {
            menuBuilder.flagActionItems();
            ArrayList<MenuItemImpl> arrayList = menuBuilder.mNonActionItems;
            int size = arrayList.size();
            for (int i = 0; i < size; i++) {
                if (arrayList.get(i) == menuItemImpl) {
                    this.mExpandedIndex = i;
                    return;
                }
            }
        }
        this.mExpandedIndex = -1;
    }

    @Override // android.widget.Adapter
    public final int getCount() {
        ArrayList<MenuItemImpl> arrayList;
        if (this.mOverflowOnly) {
            MenuBuilder menuBuilder = this.mAdapterMenu;
            menuBuilder.flagActionItems();
            arrayList = menuBuilder.mNonActionItems;
        } else {
            arrayList = this.mAdapterMenu.getVisibleItems();
        }
        if (this.mExpandedIndex < 0) {
            return arrayList.size();
        }
        return arrayList.size() - 1;
    }

    @Override // android.widget.Adapter
    public final MenuItemImpl getItem(int i) {
        ArrayList<MenuItemImpl> arrayList;
        if (this.mOverflowOnly) {
            MenuBuilder menuBuilder = this.mAdapterMenu;
            menuBuilder.flagActionItems();
            arrayList = menuBuilder.mNonActionItems;
        } else {
            arrayList = this.mAdapterMenu.getVisibleItems();
        }
        int i2 = this.mExpandedIndex;
        if (i2 >= 0 && i >= i2) {
            i++;
        }
        return arrayList.get(i);
    }

    public MenuAdapter(MenuBuilder menuBuilder, LayoutInflater layoutInflater, boolean z, int i) {
        this.mOverflowOnly = z;
        this.mInflater = layoutInflater;
        this.mAdapterMenu = menuBuilder;
        this.mItemLayoutRes = i;
        findExpandedIndex();
    }

    @Override // android.widget.BaseAdapter
    public final void notifyDataSetChanged() {
        findExpandedIndex();
        super.notifyDataSetChanged();
    }
}
