package com.android.systemui.unfold.util;

import android.content.Context;
import android.os.RemoteException;
import android.view.IRotationWatcher;
import android.view.IWindowManager;
import com.android.systemui.unfold.UnfoldTransitionProgressProvider;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public final class NaturalRotationUnfoldProgressProvider implements UnfoldTransitionProgressProvider {
    @NotNull
    private final Context context;
    private boolean isNaturalRotation;
    @NotNull
    private final RotationWatcher rotationWatcher = new RotationWatcher(this);
    @NotNull
    private final ScopedUnfoldTransitionProgressProvider scopedUnfoldTransitionProgressProvider;
    @NotNull
    private final IWindowManager windowManagerInterface;

    /* loaded from: classes.dex */
    public final class RotationWatcher extends IRotationWatcher.Stub {
        public final /* synthetic */ NaturalRotationUnfoldProgressProvider this$0;

        public RotationWatcher(NaturalRotationUnfoldProgressProvider this$0) {
            Intrinsics.checkNotNullParameter(this$0, "this$0");
            this.this$0 = this$0;
        }

        public void onRotationChanged(int i) {
            this.this$0.onRotationChanged(i);
        }
    }

    public NaturalRotationUnfoldProgressProvider(@NotNull Context context, @NotNull IWindowManager windowManagerInterface, @NotNull UnfoldTransitionProgressProvider unfoldTransitionProgressProvider) {
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(windowManagerInterface, "windowManagerInterface");
        Intrinsics.checkNotNullParameter(unfoldTransitionProgressProvider, "unfoldTransitionProgressProvider");
        this.context = context;
        this.windowManagerInterface = windowManagerInterface;
        this.scopedUnfoldTransitionProgressProvider = new ScopedUnfoldTransitionProgressProvider(unfoldTransitionProgressProvider);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void onRotationChanged(int i) {
        boolean z = i == 0 || i == 2;
        if (this.isNaturalRotation != z) {
            this.isNaturalRotation = z;
            this.scopedUnfoldTransitionProgressProvider.setReadyToHandleTransition(z);
        }
    }

    @Override // com.android.systemui.unfold.UnfoldTransitionProgressProvider
    public void destroy() {
        try {
            this.windowManagerInterface.removeRotationWatcher(this.rotationWatcher);
        } catch (RemoteException e) {
            e.rethrowFromSystemServer();
        }
        this.scopedUnfoldTransitionProgressProvider.destroy();
    }

    public final void init() {
        try {
            this.windowManagerInterface.watchRotation(this.rotationWatcher, this.context.getDisplay().getDisplayId());
            onRotationChanged(this.context.getDisplay().getRotation());
        } catch (RemoteException e) {
            RuntimeException rethrowFromSystemServer = e.rethrowFromSystemServer();
            Intrinsics.checkNotNullExpressionValue(rethrowFromSystemServer, "e.rethrowFromSystemServer()");
            throw rethrowFromSystemServer;
        }
    }

    public void addCallback(@NotNull UnfoldTransitionProgressProvider.TransitionProgressListener listener) {
        Intrinsics.checkNotNullParameter(listener, "listener");
        this.scopedUnfoldTransitionProgressProvider.addCallback(listener);
    }

    public void removeCallback(@NotNull UnfoldTransitionProgressProvider.TransitionProgressListener listener) {
        Intrinsics.checkNotNullParameter(listener, "listener");
        this.scopedUnfoldTransitionProgressProvider.removeCallback(listener);
    }
}
