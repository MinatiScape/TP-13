package androidx.constraintlayout.solver.widgets;

import androidx.constraintlayout.solver.SolverVariable;
/* loaded from: classes.dex */
public final class ConstraintAnchor {
    public final ConstraintWidget mOwner;
    public SolverVariable mSolverVariable;
    public ConstraintAnchor mTarget;
    public final Type mType;
    public int mMargin = 0;
    public int mGoneMargin = -1;

    /* loaded from: classes.dex */
    public enum Type {
        /* JADX INFO: Fake field, exist only in values array */
        NONE,
        LEFT,
        TOP,
        RIGHT,
        BOTTOM,
        BASELINE,
        CENTER,
        CENTER_X,
        CENTER_Y
    }

    public final void connect(ConstraintAnchor constraintAnchor, int i, int i2) {
        if (constraintAnchor == null) {
            this.mTarget = null;
            this.mMargin = 0;
            this.mGoneMargin = -1;
            return;
        }
        this.mTarget = constraintAnchor;
        if (i > 0) {
            this.mMargin = i;
        } else {
            this.mMargin = 0;
        }
        this.mGoneMargin = i2;
    }

    public final void reset() {
        this.mTarget = null;
        this.mMargin = 0;
        this.mGoneMargin = -1;
    }

    public final int getMargin() {
        ConstraintAnchor constraintAnchor;
        if (this.mOwner.mVisibility == 8) {
            return 0;
        }
        int i = this.mGoneMargin;
        if (i <= -1 || (constraintAnchor = this.mTarget) == null || constraintAnchor.mOwner.mVisibility != 8) {
            return this.mMargin;
        }
        return i;
    }

    public final boolean isConnected() {
        if (this.mTarget != null) {
            return true;
        }
        return false;
    }

    public final void resetSolverVariable() {
        SolverVariable solverVariable = this.mSolverVariable;
        if (solverVariable == null) {
            this.mSolverVariable = new SolverVariable(SolverVariable.Type.UNRESTRICTED);
        } else {
            solverVariable.reset();
        }
    }

    public final String toString() {
        return this.mOwner.mDebugName + ":" + this.mType.toString();
    }

    public ConstraintAnchor(ConstraintWidget constraintWidget, Type type) {
        this.mOwner = constraintWidget;
        this.mType = type;
    }
}
