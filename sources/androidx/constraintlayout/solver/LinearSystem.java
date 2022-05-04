package androidx.constraintlayout.solver;

import androidx.constraintlayout.solver.SolverVariable;
import androidx.constraintlayout.solver.widgets.ConstraintAnchor;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import java.util.Arrays;
/* loaded from: classes.dex */
public final class LinearSystem {
    public static int POOL_SIZE = 1000;
    public final Cache mCache;
    public OptimizedPriorityGoalRow mGoal;
    public ArrayRow[] mRows;
    public final ArrayRow mTempGoal;
    public int mVariablesID = 0;
    public int TABLE_SIZE = 32;
    public int mMaxColumns = 32;
    public boolean newgraphOptimizer = false;
    public boolean[] mAlreadyTestedCandidates = new boolean[32];
    public int mNumColumns = 1;
    public int mNumRows = 0;
    public int mMaxRows = 32;
    public SolverVariable[] mPoolVariables = new SolverVariable[POOL_SIZE];
    public int mPoolVariablesCount = 0;

    /* loaded from: classes.dex */
    public interface Row {
        SolverVariable getPivotCandidate(boolean[] zArr);
    }

    public final void addEquality(SolverVariable solverVariable, SolverVariable solverVariable2, int i, int i2) {
        ArrayRow createRow = createRow();
        boolean z = false;
        if (i != 0) {
            if (i < 0) {
                i *= -1;
                z = true;
            }
            createRow.constantValue = i;
        }
        if (!z) {
            createRow.variables.put(solverVariable, -1.0f);
            createRow.variables.put(solverVariable2, 1.0f);
        } else {
            createRow.variables.put(solverVariable, 1.0f);
            createRow.variables.put(solverVariable2, -1.0f);
        }
        if (i2 != 7) {
            createRow.addError(this, i2);
        }
        addConstraint(createRow);
    }

    public final SolverVariable createObjectVariable(Object obj) {
        SolverVariable solverVariable = null;
        if (obj == null) {
            return null;
        }
        if (this.mNumColumns + 1 >= this.mMaxColumns) {
            increaseTableSize();
        }
        if (obj instanceof ConstraintAnchor) {
            ConstraintAnchor constraintAnchor = (ConstraintAnchor) obj;
            solverVariable = constraintAnchor.mSolverVariable;
            if (solverVariable == null) {
                constraintAnchor.resetSolverVariable();
                solverVariable = constraintAnchor.mSolverVariable;
            }
            int i = solverVariable.id;
            if (i == -1 || i > this.mVariablesID || this.mCache.mIndexedVariables[i] == null) {
                if (i != -1) {
                    solverVariable.reset();
                }
                int i2 = this.mVariablesID + 1;
                this.mVariablesID = i2;
                this.mNumColumns++;
                solverVariable.id = i2;
                solverVariable.mType = SolverVariable.Type.UNRESTRICTED;
                this.mCache.mIndexedVariables[i2] = solverVariable;
            }
        }
        return solverVariable;
    }

    public final void reset() {
        Cache cache;
        int i = 0;
        while (true) {
            cache = this.mCache;
            SolverVariable[] solverVariableArr = cache.mIndexedVariables;
            if (i >= solverVariableArr.length) {
                break;
            }
            SolverVariable solverVariable = solverVariableArr[i];
            if (solverVariable != null) {
                solverVariable.reset();
            }
            i++;
        }
        Pools$SimplePool pools$SimplePool = cache.solverVariablePool;
        SolverVariable[] solverVariableArr2 = this.mPoolVariables;
        int i2 = this.mPoolVariablesCount;
        pools$SimplePool.getClass();
        if (i2 > solverVariableArr2.length) {
            i2 = solverVariableArr2.length;
        }
        for (int i3 = 0; i3 < i2; i3++) {
            SolverVariable solverVariable2 = solverVariableArr2[i3];
            int i4 = pools$SimplePool.mPoolSize;
            Object[] objArr = pools$SimplePool.mPool;
            if (i4 < objArr.length) {
                objArr[i4] = solverVariable2;
                pools$SimplePool.mPoolSize = i4 + 1;
            }
        }
        this.mPoolVariablesCount = 0;
        Arrays.fill(this.mCache.mIndexedVariables, (Object) null);
        this.mVariablesID = 0;
        OptimizedPriorityGoalRow optimizedPriorityGoalRow = this.mGoal;
        optimizedPriorityGoalRow.numGoals = 0;
        optimizedPriorityGoalRow.constantValue = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        this.mNumColumns = 1;
        for (int i5 = 0; i5 < this.mNumRows; i5++) {
            this.mRows[i5].getClass();
        }
        int i6 = 0;
        while (true) {
            ArrayRow[] arrayRowArr = this.mRows;
            if (i6 < arrayRowArr.length) {
                ArrayRow arrayRow = arrayRowArr[i6];
                if (arrayRow != null) {
                    Pools$SimplePool pools$SimplePool2 = this.mCache.arrayRowPool;
                    int i7 = pools$SimplePool2.mPoolSize;
                    Object[] objArr2 = pools$SimplePool2.mPool;
                    if (i7 < objArr2.length) {
                        objArr2[i7] = arrayRow;
                        pools$SimplePool2.mPoolSize = i7 + 1;
                    }
                }
                arrayRowArr[i6] = null;
                i6++;
            } else {
                this.mNumRows = 0;
                return;
            }
        }
    }

    public static int getObjectVariableValue(ConstraintAnchor constraintAnchor) {
        SolverVariable solverVariable = constraintAnchor.mSolverVariable;
        if (solverVariable != null) {
            return (int) (solverVariable.computedValue + 0.5f);
        }
        return 0;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v0, types: [java.lang.Object[]] */
    /* JADX WARN: Type inference failed for: r4v0 */
    public final SolverVariable acquireSolverVariable(SolverVariable.Type type) {
        Pools$SimplePool pools$SimplePool = this.mCache.solverVariablePool;
        int i = pools$SimplePool.mPoolSize;
        SolverVariable solverVariable = null;
        if (i > 0) {
            int i2 = i - 1;
            ?? r3 = pools$SimplePool.mPool;
            ?? r4 = r3[i2];
            r3[i2] = 0;
            pools$SimplePool.mPoolSize = i2;
            solverVariable = r4;
        }
        SolverVariable solverVariable2 = solverVariable;
        if (solverVariable2 == null) {
            solverVariable2 = new SolverVariable(type);
            solverVariable2.mType = type;
        } else {
            solverVariable2.reset();
            solverVariable2.mType = type;
        }
        int i3 = this.mPoolVariablesCount;
        int i4 = POOL_SIZE;
        if (i3 >= i4) {
            int i5 = i4 * 2;
            POOL_SIZE = i5;
            this.mPoolVariables = (SolverVariable[]) Arrays.copyOf(this.mPoolVariables, i5);
        }
        SolverVariable[] solverVariableArr = this.mPoolVariables;
        int i6 = this.mPoolVariablesCount;
        this.mPoolVariablesCount = i6 + 1;
        solverVariableArr[i6] = solverVariable2;
        return solverVariable2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:69:0x0123, code lost:
        if (r4.usageInRowCount <= 1) goto L74;
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x012d, code lost:
        if (r4.usageInRowCount <= 1) goto L74;
     */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x012f, code lost:
        r18 = r9;
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x0132, code lost:
        r18 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:90:0x0152, code lost:
        if (r4.usageInRowCount <= 1) goto L95;
     */
    /* JADX WARN: Code restructure failed: missing block: B:94:0x015c, code lost:
        if (r4.usageInRowCount <= 1) goto L95;
     */
    /* JADX WARN: Code restructure failed: missing block: B:95:0x015e, code lost:
        r18 = r9;
     */
    /* JADX WARN: Code restructure failed: missing block: B:96:0x0161, code lost:
        r18 = false;
     */
    /* JADX WARN: Removed duplicated region for block: B:174:0x0176 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:65:0x011a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void addConstraint(androidx.constraintlayout.solver.ArrayRow r20) {
        /*
            Method dump skipped, instructions count: 583
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.constraintlayout.solver.LinearSystem.addConstraint(androidx.constraintlayout.solver.ArrayRow):void");
    }

    public final void addRow(ArrayRow arrayRow) {
        ArrayRow[] arrayRowArr = this.mRows;
        int i = this.mNumRows;
        ArrayRow arrayRow2 = arrayRowArr[i];
        if (arrayRow2 != null) {
            Pools$SimplePool pools$SimplePool = this.mCache.arrayRowPool;
            int i2 = pools$SimplePool.mPoolSize;
            Object[] objArr = pools$SimplePool.mPool;
            if (i2 < objArr.length) {
                objArr[i2] = arrayRow2;
                pools$SimplePool.mPoolSize = i2 + 1;
            }
        }
        arrayRowArr[i] = arrayRow;
        SolverVariable solverVariable = arrayRow.variable;
        solverVariable.definitionId = i;
        this.mNumRows = i + 1;
        solverVariable.updateReferencesWithNewDefinition(arrayRow);
    }

    public final SolverVariable createErrorVariable(int i) {
        if (this.mNumColumns + 1 >= this.mMaxColumns) {
            increaseTableSize();
        }
        SolverVariable acquireSolverVariable = acquireSolverVariable(SolverVariable.Type.ERROR);
        int i2 = this.mVariablesID + 1;
        this.mVariablesID = i2;
        this.mNumColumns++;
        acquireSolverVariable.id = i2;
        acquireSolverVariable.strength = i;
        this.mCache.mIndexedVariables[i2] = acquireSolverVariable;
        OptimizedPriorityGoalRow optimizedPriorityGoalRow = this.mGoal;
        optimizedPriorityGoalRow.accessor.variable = acquireSolverVariable;
        Arrays.fill(acquireSolverVariable.goalStrengthVector, (float) HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        acquireSolverVariable.goalStrengthVector[acquireSolverVariable.strength] = 1.0f;
        optimizedPriorityGoalRow.addToGoal(acquireSolverVariable);
        return acquireSolverVariable;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v0, types: [java.lang.Object[]] */
    /* JADX WARN: Type inference failed for: r4v4 */
    public final ArrayRow createRow() {
        ArrayRow arrayRow;
        Cache cache = this.mCache;
        Pools$SimplePool pools$SimplePool = cache.arrayRowPool;
        int i = pools$SimplePool.mPoolSize;
        if (i > 0) {
            int i2 = i - 1;
            ?? r3 = pools$SimplePool.mPool;
            ?? r4 = r3[i2];
            r3[i2] = 0;
            pools$SimplePool.mPoolSize = i2;
            arrayRow = r4;
        } else {
            arrayRow = null;
        }
        ArrayRow arrayRow2 = arrayRow;
        if (arrayRow2 == null) {
            return new ArrayRow(cache);
        }
        arrayRow2.variable = null;
        arrayRow2.variables.clear();
        arrayRow2.constantValue = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        arrayRow2.isSimpleDefinition = false;
        return arrayRow2;
    }

    public final SolverVariable createSlackVariable() {
        if (this.mNumColumns + 1 >= this.mMaxColumns) {
            increaseTableSize();
        }
        SolverVariable acquireSolverVariable = acquireSolverVariable(SolverVariable.Type.SLACK);
        int i = this.mVariablesID + 1;
        this.mVariablesID = i;
        this.mNumColumns++;
        acquireSolverVariable.id = i;
        this.mCache.mIndexedVariables[i] = acquireSolverVariable;
        return acquireSolverVariable;
    }

    public final void increaseTableSize() {
        int i = this.TABLE_SIZE * 2;
        this.TABLE_SIZE = i;
        this.mRows = (ArrayRow[]) Arrays.copyOf(this.mRows, i);
        Cache cache = this.mCache;
        cache.mIndexedVariables = (SolverVariable[]) Arrays.copyOf(cache.mIndexedVariables, this.TABLE_SIZE);
        int i2 = this.TABLE_SIZE;
        this.mAlreadyTestedCandidates = new boolean[i2];
        this.mMaxColumns = i2;
        this.mMaxRows = i2;
    }

    public final void minimizeGoal(OptimizedPriorityGoalRow optimizedPriorityGoalRow) throws Exception {
        float f;
        int i;
        boolean z;
        SolverVariable.Type type = SolverVariable.Type.UNRESTRICTED;
        int i2 = 0;
        while (true) {
            int i3 = this.mNumRows;
            f = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            i = 1;
            if (i2 >= i3) {
                z = false;
                break;
            }
            ArrayRow arrayRow = this.mRows[i2];
            if (arrayRow.variable.mType != type && arrayRow.constantValue < HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                z = true;
                break;
            }
            i2++;
        }
        if (z) {
            boolean z2 = false;
            int i4 = 0;
            while (!z2) {
                i4 += i;
                float f2 = Float.MAX_VALUE;
                int i5 = -1;
                int i6 = -1;
                int i7 = 0;
                int i8 = 0;
                while (i7 < this.mNumRows) {
                    ArrayRow arrayRow2 = this.mRows[i7];
                    if (arrayRow2.variable.mType != type && !arrayRow2.isSimpleDefinition && arrayRow2.constantValue < f) {
                        int i9 = i;
                        while (i9 < this.mNumColumns) {
                            SolverVariable solverVariable = this.mCache.mIndexedVariables[i9];
                            float f3 = arrayRow2.variables.get(solverVariable);
                            if (f3 > f) {
                                for (int i10 = 0; i10 < 8; i10++) {
                                    float f4 = solverVariable.strengthVector[i10] / f3;
                                    if ((f4 < f2 && i10 == i8) || i10 > i8) {
                                        i8 = i10;
                                        f2 = f4;
                                        i5 = i7;
                                        i6 = i9;
                                    }
                                }
                            }
                            i9++;
                            f = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
                        }
                    }
                    i7++;
                    f = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
                    i = 1;
                }
                if (i5 != -1) {
                    ArrayRow arrayRow3 = this.mRows[i5];
                    arrayRow3.variable.definitionId = -1;
                    arrayRow3.pivot(this.mCache.mIndexedVariables[i6]);
                    SolverVariable solverVariable2 = arrayRow3.variable;
                    solverVariable2.definitionId = i5;
                    solverVariable2.updateReferencesWithNewDefinition(arrayRow3);
                } else {
                    z2 = true;
                }
                if (i4 > this.mNumColumns / 2) {
                    z2 = true;
                }
                f = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
                i = 1;
            }
        }
        optimize(optimizedPriorityGoalRow);
        for (int i11 = 0; i11 < this.mNumRows; i11++) {
            ArrayRow arrayRow4 = this.mRows[i11];
            arrayRow4.variable.computedValue = arrayRow4.constantValue;
        }
    }

    public final void optimize(ArrayRow arrayRow) {
        boolean z;
        int i = 0;
        for (int i2 = 0; i2 < this.mNumColumns; i2++) {
            this.mAlreadyTestedCandidates[i2] = false;
        }
        boolean z2 = false;
        int i3 = 0;
        while (!z2) {
            i3++;
            if (i3 < this.mNumColumns * 2) {
                SolverVariable solverVariable = arrayRow.variable;
                if (solverVariable != null) {
                    this.mAlreadyTestedCandidates[solverVariable.id] = true;
                }
                SolverVariable pivotCandidate = arrayRow.getPivotCandidate(this.mAlreadyTestedCandidates);
                if (pivotCandidate != null) {
                    boolean[] zArr = this.mAlreadyTestedCandidates;
                    int i4 = pivotCandidate.id;
                    if (!zArr[i4]) {
                        zArr[i4] = true;
                    } else {
                        return;
                    }
                }
                if (pivotCandidate != null) {
                    float f = Float.MAX_VALUE;
                    int i5 = i;
                    int i6 = -1;
                    while (i5 < this.mNumRows) {
                        ArrayRow arrayRow2 = this.mRows[i5];
                        if (arrayRow2.variable.mType != SolverVariable.Type.UNRESTRICTED && !arrayRow2.isSimpleDefinition) {
                            ArrayLinkedVariables arrayLinkedVariables = arrayRow2.variables;
                            int i7 = arrayLinkedVariables.mHead;
                            if (i7 != -1) {
                                for (int i8 = i; i7 != -1 && i8 < arrayLinkedVariables.currentSize; i8++) {
                                    if (arrayLinkedVariables.mArrayIndices[i7] == pivotCandidate.id) {
                                        z = true;
                                        break;
                                    } else {
                                        i7 = arrayLinkedVariables.mArrayNextIndices[i7];
                                    }
                                }
                            }
                            z = false;
                            if (z) {
                                float f2 = arrayRow2.variables.get(pivotCandidate);
                                if (f2 < HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                                    float f3 = (-arrayRow2.constantValue) / f2;
                                    if (f3 < f) {
                                        i6 = i5;
                                        f = f3;
                                    }
                                }
                            }
                        }
                        i5++;
                        i = 0;
                    }
                    if (i6 > -1) {
                        ArrayRow arrayRow3 = this.mRows[i6];
                        arrayRow3.variable.definitionId = -1;
                        arrayRow3.pivot(pivotCandidate);
                        SolverVariable solverVariable2 = arrayRow3.variable;
                        solverVariable2.definitionId = i6;
                        solverVariable2.updateReferencesWithNewDefinition(arrayRow3);
                    }
                } else {
                    z2 = true;
                }
                i = 0;
            } else {
                return;
            }
        }
    }

    public LinearSystem() {
        int i = 0;
        this.mRows = null;
        this.mRows = new ArrayRow[32];
        while (true) {
            ArrayRow[] arrayRowArr = this.mRows;
            if (i < arrayRowArr.length) {
                ArrayRow arrayRow = arrayRowArr[i];
                if (arrayRow != null) {
                    Pools$SimplePool pools$SimplePool = this.mCache.arrayRowPool;
                    int i2 = pools$SimplePool.mPoolSize;
                    Object[] objArr = pools$SimplePool.mPool;
                    if (i2 < objArr.length) {
                        objArr[i2] = arrayRow;
                        pools$SimplePool.mPoolSize = i2 + 1;
                    }
                }
                arrayRowArr[i] = null;
                i++;
            } else {
                Cache cache = new Cache();
                this.mCache = cache;
                this.mGoal = new OptimizedPriorityGoalRow(cache);
                this.mTempGoal = new ArrayRow(cache);
                return;
            }
        }
    }

    public final void addCentering(SolverVariable solverVariable, SolverVariable solverVariable2, int i, float f, SolverVariable solverVariable3, SolverVariable solverVariable4, int i2, int i3) {
        ArrayRow createRow = createRow();
        if (solverVariable2 == solverVariable3) {
            createRow.variables.put(solverVariable, 1.0f);
            createRow.variables.put(solverVariable4, 1.0f);
            createRow.variables.put(solverVariable2, -2.0f);
        } else if (f == 0.5f) {
            createRow.variables.put(solverVariable, 1.0f);
            createRow.variables.put(solverVariable2, -1.0f);
            createRow.variables.put(solverVariable3, -1.0f);
            createRow.variables.put(solverVariable4, 1.0f);
            if (i > 0 || i2 > 0) {
                createRow.constantValue = (-i) + i2;
            }
        } else if (f <= HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
            createRow.variables.put(solverVariable, -1.0f);
            createRow.variables.put(solverVariable2, 1.0f);
            createRow.constantValue = i;
        } else if (f >= 1.0f) {
            createRow.variables.put(solverVariable4, -1.0f);
            createRow.variables.put(solverVariable3, 1.0f);
            createRow.constantValue = -i2;
        } else {
            float f2 = 1.0f - f;
            createRow.variables.put(solverVariable, f2 * 1.0f);
            createRow.variables.put(solverVariable2, f2 * (-1.0f));
            createRow.variables.put(solverVariable3, (-1.0f) * f);
            createRow.variables.put(solverVariable4, 1.0f * f);
            if (i > 0 || i2 > 0) {
                createRow.constantValue = (i2 * f) + ((-i) * f2);
            }
        }
        if (i3 != 7) {
            createRow.addError(this, i3);
        }
        addConstraint(createRow);
    }

    public final void addGreaterThan(SolverVariable solverVariable, SolverVariable solverVariable2, int i, int i2) {
        ArrayRow createRow = createRow();
        SolverVariable createSlackVariable = createSlackVariable();
        createSlackVariable.strength = 0;
        createRow.createRowGreaterThan(solverVariable, solverVariable2, createSlackVariable, i);
        if (i2 != 7) {
            createRow.variables.put(createErrorVariable(i2), (int) (createRow.variables.get(createSlackVariable) * (-1.0f)));
        }
        addConstraint(createRow);
    }

    public final void addLowerThan(SolverVariable solverVariable, SolverVariable solverVariable2, int i, int i2) {
        ArrayRow createRow = createRow();
        SolverVariable createSlackVariable = createSlackVariable();
        createSlackVariable.strength = 0;
        createRow.createRowLowerThan(solverVariable, solverVariable2, createSlackVariable, i);
        if (i2 != 7) {
            createRow.variables.put(createErrorVariable(i2), (int) (createRow.variables.get(createSlackVariable) * (-1.0f)));
        }
        addConstraint(createRow);
    }

    public final void addEquality(SolverVariable solverVariable, int i) {
        int i2 = solverVariable.definitionId;
        if (i2 != -1) {
            ArrayRow arrayRow = this.mRows[i2];
            if (arrayRow.isSimpleDefinition) {
                arrayRow.constantValue = i;
            } else if (arrayRow.variables.currentSize == 0) {
                arrayRow.isSimpleDefinition = true;
                arrayRow.constantValue = i;
            } else {
                ArrayRow createRow = createRow();
                if (i < 0) {
                    createRow.constantValue = i * (-1);
                    createRow.variables.put(solverVariable, 1.0f);
                } else {
                    createRow.constantValue = i;
                    createRow.variables.put(solverVariable, -1.0f);
                }
                addConstraint(createRow);
            }
        } else {
            ArrayRow createRow2 = createRow();
            createRow2.variable = solverVariable;
            float f = i;
            solverVariable.computedValue = f;
            createRow2.constantValue = f;
            createRow2.isSimpleDefinition = true;
            addConstraint(createRow2);
        }
    }
}
