package com.bumptech.glide.util.pool;
/* loaded from: classes.dex */
public abstract class StateVerifier {

    /* loaded from: classes.dex */
    public static class DefaultStateVerifier extends StateVerifier {
        public volatile boolean isReleased;

        public final void throwIfRecycled() {
            if (this.isReleased) {
                throw new IllegalStateException("Already released");
            }
        }
    }
}
