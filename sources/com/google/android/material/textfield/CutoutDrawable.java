package com.google.android.material.textfield;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import com.google.android.material.shape.MaterialShapeDrawable;
import com.google.android.material.shape.ShapeAppearanceModel;
/* loaded from: classes.dex */
public final class CutoutDrawable extends MaterialShapeDrawable {
    public final RectF cutoutBounds;

    public CutoutDrawable() {
        throw null;
    }

    public CutoutDrawable(ShapeAppearanceModel shapeAppearanceModel) {
        super(shapeAppearanceModel == null ? new ShapeAppearanceModel() : shapeAppearanceModel);
        Paint paint = new Paint(1);
        paint.setStyle(Paint.Style.FILL_AND_STROKE);
        paint.setColor(-1);
        paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_OUT));
        this.cutoutBounds = new RectF();
    }

    @Override // com.google.android.material.shape.MaterialShapeDrawable
    public final void drawStrokeShape(Canvas canvas) {
        if (this.cutoutBounds.isEmpty()) {
            super.drawStrokeShape(canvas);
            return;
        }
        canvas.save();
        canvas.clipOutRect(this.cutoutBounds);
        super.drawStrokeShape(canvas);
        canvas.restore();
    }

    public final void setCutout(float f, float f2, float f3, float f4) {
        RectF rectF = this.cutoutBounds;
        if (f != rectF.left || f2 != rectF.top || f3 != rectF.right || f4 != rectF.bottom) {
            rectF.set(f, f2, f3, f4);
            invalidateSelf();
        }
    }
}
