package androidx.transition;

import android.animation.TimeInterpolator;
import android.view.View;
import android.view.ViewGroup;
import androidx.transition.Transition;
import java.util.ArrayList;
import java.util.Iterator;
/* loaded from: classes.dex */
public class TransitionSet extends Transition {
    public int mCurrentListeners;
    public ArrayList<Transition> mTransitions = new ArrayList<>();
    public boolean mPlayTogether = true;
    public boolean mStarted = false;
    public int mChangeFlags = 0;

    /* loaded from: classes.dex */
    public static class TransitionSetListener extends TransitionListenerAdapter {
        public TransitionSet mTransitionSet;

        @Override // androidx.transition.Transition.TransitionListener
        public final void onTransitionEnd(Transition transition) {
            TransitionSet transitionSet = this.mTransitionSet;
            int i = transitionSet.mCurrentListeners - 1;
            transitionSet.mCurrentListeners = i;
            if (i == 0) {
                transitionSet.mStarted = false;
                transitionSet.end();
            }
            transition.removeListener(this);
        }

        @Override // androidx.transition.TransitionListenerAdapter, androidx.transition.Transition.TransitionListener
        public final void onTransitionStart(Transition transition) {
            TransitionSet transitionSet = this.mTransitionSet;
            if (!transitionSet.mStarted) {
                transitionSet.start();
                this.mTransitionSet.mStarted = true;
            }
        }

        public TransitionSetListener(TransitionSet transitionSet) {
            this.mTransitionSet = transitionSet;
        }
    }

    @Override // androidx.transition.Transition
    public final void addTarget(View view) {
        for (int i = 0; i < this.mTransitions.size(); i++) {
            this.mTransitions.get(i).addTarget(view);
        }
        this.mTargets.add(view);
    }

    @Override // androidx.transition.Transition
    public final void createAnimators(ViewGroup viewGroup, TransitionValuesMaps transitionValuesMaps, TransitionValuesMaps transitionValuesMaps2, ArrayList<TransitionValues> arrayList, ArrayList<TransitionValues> arrayList2) {
        long j = this.mStartDelay;
        int size = this.mTransitions.size();
        for (int i = 0; i < size; i++) {
            Transition transition = this.mTransitions.get(i);
            if (j > 0 && (this.mPlayTogether || i == 0)) {
                long j2 = transition.mStartDelay;
                if (j2 > 0) {
                    transition.setStartDelay(j2 + j);
                } else {
                    transition.setStartDelay(j);
                }
            }
            transition.createAnimators(viewGroup, transitionValuesMaps, transitionValuesMaps2, arrayList, arrayList2);
        }
    }

    @Override // androidx.transition.Transition
    public final void removeTarget(View view) {
        for (int i = 0; i < this.mTransitions.size(); i++) {
            this.mTransitions.get(i).removeTarget(view);
        }
        this.mTargets.remove(view);
    }

    public final void addTransition(Transition transition) {
        this.mTransitions.add(transition);
        transition.mParent = this;
        long j = this.mDuration;
        if (j >= 0) {
            transition.setDuration(j);
        }
        if ((this.mChangeFlags & 1) != 0) {
            transition.setInterpolator(this.mInterpolator);
        }
        if ((this.mChangeFlags & 2) != 0) {
            transition.setPropagation();
        }
        if ((this.mChangeFlags & 4) != 0) {
            transition.setPathMotion(this.mPathMotion);
        }
        if ((this.mChangeFlags & 8) != 0) {
            transition.setEpicenterCallback(this.mEpicenterCallback);
        }
    }

    @Override // androidx.transition.Transition
    public final void captureEndValues(TransitionValues transitionValues) {
        if (isValidTarget(transitionValues.view)) {
            Iterator<Transition> it = this.mTransitions.iterator();
            while (it.hasNext()) {
                Transition next = it.next();
                if (next.isValidTarget(transitionValues.view)) {
                    next.captureEndValues(transitionValues);
                    transitionValues.mTargetedTransitions.add(next);
                }
            }
        }
    }

    @Override // androidx.transition.Transition
    public final void capturePropagationValues(TransitionValues transitionValues) {
        int size = this.mTransitions.size();
        for (int i = 0; i < size; i++) {
            this.mTransitions.get(i).capturePropagationValues(transitionValues);
        }
    }

    @Override // androidx.transition.Transition
    public final void captureStartValues(TransitionValues transitionValues) {
        if (isValidTarget(transitionValues.view)) {
            Iterator<Transition> it = this.mTransitions.iterator();
            while (it.hasNext()) {
                Transition next = it.next();
                if (next.isValidTarget(transitionValues.view)) {
                    next.captureStartValues(transitionValues);
                    transitionValues.mTargetedTransitions.add(next);
                }
            }
        }
    }

    @Override // androidx.transition.Transition
    public final Transition clone() {
        TransitionSet transitionSet = (TransitionSet) super.clone();
        transitionSet.mTransitions = new ArrayList<>();
        int size = this.mTransitions.size();
        for (int i = 0; i < size; i++) {
            Transition clone = this.mTransitions.get(i).clone();
            transitionSet.mTransitions.add(clone);
            clone.mParent = transitionSet;
        }
        return transitionSet;
    }

    @Override // androidx.transition.Transition
    public final void runAnimators() {
        if (this.mTransitions.isEmpty()) {
            start();
            end();
            return;
        }
        TransitionSetListener transitionSetListener = new TransitionSetListener(this);
        Iterator<Transition> it = this.mTransitions.iterator();
        while (it.hasNext()) {
            it.next().addListener(transitionSetListener);
        }
        this.mCurrentListeners = this.mTransitions.size();
        if (!this.mPlayTogether) {
            for (int i = 1; i < this.mTransitions.size(); i++) {
                final Transition transition = this.mTransitions.get(i);
                this.mTransitions.get(i - 1).addListener(new TransitionListenerAdapter() { // from class: androidx.transition.TransitionSet.1
                    @Override // androidx.transition.Transition.TransitionListener
                    public final void onTransitionEnd(Transition transition2) {
                        Transition.this.runAnimators();
                        transition2.removeListener(this);
                    }
                });
            }
            Transition transition2 = this.mTransitions.get(0);
            if (transition2 != null) {
                transition2.runAnimators();
                return;
            }
            return;
        }
        Iterator<Transition> it2 = this.mTransitions.iterator();
        while (it2.hasNext()) {
            it2.next().runAnimators();
        }
    }

    @Override // androidx.transition.Transition
    public final void setDuration(long j) {
        ArrayList<Transition> arrayList;
        this.mDuration = j;
        if (j >= 0 && (arrayList = this.mTransitions) != null) {
            int size = arrayList.size();
            for (int i = 0; i < size; i++) {
                this.mTransitions.get(i).setDuration(j);
            }
        }
    }

    @Override // androidx.transition.Transition
    public final void setEpicenterCallback(Transition.EpicenterCallback epicenterCallback) {
        this.mEpicenterCallback = epicenterCallback;
        this.mChangeFlags |= 8;
        int size = this.mTransitions.size();
        for (int i = 0; i < size; i++) {
            this.mTransitions.get(i).setEpicenterCallback(epicenterCallback);
        }
    }

    @Override // androidx.transition.Transition
    public final void setInterpolator(TimeInterpolator timeInterpolator) {
        this.mChangeFlags |= 1;
        ArrayList<Transition> arrayList = this.mTransitions;
        if (arrayList != null) {
            int size = arrayList.size();
            for (int i = 0; i < size; i++) {
                this.mTransitions.get(i).setInterpolator(timeInterpolator);
            }
        }
        this.mInterpolator = timeInterpolator;
    }

    @Override // androidx.transition.Transition
    public final void setPropagation() {
        this.mChangeFlags |= 2;
        int size = this.mTransitions.size();
        for (int i = 0; i < size; i++) {
            this.mTransitions.get(i).setPropagation();
        }
    }

    @Override // androidx.transition.Transition
    public final void cancel() {
        super.cancel();
        int size = this.mTransitions.size();
        for (int i = 0; i < size; i++) {
            this.mTransitions.get(i).cancel();
        }
    }

    @Override // androidx.transition.Transition
    public final void pause(View view) {
        super.pause(view);
        int size = this.mTransitions.size();
        for (int i = 0; i < size; i++) {
            this.mTransitions.get(i).pause(view);
        }
    }

    @Override // androidx.transition.Transition
    public final void resume(ViewGroup viewGroup) {
        super.resume(viewGroup);
        int size = this.mTransitions.size();
        for (int i = 0; i < size; i++) {
            this.mTransitions.get(i).resume(viewGroup);
        }
    }

    @Override // androidx.transition.Transition
    public final void setPathMotion(PathMotion pathMotion) {
        super.setPathMotion(pathMotion);
        this.mChangeFlags |= 4;
        if (this.mTransitions != null) {
            for (int i = 0; i < this.mTransitions.size(); i++) {
                this.mTransitions.get(i).setPathMotion(pathMotion);
            }
        }
    }

    @Override // androidx.transition.Transition
    public final String toString(String str) {
        String transition = super.toString(str);
        for (int i = 0; i < this.mTransitions.size(); i++) {
            StringBuilder sb = new StringBuilder();
            sb.append(transition);
            sb.append("\n");
            sb.append(this.mTransitions.get(i).toString(str + "  "));
            transition = sb.toString();
        }
        return transition;
    }

    @Override // androidx.transition.Transition
    public final void addListener(Transition.TransitionListener transitionListener) {
        super.addListener(transitionListener);
    }

    @Override // androidx.transition.Transition
    public final void removeListener(Transition.TransitionListener transitionListener) {
        super.removeListener(transitionListener);
    }

    @Override // androidx.transition.Transition
    public final void setStartDelay(long j) {
        this.mStartDelay = j;
    }
}
