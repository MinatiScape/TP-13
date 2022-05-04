package androidx.core.graphics;

import android.graphics.Color;
/* loaded from: classes.dex */
public final class ColorUtils {
    static {
        new ThreadLocal();
    }

    public static float circularInterpolate(float a, float b, float f) {
        if (Math.abs(b - a) > 180.0f) {
            if (b > a) {
                a += 360.0f;
            } else {
                b += 360.0f;
            }
        }
        return (((b - a) * f) + a) % 360.0f;
    }

    public static int compositeColors(int foreground, int background) {
        int alpha = Color.alpha(background);
        int alpha2 = Color.alpha(foreground);
        int i = 255 - (((255 - alpha2) * (255 - alpha)) / 255);
        return Color.argb(i, compositeComponent(Color.red(foreground), alpha2, Color.red(background), alpha, i), compositeComponent(Color.green(foreground), alpha2, Color.green(background), alpha, i), compositeComponent(Color.blue(foreground), alpha2, Color.blue(background), alpha, i));
    }

    public static int compositeComponent(int fgC, int fgA, int bgC, int bgA, int a) {
        if (a == 0) {
            return 0;
        }
        return (((255 - fgA) * (bgC * bgA)) + ((fgC * 255) * fgA)) / (a * 255);
    }

    public static int setAlphaComponent(int color, int alpha) {
        if (alpha >= 0 && alpha <= 255) {
            return (color & 16777215) | (alpha << 24);
        }
        throw new IllegalArgumentException("alpha must be between 0 and 255.");
    }
}
