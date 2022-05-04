package androidx.dynamicanimation.animation;

import androidx.dynamicanimation.animation.DynamicAnimation;
/* loaded from: classes.dex */
public final class SpringForce {
    public double mDampedFreq;
    public double mDampingRatio;
    public double mFinalPosition;
    public double mGammaMinus;
    public double mGammaPlus;
    public boolean mInitialized;
    public final DynamicAnimation.MassState mMassState;
    public double mNaturalFreq;
    public double mValueThreshold;
    public double mVelocityThreshold;

    public SpringForce() {
        this.mNaturalFreq = Math.sqrt(1500.0d);
        this.mDampingRatio = 0.5d;
        this.mInitialized = false;
        this.mFinalPosition = Double.MAX_VALUE;
        this.mMassState = new DynamicAnimation.MassState();
    }

    public DynamicAnimation.MassState updateValues(double lastDisplacement, double lastVelocity, long timeElapsed) {
        double d;
        double d2;
        if (!this.mInitialized) {
            if (this.mFinalPosition != Double.MAX_VALUE) {
                double d3 = this.mDampingRatio;
                if (d3 > 1.0d) {
                    double d4 = this.mNaturalFreq;
                    this.mGammaPlus = (Math.sqrt((d3 * d3) - 1.0d) * d4) + ((-d3) * d4);
                    double d5 = this.mDampingRatio;
                    double d6 = this.mNaturalFreq;
                    this.mGammaMinus = ((-d5) * d6) - (Math.sqrt((d5 * d5) - 1.0d) * d6);
                } else if (d3 >= 0.0d && d3 < 1.0d) {
                    this.mDampedFreq = Math.sqrt(1.0d - (d3 * d3)) * this.mNaturalFreq;
                }
                this.mInitialized = true;
            } else {
                throw new IllegalStateException("Error: Final position of the spring must be set before the animation starts");
            }
        }
        double d7 = timeElapsed / 1000.0d;
        double d8 = lastDisplacement - this.mFinalPosition;
        double d9 = this.mDampingRatio;
        if (d9 > 1.0d) {
            double d10 = this.mGammaMinus;
            double d11 = this.mGammaPlus;
            double d12 = d8 - (((d10 * d8) - lastVelocity) / (d10 - d11));
            double d13 = ((d8 * d10) - lastVelocity) / (d10 - d11);
            d = (Math.pow(2.718281828459045d, this.mGammaPlus * d7) * d13) + (Math.pow(2.718281828459045d, d10 * d7) * d12);
            double d14 = this.mGammaMinus;
            double pow = Math.pow(2.718281828459045d, d14 * d7) * d12 * d14;
            double d15 = this.mGammaPlus;
            d2 = (Math.pow(2.718281828459045d, d15 * d7) * d13 * d15) + pow;
        } else if (d9 == 1.0d) {
            double d16 = this.mNaturalFreq;
            double d17 = (d16 * d8) + lastVelocity;
            double d18 = (d17 * d7) + d8;
            d = Math.pow(2.718281828459045d, (-d16) * d7) * d18;
            double pow2 = Math.pow(2.718281828459045d, (-this.mNaturalFreq) * d7) * d18;
            double d19 = this.mNaturalFreq;
            d2 = (Math.pow(2.718281828459045d, (-d19) * d7) * d17) + (pow2 * (-d19));
        } else {
            double d20 = 1.0d / this.mDampedFreq;
            double d21 = this.mNaturalFreq;
            double d22 = ((d9 * d21 * d8) + lastVelocity) * d20;
            double sin = ((Math.sin(this.mDampedFreq * d7) * d22) + (Math.cos(this.mDampedFreq * d7) * d8)) * Math.pow(2.718281828459045d, (-d9) * d21 * d7);
            double d23 = this.mNaturalFreq;
            double d24 = this.mDampingRatio;
            double d25 = (-d23) * sin * d24;
            double pow3 = Math.pow(2.718281828459045d, (-d24) * d23 * d7);
            double d26 = this.mDampedFreq;
            double d27 = (-d26) * d8;
            double d28 = this.mDampedFreq;
            d2 = (((Math.cos(d28 * d7) * d22 * d28) + (Math.sin(d26 * d7) * d27)) * pow3) + d25;
            d = sin;
        }
        DynamicAnimation.MassState massState = this.mMassState;
        massState.mValue = (float) (d + this.mFinalPosition);
        massState.mVelocity = (float) d2;
        return massState;
    }

    public SpringForce(float finalPosition) {
        this.mNaturalFreq = Math.sqrt(1500.0d);
        this.mDampingRatio = 0.5d;
        this.mInitialized = false;
        this.mFinalPosition = Double.MAX_VALUE;
        this.mMassState = new DynamicAnimation.MassState();
        this.mFinalPosition = finalPosition;
    }
}
