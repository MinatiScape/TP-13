package com.bumptech.glide.request.transition;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.request.target.ViewTarget;
import com.bumptech.glide.request.transition.Transition;
import java.util.Objects;
/* loaded from: classes.dex */
public abstract class BitmapContainerTransitionFactory<R> implements TransitionFactory<R> {
    public final TransitionFactory<Drawable> realFactory;

    /* loaded from: classes.dex */
    public final class BitmapGlideAnimation implements Transition<R> {
        public final Transition<Drawable> transition;

        public BitmapGlideAnimation(Transition<Drawable> transition) {
            this.transition = transition;
        }

        @Override // com.bumptech.glide.request.transition.Transition
        public boolean transition(R current, Transition.ViewAdapter adapter) {
            Resources resources = ((ViewTarget) adapter).view.getResources();
            Objects.requireNonNull((BitmapTransitionFactory) BitmapContainerTransitionFactory.this);
            return this.transition.transition(new BitmapDrawable(resources, (Bitmap) current), adapter);
        }
    }

    public BitmapContainerTransitionFactory(TransitionFactory<Drawable> realFactory) {
        this.realFactory = realFactory;
    }

    @Override // com.bumptech.glide.request.transition.TransitionFactory
    public Transition<R> build(DataSource dataSource, boolean isFirstResource) {
        return new BitmapGlideAnimation(this.realFactory.build(dataSource, isFirstResource));
    }
}
