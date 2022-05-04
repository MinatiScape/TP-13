package com.google.android.material.shape;

import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RadialGradient;
import android.graphics.RectF;
import android.graphics.Region;
import android.graphics.Shader;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.google.android.material.shadow.ShadowRenderer;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final class ShapePath {
    @Deprecated
    public float currentShadowAngle;
    @Deprecated
    public float endShadowAngle;
    @Deprecated
    public float endX;
    @Deprecated
    public float endY;
    public final ArrayList operations = new ArrayList();
    public final ArrayList shadowCompatOperations = new ArrayList();
    @Deprecated
    public float startX;
    @Deprecated
    public float startY;

    /* loaded from: classes.dex */
    public static class ArcShadowOperation extends ShadowCompatOperation {
        public final PathArcOperation operation;

        @Override // com.google.android.material.shape.ShapePath.ShadowCompatOperation
        public final void draw(Matrix matrix, ShadowRenderer shadowRenderer, int i, Canvas canvas) {
            boolean z;
            PathArcOperation pathArcOperation = this.operation;
            float f = pathArcOperation.startAngle;
            float f2 = pathArcOperation.sweepAngle;
            PathArcOperation pathArcOperation2 = this.operation;
            RectF rectF = new RectF(pathArcOperation2.left, pathArcOperation2.top, pathArcOperation2.right, pathArcOperation2.bottom);
            if (f2 < HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                z = true;
            } else {
                z = false;
            }
            Path path = shadowRenderer.scratch;
            if (z) {
                int[] iArr = ShadowRenderer.cornerColors;
                iArr[0] = 0;
                iArr[1] = shadowRenderer.shadowEndColor;
                iArr[2] = shadowRenderer.shadowMiddleColor;
                iArr[3] = shadowRenderer.shadowStartColor;
            } else {
                path.rewind();
                path.moveTo(rectF.centerX(), rectF.centerY());
                path.arcTo(rectF, f, f2);
                path.close();
                float f3 = -i;
                rectF.inset(f3, f3);
                int[] iArr2 = ShadowRenderer.cornerColors;
                iArr2[0] = 0;
                iArr2[1] = shadowRenderer.shadowStartColor;
                iArr2[2] = shadowRenderer.shadowMiddleColor;
                iArr2[3] = shadowRenderer.shadowEndColor;
            }
            float width = rectF.width() / 2.0f;
            if (width > HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                float f4 = 1.0f - (i / width);
                float[] fArr = ShadowRenderer.cornerPositions;
                fArr[1] = f4;
                fArr[2] = ((1.0f - f4) / 2.0f) + f4;
                shadowRenderer.cornerShadowPaint.setShader(new RadialGradient(rectF.centerX(), rectF.centerY(), width, ShadowRenderer.cornerColors, fArr, Shader.TileMode.CLAMP));
                canvas.save();
                canvas.concat(matrix);
                canvas.scale(1.0f, rectF.height() / rectF.width());
                if (!z) {
                    canvas.clipPath(path, Region.Op.DIFFERENCE);
                    canvas.drawPath(path, shadowRenderer.transparentPaint);
                }
                canvas.drawArc(rectF, f, f2, true, shadowRenderer.cornerShadowPaint);
                canvas.restore();
            }
        }

        public ArcShadowOperation(PathArcOperation pathArcOperation) {
            this.operation = pathArcOperation;
        }
    }

    /* loaded from: classes.dex */
    public static class LineShadowOperation extends ShadowCompatOperation {
        public final PathLineOperation operation;
        public final float startX;
        public final float startY;

        @Override // com.google.android.material.shape.ShapePath.ShadowCompatOperation
        public final void draw(Matrix matrix, ShadowRenderer shadowRenderer, int i, Canvas canvas) {
            PathLineOperation pathLineOperation = this.operation;
            RectF rectF = new RectF(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, (float) Math.hypot(pathLineOperation.y - this.startY, pathLineOperation.x - this.startX), HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            Matrix matrix2 = new Matrix(matrix);
            matrix2.preTranslate(this.startX, this.startY);
            matrix2.preRotate(getAngle());
            shadowRenderer.getClass();
            rectF.bottom += i;
            rectF.offset(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, -i);
            int[] iArr = ShadowRenderer.edgeColors;
            iArr[0] = shadowRenderer.shadowEndColor;
            iArr[1] = shadowRenderer.shadowMiddleColor;
            iArr[2] = shadowRenderer.shadowStartColor;
            Paint paint = shadowRenderer.edgeShadowPaint;
            float f = rectF.left;
            paint.setShader(new LinearGradient(f, rectF.top, f, rectF.bottom, iArr, ShadowRenderer.edgePositions, Shader.TileMode.CLAMP));
            canvas.save();
            canvas.concat(matrix2);
            canvas.drawRect(rectF, shadowRenderer.edgeShadowPaint);
            canvas.restore();
        }

        public final float getAngle() {
            PathLineOperation pathLineOperation = this.operation;
            return (float) Math.toDegrees(Math.atan((pathLineOperation.y - this.startY) / (pathLineOperation.x - this.startX)));
        }

        public LineShadowOperation(PathLineOperation pathLineOperation, float f, float f2) {
            this.operation = pathLineOperation;
            this.startX = f;
            this.startY = f2;
        }
    }

    /* loaded from: classes.dex */
    public static class PathArcOperation extends PathOperation {
        public static final RectF rectF = new RectF();
        @Deprecated
        public float bottom;
        @Deprecated
        public float left;
        @Deprecated
        public float right;
        @Deprecated
        public float startAngle;
        @Deprecated
        public float sweepAngle;
        @Deprecated
        public float top;

        @Override // com.google.android.material.shape.ShapePath.PathOperation
        public final void applyToPath(Matrix matrix, Path path) {
            Matrix matrix2 = this.matrix;
            matrix.invert(matrix2);
            path.transform(matrix2);
            RectF rectF2 = rectF;
            rectF2.set(this.left, this.top, this.right, this.bottom);
            path.arcTo(rectF2, this.startAngle, this.sweepAngle, false);
            path.transform(matrix);
        }

        public PathArcOperation(float f, float f2, float f3, float f4) {
            this.left = f;
            this.top = f2;
            this.right = f3;
            this.bottom = f4;
        }
    }

    /* loaded from: classes.dex */
    public static class PathLineOperation extends PathOperation {
        public float x;
        public float y;

        @Override // com.google.android.material.shape.ShapePath.PathOperation
        public final void applyToPath(Matrix matrix, Path path) {
            Matrix matrix2 = this.matrix;
            matrix.invert(matrix2);
            path.transform(matrix2);
            path.lineTo(this.x, this.y);
            path.transform(matrix);
        }
    }

    /* loaded from: classes.dex */
    public static abstract class PathOperation {
        public final Matrix matrix = new Matrix();

        public abstract void applyToPath(Matrix matrix, Path path);
    }

    /* loaded from: classes.dex */
    public static abstract class ShadowCompatOperation {
        public static final Matrix IDENTITY_MATRIX = new Matrix();

        public abstract void draw(Matrix matrix, ShadowRenderer shadowRenderer, int i, Canvas canvas);
    }

    public final void reset(float f, float f2, float f3) {
        this.startX = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        this.startY = f;
        this.endX = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        this.endY = f;
        this.currentShadowAngle = f2;
        this.endShadowAngle = (f2 + f3) % 360.0f;
        this.operations.clear();
        this.shadowCompatOperations.clear();
    }

    public final void addArc(float f, float f2, float f3, float f4, float f5, float f6) {
        boolean z;
        float f7;
        PathArcOperation pathArcOperation = new PathArcOperation(f, f2, f3, f4);
        pathArcOperation.startAngle = f5;
        pathArcOperation.sweepAngle = f6;
        this.operations.add(pathArcOperation);
        ArcShadowOperation arcShadowOperation = new ArcShadowOperation(pathArcOperation);
        float f8 = f5 + f6;
        if (f6 < HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            f5 = (f5 + 180.0f) % 360.0f;
        }
        if (z) {
            f7 = (180.0f + f8) % 360.0f;
        } else {
            f7 = f8;
        }
        addConnectingShadowIfNecessary(f5);
        this.shadowCompatOperations.add(arcShadowOperation);
        this.currentShadowAngle = f7;
        double d = f8;
        this.endX = (((f3 - f) / 2.0f) * ((float) Math.cos(Math.toRadians(d)))) + ((f + f3) * 0.5f);
        this.endY = (((f4 - f2) / 2.0f) * ((float) Math.sin(Math.toRadians(d)))) + ((f2 + f4) * 0.5f);
    }

    public final void addConnectingShadowIfNecessary(float f) {
        float f2 = this.currentShadowAngle;
        if (f2 != f) {
            float f3 = ((f - f2) + 360.0f) % 360.0f;
            if (f3 <= 180.0f) {
                float f4 = this.endX;
                float f5 = this.endY;
                PathArcOperation pathArcOperation = new PathArcOperation(f4, f5, f4, f5);
                pathArcOperation.startAngle = this.currentShadowAngle;
                pathArcOperation.sweepAngle = f3;
                this.shadowCompatOperations.add(new ArcShadowOperation(pathArcOperation));
                this.currentShadowAngle = f;
            }
        }
    }

    public final void applyToPath(Matrix matrix, Path path) {
        int size = this.operations.size();
        for (int i = 0; i < size; i++) {
            ((PathOperation) this.operations.get(i)).applyToPath(matrix, path);
        }
    }

    public final void lineTo(float f, float f2) {
        PathLineOperation pathLineOperation = new PathLineOperation();
        pathLineOperation.x = f;
        pathLineOperation.y = f2;
        this.operations.add(pathLineOperation);
        LineShadowOperation lineShadowOperation = new LineShadowOperation(pathLineOperation, this.endX, this.endY);
        addConnectingShadowIfNecessary(lineShadowOperation.getAngle() + 270.0f);
        this.shadowCompatOperations.add(lineShadowOperation);
        this.currentShadowAngle = lineShadowOperation.getAngle() + 270.0f;
        this.endX = f;
        this.endY = f2;
    }

    public ShapePath() {
        reset(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 270.0f, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
    }
}
