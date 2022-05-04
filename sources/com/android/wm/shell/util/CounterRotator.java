package com.android.wm.shell.util;

import android.view.SurfaceControl;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import java.util.ArrayList;
/* loaded from: classes.dex */
public class CounterRotator {
    public SurfaceControl mSurface = null;
    public ArrayList<SurfaceControl> mRotateChildren = null;

    public void cleanUp(SurfaceControl surfaceControl) {
        if (this.mSurface != null) {
            SurfaceControl.Transaction transaction = new SurfaceControl.Transaction();
            for (int size = this.mRotateChildren.size() - 1; size >= 0; size--) {
                transaction.reparent(this.mRotateChildren.get(size), surfaceControl);
            }
            transaction.remove(this.mSurface);
            transaction.apply();
        }
    }

    public void setup(SurfaceControl.Transaction transaction, SurfaceControl surfaceControl, int i, float f, float f2) {
        if (i != 0) {
            this.mRotateChildren = new ArrayList<>();
            int i2 = 4 - ((i + 4) % 4);
            SurfaceControl build = new SurfaceControl.Builder().setName("Transition Unrotate").setContainerLayer().setParent(surfaceControl).build();
            this.mSurface = build;
            if (i2 == 1) {
                transaction.setMatrix(build, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 1.0f, -1.0f, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                transaction.setPosition(this.mSurface, f, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            } else if (i2 == 2) {
                transaction.setMatrix(build, -1.0f, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, -1.0f);
                transaction.setPosition(this.mSurface, f, f2);
            } else if (i2 == 3) {
                transaction.setMatrix(build, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, -1.0f, 1.0f, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                transaction.setPosition(this.mSurface, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, f2);
            }
            transaction.show(this.mSurface);
        }
    }
}
