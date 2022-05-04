package androidx.recyclerview.widget;

import android.view.View;
import android.view.ViewGroup;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.recyclerview.widget.RecyclerView;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public class ChildHelper {
    public final Callback mCallback;
    public final Bucket mBucket = new Bucket();
    public final List<View> mHiddenViews = new ArrayList();

    /* loaded from: classes.dex */
    public static class Bucket {
        public long mData = 0;
        public Bucket mNext;

        public void clear(int index) {
            if (index >= 64) {
                Bucket bucket = this.mNext;
                if (bucket != null) {
                    bucket.clear(index - 64);
                    return;
                }
                return;
            }
            this.mData &= ~(1 << index);
        }

        public int countOnesBefore(int index) {
            Bucket bucket = this.mNext;
            if (bucket == null) {
                if (index >= 64) {
                    return Long.bitCount(this.mData);
                }
                return Long.bitCount(((1 << index) - 1) & this.mData);
            } else if (index < 64) {
                return Long.bitCount(((1 << index) - 1) & this.mData);
            } else {
                return Long.bitCount(this.mData) + bucket.countOnesBefore(index - 64);
            }
        }

        public final void ensureNext() {
            if (this.mNext == null) {
                this.mNext = new Bucket();
            }
        }

        public boolean get(int index) {
            if (index >= 64) {
                ensureNext();
                return this.mNext.get(index - 64);
            }
            return ((1 << index) & this.mData) != 0;
        }

        public void insert(int index, boolean value) {
            if (index >= 64) {
                ensureNext();
                this.mNext.insert(index - 64, value);
                return;
            }
            long j = this.mData;
            boolean z = (Long.MIN_VALUE & j) != 0;
            long j2 = (1 << index) - 1;
            this.mData = ((j & (~j2)) << 1) | (j & j2);
            if (value) {
                set(index);
            } else {
                clear(index);
            }
            if (z || this.mNext != null) {
                ensureNext();
                this.mNext.insert(0, z);
            }
        }

        public boolean remove(int index) {
            if (index >= 64) {
                ensureNext();
                return this.mNext.remove(index - 64);
            }
            long j = 1 << index;
            long j2 = this.mData;
            boolean z = (j2 & j) != 0;
            long j3 = j2 & (~j);
            this.mData = j3;
            long j4 = j - 1;
            this.mData = (j3 & j4) | Long.rotateRight((~j4) & j3, 1);
            Bucket bucket = this.mNext;
            if (bucket != null) {
                if (bucket.get(0)) {
                    set(63);
                }
                this.mNext.remove(0);
            }
            return z;
        }

        public void reset() {
            this.mData = 0L;
            Bucket bucket = this.mNext;
            if (bucket != null) {
                bucket.reset();
            }
        }

        public void set(int index) {
            if (index >= 64) {
                ensureNext();
                this.mNext.set(index - 64);
                return;
            }
            this.mData |= 1 << index;
        }

        public String toString() {
            if (this.mNext == null) {
                return Long.toBinaryString(this.mData);
            }
            return this.mNext.toString() + "xx" + Long.toBinaryString(this.mData);
        }
    }

    /* loaded from: classes.dex */
    public interface Callback {
    }

    public ChildHelper(Callback callback) {
        this.mCallback = callback;
    }

    public void addView(View child, int index, boolean hidden) {
        int i;
        if (index < 0) {
            i = ((RecyclerView.AnonymousClass5) this.mCallback).getChildCount();
        } else {
            i = getOffset(index);
        }
        this.mBucket.insert(i, hidden);
        if (hidden) {
            hideViewInternal(child);
        }
        RecyclerView.AnonymousClass5 r1 = (RecyclerView.AnonymousClass5) this.mCallback;
        RecyclerView.this.addView(child, i);
        RecyclerView.this.dispatchChildAttached(child);
    }

    public void attachViewToParent(View child, int index, ViewGroup.LayoutParams layoutParams, boolean hidden) {
        int i;
        if (index < 0) {
            i = ((RecyclerView.AnonymousClass5) this.mCallback).getChildCount();
        } else {
            i = getOffset(index);
        }
        this.mBucket.insert(i, hidden);
        if (hidden) {
            hideViewInternal(child);
        }
        RecyclerView.AnonymousClass5 r1 = (RecyclerView.AnonymousClass5) this.mCallback;
        Objects.requireNonNull(r1);
        RecyclerView.ViewHolder childViewHolderInt = RecyclerView.getChildViewHolderInt(child);
        if (childViewHolderInt != null) {
            if (childViewHolderInt.isTmpDetached() || childViewHolderInt.shouldIgnore()) {
                childViewHolderInt.mFlags &= -257;
            } else {
                StringBuilder sb = new StringBuilder();
                sb.append("Called attach on a child which is not detached: ");
                sb.append(childViewHolderInt);
                throw new IllegalArgumentException(ChildHelper$$ExternalSyntheticOutline0.m(RecyclerView.this, sb));
            }
        }
        RecyclerView.this.attachViewToParent(child, i, layoutParams);
    }

    public void detachViewFromParent(int index) {
        RecyclerView.ViewHolder childViewHolderInt;
        int offset = getOffset(index);
        this.mBucket.remove(offset);
        RecyclerView.AnonymousClass5 r3 = (RecyclerView.AnonymousClass5) this.mCallback;
        View childAt = RecyclerView.this.getChildAt(offset);
        if (!(childAt == null || (childViewHolderInt = RecyclerView.getChildViewHolderInt(childAt)) == null)) {
            if (!childViewHolderInt.isTmpDetached() || childViewHolderInt.shouldIgnore()) {
                childViewHolderInt.addFlags(256);
            } else {
                StringBuilder sb = new StringBuilder();
                sb.append("called detach on an already detached child ");
                sb.append(childViewHolderInt);
                throw new IllegalArgumentException(ChildHelper$$ExternalSyntheticOutline0.m(RecyclerView.this, sb));
            }
        }
        RecyclerView.this.detachViewFromParent(offset);
    }

    public View getChildAt(int index) {
        return ((RecyclerView.AnonymousClass5) this.mCallback).getChildAt(getOffset(index));
    }

    public int getChildCount() {
        return ((RecyclerView.AnonymousClass5) this.mCallback).getChildCount() - this.mHiddenViews.size();
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x0021, code lost:
        if (r4.mBucket.get(r2) == false) goto L17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:11:0x0023, code lost:
        r2 = r2 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0026, code lost:
        return r2;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final int getOffset(int r5) {
        /*
            r4 = this;
            r0 = -1
            if (r5 >= 0) goto L4
            return r0
        L4:
            androidx.recyclerview.widget.ChildHelper$Callback r1 = r4.mCallback
            androidx.recyclerview.widget.RecyclerView$5 r1 = (androidx.recyclerview.widget.RecyclerView.AnonymousClass5) r1
            int r1 = r1.getChildCount()
            r2 = r5
        Ld:
            if (r2 >= r1) goto L29
            androidx.recyclerview.widget.ChildHelper$Bucket r3 = r4.mBucket
            int r3 = r3.countOnesBefore(r2)
            int r3 = r2 - r3
            int r3 = r5 - r3
            if (r3 != 0) goto L27
        L1b:
            androidx.recyclerview.widget.ChildHelper$Bucket r5 = r4.mBucket
            boolean r5 = r5.get(r2)
            if (r5 == 0) goto L26
            int r2 = r2 + 1
            goto L1b
        L26:
            return r2
        L27:
            int r2 = r2 + r3
            goto Ld
        L29:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.ChildHelper.getOffset(int):int");
    }

    public View getUnfilteredChildAt(int index) {
        return RecyclerView.this.getChildAt(index);
    }

    public int getUnfilteredChildCount() {
        return ((RecyclerView.AnonymousClass5) this.mCallback).getChildCount();
    }

    public final void hideViewInternal(View child) {
        this.mHiddenViews.add(child);
        RecyclerView.AnonymousClass5 r2 = (RecyclerView.AnonymousClass5) this.mCallback;
        Objects.requireNonNull(r2);
        RecyclerView.ViewHolder childViewHolderInt = RecyclerView.getChildViewHolderInt(child);
        if (childViewHolderInt != null) {
            RecyclerView recyclerView = RecyclerView.this;
            int i = childViewHolderInt.mPendingAccessibilityState;
            if (i != -1) {
                childViewHolderInt.mWasImportantForAccessibilityBeforeHidden = i;
            } else {
                View view = childViewHolderInt.itemView;
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                childViewHolderInt.mWasImportantForAccessibilityBeforeHidden = view.getImportantForAccessibility();
            }
            recyclerView.setChildImportantForAccessibilityInternal(childViewHolderInt, 4);
        }
    }

    public int indexOfChild(View child) {
        int indexOfChild = RecyclerView.this.indexOfChild(child);
        if (indexOfChild != -1 && !this.mBucket.get(indexOfChild)) {
            return indexOfChild - this.mBucket.countOnesBefore(indexOfChild);
        }
        return -1;
    }

    public boolean isHidden(View view) {
        return this.mHiddenViews.contains(view);
    }

    public String toString() {
        return this.mBucket.toString() + ", hidden list:" + this.mHiddenViews.size();
    }

    public final boolean unhideViewInternal(View child) {
        if (!this.mHiddenViews.remove(child)) {
            return false;
        }
        RecyclerView.AnonymousClass5 r2 = (RecyclerView.AnonymousClass5) this.mCallback;
        Objects.requireNonNull(r2);
        RecyclerView.ViewHolder childViewHolderInt = RecyclerView.getChildViewHolderInt(child);
        if (childViewHolderInt == null) {
            return true;
        }
        RecyclerView.this.setChildImportantForAccessibilityInternal(childViewHolderInt, childViewHolderInt.mWasImportantForAccessibilityBeforeHidden);
        childViewHolderInt.mWasImportantForAccessibilityBeforeHidden = 0;
        return true;
    }
}
