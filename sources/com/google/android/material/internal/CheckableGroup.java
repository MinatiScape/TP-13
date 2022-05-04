package com.google.android.material.internal;

import com.google.android.material.chip.ChipGroup;
import com.google.android.material.internal.MaterialCheckable;
import java.util.HashMap;
import java.util.HashSet;
/* loaded from: classes.dex */
public final class CheckableGroup<T extends MaterialCheckable<T>> {
    public final HashMap checkables = new HashMap();
    public final HashSet checkedIds = new HashSet();
    public OnCheckedStateChangeListener onCheckedStateChangeListener;
    public boolean selectionRequired;
    public boolean singleSelection;

    /* renamed from: com.google.android.material.internal.CheckableGroup$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public final class AnonymousClass1 implements MaterialCheckable.OnCheckedChangeListener<MaterialCheckable<Object>> {
        public AnonymousClass1() {
        }
    }

    /* loaded from: classes.dex */
    public interface OnCheckedStateChangeListener {
    }

    public final void onCheckedStateChanged() {
        OnCheckedStateChangeListener onCheckedStateChangeListener = this.onCheckedStateChangeListener;
        if (onCheckedStateChangeListener != null) {
            new HashSet(this.checkedIds);
            ChipGroup chipGroup = ChipGroup.this;
            int i = ChipGroup.$r8$clinit;
            chipGroup.getClass();
        }
    }

    public final boolean checkInternal(MaterialCheckable<T> materialCheckable) {
        int i;
        int id = materialCheckable.getId();
        if (this.checkedIds.contains(Integer.valueOf(id))) {
            return false;
        }
        HashMap hashMap = this.checkables;
        if (!this.singleSelection || this.checkedIds.isEmpty()) {
            i = -1;
        } else {
            i = ((Integer) this.checkedIds.iterator().next()).intValue();
        }
        MaterialCheckable<T> materialCheckable2 = (MaterialCheckable) hashMap.get(Integer.valueOf(i));
        if (materialCheckable2 != null) {
            uncheckInternal(materialCheckable2, false);
        }
        boolean add = this.checkedIds.add(Integer.valueOf(id));
        if (!materialCheckable.isChecked()) {
            materialCheckable.setChecked(true);
        }
        return add;
    }

    public final boolean uncheckInternal(MaterialCheckable<T> materialCheckable, boolean z) {
        int id = materialCheckable.getId();
        if (!this.checkedIds.contains(Integer.valueOf(id))) {
            return false;
        }
        if (!z || this.checkedIds.size() != 1 || !this.checkedIds.contains(Integer.valueOf(id))) {
            boolean remove = this.checkedIds.remove(Integer.valueOf(id));
            if (materialCheckable.isChecked()) {
                materialCheckable.setChecked(false);
            }
            return remove;
        }
        materialCheckable.setChecked(true);
        return false;
    }
}
