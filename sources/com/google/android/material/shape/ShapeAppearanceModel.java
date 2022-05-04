package com.google.android.material.shape;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import androidx.appcompat.R$layout;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.bumptech.glide.manager.ApplicationLifecycle;
import com.google.android.gms.common.util.zzh;
import com.google.android.material.R$styleable;
/* loaded from: classes.dex */
public final class ShapeAppearanceModel {
    public zzh bottomEdge;
    public ApplicationLifecycle bottomLeftCorner;
    public CornerSize bottomLeftCornerSize;
    public ApplicationLifecycle bottomRightCorner;
    public CornerSize bottomRightCornerSize;
    public zzh leftEdge;
    public zzh rightEdge;
    public zzh topEdge;
    public ApplicationLifecycle topLeftCorner;
    public CornerSize topLeftCornerSize;
    public ApplicationLifecycle topRightCorner;
    public CornerSize topRightCornerSize;

    /* loaded from: classes.dex */
    public static final class Builder {
        public zzh bottomEdge;
        public ApplicationLifecycle bottomLeftCorner;
        public CornerSize bottomLeftCornerSize;
        public ApplicationLifecycle bottomRightCorner;
        public CornerSize bottomRightCornerSize;
        public zzh leftEdge;
        public zzh rightEdge;
        public zzh topEdge;
        public ApplicationLifecycle topLeftCorner;
        public CornerSize topLeftCornerSize;
        public ApplicationLifecycle topRightCorner;
        public CornerSize topRightCornerSize;

        public Builder() {
            this.topLeftCorner = new RoundedCornerTreatment();
            this.topRightCorner = new RoundedCornerTreatment();
            this.bottomRightCorner = new RoundedCornerTreatment();
            this.bottomLeftCorner = new RoundedCornerTreatment();
            this.topLeftCornerSize = new AbsoluteCornerSize(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            this.topRightCornerSize = new AbsoluteCornerSize(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            this.bottomRightCornerSize = new AbsoluteCornerSize(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            this.bottomLeftCornerSize = new AbsoluteCornerSize(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            this.topEdge = new zzh();
            this.rightEdge = new zzh();
            this.bottomEdge = new zzh();
            this.leftEdge = new zzh();
        }

        public static void compatCornerTreatmentSize(ApplicationLifecycle applicationLifecycle) {
            if (applicationLifecycle instanceof RoundedCornerTreatment) {
                RoundedCornerTreatment roundedCornerTreatment = (RoundedCornerTreatment) applicationLifecycle;
            } else if (applicationLifecycle instanceof CutCornerTreatment) {
                CutCornerTreatment cutCornerTreatment = (CutCornerTreatment) applicationLifecycle;
            }
        }

        public final ShapeAppearanceModel build() {
            return new ShapeAppearanceModel(this);
        }

        public Builder(ShapeAppearanceModel shapeAppearanceModel) {
            this.topLeftCorner = new RoundedCornerTreatment();
            this.topRightCorner = new RoundedCornerTreatment();
            this.bottomRightCorner = new RoundedCornerTreatment();
            this.bottomLeftCorner = new RoundedCornerTreatment();
            this.topLeftCornerSize = new AbsoluteCornerSize(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            this.topRightCornerSize = new AbsoluteCornerSize(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            this.bottomRightCornerSize = new AbsoluteCornerSize(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            this.bottomLeftCornerSize = new AbsoluteCornerSize(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            this.topEdge = new zzh();
            this.rightEdge = new zzh();
            this.bottomEdge = new zzh();
            this.leftEdge = new zzh();
            this.topLeftCorner = shapeAppearanceModel.topLeftCorner;
            this.topRightCorner = shapeAppearanceModel.topRightCorner;
            this.bottomRightCorner = shapeAppearanceModel.bottomRightCorner;
            this.bottomLeftCorner = shapeAppearanceModel.bottomLeftCorner;
            this.topLeftCornerSize = shapeAppearanceModel.topLeftCornerSize;
            this.topRightCornerSize = shapeAppearanceModel.topRightCornerSize;
            this.bottomRightCornerSize = shapeAppearanceModel.bottomRightCornerSize;
            this.bottomLeftCornerSize = shapeAppearanceModel.bottomLeftCornerSize;
            this.topEdge = shapeAppearanceModel.topEdge;
            this.rightEdge = shapeAppearanceModel.rightEdge;
            this.bottomEdge = shapeAppearanceModel.bottomEdge;
            this.leftEdge = shapeAppearanceModel.leftEdge;
        }
    }

    public ShapeAppearanceModel(Builder builder) {
        this.topLeftCorner = builder.topLeftCorner;
        this.topRightCorner = builder.topRightCorner;
        this.bottomRightCorner = builder.bottomRightCorner;
        this.bottomLeftCorner = builder.bottomLeftCorner;
        this.topLeftCornerSize = builder.topLeftCornerSize;
        this.topRightCornerSize = builder.topRightCornerSize;
        this.bottomRightCornerSize = builder.bottomRightCornerSize;
        this.bottomLeftCornerSize = builder.bottomLeftCornerSize;
        this.topEdge = builder.topEdge;
        this.rightEdge = builder.rightEdge;
        this.bottomEdge = builder.bottomEdge;
        this.leftEdge = builder.leftEdge;
    }

    public static Builder builder(Context context, AttributeSet attributeSet, int i, int i2) {
        AbsoluteCornerSize absoluteCornerSize = new AbsoluteCornerSize(0);
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R$styleable.MaterialShape, i, i2);
        int resourceId = obtainStyledAttributes.getResourceId(0, 0);
        int resourceId2 = obtainStyledAttributes.getResourceId(1, 0);
        obtainStyledAttributes.recycle();
        return builder(context, resourceId, resourceId2, absoluteCornerSize);
    }

    public final boolean isRoundRect(RectF rectF) {
        boolean z;
        boolean z2;
        boolean z3;
        if (!this.leftEdge.getClass().equals(zzh.class) || !this.rightEdge.getClass().equals(zzh.class) || !this.topEdge.getClass().equals(zzh.class) || !this.bottomEdge.getClass().equals(zzh.class)) {
            z = false;
        } else {
            z = true;
        }
        float cornerSize = this.topLeftCornerSize.getCornerSize(rectF);
        if (this.topRightCornerSize.getCornerSize(rectF) == cornerSize && this.bottomLeftCornerSize.getCornerSize(rectF) == cornerSize && this.bottomRightCornerSize.getCornerSize(rectF) == cornerSize) {
            z2 = true;
        } else {
            z2 = false;
        }
        if (!(this.topRightCorner instanceof RoundedCornerTreatment) || !(this.topLeftCorner instanceof RoundedCornerTreatment) || !(this.bottomRightCorner instanceof RoundedCornerTreatment) || !(this.bottomLeftCorner instanceof RoundedCornerTreatment)) {
            z3 = false;
        } else {
            z3 = true;
        }
        if (!z || !z2 || !z3) {
            return false;
        }
        return true;
    }

    public static CornerSize getCornerSize(TypedArray typedArray, int i, CornerSize cornerSize) {
        TypedValue peekValue = typedArray.peekValue(i);
        if (peekValue == null) {
            return cornerSize;
        }
        int i2 = peekValue.type;
        if (i2 == 5) {
            return new AbsoluteCornerSize(TypedValue.complexToDimensionPixelSize(peekValue.data, typedArray.getResources().getDisplayMetrics()));
        }
        if (i2 == 6) {
            return new RelativeCornerSize(peekValue.getFraction(1.0f, 1.0f));
        }
        return cornerSize;
    }

    public static Builder builder(Context context, int i, int i2, AbsoluteCornerSize absoluteCornerSize) {
        if (i2 != 0) {
            ContextThemeWrapper contextThemeWrapper = new ContextThemeWrapper(context, i);
            i = i2;
            context = contextThemeWrapper;
        }
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(i, R$styleable.ShapeAppearance);
        try {
            int i3 = obtainStyledAttributes.getInt(0, 0);
            int i4 = obtainStyledAttributes.getInt(3, i3);
            int i5 = obtainStyledAttributes.getInt(4, i3);
            int i6 = obtainStyledAttributes.getInt(2, i3);
            int i7 = obtainStyledAttributes.getInt(1, i3);
            CornerSize cornerSize = getCornerSize(obtainStyledAttributes, 5, absoluteCornerSize);
            CornerSize cornerSize2 = getCornerSize(obtainStyledAttributes, 8, cornerSize);
            CornerSize cornerSize3 = getCornerSize(obtainStyledAttributes, 9, cornerSize);
            CornerSize cornerSize4 = getCornerSize(obtainStyledAttributes, 7, cornerSize);
            CornerSize cornerSize5 = getCornerSize(obtainStyledAttributes, 6, cornerSize);
            Builder builder = new Builder();
            ApplicationLifecycle createCornerTreatment = R$layout.createCornerTreatment(i4);
            builder.topLeftCorner = createCornerTreatment;
            Builder.compatCornerTreatmentSize(createCornerTreatment);
            builder.topLeftCornerSize = cornerSize2;
            ApplicationLifecycle createCornerTreatment2 = R$layout.createCornerTreatment(i5);
            builder.topRightCorner = createCornerTreatment2;
            Builder.compatCornerTreatmentSize(createCornerTreatment2);
            builder.topRightCornerSize = cornerSize3;
            ApplicationLifecycle createCornerTreatment3 = R$layout.createCornerTreatment(i6);
            builder.bottomRightCorner = createCornerTreatment3;
            Builder.compatCornerTreatmentSize(createCornerTreatment3);
            builder.bottomRightCornerSize = cornerSize4;
            ApplicationLifecycle createCornerTreatment4 = R$layout.createCornerTreatment(i7);
            builder.bottomLeftCorner = createCornerTreatment4;
            Builder.compatCornerTreatmentSize(createCornerTreatment4);
            builder.bottomLeftCornerSize = cornerSize5;
            return builder;
        } finally {
            obtainStyledAttributes.recycle();
        }
    }

    public ShapeAppearanceModel() {
        this.topLeftCorner = new RoundedCornerTreatment();
        this.topRightCorner = new RoundedCornerTreatment();
        this.bottomRightCorner = new RoundedCornerTreatment();
        this.bottomLeftCorner = new RoundedCornerTreatment();
        this.topLeftCornerSize = new AbsoluteCornerSize(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        this.topRightCornerSize = new AbsoluteCornerSize(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        this.bottomRightCornerSize = new AbsoluteCornerSize(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        this.bottomLeftCornerSize = new AbsoluteCornerSize(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        this.topEdge = new zzh();
        this.rightEdge = new zzh();
        this.bottomEdge = new zzh();
        this.leftEdge = new zzh();
    }
}
