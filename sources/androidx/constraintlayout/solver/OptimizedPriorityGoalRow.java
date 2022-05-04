package androidx.constraintlayout.solver;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import java.util.Arrays;
import java.util.Comparator;
/* loaded from: classes.dex */
public final class OptimizedPriorityGoalRow extends ArrayRow {
    public Cache mCache;
    public SolverVariable[] arrayGoals = new SolverVariable[128];
    public SolverVariable[] sortArray = new SolverVariable[128];
    public int numGoals = 0;
    public GoalVariableAccessor accessor = new GoalVariableAccessor();

    /* loaded from: classes.dex */
    public class GoalVariableAccessor implements Comparable {
        public SolverVariable variable;

        public GoalVariableAccessor() {
        }

        @Override // java.lang.Comparable
        public final int compareTo(Object obj) {
            return this.variable.id - ((SolverVariable) obj).id;
        }

        public final String toString() {
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

    /* JADX WARN: Code restructure failed: missing block: B:23:0x004c, code lost:
        if (r9 < r8) goto L25;
     */
    @Override // androidx.constraintlayout.solver.ArrayRow, androidx.constraintlayout.solver.LinearSystem.Row
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final androidx.constraintlayout.solver.SolverVariable getPivotCandidate(boolean[] r12) {
        /*
            r11 = this;
            r0 = -1
            r1 = 0
            r3 = r0
            r2 = r1
        L4:
            int r4 = r11.numGoals
            if (r2 >= r4) goto L56
            androidx.constraintlayout.solver.SolverVariable[] r4 = r11.arrayGoals
            r5 = r4[r2]
            int r6 = r5.id
            boolean r6 = r12[r6]
            if (r6 == 0) goto L13
            goto L53
        L13:
            androidx.constraintlayout.solver.OptimizedPriorityGoalRow$GoalVariableAccessor r6 = r11.accessor
            r6.variable = r5
            r5 = 7
            r7 = 1
            if (r3 != r0) goto L35
        L1b:
            if (r5 < 0) goto L31
            androidx.constraintlayout.solver.SolverVariable r4 = r6.variable
            float[] r4 = r4.goalStrengthVector
            r4 = r4[r5]
            r8 = 0
            int r9 = (r4 > r8 ? 1 : (r4 == r8 ? 0 : -1))
            if (r9 <= 0) goto L29
            goto L31
        L29:
            int r4 = (r4 > r8 ? 1 : (r4 == r8 ? 0 : -1))
            if (r4 >= 0) goto L2e
            goto L32
        L2e:
            int r5 = r5 + (-1)
            goto L1b
        L31:
            r7 = r1
        L32:
            if (r7 == 0) goto L53
            goto L52
        L35:
            r4 = r4[r3]
        L37:
            if (r5 < 0) goto L4f
            float[] r8 = r4.goalStrengthVector
            r8 = r8[r5]
            androidx.constraintlayout.solver.SolverVariable r9 = r6.variable
            float[] r9 = r9.goalStrengthVector
            r9 = r9[r5]
            int r10 = (r9 > r8 ? 1 : (r9 == r8 ? 0 : -1))
            if (r10 != 0) goto L4a
            int r5 = r5 + (-1)
            goto L37
        L4a:
            int r4 = (r9 > r8 ? 1 : (r9 == r8 ? 0 : -1))
            if (r4 >= 0) goto L4f
            goto L50
        L4f:
            r7 = r1
        L50:
            if (r7 == 0) goto L53
        L52:
            r3 = r2
        L53:
            int r2 = r2 + 1
            goto L4
        L56:
            if (r3 != r0) goto L5a
            r11 = 0
            return r11
        L5a:
            androidx.constraintlayout.solver.SolverVariable[] r11 = r11.arrayGoals
            r11 = r11[r3]
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.constraintlayout.solver.OptimizedPriorityGoalRow.getPivotCandidate(boolean[]):androidx.constraintlayout.solver.SolverVariable");
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
            Arrays.sort(this.sortArray, 0, i, new Comparator<SolverVariable>() { // from class: androidx.constraintlayout.solver.OptimizedPriorityGoalRow.1
                @Override // java.util.Comparator
                public final int compare(SolverVariable solverVariable2, SolverVariable solverVariable3) {
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

    @Override // androidx.constraintlayout.solver.ArrayRow
    public final String toString() {
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
    public final void updateFromRow(ArrayRow arrayRow) {
        SolverVariable solverVariable = arrayRow.variable;
        if (solverVariable != null) {
            ArrayLinkedVariables arrayLinkedVariables = arrayRow.variables;
            int i = arrayLinkedVariables.mHead;
            int i2 = arrayLinkedVariables.currentSize;
            while (i != -1 && i2 > 0) {
                ArrayLinkedVariables arrayLinkedVariables2 = arrayRow.variables;
                int i3 = arrayLinkedVariables2.mArrayIndices[i];
                float f = arrayLinkedVariables2.mArrayValues[i];
                SolverVariable solverVariable2 = this.mCache.mIndexedVariables[i3];
                GoalVariableAccessor goalVariableAccessor = this.accessor;
                goalVariableAccessor.variable = solverVariable2;
                boolean z = true;
                if (solverVariable2.inGoal) {
                    for (int i4 = 0; i4 < 8; i4++) {
                        float[] fArr = goalVariableAccessor.variable.goalStrengthVector;
                        float f2 = (solverVariable.goalStrengthVector[i4] * f) + fArr[i4];
                        fArr[i4] = f2;
                        if (Math.abs(f2) < 1.0E-4f) {
                            goalVariableAccessor.variable.goalStrengthVector[i4] = 0.0f;
                        } else {
                            z = false;
                        }
                    }
                    if (z) {
                        OptimizedPriorityGoalRow.this.removeGoal(goalVariableAccessor.variable);
                    }
                    z = false;
                } else {
                    for (int i5 = 0; i5 < 8; i5++) {
                        float f3 = solverVariable.goalStrengthVector[i5];
                        if (f3 != HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                            float f4 = f3 * f;
                            if (Math.abs(f4) < 1.0E-4f) {
                                f4 = 0.0f;
                            }
                            goalVariableAccessor.variable.goalStrengthVector[i5] = f4;
                        } else {
                            goalVariableAccessor.variable.goalStrengthVector[i5] = 0.0f;
                        }
                    }
                }
                if (z) {
                    addToGoal(solverVariable2);
                }
                this.constantValue = (arrayRow.constantValue * f) + this.constantValue;
                i = arrayRow.variables.mArrayNextIndices[i];
            }
            removeGoal(solverVariable);
        }
    }

    public OptimizedPriorityGoalRow(Cache cache) {
        super(cache);
        this.mCache = cache;
    }
}
