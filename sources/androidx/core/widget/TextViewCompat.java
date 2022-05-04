package androidx.core.widget;

import android.view.ActionMode;
import android.view.Menu;
import android.view.MenuItem;
/* loaded from: classes.dex */
public final class TextViewCompat {
    public static ActionMode.Callback unwrapCustomSelectionActionModeCallback(ActionMode.Callback callback) {
        if (!(callback instanceof OreoCallback)) {
            return callback;
        }
        ((OreoCallback) callback).getClass();
        return null;
    }

    /* loaded from: classes.dex */
    public static class OreoCallback implements ActionMode.Callback {
        public OreoCallback() {
            throw null;
        }

        @Override // android.view.ActionMode.Callback
        public final boolean onActionItemClicked(ActionMode actionMode, MenuItem menuItem) {
            throw null;
        }

        @Override // android.view.ActionMode.Callback
        public final boolean onCreateActionMode(ActionMode actionMode, Menu menu) {
            throw null;
        }

        @Override // android.view.ActionMode.Callback
        public final boolean onPrepareActionMode(ActionMode actionMode, Menu menu) {
            throw null;
        }

        @Override // android.view.ActionMode.Callback
        public final void onDestroyActionMode(ActionMode actionMode) {
            throw null;
        }
    }
}
