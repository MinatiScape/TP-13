package com.android.systemui.shared.system;

import android.annotation.NonNull;
import android.annotation.SuppressLint;
import android.app.ActivityManager;
import android.app.ActivityTaskManager;
import android.app.IApplicationThread;
import android.app.PictureInPictureParams;
import android.content.ComponentName;
import android.graphics.Rect;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.RemoteException;
import android.util.ArrayMap;
import android.util.Log;
import android.view.SurfaceControl;
import android.window.IRemoteTransition;
import android.window.IRemoteTransitionFinishedCallback;
import android.window.PictureInPictureSurfaceTransaction;
import android.window.RemoteTransition;
import android.window.TransitionFilter;
import android.window.TransitionInfo;
import android.window.WindowContainerToken;
import android.window.WindowContainerTransaction;
import com.android.internal.annotations.VisibleForTesting;
import com.android.internal.util.AnnotationValidations;
import com.android.systemui.shared.recents.model.ThumbnailData;
import java.util.ArrayList;
import java.util.concurrent.Executor;
/* loaded from: classes.dex */
public class RemoteTransitionCompat implements Parcelable {
    public static final Parcelable.Creator<RemoteTransitionCompat> CREATOR = new Parcelable.Creator<RemoteTransitionCompat>() { // from class: com.android.systemui.shared.system.RemoteTransitionCompat.3
        @Override // android.os.Parcelable.Creator
        public RemoteTransitionCompat createFromParcel(Parcel parcel) {
            return new RemoteTransitionCompat(parcel);
        }

        @Override // android.os.Parcelable.Creator
        public RemoteTransitionCompat[] newArray(int i) {
            return new RemoteTransitionCompat[i];
        }
    };
    private static final String TAG = "RemoteTransitionCompat";
    public TransitionFilter mFilter;
    public final RemoteTransition mTransition;

    /* renamed from: com.android.systemui.shared.system.RemoteTransitionCompat$1 */
    /* loaded from: classes.dex */
    public class AnonymousClass1 extends IRemoteTransition.Stub {
        public final /* synthetic */ Executor val$executor;
        public final /* synthetic */ RemoteTransitionRunner val$runner;

        public AnonymousClass1(Executor executor, RemoteTransitionRunner remoteTransitionRunner) {
            RemoteTransitionCompat.this = r1;
            this.val$executor = executor;
            this.val$runner = remoteTransitionRunner;
        }

        public static /* synthetic */ void lambda$mergeAnimation$2(IRemoteTransitionFinishedCallback iRemoteTransitionFinishedCallback) {
            try {
                iRemoteTransitionFinishedCallback.onTransitionFinished((WindowContainerTransaction) null, (SurfaceControl.Transaction) null);
            } catch (RemoteException e) {
                Log.e(RemoteTransitionCompat.TAG, "Failed to call transition finished callback", e);
            }
        }

        public static /* synthetic */ void lambda$startAnimation$0(IRemoteTransitionFinishedCallback iRemoteTransitionFinishedCallback) {
            try {
                iRemoteTransitionFinishedCallback.onTransitionFinished((WindowContainerTransaction) null, (SurfaceControl.Transaction) null);
            } catch (RemoteException e) {
                Log.e(RemoteTransitionCompat.TAG, "Failed to call transition finished callback", e);
            }
        }

        public void mergeAnimation(final IBinder iBinder, final TransitionInfo transitionInfo, final SurfaceControl.Transaction transaction, final IBinder iBinder2, IRemoteTransitionFinishedCallback iRemoteTransitionFinishedCallback) {
            final RemoteTransitionCompat$1$$ExternalSyntheticLambda0 remoteTransitionCompat$1$$ExternalSyntheticLambda0 = new RemoteTransitionCompat$1$$ExternalSyntheticLambda0(iRemoteTransitionFinishedCallback, 0);
            Executor executor = this.val$executor;
            final RemoteTransitionRunner remoteTransitionRunner = this.val$runner;
            executor.execute(new Runnable() { // from class: com.android.systemui.shared.system.RemoteTransitionCompat$1$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    RemoteTransitionRunner.this.mergeAnimation(iBinder, transitionInfo, transaction, iBinder2, remoteTransitionCompat$1$$ExternalSyntheticLambda0);
                }
            });
        }

        public void startAnimation(final IBinder iBinder, final TransitionInfo transitionInfo, final SurfaceControl.Transaction transaction, IRemoteTransitionFinishedCallback iRemoteTransitionFinishedCallback) {
            final RemoteTransitionCompat$1$$ExternalSyntheticLambda0 remoteTransitionCompat$1$$ExternalSyntheticLambda0 = new RemoteTransitionCompat$1$$ExternalSyntheticLambda0(iRemoteTransitionFinishedCallback, 1);
            Executor executor = this.val$executor;
            final RemoteTransitionRunner remoteTransitionRunner = this.val$runner;
            executor.execute(new Runnable() { // from class: com.android.systemui.shared.system.RemoteTransitionCompat$1$$ExternalSyntheticLambda2
                @Override // java.lang.Runnable
                public final void run() {
                    RemoteTransitionRunner.this.startAnimation(iBinder, transitionInfo, transaction, remoteTransitionCompat$1$$ExternalSyntheticLambda0);
                }
            });
        }
    }

    /* loaded from: classes.dex */
    public static class Builder {
        private long mBuilderFieldsSet = 0;
        private TransitionFilter mFilter;
        private RemoteTransition mTransition;

        public Builder(RemoteTransition remoteTransition) {
            this.mTransition = remoteTransition;
            AnnotationValidations.validate(NonNull.class, (NonNull) null, remoteTransition);
        }

        private void checkNotUsed() {
            if ((this.mBuilderFieldsSet & 4) != 0) {
                throw new IllegalStateException("This Builder should not be reused. Use a new Builder instance instead");
            }
        }

        public RemoteTransitionCompat build() {
            checkNotUsed();
            long j = this.mBuilderFieldsSet | 4;
            this.mBuilderFieldsSet = j;
            if ((j & 2) == 0) {
                this.mFilter = null;
            }
            return new RemoteTransitionCompat(this.mTransition, this.mFilter);
        }

        public Builder setFilter(TransitionFilter transitionFilter) {
            checkNotUsed();
            this.mBuilderFieldsSet |= 2;
            this.mFilter = transitionFilter;
            return this;
        }

        public Builder setTransition(RemoteTransition remoteTransition) {
            checkNotUsed();
            this.mBuilderFieldsSet |= 1;
            this.mTransition = remoteTransition;
            return this;
        }
    }

    @VisibleForTesting
    /* loaded from: classes.dex */
    public static class RecentsControllerWrap extends RecentsAnimationControllerCompat {
        private RecentsAnimationControllerCompat mWrapped = null;
        private IRemoteTransitionFinishedCallback mFinishCB = null;
        private ArrayList<WindowContainerToken> mPausingTasks = null;
        private WindowContainerToken mPipTask = null;
        private TransitionInfo mInfo = null;
        private ArrayList<SurfaceControl> mOpeningLeashes = null;
        private ArrayMap<SurfaceControl, SurfaceControl> mLeashMap = null;
        private PictureInPictureSurfaceTransaction mPipTransaction = null;
        private IBinder mTransition = null;

        @Override // com.android.systemui.shared.system.RecentsAnimationControllerCompat
        public void animateNavigationBarToApp(long j) {
        }

        @Override // com.android.systemui.shared.system.RecentsAnimationControllerCompat
        public void cleanupScreenshot() {
            RecentsAnimationControllerCompat recentsAnimationControllerCompat = this.mWrapped;
            if (recentsAnimationControllerCompat != null) {
                recentsAnimationControllerCompat.cleanupScreenshot();
            }
        }

        @Override // com.android.systemui.shared.system.RecentsAnimationControllerCompat
        public void detachNavigationBarFromApp(boolean z) {
            try {
                ActivityTaskManager.getService().detachNavigationBarFromApp(this.mTransition);
            } catch (RemoteException e) {
                Log.e(RemoteTransitionCompat.TAG, "Failed to detach the navigation bar from app", e);
            }
        }

        /* JADX WARN: Removed duplicated region for block: B:37:0x00e3  */
        /* JADX WARN: Removed duplicated region for block: B:44:0x010f A[LOOP:3: B:42:0x0103->B:44:0x010f, LOOP_END] */
        @Override // com.android.systemui.shared.system.RecentsAnimationControllerCompat
        @android.annotation.SuppressLint({"NewApi"})
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public void finish(boolean r8, boolean r9) {
            /*
                Method dump skipped, instructions count: 308
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.android.systemui.shared.system.RemoteTransitionCompat.RecentsControllerWrap.finish(boolean, boolean):void");
        }

        @Override // com.android.systemui.shared.system.RecentsAnimationControllerCompat
        public void hideCurrentInputMethod() {
            this.mWrapped.hideCurrentInputMethod();
        }

        @SuppressLint({"NewApi"})
        public boolean merge(TransitionInfo transitionInfo, SurfaceControl.Transaction transaction, RecentsAnimationListener recentsAnimationListener) {
            ArrayList arrayList = null;
            for (int size = transitionInfo.getChanges().size() - 1; size >= 0; size--) {
                TransitionInfo.Change change = (TransitionInfo.Change) transitionInfo.getChanges().get(size);
                if ((change.getMode() == 1 || change.getMode() == 3) && change.getTaskInfo() != null) {
                    if (arrayList == null) {
                        arrayList = new ArrayList();
                    }
                    arrayList.add(change);
                }
            }
            if (arrayList == null) {
                return false;
            }
            int i = 0;
            for (int i2 = 0; i2 < arrayList.size(); i2++) {
                if (this.mPausingTasks.contains(((TransitionInfo.Change) arrayList.get(i2)).getContainer())) {
                    i++;
                }
                ((TransitionInfo.Change) arrayList.get(i2)).getContainer().equals(this.mPausingTasks.get(i2));
            }
            if (i <= 0) {
                int size2 = this.mInfo.getChanges().size() * 3;
                this.mOpeningLeashes = new ArrayList<>();
                RemoteAnimationTargetCompat[] remoteAnimationTargetCompatArr = new RemoteAnimationTargetCompat[arrayList.size()];
                for (int i3 = 0; i3 < arrayList.size(); i3++) {
                    this.mOpeningLeashes.add(((TransitionInfo.Change) arrayList.get(i3)).getLeash());
                    RemoteAnimationTargetCompat remoteAnimationTargetCompat = new RemoteAnimationTargetCompat((TransitionInfo.Change) arrayList.get(i3), size2, this.mInfo, transaction);
                    this.mLeashMap.put(this.mOpeningLeashes.get(i3), remoteAnimationTargetCompat.leash.mSurfaceControl);
                    transaction.reparent(remoteAnimationTargetCompat.leash.mSurfaceControl, this.mInfo.getRootLeash());
                    transaction.setLayer(remoteAnimationTargetCompat.leash.mSurfaceControl, size2);
                    transaction.hide(remoteAnimationTargetCompat.leash.mSurfaceControl);
                    transaction.apply();
                    remoteAnimationTargetCompatArr[i3] = remoteAnimationTargetCompat;
                }
                recentsAnimationListener.onTasksAppeared(remoteAnimationTargetCompatArr);
                return true;
            } else if (i == this.mPausingTasks.size()) {
                return true;
            } else {
                throw new IllegalStateException("\"Concelling\" a recents transitions by unpausing " + i + " apps after pausing " + this.mPausingTasks.size() + " apps.");
            }
        }

        @Override // com.android.systemui.shared.system.RecentsAnimationControllerCompat
        public boolean removeTask(int i) {
            RecentsAnimationControllerCompat recentsAnimationControllerCompat = this.mWrapped;
            if (recentsAnimationControllerCompat != null) {
                return recentsAnimationControllerCompat.removeTask(i);
            }
            return false;
        }

        @Override // com.android.systemui.shared.system.RecentsAnimationControllerCompat
        public ThumbnailData screenshotTask(int i) {
            RecentsAnimationControllerCompat recentsAnimationControllerCompat = this.mWrapped;
            if (recentsAnimationControllerCompat != null) {
                return recentsAnimationControllerCompat.screenshotTask(i);
            }
            return null;
        }

        @Override // com.android.systemui.shared.system.RecentsAnimationControllerCompat
        public void setAnimationTargetsBehindSystemBars(boolean z) {
            RecentsAnimationControllerCompat recentsAnimationControllerCompat = this.mWrapped;
            if (recentsAnimationControllerCompat != null) {
                recentsAnimationControllerCompat.setAnimationTargetsBehindSystemBars(z);
            }
        }

        @Override // com.android.systemui.shared.system.RecentsAnimationControllerCompat
        public void setDeferCancelUntilNextTransition(boolean z, boolean z2) {
            RecentsAnimationControllerCompat recentsAnimationControllerCompat = this.mWrapped;
            if (recentsAnimationControllerCompat != null) {
                recentsAnimationControllerCompat.setDeferCancelUntilNextTransition(z, z2);
            }
        }

        @Override // com.android.systemui.shared.system.RecentsAnimationControllerCompat
        public void setFinishTaskTransaction(int i, PictureInPictureSurfaceTransaction pictureInPictureSurfaceTransaction, SurfaceControl surfaceControl) {
            this.mPipTransaction = pictureInPictureSurfaceTransaction;
            RecentsAnimationControllerCompat recentsAnimationControllerCompat = this.mWrapped;
            if (recentsAnimationControllerCompat != null) {
                recentsAnimationControllerCompat.setFinishTaskTransaction(i, pictureInPictureSurfaceTransaction, surfaceControl);
            }
        }

        @Override // com.android.systemui.shared.system.RecentsAnimationControllerCompat
        public void setInputConsumerEnabled(boolean z) {
            RecentsAnimationControllerCompat recentsAnimationControllerCompat = this.mWrapped;
            if (recentsAnimationControllerCompat != null) {
                recentsAnimationControllerCompat.setInputConsumerEnabled(z);
            }
        }

        @Override // com.android.systemui.shared.system.RecentsAnimationControllerCompat
        public void setWillFinishToHome(boolean z) {
            RecentsAnimationControllerCompat recentsAnimationControllerCompat = this.mWrapped;
            if (recentsAnimationControllerCompat != null) {
                recentsAnimationControllerCompat.setWillFinishToHome(z);
            }
        }

        public void setup(RecentsAnimationControllerCompat recentsAnimationControllerCompat, TransitionInfo transitionInfo, IRemoteTransitionFinishedCallback iRemoteTransitionFinishedCallback, ArrayList<WindowContainerToken> arrayList, WindowContainerToken windowContainerToken, ArrayMap<SurfaceControl, SurfaceControl> arrayMap, IBinder iBinder) {
            if (this.mInfo == null) {
                this.mWrapped = recentsAnimationControllerCompat;
                this.mInfo = transitionInfo;
                this.mFinishCB = iRemoteTransitionFinishedCallback;
                this.mPausingTasks = arrayList;
                this.mPipTask = windowContainerToken;
                this.mLeashMap = arrayMap;
                this.mTransition = iBinder;
                return;
            }
            throw new IllegalStateException("Trying to run a new recents animation while recents is already active.");
        }
    }

    public RemoteTransitionCompat(RemoteTransition remoteTransition) {
        this.mFilter = null;
        this.mTransition = remoteTransition;
    }

    @Deprecated
    private void __metadata() {
    }

    public void addHomeOpenCheck(ComponentName componentName) {
        if (this.mFilter == null) {
            this.mFilter = new TransitionFilter();
        }
        TransitionFilter transitionFilter = this.mFilter;
        transitionFilter.mNotFlags = 256;
        transitionFilter.mRequirements = new TransitionFilter.Requirement[]{new TransitionFilter.Requirement(), new TransitionFilter.Requirement()};
        TransitionFilter.Requirement[] requirementArr = this.mFilter.mRequirements;
        requirementArr[0].mActivityType = 2;
        requirementArr[0].mTopActivity = componentName;
        requirementArr[0].mModes = new int[]{1, 3};
        requirementArr[0].mOrder = 1;
        requirementArr[1].mActivityType = 1;
        requirementArr[1].mModes = new int[]{2, 4};
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public TransitionFilter getFilter() {
        return this.mFilter;
    }

    public RemoteTransition getTransition() {
        return this.mTransition;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeByte(this.mFilter != null ? (byte) 2 : (byte) 0);
        parcel.writeTypedObject(this.mTransition, i);
        TransitionFilter transitionFilter = this.mFilter;
        if (transitionFilter != null) {
            parcel.writeTypedObject(transitionFilter, i);
        }
    }

    public RemoteTransitionCompat(RemoteTransitionRunner remoteTransitionRunner, Executor executor, IApplicationThread iApplicationThread) {
        this.mFilter = null;
        this.mTransition = new RemoteTransition(new AnonymousClass1(executor, remoteTransitionRunner), iApplicationThread);
    }

    public RemoteTransitionCompat(final RecentsAnimationListener recentsAnimationListener, final RecentsAnimationControllerCompat recentsAnimationControllerCompat, IApplicationThread iApplicationThread) {
        this.mFilter = null;
        this.mTransition = new RemoteTransition(new IRemoteTransition.Stub() { // from class: com.android.systemui.shared.system.RemoteTransitionCompat.2
            public final RecentsControllerWrap mRecentsSession = new RecentsControllerWrap();
            public IBinder mToken = null;

            {
                RemoteTransitionCompat.this = this;
            }

            public void mergeAnimation(IBinder iBinder, TransitionInfo transitionInfo, SurfaceControl.Transaction transaction, IBinder iBinder2, IRemoteTransitionFinishedCallback iRemoteTransitionFinishedCallback) {
                if (iBinder2.equals(this.mToken) && this.mRecentsSession.merge(transitionInfo, transaction, recentsAnimationListener)) {
                    try {
                        iRemoteTransitionFinishedCallback.onTransitionFinished((WindowContainerTransaction) null, (SurfaceControl.Transaction) null);
                    } catch (RemoteException e) {
                        Log.e(RemoteTransitionCompat.TAG, "Error merging transition.", e);
                    }
                }
            }

            public void startAnimation(IBinder iBinder, TransitionInfo transitionInfo, SurfaceControl.Transaction transaction, IRemoteTransitionFinishedCallback iRemoteTransitionFinishedCallback) {
                ArrayMap<SurfaceControl, SurfaceControl> arrayMap = new ArrayMap<>();
                RemoteAnimationTargetCompat[] wrap = RemoteAnimationTargetCompat.wrap(transitionInfo, false, transaction, arrayMap);
                RemoteAnimationTargetCompat[] wrap2 = RemoteAnimationTargetCompat.wrap(transitionInfo, true, transaction, arrayMap);
                this.mToken = iBinder;
                ArrayList<WindowContainerToken> arrayList = new ArrayList<>();
                WindowContainerToken windowContainerToken = null;
                for (int size = transitionInfo.getChanges().size() - 1; size >= 0; size--) {
                    TransitionInfo.Change change = (TransitionInfo.Change) transitionInfo.getChanges().get(size);
                    if (change.getMode() == 2 || change.getMode() == 4) {
                        transaction.setLayer(arrayMap.get(change.getLeash()), (transitionInfo.getChanges().size() * 3) - size);
                        ActivityManager.RunningTaskInfo taskInfo = change.getTaskInfo();
                        if (taskInfo != null) {
                            arrayList.add(0, taskInfo.token);
                            PictureInPictureParams pictureInPictureParams = taskInfo.pictureInPictureParams;
                            if (pictureInPictureParams != null && pictureInPictureParams.isAutoEnterEnabled()) {
                                windowContainerToken = taskInfo.token;
                            }
                        }
                    }
                }
                for (int length = wrap2.length - 1; length >= 0; length--) {
                    transaction.setAlpha(wrap2[length].leash.mSurfaceControl, 1.0f);
                }
                transaction.apply();
                this.mRecentsSession.setup(recentsAnimationControllerCompat, transitionInfo, iRemoteTransitionFinishedCallback, arrayList, windowContainerToken, arrayMap, this.mToken);
                recentsAnimationListener.onAnimationStart(this.mRecentsSession, wrap, wrap2, new Rect(0, 0, 0, 0), new Rect());
            }
        }, iApplicationThread);
    }

    public RemoteTransitionCompat(RemoteTransition remoteTransition, TransitionFilter transitionFilter) {
        this.mFilter = null;
        this.mTransition = remoteTransition;
        AnnotationValidations.validate(NonNull.class, (NonNull) null, remoteTransition);
        this.mFilter = transitionFilter;
    }

    public RemoteTransitionCompat(Parcel parcel) {
        this.mFilter = null;
        byte readByte = parcel.readByte();
        RemoteTransition remoteTransition = (RemoteTransition) parcel.readTypedObject(RemoteTransition.CREATOR);
        TransitionFilter transitionFilter = (readByte & 2) == 0 ? null : (TransitionFilter) parcel.readTypedObject(TransitionFilter.CREATOR);
        this.mTransition = remoteTransition;
        AnnotationValidations.validate(NonNull.class, (NonNull) null, remoteTransition);
        this.mFilter = transitionFilter;
    }
}
