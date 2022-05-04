package androidx.constraintlayout.solver.widgets;

import androidx.constraintlayout.solver.SolverVariable;
/* loaded from: classes.dex */
public class ConstraintAnchor {
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

    public ConstraintAnchor(ConstraintWidget constraintWidget, Type type) {
        this.mOwner = constraintWidget;
        this.mType = type;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x0027, code lost:
        if (r6.mOwner.hasBaseline == false) goto L22;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0041, code lost:
        if (r4 != r10) goto L21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x005b, code lost:
        if (r4 != r10) goto L22;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x0074, code lost:
        if (r4 != r2) goto L22;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean connect(androidx.constraintlayout.solver.widgets.ConstraintAnchor r7, int r8, int r9, boolean r10) {
        /*
            r6 = this;
            r0 = 1
            r1 = 0
            if (r7 != 0) goto Ld
            r7 = 0
            r6.mTarget = r7
            r6.mMargin = r1
            r7 = -1
            r6.mGoneMargin = r7
            return r0
        Ld:
            if (r10 != 0) goto L7a
            androidx.constraintlayout.solver.widgets.ConstraintAnchor$Type r10 = androidx.constraintlayout.solver.widgets.ConstraintAnchor.Type.CENTER_Y
            androidx.constraintlayout.solver.widgets.ConstraintAnchor$Type r2 = androidx.constraintlayout.solver.widgets.ConstraintAnchor.Type.CENTER_X
            androidx.constraintlayout.solver.widgets.ConstraintAnchor$Type r3 = androidx.constraintlayout.solver.widgets.ConstraintAnchor.Type.BASELINE
            androidx.constraintlayout.solver.widgets.ConstraintAnchor$Type r4 = r7.mType
            androidx.constraintlayout.solver.widgets.ConstraintAnchor$Type r5 = r6.mType
            if (r4 != r5) goto L2a
            if (r5 != r3) goto L43
            androidx.constraintlayout.solver.widgets.ConstraintWidget r10 = r7.mOwner
            boolean r10 = r10.hasBaseline
            if (r10 == 0) goto L45
            androidx.constraintlayout.solver.widgets.ConstraintWidget r10 = r6.mOwner
            boolean r10 = r10.hasBaseline
            if (r10 != 0) goto L43
            goto L45
        L2a:
            int r5 = r5.ordinal()
            switch(r5) {
                case 0: goto L45;
                case 1: goto L60;
                case 2: goto L47;
                case 3: goto L60;
                case 4: goto L47;
                case 5: goto L45;
                case 6: goto L3d;
                case 7: goto L45;
                case 8: goto L45;
                default: goto L31;
            }
        L31:
            java.lang.AssertionError r7 = new java.lang.AssertionError
            androidx.constraintlayout.solver.widgets.ConstraintAnchor$Type r6 = r6.mType
            java.lang.String r6 = r6.name()
            r7.<init>(r6)
            throw r7
        L3d:
            if (r4 == r3) goto L45
            if (r4 == r2) goto L45
            if (r4 == r10) goto L45
        L43:
            r10 = r0
            goto L77
        L45:
            r10 = r1
            goto L77
        L47:
            androidx.constraintlayout.solver.widgets.ConstraintAnchor$Type r2 = androidx.constraintlayout.solver.widgets.ConstraintAnchor.Type.TOP
            if (r4 == r2) goto L52
            androidx.constraintlayout.solver.widgets.ConstraintAnchor$Type r2 = androidx.constraintlayout.solver.widgets.ConstraintAnchor.Type.BOTTOM
            if (r4 != r2) goto L50
            goto L52
        L50:
            r2 = r1
            goto L53
        L52:
            r2 = r0
        L53:
            androidx.constraintlayout.solver.widgets.ConstraintWidget r3 = r7.mOwner
            boolean r3 = r3 instanceof androidx.constraintlayout.solver.widgets.Guideline
            if (r3 == 0) goto L5e
            if (r2 != 0) goto L43
            if (r4 != r10) goto L45
            goto L43
        L5e:
            r10 = r2
            goto L77
        L60:
            androidx.constraintlayout.solver.widgets.ConstraintAnchor$Type r10 = androidx.constraintlayout.solver.widgets.ConstraintAnchor.Type.LEFT
            if (r4 == r10) goto L6b
            androidx.constraintlayout.solver.widgets.ConstraintAnchor$Type r10 = androidx.constraintlayout.solver.widgets.ConstraintAnchor.Type.RIGHT
            if (r4 != r10) goto L69
            goto L6b
        L69:
            r10 = r1
            goto L6c
        L6b:
            r10 = r0
        L6c:
            androidx.constraintlayout.solver.widgets.ConstraintWidget r3 = r7.mOwner
            boolean r3 = r3 instanceof androidx.constraintlayout.solver.widgets.Guideline
            if (r3 == 0) goto L77
            if (r10 != 0) goto L43
            if (r4 != r2) goto L45
            goto L43
        L77:
            if (r10 != 0) goto L7a
            return r1
        L7a:
            r6.mTarget = r7
            if (r8 <= 0) goto L81
            r6.mMargin = r8
            goto L83
        L81:
            r6.mMargin = r1
        L83:
            r6.mGoneMargin = r9
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.constraintlayout.solver.widgets.ConstraintAnchor.connect(androidx.constraintlayout.solver.widgets.ConstraintAnchor, int, int, boolean):boolean");
    }

    public int getMargin() {
        ConstraintAnchor constraintAnchor;
        if (this.mOwner.mVisibility == 8) {
            return 0;
        }
        int i = this.mGoneMargin;
        return (i <= -1 || (constraintAnchor = this.mTarget) == null || constraintAnchor.mOwner.mVisibility != 8) ? this.mMargin : i;
    }

    public boolean isConnected() {
        return this.mTarget != null;
    }

    public void reset() {
        this.mTarget = null;
        this.mMargin = 0;
        this.mGoneMargin = -1;
    }

    public void resetSolverVariable() {
        SolverVariable solverVariable = this.mSolverVariable;
        if (solverVariable == null) {
            this.mSolverVariable = new SolverVariable(1);
        } else {
            solverVariable.reset();
        }
    }

    public String toString() {
        return this.mOwner.mDebugName + ":" + this.mType.toString();
    }
}
