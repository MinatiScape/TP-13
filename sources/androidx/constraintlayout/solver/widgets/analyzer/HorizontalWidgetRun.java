package androidx.constraintlayout.solver.widgets.analyzer;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import androidx.constraintlayout.solver.widgets.ConstraintAnchor;
import androidx.constraintlayout.solver.widgets.ConstraintWidget;
import androidx.constraintlayout.solver.widgets.Helper;
import androidx.constraintlayout.solver.widgets.analyzer.DependencyNode;
import androidx.constraintlayout.solver.widgets.analyzer.WidgetRun;
/* loaded from: classes.dex */
public final class HorizontalWidgetRun extends WidgetRun {
    public static int[] tempDimensions = new int[2];

    public static void computeInsetRatio(int[] iArr, int i, int i2, int i3, int i4, float f, int i5) {
        int i6 = i2 - i;
        int i7 = i4 - i3;
        if (i5 == -1) {
            int i8 = (int) ((i7 * f) + 0.5f);
            int i9 = (int) ((i6 / f) + 0.5f);
            if (i8 <= i6) {
                iArr[0] = i8;
                iArr[1] = i7;
            } else if (i9 <= i7) {
                iArr[0] = i6;
                iArr[1] = i9;
            }
        } else if (i5 == 0) {
            iArr[0] = (int) ((i7 * f) + 0.5f);
            iArr[1] = i7;
        } else if (i5 == 1) {
            iArr[0] = i6;
            iArr[1] = (int) ((i6 * f) + 0.5f);
        }
    }

    @Override // androidx.constraintlayout.solver.widgets.analyzer.WidgetRun
    public final void clear() {
        this.runGroup = null;
        this.start.clear();
        this.end.clear();
        this.dimension.clear();
        this.resolved = false;
    }

    public final void reset() {
        this.resolved = false;
        this.start.clear();
        this.start.resolved = false;
        this.end.clear();
        this.end.resolved = false;
        this.dimension.resolved = false;
    }

    @Override // androidx.constraintlayout.solver.widgets.analyzer.WidgetRun
    public final void apply() {
        ConstraintWidget constraintWidget;
        ConstraintWidget constraintWidget2;
        ConstraintWidget constraintWidget3;
        ConstraintWidget constraintWidget4;
        ConstraintWidget.DimensionBehaviour dimensionBehaviour = ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT;
        ConstraintWidget.DimensionBehaviour dimensionBehaviour2 = ConstraintWidget.DimensionBehaviour.MATCH_PARENT;
        ConstraintWidget.DimensionBehaviour dimensionBehaviour3 = ConstraintWidget.DimensionBehaviour.FIXED;
        ConstraintWidget constraintWidget5 = this.widget;
        if (constraintWidget5.measured) {
            this.dimension.resolve(constraintWidget5.getWidth());
        }
        DimensionDependency dimensionDependency = this.dimension;
        if (!dimensionDependency.resolved) {
            ConstraintWidget constraintWidget6 = this.widget;
            ConstraintWidget.DimensionBehaviour dimensionBehaviour4 = constraintWidget6.mListDimensionBehaviors[0];
            this.dimensionBehavior = dimensionBehaviour4;
            if (dimensionBehaviour4 != dimensionBehaviour) {
                if (dimensionBehaviour4 == dimensionBehaviour2 && (((constraintWidget4 = constraintWidget6.mParent) != null && constraintWidget4.mListDimensionBehaviors[0] == dimensionBehaviour3) || constraintWidget4.mListDimensionBehaviors[0] == dimensionBehaviour2)) {
                    int width = (constraintWidget4.getWidth() - this.widget.mLeft.getMargin()) - this.widget.mRight.getMargin();
                    WidgetRun.addTarget(this.start, constraintWidget4.horizontalRun.start, this.widget.mLeft.getMargin());
                    WidgetRun.addTarget(this.end, constraintWidget4.horizontalRun.end, -this.widget.mRight.getMargin());
                    this.dimension.resolve(width);
                    return;
                } else if (dimensionBehaviour4 == dimensionBehaviour3) {
                    dimensionDependency.resolve(constraintWidget6.getWidth());
                }
            }
        } else if (this.dimensionBehavior == dimensionBehaviour2 && (((constraintWidget3 = (constraintWidget2 = this.widget).mParent) != null && constraintWidget3.mListDimensionBehaviors[0] == dimensionBehaviour3) || constraintWidget3.mListDimensionBehaviors[0] == dimensionBehaviour2)) {
            WidgetRun.addTarget(this.start, constraintWidget3.horizontalRun.start, constraintWidget2.mLeft.getMargin());
            WidgetRun.addTarget(this.end, constraintWidget3.horizontalRun.end, -this.widget.mRight.getMargin());
            return;
        }
        DimensionDependency dimensionDependency2 = this.dimension;
        if (dimensionDependency2.resolved) {
            ConstraintWidget constraintWidget7 = this.widget;
            if (constraintWidget7.measured) {
                ConstraintAnchor[] constraintAnchorArr = constraintWidget7.mListAnchors;
                ConstraintAnchor constraintAnchor = constraintAnchorArr[0];
                ConstraintAnchor constraintAnchor2 = constraintAnchor.mTarget;
                if (constraintAnchor2 == null || constraintAnchorArr[1].mTarget == null) {
                    if (constraintAnchor2 != null) {
                        DependencyNode target = WidgetRun.getTarget(constraintAnchor);
                        if (target != null) {
                            WidgetRun.addTarget(this.start, target, this.widget.mListAnchors[0].getMargin());
                            WidgetRun.addTarget(this.end, this.start, this.dimension.value);
                            return;
                        }
                        return;
                    }
                    ConstraintAnchor constraintAnchor3 = constraintAnchorArr[1];
                    if (constraintAnchor3.mTarget != null) {
                        DependencyNode target2 = WidgetRun.getTarget(constraintAnchor3);
                        if (target2 != null) {
                            WidgetRun.addTarget(this.end, target2, -this.widget.mListAnchors[1].getMargin());
                            WidgetRun.addTarget(this.start, this.end, -this.dimension.value);
                            return;
                        }
                        return;
                    } else if (!(constraintWidget7 instanceof Helper) && constraintWidget7.mParent != null && constraintWidget7.getAnchor(ConstraintAnchor.Type.CENTER).mTarget == null) {
                        ConstraintWidget constraintWidget8 = this.widget;
                        WidgetRun.addTarget(this.start, constraintWidget8.mParent.horizontalRun.start, constraintWidget8.getX());
                        WidgetRun.addTarget(this.end, this.start, this.dimension.value);
                        return;
                    } else {
                        return;
                    }
                } else if (constraintWidget7.isInHorizontalChain()) {
                    this.start.margin = this.widget.mListAnchors[0].getMargin();
                    this.end.margin = -this.widget.mListAnchors[1].getMargin();
                    return;
                } else {
                    DependencyNode target3 = WidgetRun.getTarget(this.widget.mListAnchors[0]);
                    if (target3 != null) {
                        WidgetRun.addTarget(this.start, target3, this.widget.mListAnchors[0].getMargin());
                    }
                    DependencyNode target4 = WidgetRun.getTarget(this.widget.mListAnchors[1]);
                    if (target4 != null) {
                        WidgetRun.addTarget(this.end, target4, -this.widget.mListAnchors[1].getMargin());
                    }
                    this.start.delegateToWidgetRun = true;
                    this.end.delegateToWidgetRun = true;
                    return;
                }
            }
        }
        if (this.dimensionBehavior == dimensionBehaviour) {
            ConstraintWidget constraintWidget9 = this.widget;
            int i = constraintWidget9.mMatchConstraintDefaultWidth;
            if (i == 2) {
                ConstraintWidget constraintWidget10 = constraintWidget9.mParent;
                if (constraintWidget10 != null) {
                    DimensionDependency dimensionDependency3 = constraintWidget10.verticalRun.dimension;
                    dimensionDependency2.targets.add(dimensionDependency3);
                    dimensionDependency3.dependencies.add(this.dimension);
                    DimensionDependency dimensionDependency4 = this.dimension;
                    dimensionDependency4.delegateToWidgetRun = true;
                    dimensionDependency4.dependencies.add(this.start);
                    this.dimension.dependencies.add(this.end);
                }
            } else if (i == 3) {
                if (constraintWidget9.mMatchConstraintDefaultHeight == 3) {
                    this.start.updateDelegate = this;
                    this.end.updateDelegate = this;
                    VerticalWidgetRun verticalWidgetRun = constraintWidget9.verticalRun;
                    verticalWidgetRun.start.updateDelegate = this;
                    verticalWidgetRun.end.updateDelegate = this;
                    dimensionDependency2.updateDelegate = this;
                    if (constraintWidget9.isInVerticalChain()) {
                        this.dimension.targets.add(this.widget.verticalRun.dimension);
                        this.widget.verticalRun.dimension.dependencies.add(this.dimension);
                        VerticalWidgetRun verticalWidgetRun2 = this.widget.verticalRun;
                        verticalWidgetRun2.dimension.updateDelegate = this;
                        this.dimension.targets.add(verticalWidgetRun2.start);
                        this.dimension.targets.add(this.widget.verticalRun.end);
                        this.widget.verticalRun.start.dependencies.add(this.dimension);
                        this.widget.verticalRun.end.dependencies.add(this.dimension);
                    } else if (this.widget.isInHorizontalChain()) {
                        this.widget.verticalRun.dimension.targets.add(this.dimension);
                        this.dimension.dependencies.add(this.widget.verticalRun.dimension);
                    } else {
                        this.widget.verticalRun.dimension.targets.add(this.dimension);
                    }
                } else {
                    DimensionDependency dimensionDependency5 = constraintWidget9.verticalRun.dimension;
                    dimensionDependency2.targets.add(dimensionDependency5);
                    dimensionDependency5.dependencies.add(this.dimension);
                    this.widget.verticalRun.start.dependencies.add(this.dimension);
                    this.widget.verticalRun.end.dependencies.add(this.dimension);
                    DimensionDependency dimensionDependency6 = this.dimension;
                    dimensionDependency6.delegateToWidgetRun = true;
                    dimensionDependency6.dependencies.add(this.start);
                    this.dimension.dependencies.add(this.end);
                    this.start.targets.add(this.dimension);
                    this.end.targets.add(this.dimension);
                }
            }
        }
        ConstraintWidget constraintWidget11 = this.widget;
        ConstraintAnchor[] constraintAnchorArr2 = constraintWidget11.mListAnchors;
        ConstraintAnchor constraintAnchor4 = constraintAnchorArr2[0];
        ConstraintAnchor constraintAnchor5 = constraintAnchor4.mTarget;
        if (constraintAnchor5 == null || constraintAnchorArr2[1].mTarget == null) {
            if (constraintAnchor5 != null) {
                DependencyNode target5 = WidgetRun.getTarget(constraintAnchor4);
                if (target5 != null) {
                    WidgetRun.addTarget(this.start, target5, this.widget.mListAnchors[0].getMargin());
                    addTarget(this.end, this.start, 1, this.dimension);
                    return;
                }
                return;
            }
            ConstraintAnchor constraintAnchor6 = constraintAnchorArr2[1];
            if (constraintAnchor6.mTarget != null) {
                DependencyNode target6 = WidgetRun.getTarget(constraintAnchor6);
                if (target6 != null) {
                    WidgetRun.addTarget(this.end, target6, -this.widget.mListAnchors[1].getMargin());
                    addTarget(this.start, this.end, -1, this.dimension);
                }
            } else if (!(constraintWidget11 instanceof Helper) && (constraintWidget = constraintWidget11.mParent) != null) {
                WidgetRun.addTarget(this.start, constraintWidget.horizontalRun.start, constraintWidget11.getX());
                addTarget(this.end, this.start, 1, this.dimension);
            }
        } else if (constraintWidget11.isInHorizontalChain()) {
            this.start.margin = this.widget.mListAnchors[0].getMargin();
            this.end.margin = -this.widget.mListAnchors[1].getMargin();
        } else {
            DependencyNode target7 = WidgetRun.getTarget(this.widget.mListAnchors[0]);
            DependencyNode target8 = WidgetRun.getTarget(this.widget.mListAnchors[1]);
            target7.addDependency(this);
            target8.addDependency(this);
            this.mRunType = WidgetRun.RunType.CENTER;
        }
    }

    @Override // androidx.constraintlayout.solver.widgets.analyzer.WidgetRun
    public final void applyToWidget() {
        DependencyNode dependencyNode = this.start;
        if (dependencyNode.resolved) {
            this.widget.mX = dependencyNode.value;
        }
    }

    @Override // androidx.constraintlayout.solver.widgets.analyzer.WidgetRun
    public final boolean supportsWrapComputation() {
        if (this.dimensionBehavior != ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT || this.widget.mMatchConstraintDefaultWidth == 0) {
            return true;
        }
        return false;
    }

    public final String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("HorizontalRun ");
        m.append(this.widget.mDebugName);
        return m.toString();
    }

    /* JADX WARN: Code restructure failed: missing block: B:105:0x0273, code lost:
        if (r15 != 1) goto L120;
     */
    @Override // androidx.constraintlayout.solver.widgets.analyzer.WidgetRun, androidx.constraintlayout.solver.widgets.analyzer.Dependency
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void update(androidx.constraintlayout.solver.widgets.analyzer.Dependency r21) {
        /*
            Method dump skipped, instructions count: 1012
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.constraintlayout.solver.widgets.analyzer.HorizontalWidgetRun.update(androidx.constraintlayout.solver.widgets.analyzer.Dependency):void");
    }

    public HorizontalWidgetRun(ConstraintWidget constraintWidget) {
        super(constraintWidget);
        this.start.type = DependencyNode.Type.LEFT;
        this.end.type = DependencyNode.Type.RIGHT;
        this.orientation = 0;
    }
}
