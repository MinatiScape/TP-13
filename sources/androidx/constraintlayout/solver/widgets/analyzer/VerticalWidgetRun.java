package androidx.constraintlayout.solver.widgets.analyzer;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import androidx.constraintlayout.solver.widgets.ConstraintAnchor;
import androidx.constraintlayout.solver.widgets.ConstraintWidget;
import androidx.constraintlayout.solver.widgets.Helper;
import androidx.constraintlayout.solver.widgets.analyzer.DependencyNode;
import androidx.constraintlayout.solver.widgets.analyzer.WidgetRun;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
/* loaded from: classes.dex */
public final class VerticalWidgetRun extends WidgetRun {
    public DependencyNode baseline;
    public BaselineDimensionDependency baselineDimension = null;

    @Override // androidx.constraintlayout.solver.widgets.analyzer.WidgetRun
    public final void clear() {
        this.runGroup = null;
        this.start.clear();
        this.end.clear();
        this.baseline.clear();
        this.dimension.clear();
        this.resolved = false;
    }

    public final void reset() {
        this.resolved = false;
        this.start.clear();
        this.start.resolved = false;
        this.end.clear();
        this.end.resolved = false;
        this.baseline.clear();
        this.baseline.resolved = false;
        this.dimension.resolved = false;
    }

    @Override // androidx.constraintlayout.solver.widgets.analyzer.WidgetRun
    public final void apply() {
        ConstraintWidget constraintWidget;
        ConstraintWidget constraintWidget2;
        ConstraintWidget constraintWidget3;
        ConstraintWidget constraintWidget4;
        ConstraintWidget.DimensionBehaviour dimensionBehaviour = ConstraintWidget.DimensionBehaviour.MATCH_PARENT;
        ConstraintWidget.DimensionBehaviour dimensionBehaviour2 = ConstraintWidget.DimensionBehaviour.FIXED;
        ConstraintWidget.DimensionBehaviour dimensionBehaviour3 = ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT;
        ConstraintWidget constraintWidget5 = this.widget;
        if (constraintWidget5.measured) {
            this.dimension.resolve(constraintWidget5.getHeight());
        }
        if (!this.dimension.resolved) {
            ConstraintWidget constraintWidget6 = this.widget;
            this.dimensionBehavior = constraintWidget6.mListDimensionBehaviors[1];
            if (constraintWidget6.hasBaseline) {
                this.baselineDimension = new BaselineDimensionDependency(this);
            }
            ConstraintWidget.DimensionBehaviour dimensionBehaviour4 = this.dimensionBehavior;
            if (dimensionBehaviour4 != dimensionBehaviour3) {
                if (dimensionBehaviour4 == dimensionBehaviour && (constraintWidget4 = this.widget.mParent) != null && constraintWidget4.mListDimensionBehaviors[1] == dimensionBehaviour2) {
                    int height = (constraintWidget4.getHeight() - this.widget.mTop.getMargin()) - this.widget.mBottom.getMargin();
                    WidgetRun.addTarget(this.start, constraintWidget4.verticalRun.start, this.widget.mTop.getMargin());
                    WidgetRun.addTarget(this.end, constraintWidget4.verticalRun.end, -this.widget.mBottom.getMargin());
                    this.dimension.resolve(height);
                    return;
                } else if (dimensionBehaviour4 == dimensionBehaviour2) {
                    this.dimension.resolve(this.widget.getHeight());
                }
            }
        } else if (this.dimensionBehavior == dimensionBehaviour && (constraintWidget3 = (constraintWidget2 = this.widget).mParent) != null && constraintWidget3.mListDimensionBehaviors[1] == dimensionBehaviour2) {
            WidgetRun.addTarget(this.start, constraintWidget3.verticalRun.start, constraintWidget2.mTop.getMargin());
            WidgetRun.addTarget(this.end, constraintWidget3.verticalRun.end, -this.widget.mBottom.getMargin());
            return;
        }
        DimensionDependency dimensionDependency = this.dimension;
        boolean z = dimensionDependency.resolved;
        if (z) {
            ConstraintWidget constraintWidget7 = this.widget;
            if (constraintWidget7.measured) {
                ConstraintAnchor[] constraintAnchorArr = constraintWidget7.mListAnchors;
                ConstraintAnchor constraintAnchor = constraintAnchorArr[2];
                ConstraintAnchor constraintAnchor2 = constraintAnchor.mTarget;
                if (constraintAnchor2 != null && constraintAnchorArr[3].mTarget != null) {
                    if (constraintWidget7.isInVerticalChain()) {
                        this.start.margin = this.widget.mListAnchors[2].getMargin();
                        this.end.margin = -this.widget.mListAnchors[3].getMargin();
                    } else {
                        DependencyNode target = WidgetRun.getTarget(this.widget.mListAnchors[2]);
                        if (target != null) {
                            WidgetRun.addTarget(this.start, target, this.widget.mListAnchors[2].getMargin());
                        }
                        DependencyNode target2 = WidgetRun.getTarget(this.widget.mListAnchors[3]);
                        if (target2 != null) {
                            WidgetRun.addTarget(this.end, target2, -this.widget.mListAnchors[3].getMargin());
                        }
                        this.start.delegateToWidgetRun = true;
                        this.end.delegateToWidgetRun = true;
                    }
                    ConstraintWidget constraintWidget8 = this.widget;
                    if (constraintWidget8.hasBaseline) {
                        WidgetRun.addTarget(this.baseline, this.start, constraintWidget8.mBaselineDistance);
                        return;
                    }
                    return;
                } else if (constraintAnchor2 != null) {
                    DependencyNode target3 = WidgetRun.getTarget(constraintAnchor);
                    if (target3 != null) {
                        WidgetRun.addTarget(this.start, target3, this.widget.mListAnchors[2].getMargin());
                        WidgetRun.addTarget(this.end, this.start, this.dimension.value);
                        ConstraintWidget constraintWidget9 = this.widget;
                        if (constraintWidget9.hasBaseline) {
                            WidgetRun.addTarget(this.baseline, this.start, constraintWidget9.mBaselineDistance);
                            return;
                        }
                        return;
                    }
                    return;
                } else {
                    ConstraintAnchor constraintAnchor3 = constraintAnchorArr[3];
                    if (constraintAnchor3.mTarget != null) {
                        DependencyNode target4 = WidgetRun.getTarget(constraintAnchor3);
                        if (target4 != null) {
                            WidgetRun.addTarget(this.end, target4, -this.widget.mListAnchors[3].getMargin());
                            WidgetRun.addTarget(this.start, this.end, -this.dimension.value);
                        }
                        ConstraintWidget constraintWidget10 = this.widget;
                        if (constraintWidget10.hasBaseline) {
                            WidgetRun.addTarget(this.baseline, this.start, constraintWidget10.mBaselineDistance);
                            return;
                        }
                        return;
                    }
                    ConstraintAnchor constraintAnchor4 = constraintAnchorArr[4];
                    if (constraintAnchor4.mTarget != null) {
                        DependencyNode target5 = WidgetRun.getTarget(constraintAnchor4);
                        if (target5 != null) {
                            WidgetRun.addTarget(this.baseline, target5, 0);
                            WidgetRun.addTarget(this.start, this.baseline, -this.widget.mBaselineDistance);
                            WidgetRun.addTarget(this.end, this.start, this.dimension.value);
                            return;
                        }
                        return;
                    } else if (!(constraintWidget7 instanceof Helper) && constraintWidget7.mParent != null && constraintWidget7.getAnchor(ConstraintAnchor.Type.CENTER).mTarget == null) {
                        ConstraintWidget constraintWidget11 = this.widget;
                        WidgetRun.addTarget(this.start, constraintWidget11.mParent.verticalRun.start, constraintWidget11.getY());
                        WidgetRun.addTarget(this.end, this.start, this.dimension.value);
                        ConstraintWidget constraintWidget12 = this.widget;
                        if (constraintWidget12.hasBaseline) {
                            WidgetRun.addTarget(this.baseline, this.start, constraintWidget12.mBaselineDistance);
                            return;
                        }
                        return;
                    } else {
                        return;
                    }
                }
            }
        }
        if (z || this.dimensionBehavior != dimensionBehaviour3) {
            dimensionDependency.addDependency(this);
        } else {
            ConstraintWidget constraintWidget13 = this.widget;
            int i = constraintWidget13.mMatchConstraintDefaultHeight;
            if (i == 2) {
                ConstraintWidget constraintWidget14 = constraintWidget13.mParent;
                if (constraintWidget14 != null) {
                    DimensionDependency dimensionDependency2 = constraintWidget14.verticalRun.dimension;
                    dimensionDependency.targets.add(dimensionDependency2);
                    dimensionDependency2.dependencies.add(this.dimension);
                    DimensionDependency dimensionDependency3 = this.dimension;
                    dimensionDependency3.delegateToWidgetRun = true;
                    dimensionDependency3.dependencies.add(this.start);
                    this.dimension.dependencies.add(this.end);
                }
            } else if (i == 3 && !constraintWidget13.isInVerticalChain()) {
                ConstraintWidget constraintWidget15 = this.widget;
                if (constraintWidget15.mMatchConstraintDefaultWidth != 3) {
                    DimensionDependency dimensionDependency4 = constraintWidget15.horizontalRun.dimension;
                    this.dimension.targets.add(dimensionDependency4);
                    dimensionDependency4.dependencies.add(this.dimension);
                    DimensionDependency dimensionDependency5 = this.dimension;
                    dimensionDependency5.delegateToWidgetRun = true;
                    dimensionDependency5.dependencies.add(this.start);
                    this.dimension.dependencies.add(this.end);
                }
            }
        }
        ConstraintWidget constraintWidget16 = this.widget;
        ConstraintAnchor[] constraintAnchorArr2 = constraintWidget16.mListAnchors;
        ConstraintAnchor constraintAnchor5 = constraintAnchorArr2[2];
        ConstraintAnchor constraintAnchor6 = constraintAnchor5.mTarget;
        if (constraintAnchor6 != null && constraintAnchorArr2[3].mTarget != null) {
            if (constraintWidget16.isInVerticalChain()) {
                this.start.margin = this.widget.mListAnchors[2].getMargin();
                this.end.margin = -this.widget.mListAnchors[3].getMargin();
            } else {
                DependencyNode target6 = WidgetRun.getTarget(this.widget.mListAnchors[2]);
                DependencyNode target7 = WidgetRun.getTarget(this.widget.mListAnchors[3]);
                target6.addDependency(this);
                target7.addDependency(this);
                this.mRunType = WidgetRun.RunType.CENTER;
            }
            if (this.widget.hasBaseline) {
                addTarget(this.baseline, this.start, 1, this.baselineDimension);
            }
        } else if (constraintAnchor6 != null) {
            DependencyNode target8 = WidgetRun.getTarget(constraintAnchor5);
            if (target8 != null) {
                WidgetRun.addTarget(this.start, target8, this.widget.mListAnchors[2].getMargin());
                addTarget(this.end, this.start, 1, this.dimension);
                if (this.widget.hasBaseline) {
                    addTarget(this.baseline, this.start, 1, this.baselineDimension);
                }
                if (this.dimensionBehavior == dimensionBehaviour3) {
                    ConstraintWidget constraintWidget17 = this.widget;
                    if (constraintWidget17.mDimensionRatio > HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                        HorizontalWidgetRun horizontalWidgetRun = constraintWidget17.horizontalRun;
                        if (horizontalWidgetRun.dimensionBehavior == dimensionBehaviour3) {
                            horizontalWidgetRun.dimension.dependencies.add(this.dimension);
                            this.dimension.targets.add(this.widget.horizontalRun.dimension);
                            this.dimension.updateDelegate = this;
                        }
                    }
                }
            }
        } else {
            ConstraintAnchor constraintAnchor7 = constraintAnchorArr2[3];
            if (constraintAnchor7.mTarget != null) {
                DependencyNode target9 = WidgetRun.getTarget(constraintAnchor7);
                if (target9 != null) {
                    WidgetRun.addTarget(this.end, target9, -this.widget.mListAnchors[3].getMargin());
                    addTarget(this.start, this.end, -1, this.dimension);
                    if (this.widget.hasBaseline) {
                        addTarget(this.baseline, this.start, 1, this.baselineDimension);
                    }
                }
            } else {
                ConstraintAnchor constraintAnchor8 = constraintAnchorArr2[4];
                if (constraintAnchor8.mTarget != null) {
                    DependencyNode target10 = WidgetRun.getTarget(constraintAnchor8);
                    if (target10 != null) {
                        WidgetRun.addTarget(this.baseline, target10, 0);
                        addTarget(this.start, this.baseline, -1, this.baselineDimension);
                        addTarget(this.end, this.start, 1, this.dimension);
                    }
                } else if (!(constraintWidget16 instanceof Helper) && (constraintWidget = constraintWidget16.mParent) != null) {
                    WidgetRun.addTarget(this.start, constraintWidget.verticalRun.start, constraintWidget16.getY());
                    addTarget(this.end, this.start, 1, this.dimension);
                    if (this.widget.hasBaseline) {
                        addTarget(this.baseline, this.start, 1, this.baselineDimension);
                    }
                    if (this.dimensionBehavior == dimensionBehaviour3) {
                        ConstraintWidget constraintWidget18 = this.widget;
                        if (constraintWidget18.mDimensionRatio > HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                            HorizontalWidgetRun horizontalWidgetRun2 = constraintWidget18.horizontalRun;
                            if (horizontalWidgetRun2.dimensionBehavior == dimensionBehaviour3) {
                                horizontalWidgetRun2.dimension.dependencies.add(this.dimension);
                                this.dimension.targets.add(this.widget.horizontalRun.dimension);
                                this.dimension.updateDelegate = this;
                            }
                        }
                    }
                }
            }
        }
        if (this.dimension.targets.size() == 0) {
            this.dimension.readyToSolve = true;
        }
    }

    @Override // androidx.constraintlayout.solver.widgets.analyzer.WidgetRun
    public final void applyToWidget() {
        DependencyNode dependencyNode = this.start;
        if (dependencyNode.resolved) {
            this.widget.mY = dependencyNode.value;
        }
    }

    @Override // androidx.constraintlayout.solver.widgets.analyzer.WidgetRun
    public final boolean supportsWrapComputation() {
        if (this.dimensionBehavior != ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT || this.widget.mMatchConstraintDefaultHeight == 0) {
            return true;
        }
        return false;
    }

    public final String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("VerticalRun ");
        m.append(this.widget.mDebugName);
        return m.toString();
    }

    @Override // androidx.constraintlayout.solver.widgets.analyzer.WidgetRun, androidx.constraintlayout.solver.widgets.analyzer.Dependency
    public final void update(Dependency dependency) {
        DimensionDependency dimensionDependency;
        int i;
        float f;
        float f2;
        float f3;
        ConstraintWidget.DimensionBehaviour dimensionBehaviour = ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT;
        if (this.mRunType.ordinal() != 3) {
            DimensionDependency dimensionDependency2 = this.dimension;
            if (dimensionDependency2.readyToSolve && !dimensionDependency2.resolved && this.dimensionBehavior == dimensionBehaviour) {
                ConstraintWidget constraintWidget = this.widget;
                int i2 = constraintWidget.mMatchConstraintDefaultHeight;
                if (i2 == 2) {
                    ConstraintWidget constraintWidget2 = constraintWidget.mParent;
                    if (constraintWidget2 != null) {
                        if (constraintWidget2.verticalRun.dimension.resolved) {
                            dimensionDependency2.resolve((int) ((dimensionDependency.value * constraintWidget.mMatchConstraintPercentHeight) + 0.5f));
                        }
                    }
                } else if (i2 == 3) {
                    DimensionDependency dimensionDependency3 = constraintWidget.horizontalRun.dimension;
                    if (dimensionDependency3.resolved) {
                        int i3 = constraintWidget.mDimensionRatioSide;
                        if (i3 == -1) {
                            f3 = dimensionDependency3.value;
                            f2 = constraintWidget.mDimensionRatio;
                        } else if (i3 == 0) {
                            f = dimensionDependency3.value * constraintWidget.mDimensionRatio;
                            i = (int) (f + 0.5f);
                            dimensionDependency2.resolve(i);
                        } else if (i3 != 1) {
                            i = 0;
                            dimensionDependency2.resolve(i);
                        } else {
                            f3 = dimensionDependency3.value;
                            f2 = constraintWidget.mDimensionRatio;
                        }
                        f = f3 / f2;
                        i = (int) (f + 0.5f);
                        dimensionDependency2.resolve(i);
                    }
                }
            }
            DependencyNode dependencyNode = this.start;
            if (dependencyNode.readyToSolve) {
                DependencyNode dependencyNode2 = this.end;
                if (dependencyNode2.readyToSolve) {
                    if (!dependencyNode.resolved || !dependencyNode2.resolved || !this.dimension.resolved) {
                        if (!this.dimension.resolved && this.dimensionBehavior == dimensionBehaviour) {
                            ConstraintWidget constraintWidget3 = this.widget;
                            if (constraintWidget3.mMatchConstraintDefaultWidth == 0 && !constraintWidget3.isInVerticalChain()) {
                                int i4 = ((DependencyNode) this.start.targets.get(0)).value;
                                DependencyNode dependencyNode3 = this.start;
                                int i5 = i4 + dependencyNode3.margin;
                                int i6 = ((DependencyNode) this.end.targets.get(0)).value + this.end.margin;
                                dependencyNode3.resolve(i5);
                                this.end.resolve(i6);
                                this.dimension.resolve(i6 - i5);
                                return;
                            }
                        }
                        if (!this.dimension.resolved && this.dimensionBehavior == dimensionBehaviour && this.matchConstraintsType == 1 && this.start.targets.size() > 0 && this.end.targets.size() > 0) {
                            int i7 = (((DependencyNode) this.end.targets.get(0)).value + this.end.margin) - (((DependencyNode) this.start.targets.get(0)).value + this.start.margin);
                            DimensionDependency dimensionDependency4 = this.dimension;
                            int i8 = dimensionDependency4.wrapValue;
                            if (i7 < i8) {
                                dimensionDependency4.resolve(i7);
                            } else {
                                dimensionDependency4.resolve(i8);
                            }
                        }
                        if (this.dimension.resolved && this.start.targets.size() > 0 && this.end.targets.size() > 0) {
                            DependencyNode dependencyNode4 = (DependencyNode) this.start.targets.get(0);
                            DependencyNode dependencyNode5 = (DependencyNode) this.end.targets.get(0);
                            int i9 = dependencyNode4.value;
                            DependencyNode dependencyNode6 = this.start;
                            int i10 = dependencyNode6.margin + i9;
                            int i11 = dependencyNode5.value;
                            int i12 = this.end.margin + i11;
                            float f4 = this.widget.mVerticalBiasPercent;
                            if (dependencyNode4 == dependencyNode5) {
                                f4 = 0.5f;
                            } else {
                                i9 = i10;
                                i11 = i12;
                            }
                            dependencyNode6.resolve((int) ((((i11 - i9) - this.dimension.value) * f4) + i9 + 0.5f));
                            this.end.resolve(this.start.value + this.dimension.value);
                            return;
                        }
                        return;
                    }
                    return;
                }
                return;
            }
            return;
        }
        ConstraintWidget constraintWidget4 = this.widget;
        updateRunCenter(constraintWidget4.mTop, constraintWidget4.mBottom, 1);
    }

    public VerticalWidgetRun(ConstraintWidget constraintWidget) {
        super(constraintWidget);
        DependencyNode dependencyNode = new DependencyNode(this);
        this.baseline = dependencyNode;
        this.start.type = DependencyNode.Type.TOP;
        this.end.type = DependencyNode.Type.BOTTOM;
        dependencyNode.type = DependencyNode.Type.BASELINE;
        this.orientation = 1;
    }
}
