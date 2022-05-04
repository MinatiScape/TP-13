package com.google.android.material.floatingactionbutton;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import androidx.appcompat.widget.AppCompatDrawableManager;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.google.android.material.R$styleable;
import com.google.android.material.animation.MotionSpec;
import com.google.android.material.animation.TransformationCallback;
import com.google.android.material.appbar.AppBarLayout;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.google.android.material.expandable.ExpandableWidget;
import com.google.android.material.floatingactionbutton.FloatingActionButtonImpl;
import com.google.android.material.internal.DescendantOffsetUtils;
import com.google.android.material.internal.VisibilityAwareImageButton;
import com.google.android.material.shadow.ShadowViewDelegate;
import com.google.android.material.shape.ShapeAppearanceModel;
import com.google.android.material.shape.Shapeable;
import com.google.android.material.stateful.ExtendableSavedState;
import java.util.List;
import java.util.Objects;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public class FloatingActionButton extends VisibilityAwareImageButton implements ExpandableWidget, Shapeable, CoordinatorLayout.AttachedBehavior {
    public ColorStateList backgroundTint;
    public PorterDuff.Mode backgroundTintMode;
    public PorterDuff.Mode imageMode;
    public int imagePadding;
    public ColorStateList imageTint;
    public FloatingActionButtonImpl impl;

    /* loaded from: classes.dex */
    public static class Behavior extends BaseBehavior<FloatingActionButton> {
        public Behavior() {
        }

        @Override // com.google.android.material.floatingactionbutton.FloatingActionButton.BaseBehavior
        public /* bridge */ /* synthetic */ void setInternalAutoHideListener(OnVisibilityChangedListener onVisibilityChangedListener) {
            super.setInternalAutoHideListener(onVisibilityChangedListener);
        }

        public Behavior(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
        }
    }

    /* loaded from: classes.dex */
    public static abstract class OnVisibilityChangedListener {
    }

    /* loaded from: classes.dex */
    public class ShadowDelegateImpl implements ShadowViewDelegate {
        public ShadowDelegateImpl() {
        }
    }

    /* loaded from: classes.dex */
    public class TransformationCallbackWrapper<T extends FloatingActionButton> implements FloatingActionButtonImpl.InternalTransformationCallback {
        public final TransformationCallback<T> listener;

        public TransformationCallbackWrapper(TransformationCallback<T> transformationCallback) {
            this.listener = transformationCallback;
        }

        public boolean equals(Object obj) {
            return (obj instanceof TransformationCallbackWrapper) && ((TransformationCallbackWrapper) obj).listener.equals(this.listener);
        }

        public int hashCode() {
            return this.listener.hashCode();
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // com.google.android.material.floatingactionbutton.FloatingActionButtonImpl.InternalTransformationCallback
        public void onScaleChanged() {
            this.listener.onScaleChanged(FloatingActionButton.this);
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // com.google.android.material.floatingactionbutton.FloatingActionButtonImpl.InternalTransformationCallback
        public void onTranslationChanged() {
            this.listener.onTranslationChanged(FloatingActionButton.this);
        }
    }

    @Override // android.widget.ImageView, android.view.View
    public void drawableStateChanged() {
        super.drawableStateChanged();
        getImpl().onDrawableStateChanged(getDrawableState());
    }

    @Override // android.view.View
    public ColorStateList getBackgroundTintList() {
        return this.backgroundTint;
    }

    @Override // android.view.View
    public PorterDuff.Mode getBackgroundTintMode() {
        return this.backgroundTintMode;
    }

    @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.AttachedBehavior
    public CoordinatorLayout.Behavior<FloatingActionButton> getBehavior() {
        return new Behavior();
    }

    @Deprecated
    public boolean getContentRect(Rect rect) {
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        if (!isLaidOut()) {
            return false;
        }
        rect.set(0, 0, getWidth(), getHeight());
        throw null;
    }

    public final FloatingActionButtonImpl getImpl() {
        if (this.impl == null) {
            this.impl = new FloatingActionButtonImplLollipop(this, new ShadowDelegateImpl());
        }
        return this.impl;
    }

    public int getSizeDimension() {
        return getSizeDimension(0);
    }

    public void hide(OnVisibilityChangedListener onVisibilityChangedListener, final boolean z) {
        final FloatingActionButtonImpl impl = getImpl();
        boolean z2 = true;
        if (impl.view.getVisibility() != 0 ? impl.animState == 2 : impl.animState != 1) {
            z2 = false;
        }
        if (!z2) {
            Animator animator = impl.currentAnimator;
            if (animator != null) {
                animator.cancel();
            }
            if (impl.shouldAnimateVisibilityChange()) {
                if (impl.defaultHideMotionSpec == null) {
                    impl.defaultHideMotionSpec = MotionSpec.createFromResource(impl.view.getContext(), R.animator.design_fab_hide_motion_spec);
                }
                MotionSpec motionSpec = impl.defaultHideMotionSpec;
                Objects.requireNonNull(motionSpec);
                AnimatorSet createAnimator = impl.createAnimator(motionSpec, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                createAnimator.addListener(new AnimatorListenerAdapter
                /*  JADX ERROR: Method code generation error
                    jadx.core.utils.exceptions.CodegenException: Error generate insn: 0x004c: INVOKE  
                      (r3v10 'createAnimator' android.animation.AnimatorSet)
                      (wrap: android.animation.AnimatorListenerAdapter : 0x0049: CONSTRUCTOR  (r0v3 android.animation.AnimatorListenerAdapter A[REMOVE]) = 
                      (r2v1 'impl' com.google.android.material.floatingactionbutton.FloatingActionButtonImpl A[DONT_INLINE])
                      (r4v0 'z' boolean A[DONT_INLINE])
                      (null com.google.android.material.floatingactionbutton.FloatingActionButtonImpl$InternalVisibilityChangedListener)
                     call: com.google.android.material.floatingactionbutton.FloatingActionButtonImpl.1.<init>(com.google.android.material.floatingactionbutton.FloatingActionButtonImpl, boolean, com.google.android.material.floatingactionbutton.FloatingActionButtonImpl$InternalVisibilityChangedListener):void type: CONSTRUCTOR)
                     type: VIRTUAL call: android.animation.AnimatorSet.addListener(android.animation.Animator$AnimatorListener):void in method: com.google.android.material.floatingactionbutton.FloatingActionButton.hide(com.google.android.material.floatingactionbutton.FloatingActionButton$OnVisibilityChangedListener, boolean):void, file: classes.dex
                    	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:280)
                    	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:243)
                    	at jadx.core.codegen.RegionGen.makeSimpleBlock(RegionGen.java:90)
                    	at jadx.core.dex.nodes.IBlock.generate(IBlock.java:15)
                    	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                    	at jadx.core.dex.regions.Region.generate(Region.java:35)
                    	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                    	at jadx.core.codegen.RegionGen.makeRegionIndent(RegionGen.java:79)
                    	at jadx.core.codegen.RegionGen.makeIf(RegionGen.java:122)
                    	at jadx.core.dex.regions.conditions.IfRegion.generate(IfRegion.java:90)
                    	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                    	at jadx.core.dex.regions.Region.generate(Region.java:35)
                    	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                    	at jadx.core.dex.regions.Region.generate(Region.java:35)
                    	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                    	at jadx.core.codegen.RegionGen.makeRegionIndent(RegionGen.java:79)
                    	at jadx.core.codegen.RegionGen.makeIf(RegionGen.java:122)
                    	at jadx.core.dex.regions.conditions.IfRegion.generate(IfRegion.java:90)
                    	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                    	at jadx.core.dex.regions.Region.generate(Region.java:35)
                    	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                    	at jadx.core.dex.regions.Region.generate(Region.java:35)
                    	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                    	at jadx.core.codegen.MethodGen.addRegionInsns(MethodGen.java:286)
                    	at jadx.core.codegen.MethodGen.addInstructions(MethodGen.java:265)
                    	at jadx.core.codegen.ClassGen.addMethodCode(ClassGen.java:369)
                    	at jadx.core.codegen.ClassGen.addMethod(ClassGen.java:304)
                    	at jadx.core.codegen.ClassGen.lambda$addInnerClsAndMethods$2(ClassGen.java:270)
                    	at java.base/java.util.stream.ForEachOps$ForEachOp$OfRef.accept(ForEachOps.java:183)
                    	at java.base/java.util.ArrayList.forEach(ArrayList.java:1541)
                    	at java.base/java.util.stream.SortedOps$RefSortingSink.end(SortedOps.java:395)
                    	at java.base/java.util.stream.Sink$ChainedReference.end(Sink.java:258)
                    Caused by: jadx.core.utils.exceptions.JadxRuntimeException: Method arg registers not loaded: com.google.android.material.floatingactionbutton.FloatingActionButtonImpl.1.<init>(com.google.android.material.floatingactionbutton.FloatingActionButtonImpl, boolean, com.google.android.material.floatingactionbutton.FloatingActionButtonImpl$InternalVisibilityChangedListener):void, class status: GENERATED_AND_UNLOADED
                    	at jadx.core.dex.nodes.MethodNode.getArgRegs(MethodNode.java:247)
                    	at jadx.core.codegen.InsnGen.inlineAnonymousConstructor(InsnGen.java:762)
                    	at jadx.core.codegen.InsnGen.makeConstructor(InsnGen.java:690)
                    	at jadx.core.codegen.InsnGen.makeInsnBody(InsnGen.java:388)
                    	at jadx.core.codegen.InsnGen.addWrappedArg(InsnGen.java:142)
                    	at jadx.core.codegen.InsnGen.addArg(InsnGen.java:118)
                    	at jadx.core.codegen.InsnGen.addArg(InsnGen.java:105)
                    	at jadx.core.codegen.InsnGen.generateMethodArguments(InsnGen.java:1017)
                    	at jadx.core.codegen.InsnGen.makeInvoke(InsnGen.java:828)
                    	at jadx.core.codegen.InsnGen.makeInsnBody(InsnGen.java:392)
                    	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:273)
                    	... 31 more
                    */
                /*
                    this = this;
                    com.google.android.material.floatingactionbutton.FloatingActionButtonImpl r2 = r2.getImpl()
                    com.google.android.material.floatingactionbutton.FloatingActionButton r3 = r2.view
                    int r3 = r3.getVisibility()
                    r0 = 1
                    if (r3 != 0) goto L12
                    int r3 = r2.animState
                    if (r3 != r0) goto L18
                    goto L19
                L12:
                    int r3 = r2.animState
                    r1 = 2
                    if (r3 == r1) goto L18
                    goto L19
                L18:
                    r0 = 0
                L19:
                    if (r0 == 0) goto L1c
                    goto L76
                L1c:
                    android.animation.Animator r3 = r2.currentAnimator
                    if (r3 == 0) goto L23
                    r3.cancel()
                L23:
                    boolean r3 = r2.shouldAnimateVisibilityChange()
                    if (r3 == 0) goto L6b
                    com.google.android.material.animation.MotionSpec r3 = r2.defaultHideMotionSpec
                    if (r3 != 0) goto L3c
                    com.google.android.material.floatingactionbutton.FloatingActionButton r3 = r2.view
                    android.content.Context r3 = r3.getContext()
                    r0 = 2130837505(0x7f020001, float:1.7279966E38)
                    com.google.android.material.animation.MotionSpec r3 = com.google.android.material.animation.MotionSpec.createFromResource(r3, r0)
                    r2.defaultHideMotionSpec = r3
                L3c:
                    com.google.android.material.animation.MotionSpec r3 = r2.defaultHideMotionSpec
                    java.util.Objects.requireNonNull(r3)
                    r0 = 0
                    android.animation.AnimatorSet r3 = r2.createAnimator(r3, r0, r0, r0)
                    com.google.android.material.floatingactionbutton.FloatingActionButtonImpl$1 r0 = new com.google.android.material.floatingactionbutton.FloatingActionButtonImpl$1
                    r1 = 0
                    r0.<init>()
                    r3.addListener(r0)
                    java.util.ArrayList<android.animation.Animator$AnimatorListener> r2 = r2.hideListeners
                    if (r2 == 0) goto L67
                    java.util.Iterator r2 = r2.iterator()
                L57:
                    boolean r4 = r2.hasNext()
                    if (r4 == 0) goto L67
                    java.lang.Object r4 = r2.next()
                    android.animation.Animator$AnimatorListener r4 = (android.animation.Animator.AnimatorListener) r4
                    r3.addListener(r4)
                    goto L57
                L67:
                    r3.start()
                    goto L76
                L6b:
                    com.google.android.material.floatingactionbutton.FloatingActionButton r2 = r2.view
                    if (r4 == 0) goto L72
                    r3 = 8
                    goto L73
                L72:
                    r3 = 4
                L73:
                    r2.internalSetVisibility(r3, r4)
                L76:
                    return
                */
                throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.floatingactionbutton.FloatingActionButton.hide(com.google.android.material.floatingactionbutton.FloatingActionButton$OnVisibilityChangedListener, boolean):void");
            }

            @Override // com.google.android.material.expandable.ExpandableWidget
            public boolean isExpanded() {
                throw null;
            }

            @Override // android.widget.ImageView, android.view.View
            public void jumpDrawablesToCurrentState() {
                super.jumpDrawablesToCurrentState();
                getImpl().jumpDrawableToCurrentState();
            }

            public final void onApplySupportImageTint() {
                Drawable drawable = getDrawable();
                if (drawable != null) {
                    ColorStateList colorStateList = this.imageTint;
                    if (colorStateList == null) {
                        drawable.clearColorFilter();
                        return;
                    }
                    int colorForState = colorStateList.getColorForState(getDrawableState(), 0);
                    PorterDuff.Mode mode = this.imageMode;
                    if (mode == null) {
                        mode = PorterDuff.Mode.SRC_IN;
                    }
                    drawable.mutate().setColorFilter(AppCompatDrawableManager.getPorterDuffColorFilter(colorForState, mode));
                }
            }

            @Override // android.widget.ImageView, android.view.View
            public void onAttachedToWindow() {
                super.onAttachedToWindow();
                final FloatingActionButtonImpl impl = getImpl();
                Objects.requireNonNull(impl);
                if (!(impl instanceof FloatingActionButtonImplLollipop)) {
                    ViewTreeObserver viewTreeObserver = impl.view.getViewTreeObserver();
                    if (impl.preDrawListener == null) {
                        impl.preDrawListener = new ViewTreeObserver.OnPreDrawListener
                        /*  JADX ERROR: Method code generation error
                            jadx.core.utils.exceptions.CodegenException: Error generate insn: 0x001f: IPUT  
                              (wrap: android.view.ViewTreeObserver$OnPreDrawListener : 0x001c: CONSTRUCTOR  (r1v1 android.view.ViewTreeObserver$OnPreDrawListener A[REMOVE]) = (r2v1 'impl' com.google.android.material.floatingactionbutton.FloatingActionButtonImpl A[DONT_INLINE]) call: com.google.android.material.floatingactionbutton.FloatingActionButtonImpl.5.<init>(com.google.android.material.floatingactionbutton.FloatingActionButtonImpl):void type: CONSTRUCTOR)
                              (r2v1 'impl' com.google.android.material.floatingactionbutton.FloatingActionButtonImpl)
                             com.google.android.material.floatingactionbutton.FloatingActionButtonImpl.preDrawListener android.view.ViewTreeObserver$OnPreDrawListener in method: com.google.android.material.floatingactionbutton.FloatingActionButton.onAttachedToWindow():void, file: classes.dex
                            	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:280)
                            	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:243)
                            	at jadx.core.codegen.RegionGen.makeSimpleBlock(RegionGen.java:90)
                            	at jadx.core.dex.nodes.IBlock.generate(IBlock.java:15)
                            	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                            	at jadx.core.dex.regions.Region.generate(Region.java:35)
                            	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                            	at jadx.core.codegen.RegionGen.makeRegionIndent(RegionGen.java:79)
                            	at jadx.core.codegen.RegionGen.makeIf(RegionGen.java:122)
                            	at jadx.core.dex.regions.conditions.IfRegion.generate(IfRegion.java:90)
                            	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                            	at jadx.core.dex.regions.Region.generate(Region.java:35)
                            	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                            	at jadx.core.codegen.RegionGen.makeRegionIndent(RegionGen.java:79)
                            	at jadx.core.codegen.RegionGen.makeIf(RegionGen.java:122)
                            	at jadx.core.dex.regions.conditions.IfRegion.generate(IfRegion.java:90)
                            	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                            	at jadx.core.dex.regions.Region.generate(Region.java:35)
                            	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                            	at jadx.core.dex.regions.Region.generate(Region.java:35)
                            	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                            	at jadx.core.codegen.MethodGen.addRegionInsns(MethodGen.java:286)
                            	at jadx.core.codegen.MethodGen.addInstructions(MethodGen.java:265)
                            	at jadx.core.codegen.ClassGen.addMethodCode(ClassGen.java:369)
                            	at jadx.core.codegen.ClassGen.addMethod(ClassGen.java:304)
                            	at jadx.core.codegen.ClassGen.lambda$addInnerClsAndMethods$2(ClassGen.java:270)
                            	at java.base/java.util.stream.ForEachOps$ForEachOp$OfRef.accept(ForEachOps.java:183)
                            	at java.base/java.util.ArrayList.forEach(ArrayList.java:1541)
                            	at java.base/java.util.stream.SortedOps$RefSortingSink.end(SortedOps.java:395)
                            	at java.base/java.util.stream.Sink$ChainedReference.end(Sink.java:258)
                            Caused by: jadx.core.utils.exceptions.JadxRuntimeException: Method arg registers not loaded: com.google.android.material.floatingactionbutton.FloatingActionButtonImpl.5.<init>(com.google.android.material.floatingactionbutton.FloatingActionButtonImpl):void, class status: GENERATED_AND_UNLOADED
                            	at jadx.core.dex.nodes.MethodNode.getArgRegs(MethodNode.java:247)
                            	at jadx.core.codegen.InsnGen.inlineAnonymousConstructor(InsnGen.java:762)
                            	at jadx.core.codegen.InsnGen.makeConstructor(InsnGen.java:690)
                            	at jadx.core.codegen.InsnGen.makeInsnBody(InsnGen.java:388)
                            	at jadx.core.codegen.InsnGen.addWrappedArg(InsnGen.java:142)
                            	at jadx.core.codegen.InsnGen.addArg(InsnGen.java:118)
                            	at jadx.core.codegen.InsnGen.addArg(InsnGen.java:105)
                            	at jadx.core.codegen.InsnGen.makeInsnBody(InsnGen.java:457)
                            	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:273)
                            	... 29 more
                            */
                        /*
                            this = this;
                            super.onAttachedToWindow()
                            com.google.android.material.floatingactionbutton.FloatingActionButtonImpl r2 = r2.getImpl()
                            java.util.Objects.requireNonNull(r2)
                            boolean r0 = r2 instanceof com.google.android.material.floatingactionbutton.FloatingActionButtonImplLollipop
                            r0 = r0 ^ 1
                            if (r0 == 0) goto L26
                            com.google.android.material.floatingactionbutton.FloatingActionButton r0 = r2.view
                            android.view.ViewTreeObserver r0 = r0.getViewTreeObserver()
                            android.view.ViewTreeObserver$OnPreDrawListener r1 = r2.preDrawListener
                            if (r1 != 0) goto L21
                            com.google.android.material.floatingactionbutton.FloatingActionButtonImpl$5 r1 = new com.google.android.material.floatingactionbutton.FloatingActionButtonImpl$5
                            r1.<init>()
                            r2.preDrawListener = r1
                        L21:
                            android.view.ViewTreeObserver$OnPreDrawListener r2 = r2.preDrawListener
                            r0.addOnPreDrawListener(r2)
                        L26:
                            return
                        */
                        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.floatingactionbutton.FloatingActionButton.onAttachedToWindow():void");
                    }

                    @Override // android.widget.ImageView, android.view.View
                    public void onDetachedFromWindow() {
                        super.onDetachedFromWindow();
                        FloatingActionButtonImpl impl = getImpl();
                        ViewTreeObserver viewTreeObserver = impl.view.getViewTreeObserver();
                        ViewTreeObserver.OnPreDrawListener onPreDrawListener = impl.preDrawListener;
                        if (onPreDrawListener != null) {
                            viewTreeObserver.removeOnPreDrawListener(onPreDrawListener);
                            impl.preDrawListener = null;
                        }
                    }

                    @Override // android.widget.ImageView, android.view.View
                    public void onMeasure(int i, int i2) {
                        this.imagePadding = (getSizeDimension() + 0) / 2;
                        getImpl().updatePadding();
                        throw null;
                    }

                    @Override // android.view.View
                    public void onRestoreInstanceState(Parcelable parcelable) {
                        if (!(parcelable instanceof ExtendableSavedState)) {
                            super.onRestoreInstanceState(parcelable);
                            return;
                        }
                        ExtendableSavedState extendableSavedState = (ExtendableSavedState) parcelable;
                        super.onRestoreInstanceState(extendableSavedState.mSuperState);
                        Objects.requireNonNull(extendableSavedState.extendableStates.getOrDefault("expandableWidgetHelper", null));
                        throw null;
                    }

                    @Override // android.view.View
                    public Parcelable onSaveInstanceState() {
                        Parcelable onSaveInstanceState = super.onSaveInstanceState();
                        if (onSaveInstanceState == null) {
                            onSaveInstanceState = new Bundle();
                        }
                        new ExtendableSavedState(onSaveInstanceState);
                        throw null;
                    }

                    @Override // android.view.View
                    public boolean onTouchEvent(MotionEvent motionEvent) {
                        if (motionEvent.getAction() == 0) {
                            getContentRect(null);
                        }
                        return super.onTouchEvent(motionEvent);
                    }

                    @Override // android.view.View
                    public void setBackgroundColor(int i) {
                        Log.i("FloatingActionButton", "Setting a custom background is not supported.");
                    }

                    @Override // android.view.View
                    public void setBackgroundDrawable(Drawable drawable) {
                        Log.i("FloatingActionButton", "Setting a custom background is not supported.");
                    }

                    @Override // android.view.View
                    public void setBackgroundResource(int i) {
                        Log.i("FloatingActionButton", "Setting a custom background is not supported.");
                    }

                    @Override // android.view.View
                    public void setBackgroundTintList(ColorStateList colorStateList) {
                        if (this.backgroundTint != colorStateList) {
                            this.backgroundTint = colorStateList;
                            Objects.requireNonNull(getImpl());
                        }
                    }

                    @Override // android.view.View
                    public void setBackgroundTintMode(PorterDuff.Mode mode) {
                        if (this.backgroundTintMode != mode) {
                            this.backgroundTintMode = mode;
                            Objects.requireNonNull(getImpl());
                        }
                    }

                    @Override // android.view.View
                    public void setElevation(float f) {
                        super.setElevation(f);
                        Objects.requireNonNull(getImpl());
                    }

                    @Override // android.widget.ImageView
                    public void setImageDrawable(Drawable drawable) {
                        if (getDrawable() != drawable) {
                            super.setImageDrawable(drawable);
                            FloatingActionButtonImpl impl = getImpl();
                            impl.setImageMatrixScale(impl.imageMatrixScale);
                            if (this.imageTint != null) {
                                onApplySupportImageTint();
                            }
                        }
                    }

                    @Override // android.widget.ImageView
                    public void setImageResource(int i) {
                        throw null;
                    }

                    @Override // android.view.View
                    public void setScaleX(float f) {
                        super.setScaleX(f);
                        getImpl().onScaleChanged();
                    }

                    @Override // android.view.View
                    public void setScaleY(float f) {
                        super.setScaleY(f);
                        getImpl().onScaleChanged();
                    }

                    public void setShadowPaddingEnabled(boolean z) {
                        FloatingActionButtonImpl impl = getImpl();
                        impl.shadowPaddingEnabled = z;
                        impl.updatePadding();
                        throw null;
                    }

                    @Override // com.google.android.material.shape.Shapeable
                    public void setShapeAppearanceModel(ShapeAppearanceModel shapeAppearanceModel) {
                        getImpl().shapeAppearance = shapeAppearanceModel;
                    }

                    @Override // android.view.View
                    public void setTranslationX(float f) {
                        super.setTranslationX(f);
                        getImpl().onTranslationChanged();
                    }

                    @Override // android.view.View
                    public void setTranslationY(float f) {
                        super.setTranslationY(f);
                        getImpl().onTranslationChanged();
                    }

                    @Override // android.view.View
                    public void setTranslationZ(float f) {
                        super.setTranslationZ(f);
                        getImpl().onTranslationChanged();
                    }

                    @Override // com.google.android.material.internal.VisibilityAwareImageButton, android.widget.ImageView, android.view.View
                    public void setVisibility(int i) {
                        super.setVisibility(i);
                    }

                    public void show(OnVisibilityChangedListener onVisibilityChangedListener, final boolean z) {
                        final FloatingActionButtonImpl impl = getImpl();
                        if (!impl.isOrWillBeShown()) {
                            Animator animator = impl.currentAnimator;
                            if (animator != null) {
                                animator.cancel();
                            }
                            if (impl.shouldAnimateVisibilityChange()) {
                                if (impl.view.getVisibility() != 0) {
                                    impl.view.setAlpha(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                                    impl.view.setScaleY(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                                    impl.view.setScaleX(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                                    impl.setImageMatrixScale(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                                }
                                if (impl.defaultShowMotionSpec == null) {
                                    impl.defaultShowMotionSpec = MotionSpec.createFromResource(impl.view.getContext(), R.animator.design_fab_show_motion_spec);
                                }
                                MotionSpec motionSpec = impl.defaultShowMotionSpec;
                                Objects.requireNonNull(motionSpec);
                                AnimatorSet createAnimator = impl.createAnimator(motionSpec, 1.0f, 1.0f, 1.0f);
                                createAnimator.addListener(new AnimatorListenerAdapter
                                /*  JADX ERROR: Method code generation error
                                    jadx.core.utils.exceptions.CodegenException: Error generate insn: 0x0058: INVOKE  
                                      (r3v12 'createAnimator' android.animation.AnimatorSet)
                                      (wrap: android.animation.AnimatorListenerAdapter : 0x0055: CONSTRUCTOR  (r0v1 android.animation.AnimatorListenerAdapter A[REMOVE]) = 
                                      (r2v1 'impl' com.google.android.material.floatingactionbutton.FloatingActionButtonImpl A[DONT_INLINE])
                                      (r4v0 'z' boolean A[DONT_INLINE])
                                      (null com.google.android.material.floatingactionbutton.FloatingActionButtonImpl$InternalVisibilityChangedListener)
                                     call: com.google.android.material.floatingactionbutton.FloatingActionButtonImpl.2.<init>(com.google.android.material.floatingactionbutton.FloatingActionButtonImpl, boolean, com.google.android.material.floatingactionbutton.FloatingActionButtonImpl$InternalVisibilityChangedListener):void type: CONSTRUCTOR)
                                     type: VIRTUAL call: android.animation.AnimatorSet.addListener(android.animation.Animator$AnimatorListener):void in method: com.google.android.material.floatingactionbutton.FloatingActionButton.show(com.google.android.material.floatingactionbutton.FloatingActionButton$OnVisibilityChangedListener, boolean):void, file: classes.dex
                                    	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:280)
                                    	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:243)
                                    	at jadx.core.codegen.RegionGen.makeSimpleBlock(RegionGen.java:90)
                                    	at jadx.core.dex.nodes.IBlock.generate(IBlock.java:15)
                                    	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                                    	at jadx.core.dex.regions.Region.generate(Region.java:35)
                                    	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                                    	at jadx.core.codegen.RegionGen.makeRegionIndent(RegionGen.java:79)
                                    	at jadx.core.codegen.RegionGen.makeIf(RegionGen.java:122)
                                    	at jadx.core.dex.regions.conditions.IfRegion.generate(IfRegion.java:90)
                                    	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                                    	at jadx.core.dex.regions.Region.generate(Region.java:35)
                                    	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                                    	at jadx.core.dex.regions.Region.generate(Region.java:35)
                                    	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                                    	at jadx.core.codegen.RegionGen.makeRegionIndent(RegionGen.java:79)
                                    	at jadx.core.codegen.RegionGen.makeIf(RegionGen.java:122)
                                    	at jadx.core.dex.regions.conditions.IfRegion.generate(IfRegion.java:90)
                                    	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                                    	at jadx.core.dex.regions.Region.generate(Region.java:35)
                                    	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                                    	at jadx.core.dex.regions.Region.generate(Region.java:35)
                                    	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                                    	at jadx.core.codegen.MethodGen.addRegionInsns(MethodGen.java:286)
                                    	at jadx.core.codegen.MethodGen.addInstructions(MethodGen.java:265)
                                    	at jadx.core.codegen.ClassGen.addMethodCode(ClassGen.java:369)
                                    	at jadx.core.codegen.ClassGen.addMethod(ClassGen.java:304)
                                    	at jadx.core.codegen.ClassGen.lambda$addInnerClsAndMethods$2(ClassGen.java:270)
                                    	at java.base/java.util.stream.ForEachOps$ForEachOp$OfRef.accept(ForEachOps.java:183)
                                    	at java.base/java.util.ArrayList.forEach(ArrayList.java:1541)
                                    	at java.base/java.util.stream.SortedOps$RefSortingSink.end(SortedOps.java:395)
                                    	at java.base/java.util.stream.Sink$ChainedReference.end(Sink.java:258)
                                    Caused by: jadx.core.utils.exceptions.JadxRuntimeException: Method arg registers not loaded: com.google.android.material.floatingactionbutton.FloatingActionButtonImpl.2.<init>(com.google.android.material.floatingactionbutton.FloatingActionButtonImpl, boolean, com.google.android.material.floatingactionbutton.FloatingActionButtonImpl$InternalVisibilityChangedListener):void, class status: GENERATED_AND_UNLOADED
                                    	at jadx.core.dex.nodes.MethodNode.getArgRegs(MethodNode.java:247)
                                    	at jadx.core.codegen.InsnGen.inlineAnonymousConstructor(InsnGen.java:762)
                                    	at jadx.core.codegen.InsnGen.makeConstructor(InsnGen.java:690)
                                    	at jadx.core.codegen.InsnGen.makeInsnBody(InsnGen.java:388)
                                    	at jadx.core.codegen.InsnGen.addWrappedArg(InsnGen.java:142)
                                    	at jadx.core.codegen.InsnGen.addArg(InsnGen.java:118)
                                    	at jadx.core.codegen.InsnGen.addArg(InsnGen.java:105)
                                    	at jadx.core.codegen.InsnGen.generateMethodArguments(InsnGen.java:1017)
                                    	at jadx.core.codegen.InsnGen.makeInvoke(InsnGen.java:828)
                                    	at jadx.core.codegen.InsnGen.makeInsnBody(InsnGen.java:392)
                                    	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:273)
                                    	... 31 more
                                    */
                                /*
                                    this = this;
                                    com.google.android.material.floatingactionbutton.FloatingActionButtonImpl r2 = r2.getImpl()
                                    boolean r3 = r2.isOrWillBeShown()
                                    if (r3 == 0) goto Lc
                                    goto L8f
                                Lc:
                                    android.animation.Animator r3 = r2.currentAnimator
                                    if (r3 == 0) goto L13
                                    r3.cancel()
                                L13:
                                    boolean r3 = r2.shouldAnimateVisibilityChange()
                                    r0 = 1065353216(0x3f800000, float:1.0)
                                    if (r3 == 0) goto L77
                                    com.google.android.material.floatingactionbutton.FloatingActionButton r3 = r2.view
                                    int r3 = r3.getVisibility()
                                    if (r3 == 0) goto L36
                                    com.google.android.material.floatingactionbutton.FloatingActionButton r3 = r2.view
                                    r1 = 0
                                    r3.setAlpha(r1)
                                    com.google.android.material.floatingactionbutton.FloatingActionButton r3 = r2.view
                                    r3.setScaleY(r1)
                                    com.google.android.material.floatingactionbutton.FloatingActionButton r3 = r2.view
                                    r3.setScaleX(r1)
                                    r2.setImageMatrixScale(r1)
                                L36:
                                    com.google.android.material.animation.MotionSpec r3 = r2.defaultShowMotionSpec
                                    if (r3 != 0) goto L49
                                    com.google.android.material.floatingactionbutton.FloatingActionButton r3 = r2.view
                                    android.content.Context r3 = r3.getContext()
                                    r1 = 2130837506(0x7f020002, float:1.7279968E38)
                                    com.google.android.material.animation.MotionSpec r3 = com.google.android.material.animation.MotionSpec.createFromResource(r3, r1)
                                    r2.defaultShowMotionSpec = r3
                                L49:
                                    com.google.android.material.animation.MotionSpec r3 = r2.defaultShowMotionSpec
                                    java.util.Objects.requireNonNull(r3)
                                    android.animation.AnimatorSet r3 = r2.createAnimator(r3, r0, r0, r0)
                                    com.google.android.material.floatingactionbutton.FloatingActionButtonImpl$2 r0 = new com.google.android.material.floatingactionbutton.FloatingActionButtonImpl$2
                                    r1 = 0
                                    r0.<init>()
                                    r3.addListener(r0)
                                    java.util.ArrayList<android.animation.Animator$AnimatorListener> r2 = r2.showListeners
                                    if (r2 == 0) goto L73
                                    java.util.Iterator r2 = r2.iterator()
                                L63:
                                    boolean r4 = r2.hasNext()
                                    if (r4 == 0) goto L73
                                    java.lang.Object r4 = r2.next()
                                    android.animation.Animator$AnimatorListener r4 = (android.animation.Animator.AnimatorListener) r4
                                    r3.addListener(r4)
                                    goto L63
                                L73:
                                    r3.start()
                                    goto L8f
                                L77:
                                    com.google.android.material.floatingactionbutton.FloatingActionButton r3 = r2.view
                                    r1 = 0
                                    r3.internalSetVisibility(r1, r4)
                                    com.google.android.material.floatingactionbutton.FloatingActionButton r3 = r2.view
                                    r3.setAlpha(r0)
                                    com.google.android.material.floatingactionbutton.FloatingActionButton r3 = r2.view
                                    r3.setScaleY(r0)
                                    com.google.android.material.floatingactionbutton.FloatingActionButton r3 = r2.view
                                    r3.setScaleX(r0)
                                    r2.setImageMatrixScale(r0)
                                L8f:
                                    return
                                */
                                throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.floatingactionbutton.FloatingActionButton.show(com.google.android.material.floatingactionbutton.FloatingActionButton$OnVisibilityChangedListener, boolean):void");
                            }

                            /* loaded from: classes.dex */
                            public static class BaseBehavior<T extends FloatingActionButton> extends CoordinatorLayout.Behavior<T> {
                                public boolean autoHideEnabled;
                                public Rect tmpRect;

                                public BaseBehavior() {
                                    this.autoHideEnabled = true;
                                }

                                @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
                                public boolean getInsetDodgeRect(CoordinatorLayout coordinatorLayout, View view, Rect rect) {
                                    ((FloatingActionButton) view).getLeft();
                                    throw null;
                                }

                                @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
                                public void onAttachedToLayoutParams(CoordinatorLayout.LayoutParams layoutParams) {
                                    if (layoutParams.dodgeInsetEdges == 0) {
                                        layoutParams.dodgeInsetEdges = 80;
                                    }
                                }

                                @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
                                public boolean onDependentViewChanged(CoordinatorLayout coordinatorLayout, View view, View view2) {
                                    FloatingActionButton floatingActionButton = (FloatingActionButton) view;
                                    if (view2 instanceof AppBarLayout) {
                                        updateFabVisibilityForAppBarLayout(coordinatorLayout, (AppBarLayout) view2, floatingActionButton);
                                    } else {
                                        ViewGroup.LayoutParams layoutParams = view2.getLayoutParams();
                                        if (layoutParams instanceof CoordinatorLayout.LayoutParams ? ((CoordinatorLayout.LayoutParams) layoutParams).mBehavior instanceof BottomSheetBehavior : false) {
                                            updateFabVisibilityForBottomSheet(view2, floatingActionButton);
                                        }
                                    }
                                    return false;
                                }

                                @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
                                public boolean onLayoutChild(CoordinatorLayout coordinatorLayout, View view, int i) {
                                    FloatingActionButton floatingActionButton = (FloatingActionButton) view;
                                    List<View> dependencies = coordinatorLayout.getDependencies(floatingActionButton);
                                    int size = dependencies.size();
                                    for (int i2 = 0; i2 < size; i2++) {
                                        View view2 = dependencies.get(i2);
                                        if (!(view2 instanceof AppBarLayout)) {
                                            ViewGroup.LayoutParams layoutParams = view2.getLayoutParams();
                                            if ((layoutParams instanceof CoordinatorLayout.LayoutParams ? ((CoordinatorLayout.LayoutParams) layoutParams).mBehavior instanceof BottomSheetBehavior : false) && updateFabVisibilityForBottomSheet(view2, floatingActionButton)) {
                                                break;
                                            }
                                        } else if (updateFabVisibilityForAppBarLayout(coordinatorLayout, (AppBarLayout) view2, floatingActionButton)) {
                                            break;
                                        }
                                    }
                                    coordinatorLayout.onLayoutChild(floatingActionButton, i);
                                    return true;
                                }

                                public void setInternalAutoHideListener(OnVisibilityChangedListener onVisibilityChangedListener) {
                                }

                                public final boolean shouldUpdateVisibility(View view, FloatingActionButton floatingActionButton) {
                                    return this.autoHideEnabled && ((CoordinatorLayout.LayoutParams) floatingActionButton.getLayoutParams()).mAnchorId == view.getId() && floatingActionButton.userSetVisibility == 0;
                                }

                                public final boolean updateFabVisibilityForAppBarLayout(CoordinatorLayout coordinatorLayout, AppBarLayout appBarLayout, FloatingActionButton floatingActionButton) {
                                    if (!shouldUpdateVisibility(appBarLayout, floatingActionButton)) {
                                        return false;
                                    }
                                    if (this.tmpRect == null) {
                                        this.tmpRect = new Rect();
                                    }
                                    Rect rect = this.tmpRect;
                                    DescendantOffsetUtils.getDescendantRect(coordinatorLayout, appBarLayout, rect);
                                    if (rect.bottom <= appBarLayout.getMinimumHeightForVisibleOverlappingContent()) {
                                        floatingActionButton.hide(null, false);
                                        return true;
                                    }
                                    floatingActionButton.show(null, false);
                                    return true;
                                }

                                public final boolean updateFabVisibilityForBottomSheet(View view, FloatingActionButton floatingActionButton) {
                                    if (!shouldUpdateVisibility(view, floatingActionButton)) {
                                        return false;
                                    }
                                    if (view.getTop() < (floatingActionButton.getHeight() / 2) + ((ViewGroup.MarginLayoutParams) ((CoordinatorLayout.LayoutParams) floatingActionButton.getLayoutParams())).topMargin) {
                                        floatingActionButton.hide(null, false);
                                        return true;
                                    }
                                    floatingActionButton.show(null, false);
                                    return true;
                                }

                                public BaseBehavior(Context context, AttributeSet attributeSet) {
                                    super(context, attributeSet);
                                    TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R$styleable.FloatingActionButton_Behavior_Layout);
                                    this.autoHideEnabled = obtainStyledAttributes.getBoolean(0, true);
                                    obtainStyledAttributes.recycle();
                                }
                            }

                            public final int getSizeDimension(int i) {
                                Resources resources = getResources();
                                if (i != -1) {
                                    if (i != 1) {
                                        return resources.getDimensionPixelSize(R.dimen.design_fab_size_normal);
                                    }
                                    return resources.getDimensionPixelSize(R.dimen.design_fab_size_mini);
                                } else if (Math.max(resources.getConfiguration().screenWidthDp, resources.getConfiguration().screenHeightDp) < 470) {
                                    return getSizeDimension(1);
                                } else {
                                    return getSizeDimension(0);
                                }
                            }
                        }
