package com.android.customization.widget;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import androidx.core.graphics.PathParser;
/* loaded from: classes.dex */
public class GridTileDrawable extends Drawable {
    public final int mCols;
    public final int mRows;
    public final Path mShapePath;
    public final Path mTransformedPath;
    public final Paint mPaint = new Paint(1);
    public final Matrix mScaleMatrix = new Matrix();

    public GridTileDrawable(int i, int i2, String str) {
        this.mCols = i;
        this.mRows = i2;
        Path createPathFromPathData = PathParser.createPathFromPathData(str);
        this.mShapePath = createPathFromPathData;
        this.mTransformedPath = new Path(createPathFromPathData);
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        double width = getBounds().width();
        for (int i = 0; i < this.mRows; i++) {
            for (int i2 = 0; i2 < this.mCols; i2++) {
                int save = canvas.save();
                canvas.translate((float) (((i * width) / this.mRows) + 6.0d), (float) (((i2 * width) / this.mCols) + 6.0d));
                canvas.drawPath(this.mTransformedPath, this.mPaint);
                canvas.restoreToCount(save);
            }
        }
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    public void onBoundsChange(Rect rect) {
        super.onBoundsChange(rect);
        float width = ((rect.width() / Math.max(this.mRows, this.mCols)) - 12.0f) / 100.0f;
        this.mScaleMatrix.setScale(width, width);
        this.mShapePath.transform(this.mScaleMatrix, this.mTransformedPath);
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int i) {
        this.mPaint.setAlpha(i);
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter colorFilter) {
        this.mPaint.setColorFilter(colorFilter);
    }
}
