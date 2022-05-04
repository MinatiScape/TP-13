package androidx.constraintlayout.solver;

import androidx.constraintlayout.solver.LinearSystem;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
/* loaded from: classes.dex */
public class ArrayRow implements LinearSystem.Row {
    public final ArrayLinkedVariables variables;
    public SolverVariable variable = null;
    public float constantValue = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
    public boolean isSimpleDefinition = false;

    public ArrayRow(Cache cache) {
        this.variables = new ArrayLinkedVariables(this, cache);
    }

    public ArrayRow addError(LinearSystem linearSystem, int i) {
        this.variables.put(linearSystem.createErrorVariable(i, "ep"), 1.0f);
        this.variables.put(linearSystem.createErrorVariable(i, "em"), -1.0f);
        return this;
    }

    @Override // androidx.constraintlayout.solver.LinearSystem.Row
    public void clear() {
        this.variables.clear();
        this.variable = null;
        this.constantValue = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
    }

    public ArrayRow createRowDimensionRatio(SolverVariable solverVariable, SolverVariable solverVariable2, SolverVariable solverVariable3, SolverVariable solverVariable4, float f) {
        this.variables.put(solverVariable, -1.0f);
        this.variables.put(solverVariable2, 1.0f);
        this.variables.put(solverVariable3, f);
        this.variables.put(solverVariable4, -f);
        return this;
    }

    public ArrayRow createRowGreaterThan(SolverVariable solverVariable, SolverVariable solverVariable2, SolverVariable solverVariable3, int i) {
        boolean z = false;
        if (i != 0) {
            if (i < 0) {
                i *= -1;
                z = true;
            }
            this.constantValue = i;
        }
        if (!z) {
            this.variables.put(solverVariable, -1.0f);
            this.variables.put(solverVariable2, 1.0f);
            this.variables.put(solverVariable3, 1.0f);
        } else {
            this.variables.put(solverVariable, 1.0f);
            this.variables.put(solverVariable2, -1.0f);
            this.variables.put(solverVariable3, -1.0f);
        }
        return this;
    }

    public ArrayRow createRowLowerThan(SolverVariable solverVariable, SolverVariable solverVariable2, SolverVariable solverVariable3, int i) {
        boolean z = false;
        if (i != 0) {
            if (i < 0) {
                i *= -1;
                z = true;
            }
            this.constantValue = i;
        }
        if (!z) {
            this.variables.put(solverVariable, -1.0f);
            this.variables.put(solverVariable2, 1.0f);
            this.variables.put(solverVariable3, -1.0f);
        } else {
            this.variables.put(solverVariable, 1.0f);
            this.variables.put(solverVariable2, -1.0f);
            this.variables.put(solverVariable3, 1.0f);
        }
        return this;
    }

    public ArrayRow createRowWithAngle(SolverVariable solverVariable, SolverVariable solverVariable2, SolverVariable solverVariable3, SolverVariable solverVariable4, float f) {
        this.variables.put(solverVariable3, 0.5f);
        this.variables.put(solverVariable4, 0.5f);
        this.variables.put(solverVariable, -0.5f);
        this.variables.put(solverVariable2, -0.5f);
        this.constantValue = -f;
        return this;
    }

    @Override // androidx.constraintlayout.solver.LinearSystem.Row
    public SolverVariable getPivotCandidate(LinearSystem linearSystem, boolean[] zArr) {
        return this.variables.getPivotCandidate(zArr, null);
    }

    public void pivot(SolverVariable solverVariable) {
        SolverVariable solverVariable2 = this.variable;
        if (solverVariable2 != null) {
            this.variables.put(solverVariable2, -1.0f);
            this.variable = null;
        }
        float remove = this.variables.remove(solverVariable, true) * (-1.0f);
        this.variable = solverVariable;
        if (remove != 1.0f) {
            this.constantValue /= remove;
            ArrayLinkedVariables arrayLinkedVariables = this.variables;
            int i = arrayLinkedVariables.mHead;
            for (int i2 = 0; i != -1 && i2 < arrayLinkedVariables.currentSize; i2++) {
                float[] fArr = arrayLinkedVariables.mArrayValues;
                fArr[i] = fArr[i] / remove;
                i = arrayLinkedVariables.mArrayNextIndices[i];
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0076  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x007b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.String toString() {
        /*
            r10 = this;
            androidx.constraintlayout.solver.SolverVariable r0 = r10.variable
            if (r0 != 0) goto L7
            java.lang.String r0 = "0"
            goto L16
        L7:
            java.lang.String r0 = ""
            java.lang.StringBuilder r0 = android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m(r0)
            androidx.constraintlayout.solver.SolverVariable r1 = r10.variable
            r0.append(r1)
            java.lang.String r0 = r0.toString()
        L16:
            java.lang.String r1 = " = "
            java.lang.String r0 = androidx.appcompat.view.SupportMenuInflater$$ExternalSyntheticOutline0.m(r0, r1)
            float r1 = r10.constantValue
            r2 = 0
            int r1 = (r1 > r2 ? 1 : (r1 == r2 ? 0 : -1))
            r3 = 0
            r4 = 1
            if (r1 == 0) goto L34
            java.lang.StringBuilder r0 = android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m(r0)
            float r1 = r10.constantValue
            r0.append(r1)
            java.lang.String r0 = r0.toString()
            r1 = r4
            goto L35
        L34:
            r1 = r3
        L35:
            androidx.constraintlayout.solver.ArrayLinkedVariables r5 = r10.variables
            int r5 = r5.currentSize
        L39:
            if (r3 >= r5) goto L96
            androidx.constraintlayout.solver.ArrayLinkedVariables r6 = r10.variables
            androidx.constraintlayout.solver.SolverVariable r6 = r6.getVariable(r3)
            if (r6 != 0) goto L44
            goto L93
        L44:
            androidx.constraintlayout.solver.ArrayLinkedVariables r6 = r10.variables
            float r6 = r6.getVariableValue(r3)
            int r7 = (r6 > r2 ? 1 : (r6 == r2 ? 0 : -1))
            if (r7 != 0) goto L4f
            goto L93
        L4f:
            java.lang.String r8 = "null"
            r9 = -1082130432(0xffffffffbf800000, float:-1.0)
            if (r1 != 0) goto L60
            int r1 = (r6 > r2 ? 1 : (r6 == r2 ? 0 : -1))
            if (r1 >= 0) goto L70
            java.lang.String r1 = "- "
            java.lang.String r0 = androidx.appcompat.view.SupportMenuInflater$$ExternalSyntheticOutline0.m(r0, r1)
            goto L6f
        L60:
            if (r7 <= 0) goto L69
            java.lang.String r1 = " + "
            java.lang.String r0 = androidx.appcompat.view.SupportMenuInflater$$ExternalSyntheticOutline0.m(r0, r1)
            goto L70
        L69:
            java.lang.String r1 = " - "
            java.lang.String r0 = androidx.appcompat.view.SupportMenuInflater$$ExternalSyntheticOutline0.m(r0, r1)
        L6f:
            float r6 = r6 * r9
        L70:
            r1 = 1065353216(0x3f800000, float:1.0)
            int r1 = (r6 > r1 ? 1 : (r6 == r1 ? 0 : -1))
            if (r1 != 0) goto L7b
            java.lang.String r0 = androidx.appcompat.view.SupportMenuInflater$$ExternalSyntheticOutline0.m(r0, r8)
            goto L92
        L7b:
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            r1.append(r0)
            r1.append(r6)
            java.lang.String r0 = " "
            r1.append(r0)
            r1.append(r8)
            java.lang.String r0 = r1.toString()
        L92:
            r1 = r4
        L93:
            int r3 = r3 + 1
            goto L39
        L96:
            if (r1 != 0) goto L9e
            java.lang.String r10 = "0.0"
            java.lang.String r0 = androidx.appcompat.view.SupportMenuInflater$$ExternalSyntheticOutline0.m(r0, r10)
        L9e:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.constraintlayout.solver.ArrayRow.toString():java.lang.String");
    }

    public void updateFromRow(ArrayRow arrayRow, boolean z) {
        ArrayLinkedVariables arrayLinkedVariables = this.variables;
        int i = arrayLinkedVariables.mHead;
        while (true) {
            for (int i2 = 0; i != -1 && i2 < arrayLinkedVariables.currentSize; i2++) {
                int i3 = arrayLinkedVariables.mArrayIndices[i];
                SolverVariable solverVariable = arrayRow.variable;
                if (i3 == solverVariable.id) {
                    float f = arrayLinkedVariables.mArrayValues[i];
                    arrayLinkedVariables.remove(solverVariable, z);
                    ArrayLinkedVariables arrayLinkedVariables2 = arrayRow.variables;
                    int i4 = arrayLinkedVariables2.mHead;
                    for (int i5 = 0; i4 != -1 && i5 < arrayLinkedVariables2.currentSize; i5++) {
                        arrayLinkedVariables.add(((SolverVariable[]) arrayLinkedVariables.mCache.mIndexedVariables)[arrayLinkedVariables2.mArrayIndices[i4]], arrayLinkedVariables2.mArrayValues[i4] * f, z);
                        i4 = arrayLinkedVariables2.mArrayNextIndices[i4];
                    }
                    this.constantValue = (arrayRow.constantValue * f) + this.constantValue;
                    if (z) {
                        arrayRow.variable.removeFromRow(this);
                    }
                    i = arrayLinkedVariables.mHead;
                } else {
                    i = arrayLinkedVariables.mArrayNextIndices[i];
                }
            }
            return;
        }
    }

    @Override // androidx.constraintlayout.solver.LinearSystem.Row
    public void addError(SolverVariable solverVariable) {
        float f;
        int i = solverVariable.strength;
        if (i != 1) {
            if (i == 2) {
                f = 1000.0f;
            } else if (i == 3) {
                f = 1000000.0f;
            } else if (i == 4) {
                f = 1.0E9f;
            } else if (i == 5) {
                f = 1.0E12f;
            }
            this.variables.put(solverVariable, f);
        }
        f = 1.0f;
        this.variables.put(solverVariable, f);
    }
}
