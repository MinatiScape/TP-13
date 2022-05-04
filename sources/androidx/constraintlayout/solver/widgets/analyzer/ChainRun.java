package androidx.constraintlayout.solver.widgets.analyzer;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import androidx.appcompat.view.SupportMenuInflater$$ExternalSyntheticOutline0;
import androidx.constraintlayout.solver.widgets.ConstraintAnchor;
import androidx.constraintlayout.solver.widgets.ConstraintWidget;
import androidx.constraintlayout.solver.widgets.ConstraintWidgetContainer;
import java.util.ArrayList;
import java.util.Iterator;
/* loaded from: classes.dex */
public final class ChainRun extends WidgetRun {
    public int chainStyle;
    public ArrayList<WidgetRun> widgets = new ArrayList<>();

    @Override // androidx.constraintlayout.solver.widgets.analyzer.WidgetRun
    public final void applyToWidget() {
        for (int i = 0; i < this.widgets.size(); i++) {
            this.widgets.get(i).applyToWidget();
        }
    }

    @Override // androidx.constraintlayout.solver.widgets.analyzer.WidgetRun
    public final void clear() {
        this.runGroup = null;
        Iterator<WidgetRun> it = this.widgets.iterator();
        while (it.hasNext()) {
            it.next().clear();
        }
    }

    public final ConstraintWidget getFirstVisibleWidget() {
        for (int i = 0; i < this.widgets.size(); i++) {
            ConstraintWidget constraintWidget = this.widgets.get(i).widget;
            if (constraintWidget.mVisibility != 8) {
                return constraintWidget;
            }
        }
        return null;
    }

    @Override // androidx.constraintlayout.solver.widgets.analyzer.WidgetRun
    public final void apply() {
        Iterator<WidgetRun> it = this.widgets.iterator();
        while (it.hasNext()) {
            it.next().apply();
        }
        int size = this.widgets.size();
        if (size >= 1) {
            ConstraintWidget constraintWidget = this.widgets.get(0).widget;
            ConstraintWidget constraintWidget2 = this.widgets.get(size - 1).widget;
            if (this.orientation == 0) {
                ConstraintAnchor constraintAnchor = constraintWidget.mLeft;
                ConstraintAnchor constraintAnchor2 = constraintWidget2.mRight;
                DependencyNode target = WidgetRun.getTarget(constraintAnchor, 0);
                int margin = constraintAnchor.getMargin();
                ConstraintWidget firstVisibleWidget = getFirstVisibleWidget();
                if (firstVisibleWidget != null) {
                    margin = firstVisibleWidget.mLeft.getMargin();
                }
                if (target != null) {
                    WidgetRun.addTarget(this.start, target, margin);
                }
                DependencyNode target2 = WidgetRun.getTarget(constraintAnchor2, 0);
                int margin2 = constraintAnchor2.getMargin();
                ConstraintWidget lastVisibleWidget = getLastVisibleWidget();
                if (lastVisibleWidget != null) {
                    margin2 = lastVisibleWidget.mRight.getMargin();
                }
                if (target2 != null) {
                    WidgetRun.addTarget(this.end, target2, -margin2);
                }
            } else {
                ConstraintAnchor constraintAnchor3 = constraintWidget.mTop;
                ConstraintAnchor constraintAnchor4 = constraintWidget2.mBottom;
                DependencyNode target3 = WidgetRun.getTarget(constraintAnchor3, 1);
                int margin3 = constraintAnchor3.getMargin();
                ConstraintWidget firstVisibleWidget2 = getFirstVisibleWidget();
                if (firstVisibleWidget2 != null) {
                    margin3 = firstVisibleWidget2.mTop.getMargin();
                }
                if (target3 != null) {
                    WidgetRun.addTarget(this.start, target3, margin3);
                }
                DependencyNode target4 = WidgetRun.getTarget(constraintAnchor4, 1);
                int margin4 = constraintAnchor4.getMargin();
                ConstraintWidget lastVisibleWidget2 = getLastVisibleWidget();
                if (lastVisibleWidget2 != null) {
                    margin4 = lastVisibleWidget2.mBottom.getMargin();
                }
                if (target4 != null) {
                    WidgetRun.addTarget(this.end, target4, -margin4);
                }
            }
            this.start.updateDelegate = this;
            this.end.updateDelegate = this;
        }
    }

    public final ConstraintWidget getLastVisibleWidget() {
        for (int size = this.widgets.size() - 1; size >= 0; size--) {
            ConstraintWidget constraintWidget = this.widgets.get(size).widget;
            if (constraintWidget.mVisibility != 8) {
                return constraintWidget;
            }
        }
        return null;
    }

    @Override // androidx.constraintlayout.solver.widgets.analyzer.WidgetRun
    public final long getWrapDimension() {
        int size = this.widgets.size();
        long j = 0;
        for (int i = 0; i < size; i++) {
            WidgetRun widgetRun = this.widgets.get(i);
            j = widgetRun.end.margin + widgetRun.getWrapDimension() + j + widgetRun.start.margin;
        }
        return j;
    }

    @Override // androidx.constraintlayout.solver.widgets.analyzer.WidgetRun
    public final boolean supportsWrapComputation() {
        int size = this.widgets.size();
        for (int i = 0; i < size; i++) {
            if (!this.widgets.get(i).supportsWrapComputation()) {
                return false;
            }
        }
        return true;
    }

    public final String toString() {
        String str;
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("ChainRun ");
        if (this.orientation == 0) {
            str = "horizontal : ";
        } else {
            str = "vertical : ";
        }
        m.append(str);
        String sb = m.toString();
        Iterator<WidgetRun> it = this.widgets.iterator();
        while (it.hasNext()) {
            String m2 = SupportMenuInflater$$ExternalSyntheticOutline0.m(sb, "<");
            sb = SupportMenuInflater$$ExternalSyntheticOutline0.m(m2 + it.next(), "> ");
        }
        return sb;
    }

    /* JADX WARN: Code restructure failed: missing block: B:274:0x03f3, code lost:
        r10 = r10 - r8;
     */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00cd  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00dd  */
    @Override // androidx.constraintlayout.solver.widgets.analyzer.WidgetRun, androidx.constraintlayout.solver.widgets.analyzer.Dependency
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void update(androidx.constraintlayout.solver.widgets.analyzer.Dependency r27) {
        /*
            Method dump skipped, instructions count: 1050
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.constraintlayout.solver.widgets.analyzer.ChainRun.update(androidx.constraintlayout.solver.widgets.analyzer.Dependency):void");
    }

    public ChainRun(ConstraintWidget constraintWidget, int i) {
        super(constraintWidget);
        ConstraintWidget constraintWidget2;
        WidgetRun widgetRun;
        boolean z;
        int i2;
        WidgetRun widgetRun2;
        this.orientation = i;
        ConstraintWidget constraintWidget3 = this.widget;
        ConstraintWidget previousChainMember = constraintWidget3.getPreviousChainMember(i);
        while (true) {
            ConstraintWidget constraintWidget4 = previousChainMember;
            constraintWidget2 = constraintWidget3;
            constraintWidget3 = constraintWidget4;
            if (constraintWidget3 == null) {
                break;
            }
            previousChainMember = constraintWidget3.getPreviousChainMember(this.orientation);
        }
        this.widget = constraintWidget2;
        ArrayList<WidgetRun> arrayList = this.widgets;
        int i3 = this.orientation;
        if (i3 == 0) {
            widgetRun = constraintWidget2.horizontalRun;
        } else if (i3 == 1) {
            widgetRun = constraintWidget2.verticalRun;
        } else {
            widgetRun = null;
        }
        arrayList.add(widgetRun);
        ConstraintWidget nextChainMember = constraintWidget2.getNextChainMember(this.orientation);
        while (nextChainMember != null) {
            ArrayList<WidgetRun> arrayList2 = this.widgets;
            int i4 = this.orientation;
            if (i4 == 0) {
                widgetRun2 = nextChainMember.horizontalRun;
            } else if (i4 == 1) {
                widgetRun2 = nextChainMember.verticalRun;
            } else {
                widgetRun2 = null;
            }
            arrayList2.add(widgetRun2);
            nextChainMember = nextChainMember.getNextChainMember(this.orientation);
        }
        Iterator<WidgetRun> it = this.widgets.iterator();
        while (it.hasNext()) {
            WidgetRun next = it.next();
            int i5 = this.orientation;
            if (i5 == 0) {
                next.widget.horizontalChainRun = this;
            } else if (i5 == 1) {
                next.widget.verticalChainRun = this;
            }
        }
        if (this.orientation != 0 || !((ConstraintWidgetContainer) this.widget.mParent).mIsRtl) {
            z = false;
        } else {
            z = true;
        }
        if (z && this.widgets.size() > 1) {
            ArrayList<WidgetRun> arrayList3 = this.widgets;
            this.widget = arrayList3.get(arrayList3.size() - 1).widget;
        }
        if (this.orientation == 0) {
            i2 = this.widget.mHorizontalChainStyle;
        } else {
            i2 = this.widget.mVerticalChainStyle;
        }
        this.chainStyle = i2;
    }
}
