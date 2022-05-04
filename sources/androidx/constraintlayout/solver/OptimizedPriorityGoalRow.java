package androidx.constraintlayout.solver;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import java.util.Arrays;
import java.util.Comparator;
/* loaded from: classes.dex */
public class OptimizedPriorityGoalRow extends ArrayRow {
    public Cache mCache;
    public SolverVariable[] arrayGoals = new SolverVariable[128];
    public SolverVariable[] sortArray = new SolverVariable[128];
    public int numGoals = 0;
    public GoalVariableAccessor accessor = new GoalVariableAccessor(this);

    /* loaded from: classes.dex */
    public class GoalVariableAccessor implements Comparable {
        public SolverVariable variable;

        public GoalVariableAccessor(OptimizedPriorityGoalRow optimizedPriorityGoalRow) {
        }

        @Override // java.lang.Comparable
        public int compareTo(Object obj) {
            return this.variable.id - ((SolverVariable) obj).id;
        }

        public String toString() {
            String str = "[ ";
            if (this.variable != null) {
                for (int i = 0; i < 8; i++) {
                    StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m(str);
                    m.append(this.variable.goalStrengthVector[i]);
                    m.append(" ");
                    str = m.toString();
                }
            }
            return str + "] " + this.variable;
        }
    }

    public OptimizedPriorityGoalRow(Cache cache) {
        super(cache);
        this.mCache = cache;
    }

    @Override // androidx.constraintlayout.solver.ArrayRow, androidx.constraintlayout.solver.LinearSystem.Row
    public void addError(SolverVariable solverVariable) {
        this.accessor.variable = solverVariable;
        Arrays.fill(solverVariable.goalStrengthVector, (float) HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        solverVariable.goalStrengthVector[solverVariable.strength] = 1.0f;
        addToGoal(solverVariable);
    }

    public final void addToGoal(SolverVariable solverVariable) {
        int i;
        int i2 = this.numGoals + 1;
        SolverVariable[] solverVariableArr = this.arrayGoals;
        if (i2 > solverVariableArr.length) {
            SolverVariable[] solverVariableArr2 = (SolverVariable[]) Arrays.copyOf(solverVariableArr, solverVariableArr.length * 2);
            this.arrayGoals = solverVariableArr2;
            this.sortArray = (SolverVariable[]) Arrays.copyOf(solverVariableArr2, solverVariableArr2.length * 2);
        }
        SolverVariable[] solverVariableArr3 = this.arrayGoals;
        int i3 = this.numGoals;
        solverVariableArr3[i3] = solverVariable;
        int i4 = i3 + 1;
        this.numGoals = i4;
        if (i4 > 1 && solverVariableArr3[i4 - 1].id > solverVariable.id) {
            int i5 = 0;
            while (true) {
                i = this.numGoals;
                if (i5 >= i) {
                    break;
                }
                this.sortArray[i5] = this.arrayGoals[i5];
                i5++;
            }
            Arrays.sort(this.sortArray, 0, i, new Comparator<SolverVariable>(this) { // from class: androidx.constraintlayout.solver.OptimizedPriorityGoalRow.1
                @Override // java.util.Comparator
                public int compare(SolverVariable solverVariable2, SolverVariable solverVariable3) {
                    return solverVariable2.id - solverVariable3.id;
                }
            });
            for (int i6 = 0; i6 < this.numGoals; i6++) {
                this.arrayGoals[i6] = this.sortArray[i6];
            }
        }
        solverVariable.inGoal = true;
        solverVariable.addToRow(this);
    }

    @Override // androidx.constraintlayout.solver.ArrayRow, androidx.constraintlayout.solver.LinearSystem.Row
    public void clear() {
        this.numGoals = 0;
        this.constantValue = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x004c, code lost:
        if (r8 < r7) goto L25;
     */
    @Override // androidx.constraintlayout.solver.ArrayRow, androidx.constraintlayout.solver.LinearSystem.Row
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public androidx.constraintlayout.solver.SolverVariable getPivotCandidate(androidx.constraintlayout.solver.LinearSystem r11, boolean[] r12) {
        /*
            r10 = this;
            r11 = -1
            r0 = 0
            r2 = r11
            r1 = r0
        L4:
            int r3 = r10.numGoals
            if (r1 >= r3) goto L56
            androidx.constraintlayout.solver.SolverVariable[] r3 = r10.arrayGoals
            r4 = r3[r1]
            int r5 = r4.id
            boolean r5 = r12[r5]
            if (r5 == 0) goto L13
            goto L53
        L13:
            androidx.constraintlayout.solver.OptimizedPriorityGoalRow$GoalVariableAccessor r5 = r10.accessor
            r5.variable = r4
            r4 = 7
            r6 = 1
            if (r2 != r11) goto L35
        L1b:
            if (r4 < 0) goto L31
            androidx.constraintlayout.solver.SolverVariable r3 = r5.variable
            float[] r3 = r3.goalStrengthVector
            r3 = r3[r4]
            r7 = 0
            int r8 = (r3 > r7 ? 1 : (r3 == r7 ? 0 : -1))
            if (r8 <= 0) goto L29
            goto L31
        L29:
            int r3 = (r3 > r7 ? 1 : (r3 == r7 ? 0 : -1))
            if (r3 >= 0) goto L2e
            goto L32
        L2e:
            int r4 = r4 + (-1)
            goto L1b
        L31:
            r6 = r0
        L32:
            if (r6 == 0) goto L53
            goto L52
        L35:
            r3 = r3[r2]
        L37:
            if (r4 < 0) goto L4f
            float[] r7 = r3.goalStrengthVector
            r7 = r7[r4]
            androidx.constraintlayout.solver.SolverVariable r8 = r5.variable
            float[] r8 = r8.goalStrengthVector
            r8 = r8[r4]
            int r9 = (r8 > r7 ? 1 : (r8 == r7 ? 0 : -1))
            if (r9 != 0) goto L4a
            int r4 = r4 + (-1)
            goto L37
        L4a:
            int r3 = (r8 > r7 ? 1 : (r8 == r7 ? 0 : -1))
            if (r3 >= 0) goto L4f
            goto L50
        L4f:
            r6 = r0
        L50:
            if (r6 == 0) goto L53
        L52:
            r2 = r1
        L53:
            int r1 = r1 + 1
            goto L4
        L56:
            if (r2 != r11) goto L5a
            r10 = 0
            return r10
        L5a:
            androidx.constraintlayout.solver.SolverVariable[] r10 = r10.arrayGoals
            r10 = r10[r2]
            return r10
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.constraintlayout.solver.OptimizedPriorityGoalRow.getPivotCandidate(androidx.constraintlayout.solver.LinearSystem, boolean[]):androidx.constraintlayout.solver.SolverVariable");
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x001c, code lost:
        r5.numGoals = r2 - 1;
        r6.inGoal = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:11:0x0022, code lost:
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:7:0x000c, code lost:
        r2 = r5.numGoals;
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x0010, code lost:
        if (r1 >= (r2 - 1)) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:9:0x0012, code lost:
        r2 = r5.arrayGoals;
        r3 = r1 + 1;
        r2[r1] = r2[r3];
        r1 = r3;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void removeGoal(androidx.constraintlayout.solver.SolverVariable r6) {
        /*
            r5 = this;
            r0 = 0
            r1 = r0
        L2:
            int r2 = r5.numGoals
            if (r1 >= r2) goto L26
            androidx.constraintlayout.solver.SolverVariable[] r2 = r5.arrayGoals
            r2 = r2[r1]
            if (r2 != r6) goto L23
        Lc:
            int r2 = r5.numGoals
            int r3 = r2 + (-1)
            if (r1 >= r3) goto L1c
            androidx.constraintlayout.solver.SolverVariable[] r2 = r5.arrayGoals
            int r3 = r1 + 1
            r4 = r2[r3]
            r2[r1] = r4
            r1 = r3
            goto Lc
        L1c:
            int r2 = r2 + (-1)
            r5.numGoals = r2
            r6.inGoal = r0
            return
        L23:
            int r1 = r1 + 1
            goto L2
        L26:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.constraintlayout.solver.OptimizedPriorityGoalRow.removeGoal(androidx.constraintlayout.solver.SolverVariable):void");
    }

    @Override // androidx.constraintlayout.solver.ArrayRow
    public String toString() {
        String str = " goal -> (" + this.constantValue + ") : ";
        for (int i = 0; i < this.numGoals; i++) {
            this.accessor.variable = this.arrayGoals[i];
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m(str);
            m.append(this.accessor);
            m.append(" ");
            str = m.toString();
        }
        return str;
    }

    @Override // androidx.constraintlayout.solver.ArrayRow
    public void updateFromRow(ArrayRow arrayRow, boolean z) {
        boolean z2;
        SolverVariable solverVariable = arrayRow.variable;
        if (solverVariable != null) {
            ArrayLinkedVariables arrayLinkedVariables = arrayRow.variables;
            int i = arrayLinkedVariables.mHead;
            int i2 = arrayLinkedVariables.currentSize;
            while (i != -1 && i2 > 0) {
                ArrayLinkedVariables arrayLinkedVariables2 = arrayRow.variables;
                int i3 = arrayLinkedVariables2.mArrayIndices[i];
                float f = arrayLinkedVariables2.mArrayValues[i];
                SolverVariable solverVariable2 = ((SolverVariable[]) this.mCache.mIndexedVariables)[i3];
                GoalVariableAccessor goalVariableAccessor = this.accessor;
                goalVariableAccessor.variable = solverVariable2;
                boolean z3 = true;
                if (solverVariable2.inGoal) {
                    for (int i4 = 0; i4 < 8; i4++) {
                        float[] fArr = goalVariableAccessor.variable.goalStrengthVector;
                        fArr[i4] = (solverVariable.goalStrengthVector[i4] * f) + fArr[i4];
                        if (Math.abs(fArr[i4]) < 1.0E-4f) {
                            goalVariableAccessor.variable.goalStrengthVector[i4] = 0.0f;
                        } else {
                            z3 = false;
                        }
                    }
                    if (z3) {
                        OptimizedPriorityGoalRow.this.removeGoal(goalVariableAccessor.variable);
                    }
                    z2 = false;
                } else {
                    for (int i5 = 0; i5 < 8; i5++) {
                        float f2 = solverVariable.goalStrengthVector[i5];
                        if (f2 != HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                            float f3 = f2 * f;
                            if (Math.abs(f3) < 1.0E-4f) {
                                f3 = 0.0f;
                            }
                            goalVariableAccessor.variable.goalStrengthVector[i5] = f3;
                        } else {
                            goalVariableAccessor.variable.goalStrengthVector[i5] = 0.0f;
                        }
                    }
                    z2 = true;
                }
                if (z2) {
                    addToGoal(solverVariable2);
                }
                this.constantValue = (arrayRow.constantValue * f) + this.constantValue;
                i = arrayRow.variables.mArrayNextIndices[i];
            }
            removeGoal(solverVariable);
        }
    }
}
