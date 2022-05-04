package androidx.fragment.app;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.content.Context;
import android.graphics.Rect;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.transition.Transition;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import androidx.collection.ArrayMap;
import androidx.collection.IndexBasedArrayIterator;
import androidx.core.os.CancellationSignal;
import androidx.core.view.OneShotPreDrawListener;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentAnim;
import androidx.fragment.app.SpecialEffectsController;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public class DefaultSpecialEffectsController extends SpecialEffectsController {

    /* loaded from: classes.dex */
    public static class AnimationInfo extends SpecialEffectsInfo {
        public FragmentAnim.AnimationOrAnimator mAnimation;
        public boolean mLoadedAnim = false;

        public AnimationInfo(SpecialEffectsController.Operation operation, CancellationSignal cancellationSignal) {
            super(operation, cancellationSignal);
        }

        public FragmentAnim.AnimationOrAnimator getAnimation(Context context) {
            if (this.mLoadedAnim) {
                return this.mAnimation;
            }
            SpecialEffectsController.Operation operation = this.mOperation;
            FragmentAnim.AnimationOrAnimator loadAnimation = FragmentAnim.loadAnimation(context, operation.mFragment, operation.mFinalState == SpecialEffectsController.Operation.State.VISIBLE);
            this.mAnimation = loadAnimation;
            this.mLoadedAnim = true;
            return loadAnimation;
        }
    }

    /* loaded from: classes.dex */
    public static class SpecialEffectsInfo {
        public final SpecialEffectsController.Operation mOperation;
        public final CancellationSignal mSignal;

        public SpecialEffectsInfo(SpecialEffectsController.Operation operation, CancellationSignal cancellationSignal) {
            this.mOperation = operation;
            this.mSignal = cancellationSignal;
        }

        public void completeSpecialEffect() {
            SpecialEffectsController.Operation operation = this.mOperation;
            if (operation.mSpecialEffectsSignals.remove(this.mSignal) && operation.mSpecialEffectsSignals.isEmpty()) {
                operation.complete();
            }
        }

        public boolean isVisibilityUnchanged() {
            SpecialEffectsController.Operation.State state;
            SpecialEffectsController.Operation.State from = SpecialEffectsController.Operation.State.from(this.mOperation.mFragment.mView);
            SpecialEffectsController.Operation.State state2 = this.mOperation.mFinalState;
            return from == state2 || !(from == (state = SpecialEffectsController.Operation.State.VISIBLE) || state2 == state);
        }
    }

    /* loaded from: classes.dex */
    public static class TransitionInfo extends SpecialEffectsInfo {
        public final boolean mOverlapAllowed;
        public final Object mSharedElementTransition;
        public final Object mTransition;

        public TransitionInfo(SpecialEffectsController.Operation operation, CancellationSignal cancellationSignal, boolean z, boolean z2) {
            super(operation, cancellationSignal);
            Object obj;
            Object obj2;
            if (operation.mFinalState == SpecialEffectsController.Operation.State.VISIBLE) {
                if (z) {
                    obj2 = operation.mFragment.getReenterTransition();
                } else {
                    operation.mFragment.getEnterTransition();
                    obj2 = null;
                }
                this.mTransition = obj2;
                if (z) {
                    Fragment.AnimationInfo animationInfo = operation.mFragment.mAnimationInfo;
                } else {
                    Fragment.AnimationInfo animationInfo2 = operation.mFragment.mAnimationInfo;
                }
                this.mOverlapAllowed = true;
            } else {
                if (z) {
                    obj = operation.mFragment.getReturnTransition();
                } else {
                    operation.mFragment.getExitTransition();
                    obj = null;
                }
                this.mTransition = obj;
                this.mOverlapAllowed = true;
            }
            if (!z2) {
                this.mSharedElementTransition = null;
            } else if (z) {
                this.mSharedElementTransition = operation.mFragment.getSharedElementReturnTransition();
            } else {
                operation.mFragment.getSharedElementEnterTransition();
                this.mSharedElementTransition = null;
            }
        }

        public final FragmentTransitionImpl getHandlingImpl(Object obj) {
            if (obj == null) {
                return null;
            }
            FragmentTransitionImpl fragmentTransitionImpl = FragmentTransition.PLATFORM_IMPL;
            if (obj instanceof Transition) {
                return fragmentTransitionImpl;
            }
            FragmentTransitionImpl fragmentTransitionImpl2 = FragmentTransition.SUPPORT_IMPL;
            if (fragmentTransitionImpl2 != null && fragmentTransitionImpl2.canHandle(obj)) {
                return fragmentTransitionImpl2;
            }
            throw new IllegalArgumentException("Transition " + obj + " for fragment " + this.mOperation.mFragment + " is not a valid framework Transition or AndroidX Transition");
        }
    }

    public DefaultSpecialEffectsController(ViewGroup viewGroup) {
        super(viewGroup);
    }

    public void captureTransitioningViews(ArrayList<View> arrayList, View view) {
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            if (viewGroup.isTransitionGroup()) {
                arrayList.add(viewGroup);
                return;
            }
            int childCount = viewGroup.getChildCount();
            for (int i = 0; i < childCount; i++) {
                View childAt = viewGroup.getChildAt(i);
                if (childAt.getVisibility() == 0) {
                    captureTransitioningViews(arrayList, childAt);
                }
            }
            return;
        }
        arrayList.add(view);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // androidx.fragment.app.SpecialEffectsController
    public void executeOperations(List<SpecialEffectsController.Operation> list, final boolean z) {
        ArrayList arrayList;
        ArrayList arrayList2;
        SpecialEffectsController.Operation.State state;
        boolean z2;
        HashMap hashMap;
        boolean z3;
        boolean z4;
        HashMap hashMap2;
        ArrayList arrayList3;
        Iterator it;
        SpecialEffectsController.Operation operation;
        Object obj;
        View view;
        SpecialEffectsController.Operation.State state2;
        Object obj2;
        SpecialEffectsController.Operation operation2;
        SpecialEffectsController.Operation.State state3;
        View view2;
        Object obj3;
        ArrayMap arrayMap;
        ArrayList arrayList4;
        SpecialEffectsController.Operation.State state4;
        SpecialEffectsController.Operation.State state5;
        ArrayList<View> arrayList5;
        final FragmentTransitionImpl fragmentTransitionImpl;
        SpecialEffectsController.Operation operation3;
        HashMap hashMap3;
        ArrayList<View> arrayList6;
        final Rect rect;
        View view3;
        SpecialEffectsController.Operation operation4;
        ArrayList<String> arrayList7;
        ArrayList<String> arrayList8;
        ArrayList<String> arrayList9;
        ArrayList<String> arrayList10;
        View view4;
        final View view5;
        boolean z5 = z;
        SpecialEffectsController.Operation.State state6 = SpecialEffectsController.Operation.State.GONE;
        SpecialEffectsController.Operation.State state7 = SpecialEffectsController.Operation.State.VISIBLE;
        SpecialEffectsController.Operation operation5 = null;
        SpecialEffectsController.Operation operation6 = null;
        for (SpecialEffectsController.Operation operation7 : list) {
            SpecialEffectsController.Operation.State from = SpecialEffectsController.Operation.State.from(operation7.mFragment.mView);
            int ordinal = operation7.mFinalState.ordinal();
            if (ordinal != 0) {
                if (ordinal != 1) {
                    if (!(ordinal == 2 || ordinal == 3)) {
                    }
                } else if (from != state7) {
                    operation6 = operation7;
                }
            }
            if (from == state7 && operation5 == null) {
                operation5 = operation7;
            }
        }
        ArrayList arrayList11 = new ArrayList();
        ArrayList arrayList12 = new ArrayList();
        final ArrayList arrayList13 = new ArrayList(list);
        Iterator<SpecialEffectsController.Operation> it2 = list.iterator();
        while (it2.hasNext()) {
            final SpecialEffectsController.Operation next = it2.next();
            CancellationSignal cancellationSignal = new CancellationSignal();
            next.onStart();
            next.mSpecialEffectsSignals.add(cancellationSignal);
            arrayList11.add(new AnimationInfo(next, cancellationSignal));
            CancellationSignal cancellationSignal2 = new CancellationSignal();
            next.onStart();
            next.mSpecialEffectsSignals.add(cancellationSignal2);
            arrayList12.add(new TransitionInfo(next, cancellationSignal2, z5, !z5 ? next == operation6 : next == operation5));
            next.mCompletionListeners.add(new Runnable() { // from class: androidx.fragment.app.DefaultSpecialEffectsController.1
                @Override // java.lang.Runnable
                public void run() {
                    if (arrayList13.contains(next)) {
                        arrayList13.remove(next);
                        DefaultSpecialEffectsController defaultSpecialEffectsController = DefaultSpecialEffectsController.this;
                        SpecialEffectsController.Operation operation8 = next;
                        Objects.requireNonNull(defaultSpecialEffectsController);
                        operation8.mFinalState.applyState(operation8.mFragment.mView);
                    }
                }
            });
        }
        HashMap hashMap4 = new HashMap();
        Iterator it3 = arrayList12.iterator();
        FragmentTransitionImpl fragmentTransitionImpl2 = null;
        while (it3.hasNext()) {
            TransitionInfo transitionInfo = (TransitionInfo) it3.next();
            if (!transitionInfo.isVisibilityUnchanged()) {
                FragmentTransitionImpl handlingImpl = transitionInfo.getHandlingImpl(transitionInfo.mTransition);
                FragmentTransitionImpl handlingImpl2 = transitionInfo.getHandlingImpl(transitionInfo.mSharedElementTransition);
                if (handlingImpl == null || handlingImpl2 == null || handlingImpl == handlingImpl2) {
                    if (handlingImpl == null) {
                        handlingImpl = handlingImpl2;
                    }
                    if (fragmentTransitionImpl2 == null) {
                        fragmentTransitionImpl2 = handlingImpl;
                    } else if (!(handlingImpl == null || fragmentTransitionImpl2 == handlingImpl)) {
                        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Mixing framework transitions and AndroidX transitions is not allowed. Fragment ");
                        m.append(transitionInfo.mOperation.mFragment);
                        m.append(" returned Transition ");
                        m.append(transitionInfo.mTransition);
                        m.append(" which uses a different Transition  type than other Fragments.");
                        throw new IllegalArgumentException(m.toString());
                    }
                } else {
                    StringBuilder m2 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Mixing framework transitions and AndroidX transitions is not allowed. Fragment ");
                    m2.append(transitionInfo.mOperation.mFragment);
                    m2.append(" returned Transition ");
                    m2.append(transitionInfo.mTransition);
                    m2.append(" which uses a different Transition  type than its shared element transition ");
                    m2.append(transitionInfo.mSharedElementTransition);
                    throw new IllegalArgumentException(m2.toString());
                }
            }
        }
        if (fragmentTransitionImpl2 == null) {
            Iterator it4 = arrayList12.iterator();
            while (it4.hasNext()) {
                TransitionInfo transitionInfo2 = (TransitionInfo) it4.next();
                hashMap4.put(transitionInfo2.mOperation, Boolean.FALSE);
                transitionInfo2.completeSpecialEffect();
            }
            z3 = false;
            z2 = true;
            arrayList = arrayList11;
            arrayList2 = arrayList13;
            state = state6;
            hashMap = hashMap4;
        } else {
            View view6 = new View(this.mContainer.getContext());
            Rect rect2 = new Rect();
            ArrayList<View> arrayList14 = new ArrayList<>();
            ArrayList<View> arrayList15 = new ArrayList<>();
            ArrayMap arrayMap2 = new ArrayMap();
            Iterator it5 = arrayList12.iterator();
            Object obj4 = null;
            View view7 = null;
            boolean z6 = false;
            Rect rect3 = rect2;
            arrayList = arrayList11;
            arrayList2 = arrayList13;
            View view8 = view6;
            SpecialEffectsController.Operation operation8 = operation5;
            SpecialEffectsController.Operation operation9 = operation6;
            while (it5.hasNext()) {
                View view9 = view7;
                Object obj5 = ((TransitionInfo) it5.next()).mSharedElementTransition;
                if (!(obj5 != null) || operation8 == null || operation9 == null) {
                    arrayMap = arrayMap2;
                    arrayList6 = arrayList14;
                    state4 = state6;
                    state5 = state7;
                    operation3 = operation5;
                    operation4 = operation9;
                    arrayList4 = arrayList12;
                    hashMap3 = hashMap4;
                    arrayList5 = arrayList15;
                    fragmentTransitionImpl = fragmentTransitionImpl2;
                    view3 = view8;
                    rect = rect3;
                } else {
                    Object wrapTransitionInSet = fragmentTransitionImpl2.wrapTransitionInSet(fragmentTransitionImpl2.cloneTransition(obj5));
                    Fragment.AnimationInfo animationInfo = operation9.mFragment.mAnimationInfo;
                    if (animationInfo == null || (arrayList7 = animationInfo.mSharedElementSourceNames) == null) {
                        arrayList7 = new ArrayList<>();
                    }
                    FragmentTransitionImpl fragmentTransitionImpl3 = fragmentTransitionImpl2;
                    Fragment.AnimationInfo animationInfo2 = operation8.mFragment.mAnimationInfo;
                    if (animationInfo2 == null || (arrayList8 = animationInfo2.mSharedElementSourceNames) == null) {
                        arrayList8 = new ArrayList<>();
                    }
                    state5 = state7;
                    Fragment.AnimationInfo animationInfo3 = operation8.mFragment.mAnimationInfo;
                    if (animationInfo3 == null || (arrayList9 = animationInfo3.mSharedElementTargetNames) == null) {
                        arrayList9 = new ArrayList<>();
                    }
                    state4 = state6;
                    arrayList4 = arrayList12;
                    for (int i = 0; i < arrayList9.size(); i++) {
                        int indexOf = arrayList7.indexOf(arrayList9.get(i));
                        arrayList9 = arrayList9;
                        if (indexOf != -1) {
                            arrayList7.set(indexOf, arrayList8.get(i));
                        }
                    }
                    Fragment.AnimationInfo animationInfo4 = operation9.mFragment.mAnimationInfo;
                    if (animationInfo4 == null || (arrayList10 = animationInfo4.mSharedElementTargetNames) == null) {
                        arrayList10 = new ArrayList<>();
                    }
                    ArrayList<String> arrayList16 = arrayList10;
                    if (!z5) {
                        operation8.mFragment.getExitTransitionCallback();
                        operation9.mFragment.getEnterTransitionCallback();
                    } else {
                        operation8.mFragment.getEnterTransitionCallback();
                        operation9.mFragment.getExitTransitionCallback();
                    }
                    int size = arrayList7.size();
                    for (int i2 = 0; i2 < size; i2++) {
                        size = size;
                        arrayMap2.put(arrayList7.get(i2), arrayList16.get(i2));
                    }
                    ArrayMap<String, View> arrayMap3 = new ArrayMap<>();
                    findNamedViews(arrayMap3, operation8.mFragment.mView);
                    arrayMap3.retainAll(arrayList7);
                    arrayMap2.retainAll(arrayMap3.keySet());
                    final ArrayMap<String, View> arrayMap4 = new ArrayMap<>();
                    findNamedViews(arrayMap4, operation9.mFragment.mView);
                    arrayMap4.retainAll(arrayList16);
                    arrayMap4.retainAll(arrayMap2.values());
                    FragmentTransition.retainValues(arrayMap2, arrayMap4);
                    retainMatchingViews(arrayMap3, arrayMap2.keySet());
                    retainMatchingViews(arrayMap4, arrayMap2.values());
                    if (arrayMap2.isEmpty()) {
                        arrayList14.clear();
                        arrayList15.clear();
                        obj4 = null;
                        rect = rect3;
                        arrayMap = arrayMap2;
                        arrayList6 = arrayList14;
                        operation3 = operation5;
                        operation4 = operation9;
                        hashMap3 = hashMap4;
                        fragmentTransitionImpl = fragmentTransitionImpl3;
                        arrayList5 = arrayList15;
                        view3 = view8;
                    } else {
                        FragmentTransition.callSharedElementStartEnd(operation9.mFragment, operation8.mFragment, z5, arrayMap3, true);
                        arrayMap = arrayMap2;
                        arrayList5 = arrayList15;
                        arrayList6 = arrayList14;
                        final SpecialEffectsController.Operation operation10 = operation6;
                        operation6 = operation6;
                        Rect rect4 = rect3;
                        ArrayList<String> arrayList17 = arrayList7;
                        final SpecialEffectsController.Operation operation11 = operation5;
                        operation3 = operation5;
                        hashMap3 = hashMap4;
                        View view10 = view8;
                        fragmentTransitionImpl = fragmentTransitionImpl3;
                        OneShotPreDrawListener.add(this.mContainer, new Runnable(this) { // from class: androidx.fragment.app.DefaultSpecialEffectsController.6
                            @Override // java.lang.Runnable
                            public void run() {
                                FragmentTransition.callSharedElementStartEnd(operation10.mFragment, operation11.mFragment, z, arrayMap4, false);
                            }
                        });
                        Iterator it6 = ((ArrayMap.ValueCollection) arrayMap3.values()).iterator();
                        while (true) {
                            IndexBasedArrayIterator indexBasedArrayIterator = (IndexBasedArrayIterator) it6;
                            if (!indexBasedArrayIterator.hasNext()) {
                                break;
                            }
                            captureTransitioningViews(arrayList6, (View) indexBasedArrayIterator.next());
                        }
                        if (!arrayList17.isEmpty()) {
                            view4 = arrayMap3.get(arrayList17.get(0));
                            fragmentTransitionImpl.setEpicenter(wrapTransitionInSet, view4);
                        } else {
                            view4 = view9;
                        }
                        Iterator it7 = ((ArrayMap.ValueCollection) arrayMap4.values()).iterator();
                        while (true) {
                            IndexBasedArrayIterator indexBasedArrayIterator2 = (IndexBasedArrayIterator) it7;
                            if (!indexBasedArrayIterator2.hasNext()) {
                                break;
                            }
                            captureTransitioningViews(arrayList5, (View) indexBasedArrayIterator2.next());
                        }
                        if (arrayList16.isEmpty() || (view5 = arrayMap4.get(arrayList16.get(0))) == null) {
                            rect = rect4;
                            view3 = view10;
                        } else {
                            rect = rect4;
                            OneShotPreDrawListener.add(this.mContainer, new Runnable(this) { // from class: androidx.fragment.app.DefaultSpecialEffectsController.7
                                @Override // java.lang.Runnable
                                public void run() {
                                    fragmentTransitionImpl.getBoundsOnScreen(view5, rect);
                                }
                            });
                            view3 = view10;
                            z6 = true;
                        }
                        fragmentTransitionImpl.setSharedElementTargets(wrapTransitionInSet, view3, arrayList6);
                        fragmentTransitionImpl.scheduleRemoveTargets(wrapTransitionInSet, null, null, null, null, wrapTransitionInSet, arrayList5);
                        Boolean bool = Boolean.TRUE;
                        hashMap3.put(operation3, bool);
                        hashMap3.put(operation6, bool);
                        operation8 = operation3;
                        obj4 = wrapTransitionInSet;
                        view7 = view4;
                        operation4 = operation6;
                        view8 = view3;
                        rect3 = rect;
                        arrayList14 = arrayList6;
                        hashMap4 = hashMap3;
                        fragmentTransitionImpl2 = fragmentTransitionImpl;
                        arrayList15 = arrayList5;
                        state6 = state4;
                        arrayList12 = arrayList4;
                        z5 = z;
                        operation9 = operation4;
                        operation5 = operation3;
                        state7 = state5;
                        arrayMap2 = arrayMap;
                    }
                }
                view7 = view9;
                view8 = view3;
                rect3 = rect;
                arrayList14 = arrayList6;
                hashMap4 = hashMap3;
                fragmentTransitionImpl2 = fragmentTransitionImpl;
                arrayList15 = arrayList5;
                state6 = state4;
                arrayList12 = arrayList4;
                z5 = z;
                operation9 = operation4;
                operation5 = operation3;
                state7 = state5;
                arrayMap2 = arrayMap;
            }
            ArrayMap arrayMap5 = arrayMap2;
            ArrayList<View> arrayList18 = arrayList14;
            FragmentTransitionImpl fragmentTransitionImpl4 = fragmentTransitionImpl2;
            SpecialEffectsController.Operation.State state8 = state6;
            SpecialEffectsController.Operation.State state9 = state7;
            SpecialEffectsController.Operation operation12 = operation9;
            ArrayList arrayList19 = arrayList12;
            View view11 = view7;
            hashMap = hashMap4;
            Rect rect5 = rect3;
            ArrayList<View> arrayList20 = arrayList15;
            View view12 = view8;
            ArrayList arrayList21 = new ArrayList();
            Iterator it8 = arrayList19.iterator();
            Object obj6 = null;
            Object obj7 = null;
            while (it8.hasNext()) {
                TransitionInfo transitionInfo3 = (TransitionInfo) it8.next();
                if (transitionInfo3.isVisibilityUnchanged()) {
                    it = it8;
                    operation = operation6;
                    hashMap.put(transitionInfo3.mOperation, Boolean.FALSE);
                    transitionInfo3.completeSpecialEffect();
                    operation2 = operation12;
                    view = view12;
                    obj = obj4;
                    obj2 = obj6;
                    view2 = view11;
                    state3 = state9;
                    state2 = state8;
                } else {
                    operation = operation6;
                    it = it8;
                    Object cloneTransition = fragmentTransitionImpl4.cloneTransition(transitionInfo3.mTransition);
                    SpecialEffectsController.Operation operation13 = transitionInfo3.mOperation;
                    boolean z7 = obj4 != null && (operation13 == operation8 || operation13 == operation12);
                    if (cloneTransition == null) {
                        if (!z7) {
                            hashMap.put(operation13, Boolean.FALSE);
                            transitionInfo3.completeSpecialEffect();
                        }
                        view = view12;
                        obj = obj4;
                        obj3 = obj6;
                        view2 = view11;
                        state3 = state9;
                        state2 = state8;
                    } else {
                        obj = obj4;
                        final ArrayList<View> arrayList22 = new ArrayList<>();
                        Object obj8 = obj6;
                        captureTransitioningViews(arrayList22, operation13.mFragment.mView);
                        if (z7) {
                            if (operation13 == operation8) {
                                arrayList22.removeAll(arrayList18);
                            } else {
                                arrayList22.removeAll(arrayList20);
                            }
                        }
                        if (arrayList22.isEmpty()) {
                            fragmentTransitionImpl4.addTarget(cloneTransition, view12);
                            view = view12;
                            state2 = state8;
                        } else {
                            fragmentTransitionImpl4.addTargets(cloneTransition, arrayList22);
                            fragmentTransitionImpl4.scheduleRemoveTargets(cloneTransition, cloneTransition, arrayList22, null, null, null, null);
                            state2 = state8;
                            if (operation13.mFinalState == state2) {
                                fragmentTransitionImpl4.scheduleHideFragmentView(cloneTransition, operation13.mFragment.mView, arrayList22);
                                view = view12;
                                OneShotPreDrawListener.add(this.mContainer, new Runnable(this) { // from class: androidx.fragment.app.DefaultSpecialEffectsController.8
                                    @Override // java.lang.Runnable
                                    public void run() {
                                        FragmentTransition.setViewVisibility(arrayList22, 4);
                                    }
                                });
                            } else {
                                view = view12;
                            }
                        }
                        state3 = state9;
                        if (operation13.mFinalState == state3) {
                            arrayList21.addAll(arrayList22);
                            if (z6) {
                                fragmentTransitionImpl4.setEpicenter(cloneTransition, rect5);
                            }
                            view2 = view11;
                        } else {
                            view2 = view11;
                            fragmentTransitionImpl4.setEpicenter(cloneTransition, view2);
                        }
                        hashMap.put(operation13, Boolean.TRUE);
                        if (transitionInfo3.mOverlapAllowed) {
                            obj7 = fragmentTransitionImpl4.mergeTransitionsTogether(obj7, cloneTransition, null);
                            obj3 = obj8;
                        } else {
                            obj3 = fragmentTransitionImpl4.mergeTransitionsTogether(obj8, cloneTransition, null);
                        }
                    }
                    obj2 = obj3;
                    operation2 = operation;
                }
                it8 = it;
                view11 = view2;
                state9 = state3;
                operation12 = operation2;
                state8 = state2;
                view12 = view;
                operation6 = operation;
                obj6 = obj2;
                obj4 = obj;
            }
            Object obj9 = obj4;
            SpecialEffectsController.Operation operation14 = operation6;
            Object obj10 = obj6;
            state = state8;
            Object mergeTransitionsInSequence = fragmentTransitionImpl4.mergeTransitionsInSequence(obj7, obj10, obj9);
            Iterator it9 = arrayList19.iterator();
            while (it9.hasNext()) {
                final TransitionInfo transitionInfo4 = (TransitionInfo) it9.next();
                if (!transitionInfo4.isVisibilityUnchanged()) {
                    Object obj11 = transitionInfo4.mTransition;
                    SpecialEffectsController.Operation operation15 = transitionInfo4.mOperation;
                    SpecialEffectsController.Operation operation16 = operation14;
                    boolean z8 = obj9 != null && (operation15 == operation8 || operation15 == operation16);
                    if (obj11 != null || z8) {
                        fragmentTransitionImpl4.setListenerForTransitionEnd(operation15.mFragment, mergeTransitionsInSequence, transitionInfo4.mSignal, new Runnable(this) { // from class: androidx.fragment.app.DefaultSpecialEffectsController.9
                            @Override // java.lang.Runnable
                            public void run() {
                                transitionInfo4.completeSpecialEffect();
                            }
                        });
                    }
                    operation14 = operation16;
                }
            }
            FragmentTransition.setViewVisibility(arrayList21, 4);
            ArrayList<String> prepareSetNameOverridesReordered = fragmentTransitionImpl4.prepareSetNameOverridesReordered(arrayList20);
            fragmentTransitionImpl4.beginDelayedTransition(this.mContainer, mergeTransitionsInSequence);
            fragmentTransitionImpl4.setNameOverridesReordered(this.mContainer, arrayList18, arrayList20, prepareSetNameOverridesReordered, arrayMap5);
            z3 = false;
            FragmentTransition.setViewVisibility(arrayList21, 0);
            fragmentTransitionImpl4.swapSharedElementTargets(obj9, arrayList18, arrayList20);
            z2 = true;
        }
        boolean containsValue = hashMap.containsValue(Boolean.TRUE);
        final ViewGroup viewGroup = this.mContainer;
        Context context = viewGroup.getContext();
        ArrayList arrayList23 = new ArrayList();
        Iterator it10 = arrayList.iterator();
        while (it10.hasNext()) {
            final AnimationInfo animationInfo5 = (AnimationInfo) it10.next();
            if (animationInfo5.isVisibilityUnchanged()) {
                animationInfo5.completeSpecialEffect();
            } else {
                FragmentAnim.AnimationOrAnimator animation = animationInfo5.getAnimation(context);
                if (animation == null) {
                    animationInfo5.completeSpecialEffect();
                } else {
                    final Animator animator = animation.animator;
                    if (animator == null) {
                        arrayList23.add(animationInfo5);
                    } else {
                        final SpecialEffectsController.Operation operation17 = animationInfo5.mOperation;
                        Fragment fragment = operation17.mFragment;
                        if (Boolean.TRUE.equals(hashMap.get(operation17))) {
                            if (FragmentManager.isLoggingEnabled(2)) {
                                Log.v("FragmentManager", "Ignoring Animator set on " + fragment + " as this Fragment was involved in a Transition.");
                            }
                            animationInfo5.completeSpecialEffect();
                        } else {
                            boolean z9 = operation17.mFinalState == state ? z2 : false;
                            ArrayList arrayList24 = arrayList2;
                            if (z9) {
                                arrayList24.remove(operation17);
                            }
                            final View view13 = fragment.mView;
                            viewGroup.startViewTransition(view13);
                            hashMap2 = hashMap;
                            arrayList3 = arrayList24;
                            final boolean z10 = z9;
                            z4 = z2;
                            animator.addListener(new AnimatorListenerAdapter(this) { // from class: androidx.fragment.app.DefaultSpecialEffectsController.2
                                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                                public void onAnimationEnd(Animator animator2) {
                                    viewGroup.endViewTransition(view13);
                                    if (z10) {
                                        operation17.mFinalState.applyState(view13);
                                    }
                                    animationInfo5.completeSpecialEffect();
                                }
                            });
                            animator.setTarget(view13);
                            animator.start();
                            animationInfo5.mSignal.setOnCancelListener(new CancellationSignal.OnCancelListener(this) { // from class: androidx.fragment.app.DefaultSpecialEffectsController.3
                                @Override // androidx.core.os.CancellationSignal.OnCancelListener
                                public void onCancel() {
                                    animator.end();
                                }
                            });
                            z3 = z4;
                            z2 = z4;
                            arrayList2 = arrayList3;
                            hashMap = hashMap2;
                        }
                    }
                }
            }
            hashMap2 = hashMap;
            z4 = z2;
            arrayList3 = arrayList2;
            z2 = z4;
            arrayList2 = arrayList3;
            hashMap = hashMap2;
        }
        ArrayList arrayList25 = arrayList2;
        Iterator it11 = arrayList23.iterator();
        while (it11.hasNext()) {
            final AnimationInfo animationInfo6 = (AnimationInfo) it11.next();
            SpecialEffectsController.Operation operation18 = animationInfo6.mOperation;
            Fragment fragment2 = operation18.mFragment;
            if (containsValue) {
                if (FragmentManager.isLoggingEnabled(2)) {
                    Log.v("FragmentManager", "Ignoring Animation set on " + fragment2 + " as Animations cannot run alongside Transitions.");
                }
                animationInfo6.completeSpecialEffect();
            } else if (z3) {
                if (FragmentManager.isLoggingEnabled(2)) {
                    Log.v("FragmentManager", "Ignoring Animation set on " + fragment2 + " as Animations cannot run alongside Animators.");
                }
                animationInfo6.completeSpecialEffect();
            } else {
                final View view14 = fragment2.mView;
                FragmentAnim.AnimationOrAnimator animation2 = animationInfo6.getAnimation(context);
                Objects.requireNonNull(animation2);
                Animation animation3 = animation2.animation;
                Objects.requireNonNull(animation3);
                if (operation18.mFinalState != SpecialEffectsController.Operation.State.REMOVED) {
                    view14.startAnimation(animation3);
                    animationInfo6.completeSpecialEffect();
                } else {
                    viewGroup.startViewTransition(view14);
                    FragmentAnim.EndViewTransitionAnimation endViewTransitionAnimation = new FragmentAnim.EndViewTransitionAnimation(animation3, viewGroup, view14);
                    endViewTransitionAnimation.setAnimationListener(new Animation.AnimationListener(this) { // from class: androidx.fragment.app.DefaultSpecialEffectsController.4
                        @Override // android.view.animation.Animation.AnimationListener
                        public void onAnimationEnd(Animation animation4) {
                            viewGroup.post(new Runnable() { // from class: androidx.fragment.app.DefaultSpecialEffectsController.4.1
                                @Override // java.lang.Runnable
                                public void run() {
                                    AnonymousClass4 r0 = AnonymousClass4.this;
                                    viewGroup.endViewTransition(view14);
                                    animationInfo6.completeSpecialEffect();
                                }
                            });
                        }

                        @Override // android.view.animation.Animation.AnimationListener
                        public void onAnimationRepeat(Animation animation4) {
                        }

                        @Override // android.view.animation.Animation.AnimationListener
                        public void onAnimationStart(Animation animation4) {
                        }
                    });
                    view14.startAnimation(endViewTransitionAnimation);
                }
                animationInfo6.mSignal.setOnCancelListener(new CancellationSignal.OnCancelListener(this) { // from class: androidx.fragment.app.DefaultSpecialEffectsController.5
                    @Override // androidx.core.os.CancellationSignal.OnCancelListener
                    public void onCancel() {
                        view14.clearAnimation();
                        viewGroup.endViewTransition(view14);
                        animationInfo6.completeSpecialEffect();
                    }
                });
            }
        }
        Iterator it12 = arrayList25.iterator();
        while (it12.hasNext()) {
            SpecialEffectsController.Operation operation19 = (SpecialEffectsController.Operation) it12.next();
            operation19.mFinalState.applyState(operation19.mFragment.mView);
        }
        arrayList25.clear();
    }

    public void findNamedViews(Map<String, View> map, View view) {
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        String transitionName = view.getTransitionName();
        if (transitionName != null) {
            map.put(transitionName, view);
        }
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            int childCount = viewGroup.getChildCount();
            for (int i = 0; i < childCount; i++) {
                View childAt = viewGroup.getChildAt(i);
                if (childAt.getVisibility() == 0) {
                    findNamedViews(map, childAt);
                }
            }
        }
    }

    public void retainMatchingViews(ArrayMap<String, View> arrayMap, Collection<String> collection) {
        Iterator it = ((ArrayMap.EntrySet) arrayMap.entrySet()).iterator();
        while (true) {
            ArrayMap.MapIterator mapIterator = (ArrayMap.MapIterator) it;
            if (mapIterator.hasNext()) {
                mapIterator.next();
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                if (!collection.contains(((View) mapIterator.getValue()).getTransitionName())) {
                    mapIterator.remove();
                }
            } else {
                return;
            }
        }
    }
}
