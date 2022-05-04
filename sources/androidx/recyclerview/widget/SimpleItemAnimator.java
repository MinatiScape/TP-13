package androidx.recyclerview.widget;

import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.RecyclerView;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
/* loaded from: classes.dex */
public abstract class SimpleItemAnimator extends RecyclerView.ItemAnimator {
    public boolean mSupportsChangeAnimations = true;

    @Override // androidx.recyclerview.widget.RecyclerView.ItemAnimator
    public boolean animateChange(RecyclerView.ViewHolder oldHolder, RecyclerView.ViewHolder newHolder, RecyclerView.ItemAnimator.ItemHolderInfo preInfo, RecyclerView.ItemAnimator.ItemHolderInfo postInfo) {
        int i;
        int i2;
        int i3 = preInfo.left;
        int i4 = preInfo.top;
        if (newHolder.shouldIgnore()) {
            int i5 = preInfo.left;
            i = preInfo.top;
            i2 = i5;
        } else {
            i2 = postInfo.left;
            i = postInfo.top;
        }
        DefaultItemAnimator defaultItemAnimator = (DefaultItemAnimator) this;
        if (oldHolder == newHolder) {
            return defaultItemAnimator.animateMove(oldHolder, i3, i4, i2, i);
        }
        float translationX = oldHolder.itemView.getTranslationX();
        float translationY = oldHolder.itemView.getTranslationY();
        float alpha = oldHolder.itemView.getAlpha();
        defaultItemAnimator.resetAnimation(oldHolder);
        oldHolder.itemView.setTranslationX(translationX);
        oldHolder.itemView.setTranslationY(translationY);
        oldHolder.itemView.setAlpha(alpha);
        defaultItemAnimator.resetAnimation(newHolder);
        newHolder.itemView.setTranslationX(-((int) ((i2 - i3) - translationX)));
        newHolder.itemView.setTranslationY(-((int) ((i - i4) - translationY)));
        newHolder.itemView.setAlpha(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        defaultItemAnimator.mPendingChanges.add(new DefaultItemAnimator.ChangeInfo(oldHolder, newHolder, i3, i4, i2, i));
        return true;
    }

    public abstract boolean animateMove(RecyclerView.ViewHolder holder, int fromX, int fromY, int toX, int toY);
}
