package androidx.constraintlayout.solver;

import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import java.util.Arrays;
/* loaded from: classes.dex */
public final class SolverVariable {
    public float computedValue;
    public boolean inGoal;
    public Type mType;
    public int id = -1;
    public int definitionId = -1;
    public int strength = 0;
    public float[] strengthVector = new float[8];
    public float[] goalStrengthVector = new float[8];
    public ArrayRow[] mClientEquations = new ArrayRow[8];
    public int mClientEquationsCount = 0;
    public int usageInRowCount = 0;

    /* loaded from: classes.dex */
    public enum Type {
        UNRESTRICTED,
        /* JADX INFO: Fake field, exist only in values array */
        CONSTANT,
        SLACK,
        ERROR,
        UNKNOWN
    }

    public final void addToRow(ArrayRow arrayRow) {
        int i = 0;
        while (true) {
            int i2 = this.mClientEquationsCount;
            if (i >= i2) {
                ArrayRow[] arrayRowArr = this.mClientEquations;
                if (i2 >= arrayRowArr.length) {
                    this.mClientEquations = (ArrayRow[]) Arrays.copyOf(arrayRowArr, arrayRowArr.length * 2);
                }
                ArrayRow[] arrayRowArr2 = this.mClientEquations;
                int i3 = this.mClientEquationsCount;
                arrayRowArr2[i3] = arrayRow;
                this.mClientEquationsCount = i3 + 1;
                return;
            } else if (this.mClientEquations[i] != arrayRow) {
                i++;
            } else {
                return;
            }
        }
    }

    public final String toString() {
        return "null";
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x001f, code lost:
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:7:0x000d, code lost:
        if (r1 >= (r0 - 1)) goto L15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x000f, code lost:
        r5 = r4.mClientEquations;
        r2 = r1 + 1;
        r5[r1] = r5[r2];
        r1 = r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:9:0x0019, code lost:
        r4.mClientEquationsCount--;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void removeFromRow(androidx.constraintlayout.solver.ArrayRow r5) {
        /*
            r4 = this;
            int r0 = r4.mClientEquationsCount
            r1 = 0
        L3:
            if (r1 >= r0) goto L23
            androidx.constraintlayout.solver.ArrayRow[] r2 = r4.mClientEquations
            r2 = r2[r1]
            if (r2 != r5) goto L20
        Lb:
            int r5 = r0 + (-1)
            if (r1 >= r5) goto L19
            androidx.constraintlayout.solver.ArrayRow[] r5 = r4.mClientEquations
            int r2 = r1 + 1
            r3 = r5[r2]
            r5[r1] = r3
            r1 = r2
            goto Lb
        L19:
            int r5 = r4.mClientEquationsCount
            int r5 = r5 + (-1)
            r4.mClientEquationsCount = r5
            return
        L20:
            int r1 = r1 + 1
            goto L3
        L23:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.constraintlayout.solver.SolverVariable.removeFromRow(androidx.constraintlayout.solver.ArrayRow):void");
    }

    public final void reset() {
        this.mType = Type.UNKNOWN;
        this.strength = 0;
        this.id = -1;
        this.definitionId = -1;
        this.computedValue = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        this.mClientEquationsCount = 0;
        this.usageInRowCount = 0;
        this.inGoal = false;
        Arrays.fill(this.goalStrengthVector, (float) HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
    }

    public final void updateReferencesWithNewDefinition(ArrayRow arrayRow) {
        int i = this.mClientEquationsCount;
        for (int i2 = 0; i2 < i; i2++) {
            this.mClientEquations[i2].updateFromRow(arrayRow);
        }
        this.mClientEquationsCount = 0;
    }

    public SolverVariable(Type type) {
        this.mType = type;
    }
}
