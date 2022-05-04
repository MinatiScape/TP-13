package com.android.systemui.shared.pip;

import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.view.Choreographer;
import android.view.SurfaceControl;
import android.window.PictureInPictureSurfaceTransaction;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
/* loaded from: classes.dex */
public class PipSurfaceTransactionHelper {
    private final int mCornerRadius;
    private final Matrix mTmpTransform = new Matrix();
    private final float[] mTmpFloat9 = new float[9];
    private final RectF mTmpSourceRectF = new RectF();
    private final RectF mTmpDestinationRectF = new RectF();
    private final Rect mTmpDestinationRect = new Rect();

    public PictureInPictureSurfaceTransaction scale(SurfaceControl.Transaction transaction, SurfaceControl surfaceControl, Rect rect, Rect rect2) {
        float f = rect2.left;
        float f2 = rect2.top;
        this.mTmpSourceRectF.set(rect);
        this.mTmpDestinationRectF.set(rect2);
        this.mTmpDestinationRectF.offsetTo(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        this.mTmpTransform.setRectToRect(this.mTmpSourceRectF, this.mTmpDestinationRectF, Matrix.ScaleToFit.FILL);
        float scaledCornerRadius = getScaledCornerRadius(rect, rect2);
        transaction.setMatrix(surfaceControl, this.mTmpTransform, this.mTmpFloat9).setPosition(surfaceControl, f, f2).setCornerRadius(surfaceControl, scaledCornerRadius);
        return newPipSurfaceTransaction(f, f2, this.mTmpFloat9, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, scaledCornerRadius, rect);
    }

    public PictureInPictureSurfaceTransaction scaleAndRotate(SurfaceControl.Transaction transaction, SurfaceControl surfaceControl, Rect rect, Rect rect2, Rect rect3, float f, float f2, float f3) {
        float f4;
        int i;
        float f5;
        float f6;
        this.mTmpSourceRectF.set(rect);
        this.mTmpDestinationRect.set(rect);
        this.mTmpDestinationRect.inset(rect3);
        if (rect.width() <= rect.height()) {
            f4 = rect2.width();
            i = rect.width();
        } else {
            f4 = rect2.height();
            i = rect.height();
        }
        float f7 = f4 / i;
        this.mTmpTransform.setRotate(f, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        this.mTmpTransform.postScale(f7, f7);
        float scaledCornerRadius = getScaledCornerRadius(this.mTmpDestinationRect, rect2);
        if (f < HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
            f5 = (rect3.top * f7) + f2;
            f6 = (rect3.left * f7) + f3;
        } else {
            f5 = f2 - (rect3.top * f7);
            f6 = f3 - (rect3.left * f7);
        }
        transaction.setMatrix(surfaceControl, this.mTmpTransform, this.mTmpFloat9).setWindowCrop(surfaceControl, this.mTmpDestinationRect).setPosition(surfaceControl, f5, f6).setCornerRadius(surfaceControl, scaledCornerRadius);
        return newPipSurfaceTransaction(f5, f6, this.mTmpFloat9, f, scaledCornerRadius, this.mTmpDestinationRect);
    }

    private static PictureInPictureSurfaceTransaction newPipSurfaceTransaction(float f, float f2, float[] fArr, float f3, float f4, Rect rect) {
        return new PictureInPictureSurfaceTransaction.Builder().setPosition(f, f2).setTransform(fArr, f3).setCornerRadius(f4).setWindowCrop(rect).build();
    }

    public static SurfaceControl.Transaction newSurfaceControlTransaction() {
        SurfaceControl.Transaction transaction = new SurfaceControl.Transaction();
        transaction.setFrameTimelineVsync(Choreographer.getSfInstance().getVsyncId());
        return transaction;
    }

    public PictureInPictureSurfaceTransaction scaleAndCrop(SurfaceControl.Transaction transaction, SurfaceControl surfaceControl, Rect rect, Rect rect2, Rect rect3) {
        int i;
        float f;
        this.mTmpSourceRectF.set(rect);
        this.mTmpDestinationRect.set(rect);
        this.mTmpDestinationRect.inset(rect3);
        if (rect.width() <= rect.height()) {
            f = rect2.width();
            i = rect.width();
        } else {
            f = rect2.height();
            i = rect.height();
        }
        float f2 = f / i;
        float f3 = rect2.left - ((rect3.left + rect.left) * f2);
        float f4 = rect2.top - ((rect3.top + rect.top) * f2);
        this.mTmpTransform.setScale(f2, f2);
        float scaledCornerRadius = getScaledCornerRadius(this.mTmpDestinationRect, rect2);
        transaction.setMatrix(surfaceControl, this.mTmpTransform, this.mTmpFloat9).setWindowCrop(surfaceControl, this.mTmpDestinationRect).setPosition(surfaceControl, f3, f4).setCornerRadius(surfaceControl, scaledCornerRadius);
        return newPipSurfaceTransaction(f3, f4, this.mTmpFloat9, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, scaledCornerRadius, this.mTmpDestinationRect);
    }

    public PipSurfaceTransactionHelper(int i) {
        this.mCornerRadius = i;
    }

    private float getScaledCornerRadius(Rect rect, Rect rect2) {
        return this.mCornerRadius * ((float) (Math.hypot(rect.width(), rect.height()) / Math.hypot(rect2.width(), rect2.height())));
    }

    public PictureInPictureSurfaceTransaction scale(SurfaceControl.Transaction transaction, SurfaceControl surfaceControl, Rect rect, Rect rect2, float f, float f2, float f3) {
        this.mTmpSourceRectF.set(rect);
        this.mTmpDestinationRectF.set(rect2);
        this.mTmpDestinationRectF.offsetTo(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        this.mTmpTransform.setRectToRect(this.mTmpSourceRectF, this.mTmpDestinationRectF, Matrix.ScaleToFit.FILL);
        this.mTmpTransform.postRotate(f, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        float scaledCornerRadius = getScaledCornerRadius(rect, rect2);
        transaction.setMatrix(surfaceControl, this.mTmpTransform, this.mTmpFloat9).setPosition(surfaceControl, f2, f3).setCornerRadius(surfaceControl, scaledCornerRadius);
        return newPipSurfaceTransaction(f2, f3, this.mTmpFloat9, f, scaledCornerRadius, rect);
    }
}
