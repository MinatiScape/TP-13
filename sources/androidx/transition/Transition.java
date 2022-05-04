package androidx.transition;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.TimeInterpolator;
import android.graphics.Path;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.SparseIntArray;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;
import androidx.appcompat.view.SupportMenuInflater$$ExternalSyntheticOutline0;
import androidx.collection.ArrayMap;
import androidx.collection.ContainerHelpers;
import androidx.collection.LongSparseArray;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.recyclerview.widget.RecyclerView;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public abstract class Transition implements Cloneable {
    public static final int[] DEFAULT_MATCH_ORDER = {2, 1, 3, 4};
    public static final AnonymousClass1 STRAIGHT_PATH_MOTION = new PathMotion() { // from class: androidx.transition.Transition.1
        @Override // androidx.transition.PathMotion
        public final Path getPath(float f, float f2, float f3, float f4) {
            Path path = new Path();
            path.moveTo(f, f2);
            path.lineTo(f3, f4);
            return path;
        }
    };
    public static ThreadLocal<ArrayMap<Animator, AnimationInfo>> sRunningAnimators = new ThreadLocal<>();
    public ArrayList<TransitionValues> mEndValuesList;
    public EpicenterCallback mEpicenterCallback;
    public ArrayList<TransitionValues> mStartValuesList;
    public String mName = getClass().getName();
    public long mStartDelay = -1;
    public long mDuration = -1;
    public TimeInterpolator mInterpolator = null;
    public ArrayList<Integer> mTargetIds = new ArrayList<>();
    public ArrayList<View> mTargets = new ArrayList<>();
    public TransitionValuesMaps mStartValues = new TransitionValuesMaps();
    public TransitionValuesMaps mEndValues = new TransitionValuesMaps();
    public TransitionSet mParent = null;
    public int[] mMatchOrder = DEFAULT_MATCH_ORDER;
    public ArrayList<Animator> mCurrentAnimators = new ArrayList<>();
    public int mNumInstances = 0;
    public boolean mPaused = false;
    public boolean mEnded = false;
    public ArrayList<TransitionListener> mListeners = null;
    public ArrayList<Animator> mAnimators = new ArrayList<>();
    public PathMotion mPathMotion = STRAIGHT_PATH_MOTION;

    /* loaded from: classes.dex */
    public static abstract class EpicenterCallback {
    }

    /* loaded from: classes.dex */
    public interface TransitionListener {
        void onTransitionCancel();

        void onTransitionEnd(Transition transition);

        void onTransitionPause();

        void onTransitionResume();

        void onTransitionStart(Transition transition);
    }

    public abstract void captureEndValues(TransitionValues transitionValues);

    public void capturePropagationValues(TransitionValues transitionValues) {
    }

    public abstract void captureStartValues(TransitionValues transitionValues);

    public Animator createAnimator(ViewGroup viewGroup, TransitionValues transitionValues, TransitionValues transitionValues2) {
        return null;
    }

    public String[] getTransitionProperties() {
        return null;
    }

    public boolean isTransitionRequired(TransitionValues transitionValues, TransitionValues transitionValues2) {
        if (transitionValues == null || transitionValues2 == null) {
            return false;
        }
        String[] transitionProperties = getTransitionProperties();
        if (transitionProperties != null) {
            for (String str : transitionProperties) {
                if (!isValueChanged(transitionValues, transitionValues2, str)) {
                }
            }
            return false;
        }
        for (String str2 : transitionValues.values.keySet()) {
            if (isValueChanged(transitionValues, transitionValues2, str2)) {
            }
        }
        return false;
        return true;
    }

    public void setPropagation() {
    }

    public String toString(String str) {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m(str);
        m.append(getClass().getSimpleName());
        m.append("@");
        m.append(Integer.toHexString(hashCode()));
        m.append(": ");
        String sb = m.toString();
        if (this.mDuration != -1) {
            sb = sb + "dur(" + this.mDuration + ") ";
        }
        if (this.mStartDelay != -1) {
            sb = sb + "dly(" + this.mStartDelay + ") ";
        }
        if (this.mInterpolator != null) {
            sb = sb + "interp(" + this.mInterpolator + ") ";
        }
        if (this.mTargetIds.size() <= 0 && this.mTargets.size() <= 0) {
            return sb;
        }
        String m2 = SupportMenuInflater$$ExternalSyntheticOutline0.m(sb, "tgts(");
        if (this.mTargetIds.size() > 0) {
            for (int i = 0; i < this.mTargetIds.size(); i++) {
                if (i > 0) {
                    m2 = SupportMenuInflater$$ExternalSyntheticOutline0.m(m2, ", ");
                }
                StringBuilder m3 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m(m2);
                m3.append(this.mTargetIds.get(i));
                m2 = m3.toString();
            }
        }
        if (this.mTargets.size() > 0) {
            for (int i2 = 0; i2 < this.mTargets.size(); i2++) {
                if (i2 > 0) {
                    m2 = SupportMenuInflater$$ExternalSyntheticOutline0.m(m2, ", ");
                }
                StringBuilder m4 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m(m2);
                m4.append(this.mTargets.get(i2));
                m2 = m4.toString();
            }
        }
        return SupportMenuInflater$$ExternalSyntheticOutline0.m(m2, ")");
    }

    /* loaded from: classes.dex */
    public static class AnimationInfo {
        public String mName;
        public Transition mTransition;
        public TransitionValues mValues;
        public View mView;
        public WindowIdImpl mWindowId;

        public AnimationInfo(View view, String str, Transition transition, WindowIdApi18 windowIdApi18, TransitionValues transitionValues) {
            this.mView = view;
            this.mName = str;
            this.mValues = transitionValues;
            this.mWindowId = windowIdApi18;
            this.mTransition = transition;
        }
    }

    public static void addViewValues(TransitionValuesMaps transitionValuesMaps, View view, TransitionValues transitionValues) {
        transitionValuesMaps.mViewValues.put(view, transitionValues);
        int id = view.getId();
        if (id >= 0) {
            if (transitionValuesMaps.mIdValues.indexOfKey(id) >= 0) {
                transitionValuesMaps.mIdValues.put(id, null);
            } else {
                transitionValuesMaps.mIdValues.put(id, view);
            }
        }
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        String transitionName = ViewCompat.Api21Impl.getTransitionName(view);
        if (transitionName != null) {
            if (transitionValuesMaps.mNameValues.containsKey(transitionName)) {
                transitionValuesMaps.mNameValues.put(transitionName, null);
            } else {
                transitionValuesMaps.mNameValues.put(transitionName, view);
            }
        }
        if (view.getParent() instanceof ListView) {
            ListView listView = (ListView) view.getParent();
            if (listView.getAdapter().hasStableIds()) {
                long itemIdAtPosition = listView.getItemIdAtPosition(listView.getPositionForView(view));
                LongSparseArray<View> longSparseArray = transitionValuesMaps.mItemIdValues;
                if (longSparseArray.mGarbage) {
                    longSparseArray.gc();
                }
                if (ContainerHelpers.binarySearch(longSparseArray.mKeys, longSparseArray.mSize, itemIdAtPosition) >= 0) {
                    View view2 = (View) transitionValuesMaps.mItemIdValues.get(itemIdAtPosition, null);
                    if (view2 != null) {
                        ViewCompat.Api16Impl.setHasTransientState(view2, false);
                        transitionValuesMaps.mItemIdValues.put(itemIdAtPosition, null);
                        return;
                    }
                    return;
                }
                ViewCompat.Api16Impl.setHasTransientState(view, true);
                transitionValuesMaps.mItemIdValues.put(itemIdAtPosition, view);
            }
        }
    }

    public static ArrayMap<Animator, AnimationInfo> getRunningAnimators() {
        ArrayMap<Animator, AnimationInfo> arrayMap = sRunningAnimators.get();
        if (arrayMap != null) {
            return arrayMap;
        }
        ArrayMap<Animator, AnimationInfo> arrayMap2 = new ArrayMap<>();
        sRunningAnimators.set(arrayMap2);
        return arrayMap2;
    }

    public static boolean isValueChanged(TransitionValues transitionValues, TransitionValues transitionValues2, String str) {
        Object obj = transitionValues.values.get(str);
        Object obj2 = transitionValues2.values.get(str);
        if (obj == null && obj2 == null) {
            return false;
        }
        if (obj == null || obj2 == null) {
            return true;
        }
        return true ^ obj.equals(obj2);
    }

    public void addListener(TransitionListener transitionListener) {
        if (this.mListeners == null) {
            this.mListeners = new ArrayList<>();
        }
        this.mListeners.add(transitionListener);
    }

    public void addTarget(View view) {
        this.mTargets.add(view);
    }

    public void cancel() {
        int size = this.mCurrentAnimators.size();
        while (true) {
            size--;
            if (size < 0) {
                break;
            }
            this.mCurrentAnimators.get(size).cancel();
        }
        ArrayList<TransitionListener> arrayList = this.mListeners;
        if (arrayList != null && arrayList.size() > 0) {
            ArrayList arrayList2 = (ArrayList) this.mListeners.clone();
            int size2 = arrayList2.size();
            for (int i = 0; i < size2; i++) {
                ((TransitionListener) arrayList2.get(i)).onTransitionCancel();
            }
        }
    }

    public final void captureHierarchy(View view, boolean z) {
        if (view != null) {
            view.getId();
            if (view.getParent() instanceof ViewGroup) {
                TransitionValues transitionValues = new TransitionValues(view);
                if (z) {
                    captureStartValues(transitionValues);
                } else {
                    captureEndValues(transitionValues);
                }
                transitionValues.mTargetedTransitions.add(this);
                capturePropagationValues(transitionValues);
                if (z) {
                    addViewValues(this.mStartValues, view, transitionValues);
                } else {
                    addViewValues(this.mEndValues, view, transitionValues);
                }
            }
            if (view instanceof ViewGroup) {
                ViewGroup viewGroup = (ViewGroup) view;
                for (int i = 0; i < viewGroup.getChildCount(); i++) {
                    captureHierarchy(viewGroup.getChildAt(i), z);
                }
            }
        }
    }

    public final void clearValues(boolean z) {
        if (z) {
            this.mStartValues.mViewValues.clear();
            this.mStartValues.mIdValues.clear();
            this.mStartValues.mItemIdValues.clear();
            return;
        }
        this.mEndValues.mViewValues.clear();
        this.mEndValues.mIdValues.clear();
        this.mEndValues.mItemIdValues.clear();
    }

    public Transition clone() {
        try {
            Transition transition = (Transition) super.clone();
            transition.mAnimators = new ArrayList<>();
            transition.mStartValues = new TransitionValuesMaps();
            transition.mEndValues = new TransitionValuesMaps();
            transition.mStartValuesList = null;
            transition.mEndValuesList = null;
            return transition;
        } catch (CloneNotSupportedException unused) {
            return null;
        }
    }

    public void createAnimators(ViewGroup viewGroup, TransitionValuesMaps transitionValuesMaps, TransitionValuesMaps transitionValuesMaps2, ArrayList<TransitionValues> arrayList, ArrayList<TransitionValues> arrayList2) {
        boolean z;
        Animator createAnimator;
        Animator animator;
        TransitionValues transitionValues;
        View view;
        TransitionValues transitionValues2;
        Animator animator2;
        ViewGroup viewGroup2 = viewGroup;
        ArrayMap<Animator, AnimationInfo> runningAnimators = getRunningAnimators();
        SparseIntArray sparseIntArray = new SparseIntArray();
        int size = arrayList.size();
        int i = 0;
        while (i < size) {
            TransitionValues transitionValues3 = arrayList.get(i);
            TransitionValues transitionValues4 = arrayList2.get(i);
            if (transitionValues3 != null && !transitionValues3.mTargetedTransitions.contains(this)) {
                transitionValues3 = null;
            }
            if (transitionValues4 != null && !transitionValues4.mTargetedTransitions.contains(this)) {
                transitionValues4 = null;
            }
            if (!(transitionValues3 == null && transitionValues4 == null)) {
                if (transitionValues3 == null || transitionValues4 == null || isTransitionRequired(transitionValues3, transitionValues4)) {
                    z = true;
                } else {
                    z = false;
                }
                if (z && (createAnimator = createAnimator(viewGroup2, transitionValues3, transitionValues4)) != null) {
                    if (transitionValues4 != null) {
                        View view2 = transitionValues4.view;
                        String[] transitionProperties = getTransitionProperties();
                        if (transitionProperties != null && transitionProperties.length > 0) {
                            transitionValues2 = new TransitionValues(view2);
                            TransitionValues orDefault = transitionValuesMaps2.mViewValues.getOrDefault(view2, null);
                            if (orDefault != null) {
                                int i2 = 0;
                                while (i2 < transitionProperties.length) {
                                    HashMap hashMap = transitionValues2.values;
                                    Animator animator3 = createAnimator;
                                    String str = transitionProperties[i2];
                                    hashMap.put(str, orDefault.values.get(str));
                                    i2++;
                                    createAnimator = animator3;
                                    transitionProperties = transitionProperties;
                                }
                            }
                            Animator animator4 = createAnimator;
                            int i3 = runningAnimators.mSize;
                            int i4 = 0;
                            while (true) {
                                if (i4 >= i3) {
                                    animator2 = animator4;
                                    break;
                                }
                                AnimationInfo orDefault2 = runningAnimators.getOrDefault(runningAnimators.keyAt(i4), null);
                                if (orDefault2.mValues != null && orDefault2.mView == view2 && orDefault2.mName.equals(this.mName) && orDefault2.mValues.equals(transitionValues2)) {
                                    animator2 = null;
                                    break;
                                }
                                i4++;
                            }
                        } else {
                            animator2 = createAnimator;
                            transitionValues2 = null;
                        }
                        view = view2;
                        animator = animator2;
                        transitionValues = transitionValues2;
                    } else {
                        view = transitionValues3.view;
                        animator = createAnimator;
                        transitionValues = null;
                    }
                    if (animator != null) {
                        String str2 = this.mName;
                        ViewUtilsApi29 viewUtilsApi29 = ViewUtils.IMPL;
                        runningAnimators.put(animator, new AnimationInfo(view, str2, this, new WindowIdApi18(viewGroup2), transitionValues));
                        this.mAnimators.add(animator);
                    }
                    i++;
                    viewGroup2 = viewGroup;
                }
            }
            i++;
            viewGroup2 = viewGroup;
        }
        if (sparseIntArray.size() != 0) {
            for (int i5 = 0; i5 < sparseIntArray.size(); i5++) {
                Animator animator5 = this.mAnimators.get(sparseIntArray.keyAt(i5));
                animator5.setStartDelay(animator5.getStartDelay() + (sparseIntArray.valueAt(i5) - RecyclerView.FOREVER_NS));
            }
        }
    }

    public final void end() {
        int i = this.mNumInstances - 1;
        this.mNumInstances = i;
        if (i == 0) {
            ArrayList<TransitionListener> arrayList = this.mListeners;
            if (arrayList != null && arrayList.size() > 0) {
                ArrayList arrayList2 = (ArrayList) this.mListeners.clone();
                int size = arrayList2.size();
                for (int i2 = 0; i2 < size; i2++) {
                    ((TransitionListener) arrayList2.get(i2)).onTransitionEnd(this);
                }
            }
            int i3 = 0;
            while (true) {
                LongSparseArray<View> longSparseArray = this.mStartValues.mItemIdValues;
                if (longSparseArray.mGarbage) {
                    longSparseArray.gc();
                }
                if (i3 >= longSparseArray.mSize) {
                    break;
                }
                View valueAt = this.mStartValues.mItemIdValues.valueAt(i3);
                if (valueAt != null) {
                    WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                    ViewCompat.Api16Impl.setHasTransientState(valueAt, false);
                }
                i3++;
            }
            int i4 = 0;
            while (true) {
                LongSparseArray<View> longSparseArray2 = this.mEndValues.mItemIdValues;
                if (longSparseArray2.mGarbage) {
                    longSparseArray2.gc();
                }
                if (i4 < longSparseArray2.mSize) {
                    View valueAt2 = this.mEndValues.mItemIdValues.valueAt(i4);
                    if (valueAt2 != null) {
                        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap2 = ViewCompat.sViewPropertyAnimatorMap;
                        ViewCompat.Api16Impl.setHasTransientState(valueAt2, false);
                    }
                    i4++;
                } else {
                    this.mEnded = true;
                    return;
                }
            }
        }
    }

    public final TransitionValues getMatchedTransitionValues(View view, boolean z) {
        ArrayList<TransitionValues> arrayList;
        ArrayList<TransitionValues> arrayList2;
        TransitionSet transitionSet = this.mParent;
        if (transitionSet != null) {
            return transitionSet.getMatchedTransitionValues(view, z);
        }
        if (z) {
            arrayList = this.mStartValuesList;
        } else {
            arrayList = this.mEndValuesList;
        }
        if (arrayList == null) {
            return null;
        }
        int size = arrayList.size();
        int i = -1;
        int i2 = 0;
        while (true) {
            if (i2 >= size) {
                break;
            }
            TransitionValues transitionValues = arrayList.get(i2);
            if (transitionValues == null) {
                return null;
            }
            if (transitionValues.view == view) {
                i = i2;
                break;
            }
            i2++;
        }
        if (i < 0) {
            return null;
        }
        if (z) {
            arrayList2 = this.mEndValuesList;
        } else {
            arrayList2 = this.mStartValuesList;
        }
        return arrayList2.get(i);
    }

    public final TransitionValues getTransitionValues(View view, boolean z) {
        TransitionValuesMaps transitionValuesMaps;
        TransitionSet transitionSet = this.mParent;
        if (transitionSet != null) {
            return transitionSet.getTransitionValues(view, z);
        }
        if (z) {
            transitionValuesMaps = this.mStartValues;
        } else {
            transitionValuesMaps = this.mEndValues;
        }
        return transitionValuesMaps.mViewValues.getOrDefault(view, null);
    }

    public void pause(View view) {
        if (!this.mEnded) {
            for (int size = this.mCurrentAnimators.size() - 1; size >= 0; size--) {
                this.mCurrentAnimators.get(size).pause();
            }
            ArrayList<TransitionListener> arrayList = this.mListeners;
            if (arrayList != null && arrayList.size() > 0) {
                ArrayList arrayList2 = (ArrayList) this.mListeners.clone();
                int size2 = arrayList2.size();
                for (int i = 0; i < size2; i++) {
                    ((TransitionListener) arrayList2.get(i)).onTransitionPause();
                }
            }
            this.mPaused = true;
        }
    }

    public void removeListener(TransitionListener transitionListener) {
        ArrayList<TransitionListener> arrayList = this.mListeners;
        if (arrayList != null) {
            arrayList.remove(transitionListener);
            if (this.mListeners.size() == 0) {
                this.mListeners = null;
            }
        }
    }

    public void removeTarget(View view) {
        this.mTargets.remove(view);
    }

    public void resume(ViewGroup viewGroup) {
        if (this.mPaused) {
            if (!this.mEnded) {
                int size = this.mCurrentAnimators.size();
                while (true) {
                    size--;
                    if (size < 0) {
                        break;
                    }
                    this.mCurrentAnimators.get(size).resume();
                }
                ArrayList<TransitionListener> arrayList = this.mListeners;
                if (arrayList != null && arrayList.size() > 0) {
                    ArrayList arrayList2 = (ArrayList) this.mListeners.clone();
                    int size2 = arrayList2.size();
                    for (int i = 0; i < size2; i++) {
                        ((TransitionListener) arrayList2.get(i)).onTransitionResume();
                    }
                }
            }
            this.mPaused = false;
        }
    }

    public void setPathMotion(PathMotion pathMotion) {
        if (pathMotion == null) {
            this.mPathMotion = STRAIGHT_PATH_MOTION;
        } else {
            this.mPathMotion = pathMotion;
        }
    }

    public final void start() {
        if (this.mNumInstances == 0) {
            ArrayList<TransitionListener> arrayList = this.mListeners;
            if (arrayList != null && arrayList.size() > 0) {
                ArrayList arrayList2 = (ArrayList) this.mListeners.clone();
                int size = arrayList2.size();
                for (int i = 0; i < size; i++) {
                    ((TransitionListener) arrayList2.get(i)).onTransitionStart(this);
                }
            }
            this.mEnded = false;
        }
        this.mNumInstances++;
    }

    public final void captureValues(ViewGroup viewGroup, boolean z) {
        clearValues(z);
        if (this.mTargetIds.size() > 0 || this.mTargets.size() > 0) {
            for (int i = 0; i < this.mTargetIds.size(); i++) {
                View findViewById = viewGroup.findViewById(this.mTargetIds.get(i).intValue());
                if (findViewById != null) {
                    TransitionValues transitionValues = new TransitionValues(findViewById);
                    if (z) {
                        captureStartValues(transitionValues);
                    } else {
                        captureEndValues(transitionValues);
                    }
                    transitionValues.mTargetedTransitions.add(this);
                    capturePropagationValues(transitionValues);
                    if (z) {
                        addViewValues(this.mStartValues, findViewById, transitionValues);
                    } else {
                        addViewValues(this.mEndValues, findViewById, transitionValues);
                    }
                }
            }
            for (int i2 = 0; i2 < this.mTargets.size(); i2++) {
                View view = this.mTargets.get(i2);
                TransitionValues transitionValues2 = new TransitionValues(view);
                if (z) {
                    captureStartValues(transitionValues2);
                } else {
                    captureEndValues(transitionValues2);
                }
                transitionValues2.mTargetedTransitions.add(this);
                capturePropagationValues(transitionValues2);
                if (z) {
                    addViewValues(this.mStartValues, view, transitionValues2);
                } else {
                    addViewValues(this.mEndValues, view, transitionValues2);
                }
            }
            return;
        }
        captureHierarchy(viewGroup, z);
    }

    public final boolean isValidTarget(View view) {
        int id = view.getId();
        if ((this.mTargetIds.size() != 0 || this.mTargets.size() != 0) && !this.mTargetIds.contains(Integer.valueOf(id)) && !this.mTargets.contains(view)) {
            return false;
        }
        return true;
    }

    public void runAnimators() {
        start();
        final ArrayMap<Animator, AnimationInfo> runningAnimators = getRunningAnimators();
        Iterator<Animator> it = this.mAnimators.iterator();
        while (it.hasNext()) {
            Animator next = it.next();
            if (runningAnimators.containsKey(next)) {
                start();
                if (next != null) {
                    next.addListener(new AnimatorListenerAdapter() { // from class: androidx.transition.Transition.2
                        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                        public final void onAnimationEnd(Animator animator) {
                            runningAnimators.remove(animator);
                            Transition.this.mCurrentAnimators.remove(animator);
                        }

                        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                        public final void onAnimationStart(Animator animator) {
                            Transition.this.mCurrentAnimators.add(animator);
                        }
                    });
                    long j = this.mDuration;
                    if (j >= 0) {
                        next.setDuration(j);
                    }
                    long j2 = this.mStartDelay;
                    if (j2 >= 0) {
                        next.setStartDelay(next.getStartDelay() + j2);
                    }
                    TimeInterpolator timeInterpolator = this.mInterpolator;
                    if (timeInterpolator != null) {
                        next.setInterpolator(timeInterpolator);
                    }
                    next.addListener(new AnimatorListenerAdapter() { // from class: androidx.transition.Transition.3
                        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                        public final void onAnimationEnd(Animator animator) {
                            Transition.this.end();
                            animator.removeListener(this);
                        }
                    });
                    next.start();
                }
            }
        }
        this.mAnimators.clear();
        end();
    }

    public final String toString() {
        return toString("");
    }

    public void setDuration(long j) {
        this.mDuration = j;
    }

    public void setEpicenterCallback(EpicenterCallback epicenterCallback) {
        this.mEpicenterCallback = epicenterCallback;
    }

    public void setInterpolator(TimeInterpolator timeInterpolator) {
        this.mInterpolator = timeInterpolator;
    }

    public void setStartDelay(long j) {
        this.mStartDelay = j;
    }
}
