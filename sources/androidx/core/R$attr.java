package androidx.core;

import android.view.View;
import android.view.ViewParent;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import androidx.appcompat.widget.WithHint;
import androidx.constraintlayout.solver.widgets.analyzer.DependencyGraph$$ExternalSyntheticOutline0;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import java.util.Objects;
/* loaded from: classes.dex */
public final class R$attr {
    public static boolean contains(Object[] objArr, Object obj) {
        for (Object obj2 : objArr) {
            if (Objects.equals(obj2, obj)) {
                return true;
            }
        }
        return false;
    }

    public static float interpolate(float[] fArr, float f, float f2) {
        if (f2 >= 1.0f) {
            return 1.0f;
        }
        if (f2 <= HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
            return HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        }
        int min = Math.min((int) ((fArr.length - 1) * f2), fArr.length - 2);
        float f3 = (f2 - (min * f)) / f;
        float f4 = fArr[min];
        return DependencyGraph$$ExternalSyntheticOutline0.m(fArr[min + 1], f4, f3, f4);
    }

    public static void onCreateInputConnection(InputConnection inputConnection, EditorInfo editorInfo, View view) {
        if (inputConnection != null && editorInfo.hintText == null) {
            for (ViewParent parent = view.getParent(); parent instanceof View; parent = parent.getParent()) {
                if (parent instanceof WithHint) {
                    editorInfo.hintText = ((WithHint) parent).getHint();
                    return;
                }
            }
        }
    }
}
