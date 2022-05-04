package com.bumptech.glide.load.engine;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
/* loaded from: classes.dex */
public final class ResourceRecycler {
    public final Handler handler = new Handler(Looper.getMainLooper(), new ResourceRecyclerCallback());
    public boolean isRecycling;

    /* loaded from: classes.dex */
    public static final class ResourceRecyclerCallback implements Handler.Callback {
        @Override // android.os.Handler.Callback
        public final boolean handleMessage(Message message) {
            if (message.what != 1) {
                return false;
            }
            ((Resource) message.obj).recycle();
            return true;
        }
    }

    public final synchronized void recycle(Resource<?> resource, boolean z) {
        if (!this.isRecycling && !z) {
            this.isRecycling = true;
            resource.recycle();
            this.isRecycling = false;
        }
        this.handler.obtainMessage(1, resource).sendToTarget();
    }
}
