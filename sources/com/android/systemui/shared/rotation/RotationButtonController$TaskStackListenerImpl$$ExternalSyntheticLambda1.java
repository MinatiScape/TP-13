package com.android.systemui.shared.rotation;

import com.android.systemui.shared.system.ActivityManagerWrapper;
import java.util.function.Function;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class RotationButtonController$TaskStackListenerImpl$$ExternalSyntheticLambda1 implements Function {
    public static final /* synthetic */ RotationButtonController$TaskStackListenerImpl$$ExternalSyntheticLambda1 INSTANCE = new RotationButtonController$TaskStackListenerImpl$$ExternalSyntheticLambda1();

    @Override // java.util.function.Function
    public final Object apply(Object obj) {
        return ((ActivityManagerWrapper) obj).getRunningTask();
    }
}
