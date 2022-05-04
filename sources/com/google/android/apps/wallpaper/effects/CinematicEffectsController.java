package com.google.android.apps.wallpaper.effects;

import android.content.ComponentName;
import android.content.Context;
import android.content.ServiceConnection;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.Messenger;
import android.os.RemoteException;
import android.util.Log;
import com.android.customization.picker.WallpaperPreviewer$$ExternalSyntheticLambda0;
import com.android.wallpaper.effects.EffectsController;
/* loaded from: classes.dex */
public final class CinematicEffectsController extends EffectsController {
    public final Context mContext;
    public final EffectsController.EffectsServiceListener mListener;
    public final Messenger mMessenger = new Messenger(new IncomingHandler(this));
    public final AnonymousClass1 mEffectsServiceConnection = new ServiceConnection() { // from class: com.google.android.apps.wallpaper.effects.CinematicEffectsController.1
        @Override // android.content.ServiceConnection
        public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            CinematicEffectsController.this.mService = new Messenger(iBinder);
            CinematicEffectsController cinematicEffectsController = CinematicEffectsController.this;
            cinematicEffectsController.mBound = true;
            if (cinematicEffectsController.mService != null) {
                try {
                    Message obtain = Message.obtain((Handler) null, 1);
                    obtain.replyTo = cinematicEffectsController.mMessenger;
                    cinematicEffectsController.mService.send(obtain);
                } catch (RemoteException e) {
                    Log.e("CinematicEffectsController", "Bind client failed:" + e);
                }
            }
            CinematicEffectsController cinematicEffectsController2 = CinematicEffectsController.this;
            if (cinematicEffectsController2.mImageUri != null) {
                Message obtain2 = Message.obtain(null, 3, cinematicEffectsController2.mEffect.ordinal(), 0);
                obtain2.replyTo = CinematicEffectsController.this.mMessenger;
                Bundle bundle = new Bundle();
                bundle.putParcelable("com.google.android.wallpaper.effects.wallpaper_image", CinematicEffectsController.this.mImageUri);
                obtain2.setData(bundle);
                try {
                    CinematicEffectsController.this.mService.send(obtain2);
                } catch (RemoteException e2) {
                    e2.printStackTrace();
                }
            }
        }

        @Override // android.content.ServiceConnection
        public final void onServiceDisconnected(ComponentName componentName) {
            CinematicEffectsController cinematicEffectsController = CinematicEffectsController.this;
            cinematicEffectsController.mBound = false;
            cinematicEffectsController.mService = null;
            cinematicEffectsController.mContext.revokeUriPermission(cinematicEffectsController.mImageUri, 1);
            CinematicEffectsController cinematicEffectsController2 = CinematicEffectsController.this;
            cinematicEffectsController2.mImageUri = null;
            ((WallpaperPreviewer$$ExternalSyntheticLambda0) cinematicEffectsController2.mListener).onEffectFinished(new Bundle(), 1);
        }
    };
    public Messenger mService = null;
    public Uri mImageUri = null;
    public Effect mEffect = null;

    /* loaded from: classes.dex */
    public enum Effect {
        NONE,
        CINEMATIC
    }

    /* loaded from: classes.dex */
    public static class IncomingHandler extends Handler {
        public final CinematicEffectsController mController;

        @Override // android.os.Handler
        public final void handleMessage(Message message) {
            int i;
            if (message.what == 1) {
                Bundle data = message.getData();
                if (data == null) {
                    i = 1;
                } else {
                    i = data.getInt("ERROR");
                }
                if (message.arg1 < Effect.values().length) {
                    this.mController.onEffectGenerated(Effect.values()[message.arg1], message.getData(), i);
                    return;
                }
                CinematicEffectsController cinematicEffectsController = this.mController;
                cinematicEffectsController.getClass();
                cinematicEffectsController.onEffectGenerated(Effect.NONE, new Bundle(), 1);
                return;
            }
            super.handleMessage(message);
        }

        public IncomingHandler(CinematicEffectsController cinematicEffectsController) {
            this.mController = cinematicEffectsController;
        }
    }

    public final void onEffectGenerated(Effect effect, Bundle bundle, int i) {
        EffectsController.EffectsServiceListener effectsServiceListener;
        Uri uri = this.mImageUri;
        if (uri != null) {
            this.mContext.revokeUriPermission(uri, 1);
            this.mImageUri = null;
        }
        if (this.mBound && (effectsServiceListener = this.mListener) != null) {
            ((WallpaperPreviewer$$ExternalSyntheticLambda0) effectsServiceListener).onEffectFinished(bundle, i);
            if (this.mBound && this.mService != null) {
                try {
                    Message obtain = Message.obtain((Handler) null, 2);
                    obtain.replyTo = this.mMessenger;
                    this.mService.send(obtain);
                } catch (RemoteException e) {
                    Log.e("CinematicEffectsController", "Unbind client failed:" + e);
                }
            }
            this.mContext.unbindService(this.mEffectsServiceConnection);
            this.mBound = false;
            this.mService = null;
        }
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [com.google.android.apps.wallpaper.effects.CinematicEffectsController$1] */
    public CinematicEffectsController(Context context, WallpaperPreviewer$$ExternalSyntheticLambda0 wallpaperPreviewer$$ExternalSyntheticLambda0) {
        this.mContext = context;
        this.mListener = wallpaperPreviewer$$ExternalSyntheticLambda0;
    }
}
