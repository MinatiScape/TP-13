package androidx.fragment.app;

import android.transition.Transition;
import android.view.View;
import android.view.ViewGroup;
import androidx.collection.ArrayMap;
import androidx.core.os.CancellationSignal;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.fragment.app.FragmentAnim;
import androidx.fragment.app.SpecialEffectsController;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public final class DefaultSpecialEffectsController extends SpecialEffectsController {

    /* renamed from: androidx.fragment.app.DefaultSpecialEffectsController$9  reason: invalid class name */
    /* loaded from: classes.dex */
    public final class AnonymousClass9 implements Runnable {
        public final /* synthetic */ TransitionInfo val$transitionInfo;

        public AnonymousClass9(TransitionInfo transitionInfo) {
            this.val$transitionInfo = transitionInfo;
        }

        @Override // java.lang.Runnable
        public final void run() {
            this.val$transitionInfo.completeSpecialEffect();
        }
    }

    /* loaded from: classes.dex */
    public static class AnimationInfo extends SpecialEffectsInfo {
        public FragmentAnim.AnimationOrAnimator mAnimation;
        public boolean mIsPop;
        public boolean mLoadedAnim = false;

        /* JADX WARN: Removed duplicated region for block: B:28:0x0046  */
        /* JADX WARN: Removed duplicated region for block: B:33:0x0058  */
        /* JADX WARN: Removed duplicated region for block: B:36:0x0062 A[ADDED_TO_REGION] */
        /* JADX WARN: Removed duplicated region for block: B:39:0x0068  */
        /* JADX WARN: Removed duplicated region for block: B:60:0x00b2  */
        /* JADX WARN: Removed duplicated region for block: B:65:0x00be  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final androidx.fragment.app.FragmentAnim.AnimationOrAnimator getAnimation(android.content.Context r10) {
            /*
                Method dump skipped, instructions count: 259
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: androidx.fragment.app.DefaultSpecialEffectsController.AnimationInfo.getAnimation(android.content.Context):androidx.fragment.app.FragmentAnim$AnimationOrAnimator");
        }

        public AnimationInfo(SpecialEffectsController.Operation operation, CancellationSignal cancellationSignal, boolean z) {
            super(operation, cancellationSignal);
            this.mIsPop = z;
        }
    }

    /* loaded from: classes.dex */
    public static class SpecialEffectsInfo {
        public final SpecialEffectsController.Operation mOperation;
        public final CancellationSignal mSignal;

        public final void completeSpecialEffect() {
            SpecialEffectsController.Operation operation = this.mOperation;
            if (operation.mSpecialEffectsSignals.remove(this.mSignal) && operation.mSpecialEffectsSignals.isEmpty()) {
                operation.complete();
            }
        }

        public final boolean isVisibilityUnchanged() {
            SpecialEffectsController.Operation.State state;
            SpecialEffectsController.Operation.State from = SpecialEffectsController.Operation.State.from(this.mOperation.mFragment.mView);
            SpecialEffectsController.Operation.State state2 = this.mOperation.mFinalState;
            if (from == state2 || (from != (state = SpecialEffectsController.Operation.State.VISIBLE) && state2 != state)) {
                return true;
            }
            return false;
        }

        public SpecialEffectsInfo(SpecialEffectsController.Operation operation, CancellationSignal cancellationSignal) {
            this.mOperation = operation;
            this.mSignal = cancellationSignal;
        }
    }

    /* loaded from: classes.dex */
    public static class TransitionInfo extends SpecialEffectsInfo {
        public final boolean mOverlapAllowed;
        public final Object mSharedElementTransition;
        public final Object mTransition;

        public final FragmentTransitionImpl getHandlingImpl(Object obj) {
            if (obj == null) {
                return null;
            }
            FragmentTransitionCompat21 fragmentTransitionCompat21 = FragmentTransition.PLATFORM_IMPL;
            if (obj instanceof Transition) {
                return fragmentTransitionCompat21;
            }
            FragmentTransitionImpl fragmentTransitionImpl = FragmentTransition.SUPPORT_IMPL;
            if (fragmentTransitionImpl != null && fragmentTransitionImpl.canHandle(obj)) {
                return fragmentTransitionImpl;
            }
            throw new IllegalArgumentException("Transition " + obj + " for fragment " + this.mOperation.mFragment + " is not a valid framework Transition or AndroidX Transition");
        }

        /* JADX WARN: Code restructure failed: missing block: B:20:0x003e, code lost:
            if (r5 == androidx.fragment.app.Fragment.USE_DEFAULT_TRANSITION) goto L22;
         */
        /* JADX WARN: Code restructure failed: missing block: B:8:0x0018, code lost:
            if (r5 == androidx.fragment.app.Fragment.USE_DEFAULT_TRANSITION) goto L10;
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public TransitionInfo(androidx.fragment.app.SpecialEffectsController.Operation r4, androidx.core.os.CancellationSignal r5, boolean r6, boolean r7) {
            /*
                r3 = this;
                r3.<init>(r4, r5)
                androidx.fragment.app.SpecialEffectsController$Operation$State r5 = r4.mFinalState
                androidx.fragment.app.SpecialEffectsController$Operation$State r0 = androidx.fragment.app.SpecialEffectsController.Operation.State.VISIBLE
                r1 = 1
                r2 = 0
                if (r5 != r0) goto L31
                if (r6 == 0) goto L1b
                androidx.fragment.app.Fragment r5 = r4.mFragment
                androidx.fragment.app.Fragment$AnimationInfo r5 = r5.mAnimationInfo
                if (r5 != 0) goto L14
                goto L20
            L14:
                java.lang.Object r5 = r5.mReenterTransition
                java.lang.Object r0 = androidx.fragment.app.Fragment.USE_DEFAULT_TRANSITION
                if (r5 != r0) goto L21
                goto L20
            L1b:
                androidx.fragment.app.Fragment r5 = r4.mFragment
                r5.getClass()
            L20:
                r5 = r2
            L21:
                r3.mTransition = r5
                if (r6 == 0) goto L2a
                androidx.fragment.app.Fragment r5 = r4.mFragment
                androidx.fragment.app.Fragment$AnimationInfo r5 = r5.mAnimationInfo
                goto L2e
            L2a:
                androidx.fragment.app.Fragment r5 = r4.mFragment
                androidx.fragment.app.Fragment$AnimationInfo r5 = r5.mAnimationInfo
            L2e:
                r3.mOverlapAllowed = r1
                goto L4b
            L31:
                if (r6 == 0) goto L41
                androidx.fragment.app.Fragment r5 = r4.mFragment
                androidx.fragment.app.Fragment$AnimationInfo r5 = r5.mAnimationInfo
                if (r5 != 0) goto L3a
                goto L46
            L3a:
                java.lang.Object r5 = r5.mReturnTransition
                java.lang.Object r0 = androidx.fragment.app.Fragment.USE_DEFAULT_TRANSITION
                if (r5 != r0) goto L47
                goto L46
            L41:
                androidx.fragment.app.Fragment r5 = r4.mFragment
                r5.getClass()
            L46:
                r5 = r2
            L47:
                r3.mTransition = r5
                r3.mOverlapAllowed = r1
            L4b:
                if (r7 == 0) goto L69
                if (r6 == 0) goto L61
                androidx.fragment.app.Fragment r4 = r4.mFragment
                androidx.fragment.app.Fragment$AnimationInfo r4 = r4.mAnimationInfo
                if (r4 != 0) goto L56
                goto L5e
            L56:
                java.lang.Object r4 = r4.mSharedElementReturnTransition
                java.lang.Object r5 = androidx.fragment.app.Fragment.USE_DEFAULT_TRANSITION
                if (r4 != r5) goto L5d
                goto L5e
            L5d:
                r2 = r4
            L5e:
                r3.mSharedElementTransition = r2
                goto L6b
            L61:
                androidx.fragment.app.Fragment r4 = r4.mFragment
                r4.getClass()
                r3.mSharedElementTransition = r2
                goto L6b
            L69:
                r3.mSharedElementTransition = r2
            L6b:
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: androidx.fragment.app.DefaultSpecialEffectsController.TransitionInfo.<init>(androidx.fragment.app.SpecialEffectsController$Operation, androidx.core.os.CancellationSignal, boolean, boolean):void");
        }
    }

    public static void captureTransitioningViews(ArrayList arrayList, View view) {
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            if (!viewGroup.isTransitionGroup()) {
                int childCount = viewGroup.getChildCount();
                for (int i = 0; i < childCount; i++) {
                    View childAt = viewGroup.getChildAt(i);
                    if (childAt.getVisibility() == 0) {
                        captureTransitioningViews(arrayList, childAt);
                    }
                }
            } else if (!arrayList.contains(view)) {
                arrayList.add(viewGroup);
            }
        } else if (!arrayList.contains(view)) {
            arrayList.add(view);
        }
    }

    public static void findNamedViews(ArrayMap arrayMap, View view) {
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        String transitionName = ViewCompat.Api21Impl.getTransitionName(view);
        if (transitionName != null) {
            arrayMap.put(transitionName, view);
        }
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            int childCount = viewGroup.getChildCount();
            for (int i = 0; i < childCount; i++) {
                View childAt = viewGroup.getChildAt(i);
                if (childAt.getVisibility() == 0) {
                    findNamedViews(arrayMap, childAt);
                }
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:208:0x0601  */
    /* JADX WARN: Removed duplicated region for block: B:237:0x06b6  */
    /* JADX WARN: Removed duplicated region for block: B:256:0x074e A[LOOP:15: B:254:0x0748->B:256:0x074e, LOOP_END] */
    @Override // androidx.fragment.app.SpecialEffectsController
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void executeOperations(java.util.ArrayList r35, final boolean r36) {
        /*
            Method dump skipped, instructions count: 1890
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.fragment.app.DefaultSpecialEffectsController.executeOperations(java.util.ArrayList, boolean):void");
    }

    public static void retainMatchingViews(ArrayMap arrayMap, Collection collection) {
        Iterator it = ((ArrayMap.EntrySet) arrayMap.entrySet()).iterator();
        while (true) {
            ArrayMap.MapIterator mapIterator = (ArrayMap.MapIterator) it;
            if (mapIterator.hasNext()) {
                mapIterator.next();
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                if (!collection.contains(ViewCompat.Api21Impl.getTransitionName((View) mapIterator.getValue()))) {
                    mapIterator.remove();
                }
            } else {
                return;
            }
        }
    }

    public DefaultSpecialEffectsController(ViewGroup viewGroup) {
        super(viewGroup);
    }
}
