package androidx.core.content.res;

import android.graphics.Color;
import androidx.core.graphics.ColorUtils;
import androidx.fragment.R$styleable;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
/* loaded from: classes.dex */
public final class CamColor {
    public final float mAstar;
    public final float mBstar;
    public final float mChroma;
    public final float mHue;
    public final float mJ;
    public final float mJstar;

    public final int viewed(ViewingConditions viewingConditions) {
        float f;
        float[] fArr;
        float f2 = this.mChroma;
        if (f2 != 0.0d) {
            double d = this.mJ;
            if (d != 0.0d) {
                f = f2 / ((float) Math.sqrt(d / 100.0d));
                float pow = (float) Math.pow(f / Math.pow(1.64d - Math.pow(0.29d, viewingConditions.mN), 0.73d), 1.1111111111111112d);
                double d2 = (this.mHue * 3.1415927f) / 180.0f;
                float pow2 = viewingConditions.mAw * ((float) Math.pow(this.mJ / 100.0d, (1.0d / viewingConditions.mC) / viewingConditions.mZ));
                float cos = ((float) (Math.cos(2.0d + d2) + 3.8d)) * 0.25f * 3846.1538f * viewingConditions.mNc * viewingConditions.mNcb;
                float f3 = pow2 / viewingConditions.mNbb;
                float sin = (float) Math.sin(d2);
                float cos2 = (float) Math.cos(d2);
                float f4 = (((0.305f + f3) * 23.0f) * pow) / (((pow * 108.0f) * sin) + (((11.0f * pow) * cos2) + (cos * 23.0f)));
                float f5 = cos2 * f4;
                float f6 = f4 * sin;
                float f7 = f3 * 460.0f;
                float f8 = ((288.0f * f6) + ((451.0f * f5) + f7)) / 1403.0f;
                float f9 = ((f7 - (891.0f * f5)) - (261.0f * f6)) / 1403.0f;
                float f10 = ((f7 - (f5 * 220.0f)) - (f6 * 6300.0f)) / 1403.0f;
                float signum = (100.0f / viewingConditions.mFl) * Math.signum(f8) * ((float) Math.pow((float) Math.max(0.0d, (Math.abs(f8) * 27.13d) / (400.0d - Math.abs(f8))), 2.380952380952381d));
                float signum2 = (100.0f / viewingConditions.mFl) * Math.signum(f9) * ((float) Math.pow((float) Math.max(0.0d, (Math.abs(f9) * 27.13d) / (400.0d - Math.abs(f9))), 2.380952380952381d));
                float signum3 = (100.0f / viewingConditions.mFl) * Math.signum(f10) * ((float) Math.pow((float) Math.max(0.0d, (Math.abs(f10) * 27.13d) / (400.0d - Math.abs(f10))), 2.380952380952381d));
                float[] fArr2 = viewingConditions.mRgbD;
                float f11 = signum / fArr2[0];
                float f12 = signum2 / fArr2[1];
                float f13 = signum3 / fArr2[2];
                float[][] fArr3 = R$styleable.CAM16RGB_TO_XYZ;
                float[] fArr4 = fArr3[0];
                float f14 = (fArr4[2] * f13) + (fArr4[1] * f12) + (fArr4[0] * f11);
                float[] fArr5 = fArr3[1];
                float f15 = fArr5[1] * f12;
                float f16 = fArr5[2] * f13;
                float f17 = f11 * fArr3[2][0];
                return ColorUtils.XYZToColor(f14, f16 + f15 + (fArr5[0] * f11), (f13 * fArr[2]) + (f12 * fArr[1]) + f17);
            }
        }
        f = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        float pow3 = (float) Math.pow(f / Math.pow(1.64d - Math.pow(0.29d, viewingConditions.mN), 0.73d), 1.1111111111111112d);
        double d22 = (this.mHue * 3.1415927f) / 180.0f;
        float pow22 = viewingConditions.mAw * ((float) Math.pow(this.mJ / 100.0d, (1.0d / viewingConditions.mC) / viewingConditions.mZ));
        float cos3 = ((float) (Math.cos(2.0d + d22) + 3.8d)) * 0.25f * 3846.1538f * viewingConditions.mNc * viewingConditions.mNcb;
        float f32 = pow22 / viewingConditions.mNbb;
        float sin2 = (float) Math.sin(d22);
        float cos22 = (float) Math.cos(d22);
        float f42 = (((0.305f + f32) * 23.0f) * pow3) / (((pow3 * 108.0f) * sin2) + (((11.0f * pow3) * cos22) + (cos3 * 23.0f)));
        float f52 = cos22 * f42;
        float f62 = f42 * sin2;
        float f72 = f32 * 460.0f;
        float f82 = ((288.0f * f62) + ((451.0f * f52) + f72)) / 1403.0f;
        float f92 = ((f72 - (891.0f * f52)) - (261.0f * f62)) / 1403.0f;
        float f102 = ((f72 - (f52 * 220.0f)) - (f62 * 6300.0f)) / 1403.0f;
        float signum4 = (100.0f / viewingConditions.mFl) * Math.signum(f82) * ((float) Math.pow((float) Math.max(0.0d, (Math.abs(f82) * 27.13d) / (400.0d - Math.abs(f82))), 2.380952380952381d));
        float signum22 = (100.0f / viewingConditions.mFl) * Math.signum(f92) * ((float) Math.pow((float) Math.max(0.0d, (Math.abs(f92) * 27.13d) / (400.0d - Math.abs(f92))), 2.380952380952381d));
        float signum32 = (100.0f / viewingConditions.mFl) * Math.signum(f102) * ((float) Math.pow((float) Math.max(0.0d, (Math.abs(f102) * 27.13d) / (400.0d - Math.abs(f102))), 2.380952380952381d));
        float[] fArr22 = viewingConditions.mRgbD;
        float f112 = signum4 / fArr22[0];
        float f122 = signum22 / fArr22[1];
        float f132 = signum32 / fArr22[2];
        float[][] fArr32 = R$styleable.CAM16RGB_TO_XYZ;
        float[] fArr42 = fArr32[0];
        float f142 = (fArr42[2] * f132) + (fArr42[1] * f122) + (fArr42[0] * f112);
        float[] fArr52 = fArr32[1];
        float f152 = fArr52[1] * f122;
        float f162 = fArr52[2] * f132;
        float f172 = f112 * fArr32[2][0];
        return ColorUtils.XYZToColor(f142, f162 + f152 + (fArr52[0] * f112), (f132 * fArr[2]) + (f122 * fArr[1]) + f172);
    }

    public static CamColor fromColor(int i) {
        float f;
        float pow;
        ViewingConditions viewingConditions = ViewingConditions.DEFAULT;
        float linearized = R$styleable.linearized(Color.red(i));
        float linearized2 = R$styleable.linearized(Color.green(i));
        float linearized3 = R$styleable.linearized(Color.blue(i));
        float[][] fArr = R$styleable.SRGB_TO_XYZ;
        float[] fArr2 = fArr[0];
        float f2 = (fArr2[2] * linearized3) + (fArr2[1] * linearized2) + (fArr2[0] * linearized);
        float[] fArr3 = fArr[1];
        float f3 = (fArr3[2] * linearized3) + (fArr3[1] * linearized2) + (fArr3[0] * linearized);
        float[] fArr4 = fArr[2];
        float f4 = (linearized3 * fArr4[2]) + (linearized2 * fArr4[1]) + (linearized * fArr4[0]);
        float[][] fArr5 = R$styleable.XYZ_TO_CAM16RGB;
        float[] fArr6 = fArr5[0];
        float f5 = (fArr6[2] * f4) + (fArr6[1] * f3) + (fArr6[0] * f2);
        float[] fArr7 = fArr5[1];
        float f6 = fArr7[1] * f3;
        float f7 = fArr7[2] * f4;
        float[] fArr8 = fArr5[2];
        float f8 = f2 * fArr8[0];
        float f9 = f4 * fArr8[2];
        float[] fArr9 = viewingConditions.mRgbD;
        float f10 = fArr9[0] * f5;
        float f11 = fArr9[1] * (f7 + f6 + (fArr7[0] * f2));
        float f12 = fArr9[2] * (f9 + (f3 * fArr8[1]) + f8);
        float pow2 = (float) Math.pow((Math.abs(f10) * viewingConditions.mFl) / 100.0d, 0.42d);
        float pow3 = (float) Math.pow((Math.abs(f11) * viewingConditions.mFl) / 100.0d, 0.42d);
        float pow4 = (float) Math.pow((Math.abs(f12) * viewingConditions.mFl) / 100.0d, 0.42d);
        float signum = ((Math.signum(f10) * 400.0f) * pow2) / (pow2 + 27.13f);
        float signum2 = ((Math.signum(f11) * 400.0f) * pow3) / (pow3 + 27.13f);
        float signum3 = ((Math.signum(f12) * 400.0f) * pow4) / (pow4 + 27.13f);
        double d = signum3;
        float f13 = ((float) (((signum2 * (-12.0d)) + (signum * 11.0d)) + d)) / 11.0f;
        float f14 = ((float) ((signum + signum2) - (d * 2.0d))) / 9.0f;
        float f15 = signum2 * 20.0f;
        float f16 = ((21.0f * signum3) + ((signum * 20.0f) + f15)) / 20.0f;
        float f17 = (((signum * 40.0f) + f15) + signum3) / 20.0f;
        float atan2 = (((float) Math.atan2(f14, f13)) * 180.0f) / 3.1415927f;
        if (atan2 < HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
            atan2 += 360.0f;
        } else if (atan2 >= 360.0f) {
            atan2 -= 360.0f;
        }
        float f18 = atan2;
        float f19 = (3.1415927f * f18) / 180.0f;
        float pow5 = ((float) Math.pow((f17 * viewingConditions.mNbb) / viewingConditions.mAw, viewingConditions.mC * viewingConditions.mZ)) * 100.0f;
        Math.sqrt(pow5 / 100.0f);
        if (f18 < 20.14d) {
            f = 360.0f + f18;
        } else {
            f = f18;
        }
        float pow6 = ((float) Math.pow(1.64d - Math.pow(0.29d, viewingConditions.mN), 0.73d)) * ((float) Math.pow((((((((float) (Math.cos(((f * 3.141592653589793d) / 180.0d) + 2.0d) + 3.8d)) * 0.25f) * 3846.1538f) * viewingConditions.mNc) * viewingConditions.mNcb) * ((float) Math.sqrt((f14 * f14) + (f13 * f13)))) / (f16 + 0.305f), 0.9d)) * ((float) Math.sqrt(pow5 / 100.0d));
        Math.sqrt((pow * viewingConditions.mC) / (viewingConditions.mAw + 4.0f));
        float f20 = (1.7f * pow5) / ((0.007f * pow5) + 1.0f);
        float log = ((float) Math.log((viewingConditions.mFlRoot * pow6 * 0.0228f) + 1.0f)) * 43.85965f;
        double d2 = f19;
        return new CamColor(f18, pow6, pow5, f20, log * ((float) Math.cos(d2)), log * ((float) Math.sin(d2)));
    }

    public static CamColor fromJch(float f, float f2, float f3) {
        ViewingConditions viewingConditions;
        double d;
        float f4 = ViewingConditions.DEFAULT.mC;
        Math.sqrt(f / 100.0d);
        Math.sqrt(((f2 / ((float) Math.sqrt(d))) * viewingConditions.mC) / (viewingConditions.mAw + 4.0f));
        float f5 = (1.7f * f) / ((0.007f * f) + 1.0f);
        float log = ((float) Math.log((viewingConditions.mFlRoot * f2 * 0.0228d) + 1.0d)) * 43.85965f;
        double d2 = (3.1415927f * f3) / 180.0f;
        return new CamColor(f3, f2, f, f5, log * ((float) Math.cos(d2)), log * ((float) Math.sin(d2)));
    }

    public CamColor(float f, float f2, float f3, float f4, float f5, float f6) {
        this.mHue = f;
        this.mChroma = f2;
        this.mJ = f3;
        this.mJstar = f4;
        this.mAstar = f5;
        this.mBstar = f6;
    }
}
