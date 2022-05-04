package com.android.systemui.shared.rotation;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: FloatingRotationButtonPositionCalculator.kt */
/* loaded from: classes.dex */
public final class FloatingRotationButtonPositionCalculator {
    private final int defaultMargin;
    private final int taskbarMarginBottom;
    private final int taskbarMarginLeft;

    /* compiled from: FloatingRotationButtonPositionCalculator.kt */
    /* loaded from: classes.dex */
    public static final class Position {
        private final int gravity;
        private final int translationX;
        private final int translationY;

        public static /* synthetic */ Position copy$default(Position position, int i, int i2, int i3, int i4, Object obj) {
            if ((i4 & 1) != 0) {
                i = position.gravity;
            }
            if ((i4 & 2) != 0) {
                i2 = position.translationX;
            }
            if ((i4 & 4) != 0) {
                i3 = position.translationY;
            }
            return position.copy(i, i2, i3);
        }

        public final int component1() {
            return this.gravity;
        }

        public final int component2() {
            return this.translationX;
        }

        public final int component3() {
            return this.translationY;
        }

        @NotNull
        public final Position copy(int i, int i2, int i3) {
            return new Position(i, i2, i3);
        }

        public boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Position)) {
                return false;
            }
            Position position = (Position) obj;
            return this.gravity == position.gravity && this.translationX == position.translationX && this.translationY == position.translationY;
        }

        public int hashCode() {
            int hashCode = Integer.hashCode(this.translationX);
            return Integer.hashCode(this.translationY) + ((hashCode + (Integer.hashCode(this.gravity) * 31)) * 31);
        }

        @NotNull
        public String toString() {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Position(gravity=");
            m.append(this.gravity);
            m.append(", translationX=");
            m.append(this.translationX);
            m.append(", translationY=");
            m.append(this.translationY);
            m.append(')');
            return m.toString();
        }

        public Position(int i, int i2, int i3) {
            this.gravity = i;
            this.translationX = i2;
            this.translationY = i3;
        }

        public final int getGravity() {
            return this.gravity;
        }

        public final int getTranslationX() {
            return this.translationX;
        }

        public final int getTranslationY() {
            return this.translationY;
        }
    }

    @NotNull
    public final Position calculatePosition(int i, boolean z, boolean z2) {
        boolean z3;
        int i2;
        int i3;
        boolean z4 = false;
        if (i == 0 || i == 1) {
            z3 = true;
        } else {
            z3 = false;
        }
        if (z3 && z && !z2) {
            z4 = true;
        }
        int resolveGravity = resolveGravity(i);
        if (z4) {
            i2 = this.taskbarMarginLeft;
        } else {
            i2 = this.defaultMargin;
        }
        if (z4) {
            i3 = this.taskbarMarginBottom;
        } else {
            i3 = this.defaultMargin;
        }
        if ((resolveGravity & 5) == 5) {
            i2 = -i2;
        }
        if ((resolveGravity & 80) == 80) {
            i3 = -i3;
        }
        return new Position(resolveGravity, i2, i3);
    }

    private final int resolveGravity(int i) {
        if (i == 0) {
            return 83;
        }
        if (i == 1) {
            return 85;
        }
        if (i == 2) {
            return 53;
        }
        if (i == 3) {
            return 51;
        }
        throw new IllegalArgumentException(Intrinsics.stringPlus("Invalid rotation ", Integer.valueOf(i)));
    }

    public FloatingRotationButtonPositionCalculator(int i, int i2, int i3) {
        this.defaultMargin = i;
        this.taskbarMarginLeft = i2;
        this.taskbarMarginBottom = i3;
    }
}
