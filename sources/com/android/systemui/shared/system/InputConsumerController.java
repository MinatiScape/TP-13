package com.android.systemui.shared.system;

import android.os.Binder;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import android.view.BatchedInputEventReceiver;
import android.view.Choreographer;
import android.view.IWindowManager;
import android.view.InputChannel;
import android.view.InputEvent;
import android.view.WindowManagerGlobal;
import androidx.appcompat.view.SupportMenuInflater$$ExternalSyntheticOutline0;
import java.io.PrintWriter;
/* loaded from: classes.dex */
public class InputConsumerController {
    private static final String TAG = "InputConsumerController";
    private InputEventReceiver mInputEventReceiver;
    private InputListener mListener;
    private final String mName;
    private RegistrationListener mRegistrationListener;
    private final IBinder mToken = new Binder();
    private final IWindowManager mWindowManager;

    /* loaded from: classes.dex */
    public final class InputEventReceiver extends BatchedInputEventReceiver {
        public void onInputEvent(InputEvent inputEvent) {
            boolean z = true;
            try {
                if (InputConsumerController.this.mListener != null) {
                    z = InputConsumerController.this.mListener.onInputEvent(inputEvent);
                }
            } finally {
                finishInputEvent(inputEvent, true);
            }
        }

        public InputEventReceiver(InputChannel inputChannel, Looper looper, Choreographer choreographer) {
            super(inputChannel, looper, choreographer);
        }
    }

    /* loaded from: classes.dex */
    public interface InputListener {
        boolean onInputEvent(InputEvent inputEvent);
    }

    /* loaded from: classes.dex */
    public interface RegistrationListener {
        void onRegistrationChanged(boolean z);
    }

    public static InputConsumerController getRecentsAnimationInputConsumer() {
        return new InputConsumerController(WindowManagerGlobal.getWindowManagerService(), "recents_animation_input_consumer");
    }

    public void dump(PrintWriter printWriter, String str) {
        boolean z;
        String m = SupportMenuInflater$$ExternalSyntheticOutline0.m(str, "  ");
        StringBuilder m2 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m(str);
        m2.append(TAG);
        printWriter.println(m2.toString());
        StringBuilder sb = new StringBuilder();
        sb.append(m);
        sb.append("registered=");
        if (this.mInputEventReceiver != null) {
            z = true;
        } else {
            z = false;
        }
        sb.append(z);
        printWriter.println(sb.toString());
    }

    public boolean isRegistered() {
        if (this.mInputEventReceiver != null) {
            return true;
        }
        return false;
    }

    public void registerInputConsumer() {
        if (this.mInputEventReceiver == null) {
            InputChannel inputChannel = new InputChannel();
            try {
                this.mWindowManager.destroyInputConsumer(this.mName, 0);
                this.mWindowManager.createInputConsumer(this.mToken, this.mName, 0, inputChannel);
            } catch (RemoteException e) {
                Log.e(TAG, "Failed to create input consumer", e);
            }
            this.mInputEventReceiver = new InputEventReceiver(inputChannel, Looper.myLooper(), Choreographer.getInstance());
            RegistrationListener registrationListener = this.mRegistrationListener;
            if (registrationListener != null) {
                registrationListener.onRegistrationChanged(true);
            }
        }
    }

    public void setRegistrationListener(RegistrationListener registrationListener) {
        boolean z;
        this.mRegistrationListener = registrationListener;
        if (registrationListener != null) {
            if (this.mInputEventReceiver != null) {
                z = true;
            } else {
                z = false;
            }
            registrationListener.onRegistrationChanged(z);
        }
    }

    public void unregisterInputConsumer() {
        if (this.mInputEventReceiver != null) {
            try {
                this.mWindowManager.destroyInputConsumer(this.mName, 0);
            } catch (RemoteException e) {
                Log.e(TAG, "Failed to destroy input consumer", e);
            }
            this.mInputEventReceiver.dispose();
            this.mInputEventReceiver = null;
            RegistrationListener registrationListener = this.mRegistrationListener;
            if (registrationListener != null) {
                registrationListener.onRegistrationChanged(false);
            }
        }
    }

    public InputConsumerController(IWindowManager iWindowManager, String str) {
        this.mWindowManager = iWindowManager;
        this.mName = str;
    }

    public void setInputListener(InputListener inputListener) {
        this.mListener = inputListener;
    }
}
