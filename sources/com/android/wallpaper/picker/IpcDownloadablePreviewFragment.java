package com.android.wallpaper.picker;

import android.app.AlertDialog;
import android.content.ComponentName;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentSender;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.Messenger;
import android.os.RemoteException;
import android.util.Log;
import android.view.View;
import androidx.activity.OnBackPressedCallback;
import androidx.activity.OnBackPressedDispatcher;
import androidx.activity.result.ActivityResult;
import androidx.activity.result.ActivityResultCallback;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.ActivityResultRegistry;
import androidx.activity.result.ActivityResultRegistryOwner;
import androidx.activity.result.IntentSenderRequest;
import androidx.activity.result.contract.ActivityResultContract;
import androidx.core.app.ActivityOptionsCompat;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentViewLifecycleOwner;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleEventObserver;
import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.LifecycleRegistry;
import com.android.systemui.shared.R;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.widget.BottomActionBar;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes.dex */
public class IpcDownloadablePreviewFragment extends DownloadablePreviewFragment {
    public static final /* synthetic */ int $r8$clinit = 0;
    public AlertDialog mAlertDialog;
    public ActivityResultLauncher<IntentSenderRequest> mIntentSenderLauncher;
    public boolean mIsForceExit;
    public Messenger mService;
    public Handler mHandler = new Handler(new Handler.Callback() { // from class: com.android.wallpaper.picker.IpcDownloadablePreviewFragment.1
        @Override // android.os.Handler.Callback
        public boolean handleMessage(Message message) {
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
                    IpcDownloadablePreviewFragment ipcDownloadablePreviewFragment = IpcDownloadablePreviewFragment.this;
                    if (ipcDownloadablePreviewFragment.mAlertDialog == null) {
                        ipcDownloadablePreviewFragment.mAlertDialog = new AlertDialog.Builder(ipcDownloadablePreviewFragment.getContext(), R.style.LightDialogTheme).setTitle(R.string.leave_download_title).setMessage(R.string.leave_download_confirmation).setPositiveButton(R.string.cancel_download_wallpaper, new CategoryFragment$$ExternalSyntheticLambda0(ipcDownloadablePreviewFragment)).setNegativeButton(17039360, (DialogInterface.OnClickListener) null).create();
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
                    Objects.requireNonNull(ipcDownloadablePreviewFragment3);
                    if (intent != null) {
                        ipcDownloadablePreviewFragment3.mIntentSenderLauncher.launch(new IntentSenderRequest((IntentSender) intent.getExtra("com.google.pixel.livewallpaper.sender"), (Intent) intent.getExtra("com.google.pixel.livewallpaper.fill_in"), intent.getIntExtra("com.google.pixel.livewallpaper.flags_mask", 0), intent.getIntExtra("com.google.pixel.livewallpaper.flags_value", 0)), null);
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
    public OnBackPressedCallback mOnBackPressedCallback = new OnBackPressedCallback(true) { // from class: com.android.wallpaper.picker.IpcDownloadablePreviewFragment.2
        @Override // androidx.activity.OnBackPressedCallback
        public void handleOnBackPressed() {
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
    public ServiceConnection mServiceConnection = new ServiceConnection() { // from class: com.android.wallpaper.picker.IpcDownloadablePreviewFragment.3
        @Override // android.content.ServiceConnection
        public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            IpcDownloadablePreviewFragment.this.mService = new Messenger(iBinder);
        }

        @Override // android.content.ServiceConnection
        public void onServiceDisconnected(ComponentName componentName) {
            IpcDownloadablePreviewFragment.this.mService = null;
        }
    };

    @Override // com.android.wallpaper.picker.DownloadablePreviewFragment, com.android.wallpaper.picker.LivePreviewFragment, com.android.wallpaper.picker.PreviewFragment, androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Intent intent = new Intent("com.google.pixel.livewallpaper.action.DOWNLOAD_LIVE_WALLPAPER");
        intent.setComponent(new ComponentName("com.google.pixel.livewallpaper", "com.google.pixel.livewallpaper.split.DownloadService"));
        intent.putExtra("android.live_wallpaper.info", this.mWallpaper.getWallpaperComponent());
        getContext().bindService(intent, this.mServiceConnection, 1);
        final ActivityResultContract<IntentSenderRequest, ActivityResult> activityResultContracts$StartIntentSenderForResult = new ActivityResultContract<IntentSenderRequest, ActivityResult>() { // from class: androidx.activity.result.contract.ActivityResultContracts$StartIntentSenderForResult
            @Override // androidx.activity.result.contract.ActivityResultContract
            public Intent createIntent(Context context, IntentSenderRequest intentSenderRequest) {
                return new Intent("androidx.activity.result.contract.action.INTENT_SENDER_REQUEST").putExtra("androidx.activity.result.contract.extra.INTENT_SENDER_REQUEST", intentSenderRequest);
            }

            @Override // androidx.activity.result.contract.ActivityResultContract
            public ActivityResult parseResult(int i, Intent intent2) {
                return new ActivityResult(i, intent2);
            }
        };
        final IpcDownloadablePreviewFragment$$ExternalSyntheticLambda0 ipcDownloadablePreviewFragment$$ExternalSyntheticLambda0 = IpcDownloadablePreviewFragment$$ExternalSyntheticLambda0.INSTANCE;
        final Fragment.AnonymousClass6 r5 = new Fragment.AnonymousClass6();
        if (this.mState <= 1) {
            final AtomicReference atomicReference = new AtomicReference();
            Fragment.OnPreAttachedListener onPreAttachedListener = new Fragment.OnPreAttachedListener() { // from class: androidx.fragment.app.Fragment.8
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(null);
                }

                @Override // androidx.fragment.app.Fragment.OnPreAttachedListener
                public void onPreAttached() {
                    Fragment fragment;
                    final ActivityResultRegistry activityResultRegistry;
                    LifecycleRegistry lifecycleRegistry;
                    Objects.requireNonNull(Fragment.this);
                    final String str = "fragment_" + fragment.mWho + "_rq#" + fragment.mNextLocalRequestCode.getAndIncrement();
                    AnonymousClass6 r1 = (AnonymousClass6) r5;
                    Objects.requireNonNull(r1);
                    Fragment fragment2 = Fragment.this;
                    FragmentHostCallback<?> fragmentHostCallback = fragment2.mHost;
                    if (fragmentHostCallback instanceof ActivityResultRegistryOwner) {
                        activityResultRegistry = ((ActivityResultRegistryOwner) fragmentHostCallback).getActivityResultRegistry();
                    } else {
                        activityResultRegistry = fragment2.requireActivity().mActivityResultRegistry;
                    }
                    AtomicReference atomicReference2 = atomicReference;
                    Fragment fragment3 = Fragment.this;
                    final ActivityResultContract activityResultContract = activityResultContracts$StartIntentSenderForResult;
                    final ActivityResultCallback activityResultCallback = ipcDownloadablePreviewFragment$$ExternalSyntheticLambda0;
                    Objects.requireNonNull(activityResultRegistry);
                    Lifecycle lifecycle = fragment3.getLifecycle();
                    if (!(((LifecycleRegistry) lifecycle).mState.compareTo(Lifecycle.State.STARTED) >= 0)) {
                        final int registerKey = activityResultRegistry.registerKey(str);
                        ActivityResultRegistry.LifecycleContainer lifecycleContainer = activityResultRegistry.mKeyToLifecycleContainers.get(str);
                        if (lifecycleContainer == null) {
                            lifecycleContainer = new ActivityResultRegistry.LifecycleContainer(lifecycle);
                        }
                        LifecycleEventObserver lifecycleEventObserver = new LifecycleEventObserver() { // from class: androidx.activity.result.ActivityResultRegistry.1
                            @Override // androidx.lifecycle.LifecycleEventObserver
                            public void onStateChanged(LifecycleOwner lifecycleOwner, Lifecycle.Event event) {
                                if (Lifecycle.Event.ON_START.equals(event)) {
                                    activityResultRegistry.mKeyToCallback.put(str, new CallbackAndContract<>(activityResultCallback, activityResultContract));
                                    if (activityResultRegistry.mParsedPendingResults.containsKey(str)) {
                                        Object obj = activityResultRegistry.mParsedPendingResults.get(str);
                                        activityResultRegistry.mParsedPendingResults.remove(str);
                                        activityResultCallback.onActivityResult(obj);
                                    }
                                    ActivityResult activityResult = (ActivityResult) activityResultRegistry.mPendingResults.getParcelable(str);
                                    if (activityResult != null) {
                                        activityResultRegistry.mPendingResults.remove(str);
                                        activityResultCallback.onActivityResult(activityResultContract.parseResult(activityResult.mResultCode, activityResult.mData));
                                    }
                                } else if (Lifecycle.Event.ON_STOP.equals(event)) {
                                    activityResultRegistry.mKeyToCallback.remove(str);
                                } else if (Lifecycle.Event.ON_DESTROY.equals(event)) {
                                    activityResultRegistry.unregister(str);
                                }
                            }
                        };
                        lifecycleContainer.mLifecycle.addObserver(lifecycleEventObserver);
                        lifecycleContainer.mObservers.add(lifecycleEventObserver);
                        activityResultRegistry.mKeyToLifecycleContainers.put(str, lifecycleContainer);
                        atomicReference2.set(new ActivityResultLauncher<?>() { // from class: androidx.activity.result.ActivityResultRegistry.2
                            @Override // androidx.activity.result.ActivityResultLauncher
                            public void launch(Object obj, ActivityOptionsCompat activityOptionsCompat) {
                                activityResultRegistry.onLaunch(registerKey, activityResultContract, obj, activityOptionsCompat);
                            }

                            @Override // androidx.activity.result.ActivityResultLauncher
                            public void unregister() {
                                activityResultRegistry.unregister(str);
                            }
                        });
                        return;
                    }
                    throw new IllegalStateException("LifecycleOwner " + fragment3 + " is attempting to register while current state is " + lifecycleRegistry.mState + ". LifecycleOwners must call register before they are STARTED.");
                }
            };
            if (this.mState >= 0) {
                onPreAttachedListener.onPreAttached();
            } else {
                this.mOnPreAttachedListeners.add(onPreAttachedListener);
            }
            this.mIntentSenderLauncher = new ActivityResultLauncher<?>(this, atomicReference, activityResultContracts$StartIntentSenderForResult) { // from class: androidx.fragment.app.Fragment.9
                public final /* synthetic */ AtomicReference val$ref;

                {
                    this.val$ref = atomicReference;
                }

                @Override // androidx.activity.result.ActivityResultLauncher
                public void launch(Object obj, ActivityOptionsCompat activityOptionsCompat) {
                    ActivityResultLauncher activityResultLauncher = (ActivityResultLauncher) this.val$ref.get();
                    if (activityResultLauncher != null) {
                        activityResultLauncher.launch(obj, activityOptionsCompat);
                        return;
                    }
                    throw new IllegalStateException("Operation cannot be started before fragment is in created state");
                }

                @Override // androidx.activity.result.ActivityResultLauncher
                public void unregister() {
                    ActivityResultLauncher activityResultLauncher = (ActivityResultLauncher) this.val$ref.getAndSet(null);
                    if (activityResultLauncher != null) {
                        activityResultLauncher.unregister();
                    }
                }
            };
            return;
        }
        throw new IllegalStateException("Fragment " + this + " is attempting to registerForActivityResult after being created. Fragments must call registerForActivityResult() before they are created (i.e. initialization, onAttach(), or onCreate()).");
    }

    @Override // com.android.wallpaper.picker.PreviewFragment, androidx.fragment.app.Fragment
    public void onDestroy() {
        AlertDialog alertDialog = this.mAlertDialog;
        if (alertDialog != null && alertDialog.isShowing()) {
            this.mAlertDialog.dismiss();
        }
        this.mIntentSenderLauncher.unregister();
        getContext().unbindService(this.mServiceConnection);
        super.onDestroy();
    }

    @Override // com.android.wallpaper.picker.LivePreviewFragment, com.android.wallpaper.picker.BottomActionBarFragment, androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
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

    @Override // com.android.wallpaper.picker.DownloadablePreviewFragment
    public void startDownload(WallpaperInfo wallpaperInfo) {
        sendDownloadMessage(1);
    }
}
