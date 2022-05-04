package androidx.constraintlayout.solver.widgets.analyzer;

import androidx.constraintlayout.solver.widgets.ConstraintAnchor;
import androidx.constraintlayout.solver.widgets.ConstraintWidget;
import androidx.constraintlayout.solver.widgets.ConstraintWidgetContainer;
import androidx.constraintlayout.solver.widgets.Guideline;
import androidx.constraintlayout.solver.widgets.HelperWidget;
import androidx.constraintlayout.solver.widgets.analyzer.BasicMeasure;
import androidx.constraintlayout.widget.ConstraintLayout;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
/* loaded from: classes.dex */
public final class DependencyGraph {
    public ConstraintWidgetContainer container;
    public ConstraintWidgetContainer mContainer;
    public boolean mNeedBuildGraph = true;
    public boolean mNeedRedoMeasures = true;
    public ArrayList<WidgetRun> mRuns = new ArrayList<>();
    public BasicMeasure.Measurer mMeasurer = null;
    public BasicMeasure.Measure mMeasure = new BasicMeasure.Measure();
    public ArrayList<RunGroup> mGroups = new ArrayList<>();

    public final void applyGroup(DependencyNode dependencyNode, int i, int i2, ArrayList arrayList, RunGroup runGroup) {
        WidgetRun widgetRun = dependencyNode.run;
        if (widgetRun.runGroup == null) {
            ConstraintWidgetContainer constraintWidgetContainer = this.container;
            if (widgetRun != constraintWidgetContainer.horizontalRun && widgetRun != constraintWidgetContainer.verticalRun) {
                if (runGroup == null) {
                    runGroup = new RunGroup(widgetRun);
                    arrayList.add(runGroup);
                }
                widgetRun.runGroup = runGroup;
                runGroup.runs.add(widgetRun);
                Iterator it = widgetRun.start.dependencies.iterator();
                while (it.hasNext()) {
                    Dependency dependency = (Dependency) it.next();
                    if (dependency instanceof DependencyNode) {
                        applyGroup((DependencyNode) dependency, i, 0, arrayList, runGroup);
                    }
                }
                Iterator it2 = widgetRun.end.dependencies.iterator();
                while (it2.hasNext()) {
                    Dependency dependency2 = (Dependency) it2.next();
                    if (dependency2 instanceof DependencyNode) {
                        applyGroup((DependencyNode) dependency2, i, 1, arrayList, runGroup);
                    }
                }
                if (i == 1 && (widgetRun instanceof VerticalWidgetRun)) {
                    Iterator it3 = ((VerticalWidgetRun) widgetRun).baseline.dependencies.iterator();
                    while (it3.hasNext()) {
                        Dependency dependency3 = (Dependency) it3.next();
                        if (dependency3 instanceof DependencyNode) {
                            applyGroup((DependencyNode) dependency3, i, 2, arrayList, runGroup);
                        }
                    }
                }
                Iterator it4 = widgetRun.start.targets.iterator();
                while (it4.hasNext()) {
                    applyGroup((DependencyNode) it4.next(), i, 0, arrayList, runGroup);
                }
                Iterator it5 = widgetRun.end.targets.iterator();
                while (it5.hasNext()) {
                    applyGroup((DependencyNode) it5.next(), i, 1, arrayList, runGroup);
                }
                if (i == 1 && (widgetRun instanceof VerticalWidgetRun)) {
                    Iterator it6 = ((VerticalWidgetRun) widgetRun).baseline.targets.iterator();
                    while (it6.hasNext()) {
                        applyGroup((DependencyNode) it6.next(), i, 2, arrayList, runGroup);
                    }
                }
            }
        }
    }

    public final void basicMeasureWidgets(ConstraintWidgetContainer constraintWidgetContainer) {
        ConstraintWidget.DimensionBehaviour dimensionBehaviour;
        ConstraintWidget.DimensionBehaviour[] dimensionBehaviourArr;
        ConstraintWidget.DimensionBehaviour dimensionBehaviour2;
        ConstraintWidget.DimensionBehaviour dimensionBehaviour3;
        int i;
        ConstraintWidget.DimensionBehaviour dimensionBehaviour4;
        ConstraintWidget.DimensionBehaviour dimensionBehaviour5 = ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT;
        ConstraintWidget.DimensionBehaviour dimensionBehaviour6 = ConstraintWidget.DimensionBehaviour.WRAP_CONTENT;
        ConstraintWidget.DimensionBehaviour dimensionBehaviour7 = ConstraintWidget.DimensionBehaviour.FIXED;
        Iterator<ConstraintWidget> it = constraintWidgetContainer.mChildren.iterator();
        while (it.hasNext()) {
            ConstraintWidget next = it.next();
            ConstraintWidget.DimensionBehaviour[] dimensionBehaviourArr2 = next.mListDimensionBehaviors;
            ConstraintWidget.DimensionBehaviour dimensionBehaviour8 = dimensionBehaviourArr2[0];
            ConstraintWidget.DimensionBehaviour dimensionBehaviour9 = dimensionBehaviourArr2[1];
            if (next.mVisibility == 8) {
                next.measured = true;
            } else {
                float f = next.mMatchConstraintPercentWidth;
                if (f < 1.0f && dimensionBehaviour8 == dimensionBehaviour5) {
                    next.mMatchConstraintDefaultWidth = 2;
                }
                float f2 = next.mMatchConstraintPercentHeight;
                if (f2 < 1.0f && dimensionBehaviour9 == dimensionBehaviour5) {
                    next.mMatchConstraintDefaultHeight = 2;
                }
                if (next.mDimensionRatio > HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                    if (dimensionBehaviour8 == dimensionBehaviour5 && (dimensionBehaviour9 == dimensionBehaviour6 || dimensionBehaviour9 == dimensionBehaviour7)) {
                        next.mMatchConstraintDefaultWidth = 3;
                    } else if (dimensionBehaviour9 == dimensionBehaviour5 && (dimensionBehaviour8 == dimensionBehaviour6 || dimensionBehaviour8 == dimensionBehaviour7)) {
                        next.mMatchConstraintDefaultHeight = 3;
                    } else if (dimensionBehaviour8 == dimensionBehaviour5 && dimensionBehaviour9 == dimensionBehaviour5) {
                        if (next.mMatchConstraintDefaultWidth == 0) {
                            next.mMatchConstraintDefaultWidth = 3;
                        }
                        if (next.mMatchConstraintDefaultHeight == 0) {
                            next.mMatchConstraintDefaultHeight = 3;
                        }
                    }
                }
                if (dimensionBehaviour8 == dimensionBehaviour5 && next.mMatchConstraintDefaultWidth == 1 && (next.mLeft.mTarget == null || next.mRight.mTarget == null)) {
                    dimensionBehaviour8 = dimensionBehaviour6;
                }
                if (dimensionBehaviour9 == dimensionBehaviour5 && next.mMatchConstraintDefaultHeight == 1 && (next.mTop.mTarget == null || next.mBottom.mTarget == null)) {
                    dimensionBehaviour = dimensionBehaviour6;
                } else {
                    dimensionBehaviour = dimensionBehaviour9;
                }
                HorizontalWidgetRun horizontalWidgetRun = next.horizontalRun;
                horizontalWidgetRun.dimensionBehavior = dimensionBehaviour8;
                int i2 = next.mMatchConstraintDefaultWidth;
                horizontalWidgetRun.matchConstraintsType = i2;
                VerticalWidgetRun verticalWidgetRun = next.verticalRun;
                verticalWidgetRun.dimensionBehavior = dimensionBehaviour;
                int i3 = next.mMatchConstraintDefaultHeight;
                verticalWidgetRun.matchConstraintsType = i3;
                ConstraintWidget.DimensionBehaviour dimensionBehaviour10 = ConstraintWidget.DimensionBehaviour.MATCH_PARENT;
                if ((dimensionBehaviour8 == dimensionBehaviour10 || dimensionBehaviour8 == dimensionBehaviour7 || dimensionBehaviour8 == dimensionBehaviour6) && (dimensionBehaviour == dimensionBehaviour10 || dimensionBehaviour == dimensionBehaviour7 || dimensionBehaviour == dimensionBehaviour6)) {
                    int width = next.getWidth();
                    if (dimensionBehaviour8 == dimensionBehaviour10) {
                        width = (constraintWidgetContainer.getWidth() - next.mLeft.mMargin) - next.mRight.mMargin;
                        dimensionBehaviour3 = dimensionBehaviour7;
                    } else {
                        dimensionBehaviour3 = dimensionBehaviour8;
                    }
                    int height = next.getHeight();
                    if (dimensionBehaviour == dimensionBehaviour10) {
                        i = (constraintWidgetContainer.getHeight() - next.mTop.mMargin) - next.mBottom.mMargin;
                        dimensionBehaviour4 = dimensionBehaviour7;
                    } else {
                        i = height;
                        dimensionBehaviour4 = dimensionBehaviour;
                    }
                    measure(next, dimensionBehaviour3, width, dimensionBehaviour4, i);
                    next.horizontalRun.dimension.resolve(next.getWidth());
                    next.verticalRun.dimension.resolve(next.getHeight());
                    next.measured = true;
                } else {
                    if (dimensionBehaviour8 == dimensionBehaviour5 && (dimensionBehaviour == dimensionBehaviour6 || dimensionBehaviour == dimensionBehaviour7)) {
                        if (i2 == 3) {
                            if (dimensionBehaviour == dimensionBehaviour6) {
                                measure(next, dimensionBehaviour6, 0, dimensionBehaviour6, 0);
                            }
                            int height2 = next.getHeight();
                            measure(next, dimensionBehaviour7, (int) ((height2 * next.mDimensionRatio) + 0.5f), dimensionBehaviour7, height2);
                            next.horizontalRun.dimension.resolve(next.getWidth());
                            next.verticalRun.dimension.resolve(next.getHeight());
                            next.measured = true;
                        } else if (i2 == 1) {
                            measure(next, dimensionBehaviour6, 0, dimensionBehaviour, 0);
                            next.horizontalRun.dimension.wrapValue = next.getWidth();
                        } else if (i2 == 2) {
                            ConstraintWidget.DimensionBehaviour dimensionBehaviour11 = constraintWidgetContainer.mListDimensionBehaviors[0];
                            if (dimensionBehaviour11 == dimensionBehaviour7 || dimensionBehaviour11 == dimensionBehaviour10) {
                                measure(next, dimensionBehaviour7, (int) ((f * constraintWidgetContainer.getWidth()) + 0.5f), dimensionBehaviour, next.getHeight());
                                next.horizontalRun.dimension.resolve(next.getWidth());
                                next.verticalRun.dimension.resolve(next.getHeight());
                                next.measured = true;
                            }
                        } else {
                            ConstraintAnchor[] constraintAnchorArr = next.mListAnchors;
                            if (constraintAnchorArr[0].mTarget == null || constraintAnchorArr[1].mTarget == null) {
                                measure(next, dimensionBehaviour6, 0, dimensionBehaviour, 0);
                                next.horizontalRun.dimension.resolve(next.getWidth());
                                next.verticalRun.dimension.resolve(next.getHeight());
                                next.measured = true;
                            }
                        }
                    }
                    if (dimensionBehaviour == dimensionBehaviour5 && (dimensionBehaviour8 == dimensionBehaviour6 || dimensionBehaviour8 == dimensionBehaviour7)) {
                        if (i3 == 3) {
                            if (dimensionBehaviour8 == dimensionBehaviour6) {
                                measure(next, dimensionBehaviour6, 0, dimensionBehaviour6, 0);
                            }
                            int width2 = next.getWidth();
                            float f3 = next.mDimensionRatio;
                            if (next.mDimensionRatioSide == -1) {
                                f3 = 1.0f / f3;
                            }
                            measure(next, dimensionBehaviour7, width2, dimensionBehaviour7, (int) ((width2 * f3) + 0.5f));
                            next.horizontalRun.dimension.resolve(next.getWidth());
                            next.verticalRun.dimension.resolve(next.getHeight());
                            next.measured = true;
                        } else if (i3 == 1) {
                            measure(next, dimensionBehaviour8, 0, dimensionBehaviour6, 0);
                            next.verticalRun.dimension.wrapValue = next.getHeight();
                        } else if (i3 == 2) {
                            ConstraintWidget.DimensionBehaviour dimensionBehaviour12 = constraintWidgetContainer.mListDimensionBehaviors[1];
                            if (dimensionBehaviour12 == dimensionBehaviour7 || dimensionBehaviour12 == dimensionBehaviour10) {
                                measure(next, dimensionBehaviour8, next.getWidth(), dimensionBehaviour7, (int) ((f2 * constraintWidgetContainer.getHeight()) + 0.5f));
                                next.horizontalRun.dimension.resolve(next.getWidth());
                                next.verticalRun.dimension.resolve(next.getHeight());
                                next.measured = true;
                            }
                        } else {
                            ConstraintAnchor[] constraintAnchorArr2 = next.mListAnchors;
                            if (constraintAnchorArr2[2].mTarget == null || constraintAnchorArr2[3].mTarget == null) {
                                measure(next, dimensionBehaviour6, 0, dimensionBehaviour, 0);
                                next.horizontalRun.dimension.resolve(next.getWidth());
                                next.verticalRun.dimension.resolve(next.getHeight());
                                next.measured = true;
                            }
                        }
                    }
                    if (dimensionBehaviour8 == dimensionBehaviour5 && dimensionBehaviour == dimensionBehaviour5) {
                        if (i2 == 1 || i3 == 1) {
                            measure(next, dimensionBehaviour6, 0, dimensionBehaviour6, 0);
                            next.horizontalRun.dimension.wrapValue = next.getWidth();
                            next.verticalRun.dimension.wrapValue = next.getHeight();
                        } else if (i3 == 2 && i2 == 2 && ((dimensionBehaviour2 = (dimensionBehaviourArr = constraintWidgetContainer.mListDimensionBehaviors)[0]) == dimensionBehaviour7 || dimensionBehaviour2 == dimensionBehaviour7)) {
                            ConstraintWidget.DimensionBehaviour dimensionBehaviour13 = dimensionBehaviourArr[1];
                            if (dimensionBehaviour13 == dimensionBehaviour7 || dimensionBehaviour13 == dimensionBehaviour7) {
                                measure(next, dimensionBehaviour7, (int) ((f * constraintWidgetContainer.getWidth()) + 0.5f), dimensionBehaviour7, (int) ((f2 * constraintWidgetContainer.getHeight()) + 0.5f));
                                next.horizontalRun.dimension.resolve(next.getWidth());
                                next.verticalRun.dimension.resolve(next.getHeight());
                                next.measured = true;
                            }
                        }
                    }
                }
            }
        }
    }

    public final void buildGraph() {
        ArrayList<WidgetRun> arrayList = this.mRuns;
        arrayList.clear();
        this.mContainer.horizontalRun.clear();
        this.mContainer.verticalRun.clear();
        arrayList.add(this.mContainer.horizontalRun);
        arrayList.add(this.mContainer.verticalRun);
        Iterator<ConstraintWidget> it = this.mContainer.mChildren.iterator();
        HashSet hashSet = null;
        while (it.hasNext()) {
            ConstraintWidget next = it.next();
            if (next instanceof Guideline) {
                arrayList.add(new GuidelineReference(next));
            } else {
                if (next.isInHorizontalChain()) {
                    if (next.horizontalChainRun == null) {
                        next.horizontalChainRun = new ChainRun(next, 0);
                    }
                    if (hashSet == null) {
                        hashSet = new HashSet();
                    }
                    hashSet.add(next.horizontalChainRun);
                } else {
                    arrayList.add(next.horizontalRun);
                }
                if (next.isInVerticalChain()) {
                    if (next.verticalChainRun == null) {
                        next.verticalChainRun = new ChainRun(next, 1);
                    }
                    if (hashSet == null) {
                        hashSet = new HashSet();
                    }
                    hashSet.add(next.verticalChainRun);
                } else {
                    arrayList.add(next.verticalRun);
                }
                if (next instanceof HelperWidget) {
                    arrayList.add(new HelperReferences(next));
                }
            }
        }
        if (hashSet != null) {
            arrayList.addAll(hashSet);
        }
        Iterator<WidgetRun> it2 = arrayList.iterator();
        while (it2.hasNext()) {
            it2.next().clear();
        }
        Iterator<WidgetRun> it3 = arrayList.iterator();
        while (it3.hasNext()) {
            WidgetRun next2 = it3.next();
            if (next2.widget != this.mContainer) {
                next2.apply();
            }
        }
        this.mGroups.clear();
        findGroup(this.container.horizontalRun, 0, this.mGroups);
        findGroup(this.container.verticalRun, 1, this.mGroups);
        this.mNeedBuildGraph = false;
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x003a  */
    /* JADX WARN: Removed duplicated region for block: B:15:0x003d  */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0043  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0046  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0064 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00d3  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00eb  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final int computeWrap(androidx.constraintlayout.solver.widgets.ConstraintWidgetContainer r17, int r18) {
        /*
            Method dump skipped, instructions count: 299
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.constraintlayout.solver.widgets.analyzer.DependencyGraph.computeWrap(androidx.constraintlayout.solver.widgets.ConstraintWidgetContainer, int):int");
    }

    public final void findGroup(WidgetRun widgetRun, int i, ArrayList<RunGroup> arrayList) {
        Iterator it = widgetRun.start.dependencies.iterator();
        while (it.hasNext()) {
            Dependency dependency = (Dependency) it.next();
            if (dependency instanceof DependencyNode) {
                applyGroup((DependencyNode) dependency, i, 0, arrayList, null);
            } else if (dependency instanceof WidgetRun) {
                applyGroup(((WidgetRun) dependency).start, i, 0, arrayList, null);
            }
        }
        Iterator it2 = widgetRun.end.dependencies.iterator();
        while (it2.hasNext()) {
            Dependency dependency2 = (Dependency) it2.next();
            if (dependency2 instanceof DependencyNode) {
                applyGroup((DependencyNode) dependency2, i, 1, arrayList, null);
            } else if (dependency2 instanceof WidgetRun) {
                applyGroup(((WidgetRun) dependency2).end, i, 1, arrayList, null);
            }
        }
        if (i == 1) {
            Iterator it3 = ((VerticalWidgetRun) widgetRun).baseline.dependencies.iterator();
            while (it3.hasNext()) {
                Dependency dependency3 = (Dependency) it3.next();
                if (dependency3 instanceof DependencyNode) {
                    applyGroup((DependencyNode) dependency3, i, 2, arrayList, null);
                }
            }
        }
    }

    public final void measure(ConstraintWidget constraintWidget, ConstraintWidget.DimensionBehaviour dimensionBehaviour, int i, ConstraintWidget.DimensionBehaviour dimensionBehaviour2, int i2) {
        boolean z;
        BasicMeasure.Measure measure = this.mMeasure;
        measure.horizontalBehavior = dimensionBehaviour;
        measure.verticalBehavior = dimensionBehaviour2;
        measure.horizontalDimension = i;
        measure.verticalDimension = i2;
        ((ConstraintLayout.Measurer) this.mMeasurer).measure(constraintWidget, measure);
        constraintWidget.setWidth(this.mMeasure.measuredWidth);
        constraintWidget.setHeight(this.mMeasure.measuredHeight);
        BasicMeasure.Measure measure2 = this.mMeasure;
        constraintWidget.hasBaseline = measure2.measuredHasBaseline;
        int i3 = measure2.measuredBaseline;
        constraintWidget.mBaselineDistance = i3;
        if (i3 > 0) {
            z = true;
        } else {
            z = false;
        }
        constraintWidget.hasBaseline = z;
    }

    public final void measureWidgets() {
        boolean z;
        BaselineDimensionDependency baselineDimensionDependency;
        ConstraintWidget.DimensionBehaviour dimensionBehaviour = ConstraintWidget.DimensionBehaviour.FIXED;
        ConstraintWidget.DimensionBehaviour dimensionBehaviour2 = ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT;
        Iterator<ConstraintWidget> it = this.container.mChildren.iterator();
        while (it.hasNext()) {
            ConstraintWidget next = it.next();
            if (!next.measured) {
                ConstraintWidget.DimensionBehaviour[] dimensionBehaviourArr = next.mListDimensionBehaviors;
                boolean z2 = false;
                ConstraintWidget.DimensionBehaviour dimensionBehaviour3 = dimensionBehaviourArr[0];
                ConstraintWidget.DimensionBehaviour dimensionBehaviour4 = dimensionBehaviourArr[1];
                int i = next.mMatchConstraintDefaultWidth;
                int i2 = next.mMatchConstraintDefaultHeight;
                ConstraintWidget.DimensionBehaviour dimensionBehaviour5 = ConstraintWidget.DimensionBehaviour.WRAP_CONTENT;
                if (dimensionBehaviour3 == dimensionBehaviour5 || (dimensionBehaviour3 == dimensionBehaviour2 && i == 1)) {
                    z = true;
                } else {
                    z = false;
                }
                if (dimensionBehaviour4 == dimensionBehaviour5 || (dimensionBehaviour4 == dimensionBehaviour2 && i2 == 1)) {
                    z2 = true;
                }
                DimensionDependency dimensionDependency = next.horizontalRun.dimension;
                boolean z3 = dimensionDependency.resolved;
                DimensionDependency dimensionDependency2 = next.verticalRun.dimension;
                boolean z4 = dimensionDependency2.resolved;
                if (z3 && z4) {
                    measure(next, dimensionBehaviour, dimensionDependency.value, dimensionBehaviour, dimensionDependency2.value);
                    next.measured = true;
                } else if (z3 && z2) {
                    measure(next, dimensionBehaviour, dimensionDependency.value, dimensionBehaviour5, dimensionDependency2.value);
                    if (dimensionBehaviour4 == dimensionBehaviour2) {
                        next.verticalRun.dimension.wrapValue = next.getHeight();
                    } else {
                        next.verticalRun.dimension.resolve(next.getHeight());
                        next.measured = true;
                    }
                } else if (z4 && z) {
                    measure(next, dimensionBehaviour5, dimensionDependency.value, dimensionBehaviour, dimensionDependency2.value);
                    if (dimensionBehaviour3 == dimensionBehaviour2) {
                        next.horizontalRun.dimension.wrapValue = next.getWidth();
                    } else {
                        next.horizontalRun.dimension.resolve(next.getWidth());
                        next.measured = true;
                    }
                }
                if (next.measured && (baselineDimensionDependency = next.verticalRun.baselineDimension) != null) {
                    baselineDimensionDependency.resolve(next.mBaselineDistance);
                }
            }
        }
    }

    public DependencyGraph(ConstraintWidgetContainer constraintWidgetContainer) {
        new ArrayList();
        this.container = constraintWidgetContainer;
        this.mContainer = constraintWidgetContainer;
    }
}
