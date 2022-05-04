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
import android.os.RemoteException;
import android.util.Log;
import android.util.Pair;
import android.util.Size;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import androidx.cardview.R$style;
import androidx.fragment.app.FragmentActivity;
import com.android.systemui.shared.system.QuickStepContract;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.model.ImageWallpaperInfo;
import com.android.wallpaper.module.Injector;
import com.android.wallpaper.module.WallpaperPersister;
import com.android.wallpaper.module.WallpaperSetter;
import com.android.wallpaper.picker.LivePreviewFragment;
import com.android.wallpaper.picker.SetWallpaperDialogFragment;
import com.android.wallpaper.util.ScreenSizeCalculator;
import com.android.wallpaper.util.WallpaperConnection;
import com.google.android.apps.wallpaper.model.MicropaperWallpaperInfo;
import com.google.common.io.ByteStreams;
import java.io.ByteArrayInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import wireless.android.learning.acmi.micropaper.frontend.MicropaperFrontend;
/* loaded from: classes.dex */
public class MicropaperPreviewFragmentGoogle extends LivePreviewFragment {
    public static final /* synthetic */ int $r8$clinit = 0;
    public ArrayList mPreviewAttributions;
    public Size mScreenSize;
    public final ExecutorService mSetWallpaperExecutor = Executors.newCachedThreadPool(MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda7.INSTANCE);
    public WallpaperManager mWallpaperManager;
    public WallpaperPersister mWallpaperPersister;
    public WallpaperSetter mWallpaperSetter;

    /* renamed from: -$$Nest$smcopyInputStreamToLocalFile  reason: not valid java name */
    public static boolean m36$$Nest$smcopyInputStreamToLocalFile(Activity activity, ByteArrayInputStream byteArrayInputStream, String str) {
        try {
            FileOutputStream openFileOutput = activity.openFileOutput(str, 0);
            int i = ByteStreams.$r8$clinit;
            byteArrayInputStream.getClass();
            openFileOutput.getClass();
            byte[] bArr = new byte[QuickStepContract.SYSUI_STATE_ASSIST_GESTURE_CONSTRAINED];
            while (true) {
                int read = byteArrayInputStream.read(bArr);
                if (read == -1) {
                    openFileOutput.close();
                    return true;
                }
                openFileOutput.write(bArr, 0, read);
            }
        } catch (IOException e) {
            Log.e("MicropaperPreviewFragmentGoogle", "Failed to copy input stream to local file", e);
            return false;
        }
    }

    @Override // com.android.wallpaper.picker.LivePreviewFragment
    public final String getDeleteAction(WallpaperInfo wallpaperInfo) {
        return null;
    }

    @Override // com.android.wallpaper.picker.LivePreviewFragment
    public final String getSettingsActivity(WallpaperInfo wallpaperInfo) {
        return null;
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
    public final List getAttributions(FragmentActivity fragmentActivity) {
        ArrayList arrayList = this.mPreviewAttributions;
        if (arrayList == null) {
            return super.getAttributions(fragmentActivity);
        }
        return arrayList;
    }

    @Override // com.android.wallpaper.picker.LivePreviewFragment
    public final Uri getSettingsSliceUri(WallpaperInfo wallpaperInfo) {
        ComponentName componentName = MicropaperFrontend.MICROPAPER_SERVICE;
        return new Uri.Builder().scheme("content").authority("com.google.pixel.dynamicwallpapers.slice").appendPath("settings_slice").build();
    }

    @Override // com.android.wallpaper.picker.LivePreviewFragment
    public final Intent getWallpaperIntent(WallpaperInfo wallpaperInfo) {
        ComponentName componentName = MicropaperFrontend.MICROPAPER_SERVICE;
        Intent intent = new Intent("android.service.wallpaper.WallpaperService");
        intent.setComponent(MicropaperFrontend.MICROPAPER_SERVICE);
        return intent;
    }

    @Override // com.android.wallpaper.util.WallpaperConnection.WallpaperConnectionListener
    public final void onConnected() {
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
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        FragmentActivity requireActivity = requireActivity();
        Context applicationContext = requireActivity.getApplicationContext();
        this.mWallpaperManager = WallpaperManager.getInstance(requireActivity);
        Injector injector = R$style.getInjector();
        this.mWallpaperPersister = injector.getWallpaperPersister(requireActivity);
        Point screenSize = ScreenSizeCalculator.getInstance().getScreenSize(requireActivity.getWindowManager().getDefaultDisplay());
        this.mScreenSize = new Size(screenSize.x, screenSize.y);
        this.mWallpaperSetter = new WallpaperSetter(injector.getWallpaperPersister(applicationContext), injector.getPreferences(applicationContext), injector.getUserEventLogger(applicationContext), this.mArguments.getBoolean("testing_mode_enabled"));
        this.mArguments.getInt("preview_mode");
    }

    @Override // com.android.wallpaper.picker.LivePreviewFragment, com.android.wallpaper.picker.PreviewFragment, androidx.fragment.app.Fragment
    public final View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View onCreateView = super.onCreateView(layoutInflater, viewGroup, bundle);
        onCreateView.setOnTouchListener(new View.OnTouchListener() { // from class: com.google.android.apps.wallpaper.picker.MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda0
            @Override // android.view.View.OnTouchListener
            public final boolean onTouch(View view, MotionEvent motionEvent) {
                MicropaperPreviewFragmentGoogle micropaperPreviewFragmentGoogle = MicropaperPreviewFragmentGoogle.this;
                int i = MicropaperPreviewFragmentGoogle.$r8$clinit;
                WallpaperConnection wallpaperConnection = micropaperPreviewFragmentGoogle.mWallpaperConnection;
                boolean z = false;
                if (wallpaperConnection != null) {
                    synchronized (wallpaperConnection) {
                        if (micropaperPreviewFragmentGoogle.mWallpaperConnection.getEngine() != null) {
                            try {
                                micropaperPreviewFragmentGoogle.mWallpaperConnection.getEngine().dispatchPointer(MotionEvent.obtainNoHistory(motionEvent));
                            } catch (RemoteException e) {
                                Log.e("MicropaperPreviewFragmentGoogle", "Could not communicate with Engine: ", e);
                            }
                            z = true;
                        }
                    }
                }
                return z;
            }
        });
        return onCreateView;
    }

    @Override // com.android.wallpaper.util.WallpaperConnection.WallpaperConnectionListener
    public final void onDisconnected() {
        Context requireContext = requireContext();
        ComponentName componentName = MicropaperFrontend.MICROPAPER_SERVICE;
        Intent intent = new Intent();
        intent.setAction("ACTION_CLEAR_PREVIEW_URI");
        intent.setComponent(MicropaperFrontend.MICROPAPER_BROADCAST_RECEIVER);
        requireContext.sendBroadcast(intent);
    }

    @Override // com.android.wallpaper.picker.PreviewFragment
    public final void onSetWallpaperClicked(com.android.wallpaper.model.WallpaperInfo wallpaperInfo) {
        final FragmentActivity activity = getActivity();
        final WallpaperManager wallpaperManager = this.mWallpaperManager;
        final WallpaperPersister wallpaperPersister = this.mWallpaperPersister;
        final com.android.wallpaper.model.WallpaperInfo wallpaperInfo2 = this.mWallpaper;
        final Size size = this.mScreenSize;
        final Asset asset = wallpaperInfo2.getAsset(activity);
        asset.decodeRawDimensions(activity, new Asset.DimensionsReceiver() { // from class: com.google.android.apps.wallpaper.picker.MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda1
            @Override // com.android.wallpaper.asset.Asset.DimensionsReceiver
            public final void onDimensionsDecoded(Point point) {
                final MicropaperPreviewFragmentGoogle micropaperPreviewFragmentGoogle = MicropaperPreviewFragmentGoogle.this;
                final Activity activity2 = activity;
                Size size2 = size;
                final WallpaperManager wallpaperManager2 = wallpaperManager;
                com.android.wallpaper.model.WallpaperInfo wallpaperInfo3 = wallpaperInfo2;
                final WallpaperPersister wallpaperPersister2 = wallpaperPersister;
                final Asset asset2 = asset;
                int i = MicropaperPreviewFragmentGoogle.$r8$clinit;
                micropaperPreviewFragmentGoogle.getClass();
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
                    final ImageWallpaperInfo imageWallpaperInfo = new ImageWallpaperInfo(wallpaperInfo3.getUri());
                    final float width = (size2.getWidth() * 1.0f) / rect.width();
                    final Rect rect2 = new Rect((int) (rect.left * width), (int) (rect.top * width), (int) (rect.right * width), (int) (rect.bottom * width));
                    micropaperPreviewFragmentGoogle.mWallpaperSetter.requestDestination(micropaperPreviewFragmentGoogle.getActivity(), micropaperPreviewFragmentGoogle.mFragmentManager, new SetWallpaperDialogFragment.Listener() { // from class: com.google.android.apps.wallpaper.picker.MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda4
                        @Override // com.android.wallpaper.picker.SetWallpaperDialogFragment.Listener
                        public final void onSet(final int i2) {
                            MicropaperPreviewFragmentGoogle micropaperPreviewFragmentGoogle2 = MicropaperPreviewFragmentGoogle.this;
                            final Activity activity3 = activity2;
                            final WallpaperPersister wallpaperPersister3 = wallpaperPersister2;
                            final com.android.wallpaper.model.WallpaperInfo wallpaperInfo4 = imageWallpaperInfo;
                            final Asset asset3 = asset2;
                            final Rect rect3 = rect2;
                            final float f = width;
                            micropaperPreviewFragmentGoogle2.mSetWallpaperExecutor.execute(new Runnable() { // from class: com.google.android.apps.wallpaper.picker.MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda6
                                /* JADX WARN: Code restructure failed: missing block: B:13:0x004a, code lost:
                                    if (r14 == false) goto L14;
                                 */
                                @Override // java.lang.Runnable
                                /*
                                    Code decompiled incorrectly, please refer to instructions dump.
                                    To view partially-correct add '--show-bad-code' argument
                                */
                                public final void run() {
                                    /*
                                        r14 = this;
                                        android.app.Activity r0 = r1
                                        com.android.wallpaper.module.WallpaperPersister r1 = r2
                                        com.android.wallpaper.model.WallpaperInfo r3 = r3
                                        com.android.wallpaper.asset.Asset r4 = r4
                                        int r7 = r5
                                        android.graphics.Rect r5 = r6
                                        float r6 = r7
                                        int r14 = com.google.android.apps.wallpaper.picker.MicropaperPreviewFragmentGoogle.$r8$clinit
                                        boolean r14 = r4 instanceof com.android.wallpaper.asset.ContentUriAsset
                                        if (r14 == 0) goto L18
                                        r14 = r4
                                        com.android.wallpaper.asset.ContentUriAsset r14 = (com.android.wallpaper.asset.ContentUriAsset) r14
                                        goto L19
                                    L18:
                                        r14 = 0
                                    L19:
                                        java.io.ByteArrayOutputStream r2 = new java.io.ByteArrayOutputStream
                                        r2.<init>()
                                        r8 = 1
                                        r9 = 0
                                        if (r14 == 0) goto L4d
                                        com.google.common.util.concurrent.SettableFuture r10 = new com.google.common.util.concurrent.SettableFuture
                                        r10.<init>()
                                        com.google.android.apps.wallpaper.picker.MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda2 r11 = new com.google.android.apps.wallpaper.picker.MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda2
                                        r11.<init>()
                                        java.util.concurrent.ExecutorService r12 = com.android.wallpaper.asset.StreamableAsset.sExecutorService
                                        com.android.wallpaper.asset.StreamableAsset$$ExternalSyntheticLambda5 r13 = new com.android.wallpaper.asset.StreamableAsset$$ExternalSyntheticLambda5
                                        r13.<init>(r14, r11)
                                        r12.execute(r13)
                                        java.lang.Object r14 = r10.get()     // Catch: java.lang.Throwable -> L41
                                        java.lang.Long r14 = (java.lang.Long) r14     // Catch: java.lang.Throwable -> L41
                                        r14.longValue()     // Catch: java.lang.Throwable -> L41
                                        r14 = r8
                                        goto L4a
                                    L41:
                                        r14 = move-exception
                                        java.lang.String r10 = "MicropaperPreviewFragmentGoogle"
                                        java.lang.String r11 = "Failed to copy asset to local file"
                                        android.util.Log.e(r10, r11, r14)
                                        r14 = r9
                                    L4a:
                                        if (r14 == 0) goto L4d
                                        goto L4e
                                    L4d:
                                        r8 = r9
                                    L4e:
                                        java.io.ByteArrayInputStream r14 = new java.io.ByteArrayInputStream
                                        byte[] r2 = r2.toByteArray()
                                        r14.<init>(r2)
                                        com.google.android.apps.wallpaper.picker.MicropaperPreviewFragmentGoogle$1 r9 = new com.google.android.apps.wallpaper.picker.MicropaperPreviewFragmentGoogle$1
                                        r9.<init>()
                                        r2 = r1
                                        com.android.wallpaper.module.DefaultWallpaperPersister r2 = (com.android.wallpaper.module.DefaultWallpaperPersister) r2
                                        r8 = r9
                                        r2.setIndividualWallpaper(r3, r4, r5, r6, r7, r8)
                                        return
                                    */
                                    throw new UnsupportedOperationException("Method not decompiled: com.google.android.apps.wallpaper.picker.MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda6.run():void");
                                }
                            });
                        }
                    }, false);
                } else if (wallpaperManager2.getWallpaperInfo() == null || wallpaperManager2.getWallpaperId(2) >= 0) {
                    micropaperPreviewFragmentGoogle.mWallpaperSetter.requestDestination(micropaperPreviewFragmentGoogle.getActivity(), micropaperPreviewFragmentGoogle.mFragmentManager, new SetWallpaperDialogFragment.Listener() { // from class: com.google.android.apps.wallpaper.picker.MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda3
                        @Override // com.android.wallpaper.picker.SetWallpaperDialogFragment.Listener
                        public final void onSet(final int i2) {
                            MicropaperPreviewFragmentGoogle micropaperPreviewFragmentGoogle2 = MicropaperPreviewFragmentGoogle.this;
                            final Activity activity3 = activity2;
                            final WallpaperManager wallpaperManager3 = wallpaperManager2;
                            micropaperPreviewFragmentGoogle2.mSetWallpaperExecutor.execute(new Runnable() { // from class: com.google.android.apps.wallpaper.picker.MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda5
                                @Override // java.lang.Runnable
                                public final void run() {
                                    int i3 = i2;
                                    Activity activity4 = activity3;
                                    WallpaperManager wallpaperManager4 = wallpaperManager3;
                                    boolean z = true;
                                    if (i3 == 1) {
                                        int i4 = MicropaperPreviewFragmentGoogle.$r8$clinit;
                                        Log.e("MicropaperPreviewFragmentGoogle", "Can not set micropaper on lock screen only.");
                                    }
                                    if (i3 != 2) {
                                        z = false;
                                    }
                                    MicropaperPreviewFragmentGoogle.setMicropaperComponentAndReturn(activity4, wallpaperManager4, z);
                                }
                            });
                        }
                    }, true);
                } else {
                    MicropaperPreviewFragmentGoogle.setMicropaperComponentAndReturn(activity2, wallpaperManager2, false);
                }
            }
        });
    }
}
