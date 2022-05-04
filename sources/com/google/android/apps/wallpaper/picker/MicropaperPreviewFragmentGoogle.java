package com.google.android.apps.wallpaper.picker;

import android.app.Activity;
import android.app.WallpaperInfo;
import android.app.WallpaperManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.graphics.Point;
import android.graphics.Rect;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.util.Pair;
import android.util.Size;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.fragment.app.FragmentActivity;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.model.ImageWallpaperInfo;
import com.android.wallpaper.module.Injector;
import com.android.wallpaper.module.InjectorProvider;
import com.android.wallpaper.module.WallpaperPersister;
import com.android.wallpaper.module.WallpaperSetter;
import com.android.wallpaper.picker.LivePreviewFragment;
import com.android.wallpaper.picker.LivePreviewFragment$$ExternalSyntheticLambda2;
import com.android.wallpaper.picker.SetWallpaperDialogFragment;
import com.android.wallpaper.picker.TopLevelPickerActivity$4$$ExternalSyntheticLambda0;
import com.android.wallpaper.util.ScreenSizeCalculator;
import com.google.android.apps.wallpaper.model.MicropaperWallpaperInfo;
import com.google.common.io.ByteStreams;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import wireless.android.learning.acmi.micropaper.frontend.MicropaperFrontend;
/* loaded from: classes.dex */
public class MicropaperPreviewFragmentGoogle extends LivePreviewFragment {
    public static final /* synthetic */ int $r8$clinit = 0;
    public List<String> mPreviewAttributions;
    public Size mScreenSize;
    public final Executor mSetWallpaperExecutor = Executors.newCachedThreadPool(MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda4.INSTANCE);
    public WallpaperManager mWallpaperManager;
    public WallpaperPersister mWallpaperPersister;
    public WallpaperSetter mWallpaperSetter;

    public static boolean access$100(Context context, InputStream inputStream, String str) {
        try {
            FileOutputStream openFileOutput = context.openFileOutput(str, 0);
            ByteStreams.copy(inputStream, openFileOutput);
            openFileOutput.close();
            return true;
        } catch (IOException e) {
            Log.e("MicropaperPreviewFragmentGoogle", "Failed to copy input stream to local file", e);
            return false;
        }
    }

    public static void setMicropaperComponentAndReturn(Activity activity, WallpaperManager wallpaperManager, boolean z) {
        ComponentName componentName = MicropaperFrontend.MICROPAPER_SERVICE;
        Intent intent = new Intent();
        intent.setAction("ACTION_COMMIT_TO_HOME");
        intent.setComponent(MicropaperFrontend.MICROPAPER_BROADCAST_RECEIVER);
        activity.sendBroadcast(intent);
        wallpaperManager.setWallpaperComponent(MicropaperFrontend.MICROPAPER_SERVICE);
        if (z) {
            try {
                wallpaperManager.clear(2);
            } catch (IOException e) {
                Log.e("MicropaperPreviewFragmentGoogle", "Error clearing lock wallpaper", e);
            }
        }
        activity.setResult(-1);
        activity.finish();
    }

    @Override // com.android.wallpaper.picker.PreviewFragment
    public List<String> getAttributions(Context context) {
        List<String> list = this.mPreviewAttributions;
        return list == null ? this.mWallpaper.getAttributions(context) : list;
    }

    @Override // com.android.wallpaper.picker.LivePreviewFragment
    public String getDeleteAction(WallpaperInfo wallpaperInfo) {
        return null;
    }

    @Override // com.android.wallpaper.picker.LivePreviewFragment
    public String getSettingsActivity(WallpaperInfo wallpaperInfo) {
        return null;
    }

    @Override // com.android.wallpaper.picker.LivePreviewFragment
    public Uri getSettingsSliceUri(WallpaperInfo wallpaperInfo) {
        ComponentName componentName = MicropaperFrontend.MICROPAPER_SERVICE;
        return new Uri.Builder().scheme("content").authority("com.google.pixel.dynamicwallpapers.slice").appendPath("settings_slice").build();
    }

    @Override // com.android.wallpaper.picker.LivePreviewFragment
    public Intent getWallpaperIntent(WallpaperInfo wallpaperInfo) {
        ComponentName componentName = MicropaperFrontend.MICROPAPER_SERVICE;
        Intent intent = new Intent("android.service.wallpaper.WallpaperService");
        intent.setComponent(MicropaperFrontend.MICROPAPER_SERVICE);
        return intent;
    }

    @Override // com.android.wallpaper.util.WallpaperConnection.WallpaperConnectionListener
    public void onConnected() {
        if (this.mWallpaper instanceof MicropaperWallpaperInfo) {
            Context requireContext = requireContext();
            ComponentName componentName = MicropaperFrontend.MICROPAPER_SERVICE;
            this.mPreviewAttributions = requireContext.getContentResolver().call(new Uri.Builder().scheme("content").authority("com.google.pixel.dynamicwallpapers.parameters").build(), "PROVIDER_SET_PREVIEW_FROM_HOME", (String) null, (Bundle) null).getStringArrayList("EXTRA_IMAGE_LABELS");
            return;
        }
        Context requireContext2 = requireContext();
        Uri build = new Uri.Builder().scheme("content").authority("com.android.wallpaper.picker.micropaperprovider").appendPath(this.mWallpaper.getUri().toString()).build();
        ComponentName componentName2 = MicropaperFrontend.MICROPAPER_SERVICE;
        Uri build2 = new Uri.Builder().scheme("content").authority("com.google.pixel.dynamicwallpapers.parameters").build();
        Bundle bundle = new Bundle();
        bundle.putParcelable("EXTRA_WALLPAPER_URI", build);
        this.mPreviewAttributions = requireContext2.getContentResolver().call(build2, "PROVIDER_SET_PREVIEW_URI", (String) null, bundle).getStringArrayList("EXTRA_IMAGE_LABELS");
    }

    @Override // com.android.wallpaper.picker.LivePreviewFragment, com.android.wallpaper.picker.PreviewFragment, androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        FragmentActivity requireActivity = requireActivity();
        Context applicationContext = requireActivity.getApplicationContext();
        this.mWallpaperManager = WallpaperManager.getInstance(requireActivity);
        Injector injector = InjectorProvider.getInjector();
        this.mWallpaperPersister = injector.getWallpaperPersister(requireActivity);
        Point screenSize = ScreenSizeCalculator.getInstance().getScreenSize(requireActivity.getWindowManager().getDefaultDisplay());
        this.mScreenSize = new Size(screenSize.x, screenSize.y);
        this.mWallpaperSetter = new WallpaperSetter(injector.getWallpaperPersister(applicationContext), injector.getPreferences(applicationContext), injector.getUserEventLogger(applicationContext), this.mArguments.getBoolean("testing_mode_enabled"));
        this.mArguments.getInt("preview_mode");
    }

    @Override // com.android.wallpaper.picker.LivePreviewFragment, com.android.wallpaper.picker.PreviewFragment, androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View onCreateView = super.onCreateView(layoutInflater, viewGroup, bundle);
        onCreateView.setOnTouchListener(new LivePreviewFragment$$ExternalSyntheticLambda2(this));
        return onCreateView;
    }

    @Override // com.android.wallpaper.util.WallpaperConnection.WallpaperConnectionListener
    public void onDisconnected() {
        Context requireContext = requireContext();
        ComponentName componentName = MicropaperFrontend.MICROPAPER_SERVICE;
        Intent intent = new Intent();
        intent.setAction("ACTION_CLEAR_PREVIEW_URI");
        intent.setComponent(MicropaperFrontend.MICROPAPER_BROADCAST_RECEIVER);
        requireContext.sendBroadcast(intent);
    }

    @Override // com.android.wallpaper.picker.PreviewFragment
    public void onSetWallpaperClicked(View view) {
        final FragmentActivity activity = getActivity();
        final WallpaperManager wallpaperManager = this.mWallpaperManager;
        final WallpaperPersister wallpaperPersister = this.mWallpaperPersister;
        final com.android.wallpaper.model.WallpaperInfo wallpaperInfo = this.mWallpaper;
        final Size size = this.mScreenSize;
        final Asset asset = wallpaperInfo.getAsset(activity);
        asset.decodeRawDimensions(activity, new Asset.DimensionsReceiver() { // from class: com.google.android.apps.wallpaper.picker.MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda0
            @Override // com.android.wallpaper.asset.Asset.DimensionsReceiver
            public final void onDimensionsDecoded(Point point) {
                final MicropaperPreviewFragmentGoogle micropaperPreviewFragmentGoogle = MicropaperPreviewFragmentGoogle.this;
                final Activity activity2 = activity;
                Size size2 = size;
                WallpaperManager wallpaperManager2 = wallpaperManager;
                com.android.wallpaper.model.WallpaperInfo wallpaperInfo2 = wallpaperInfo;
                final WallpaperPersister wallpaperPersister2 = wallpaperPersister;
                final Asset asset2 = asset;
                int i = MicropaperPreviewFragmentGoogle.$r8$clinit;
                Objects.requireNonNull(micropaperPreviewFragmentGoogle);
                Size size3 = new Size(point.x, point.y);
                ComponentName componentName = MicropaperFrontend.MICROPAPER_SERVICE;
                Uri build = new Uri.Builder().scheme("content").authority("com.google.pixel.dynamicwallpapers.parameters").build();
                Bundle bundle = new Bundle();
                bundle.putSize("EXTRA_IMAGE_SIZE", size3);
                bundle.putSize("EXTRA_SURFACE_SIZE", size2);
                Bundle call = activity2.getContentResolver().call(build, "PROVIDER_GET_PREVIEW_PARAMETERS", (String) null, bundle);
                Pair create = Pair.create(Boolean.valueOf(call.getBoolean("EXTRA_PREVIEW_IS_PLAYING", false)), (Rect) call.getParcelable("EXTRA_CROP_RECT"));
                boolean booleanValue = ((Boolean) create.first).booleanValue();
                Rect rect = (Rect) create.second;
                if (!booleanValue) {
                    final ImageWallpaperInfo imageWallpaperInfo = new ImageWallpaperInfo(wallpaperInfo2.getUri());
                    final float width = (size2.getWidth() * 1.0f) / rect.width();
                    final Rect rect2 = new Rect((int) (rect.left * width), (int) (rect.top * width), (int) (rect.right * width), (int) (rect.bottom * width));
                    micropaperPreviewFragmentGoogle.mWallpaperSetter.requestDestination(micropaperPreviewFragmentGoogle.getActivity(), micropaperPreviewFragmentGoogle.mFragmentManager, new SetWallpaperDialogFragment.Listener() { // from class: com.google.android.apps.wallpaper.picker.MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda2
                        @Override // com.android.wallpaper.picker.SetWallpaperDialogFragment.Listener
                        public final void onSet(final int i2) {
                            MicropaperPreviewFragmentGoogle micropaperPreviewFragmentGoogle2 = MicropaperPreviewFragmentGoogle.this;
                            final Activity activity3 = activity2;
                            final WallpaperPersister wallpaperPersister3 = wallpaperPersister2;
                            final com.android.wallpaper.model.WallpaperInfo wallpaperInfo3 = imageWallpaperInfo;
                            final Asset asset3 = asset2;
                            final Rect rect3 = rect2;
                            final float f = width;
                            micropaperPreviewFragmentGoogle2.mSetWallpaperExecutor.execute(new Runnable() { // from class: com.google.android.apps.wallpaper.picker.MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda3
                                /* JADX WARN: Code restructure failed: missing block: B:13:0x004c, code lost:
                                    if (r13 == false) goto L14;
                                 */
                                @Override // java.lang.Runnable
                                /*
                                    Code decompiled incorrectly, please refer to instructions dump.
                                    To view partially-correct add '--show-bad-code' argument
                                */
                                public final void run() {
                                    /*
                                        r13 = this;
                                        android.app.Activity r0 = r1
                                        com.android.wallpaper.module.WallpaperPersister r1 = r2
                                        com.android.wallpaper.model.WallpaperInfo r3 = r3
                                        com.android.wallpaper.asset.Asset r4 = r4
                                        int r7 = r5
                                        android.graphics.Rect r5 = r6
                                        float r6 = r7
                                        int r13 = com.google.android.apps.wallpaper.picker.MicropaperPreviewFragmentGoogle.$r8$clinit
                                        boolean r13 = r4 instanceof com.android.wallpaper.asset.ContentUriAsset
                                        if (r13 == 0) goto L18
                                        r13 = r4
                                        com.android.wallpaper.asset.ContentUriAsset r13 = (com.android.wallpaper.asset.ContentUriAsset) r13
                                        goto L19
                                    L18:
                                        r13 = 0
                                    L19:
                                        java.io.ByteArrayOutputStream r2 = new java.io.ByteArrayOutputStream
                                        r2.<init>()
                                        r8 = 1
                                        r9 = 0
                                        if (r13 == 0) goto L4f
                                        com.google.common.util.concurrent.SettableFuture r10 = new com.google.common.util.concurrent.SettableFuture
                                        r10.<init>()
                                        com.google.android.apps.wallpaper.picker.MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda1 r11 = new com.google.android.apps.wallpaper.picker.MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda1
                                        r11.<init>()
                                        com.android.wallpaper.asset.StreamableAsset$1 r12 = new com.android.wallpaper.asset.StreamableAsset$1
                                        r12.<init>(r11)
                                        java.util.concurrent.Executor r13 = android.os.AsyncTask.THREAD_POOL_EXECUTOR
                                        java.lang.Void[] r11 = new java.lang.Void[r9]
                                        r12.executeOnExecutor(r13, r11)
                                        java.lang.Object r13 = r10.get()     // Catch: java.lang.Throwable -> L43
                                        java.lang.Long r13 = (java.lang.Long) r13     // Catch: java.lang.Throwable -> L43
                                        r13.longValue()     // Catch: java.lang.Throwable -> L43
                                        r13 = r8
                                        goto L4c
                                    L43:
                                        r13 = move-exception
                                        java.lang.String r10 = "MicropaperPreviewFragmentGoogle"
                                        java.lang.String r11 = "Failed to copy asset to local file"
                                        android.util.Log.e(r10, r11, r13)
                                        r13 = r9
                                    L4c:
                                        if (r13 == 0) goto L4f
                                        goto L50
                                    L4f:
                                        r8 = r9
                                    L50:
                                        java.io.ByteArrayInputStream r13 = new java.io.ByteArrayInputStream
                                        byte[] r2 = r2.toByteArray()
                                        r13.<init>(r2)
                                        com.google.android.apps.wallpaper.picker.MicropaperPreviewFragmentGoogle$1 r9 = new com.google.android.apps.wallpaper.picker.MicropaperPreviewFragmentGoogle$1
                                        r9.<init>()
                                        r2 = r1
                                        com.android.wallpaper.module.DefaultWallpaperPersister r2 = (com.android.wallpaper.module.DefaultWallpaperPersister) r2
                                        r8 = r9
                                        r2.setIndividualWallpaper(r3, r4, r5, r6, r7, r8)
                                        return
                                    */
                                    throw new UnsupportedOperationException("Method not decompiled: com.google.android.apps.wallpaper.picker.MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda3.run():void");
                                }
                            });
                        }
                    }, false);
                } else if (wallpaperManager2.getWallpaperInfo() == null || wallpaperManager2.getWallpaperId(2) >= 0) {
                    micropaperPreviewFragmentGoogle.mWallpaperSetter.requestDestination(micropaperPreviewFragmentGoogle.getActivity(), micropaperPreviewFragmentGoogle.mFragmentManager, new TopLevelPickerActivity$4$$ExternalSyntheticLambda0(micropaperPreviewFragmentGoogle, activity2, wallpaperManager2), true);
                } else {
                    MicropaperPreviewFragmentGoogle.setMicropaperComponentAndReturn(activity2, wallpaperManager2, false);
                }
            }
        });
    }
}
