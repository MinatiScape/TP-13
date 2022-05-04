package androidx.appcompat;

import android.view.View;
import android.view.ViewParent;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.core.view.ViewPropertyAnimatorListener;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.bumptech.glide.manager.ApplicationLifecycle;
import com.google.android.material.elevation.ElevationOverlayProvider;
import com.google.android.material.shape.CutCornerTreatment;
import com.google.android.material.shape.MaterialShapeDrawable;
import com.google.android.material.shape.RoundedCornerTreatment;
import com.google.chrome.dongle.imax.wallpaper2.protos.ImaxWallpaperProto$Attribution;
import com.google.protobuf.Internal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public class R$layout implements ViewPropertyAnimatorListener {
    @Override // androidx.core.view.ViewPropertyAnimatorListener
    public void onAnimationCancel(View view) {
    }

    @Override // androidx.core.view.ViewPropertyAnimatorListener
    public void onAnimationStart() {
    }

    public static ApplicationLifecycle createCornerTreatment(int i) {
        if (i == 0) {
            return new RoundedCornerTreatment();
        }
        if (i != 1) {
            return new RoundedCornerTreatment();
        }
        return new CutCornerTreatment();
    }

    public static ArrayList parseAttributions(Internal.ProtobufList protobufList, String str) {
        ArrayList arrayList = new ArrayList();
        Iterator<E> it = protobufList.iterator();
        while (it.hasNext()) {
            arrayList.add(((ImaxWallpaperProto$Attribution) it.next()).getText());
        }
        if (arrayList.size() == 0) {
            arrayList.add(str);
        }
        return arrayList;
    }

    public static void setParentAbsoluteElevation(View view, MaterialShapeDrawable materialShapeDrawable) {
        boolean z;
        ElevationOverlayProvider elevationOverlayProvider = materialShapeDrawable.drawableState.elevationOverlayProvider;
        if (elevationOverlayProvider == null || !elevationOverlayProvider.elevationOverlayEnabled) {
            z = false;
        } else {
            z = true;
        }
        if (z) {
            float f = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            for (ViewParent parent = view.getParent(); parent instanceof View; parent = parent.getParent()) {
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                f += ViewCompat.Api21Impl.getElevation((View) parent);
            }
            MaterialShapeDrawable.MaterialShapeDrawableState materialShapeDrawableState = materialShapeDrawable.drawableState;
            if (materialShapeDrawableState.parentAbsoluteElevation != f) {
                materialShapeDrawableState.parentAbsoluteElevation = f;
                materialShapeDrawable.updateZ();
            }
        }
    }

    public static boolean zza(Object obj, Object obj2) {
        if (obj == obj2) {
            return true;
        }
        if (obj == null || !obj.equals(obj2)) {
            return false;
        }
        return true;
    }
}
