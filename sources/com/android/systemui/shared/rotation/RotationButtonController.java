package com.android.systemui.shared.rotation;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.annotation.SuppressLint;
import android.app.ActivityManager;
import android.content.ContentResolver;
import android.content.Context;
import android.graphics.drawable.AnimatedVectorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.os.RemoteException;
import android.provider.Settings;
import android.util.Log;
import android.view.IRotationWatcher;
import android.view.MotionEvent;
import android.view.View;
import android.view.WindowManagerGlobal;
import android.view.accessibility.AccessibilityManager;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;
import com.android.internal.logging.UiEventLogger;
import com.android.internal.logging.UiEventLoggerImpl;
import com.android.internal.view.RotationPolicy;
import com.android.systemui.shared.recents.utilities.Utilities;
import com.android.systemui.shared.recents.utilities.ViewRippler;
import com.android.systemui.shared.rotation.RotationButton;
import com.android.systemui.shared.rotation.RotationButtonController;
import com.android.systemui.shared.system.ActivityManagerWrapper;
import com.android.systemui.shared.system.TaskStackChangeListener;
import com.android.systemui.shared.system.TaskStackChangeListeners;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.android.wallpaper.picker.AppbarFragment$$ExternalSyntheticLambda0;
import java.util.Optional;
import java.util.function.Consumer;
import java.util.function.Supplier;
/* loaded from: classes.dex */
public class RotationButtonController {
    private static final int BUTTON_FADE_IN_OUT_DURATION_MS = 100;
    private static final Interpolator LINEAR_INTERPOLATOR = new LinearInterpolator();
    private static final int NAVBAR_HIDDEN_PENDING_ICON_TIMEOUT_MS = 20000;
    private static final int NUM_ACCEPTED_ROTATION_SUGGESTIONS_FOR_INTRODUCTION = 3;
    private static final String TAG = "StatusBar/RotationButtonController";
    private final AccessibilityManager mAccessibilityManager;
    private final Context mContext;
    private final int mDarkIconColor;
    private boolean mHomeRotationEnabled;
    private boolean mHoveringRotationSuggestion;
    private final int mIconCcwStart0ResId;
    private final int mIconCcwStart90ResId;
    private final int mIconCwStart0ResId;
    private final int mIconCwStart90ResId;
    private int mIconResId;
    private boolean mIsNavigationBarShowing;
    private boolean mIsRecentsAnimationRunning;
    private int mLastRotationSuggestion;
    private final int mLightIconColor;
    private boolean mPendingRotationSuggestion;
    private Consumer<Integer> mRotWatcherListener;
    private Animator mRotateHideAnimator;
    private RotationButton mRotationButton;
    private boolean mSkipOverrideUserLockPrefsOnce;
    private final Supplier<Integer> mWindowRotationProvider;
    private final Handler mMainThreadHandler = new Handler(Looper.getMainLooper());
    private final UiEventLogger mUiEventLogger = new UiEventLoggerImpl();
    private final ViewRippler mViewRippler = new ViewRippler();
    private boolean mListenersRegistered = false;
    @SuppressLint({"InlinedApi"})
    private int mBehavior = 1;
    private final Runnable mRemoveRotationProposal = new Runnable(this) { // from class: com.android.systemui.shared.rotation.RotationButtonController$$ExternalSyntheticLambda1
        public final /* synthetic */ RotationButtonController f$0;

        {
            this.f$0 = this;
        }

        @Override // java.lang.Runnable
        public final void run() {
            switch (r2) {
                case 0:
                    this.f$0.lambda$new$0();
                    return;
                default:
                    this.f$0.lambda$new$1();
                    return;
            }
        }
    };
    private final Runnable mCancelPendingRotationProposal = new Runnable(this) { // from class: com.android.systemui.shared.rotation.RotationButtonController$$ExternalSyntheticLambda1
        public final /* synthetic */ RotationButtonController f$0;

        {
            this.f$0 = this;
        }

        @Override // java.lang.Runnable
        public final void run() {
            switch (r2) {
                case 0:
                    this.f$0.lambda$new$0();
                    return;
                default:
                    this.f$0.lambda$new$1();
                    return;
            }
        }
    };
    private final IRotationWatcher.Stub mRotationWatcher = new AnonymousClass1();
    private final TaskStackListenerImpl mTaskStackListener = new TaskStackListenerImpl(this, null);

    /* renamed from: com.android.systemui.shared.rotation.RotationButtonController$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass1 extends IRotationWatcher.Stub {
        public AnonymousClass1() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$onRotationChanged$0(int i) {
            if (RotationButtonController.this.isRotationLocked()) {
                if (RotationButtonController.this.shouldOverrideUserLockPrefs(i)) {
                    RotationButtonController.this.setRotationLockedAtAngle(i);
                }
                RotationButtonController.this.setRotateSuggestionButtonState(false, true);
            }
            if (RotationButtonController.this.mRotWatcherListener != null) {
                RotationButtonController.this.mRotWatcherListener.accept(Integer.valueOf(i));
            }
        }

        public void onRotationChanged(int i) {
            RotationButtonController.this.mMainThreadHandler.postAtFrontOfQueue(new RotationButtonController$1$$ExternalSyntheticLambda0(this, i));
        }
    }

    /* loaded from: classes.dex */
    public enum RotationButtonEvent implements UiEventLogger.UiEventEnum {
        ROTATION_SUGGESTION_SHOWN(206),
        ROTATION_SUGGESTION_ACCEPTED(207);
        
        private final int mId;

        RotationButtonEvent(int i) {
            this.mId = i;
        }

        public int getId() {
            return this.mId;
        }
    }

    /* loaded from: classes.dex */
    public class TaskStackListenerImpl extends TaskStackChangeListener {
        private TaskStackListenerImpl() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$onActivityRequestedOrientationChanged$0(int i, ActivityManager.RunningTaskInfo runningTaskInfo) {
            if (runningTaskInfo.id == i) {
                RotationButtonController.this.setRotateSuggestionButtonState(false);
            }
        }

        @Override // com.android.systemui.shared.system.TaskStackChangeListener
        public void onActivityRequestedOrientationChanged(final int i, int i2) {
            Optional.ofNullable(ActivityManagerWrapper.getInstance()).map(RotationButtonController$TaskStackListenerImpl$$ExternalSyntheticLambda1.INSTANCE).ifPresent(new Consumer() { // from class: com.android.systemui.shared.rotation.RotationButtonController$TaskStackListenerImpl$$ExternalSyntheticLambda0
                @Override // java.util.function.Consumer
                public final void accept(Object obj) {
                    RotationButtonController.TaskStackListenerImpl.this.lambda$onActivityRequestedOrientationChanged$0(i, (ActivityManager.RunningTaskInfo) obj);
                }
            });
        }

        @Override // com.android.systemui.shared.system.TaskStackChangeListener
        public void onTaskMovedToFront(int i) {
            RotationButtonController.this.setRotateSuggestionButtonState(false);
        }

        @Override // com.android.systemui.shared.system.TaskStackChangeListener
        public void onTaskRemoved(int i) {
            RotationButtonController.this.setRotateSuggestionButtonState(false);
        }

        @Override // com.android.systemui.shared.system.TaskStackChangeListener
        public void onTaskStackChanged() {
            RotationButtonController.this.setRotateSuggestionButtonState(false);
        }

        public /* synthetic */ TaskStackListenerImpl(RotationButtonController rotationButtonController, AnonymousClass1 r2) {
            this();
        }
    }

    public RotationButtonController(Context context, int i, int i2, int i3, int i4, int i5, int i6, Supplier<Integer> supplier) {
        this.mContext = context;
        this.mLightIconColor = i;
        this.mDarkIconColor = i2;
        this.mIconCcwStart0ResId = i3;
        this.mIconCcwStart90ResId = i4;
        this.mIconCwStart0ResId = i5;
        this.mIconCwStart90ResId = i6;
        this.mIconResId = i4;
        this.mAccessibilityManager = AccessibilityManager.getInstance(context);
        this.mWindowRotationProvider = supplier;
    }

    @SuppressLint({"InlinedApi"})
    private boolean canShowRotationButton() {
        return this.mIsNavigationBarShowing || this.mBehavior == 1;
    }

    private int computeRotationProposalTimeout() {
        return this.mAccessibilityManager.getRecommendedTimeoutMillis(this.mHoveringRotationSuggestion ? 16000 : 5000, 4);
    }

    public static boolean hasDisable2RotateSuggestionFlag(int i) {
        return (i & 16) != 0;
    }

    private void incrementNumAcceptedRotationSuggestionsIfNeeded() {
        ContentResolver contentResolver = this.mContext.getContentResolver();
        int i = Settings.Secure.getInt(contentResolver, "num_rotation_suggestions_accepted", 0);
        if (i < 3) {
            Settings.Secure.putInt(contentResolver, "num_rotation_suggestions_accepted", i + 1);
        }
    }

    private boolean isRotateSuggestionIntroduced() {
        return Settings.Secure.getInt(this.mContext.getContentResolver(), "num_rotation_suggestions_accepted", 0) >= 3;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$new$0() {
        setRotateSuggestionButtonState(false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$new$1() {
        this.mPendingRotationSuggestion = false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onRotateSuggestionClick(View view) {
        this.mUiEventLogger.log(RotationButtonEvent.ROTATION_SUGGESTION_ACCEPTED);
        incrementNumAcceptedRotationSuggestionsIfNeeded();
        setRotationLockedAtAngle(this.mLastRotationSuggestion);
        view.performHapticFeedback(1);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean onRotateSuggestionHover(View view, MotionEvent motionEvent) {
        int actionMasked = motionEvent.getActionMasked();
        this.mHoveringRotationSuggestion = actionMasked == 9 || actionMasked == 7;
        rescheduleRotationTimeout(true);
        return false;
    }

    private void onRotationSuggestionsDisabled() {
        setRotateSuggestionButtonState(false, true);
        this.mMainThreadHandler.removeCallbacks(this.mRemoveRotationProposal);
    }

    private void rescheduleRotationTimeout(boolean z) {
        Animator animator;
        if (!z || (((animator = this.mRotateHideAnimator) == null || !animator.isRunning()) && this.mRotationButton.isVisible())) {
            this.mMainThreadHandler.removeCallbacks(this.mRemoveRotationProposal);
            this.mMainThreadHandler.postDelayed(this.mRemoveRotationProposal, computeRotationProposalTimeout());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean shouldOverrideUserLockPrefs(int i) {
        if (!this.mSkipOverrideUserLockPrefsOnce) {
            return i == 0;
        }
        this.mSkipOverrideUserLockPrefsOnce = false;
        return false;
    }

    private void showAndLogRotationSuggestion() {
        setRotateSuggestionButtonState(true);
        rescheduleRotationTimeout(false);
        this.mUiEventLogger.log(RotationButtonEvent.ROTATION_SUGGESTION_SHOWN);
    }

    private void showPendingRotationButtonIfNeeded() {
        if (canShowRotationButton() && this.mPendingRotationSuggestion) {
            showAndLogRotationSuggestion();
        }
    }

    private void updateRotationButtonStateInOverview() {
        if (this.mIsRecentsAnimationRunning && !this.mHomeRotationEnabled) {
            setRotateSuggestionButtonState(false, true);
        }
    }

    public Context getContext() {
        return this.mContext;
    }

    public int getDarkIconColor() {
        return this.mDarkIconColor;
    }

    public int getIconResId() {
        return this.mIconResId;
    }

    public int getLightIconColor() {
        return this.mLightIconColor;
    }

    public RotationButton getRotationButton() {
        return this.mRotationButton;
    }

    public void init() {
        registerListeners();
        if (this.mContext.getDisplay().getDisplayId() != 0) {
            onDisable2FlagChanged(16);
        }
    }

    public boolean isRotationLocked() {
        return RotationPolicy.isRotationLocked(this.mContext);
    }

    public void onBehaviorChanged(int i, int i2) {
        if (i == 0 && this.mBehavior != i2) {
            this.mBehavior = i2;
            showPendingRotationButtonIfNeeded();
        }
    }

    public void onDestroy() {
        unregisterListeners();
    }

    public void onDisable2FlagChanged(int i) {
        if (hasDisable2RotateSuggestionFlag(i)) {
            onRotationSuggestionsDisabled();
        }
    }

    public void onNavigationBarWindowVisibilityChange(boolean z) {
        if (this.mIsNavigationBarShowing != z) {
            this.mIsNavigationBarShowing = z;
            showPendingRotationButtonIfNeeded();
        }
    }

    public void onRotationProposal(int i, boolean z) {
        int intValue = this.mWindowRotationProvider.get().intValue();
        if (this.mRotationButton.acceptRotationProposal()) {
            if (!this.mHomeRotationEnabled && this.mIsRecentsAnimationRunning) {
                return;
            }
            if (!z) {
                setRotateSuggestionButtonState(false);
            } else if (i == intValue) {
                this.mMainThreadHandler.removeCallbacks(this.mRemoveRotationProposal);
                setRotateSuggestionButtonState(false);
            } else {
                this.mLastRotationSuggestion = i;
                boolean isRotationAnimationCCW = Utilities.isRotationAnimationCCW(intValue, i);
                if (intValue == 0 || intValue == 2) {
                    this.mIconResId = isRotationAnimationCCW ? this.mIconCcwStart0ResId : this.mIconCwStart0ResId;
                } else {
                    this.mIconResId = isRotationAnimationCCW ? this.mIconCcwStart90ResId : this.mIconCwStart90ResId;
                }
                this.mRotationButton.updateIcon(this.mLightIconColor, this.mDarkIconColor);
                if (canShowRotationButton()) {
                    showAndLogRotationSuggestion();
                    return;
                }
                this.mPendingRotationSuggestion = true;
                this.mMainThreadHandler.removeCallbacks(this.mCancelPendingRotationProposal);
                this.mMainThreadHandler.postDelayed(this.mCancelPendingRotationProposal, 20000L);
            }
        }
    }

    public void onTaskbarStateChange(boolean z, boolean z2) {
        getRotationButton().onTaskbarStateChanged(z, z2);
    }

    public void registerListeners() {
        if (!this.mListenersRegistered) {
            this.mListenersRegistered = true;
            try {
                WindowManagerGlobal.getWindowManagerService().watchRotation(this.mRotationWatcher, 0);
            } catch (RemoteException e) {
                Log.e(TAG, "RegisterListeners caught a RemoteException", e);
                return;
            } catch (IllegalArgumentException unused) {
                this.mListenersRegistered = false;
                Log.w(TAG, "RegisterListeners for the display failed");
            }
            TaskStackChangeListeners.getInstance().registerTaskStackListener(this.mTaskStackListener);
        }
    }

    public void setDarkIntensity(float f) {
        this.mRotationButton.setDarkIntensity(f);
    }

    public void setHomeRotationEnabled(boolean z) {
        this.mHomeRotationEnabled = z;
        updateRotationButtonStateInOverview();
    }

    public void setRecentsAnimationRunning(boolean z) {
        this.mIsRecentsAnimationRunning = z;
        updateRotationButtonStateInOverview();
    }

    public void setRotateSuggestionButtonState(boolean z) {
        setRotateSuggestionButtonState(z, false);
    }

    public void setRotationButton(RotationButton rotationButton, RotationButton.RotationButtonUpdatesCallback rotationButtonUpdatesCallback) {
        this.mRotationButton = rotationButton;
        rotationButton.setRotationButtonController(this);
        this.mRotationButton.setOnClickListener(new AppbarFragment$$ExternalSyntheticLambda0(this));
        this.mRotationButton.setOnHoverListener(new View.OnHoverListener() { // from class: com.android.systemui.shared.rotation.RotationButtonController$$ExternalSyntheticLambda0
            @Override // android.view.View.OnHoverListener
            public final boolean onHover(View view, MotionEvent motionEvent) {
                boolean onRotateSuggestionHover;
                onRotateSuggestionHover = RotationButtonController.this.onRotateSuggestionHover(view, motionEvent);
                return onRotateSuggestionHover;
            }
        });
        this.mRotationButton.setUpdatesCallback(rotationButtonUpdatesCallback);
    }

    public void setRotationCallback(Consumer<Integer> consumer) {
        this.mRotWatcherListener = consumer;
    }

    public void setRotationLockedAtAngle(int i) {
        RotationPolicy.setRotationLockAtAngle(this.mContext, true, i);
    }

    public void setSkipOverrideUserLockPrefsOnce() {
        this.mSkipOverrideUserLockPrefsOnce = !this.mIsRecentsAnimationRunning;
    }

    public void unregisterListeners() {
        if (this.mListenersRegistered) {
            this.mListenersRegistered = false;
            try {
                WindowManagerGlobal.getWindowManagerService().removeRotationWatcher(this.mRotationWatcher);
                TaskStackChangeListeners.getInstance().unregisterTaskStackListener(this.mTaskStackListener);
            } catch (RemoteException e) {
                Log.e(TAG, "UnregisterListeners caught a RemoteException", e);
            }
        }
    }

    public void setRotateSuggestionButtonState(boolean z, boolean z2) {
        View currentView;
        Drawable imageDrawable;
        if ((z || this.mRotationButton.isVisible()) && (currentView = this.mRotationButton.getCurrentView()) != null && (imageDrawable = this.mRotationButton.getImageDrawable()) != null) {
            this.mPendingRotationSuggestion = false;
            this.mMainThreadHandler.removeCallbacks(this.mCancelPendingRotationProposal);
            if (z) {
                Animator animator = this.mRotateHideAnimator;
                if (animator != null && animator.isRunning()) {
                    this.mRotateHideAnimator.cancel();
                }
                this.mRotateHideAnimator = null;
                currentView.setAlpha(1.0f);
                if (imageDrawable instanceof AnimatedVectorDrawable) {
                    AnimatedVectorDrawable animatedVectorDrawable = (AnimatedVectorDrawable) imageDrawable;
                    animatedVectorDrawable.reset();
                    animatedVectorDrawable.start();
                }
                if (!isRotateSuggestionIntroduced()) {
                    this.mViewRippler.start(currentView);
                }
                this.mRotationButton.show();
                return;
            }
            this.mViewRippler.stop();
            if (z2) {
                Animator animator2 = this.mRotateHideAnimator;
                if (animator2 != null && animator2.isRunning()) {
                    this.mRotateHideAnimator.pause();
                }
                this.mRotationButton.hide();
                return;
            }
            Animator animator3 = this.mRotateHideAnimator;
            if (animator3 == null || !animator3.isRunning()) {
                ObjectAnimator ofFloat = ObjectAnimator.ofFloat(currentView, "alpha", HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                ofFloat.setDuration(100L);
                ofFloat.setInterpolator(LINEAR_INTERPOLATOR);
                ofFloat.addListener(new AnimatorListenerAdapter() { // from class: com.android.systemui.shared.rotation.RotationButtonController.2
                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public void onAnimationEnd(Animator animator4) {
                        RotationButtonController.this.mRotationButton.hide();
                    }
                });
                this.mRotateHideAnimator = ofFloat;
                ofFloat.start();
            }
        }
    }
}
