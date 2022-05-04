package com.bumptech.glide.load.resource.gif;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.view.Gravity;
import androidx.collection.ContainerHelpers;
import com.android.systemui.shared.R;
import com.bumptech.glide.load.resource.gif.GifFrameLoader;
/* loaded from: classes.dex */
public final class GifDrawable extends Drawable implements GifFrameLoader.FrameCallback, Animatable {
    public boolean applyGravity;
    public Rect destRect;
    public boolean isRecycled;
    public boolean isRunning;
    public boolean isStarted;
    public boolean isVisible;
    public int loopCount;
    public int maxLoopCount;
    public Paint paint;
    public final GifState state;

    /* loaded from: classes.dex */
    public static final class GifState extends Drawable.ConstantState {
        public final GifFrameLoader frameLoader;

        @Override // android.graphics.drawable.Drawable.ConstantState
        public final int getChangingConfigurations() {
            return 0;
        }

        @Override // android.graphics.drawable.Drawable.ConstantState
        public final Drawable newDrawable() {
            return new GifDrawable(this);
        }

        @Override // android.graphics.drawable.Drawable.ConstantState
        public final Drawable newDrawable(Resources resources) {
            return new GifDrawable(this);
        }

        public GifState(GifFrameLoader gifFrameLoader) {
            this.frameLoader = gifFrameLoader;
        }
    }

    public GifDrawable() {
        throw null;
    }

    public GifDrawable(GifState gifState) {
        this.isVisible = true;
        this.maxLoopCount = -1;
        ContainerHelpers.checkNotNull(gifState);
        this.state = gifState;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        return -2;
    }

    @Override // android.graphics.drawable.Animatable
    public final void start() {
        this.isStarted = true;
        this.loopCount = 0;
        if (this.isVisible) {
            startRunning();
        }
    }

    @Override // android.graphics.drawable.Animatable
    public final void stop() {
        this.isStarted = false;
        this.isRunning = false;
        GifFrameLoader gifFrameLoader = this.state.frameLoader;
        gifFrameLoader.callbacks.remove(this);
        if (gifFrameLoader.callbacks.isEmpty()) {
            gifFrameLoader.isRunning = false;
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        Bitmap bitmap;
        if (!this.isRecycled) {
            if (this.applyGravity) {
                int intrinsicWidth = getIntrinsicWidth();
                int intrinsicHeight = getIntrinsicHeight();
                Rect bounds = getBounds();
                if (this.destRect == null) {
                    this.destRect = new Rect();
                }
                Gravity.apply(R.styleable.AppCompatTheme_windowActionModeOverlay, intrinsicWidth, intrinsicHeight, bounds, this.destRect);
                this.applyGravity = false;
            }
            GifFrameLoader gifFrameLoader = this.state.frameLoader;
            GifFrameLoader.DelayTarget delayTarget = gifFrameLoader.current;
            if (delayTarget != null) {
                bitmap = delayTarget.resource;
            } else {
                bitmap = gifFrameLoader.firstFrame;
            }
            if (this.destRect == null) {
                this.destRect = new Rect();
            }
            Rect rect = this.destRect;
            if (this.paint == null) {
                this.paint = new Paint(2);
            }
            canvas.drawBitmap(bitmap, (Rect) null, rect, this.paint);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicHeight() {
        return this.state.frameLoader.height;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicWidth() {
        return this.state.frameLoader.width;
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i) {
        if (this.paint == null) {
            this.paint = new Paint(2);
        }
        this.paint.setAlpha(i);
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
        if (this.paint == null) {
            this.paint = new Paint(2);
        }
        this.paint.setColorFilter(colorFilter);
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean setVisible(boolean z, boolean z2) {
        ContainerHelpers.checkArgument(!this.isRecycled, "Cannot change the visibility of a recycled resource. Ensure that you unset the Drawable from your View before changing the View's visibility.");
        this.isVisible = z;
        if (!z) {
            this.isRunning = false;
            GifFrameLoader gifFrameLoader = this.state.frameLoader;
            gifFrameLoader.callbacks.remove(this);
            if (gifFrameLoader.callbacks.isEmpty()) {
                gifFrameLoader.isRunning = false;
            }
        } else if (this.isStarted) {
            startRunning();
        }
        return super.setVisible(z, z2);
    }

    public final void startRunning() {
        ContainerHelpers.checkArgument(!this.isRecycled, "You cannot start a recycled Drawable. Ensure thatyou clear any references to the Drawable when clearing the corresponding request.");
        if (this.state.frameLoader.gifDecoder.getFrameCount() == 1) {
            invalidateSelf();
        } else if (!this.isRunning) {
            this.isRunning = true;
            GifFrameLoader gifFrameLoader = this.state.frameLoader;
            if (gifFrameLoader.isCleared) {
                throw new IllegalStateException("Cannot subscribe to a cleared frame loader");
            } else if (!gifFrameLoader.callbacks.contains(this)) {
                boolean isEmpty = gifFrameLoader.callbacks.isEmpty();
                gifFrameLoader.callbacks.add(this);
                if (isEmpty && !gifFrameLoader.isRunning) {
                    gifFrameLoader.isRunning = true;
                    gifFrameLoader.isCleared = false;
                    gifFrameLoader.loadNextFrame();
                }
                invalidateSelf();
            } else {
                throw new IllegalStateException("Cannot subscribe twice in a row");
            }
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void onBoundsChange(Rect rect) {
        super.onBoundsChange(rect);
        this.applyGravity = true;
    }

    @Override // com.bumptech.glide.load.resource.gif.GifFrameLoader.FrameCallback
    public final void onFrameReady() {
        GifFrameLoader gifFrameLoader;
        int i;
        Drawable.Callback callback = getCallback();
        while (callback instanceof Drawable) {
            callback = ((Drawable) callback).getCallback();
        }
        if (callback == null) {
            stop();
            invalidateSelf();
            return;
        }
        invalidateSelf();
        GifFrameLoader.DelayTarget delayTarget = this.state.frameLoader.current;
        if (delayTarget != null) {
            i = delayTarget.index;
        } else {
            i = -1;
        }
        if (i == gifFrameLoader.gifDecoder.getFrameCount() - 1) {
            this.loopCount++;
        }
        int i2 = this.maxLoopCount;
        if (i2 != -1 && this.loopCount >= i2) {
            stop();
        }
    }

    public GifDrawable(GifFrameLoader gifFrameLoader, Paint paint) {
        this(new GifState(gifFrameLoader));
        this.paint = paint;
    }

    @Override // android.graphics.drawable.Drawable
    public final Drawable.ConstantState getConstantState() {
        return this.state;
    }

    @Override // android.graphics.drawable.Animatable
    public final boolean isRunning() {
        return this.isRunning;
    }
}
