package com.bumptech.glide.request.transition;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.request.target.ViewTarget;
import com.bumptech.glide.request.transition.Transition;
/* loaded from: classes.dex */
public abstract class BitmapContainerTransitionFactory<R> implements TransitionFactory<R> {
    public final TransitionFactory<Drawable> realFactory;

    /* loaded from: classes.dex */
    public final class BitmapGlideAnimation implements Transition<R> {
        public final Transition<Drawable> transition;

        @Override // com.bumptech.glide.request.transition.Transition
        public final boolean transition(R r, Transition.ViewAdapter viewAdapter) {
            Resources resources = ((ViewTarget) viewAdapter).view.getResources();
            ((BitmapTransitionFactory) BitmapContainerTransitionFactory.this).getClass();
            return this.transition.transition(new BitmapDrawable(resources, (Bitmap) r), viewAdapter);
        }

        public BitmapGlideAnimation(Transition<Drawable> transition) {
            this.transition = transition;
        }
    }

    @Override // com.bumptech.glide.request.transition.TransitionFactory
    public final Transition<R> build(DataSource dataSource, boolean z) {
        return new BitmapGlideAnimation(this.realFactory.build(dataSource, z));
    }

    public BitmapContainerTransitionFactory(DrawableCrossFadeFactory drawableCrossFadeFactory) {
        this.realFactory = drawableCrossFadeFactory;
    }
}
