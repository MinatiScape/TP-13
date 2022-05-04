package com.android.systemui.shared.system;

import android.annotation.SuppressLint;
import android.app.IApplicationThread;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.ArrayMap;
import android.util.Log;
import android.view.IRemoteAnimationFinishedCallback;
import android.view.IRemoteAnimationRunner;
import android.view.RemoteAnimationAdapter;
import android.view.RemoteAnimationTarget;
import android.view.SurfaceControl;
import android.window.IRemoteTransition;
import android.window.IRemoteTransitionFinishedCallback;
import android.window.RemoteTransition;
import android.window.TransitionInfo;
import android.window.WindowContainerTransaction;
import com.android.wm.shell.util.CounterRotator;
/* loaded from: classes.dex */
public class RemoteAnimationAdapterCompat {
    private final RemoteTransitionCompat mRemoteTransition;
    private final RemoteAnimationAdapter mWrapped;

    public static RemoteTransitionCompat buildRemoteTransition(RemoteAnimationRunnerCompat remoteAnimationRunnerCompat, IApplicationThread iApplicationThread) {
        return new RemoteTransitionCompat(new RemoteTransition(wrapRemoteTransition(remoteAnimationRunnerCompat), iApplicationThread));
    }

    public static IRemoteAnimationRunner.Stub wrapRemoteAnimationRunner(final RemoteAnimationRunnerCompat remoteAnimationRunnerCompat) {
        return new IRemoteAnimationRunner.Stub() { // from class: com.android.systemui.shared.system.RemoteAnimationAdapterCompat.1
            public void onAnimationCancelled() {
                RemoteAnimationRunnerCompat.this.onAnimationCancelled();
            }

            public void onAnimationStart(int i, RemoteAnimationTarget[] remoteAnimationTargetArr, RemoteAnimationTarget[] remoteAnimationTargetArr2, RemoteAnimationTarget[] remoteAnimationTargetArr3, final IRemoteAnimationFinishedCallback iRemoteAnimationFinishedCallback) {
                RemoteAnimationRunnerCompat.this.onAnimationStart(i, RemoteAnimationTargetCompat.wrap(remoteAnimationTargetArr), RemoteAnimationTargetCompat.wrap(remoteAnimationTargetArr2), RemoteAnimationTargetCompat.wrap(remoteAnimationTargetArr3), new Runnable() { // from class: com.android.systemui.shared.system.RemoteAnimationAdapterCompat.1.1
                    @Override // java.lang.Runnable
                    public void run() {
                        try {
                            iRemoteAnimationFinishedCallback.onAnimationFinished();
                        } catch (RemoteException e) {
                            Log.e("ActivityOptionsCompat", "Failed to call app controlled animation finished callback", e);
                        }
                    }
                });
            }
        };
    }

    private static IRemoteTransition.Stub wrapRemoteTransition(final RemoteAnimationRunnerCompat remoteAnimationRunnerCompat) {
        return new IRemoteTransition.Stub() { // from class: com.android.systemui.shared.system.RemoteAnimationAdapterCompat.2
            public void mergeAnimation(IBinder iBinder, TransitionInfo transitionInfo, SurfaceControl.Transaction transaction, IBinder iBinder2, IRemoteTransitionFinishedCallback iRemoteTransitionFinishedCallback) {
            }

            public void startAnimation(IBinder iBinder, final TransitionInfo transitionInfo, SurfaceControl.Transaction transaction, final IRemoteTransitionFinishedCallback iRemoteTransitionFinishedCallback) {
                final ArrayMap arrayMap = new ArrayMap();
                RemoteAnimationTargetCompat[] wrap = RemoteAnimationTargetCompat.wrap(transitionInfo, false, transaction, arrayMap);
                RemoteAnimationTargetCompat[] wrap2 = RemoteAnimationTargetCompat.wrap(transitionInfo, true, transaction, arrayMap);
                RemoteAnimationTargetCompat[] remoteAnimationTargetCompatArr = new RemoteAnimationTargetCompat[0];
                int i = 0;
                int i2 = 0;
                boolean z = false;
                float f = 0.0f;
                float f2 = 0.0f;
                TransitionInfo.Change change = null;
                TransitionInfo.Change change2 = null;
                for (int size = transitionInfo.getChanges().size() - 1; size >= 0; size--) {
                    TransitionInfo.Change change3 = (TransitionInfo.Change) transitionInfo.getChanges().get(size);
                    if (change3.getTaskInfo() != null && change3.getTaskInfo().getActivityType() == 2) {
                        if (change3.getMode() == 1 || change3.getMode() == 3) {
                            z = true;
                        } else {
                            z = false;
                        }
                        i = transitionInfo.getChanges().size() - size;
                        change = change3;
                    } else if ((change3.getFlags() & 2) != 0) {
                        change2 = change3;
                    }
                    if (change3.getParent() == null && change3.getEndRotation() >= 0 && change3.getEndRotation() != change3.getStartRotation()) {
                        i2 = change3.getEndRotation() - change3.getStartRotation();
                        f2 = change3.getEndAbsBounds().height();
                        f = change3.getEndAbsBounds().width();
                    }
                }
                final CounterRotator counterRotator = new CounterRotator();
                final CounterRotator counterRotator2 = new CounterRotator();
                if (change != null && i2 != 0 && change.getParent() != null) {
                    int i3 = i;
                    counterRotator.setup(transaction, transitionInfo.getChange(change.getParent()).getLeash(), i2, f, f2);
                    SurfaceControl surfaceControl = counterRotator.mSurface;
                    if (surfaceControl != null) {
                        transaction.setLayer(surfaceControl, i3);
                    }
                }
                if (z) {
                    SurfaceControl surfaceControl2 = counterRotator.mSurface;
                    if (surfaceControl2 != null) {
                        transaction.setLayer(surfaceControl2, transitionInfo.getChanges().size() * 3);
                    }
                    for (int size2 = transitionInfo.getChanges().size() - 1; size2 >= 0; size2--) {
                        TransitionInfo.Change change4 = (TransitionInfo.Change) transitionInfo.getChanges().get(size2);
                        SurfaceControl surfaceControl3 = (SurfaceControl) arrayMap.get(change4.getLeash());
                        int mode = ((TransitionInfo.Change) transitionInfo.getChanges().get(size2)).getMode();
                        if (TransitionInfo.isIndependent(change4, transitionInfo) && (mode == 2 || mode == 4)) {
                            transaction.setLayer(surfaceControl3, (transitionInfo.getChanges().size() * 3) - size2);
                            SurfaceControl surfaceControl4 = counterRotator.mSurface;
                            if (surfaceControl4 != null) {
                                transaction.reparent(surfaceControl3, surfaceControl4);
                            }
                        }
                    }
                    for (int length = wrap2.length - 1; length >= 0; length--) {
                        transaction.show(wrap2[length].leash);
                        transaction.setAlpha(wrap2[length].leash, 1.0f);
                    }
                } else {
                    if (change != null) {
                        SurfaceControl surfaceControl5 = (SurfaceControl) arrayMap.get(change.getLeash());
                        SurfaceControl surfaceControl6 = counterRotator.mSurface;
                        if (surfaceControl6 != null) {
                            transaction.reparent(surfaceControl5, surfaceControl6);
                        }
                    }
                    if (!(change2 == null || i2 == 0 || change2.getParent() == null)) {
                        counterRotator2.setup(transaction, transitionInfo.getChange(change2.getParent()).getLeash(), i2, f, f2);
                        SurfaceControl surfaceControl7 = counterRotator2.mSurface;
                        if (surfaceControl7 != null) {
                            transaction.setLayer(surfaceControl7, -1);
                            SurfaceControl surfaceControl8 = (SurfaceControl) arrayMap.get(change2.getLeash());
                            SurfaceControl surfaceControl9 = counterRotator2.mSurface;
                            if (surfaceControl9 != null) {
                                transaction.reparent(surfaceControl8, surfaceControl9);
                            }
                        }
                    }
                }
                transaction.apply();
                RemoteAnimationRunnerCompat.this.onAnimationStart(0, wrap, wrap2, remoteAnimationTargetCompatArr, new Runnable() { // from class: com.android.systemui.shared.system.RemoteAnimationAdapterCompat.2.1
                    @Override // java.lang.Runnable
                    @SuppressLint({"NewApi"})
                    public void run() {
                        SurfaceControl.Transaction transaction2 = new SurfaceControl.Transaction();
                        SurfaceControl surfaceControl10 = counterRotator.mSurface;
                        if (surfaceControl10 != null) {
                            transaction2.remove(surfaceControl10);
                        }
                        SurfaceControl surfaceControl11 = counterRotator2.mSurface;
                        if (surfaceControl11 != null) {
                            transaction2.remove(surfaceControl11);
                        }
                        int size3 = transitionInfo.getChanges().size();
                        while (true) {
                            size3--;
                            if (size3 < 0) {
                                break;
                            }
                            ((TransitionInfo.Change) transitionInfo.getChanges().get(size3)).getLeash().release();
                        }
                        int size4 = arrayMap.size();
                        while (true) {
                            size4--;
                            if (size4 >= 0) {
                                ((SurfaceControl) arrayMap.valueAt(size4)).release();
                            } else {
                                try {
                                    iRemoteTransitionFinishedCallback.onTransitionFinished((WindowContainerTransaction) null, transaction2);
                                    return;
                                } catch (RemoteException e) {
                                    Log.e("ActivityOptionsCompat", "Failed to call app controlled animation finished callback", e);
                                    return;
                                }
                            }
                        }
                    }
                });
            }
        };
    }

    public RemoteAnimationAdapterCompat(RemoteAnimationRunnerCompat remoteAnimationRunnerCompat, long j, long j2, IApplicationThread iApplicationThread) {
        this.mWrapped = new RemoteAnimationAdapter(wrapRemoteAnimationRunner(remoteAnimationRunnerCompat), j, j2);
        this.mRemoteTransition = buildRemoteTransition(remoteAnimationRunnerCompat, iApplicationThread);
    }

    public RemoteTransitionCompat getRemoteTransition() {
        return this.mRemoteTransition;
    }

    public RemoteAnimationAdapter getWrapped() {
        return this.mWrapped;
    }
}
