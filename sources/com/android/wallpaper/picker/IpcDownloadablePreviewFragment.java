package com.android.wallpaper.picker;

import android.app.AlertDialog;
import android.content.ComponentName;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentSender;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.Messenger;
import android.os.Parcelable;
import android.os.RemoteException;
import android.util.Log;
import android.view.View;
import androidx.activity.OnBackPressedCallback;
import androidx.activity.OnBackPressedDispatcher;
import androidx.activity.result.ActivityResult;
import androidx.activity.result.ActivityResultCallback;
import androidx.activity.result.ActivityResultRegistry;
import androidx.activity.result.ActivityResultRegistryOwner;
import androidx.activity.result.IntentSenderRequest;
import androidx.activity.result.contract.ActivityResultContract;
import androidx.concurrent.futures.AbstractResolvableFuture$$ExternalSyntheticOutline0;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentViewLifecycleOwner;
import com.android.systemui.shared.R;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.widget.BottomActionBar;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes.dex */
public class IpcDownloadablePreviewFragment extends DownloadablePreviewFragment {
    public static final /* synthetic */ int $r8$clinit = 0;
    public AlertDialog mAlertDialog;
    public Fragment.AnonymousClass9 mIntentSenderLauncher;
    public boolean mIsForceExit;
    public Messenger mService;
    public Handler mHandler = new Handler(new Handler.Callback() { // from class: com.android.wallpaper.picker.IpcDownloadablePreviewFragment.1
        @Override // android.os.Handler.Callback
        public final boolean handleMessage(Message message) {
            switch (message.what) {
                case 1:
                    IpcDownloadablePreviewFragment.this.showDownloadSuccess();
                    break;
                case 2:
                    break;
                case 3:
                case 4:
                    IpcDownloadablePreviewFragment.this.showDownloadFailed();
                    break;
                case 5:
                    final IpcDownloadablePreviewFragment ipcDownloadablePreviewFragment = IpcDownloadablePreviewFragment.this;
                    if (ipcDownloadablePreviewFragment.mAlertDialog == null) {
                        ipcDownloadablePreviewFragment.mAlertDialog = new AlertDialog.Builder(ipcDownloadablePreviewFragment.getContext(), R.style.LightDialogTheme).setTitle(R.string.leave_download_title).setMessage(R.string.leave_download_confirmation).setPositiveButton(R.string.cancel_download_wallpaper, new DialogInterface.OnClickListener() { // from class: com.android.wallpaper.picker.IpcDownloadablePreviewFragment$$ExternalSyntheticLambda0
                            @Override // android.content.DialogInterface.OnClickListener
                            public final void onClick(DialogInterface dialogInterface, int i) {
                                IpcDownloadablePreviewFragment ipcDownloadablePreviewFragment2 = IpcDownloadablePreviewFragment.this;
                                int i2 = IpcDownloadablePreviewFragment.$r8$clinit;
                                ipcDownloadablePreviewFragment2.sendDownloadMessage(3);
                            }
                        }).setNegativeButton(17039360, (DialogInterface.OnClickListener) null).create();
                    }
                    ipcDownloadablePreviewFragment.mAlertDialog.show();
                    break;
                case 6:
                    IpcDownloadablePreviewFragment ipcDownloadablePreviewFragment2 = IpcDownloadablePreviewFragment.this;
                    ipcDownloadablePreviewFragment2.mIsForceExit = true;
                    FragmentActivity activity = ipcDownloadablePreviewFragment2.getActivity();
                    if (activity != null) {
                        activity.onBackPressed();
                        break;
                    }
                    break;
                case 7:
                    IpcDownloadablePreviewFragment ipcDownloadablePreviewFragment3 = IpcDownloadablePreviewFragment.this;
                    Intent intent = (Intent) message.obj;
                    int i = IpcDownloadablePreviewFragment.$r8$clinit;
                    ipcDownloadablePreviewFragment3.getClass();
                    if (intent != null) {
                        ipcDownloadablePreviewFragment3.mIntentSenderLauncher.launch(new IntentSenderRequest((IntentSender) intent.getExtra("com.google.pixel.livewallpaper.sender"), (Intent) intent.getExtra("com.google.pixel.livewallpaper.fill_in"), intent.getIntExtra("com.google.pixel.livewallpaper.flags_mask", 0), intent.getIntExtra("com.google.pixel.livewallpaper.flags_value", 0)));
                        break;
                    }
                    break;
                default:
                    return false;
            }
            ((PreviewFragment) IpcDownloadablePreviewFragment.this).mBottomActionBar.deselectAction(BottomActionBar.BottomAction.DOWNLOAD);
            ((PreviewFragment) IpcDownloadablePreviewFragment.this).mBottomActionBar.enableActions();
            return true;
        }
    });
    public AnonymousClass2 mOnBackPressedCallback = new OnBackPressedCallback() { // from class: com.android.wallpaper.picker.IpcDownloadablePreviewFragment.2
        @Override // androidx.activity.OnBackPressedCallback
        public final void handleOnBackPressed() {
            IpcDownloadablePreviewFragment ipcDownloadablePreviewFragment = IpcDownloadablePreviewFragment.this;
            if (!ipcDownloadablePreviewFragment.mIsForceExit) {
                ipcDownloadablePreviewFragment.sendDownloadMessage(2);
                return;
            }
            FragmentActivity activity = ipcDownloadablePreviewFragment.getActivity();
            if (activity != null) {
                activity.finish();
            }
        }
    };
    public Messenger mReceiver = new Messenger(this.mHandler);
    public AnonymousClass3 mServiceConnection = new ServiceConnection() { // from class: com.android.wallpaper.picker.IpcDownloadablePreviewFragment.3
        @Override // android.content.ServiceConnection
        public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            IpcDownloadablePreviewFragment.this.mService = new Messenger(iBinder);
        }

        @Override // android.content.ServiceConnection
        public final void onServiceDisconnected(ComponentName componentName) {
            IpcDownloadablePreviewFragment.this.mService = null;
        }
    };

    @Override // com.android.wallpaper.picker.DownloadablePreviewFragment
    public final void startDownload(WallpaperInfo wallpaperInfo) {
        sendDownloadMessage(1);
    }

    @Override // com.android.wallpaper.picker.PreviewFragment, androidx.fragment.app.Fragment
    public final void onDestroy() {
        AlertDialog alertDialog = this.mAlertDialog;
        if (alertDialog != null && alertDialog.isShowing()) {
            this.mAlertDialog.dismiss();
        }
        this.mIntentSenderLauncher.unregister();
        getContext().unbindService(this.mServiceConnection);
        super.onDestroy();
    }

    public final void sendDownloadMessage(int i) {
        if (this.mService == null) {
            Log.w("IpcDownloadablePreviewFragment", "Download service is not connected.");
            return;
        }
        Message obtain = Message.obtain(null, i, 0, 0);
        obtain.replyTo = this.mReceiver;
        try {
            this.mService.send(obtain);
        } catch (RemoteException unused) {
            Log.e("IpcDownloadablePreviewFragment", "Fail to send download message: " + i);
        }
    }

    /* JADX WARN: Type inference failed for: r4v2, types: [androidx.activity.result.contract.ActivityResultContracts$StartIntentSenderForResult] */
    @Override // com.android.wallpaper.picker.DownloadablePreviewFragment, com.android.wallpaper.picker.LivePreviewFragment, com.android.wallpaper.picker.PreviewFragment, androidx.fragment.app.Fragment
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Intent intent = new Intent("com.google.pixel.livewallpaper.action.DOWNLOAD_LIVE_WALLPAPER");
        intent.setComponent(new ComponentName("com.google.pixel.livewallpaper", "com.google.pixel.livewallpaper.split.DownloadService"));
        intent.putExtra("android.live_wallpaper.info", this.mWallpaper.getWallpaperComponent());
        getContext().bindService(intent, this.mServiceConnection, 1);
        final ?? activityResultContracts$StartIntentSenderForResult = new ActivityResultContract<IntentSenderRequest, ActivityResult>() { // from class: androidx.activity.result.contract.ActivityResultContracts$StartIntentSenderForResult
            @Override // androidx.activity.result.contract.ActivityResultContract
            public final Intent createIntent(Parcelable parcelable) {
                return new Intent("androidx.activity.result.contract.action.INTENT_SENDER_REQUEST").putExtra("androidx.activity.result.contract.extra.INTENT_SENDER_REQUEST", (IntentSenderRequest) parcelable);
            }

            @Override // androidx.activity.result.contract.ActivityResultContract
            public final ActivityResult parseResult(int i, Intent intent2) {
                return new ActivityResult(i, intent2);
            }
        };
        final Fragment.AnonymousClass6 r0 = new Fragment.AnonymousClass6();
        if (this.mState <= 1) {
            final AtomicReference atomicReference = new AtomicReference();
            Fragment.OnPreAttachedListener onPreAttachedListener = new Fragment.OnPreAttachedListener() { // from class: androidx.fragment.app.Fragment.8
                public final /* synthetic */ ActivityResultCallback val$callback = AbstractResolvableFuture$$ExternalSyntheticOutline0.INSTANCE;

                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                }

                @Override // androidx.fragment.app.Fragment.OnPreAttachedListener
                public final void onPreAttached() {
                    Fragment fragment;
                    ActivityResultRegistry activityResultRegistry;
                    this.getClass();
                    String str = "fragment_" + fragment.mWho + "_rq#" + fragment.mNextLocalRequestCode.getAndIncrement();
                    AnonymousClass6 r1 = (AnonymousClass6) r0;
                    r1.getClass();
                    Fragment fragment2 = Fragment.this;
                    FragmentHostCallback<?> fragmentHostCallback = fragment2.mHost;
                    if (fragmentHostCallback instanceof ActivityResultRegistryOwner) {
                        activityResultRegistry = ((ActivityResultRegistryOwner) fragmentHostCallback).getActivityResultRegistry();
                    } else {
                        activityResultRegistry = fragment2.requireActivity().mActivityResultRegistry;
                    }
                    atomicReference.set(activityResultRegistry.register(str, this, activityResultContracts$StartIntentSenderForResult, this.val$callback));
                }
            };
            if (this.mState >= 0) {
                onPreAttachedListener.onPreAttached();
            } else {
                this.mOnPreAttachedListeners.add(onPreAttachedListener);
            }
            this.mIntentSenderLauncher = new Fragment.AnonymousClass9(atomicReference);
            return;
        }
        throw new IllegalStateException("Fragment " + this + " is attempting to registerForActivityResult after being created. Fragments must call registerForActivityResult() before they are created (i.e. initialization, onAttach(), or onCreate()).");
    }

    @Override // com.android.wallpaper.picker.LivePreviewFragment, com.android.wallpaper.picker.BottomActionBarFragment, androidx.fragment.app.Fragment
    public final void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        FragmentActivity activity = getActivity();
        if (activity != null) {
            OnBackPressedDispatcher onBackPressedDispatcher = activity.mOnBackPressedDispatcher;
            FragmentViewLifecycleOwner fragmentViewLifecycleOwner = this.mViewLifecycleOwner;
            if (fragmentViewLifecycleOwner != null) {
                onBackPressedDispatcher.addCallback(fragmentViewLifecycleOwner, this.mOnBackPressedCallback);
                return;
            }
            throw new IllegalStateException("Can't access the Fragment View's LifecycleOwner when getView() is null i.e., before onCreateView() or after onDestroyView()");
        }
    }
}
