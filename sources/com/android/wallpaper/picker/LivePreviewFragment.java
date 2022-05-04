package com.android.wallpaper.picker;

import android.annotation.SuppressLint;
import android.app.AlertDialog;
import android.app.WallpaperColors;
import android.app.WallpaperInfo;
import android.app.WallpaperManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.ServiceInfo;
import android.graphics.Point;
import android.net.Uri;
import android.os.Bundle;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import androidx.cardview.widget.CardView;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.constraintlayout.widget.ConstraintSet;
import androidx.fragment.app.FragmentActivity;
import androidx.lifecycle.LiveData;
import androidx.slice.Slice;
import androidx.slice.SliceItem;
import androidx.slice.SliceSpec;
import androidx.slice.widget.ListContent;
import androidx.slice.widget.ShortcutView;
import androidx.slice.widget.SliceChildView;
import androidx.slice.widget.SliceLiveData;
import androidx.slice.widget.SliceView;
import androidx.slice.widget.SliceViewPolicy;
import androidx.slice.widget.TemplateView;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.android.wallpaper.compat.BuildCompat;
import com.android.wallpaper.model.SetWallpaperViewModel;
import com.android.wallpaper.picker.PreviewFragment;
import com.android.wallpaper.util.DiskBasedLogger$$ExternalSyntheticLambda1;
import com.android.wallpaper.util.FullScreenAnimation;
import com.android.wallpaper.util.ScreenSizeCalculator;
import com.android.wallpaper.util.SizeCalculator;
import com.android.wallpaper.util.WallpaperConnection;
import com.android.wallpaper.util.WallpaperSurfaceCallback;
import com.android.wallpaper.widget.BottomActionBar;
import com.android.wallpaper.widget.LockScreenPreviewer;
import com.android.wallpaper.widget.WallpaperColorsLoader;
import com.google.android.material.tabs.TabLayout;
import java.util.Locale;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.Future;
/* loaded from: classes.dex */
public class LivePreviewFragment extends PreviewFragment implements WallpaperConnection.WallpaperConnectionListener {
    public static final /* synthetic */ int $r8$clinit = 0;
    public Intent mDeleteIntent;
    public CardView mHomePreviewCard;
    public ViewGroup mLockPreviewContainer;
    public LockScreenPreviewer mLockScreenPreviewer;
    public Future<Integer> mPlaceholderColorFuture;
    public ViewGroup mPreviewContainer;
    public Point mScreenSize;
    public Intent mSettingsIntent;
    public LiveData<Slice> mSettingsLiveData;
    public SliceView mSettingsSliceView;
    public TouchForwardingLayout mTouchForwardingLayout;
    public WallpaperColors mWallpaperColors;
    public WallpaperConnection mWallpaperConnection;
    public SurfaceView mWallpaperSurface;
    public WallpaperSurfaceCallback mWallpaperSurfaceCallback;
    public SurfaceView mWorkspaceSurface;
    public WorkspaceSurfaceHolderCallback mWorkspaceSurfaceCallback;

    /* loaded from: classes.dex */
    public final class PreviewCustomizeSettingsContent extends BottomActionBar.BottomSheetContent<View> {
        public PreviewCustomizeSettingsContent(Context context, AnonymousClass1 r3) {
            super(context);
        }

        @Override // com.android.wallpaper.widget.BottomActionBar.BottomSheetContent
        public int getViewId() {
            return R.layout.preview_customize_settings;
        }

        @Override // com.android.wallpaper.widget.BottomActionBar.BottomSheetContent
        public void onRecreateView(View view) {
            SliceView sliceView;
            LivePreviewFragment livePreviewFragment = LivePreviewFragment.this;
            LiveData<Slice> liveData = livePreviewFragment.mSettingsLiveData;
            if (liveData != null) {
                if ((liveData.mObservers.mSize > 0) && (sliceView = livePreviewFragment.mSettingsSliceView) != null) {
                    liveData.removeObserver(sliceView);
                }
            }
        }

        @Override // com.android.wallpaper.widget.BottomActionBar.BottomSheetContent
        public void onViewCreated(View view) {
            TemplateView templateView;
            ListContent listContent;
            LivePreviewFragment.this.mSettingsSliceView = (SliceView) view.findViewById(R.id.settings_slice);
            SliceView sliceView = LivePreviewFragment.this.mSettingsSliceView;
            SliceViewPolicy sliceViewPolicy = sliceView.mViewPolicy;
            int i = sliceViewPolicy.mMode;
            if (i != 2) {
                boolean z = true;
                if (i != 2) {
                    sliceViewPolicy.mMode = 2;
                    SliceViewPolicy.PolicyChangeListener policyChangeListener = sliceViewPolicy.mListener;
                    if (!(policyChangeListener == null || (listContent = (templateView = (TemplateView) policyChangeListener).mListContent) == null)) {
                        templateView.updateDisplayedItems(listContent.getHeight(templateView.mSliceStyle, templateView.mViewPolicy));
                    }
                }
                int i2 = sliceView.mViewPolicy.mMode;
                SliceChildView sliceChildView = sliceView.mCurrentView;
                boolean z2 = sliceChildView instanceof ShortcutView;
                Set<SliceItem> loadingActions = sliceChildView.getLoadingActions();
                if (i2 == 3 && !z2) {
                    sliceView.removeView(sliceView.mCurrentView);
                    ShortcutView shortcutView = new ShortcutView(sliceView.getContext());
                    sliceView.mCurrentView = shortcutView;
                    sliceView.addView(shortcutView, sliceView.getChildLp(shortcutView));
                } else if (i2 == 3 || !z2) {
                    z = false;
                } else {
                    sliceView.removeView(sliceView.mCurrentView);
                    TemplateView templateView2 = new TemplateView(sliceView.getContext());
                    sliceView.mCurrentView = templateView2;
                    sliceView.addView(templateView2, sliceView.getChildLp(templateView2));
                }
                if (z) {
                    sliceView.mCurrentView.setPolicy(sliceView.mViewPolicy);
                    sliceView.applyConfigurations();
                    ListContent listContent2 = sliceView.mListContent;
                    if (listContent2 != null && listContent2.isValid()) {
                        sliceView.mCurrentView.setSliceContent(sliceView.mListContent);
                    }
                    sliceView.mCurrentView.setLoadingActions(loadingActions);
                }
                sliceView.updateActions();
            }
            SliceViewPolicy sliceViewPolicy2 = LivePreviewFragment.this.mSettingsSliceView.mViewPolicy;
            boolean z3 = sliceViewPolicy2.mScrollable;
            if (z3 && z3) {
                sliceViewPolicy2.mScrollable = false;
                SliceViewPolicy.PolicyChangeListener policyChangeListener2 = sliceViewPolicy2.mListener;
                if (policyChangeListener2 != null) {
                    TemplateView templateView3 = (TemplateView) policyChangeListener2;
                    templateView3.mRecyclerView.setNestedScrollingEnabled(false);
                    ListContent listContent3 = templateView3.mListContent;
                    if (listContent3 != null) {
                        templateView3.updateDisplayedItems(listContent3.getHeight(templateView3.mSliceStyle, templateView3.mViewPolicy));
                    }
                }
            }
            LivePreviewFragment livePreviewFragment = LivePreviewFragment.this;
            LiveData<Slice> liveData = livePreviewFragment.mSettingsLiveData;
            if (liveData != null) {
                liveData.observeForever(livePreviewFragment.mSettingsSliceView);
            }
        }
    }

    public String getDeleteAction(WallpaperInfo wallpaperInfo) {
        Bundle bundle;
        WallpaperInfo wallpaperInfo2 = WallpaperManager.getInstance(requireContext()).getWallpaperInfo();
        ServiceInfo serviceInfo = wallpaperInfo.getServiceInfo();
        ApplicationInfo applicationInfo = serviceInfo.applicationInfo;
        boolean z = true;
        if (applicationInfo == null || (applicationInfo.flags & 1) == 0) {
            z = false;
        }
        if (!z) {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("This wallpaper is not pre-installed: ");
            m.append(serviceInfo.name);
            Log.d("LivePreviewFragment", m.toString());
            return null;
        }
        ServiceInfo serviceInfo2 = wallpaperInfo2 == null ? null : wallpaperInfo2.getServiceInfo();
        if ((serviceInfo2 == null || !TextUtils.equals(serviceInfo.name, serviceInfo2.name)) && (bundle = serviceInfo.metaData) != null) {
            return bundle.getString("action_delete_live_wallpaper");
        }
        return null;
    }

    @Override // com.android.wallpaper.picker.PreviewFragment
    public int getLayoutResId() {
        return R.layout.fragment_live_preview;
    }

    public String getSettingsActivity(WallpaperInfo wallpaperInfo) {
        return wallpaperInfo.getSettingsActivity();
    }

    @SuppressLint({"NewApi"})
    public Uri getSettingsSliceUri(WallpaperInfo wallpaperInfo) {
        if (BuildCompat.sSdk >= 29) {
            return wallpaperInfo.getSettingsSliceUri();
        }
        return null;
    }

    public Intent getWallpaperIntent(WallpaperInfo wallpaperInfo) {
        return new Intent("android.service.wallpaper.WallpaperService").setClassName(wallpaperInfo.getPackageName(), wallpaperInfo.getServiceName());
    }

    @Override // com.android.wallpaper.picker.PreviewFragment, com.android.wallpaper.picker.AppbarFragment, com.android.wallpaper.picker.BottomActionBarFragment
    public void onBottomActionBarReady(BottomActionBar bottomActionBar) {
        super.onBottomActionBarReady(bottomActionBar);
        BottomActionBar bottomActionBar2 = ((PreviewFragment) this).mBottomActionBar;
        BottomActionBar.BottomAction bottomAction = BottomActionBar.BottomAction.INFORMATION;
        boolean z = false;
        BottomActionBar.BottomAction bottomAction2 = BottomActionBar.BottomAction.DELETE;
        BottomActionBar.BottomAction bottomAction3 = BottomActionBar.BottomAction.CUSTOMIZE;
        BottomActionBar.BottomAction bottomAction4 = BottomActionBar.BottomAction.APPLY;
        bottomActionBar2.showActionsOnly(bottomAction, bottomAction2, BottomActionBar.BottomAction.EDIT, bottomAction3, bottomAction4);
        ((PreviewFragment) this).mBottomActionBar.setActionClickListener(bottomAction4, new View.OnClickListener(this) { // from class: com.android.wallpaper.picker.LivePreviewFragment$$ExternalSyntheticLambda1
            public final /* synthetic */ LivePreviewFragment f$0;

            {
                this.f$0 = this;
            }

            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                switch (r3) {
                    case 0:
                        LivePreviewFragment livePreviewFragment = this.f$0;
                        int i = LivePreviewFragment.$r8$clinit;
                        livePreviewFragment.onSetWallpaperClicked(null);
                        return;
                    case 1:
                        LivePreviewFragment livePreviewFragment2 = this.f$0;
                        livePreviewFragment2.startActivity(livePreviewFragment2.mSettingsIntent, null);
                        return;
                    default:
                        final LivePreviewFragment livePreviewFragment3 = this.f$0;
                        int i2 = LivePreviewFragment.$r8$clinit;
                        Objects.requireNonNull(livePreviewFragment3);
                        new AlertDialog.Builder(livePreviewFragment3.getContext()).setMessage(R.string.delete_wallpaper_confirmation).setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: com.android.wallpaper.picker.LivePreviewFragment$$ExternalSyntheticLambda0
                            @Override // android.content.DialogInterface.OnDismissListener
                            public final void onDismiss(DialogInterface dialogInterface) {
                                LivePreviewFragment livePreviewFragment4 = LivePreviewFragment.this;
                                int i3 = LivePreviewFragment.$r8$clinit;
                                ((PreviewFragment) livePreviewFragment4).mBottomActionBar.deselectAction(BottomActionBar.BottomAction.DELETE);
                            }
                        }).setPositiveButton(R.string.delete_live_wallpaper, new CategoryFragment$$ExternalSyntheticLambda0(livePreviewFragment3)).setNegativeButton(17039360, (DialogInterface.OnClickListener) null).create().show();
                        return;
                }
            }
        });
        ((PreviewFragment) this).mBottomActionBar.bindBottomSheetContentWithAction(new PreviewFragment.WallpaperInfoContent(getContext()), bottomAction);
        final View findViewById = this.mView.findViewById(R.id.separated_tabs_container);
        ((PreviewFragment) this).mBottomActionBar.mAccessibilityCallback = new BottomActionBar.AccessibilityCallback() { // from class: com.android.wallpaper.picker.LivePreviewFragment.3
            @Override // com.android.wallpaper.widget.BottomActionBar.AccessibilityCallback
            public void onBottomSheetCollapsed() {
                LivePreviewFragment.this.mPreviewContainer.setImportantForAccessibility(1);
                findViewById.setImportantForAccessibility(1);
            }

            @Override // com.android.wallpaper.widget.BottomActionBar.AccessibilityCallback
            public void onBottomSheetExpanded() {
                LivePreviewFragment.this.mPreviewContainer.setImportantForAccessibility(4);
                findViewById.setImportantForAccessibility(4);
            }
        };
        Uri settingsSliceUri = getSettingsSliceUri(this.mWallpaper.getWallpaperComponent());
        if (settingsSliceUri != null) {
            Context requireContext = requireContext();
            Set<SliceSpec> set = SliceLiveData.SUPPORTED_SPECS;
            this.mSettingsLiveData = new SliceLiveData.SliceLiveDataImpl(requireContext.getApplicationContext(), settingsSliceUri, null);
            ((PreviewFragment) this).mBottomActionBar.bindBottomSheetContentWithAction(new PreviewCustomizeSettingsContent(getContext(), null), bottomAction3);
        } else if (this.mSettingsIntent != null) {
            ((PreviewFragment) this).mBottomActionBar.setActionClickListener(bottomAction3, new View.OnClickListener(this) { // from class: com.android.wallpaper.picker.LivePreviewFragment$$ExternalSyntheticLambda1
                public final /* synthetic */ LivePreviewFragment f$0;

                {
                    this.f$0 = this;
                }

                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    switch (r3) {
                        case 0:
                            LivePreviewFragment livePreviewFragment = this.f$0;
                            int i = LivePreviewFragment.$r8$clinit;
                            livePreviewFragment.onSetWallpaperClicked(null);
                            return;
                        case 1:
                            LivePreviewFragment livePreviewFragment2 = this.f$0;
                            livePreviewFragment2.startActivity(livePreviewFragment2.mSettingsIntent, null);
                            return;
                        default:
                            final LivePreviewFragment livePreviewFragment3 = this.f$0;
                            int i2 = LivePreviewFragment.$r8$clinit;
                            Objects.requireNonNull(livePreviewFragment3);
                            new AlertDialog.Builder(livePreviewFragment3.getContext()).setMessage(R.string.delete_wallpaper_confirmation).setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: com.android.wallpaper.picker.LivePreviewFragment$$ExternalSyntheticLambda0
                                @Override // android.content.DialogInterface.OnDismissListener
                                public final void onDismiss(DialogInterface dialogInterface) {
                                    LivePreviewFragment livePreviewFragment4 = LivePreviewFragment.this;
                                    int i3 = LivePreviewFragment.$r8$clinit;
                                    ((PreviewFragment) livePreviewFragment4).mBottomActionBar.deselectAction(BottomActionBar.BottomAction.DELETE);
                                }
                            }).setPositiveButton(R.string.delete_live_wallpaper, new CategoryFragment$$ExternalSyntheticLambda0(livePreviewFragment3)).setNegativeButton(17039360, (DialogInterface.OnClickListener) null).create().show();
                            return;
                    }
                }
            });
        } else {
            ((PreviewFragment) this).mBottomActionBar.hideActions(bottomAction3);
        }
        if (TextUtils.isEmpty(getDeleteAction(this.mWallpaper.getWallpaperComponent()))) {
            ((PreviewFragment) this).mBottomActionBar.hideActions(bottomAction2);
        } else {
            ((PreviewFragment) this).mBottomActionBar.setActionClickListener(bottomAction2, new View.OnClickListener(this) { // from class: com.android.wallpaper.picker.LivePreviewFragment$$ExternalSyntheticLambda1
                public final /* synthetic */ LivePreviewFragment f$0;

                {
                    this.f$0 = this;
                }

                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    switch (r3) {
                        case 0:
                            LivePreviewFragment livePreviewFragment = this.f$0;
                            int i = LivePreviewFragment.$r8$clinit;
                            livePreviewFragment.onSetWallpaperClicked(null);
                            return;
                        case 1:
                            LivePreviewFragment livePreviewFragment2 = this.f$0;
                            livePreviewFragment2.startActivity(livePreviewFragment2.mSettingsIntent, null);
                            return;
                        default:
                            final LivePreviewFragment livePreviewFragment3 = this.f$0;
                            int i2 = LivePreviewFragment.$r8$clinit;
                            Objects.requireNonNull(livePreviewFragment3);
                            new AlertDialog.Builder(livePreviewFragment3.getContext()).setMessage(R.string.delete_wallpaper_confirmation).setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: com.android.wallpaper.picker.LivePreviewFragment$$ExternalSyntheticLambda0
                                @Override // android.content.DialogInterface.OnDismissListener
                                public final void onDismiss(DialogInterface dialogInterface) {
                                    LivePreviewFragment livePreviewFragment4 = LivePreviewFragment.this;
                                    int i3 = LivePreviewFragment.$r8$clinit;
                                    ((PreviewFragment) livePreviewFragment4).mBottomActionBar.deselectAction(BottomActionBar.BottomAction.DELETE);
                                }
                            }).setPositiveButton(R.string.delete_live_wallpaper, new CategoryFragment$$ExternalSyntheticLambda0(livePreviewFragment3)).setNegativeButton(17039360, (DialogInterface.OnClickListener) null).create().show();
                            return;
                    }
                }
            });
        }
        ((PreviewFragment) this).mBottomActionBar.setVisibility(0);
        ((PreviewFragment) this).mBottomActionBar.disableActions();
        WallpaperConnection wallpaperConnection = this.mWallpaperConnection;
        if (wallpaperConnection != null && wallpaperConnection.mEngineReady) {
            z = true;
        }
        if (z) {
            ((PreviewFragment) this).mBottomActionBar.enableActions();
        }
    }

    @Override // com.android.wallpaper.picker.PreviewFragment, androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        WallpaperInfo wallpaperComponent = this.mWallpaper.getWallpaperComponent();
        this.mPlaceholderColorFuture = this.mWallpaper.computePlaceholderColor(getContext());
        String deleteAction = getDeleteAction(wallpaperComponent);
        if (!TextUtils.isEmpty(deleteAction)) {
            Intent intent = new Intent(deleteAction);
            this.mDeleteIntent = intent;
            intent.setPackage(wallpaperComponent.getPackageName());
            this.mDeleteIntent.putExtra("android.live_wallpaper.info", wallpaperComponent);
        }
        String settingsActivity = getSettingsActivity(wallpaperComponent);
        if (settingsActivity != null) {
            Intent intent2 = new Intent();
            this.mSettingsIntent = intent2;
            intent2.setComponent(new ComponentName(wallpaperComponent.getPackageName(), settingsActivity));
            this.mSettingsIntent.putExtra("android.service.wallpaper.PREVIEW_MODE", true);
            if (this.mSettingsIntent.resolveActivityInfo(requireContext().getPackageManager(), 0) == null) {
                Log.i("LivePreviewFragment", "Couldn't find wallpaper settings activity: " + settingsActivity);
                this.mSettingsIntent = null;
            }
        }
    }

    @Override // com.android.wallpaper.picker.PreviewFragment, androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        final View onCreateView = super.onCreateView(layoutInflater, viewGroup, bundle);
        final FragmentActivity requireActivity = requireActivity();
        this.mScreenSize = ScreenSizeCalculator.getInstance().getScreenSize(requireActivity.getWindowManager().getDefaultDisplay());
        this.mPreviewContainer = (ViewGroup) onCreateView.findViewById(R.id.live_wallpaper_preview);
        this.mTouchForwardingLayout = (TouchForwardingLayout) onCreateView.findViewById(R.id.touch_forwarding_layout);
        onCreateView.findViewById(R.id.preview_header).setBackgroundColor(requireActivity.getColor(R.color.settingslib_colorSurfaceHeader));
        ConstraintSet constraintSet = new ConstraintSet();
        constraintSet.clone((ConstraintLayout) this.mPreviewContainer);
        constraintSet.get(this.mTouchForwardingLayout.getId()).layout.dimensionRatio = String.format(Locale.US, "%d:%d", Integer.valueOf(this.mScreenSize.x), Integer.valueOf(this.mScreenSize.y));
        constraintSet.applyTo((ConstraintLayout) this.mPreviewContainer);
        this.mHomePreviewCard = (CardView) this.mPreviewContainer.findViewById(R.id.wallpaper_full_preview_card);
        this.mLockPreviewContainer = (ViewGroup) this.mPreviewContainer.findViewById(R.id.lock_screen_preview_container);
        LockScreenPreviewer lockScreenPreviewer = new LockScreenPreviewer(this.mLifecycleRegistry, getContext(), this.mLockPreviewContainer);
        this.mLockScreenPreviewer = lockScreenPreviewer;
        lockScreenPreviewer.setDateViewVisibility(!this.mFullScreenAnimation.mIsFullScreen);
        this.mFullScreenAnimation.mFullScreenStatusListener = new LivePreviewFragment$$ExternalSyntheticLambda3(this, 0);
        this.mWallpaperSurface = (SurfaceView) this.mHomePreviewCard.findViewById(R.id.wallpaper_surface);
        TouchForwardingLayout touchForwardingLayout = this.mTouchForwardingLayout;
        CardView cardView = this.mHomePreviewCard;
        touchForwardingLayout.mView = cardView;
        touchForwardingLayout.mForwardingEnabled = true;
        SurfaceView surfaceView = (SurfaceView) cardView.findViewById(R.id.workspace_surface);
        this.mWorkspaceSurface = surfaceView;
        this.mWorkspaceSurfaceCallback = createWorkspaceSurfaceCallback(surfaceView);
        this.mWallpaperSurfaceCallback = new WallpaperSurfaceCallback(getContext(), this.mHomePreviewCard, this.mWallpaperSurface, this.mPlaceholderColorFuture, new WallpaperSurfaceCallback.SurfaceListener() { // from class: com.android.wallpaper.picker.LivePreviewFragment.1
            @Override // com.android.wallpaper.util.WallpaperSurfaceCallback.SurfaceListener
            public void onSurfaceCreated() {
                LivePreviewFragment.this.previewLiveWallpaper(null);
            }
        });
        setUpTabs((TabLayout) onCreateView.findViewById(R.id.separated_tabs));
        onCreateView.addOnLayoutChangeListener(new View.OnLayoutChangeListener() { // from class: com.android.wallpaper.picker.LivePreviewFragment.2
            @Override // android.view.View.OnLayoutChangeListener
            public void onLayoutChange(View view, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
                CardView cardView2 = LivePreviewFragment.this.mHomePreviewCard;
                cardView2.setRadius(SizeCalculator.getPreviewCornerRadius(requireActivity, cardView2.getMeasuredWidth()));
                onCreateView.removeOnLayoutChangeListener(this);
            }
        });
        return onCreateView;
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroyView() {
        SliceView sliceView;
        boolean z = true;
        this.mCalled = true;
        LiveData<Slice> liveData = this.mSettingsLiveData;
        if (liveData != null) {
            if (liveData.mObservers.mSize <= 0) {
                z = false;
            }
            if (z && (sliceView = this.mSettingsSliceView) != null) {
                liveData.removeObserver(sliceView);
                this.mSettingsLiveData = null;
            }
        }
        WallpaperConnection wallpaperConnection = this.mWallpaperConnection;
        if (wallpaperConnection != null) {
            wallpaperConnection.disconnect();
            this.mWallpaperConnection = null;
        }
        LockScreenPreviewer lockScreenPreviewer = this.mLockScreenPreviewer;
        if (lockScreenPreviewer != null) {
            lockScreenPreviewer.release();
        }
        this.mWorkspaceSurfaceCallback.cleanUp();
        this.mWorkspaceSurface.getHolder().removeCallback(this.mWorkspaceSurfaceCallback);
        this.mWallpaperSurfaceCallback.cleanUp();
        this.mWallpaperSurface.getHolder().removeCallback(this.mWallpaperSurfaceCallback);
    }

    @Override // com.android.wallpaper.util.WallpaperConnection.WallpaperConnectionListener
    public void onEngineShown() {
        if (getActivity() != null) {
            this.mWallpaperSurfaceCallback.mHomeImageWallpaper.animate().setStartDelay(250L).setDuration(250L).alpha(HingeAngleProviderKt.FULLY_CLOSED_DEGREES).setInterpolator(PreviewFragment.ALPHA_OUT).start();
            BottomActionBar bottomActionBar = ((PreviewFragment) this).mBottomActionBar;
            if (bottomActionBar != null) {
                bottomActionBar.enableActions();
            }
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onPause() {
        this.mCalled = true;
        WallpaperConnection wallpaperConnection = this.mWallpaperConnection;
        if (wallpaperConnection != null) {
            wallpaperConnection.mIsVisible = false;
            wallpaperConnection.setEngineVisibility(false);
        }
    }

    @Override // com.android.wallpaper.picker.PreviewFragment, androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        WallpaperConnection wallpaperConnection = this.mWallpaperConnection;
        if (wallpaperConnection != null) {
            wallpaperConnection.mIsVisible = true;
            wallpaperConnection.setEngineVisibility(true);
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onStop() {
        this.mCalled = true;
        WallpaperConnection wallpaperConnection = this.mWallpaperConnection;
        if (wallpaperConnection != null) {
            wallpaperConnection.disconnect();
            this.mWallpaperConnection = null;
        }
    }

    @Override // com.android.wallpaper.picker.BottomActionBarFragment, androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        this.mWallpaperSurface.getHolder().addCallback(this.mWallpaperSurfaceCallback);
        this.mWallpaperSurface.setZOrderMediaOverlay(true);
        this.mHomePreviewCard.setOnTouchListener(new LivePreviewFragment$$ExternalSyntheticLambda2(this));
        this.mWorkspaceSurface.setZOrderMediaOverlay(true);
        this.mWorkspaceSurface.getHolder().addCallback(this.mWorkspaceSurfaceCallback);
    }

    @Override // com.android.wallpaper.util.WallpaperConnection.WallpaperConnectionListener
    public void onWallpaperColorsChanged(WallpaperColors wallpaperColors, int i) {
        this.mWallpaperColors = wallpaperColors;
        this.mLockScreenPreviewer.setColor(wallpaperColors);
        FullScreenAnimation fullScreenAnimation = this.mFullScreenAnimation;
        fullScreenAnimation.mFullScreenTextColor = (wallpaperColors == null || (wallpaperColors.getColorHints() & 1) == 0) ? 3 : 2;
        fullScreenAnimation.animateColor(fullScreenAnimation.mIsFullScreen);
    }

    public void previewLiveWallpaper(ImageView imageView) {
        this.mWallpaperSurface.post(new DiskBasedLogger$$ExternalSyntheticLambda1(this));
    }

    @Override // com.android.wallpaper.picker.PreviewFragment
    public void setCurrentWallpaper(int i) {
        this.mWallpaperSetter.setCurrentWallpaper(getActivity(), this.mWallpaper, null, i, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, null, this.mWallpaperColors, new SetWallpaperViewModel.AnonymousClass1());
    }

    public void setUpLiveWallpaperPreview(com.android.wallpaper.model.WallpaperInfo wallpaperInfo) {
        FragmentActivity activity = getActivity();
        if (activity != null && !activity.isFinishing()) {
            WallpaperConnection wallpaperConnection = this.mWallpaperConnection;
            if (wallpaperConnection != null) {
                wallpaperConnection.disconnect();
            }
            if (WallpaperConnection.isPreviewAvailable()) {
                WallpaperConnection wallpaperConnection2 = new WallpaperConnection(getWallpaperIntent(wallpaperInfo.getWallpaperComponent()), activity, this, this.mWallpaperSurface);
                this.mWallpaperConnection = wallpaperConnection2;
                wallpaperConnection2.mIsVisible = true;
                wallpaperConnection2.setEngineVisibility(true);
            } else {
                WallpaperColorsLoader.getWallpaperColors(activity, wallpaperInfo.getThumbAsset(activity), new LivePreviewFragment$$ExternalSyntheticLambda3(this, 1));
            }
            WallpaperConnection wallpaperConnection3 = this.mWallpaperConnection;
            if (wallpaperConnection3 != null && !wallpaperConnection3.connect()) {
                this.mWallpaperConnection = null;
            }
        }
    }

    @Override // com.android.wallpaper.picker.PreviewFragment
    public void updateScreenPreview(boolean z) {
        int i = 0;
        this.mWorkspaceSurface.setVisibility(z ? 0 : 4);
        ViewGroup viewGroup = this.mLockPreviewContainer;
        if (z) {
            i = 4;
        }
        viewGroup.setVisibility(i);
        this.mFullScreenAnimation.mIsHomeSelected = z;
    }
}
