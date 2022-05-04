package androidx.constraintlayout.solver.widgets;

import androidx.constraintlayout.solver.ArrayRow;
import androidx.constraintlayout.solver.LinearSystem;
import androidx.constraintlayout.solver.SolverVariable;
import androidx.constraintlayout.solver.widgets.ConstraintWidget;
/* loaded from: classes.dex */
public final class Barrier extends HelperWidget {
    public int mBarrierType = 0;
    public boolean mAllowsGoneWidget = true;
    public int mMargin = 0;

    @Override // androidx.constraintlayout.solver.widgets.ConstraintWidget
    public final boolean allowedInBarrier() {
        return true;
    }

    @Override // androidx.constraintlayout.solver.widgets.ConstraintWidget
    public final void addToSolver(LinearSystem linearSystem) {
        ConstraintAnchor[] constraintAnchorArr;
        boolean z;
        int i;
        int i2;
        ConstraintWidget.DimensionBehaviour dimensionBehaviour = ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT;
        ConstraintAnchor[] constraintAnchorArr2 = this.mListAnchors;
        constraintAnchorArr2[0] = this.mLeft;
        constraintAnchorArr2[2] = this.mTop;
        constraintAnchorArr2[1] = this.mRight;
        constraintAnchorArr2[3] = this.mBottom;
        int i3 = 0;
        while (true) {
            constraintAnchorArr = this.mListAnchors;
            if (i3 >= constraintAnchorArr.length) {
                break;
            }
            ConstraintAnchor constraintAnchor = constraintAnchorArr[i3];
            constraintAnchor.mSolverVariable = linearSystem.createObjectVariable(constraintAnchor);
            i3++;
        }
        int i4 = this.mBarrierType;
        if (i4 >= 0) {
            int i5 = 4;
            if (i4 < 4) {
                ConstraintAnchor constraintAnchor2 = constraintAnchorArr[i4];
                for (int i6 = 0; i6 < this.mWidgetsCount; i6++) {
                    ConstraintWidget constraintWidget = this.mWidgets[i6];
                    if ((this.mAllowsGoneWidget || constraintWidget.allowedInBarrier()) && ((((i2 = this.mBarrierType) == 0 || i2 == 1) && constraintWidget.mListDimensionBehaviors[0] == dimensionBehaviour && constraintWidget.mLeft.mTarget != null && constraintWidget.mRight.mTarget != null) || ((i2 == 2 || i2 == 3) && constraintWidget.mListDimensionBehaviors[1] == dimensionBehaviour && constraintWidget.mTop.mTarget != null && constraintWidget.mBottom.mTarget != null))) {
                        z = true;
                        break;
                    }
                }
                z = false;
                for (int i7 = 0; i7 < this.mWidgetsCount; i7++) {
                    ConstraintWidget constraintWidget2 = this.mWidgets[i7];
                    if (this.mAllowsGoneWidget || constraintWidget2.allowedInBarrier()) {
                        SolverVariable createObjectVariable = linearSystem.createObjectVariable(constraintWidget2.mListAnchors[this.mBarrierType]);
                        ConstraintAnchor[] constraintAnchorArr3 = constraintWidget2.mListAnchors;
                        int i8 = this.mBarrierType;
                        ConstraintAnchor constraintAnchor3 = constraintAnchorArr3[i8];
                        constraintAnchor3.mSolverVariable = createObjectVariable;
                        ConstraintAnchor constraintAnchor4 = constraintAnchor3.mTarget;
                        if (constraintAnchor4 == null || constraintAnchor4.mOwner != this) {
                            i = 0;
                        } else {
                            i = constraintAnchor3.mMargin + 0;
                        }
                        if (i8 == 0 || i8 == 2) {
                            SolverVariable solverVariable = constraintAnchor2.mSolverVariable;
                            int i9 = this.mMargin - i;
                            ArrayRow createRow = linearSystem.createRow();
                            SolverVariable createSlackVariable = linearSystem.createSlackVariable();
                            createSlackVariable.strength = 0;
                            createRow.createRowLowerThan(solverVariable, createObjectVariable, createSlackVariable, i9);
                            linearSystem.addConstraint(createRow);
                        } else {
                            SolverVariable solverVariable2 = constraintAnchor2.mSolverVariable;
                            int i10 = this.mMargin + i;
                            ArrayRow createRow2 = linearSystem.createRow();
                            SolverVariable createSlackVariable2 = linearSystem.createSlackVariable();
                            createSlackVariable2.strength = 0;
                            createRow2.createRowGreaterThan(solverVariable2, createObjectVariable, createSlackVariable2, i10);
                            linearSystem.addConstraint(createRow2);
                        }
                    }
                }
                if (!z) {
                    i5 = 5;
                }
                int i11 = this.mBarrierType;
                if (i11 == 0) {
                    linearSystem.addEquality(this.mRight.mSolverVariable, this.mLeft.mSolverVariable, 0, 7);
                    linearSystem.addEquality(this.mLeft.mSolverVariable, this.mParent.mRight.mSolverVariable, 0, i5);
                    linearSystem.addEquality(this.mLeft.mSolverVariable, this.mParent.mLeft.mSolverVariable, 0, 0);
                } else if (i11 == 1) {
                    linearSystem.addEquality(this.mLeft.mSolverVariable, this.mRight.mSolverVariable, 0, 7);
                    linearSystem.addEquality(this.mLeft.mSolverVariable, this.mParent.mLeft.mSolverVariable, 0, i5);
                    linearSystem.addEquality(this.mLeft.mSolverVariable, this.mParent.mRight.mSolverVariable, 0, 0);
                } else if (i11 == 2) {
                    linearSystem.addEquality(this.mBottom.mSolverVariable, this.mTop.mSolverVariable, 0, 7);
                    linearSystem.addEquality(this.mTop.mSolverVariable, this.mParent.mBottom.mSolverVariable, 0, i5);
                    linearSystem.addEquality(this.mTop.mSolverVariable, this.mParent.mTop.mSolverVariable, 0, 0);
                } else if (i11 == 3) {
                    linearSystem.addEquality(this.mTop.mSolverVariable, this.mBottom.mSolverVariable, 0, 7);
                    linearSystem.addEquality(this.mTop.mSolverVariable, this.mParent.mTop.mSolverVariable, 0, i5);
                    linearSystem.addEquality(this.mTop.mSolverVariable, this.mParent.mBottom.mSolverVariable, 0, 0);
                }
            }
        }
    }
}
