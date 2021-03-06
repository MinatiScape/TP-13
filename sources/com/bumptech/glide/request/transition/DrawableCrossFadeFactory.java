package com.bumptech.glide.request.transition;

import android.graphics.drawable.Drawable;
import com.bumptech.glide.load.DataSource;
/* loaded from: classes.dex */
public final class DrawableCrossFadeFactory implements TransitionFactory<Drawable> {
    public final int duration;
    public DrawableCrossFadeTransition resourceTransition;

    @Override // com.bumptech.glide.request.transition.TransitionFactory
    public final Transition<Drawable> build(DataSource dataSource, boolean z) {
        if (dataSource == DataSource.MEMORY_CACHE) {
            return NoTransition.NO_ANIMATION;
        }
        if (this.resourceTransition == null) {
            this.resourceTransition = new DrawableCrossFadeTransition(this.duration, false);
        }
        return this.resourceTransition;
    }

    public DrawableCrossFadeFactory(int i) {
        this.duration = i;
    }
}
