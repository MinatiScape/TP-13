package com.google.android.material.snackbar;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.google.android.material.snackbar.BaseTransientBottomBar;
import java.lang.ref.WeakReference;
/* loaded from: classes.dex */
public final class SnackbarManager {
    public static SnackbarManager snackbarManager;
    public SnackbarRecord currentSnackbar;
    public SnackbarRecord nextSnackbar;
    public final Object lock = new Object();
    public final Handler handler = new Handler(Looper.getMainLooper(), new Handler.Callback() { // from class: com.google.android.material.snackbar.SnackbarManager.1
        @Override // android.os.Handler.Callback
        public final boolean handleMessage(Message message) {
            if (message.what != 0) {
                return false;
            }
            SnackbarManager snackbarManager2 = SnackbarManager.this;
            SnackbarRecord snackbarRecord = (SnackbarRecord) message.obj;
            synchronized (snackbarManager2.lock) {
                if (snackbarManager2.currentSnackbar == snackbarRecord || snackbarManager2.nextSnackbar == snackbarRecord) {
                    snackbarManager2.cancelSnackbarLocked(snackbarRecord, 2);
                }
            }
            return true;
        }
    });

    /* loaded from: classes.dex */
    public interface Callback {
        void dismiss(int i);

        void show();
    }

    /* loaded from: classes.dex */
    public static class SnackbarRecord {
        public final WeakReference<Callback> callback;
        public int duration;
        public boolean paused;

        public SnackbarRecord(int i, BaseTransientBottomBar.AnonymousClass5 r3) {
            this.callback = new WeakReference<>(r3);
            this.duration = i;
        }
    }

    public static SnackbarManager getInstance() {
        if (snackbarManager == null) {
            snackbarManager = new SnackbarManager();
        }
        return snackbarManager;
    }

    public final boolean cancelSnackbarLocked(SnackbarRecord snackbarRecord, int i) {
        Callback callback = snackbarRecord.callback.get();
        if (callback == null) {
            return false;
        }
        this.handler.removeCallbacksAndMessages(snackbarRecord);
        callback.dismiss(i);
        return true;
    }

    public final boolean isCurrentSnackbarLocked(BaseTransientBottomBar.AnonymousClass5 r3) {
        boolean z;
        SnackbarRecord snackbarRecord = this.currentSnackbar;
        if (snackbarRecord != null) {
            if (r3 == null || snackbarRecord.callback.get() != r3) {
                z = false;
            } else {
                z = true;
            }
            if (z) {
                return true;
            }
        }
        return false;
    }

    public final void scheduleTimeoutLocked(SnackbarRecord snackbarRecord) {
        int i = snackbarRecord.duration;
        if (i != -2) {
            if (i <= 0) {
                if (i == -1) {
                    i = 1500;
                } else {
                    i = 2750;
                }
            }
            this.handler.removeCallbacksAndMessages(snackbarRecord);
            Handler handler = this.handler;
            handler.sendMessageDelayed(Message.obtain(handler, 0, snackbarRecord), i);
        }
    }
}
