package com.bumptech.glide.request.transition;

import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.request.transition.Transition;
/* loaded from: classes.dex */
public final class NoTransition<R> implements Transition<R> {
    public static final NoTransition<?> NO_ANIMATION = new NoTransition<>();
    public static final NoAnimationFactory NO_ANIMATION_FACTORY = new NoAnimationFactory();

    @Override // com.bumptech.glide.request.transition.Transition
    public final boolean transition(Object obj, Transition.ViewAdapter viewAdapter) {
        return false;
    }

    /* loaded from: classes.dex */
    public static class NoAnimationFactory<R> implements TransitionFactory<R> {
        @Override // com.bumptech.glide.request.transition.TransitionFactory
        public final Transition<R> build(DataSource dataSource, boolean z) {
            return NoTransition.NO_ANIMATION;
        }
    }
}
