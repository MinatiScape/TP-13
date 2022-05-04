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
import com.android.wallpaper.picker.PreviewFragment$$ExternalSyntheticLambda2;
import com.android.wallpaper.picker.PreviewFragment$$ExternalSyntheticLambda8;
import com.android.wallpaper.widget.LockScreenPreviewer$$ExternalSyntheticLambda2;
import java.io.PrintWriter;
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
    private final Runnable mRemoveRotationProposal = new PreviewFragment$$ExternalSyntheticLambda8(this, 1);
    private final Runnable mCancelPendingRotationProposal = new LockScreenPreviewer$$ExternalSyntheticLambda2(this, 1);
    private final IRotationWatcher.Stub mRotationWatcher = new AnonymousClass1();
    private final TaskStackListenerImpl mTaskStackListener = new TaskStackListenerImpl(this, null);

    /* renamed from: com.android.systemui.shared.rotation.RotationButtonController$1 */
    /* loaded from: classes.dex */
    public class AnonymousClass1 extends IRotationWatcher.Stub {
        public AnonymousClass1() {
            RotationButtonController.this = r1;
        }

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

        public void onRotationChanged(final int i) {
            RotationButtonController.this.mMainThreadHandler.postAtFrontOfQueue(new Runnable() { // from class: com.android.systemui.shared.rotation.RotationButtonController$1$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    RotationButtonController.AnonymousClass1.this.lambda$onRotationChanged$0(i);
                }
            });
        }
    }

    /* loaded from: classes.dex */
    public class TaskStackListenerImpl extends TaskStackChangeListener {
        private TaskStackListenerImpl() {
            RotationButtonController.this = r1;
        }

        public /* synthetic */ TaskStackListenerImpl(RotationButtonController rotationButtonController, AnonymousClass1 r2) {
            this();
        }

        public /* synthetic */ void lambda$onActivityRequestedOrientationChanged$0(int i, ActivityManager.RunningTaskInfo runningTaskInfo) {
            if (runningTaskInfo.id == i) {
                RotationButtonController.this.setRotateSuggestionButtonState(false);
            }
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

        @Override // com.android.systemui.shared.system.TaskStackChangeListener
        public void onActivityRequestedOrientationChanged(final int i, int i2) {
            Optional.ofNullable(ActivityManagerWrapper.getInstance()).map(RotationButtonController$TaskStackListenerImpl$$ExternalSyntheticLambda1.INSTANCE).ifPresent(new Consumer() { // from class: com.android.systemui.shared.rotation.RotationButtonController$TaskStackListenerImpl$$ExternalSyntheticLambda0
                @Override // java.util.function.Consumer
                public final void accept(Object obj) {
                    RotationButtonController.TaskStackListenerImpl.this.lambda$onActivityRequestedOrientationChanged$0(i, (ActivityManager.RunningTaskInfo) obj);
                }
            });
        }
    }

    public static /* synthetic */ void $r8$lambda$TN26GBhO0iajE6nDwh6BEL4qwA0(RotationButtonController rotationButtonController) {
        rotationButtonController.lambda$new$1();
    }

    /* renamed from: $r8$lambda$YjnDy7AOTuEVJEKSHSjIm0l-gOY */
    public static /* synthetic */ void m22$r8$lambda$YjnDy7AOTuEVJEKSHSjIm0lgOY(RotationButtonController rotationButtonController) {
        rotationButtonController.lambda$new$0();
    }

    public static boolean hasDisable2RotateSuggestionFlag(int i) {
        return (i & 16) != 0;
    }

    public /* synthetic */ void lambda$new$0() {
        setRotateSuggestionButtonState(false);
    }

    public /* synthetic */ void lambda$new$1() {
        this.mPendingRotationSuggestion = false;
    }

    private void onRotationSuggestionsDisabled() {
        setRotateSuggestionButtonState(false, true);
        this.mMainThreadHandler.removeCallbacks(this.mRemoveRotationProposal);
    }

    private void showAndLogRotationSuggestion() {
        setRotateSuggestionButtonState(true);
        rescheduleRotationTimeout(false);
        this.mUiEventLogger.log(RotationButtonEvent.ROTATION_SUGGESTION_SHOWN);
    }

    public void setRotateSuggestionButtonState(boolean z) {
        setRotateSuggestionButtonState(z, false);
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

    @SuppressLint({"InlinedApi"})
    private boolean canShowRotationButton() {
        if (this.mIsNavigationBarShowing || this.mBehavior == 1) {
            return true;
        }
        return false;
    }

    private int computeRotationProposalTimeout() {
        int i;
        AccessibilityManager accessibilityManager = this.mAccessibilityManager;
        if (this.mHoveringRotationSuggestion) {
            i = 16000;
        } else {
            i = 5000;
        }
        return accessibilityManager.getRecommendedTimeoutMillis(i, 4);
    }

    private void incrementNumAcceptedRotationSuggestionsIfNeeded() {
        ContentResolver contentResolver = this.mContext.getContentResolver();
        int i = Settings.Secure.getInt(contentResolver, "num_rotation_suggestions_accepted", 0);
        if (i < 3) {
            Settings.Secure.putInt(contentResolver, "num_rotation_suggestions_accepted", i + 1);
        }
    }

    private boolean isRotateSuggestionIntroduced() {
        if (Settings.Secure.getInt(this.mContext.getContentResolver(), "num_rotation_suggestions_accepted", 0) >= 3) {
            return true;
        }
        return false;
    }

    public void onRotateSuggestionClick(View view) {
        this.mUiEventLogger.log(RotationButtonEvent.ROTATION_SUGGESTION_ACCEPTED);
        incrementNumAcceptedRotationSuggestionsIfNeeded();
        setRotationLockedAtAngle(this.mLastRotationSuggestion);
        view.performHapticFeedback(1);
    }

    private void rescheduleRotationTimeout(boolean z) {
        Animator animator;
        if (!z || (((animator = this.mRotateHideAnimator) == null || !animator.isRunning()) && this.mRotationButton.isVisible())) {
            this.mMainThreadHandler.removeCallbacks(this.mRemoveRotationProposal);
            this.mMainThreadHandler.postDelayed(this.mRemoveRotationProposal, computeRotationProposalTimeout());
        }
    }

    public boolean shouldOverrideUserLockPrefs(int i) {
        if (this.mSkipOverrideUserLockPrefsOnce) {
            this.mSkipOverrideUserLockPrefsOnce = false;
            return false;
        } else if (i == 0) {
            return true;
        } else {
            return false;
        }
    }

    private void updateRotationButtonStateInOverview() {
        if (this.mIsRecentsAnimationRunning && !this.mHomeRotationEnabled) {
            setRotateSuggestionButtonState(false, true);
        }
    }

    public void dumpLogs(String str, PrintWriter printWriter) {
        printWriter.println(str + "RotationButtonController:");
        printWriter.println(String.format("%s\tmIsRecentsAnimationRunning=%b", str, Boolean.valueOf(this.mIsRecentsAnimationRunning)));
        printWriter.println(String.format("%s\tmHomeRotationEnabled=%b", str, Boolean.valueOf(this.mHomeRotationEnabled)));
        printWriter.println(String.format("%s\tmLastRotationSuggestion=%d", str, Integer.valueOf(this.mLastRotationSuggestion)));
        printWriter.println(String.format("%s\tmPendingRotationSuggestion=%b", str, Boolean.valueOf(this.mPendingRotationSuggestion)));
        printWriter.println(String.format("%s\tmHoveringRotationSuggestion=%b", str, Boolean.valueOf(this.mHoveringRotationSuggestion)));
        printWriter.println(String.format("%s\tmListenersRegistered=%b", str, Boolean.valueOf(this.mListenersRegistered)));
        printWriter.println(String.format("%s\tmIsNavigationBarShowing=%b", str, Boolean.valueOf(this.mIsNavigationBarShowing)));
        printWriter.println(String.format("%s\tmBehavior=%d", str, Integer.valueOf(this.mBehavior)));
        printWriter.println(String.format("%s\tmSkipOverrideUserLockPrefsOnce=%b", str, Boolean.valueOf(this.mSkipOverrideUserLockPrefsOnce)));
        printWriter.println(String.format("%s\tmLightIconColor=0x%s", str, Integer.toHexString(this.mLightIconColor)));
        printWriter.println(String.format("%s\tmDarkIconColor=0x%s", str, Integer.toHexString(this.mDarkIconColor)));
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

    public void onNavigationBarWindowVisibilityChange(boolean z) {
        if (this.mIsNavigationBarShowing != z) {
            this.mIsNavigationBarShowing = z;
            showPendingRotationButtonIfNeeded();
        }
    }

    public void onRotationProposal(int i, boolean z) {
        int i2;
        int i3;
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
                    if (isRotationAnimationCCW) {
                        i2 = this.mIconCcwStart0ResId;
                    } else {
                        i2 = this.mIconCwStart0ResId;
                    }
                    this.mIconResId = i2;
                } else {
                    if (isRotationAnimationCCW) {
                        i3 = this.mIconCcwStart90ResId;
                    } else {
                        i3 = this.mIconCwStart90ResId;
                    }
                    this.mIconResId = i3;
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

    public void registerListeners() {
        if (!this.mListenersRegistered && !getContext().getPackageManager().hasSystemFeature("android.hardware.type.pc")) {
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
                    {
                        RotationButtonController.this = this;
                    }

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

    public void setRotationButton(RotationButton rotationButton, RotationButton.RotationButtonUpdatesCallback rotationButtonUpdatesCallback) {
        this.mRotationButton = rotationButton;
        rotationButton.setRotationButtonController(this);
        this.mRotationButton.setOnClickListener(new PreviewFragment$$ExternalSyntheticLambda2(this, 1));
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

    public boolean onRotateSuggestionHover(View view, MotionEvent motionEvent) {
        boolean z;
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 9 || actionMasked == 7) {
            z = true;
        } else {
            z = false;
        }
        this.mHoveringRotationSuggestion = z;
        rescheduleRotationTimeout(true);
        return false;
    }

    private void showPendingRotationButtonIfNeeded() {
        if (canShowRotationButton() && this.mPendingRotationSuggestion) {
            showAndLogRotationSuggestion();
        }
    }

    public void init() {
        registerListeners();
        if (this.mContext.getDisplay().getDisplayId() != 0) {
            onDisable2FlagChanged(16);
        }
    }

    public void onDisable2FlagChanged(int i) {
        if (hasDisable2RotateSuggestionFlag(i)) {
            onRotationSuggestionsDisabled();
        }
    }

    public void onTaskbarStateChange(boolean z, boolean z2) {
        if (getRotationButton() != null) {
            getRotationButton().onTaskbarStateChanged(z, z2);
        }
    }

    public void setRotationCallback(Consumer<Integer> consumer) {
        this.mRotWatcherListener = consumer;
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

    public void onDestroy() {
        unregisterListeners();
    }
}
