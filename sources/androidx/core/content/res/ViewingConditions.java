package androidx.core.content.res;

import androidx.fragment.R$styleable;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
/* loaded from: classes.dex */
public final class ViewingConditions {
    public static final ViewingConditions DEFAULT;
    public final float mAw;
    public final float mC;
    public final float mFl;
    public final float mFlRoot;
    public final float mN;
    public final float mNbb;
    public final float mNc;
    public final float mNcb;
    public final float[] mRgbD;
    public final float mZ;

    static {
        float f;
        float[] fArr = R$styleable.WHITE_POINT_D65;
        float yFromLStar = (float) ((R$styleable.yFromLStar() * 63.66197723675813d) / 100.0d);
        float[][] fArr2 = R$styleable.XYZ_TO_CAM16RGB;
        float f2 = fArr[0];
        float[] fArr3 = fArr2[0];
        float f3 = fArr[1];
        float f4 = fArr3[1] * f3;
        float f5 = fArr[2];
        float f6 = (fArr3[2] * f5) + f4 + (fArr3[0] * f2);
        float[] fArr4 = fArr2[1];
        float f7 = (fArr4[2] * f5) + (fArr4[1] * f3) + (fArr4[0] * f2);
        float[] fArr5 = fArr2[2];
        float f8 = (f5 * fArr5[2]) + (f3 * fArr5[1]) + (f2 * fArr5[0]);
        if (1.0f >= 0.9d) {
            f = 0.69f;
        } else {
            f = 0.655f;
        }
        float f9 = f;
        float exp = (1.0f - (((float) Math.exp(((-yFromLStar) - 42.0f) / 92.0f)) * 0.2777778f)) * 1.0f;
        double d = exp;
        if (d > 1.0d) {
            exp = 1.0f;
        } else if (d < 0.0d) {
            exp = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        }
        float[] fArr6 = {(((100.0f / f6) * exp) + 1.0f) - exp, (((100.0f / f7) * exp) + 1.0f) - exp, (((100.0f / f8) * exp) + 1.0f) - exp};
        float f10 = 1.0f / ((5.0f * yFromLStar) + 1.0f);
        float f11 = f10 * f10 * f10 * f10;
        float f12 = 1.0f - f11;
        float cbrt = (0.1f * f12 * f12 * ((float) Math.cbrt(yFromLStar * 5.0d))) + (f11 * yFromLStar);
        float yFromLStar2 = R$styleable.yFromLStar() / fArr[1];
        double d2 = yFromLStar2;
        float sqrt = ((float) Math.sqrt(d2)) + 1.48f;
        float pow = 0.725f / ((float) Math.pow(d2, 0.2d));
        float pow2 = (float) Math.pow(((fArr6[2] * cbrt) * f8) / 100.0d, 0.42d);
        float[] fArr7 = {(float) Math.pow(((fArr6[0] * cbrt) * f6) / 100.0d, 0.42d), (float) Math.pow(((fArr6[1] * cbrt) * f7) / 100.0d, 0.42d), pow2};
        float f13 = fArr7[0];
        float f14 = fArr7[1];
        DEFAULT = new ViewingConditions(yFromLStar2, ((((400.0f * pow2) / (pow2 + 27.13f)) * 0.05f) + (((f13 * 400.0f) / (f13 + 27.13f)) * 2.0f) + ((f14 * 400.0f) / (f14 + 27.13f))) * pow, pow, pow, f9, 1.0f, fArr6, cbrt, (float) Math.pow(cbrt, 0.25d), sqrt);
    }

    public ViewingConditions(float f, float f2, float f3, float f4, float f5, float f6, float[] fArr, float f7, float f8, float f9) {
        this.mN = f;
        this.mAw = f2;
        this.mNbb = f3;
        this.mNcb = f4;
        this.mC = f5;
        this.mNc = f6;
        this.mRgbD = fArr;
        this.mFl = f7;
        this.mFlRoot = f8;
        this.mZ = f9;
    }
}
