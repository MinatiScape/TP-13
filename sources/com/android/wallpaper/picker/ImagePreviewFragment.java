package com.android.wallpaper.picker;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.app.WallpaperColors;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.ColorSpace;
import android.graphics.Point;
import android.graphics.PointF;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.Surface;
import android.view.SurfaceControlViewHost;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import androidx.appcompat.R$bool;
import androidx.cardview.R$style;
import androidx.cardview.widget.CardView;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.constraintlayout.widget.ConstraintSet;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.asset.CurrentWallpaperAssetVN;
import com.android.wallpaper.asset.StreamableAsset$$ExternalSyntheticLambda0;
import com.android.wallpaper.model.SetWallpaperViewModel;
import com.android.wallpaper.module.BitmapCropper;
import com.android.wallpaper.module.DefaultBitmapCropper;
import com.android.wallpaper.module.Injector;
import com.android.wallpaper.module.WallpaperPreferences;
import com.android.wallpaper.picker.ImagePreviewFragment;
import com.android.wallpaper.picker.PreviewFragment;
import com.android.wallpaper.util.DiskBasedLogger$$ExternalSyntheticLambda0;
import com.android.wallpaper.util.FullScreenAnimation;
import com.android.wallpaper.util.ScreenSizeCalculator;
import com.android.wallpaper.util.WallpaperCropUtils;
import com.android.wallpaper.widget.BottomActionBar;
import com.android.wallpaper.widget.LockScreenPreviewer;
import com.bumptech.glide.Glide;
import com.bumptech.glide.MemoryCategory;
import com.davemorrissey.labs.subscaleview.ImageSource;
import com.davemorrissey.labs.subscaleview.SubsamplingScaleImageView;
import com.google.android.material.tabs.TabLayout;
import com.google.common.math.IntMath;
import java.io.ByteArrayOutputStream;
import java.util.Locale;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes.dex */
public class ImagePreviewFragment extends PreviewFragment {
    public static final ExecutorService sExecutor = Executors.newCachedThreadPool();
    public ConstraintLayout mContainer;
    public SubsamplingScaleImageView mFullResImageView;
    public ViewGroup mLockPreviewContainer;
    public LockScreenPreviewer mLockScreenPreviewer;
    public ImageView mLowResImageView;
    public Future<Integer> mPlaceholderColorFuture;
    public Point mRawWallpaperSize;
    public Point mScreenSize;
    public TouchForwardingLayout mTouchForwardingLayout;
    public Asset mWallpaperAsset;
    public WallpaperColors mWallpaperColors;
    public WallpaperPreferences mWallpaperPreferences;
    public Point mWallpaperScreenSize;
    public SurfaceView mWallpaperSurface;
    public SurfaceView mWorkspaceSurface;
    public WorkspaceSurfaceHolderCallback mWorkspaceSurfaceCallback;
    public final WallpaperSurfaceCallback mWallpaperSurfaceCallback = new WallpaperSurfaceCallback();
    public final AtomicInteger mImageScaleChangeCounter = new AtomicInteger(0);
    public final AtomicInteger mRecalculateColorCounter = new AtomicInteger(0);
    public final Injector mInjector = R$style.getInjector();
    public boolean mIsSurfaceCreated = false;

    /* renamed from: com.android.wallpaper.picker.ImagePreviewFragment$3  reason: invalid class name */
    /* loaded from: classes.dex */
    public final class AnonymousClass3 extends SubsamplingScaleImageView.DefaultOnStateChangedListener {
        public AnonymousClass3() {
        }
    }

    /* renamed from: com.android.wallpaper.picker.ImagePreviewFragment$4  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass4 implements BitmapCropper.Callback {
        public final /* synthetic */ boolean val$cacheColor;
        public final /* synthetic */ Context val$context;

        public AnonymousClass4(boolean z, Context context) {
            this.val$cacheColor = z;
            this.val$context = context;
        }

        @Override // com.android.wallpaper.module.BitmapCropper.Callback
        public final void onBitmapCropped(final Bitmap bitmap) {
            ImagePreviewFragment.this.mRecalculateColorCounter.incrementAndGet();
            ExecutorService executorService = ImagePreviewFragment.sExecutor;
            final boolean z = this.val$cacheColor;
            final Context context = this.val$context;
            executorService.execute(new Runnable() { // from class: com.android.wallpaper.picker.ImagePreviewFragment$4$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    ImagePreviewFragment.AnonymousClass4 r0 = ImagePreviewFragment.AnonymousClass4.this;
                    Bitmap bitmap2 = bitmap;
                    boolean z2 = z;
                    Context context2 = context;
                    r0.getClass();
                    ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                    boolean z3 = false;
                    if (bitmap2.compress(Bitmap.CompressFormat.PNG, 100, byteArrayOutputStream)) {
                        byte[] byteArray = byteArrayOutputStream.toByteArray();
                        new BitmapFactory.Options().inPreferredColorSpace = ColorSpace.get(ColorSpace.Named.SRGB);
                        bitmap2 = BitmapFactory.decodeByteArray(byteArray, 0, byteArray.length);
                    }
                    if (bitmap2.getConfig() == Bitmap.Config.HARDWARE) {
                        bitmap2 = bitmap2.copy(Bitmap.Config.ARGB_8888, false);
                        z3 = true;
                    }
                    WallpaperColors fromBitmap = WallpaperColors.fromBitmap(bitmap2);
                    if (z3) {
                        bitmap2.recycle();
                    }
                    if (ImagePreviewFragment.this.mRecalculateColorCounter.decrementAndGet() == 0) {
                        Handler.getMain().post(new StreamableAsset$$ExternalSyntheticLambda0(r0, fromBitmap, 1));
                    }
                    if (z2) {
                        ImagePreviewFragment imagePreviewFragment = ImagePreviewFragment.this;
                        imagePreviewFragment.mWallpaperPreferences.storeWallpaperColors(imagePreviewFragment.mWallpaper.getStoredWallpaperId(context2), fromBitmap);
                    }
                }
            });
        }

        @Override // com.android.wallpaper.module.BitmapCropper.Callback
        public final void onError(OutOfMemoryError outOfMemoryError) {
            Log.w("ImagePreviewFragment", "Recalculate colors, crop and scale bitmap failed.", outOfMemoryError);
        }
    }

    /* loaded from: classes.dex */
    public class WallpaperSurfaceCallback implements SurfaceHolder.Callback {
        public SurfaceControlViewHost mHost;
        public Surface mLastSurface;

        @Override // android.view.SurfaceHolder.Callback
        public final void surfaceChanged(SurfaceHolder surfaceHolder, int i, int i2, int i3) {
        }

        @Override // android.view.SurfaceHolder.Callback
        public final void surfaceDestroyed(SurfaceHolder surfaceHolder) {
        }

        public WallpaperSurfaceCallback() {
        }

        @Override // android.view.SurfaceHolder.Callback
        public final void surfaceCreated(SurfaceHolder surfaceHolder) {
            if (this.mLastSurface != surfaceHolder.getSurface()) {
                this.mLastSurface = surfaceHolder.getSurface();
                SubsamplingScaleImageView subsamplingScaleImageView = ImagePreviewFragment.this.mFullResImageView;
                boolean z = true;
                if (subsamplingScaleImageView != null) {
                    subsamplingScaleImageView.reset(true);
                    subsamplingScaleImageView.bitmapPaint = null;
                    subsamplingScaleImageView.tileBgPaint = null;
                }
                Context context = ImagePreviewFragment.this.getContext();
                View inflate = LayoutInflater.from(context).inflate(R.layout.fullscreen_wallpaper_preview, (ViewGroup) null);
                ImagePreviewFragment.this.mFullResImageView = (SubsamplingScaleImageView) inflate.findViewById(R.id.full_res_image);
                ImagePreviewFragment.this.mLowResImageView = (ImageView) inflate.findViewById(R.id.low_res_image);
                ImagePreviewFragment imagePreviewFragment = ImagePreviewFragment.this;
                imagePreviewFragment.mWallpaperAsset.decodeRawDimensions(imagePreviewFragment.getActivity(), new Asset.DimensionsReceiver() { // from class: com.android.wallpaper.picker.ImagePreviewFragment$WallpaperSurfaceCallback$$ExternalSyntheticLambda0
                    @Override // com.android.wallpaper.asset.Asset.DimensionsReceiver
                    public final void onDimensionsDecoded(Point point) {
                        SubsamplingScaleImageView subsamplingScaleImageView2;
                        ImagePreviewFragment.WallpaperSurfaceCallback wallpaperSurfaceCallback = ImagePreviewFragment.WallpaperSurfaceCallback.this;
                        if (ImagePreviewFragment.this.getActivity() != null) {
                            if (point == null) {
                                ImagePreviewFragment.this.showLoadWallpaperErrorDialog();
                                return;
                            }
                            BottomActionBar bottomActionBar = ((PreviewFragment) ImagePreviewFragment.this).mBottomActionBar;
                            if (bottomActionBar != null) {
                                bottomActionBar.enableActions();
                            }
                            final ImagePreviewFragment imagePreviewFragment2 = ImagePreviewFragment.this;
                            imagePreviewFragment2.mRawWallpaperSize = point;
                            synchronized (imagePreviewFragment2) {
                                if (!(imagePreviewFragment2.mRawWallpaperSize == null || (subsamplingScaleImageView2 = imagePreviewFragment2.mFullResImageView) == null || subsamplingScaleImageView2.imageLoadedSent)) {
                                    String storedWallpaperId = imagePreviewFragment2.mWallpaper.getStoredWallpaperId(imagePreviewFragment2.getContext());
                                    final boolean z2 = true;
                                    if (storedWallpaperId == null || imagePreviewFragment2.mWallpaperPreferences.getWallpaperColors(storedWallpaperId) == null) {
                                        z2 = false;
                                    }
                                    if (z2) {
                                        Handler.getMain().post(new ImagePreviewFragment$$ExternalSyntheticLambda3(imagePreviewFragment2, 0));
                                    }
                                    imagePreviewFragment2.mFullResImageView.setMinimumScaleType();
                                    imagePreviewFragment2.mFullResImageView.setPanLimit();
                                    Point point2 = new Point(imagePreviewFragment2.mRawWallpaperSize);
                                    imagePreviewFragment2.mWallpaperAsset.decodeBitmap(point2.x, point2.y, new Asset.BitmapReceiver() { // from class: com.android.wallpaper.picker.ImagePreviewFragment$$ExternalSyntheticLambda1
                                        @Override // com.android.wallpaper.asset.Asset.BitmapReceiver
                                        public final void onBitmapDecoded(Bitmap bitmap) {
                                            ImagePreviewFragment imagePreviewFragment3 = ImagePreviewFragment.this;
                                            boolean z3 = z2;
                                            ExecutorService executorService = ImagePreviewFragment.sExecutor;
                                            if (imagePreviewFragment3.getActivity() != null) {
                                                if (bitmap == null) {
                                                    imagePreviewFragment3.showLoadWallpaperErrorDialog();
                                                    return;
                                                }
                                                imagePreviewFragment3.mWallpaperSurface.setBackgroundColor(0);
                                                SubsamplingScaleImageView subsamplingScaleImageView3 = imagePreviewFragment3.mFullResImageView;
                                                if (subsamplingScaleImageView3 != null) {
                                                    subsamplingScaleImageView3.setImage(new ImageSource(bitmap));
                                                    if (z3) {
                                                        imagePreviewFragment3.crossFadeInMosaicView();
                                                    } else {
                                                        imagePreviewFragment3.mFullResImageView.setAlpha(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                                                    }
                                                    boolean z4 = imagePreviewFragment3.mWallpaperAsset instanceof CurrentWallpaperAssetVN;
                                                    Point point3 = new Point(imagePreviewFragment3.mWallpaperSurface.getMeasuredWidth(), imagePreviewFragment3.mWallpaperSurface.getMeasuredHeight());
                                                    Rect calculateVisibleRect = WallpaperCropUtils.calculateVisibleRect(imagePreviewFragment3.mRawWallpaperSize, point3);
                                                    if (z4) {
                                                        if (WallpaperCropUtils.isRtl(imagePreviewFragment3.requireContext())) {
                                                            calculateVisibleRect.offsetTo(imagePreviewFragment3.mRawWallpaperSize.x - calculateVisibleRect.width(), calculateVisibleRect.top);
                                                        } else {
                                                            calculateVisibleRect.offsetTo(0, calculateVisibleRect.top);
                                                        }
                                                    }
                                                    PointF pointF = new PointF(calculateVisibleRect.centerX(), calculateVisibleRect.centerY());
                                                    float calculateMinZoom = WallpaperCropUtils.calculateMinZoom(new Point(calculateVisibleRect.width(), calculateVisibleRect.height()), point3);
                                                    imagePreviewFragment3.mFullResImageView.maxScale = Math.max(8.0f, calculateMinZoom);
                                                    SubsamplingScaleImageView subsamplingScaleImageView4 = imagePreviewFragment3.mFullResImageView;
                                                    subsamplingScaleImageView4.minScale = calculateMinZoom;
                                                    subsamplingScaleImageView4.anim = null;
                                                    subsamplingScaleImageView4.pendingScale = Float.valueOf(calculateMinZoom);
                                                    subsamplingScaleImageView4.sPendingCenter = pointF;
                                                    subsamplingScaleImageView4.sRequestedCenter = pointF;
                                                    subsamplingScaleImageView4.invalidate();
                                                    imagePreviewFragment3.mFullResImageView.onStateChangedListener = new ImagePreviewFragment.AnonymousClass3();
                                                    if (!z3) {
                                                        Handler.getMain().post(new DiskBasedLogger$$ExternalSyntheticLambda0(imagePreviewFragment3, 1));
                                                    }
                                                }
                                            }
                                        }
                                    });
                                    imagePreviewFragment2.mFullResImageView.setOnTouchListener(new View.OnTouchListener() { // from class: com.android.wallpaper.picker.ImagePreviewFragment$$ExternalSyntheticLambda0
                                        @Override // android.view.View.OnTouchListener
                                        public final boolean onTouch(View view, MotionEvent motionEvent) {
                                            boolean z3;
                                            ImagePreviewFragment imagePreviewFragment3 = ImagePreviewFragment.this;
                                            ExecutorService executorService = ImagePreviewFragment.sExecutor;
                                            BottomActionBar bottomActionBar2 = ((PreviewFragment) imagePreviewFragment3).mBottomActionBar;
                                            if (bottomActionBar2 != null) {
                                                if (bottomActionBar2.mBottomSheetBehavior.state == 4) {
                                                    z3 = true;
                                                } else {
                                                    z3 = false;
                                                }
                                                if (!z3) {
                                                    bottomActionBar2.hideBottomSheetAndDeselectButtonIfExpanded();
                                                    return true;
                                                }
                                            }
                                            return false;
                                        }
                                    });
                                }
                            }
                        }
                    }
                });
                float f = context.getResources().getFloat(Resources.getSystem().getIdentifier("config_wallpaperMaxScale", "dimen", "android"));
                int width = ImagePreviewFragment.this.mWallpaperSurface.getWidth();
                int height = ImagePreviewFragment.this.mWallpaperSurface.getHeight();
                ImagePreviewFragment imagePreviewFragment2 = ImagePreviewFragment.this;
                if (!imagePreviewFragment2.mScreenSize.equals(imagePreviewFragment2.mWallpaperScreenSize)) {
                    ImagePreviewFragment imagePreviewFragment3 = ImagePreviewFragment.this;
                    width = (int) (imagePreviewFragment3.mWallpaperScreenSize.x * (width / imagePreviewFragment3.mScreenSize.x));
                }
                int i = (int) (width * f);
                int i2 = (int) (height * f);
                int i3 = (width - i) / 2;
                int i4 = (height - i2) / 2;
                if (WallpaperCropUtils.isRtl(context)) {
                    i3 *= -1;
                }
                ViewGroup.LayoutParams layoutParams = ImagePreviewFragment.this.mWallpaperSurface.getLayoutParams();
                layoutParams.width = i;
                layoutParams.height = i2;
                ImagePreviewFragment.this.mWallpaperSurface.setX(i3);
                ImagePreviewFragment.this.mWallpaperSurface.setY(i4);
                ImagePreviewFragment.this.mWallpaperSurface.setLayoutParams(layoutParams);
                ImagePreviewFragment.this.mWallpaperSurface.requestLayout();
                FragmentActivity requireActivity = ImagePreviewFragment.this.requireActivity();
                int colorAttr = R$bool.getColorAttr(requireActivity, 16842801);
                if (ImagePreviewFragment.this.mPlaceholderColorFuture.isDone()) {
                    try {
                        int intValue = ImagePreviewFragment.this.mWallpaper.computePlaceholderColor(context).get().intValue();
                        if (intValue != 0) {
                            colorAttr = intValue;
                        }
                    } catch (InterruptedException | ExecutionException unused) {
                    }
                }
                ImagePreviewFragment.this.mWallpaperSurface.setResizeBackgroundColor(colorAttr);
                ImagePreviewFragment.this.mWallpaperSurface.setBackgroundColor(colorAttr);
                ImagePreviewFragment.this.mLowResImageView.setBackgroundColor(colorAttr);
                ImagePreviewFragment imagePreviewFragment4 = ImagePreviewFragment.this;
                imagePreviewFragment4.mWallpaperAsset.loadLowResDrawable(requireActivity, imagePreviewFragment4.mLowResImageView, colorAttr, imagePreviewFragment4.mPreviewBitmapTransformation);
                inflate.measure(View.MeasureSpec.makeMeasureSpec(i, IntMath.MAX_SIGNED_POWER_OF_TWO), View.MeasureSpec.makeMeasureSpec(i2, IntMath.MAX_SIGNED_POWER_OF_TWO));
                inflate.layout(0, 0, i, i2);
                ImagePreviewFragment imagePreviewFragment5 = ImagePreviewFragment.this;
                imagePreviewFragment5.mTouchForwardingLayout.mView = imagePreviewFragment5.mFullResImageView;
                SurfaceControlViewHost surfaceControlViewHost = this.mHost;
                if (surfaceControlViewHost != null) {
                    surfaceControlViewHost.release();
                    this.mHost = null;
                }
                ImagePreviewFragment.this.mIsSurfaceCreated = false;
                SurfaceControlViewHost surfaceControlViewHost2 = new SurfaceControlViewHost(context, context.getDisplay(), ImagePreviewFragment.this.mWallpaperSurface.getHostToken());
                this.mHost = surfaceControlViewHost2;
                surfaceControlViewHost2.setView(inflate, inflate.getWidth(), inflate.getHeight());
                ImagePreviewFragment.this.mWallpaperSurface.setChildSurfacePackage(this.mHost.getSurfacePackage());
                ImagePreviewFragment imagePreviewFragment6 = ImagePreviewFragment.this;
                imagePreviewFragment6.mIsSurfaceCreated = true;
                if (imagePreviewFragment6.mLastSelectedTabPositionOptional.orElse(0).intValue() != 0) {
                    z = false;
                }
                imagePreviewFragment6.updateScreenPreview(z);
            }
        }
    }

    @Override // com.android.wallpaper.picker.PreviewFragment
    public int getLayoutResId() {
        return R.layout.fragment_image_preview;
    }

    public final Rect calculateCropRect(Context context) {
        float f = this.mFullResImageView.scale;
        Context applicationContext = context.getApplicationContext();
        Rect rect = new Rect();
        SubsamplingScaleImageView subsamplingScaleImageView = this.mFullResImageView;
        if (subsamplingScaleImageView.vTranslate != null && subsamplingScaleImageView.readySent) {
            rect.set(0, 0, subsamplingScaleImageView.getWidth(), subsamplingScaleImageView.getHeight());
            if (subsamplingScaleImageView.vTranslate != null && subsamplingScaleImageView.readySent) {
                rect.set((int) subsamplingScaleImageView.viewToSourceX(rect.left), (int) subsamplingScaleImageView.viewToSourceY(rect.top), (int) subsamplingScaleImageView.viewToSourceX(rect.right), (int) subsamplingScaleImageView.viewToSourceY(rect.bottom));
                subsamplingScaleImageView.fileSRect(rect, rect);
                rect.set(Math.max(0, rect.left), Math.max(0, rect.top), Math.min(subsamplingScaleImageView.sWidth, rect.right), Math.min(subsamplingScaleImageView.sHeight, rect.bottom));
            }
        }
        int measuredWidth = this.mWallpaperSurface.getMeasuredWidth();
        int measuredHeight = this.mWallpaperSurface.getMeasuredHeight();
        int max = Math.max(measuredWidth, measuredHeight);
        int min = Math.min(measuredWidth, measuredHeight);
        Point point = new Point(measuredWidth, measuredHeight);
        return WallpaperCropUtils.calculateCropRect(applicationContext, f, this.mRawWallpaperSize, WallpaperCropUtils.calculateCropSurfaceSize(applicationContext.getResources(), max, min, measuredWidth, measuredHeight), point, (int) (rect.left * f), (int) (rect.top * f));
    }

    public void onWallpaperColorsChanged(WallpaperColors wallpaperColors) {
        FullScreenAnimation.FullScreenTextColor fullScreenTextColor;
        ((PreviewFragment) this).mBottomActionBar.enableActionButtonsWithBottomSheet(true);
        this.mWallpaperColors = wallpaperColors;
        this.mLockScreenPreviewer.setColor(wallpaperColors);
        FullScreenAnimation fullScreenAnimation = this.mFullScreenAnimation;
        if (wallpaperColors == null || (wallpaperColors.getColorHints() & 1) == 0) {
            fullScreenTextColor = FullScreenAnimation.FullScreenTextColor.LIGHT;
        } else {
            fullScreenTextColor = FullScreenAnimation.FullScreenTextColor.DARK;
        }
        fullScreenAnimation.mFullScreenTextColor = fullScreenTextColor;
        fullScreenAnimation.animateColor(fullScreenAnimation.mIsFullScreen);
    }

    public void setupActionBar() {
        BottomActionBar bottomActionBar = ((PreviewFragment) this).mBottomActionBar;
        PreviewFragment.WallpaperInfoContent wallpaperInfoContent = new PreviewFragment.WallpaperInfoContent(getContext());
        BottomActionBar.BottomAction bottomAction = BottomActionBar.BottomAction.INFORMATION;
        bottomActionBar.bindBottomSheetContentWithAction(wallpaperInfoContent, bottomAction);
        BottomActionBar bottomActionBar2 = ((PreviewFragment) this).mBottomActionBar;
        BottomActionBar.BottomAction bottomAction2 = BottomActionBar.BottomAction.APPLY;
        bottomActionBar2.showActionsOnly(bottomAction, BottomActionBar.BottomAction.EDIT, bottomAction2);
        ((PreviewFragment) this).mBottomActionBar.setActionClickListener(bottomAction2, new PreviewFragment$$ExternalSyntheticLambda1(this, 1));
    }

    @Override // com.android.wallpaper.picker.PreviewFragment
    public void updateScreenPreview(boolean z) {
        int i;
        SurfaceView surfaceView = this.mWorkspaceSurface;
        int i2 = 0;
        if (!z || !this.mIsSurfaceCreated) {
            i = 8;
        } else {
            i = 0;
        }
        surfaceView.setVisibility(i);
        ViewGroup viewGroup = this.mLockPreviewContainer;
        if (z) {
            i2 = 4;
        }
        viewGroup.setVisibility(i2);
        this.mFullScreenAnimation.mIsHomeSelected = z;
    }

    public final void crossFadeInMosaicView() {
        boolean z;
        if (getActivity() != null) {
            if (((Fragment) this).mHost == null || !this.mAdded) {
                z = false;
            } else {
                z = true;
            }
            if (z) {
                this.mFullResImageView.setAlpha(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                this.mFullResImageView.animate().alpha(1.0f).setInterpolator(PreviewFragment.ALPHA_OUT).setDuration(getResources().getInteger(17694720)).setListener(new AnimatorListenerAdapter() { // from class: com.android.wallpaper.picker.ImagePreviewFragment.5
                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public final void onAnimationEnd(Animator animator) {
                        ImageView imageView = ImagePreviewFragment.this.mLowResImageView;
                        if (imageView != null) {
                            imageView.setImageBitmap(null);
                        }
                    }
                });
            }
        }
    }

    @Override // com.android.wallpaper.picker.PreviewFragment, com.android.wallpaper.picker.AppbarFragment, com.android.wallpaper.picker.BottomActionBarFragment
    public final void onBottomActionBarReady(BottomActionBar bottomActionBar) {
        super.onBottomActionBarReady(bottomActionBar);
        setupActionBar();
        final View findViewById = this.mView.findViewById(R.id.separated_tabs_container);
        BottomActionBar bottomActionBar2 = ((PreviewFragment) this).mBottomActionBar;
        bottomActionBar2.mAccessibilityCallback = new BottomActionBar.AccessibilityCallback() { // from class: com.android.wallpaper.picker.ImagePreviewFragment.2
            @Override // com.android.wallpaper.widget.BottomActionBar.AccessibilityCallback
            public final void onBottomSheetCollapsed() {
                ImagePreviewFragment.this.mContainer.setImportantForAccessibility(1);
                findViewById.setImportantForAccessibility(1);
            }

            @Override // com.android.wallpaper.widget.BottomActionBar.AccessibilityCallback
            public final void onBottomSheetExpanded() {
                ImagePreviewFragment.this.mContainer.setImportantForAccessibility(4);
                findViewById.setImportantForAccessibility(4);
            }
        };
        bottomActionBar2.setVisibility(0);
        BottomActionBar bottomActionBar3 = ((PreviewFragment) this).mBottomActionBar;
        bottomActionBar3.getClass();
        bottomActionBar3.disableActions(BottomActionBar.BottomAction.values());
        if (this.mRawWallpaperSize != null) {
            ((PreviewFragment) this).mBottomActionBar.enableActions();
        }
    }

    @Override // com.android.wallpaper.picker.PreviewFragment, com.android.wallpaper.picker.LoadWallpaperErrorDialogFragment.Listener
    public final void onClickOk() {
        FragmentActivity activity = getActivity();
        if (activity != null) {
            activity.finish();
        }
    }

    @Override // com.android.wallpaper.picker.PreviewFragment, androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mWallpaperAsset = this.mWallpaper.getAsset(requireContext().getApplicationContext());
        this.mPlaceholderColorFuture = this.mWallpaper.computePlaceholderColor(requireContext());
        this.mWallpaperPreferences = this.mInjector.getPreferences(getContext());
    }

    @Override // com.android.wallpaper.picker.PreviewFragment, androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        final View onCreateView = super.onCreateView(layoutInflater, viewGroup, bundle);
        final FragmentActivity requireActivity = requireActivity();
        ScreenSizeCalculator screenSizeCalculator = ScreenSizeCalculator.getInstance();
        this.mScreenSize = screenSizeCalculator.getScreenSize(requireActivity.getWindowManager().getDefaultDisplay());
        this.mWallpaperScreenSize = screenSizeCalculator.getScreenSize(this.mInjector.getDisplayUtils(requireActivity).getWallpaperDisplay());
        ConstraintLayout constraintLayout = (ConstraintLayout) onCreateView.findViewById(R.id.container);
        this.mContainer = constraintLayout;
        TouchForwardingLayout touchForwardingLayout = (TouchForwardingLayout) constraintLayout.findViewById(R.id.touch_forwarding_layout);
        this.mTouchForwardingLayout = touchForwardingLayout;
        touchForwardingLayout.mForwardingEnabled = true;
        updatePreviewHeader(onCreateView);
        ConstraintSet constraintSet = new ConstraintSet();
        constraintSet.clone(this.mContainer);
        constraintSet.get(this.mTouchForwardingLayout.getId()).layout.dimensionRatio = String.format(Locale.US, "%d:%d", Integer.valueOf(this.mScreenSize.x), Integer.valueOf(this.mScreenSize.y));
        constraintSet.applyTo(this.mContainer);
        SurfaceView surfaceView = (SurfaceView) this.mContainer.findViewById(R.id.workspace_surface);
        this.mWorkspaceSurface = surfaceView;
        this.mWorkspaceSurfaceCallback = createWorkspaceSurfaceCallback(surfaceView);
        this.mWallpaperSurface = (SurfaceView) this.mContainer.findViewById(R.id.wallpaper_surface);
        this.mLockPreviewContainer = (ViewGroup) this.mContainer.findViewById(R.id.lock_screen_preview_container);
        this.mWorkspaceSurface.setResizeBackgroundColor(R$bool.getColorAttr(getContext(), 16842801));
        LockScreenPreviewer lockScreenPreviewer = new LockScreenPreviewer(this.mLifecycleRegistry, getContext(), this.mLockPreviewContainer);
        this.mLockScreenPreviewer = lockScreenPreviewer;
        lockScreenPreviewer.setDateViewVisibility(!this.mFullScreenAnimation.mIsFullScreen);
        this.mFullScreenAnimation.mFullScreenStatusListener = new ImagePreviewFragment$$ExternalSyntheticLambda2(this);
        setUpTabs((TabLayout) onCreateView.findViewById(R.id.separated_tabs));
        onCreateView.addOnLayoutChangeListener(new View.OnLayoutChangeListener() { // from class: com.android.wallpaper.picker.ImagePreviewFragment.1
            @Override // android.view.View.OnLayoutChangeListener
            public final void onLayoutChange(View view, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
                ((CardView) ImagePreviewFragment.this.mWorkspaceSurface.getParent()).setRadius(R$style.getPreviewCornerRadius(requireActivity, ((CardView) ImagePreviewFragment.this.mWorkspaceSurface.getParent()).getMeasuredWidth()));
                onCreateView.removeOnLayoutChangeListener(this);
            }
        });
        this.mWallpaperSurface.getHolder().addCallback(this.mWallpaperSurfaceCallback);
        this.mWorkspaceSurface.setZOrderMediaOverlay(true);
        this.mWorkspaceSurface.getHolder().addCallback(this.mWorkspaceSurfaceCallback);
        Glide.get(requireActivity).setMemoryCategory(MemoryCategory.LOW);
        return onCreateView;
    }

    @Override // com.android.wallpaper.picker.PreviewFragment, androidx.fragment.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        SubsamplingScaleImageView subsamplingScaleImageView = this.mFullResImageView;
        if (subsamplingScaleImageView != null) {
            subsamplingScaleImageView.reset(true);
            subsamplingScaleImageView.bitmapPaint = null;
            subsamplingScaleImageView.tileBgPaint = null;
        }
        LockScreenPreviewer lockScreenPreviewer = this.mLockScreenPreviewer;
        if (lockScreenPreviewer != null) {
            lockScreenPreviewer.release();
        }
        WallpaperSurfaceCallback wallpaperSurfaceCallback = this.mWallpaperSurfaceCallback;
        SurfaceControlViewHost surfaceControlViewHost = wallpaperSurfaceCallback.mHost;
        if (surfaceControlViewHost != null) {
            surfaceControlViewHost.release();
            wallpaperSurfaceCallback.mHost = null;
        }
        ImagePreviewFragment.this.mIsSurfaceCreated = false;
        this.mWorkspaceSurfaceCallback.cleanUp();
    }

    public final void recalculateColors(boolean z) {
        Context context = getContext();
        if (context == null) {
            Log.e("ImagePreviewFragment", "Got null context, skip recalculating colors");
            return;
        }
        ((DefaultBitmapCropper) this.mInjector.getBitmapCropper()).cropAndScaleBitmap(this.mWallpaperAsset, this.mFullResImageView.scale, calculateCropRect(context), false, new AnonymousClass4(z, context));
    }

    @Override // com.android.wallpaper.picker.PreviewFragment
    public void setCurrentWallpaper(int i) {
        float f;
        Rect calculateCropRect = calculateCropRect(getContext());
        float f2 = this.mFullResImageView.scale;
        Point point = this.mWallpaperScreenSize;
        int i2 = point.x;
        int i3 = point.y;
        int round = Math.round(calculateCropRect.width() / f2);
        int round2 = Math.round(calculateCropRect.height() / f2);
        int width = calculateCropRect.width();
        int height = calculateCropRect.height();
        if (width >= i2 || height >= i3) {
            f = 1.0f;
        } else {
            if (i2 > round || i3 > round2) {
                i3 = round;
                i2 = i3;
            }
            f = Math.min(i2 / width, i3 / height);
        }
        this.mWallpaperSetter.setCurrentWallpaper(getActivity(), this.mWallpaper, this.mWallpaperAsset, i, this.mFullResImageView.scale * f, new Rect(Math.round(calculateCropRect.left * f), Math.round(calculateCropRect.top * f), Math.round(calculateCropRect.right * f), Math.round(calculateCropRect.bottom * f)), this.mWallpaperColors, new SetWallpaperViewModel.AnonymousClass1());
    }

    @Override // com.android.wallpaper.picker.BottomActionBarFragment, androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
    }

    public SubsamplingScaleImageView getFullResImageView() {
        return this.mFullResImageView;
    }
}
