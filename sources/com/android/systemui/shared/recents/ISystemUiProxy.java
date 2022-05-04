package com.android.systemui.shared.recents;

import android.graphics.Bitmap;
import android.graphics.Insets;
import android.graphics.Rect;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import android.view.MotionEvent;
import com.android.systemui.shared.recents.model.Task;
/* loaded from: classes.dex */
public interface ISystemUiProxy extends IInterface {
    public static final String DESCRIPTOR = "com.android.systemui.shared.recents.ISystemUiProxy";

    /* loaded from: classes.dex */
    public static class Default implements ISystemUiProxy {
        @Override // android.os.IInterface
        public IBinder asBinder() {
            return null;
        }

        @Override // com.android.systemui.shared.recents.ISystemUiProxy
        public void expandNotificationPanel() throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.ISystemUiProxy
        public Rect getNonMinimizedSplitScreenSecondaryBounds() throws RemoteException {
            return null;
        }

        @Override // com.android.systemui.shared.recents.ISystemUiProxy
        public void handleImageAsScreenshot(Bitmap bitmap, Rect rect, Insets insets, int i) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.ISystemUiProxy
        public void handleImageBundleAsScreenshot(Bundle bundle, Rect rect, Insets insets, Task.TaskKey taskKey) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.ISystemUiProxy
        public void notifyAccessibilityButtonClicked(int i) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.ISystemUiProxy
        public void notifyAccessibilityButtonLongClicked() throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.ISystemUiProxy
        public void notifyPrioritizedRotation(int i) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.ISystemUiProxy
        public void notifySwipeToHomeFinished() throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.ISystemUiProxy
        public void notifySwipeUpGestureStarted() throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.ISystemUiProxy
        public void notifyTaskbarAutohideSuspend(boolean z) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.ISystemUiProxy
        public void notifyTaskbarStatus(boolean z, boolean z2) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.ISystemUiProxy
        public void onAssistantGestureCompletion(float f) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.ISystemUiProxy
        public void onAssistantProgress(float f) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.ISystemUiProxy
        public void onBackPressed() throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.ISystemUiProxy
        public void onImeSwitcherPressed() throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.ISystemUiProxy
        public void onOverviewShown(boolean z) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.ISystemUiProxy
        public void onStatusBarMotionEvent(MotionEvent motionEvent) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.ISystemUiProxy
        public void setHomeRotationEnabled(boolean z) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.ISystemUiProxy
        public void setNavBarButtonAlpha(float f, boolean z) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.ISystemUiProxy
        public void setSplitScreenMinimized(boolean z) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.ISystemUiProxy
        public void startAssistant(Bundle bundle) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.ISystemUiProxy
        public void startScreenPinning(int i) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.ISystemUiProxy
        public void stopScreenPinning() throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.ISystemUiProxy
        public void toggleNotificationPanel() throws RemoteException {
        }
    }

    /* loaded from: classes.dex */
    public static abstract class Stub extends Binder implements ISystemUiProxy {
        public static final int TRANSACTION_expandNotificationPanel = 30;
        public static final int TRANSACTION_getNonMinimizedSplitScreenSecondaryBounds = 8;
        public static final int TRANSACTION_handleImageAsScreenshot = 22;
        public static final int TRANSACTION_handleImageBundleAsScreenshot = 29;
        public static final int TRANSACTION_notifyAccessibilityButtonClicked = 16;
        public static final int TRANSACTION_notifyAccessibilityButtonLongClicked = 17;
        public static final int TRANSACTION_notifyPrioritizedRotation = 26;
        public static final int TRANSACTION_notifySwipeToHomeFinished = 24;
        public static final int TRANSACTION_notifySwipeUpGestureStarted = 47;
        public static final int TRANSACTION_notifyTaskbarAutohideSuspend = 49;
        public static final int TRANSACTION_notifyTaskbarStatus = 48;
        public static final int TRANSACTION_onAssistantGestureCompletion = 19;
        public static final int TRANSACTION_onAssistantProgress = 13;
        public static final int TRANSACTION_onBackPressed = 45;
        public static final int TRANSACTION_onImeSwitcherPressed = 50;
        public static final int TRANSACTION_onOverviewShown = 7;
        public static final int TRANSACTION_onStatusBarMotionEvent = 10;
        public static final int TRANSACTION_setHomeRotationEnabled = 46;
        public static final int TRANSACTION_setNavBarButtonAlpha = 20;
        public static final int TRANSACTION_setSplitScreenMinimized = 23;
        public static final int TRANSACTION_startAssistant = 14;
        public static final int TRANSACTION_startScreenPinning = 2;
        public static final int TRANSACTION_stopScreenPinning = 18;
        public static final int TRANSACTION_toggleNotificationPanel = 51;

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            if (i >= 1 && i <= 16777215) {
                parcel.enforceInterface(ISystemUiProxy.DESCRIPTOR);
            }
            if (i != 1598968902) {
                if (i == 2) {
                    int readInt = parcel.readInt();
                    parcel.enforceNoDataAvail();
                    startScreenPinning(readInt);
                    parcel2.writeNoException();
                } else if (i == 10) {
                    parcel.enforceNoDataAvail();
                    onStatusBarMotionEvent((MotionEvent) parcel.readTypedObject(MotionEvent.CREATOR));
                    parcel2.writeNoException();
                } else if (i == 26) {
                    int readInt2 = parcel.readInt();
                    parcel.enforceNoDataAvail();
                    notifyPrioritizedRotation(readInt2);
                    parcel2.writeNoException();
                } else if (i == 7) {
                    boolean readBoolean = parcel.readBoolean();
                    parcel.enforceNoDataAvail();
                    onOverviewShown(readBoolean);
                    parcel2.writeNoException();
                } else if (i == 8) {
                    Rect nonMinimizedSplitScreenSecondaryBounds = getNonMinimizedSplitScreenSecondaryBounds();
                    parcel2.writeNoException();
                    parcel2.writeTypedObject(nonMinimizedSplitScreenSecondaryBounds, 1);
                } else if (i == 13) {
                    float readFloat = parcel.readFloat();
                    parcel.enforceNoDataAvail();
                    onAssistantProgress(readFloat);
                    parcel2.writeNoException();
                } else if (i == 14) {
                    parcel.enforceNoDataAvail();
                    startAssistant((Bundle) parcel.readTypedObject(Bundle.CREATOR));
                    parcel2.writeNoException();
                } else if (i == 29) {
                    parcel.enforceNoDataAvail();
                    handleImageBundleAsScreenshot((Bundle) parcel.readTypedObject(Bundle.CREATOR), (Rect) parcel.readTypedObject(Rect.CREATOR), (Insets) parcel.readTypedObject(Insets.CREATOR), (Task.TaskKey) parcel.readTypedObject(Task.TaskKey.CREATOR));
                    parcel2.writeNoException();
                } else if (i != 30) {
                    switch (i) {
                        case 16:
                            int readInt3 = parcel.readInt();
                            parcel.enforceNoDataAvail();
                            notifyAccessibilityButtonClicked(readInt3);
                            parcel2.writeNoException();
                            break;
                        case 17:
                            notifyAccessibilityButtonLongClicked();
                            parcel2.writeNoException();
                            break;
                        case 18:
                            stopScreenPinning();
                            parcel2.writeNoException();
                            break;
                        case 19:
                            float readFloat2 = parcel.readFloat();
                            parcel.enforceNoDataAvail();
                            onAssistantGestureCompletion(readFloat2);
                            parcel2.writeNoException();
                            break;
                        case 20:
                            float readFloat3 = parcel.readFloat();
                            boolean readBoolean2 = parcel.readBoolean();
                            parcel.enforceNoDataAvail();
                            setNavBarButtonAlpha(readFloat3, readBoolean2);
                            parcel2.writeNoException();
                            break;
                        default:
                            switch (i) {
                                case 22:
                                    int readInt4 = parcel.readInt();
                                    parcel.enforceNoDataAvail();
                                    handleImageAsScreenshot((Bitmap) parcel.readTypedObject(Bitmap.CREATOR), (Rect) parcel.readTypedObject(Rect.CREATOR), (Insets) parcel.readTypedObject(Insets.CREATOR), readInt4);
                                    parcel2.writeNoException();
                                    break;
                                case 23:
                                    boolean readBoolean3 = parcel.readBoolean();
                                    parcel.enforceNoDataAvail();
                                    setSplitScreenMinimized(readBoolean3);
                                    parcel2.writeNoException();
                                    break;
                                case 24:
                                    notifySwipeToHomeFinished();
                                    parcel2.writeNoException();
                                    break;
                                default:
                                    switch (i) {
                                        case 45:
                                            onBackPressed();
                                            parcel2.writeNoException();
                                            break;
                                        case 46:
                                            boolean readBoolean4 = parcel.readBoolean();
                                            parcel.enforceNoDataAvail();
                                            setHomeRotationEnabled(readBoolean4);
                                            parcel2.writeNoException();
                                            break;
                                        case 47:
                                            notifySwipeUpGestureStarted();
                                            break;
                                        case 48:
                                            boolean readBoolean5 = parcel.readBoolean();
                                            boolean readBoolean6 = parcel.readBoolean();
                                            parcel.enforceNoDataAvail();
                                            notifyTaskbarStatus(readBoolean5, readBoolean6);
                                            break;
                                        case 49:
                                            boolean readBoolean7 = parcel.readBoolean();
                                            parcel.enforceNoDataAvail();
                                            notifyTaskbarAutohideSuspend(readBoolean7);
                                            break;
                                        case 50:
                                            onImeSwitcherPressed();
                                            parcel2.writeNoException();
                                            break;
                                        case 51:
                                            toggleNotificationPanel();
                                            parcel2.writeNoException();
                                            break;
                                        default:
                                            return super.onTransact(i, parcel, parcel2, i2);
                                    }
                            }
                    }
                } else {
                    expandNotificationPanel();
                    parcel2.writeNoException();
                }
                return true;
            }
            parcel2.writeString(ISystemUiProxy.DESCRIPTOR);
            return true;
        }

        /* loaded from: classes.dex */
        public static class Proxy implements ISystemUiProxy {
            private IBinder mRemote;

            public String getInterfaceDescriptor() {
                return ISystemUiProxy.DESCRIPTOR;
            }

            public Proxy(IBinder iBinder) {
                this.mRemote = iBinder;
            }

            @Override // com.android.systemui.shared.recents.ISystemUiProxy
            public void expandNotificationPanel() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ISystemUiProxy.DESCRIPTOR);
                    this.mRemote.transact(30, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.ISystemUiProxy
            public Rect getNonMinimizedSplitScreenSecondaryBounds() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ISystemUiProxy.DESCRIPTOR);
                    this.mRemote.transact(8, obtain, obtain2, 0);
                    obtain2.readException();
                    return (Rect) obtain2.readTypedObject(Rect.CREATOR);
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.ISystemUiProxy
            public void handleImageAsScreenshot(Bitmap bitmap, Rect rect, Insets insets, int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ISystemUiProxy.DESCRIPTOR);
                    obtain.writeTypedObject(bitmap, 0);
                    obtain.writeTypedObject(rect, 0);
                    obtain.writeTypedObject(insets, 0);
                    obtain.writeInt(i);
                    this.mRemote.transact(22, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.ISystemUiProxy
            public void handleImageBundleAsScreenshot(Bundle bundle, Rect rect, Insets insets, Task.TaskKey taskKey) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ISystemUiProxy.DESCRIPTOR);
                    obtain.writeTypedObject(bundle, 0);
                    obtain.writeTypedObject(rect, 0);
                    obtain.writeTypedObject(insets, 0);
                    obtain.writeTypedObject(taskKey, 0);
                    this.mRemote.transact(29, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.ISystemUiProxy
            public void notifyAccessibilityButtonClicked(int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ISystemUiProxy.DESCRIPTOR);
                    obtain.writeInt(i);
                    this.mRemote.transact(16, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.ISystemUiProxy
            public void notifyAccessibilityButtonLongClicked() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ISystemUiProxy.DESCRIPTOR);
                    this.mRemote.transact(17, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.ISystemUiProxy
            public void notifyPrioritizedRotation(int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ISystemUiProxy.DESCRIPTOR);
                    obtain.writeInt(i);
                    this.mRemote.transact(26, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.ISystemUiProxy
            public void notifySwipeToHomeFinished() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ISystemUiProxy.DESCRIPTOR);
                    this.mRemote.transact(24, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.ISystemUiProxy
            public void notifySwipeUpGestureStarted() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ISystemUiProxy.DESCRIPTOR);
                    this.mRemote.transact(47, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.ISystemUiProxy
            public void notifyTaskbarAutohideSuspend(boolean z) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ISystemUiProxy.DESCRIPTOR);
                    obtain.writeBoolean(z);
                    this.mRemote.transact(49, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.ISystemUiProxy
            public void notifyTaskbarStatus(boolean z, boolean z2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ISystemUiProxy.DESCRIPTOR);
                    obtain.writeBoolean(z);
                    obtain.writeBoolean(z2);
                    this.mRemote.transact(48, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.ISystemUiProxy
            public void onAssistantGestureCompletion(float f) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ISystemUiProxy.DESCRIPTOR);
                    obtain.writeFloat(f);
                    this.mRemote.transact(19, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.ISystemUiProxy
            public void onAssistantProgress(float f) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ISystemUiProxy.DESCRIPTOR);
                    obtain.writeFloat(f);
                    this.mRemote.transact(13, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.ISystemUiProxy
            public void onBackPressed() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ISystemUiProxy.DESCRIPTOR);
                    this.mRemote.transact(45, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.ISystemUiProxy
            public void onImeSwitcherPressed() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ISystemUiProxy.DESCRIPTOR);
                    this.mRemote.transact(50, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.ISystemUiProxy
            public void onOverviewShown(boolean z) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ISystemUiProxy.DESCRIPTOR);
                    obtain.writeBoolean(z);
                    this.mRemote.transact(7, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.ISystemUiProxy
            public void onStatusBarMotionEvent(MotionEvent motionEvent) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ISystemUiProxy.DESCRIPTOR);
                    obtain.writeTypedObject(motionEvent, 0);
                    this.mRemote.transact(10, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.ISystemUiProxy
            public void setHomeRotationEnabled(boolean z) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ISystemUiProxy.DESCRIPTOR);
                    obtain.writeBoolean(z);
                    this.mRemote.transact(46, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.ISystemUiProxy
            public void setNavBarButtonAlpha(float f, boolean z) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ISystemUiProxy.DESCRIPTOR);
                    obtain.writeFloat(f);
                    obtain.writeBoolean(z);
                    this.mRemote.transact(20, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.ISystemUiProxy
            public void setSplitScreenMinimized(boolean z) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ISystemUiProxy.DESCRIPTOR);
                    obtain.writeBoolean(z);
                    this.mRemote.transact(23, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.ISystemUiProxy
            public void startAssistant(Bundle bundle) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ISystemUiProxy.DESCRIPTOR);
                    obtain.writeTypedObject(bundle, 0);
                    this.mRemote.transact(14, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.ISystemUiProxy
            public void startScreenPinning(int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ISystemUiProxy.DESCRIPTOR);
                    obtain.writeInt(i);
                    this.mRemote.transact(2, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.ISystemUiProxy
            public void stopScreenPinning() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ISystemUiProxy.DESCRIPTOR);
                    this.mRemote.transact(18, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.ISystemUiProxy
            public void toggleNotificationPanel() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ISystemUiProxy.DESCRIPTOR);
                    this.mRemote.transact(51, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.mRemote;
            }
        }

        public static ISystemUiProxy asInterface(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface(ISystemUiProxy.DESCRIPTOR);
            if (queryLocalInterface == null || !(queryLocalInterface instanceof ISystemUiProxy)) {
                return new Proxy(iBinder);
            }
            return (ISystemUiProxy) queryLocalInterface;
        }

        public Stub() {
            attachInterface(this, ISystemUiProxy.DESCRIPTOR);
        }
    }

    void expandNotificationPanel() throws RemoteException;

    @Deprecated
    Rect getNonMinimizedSplitScreenSecondaryBounds() throws RemoteException;

    @Deprecated
    void handleImageAsScreenshot(Bitmap bitmap, Rect rect, Insets insets, int i) throws RemoteException;

    void handleImageBundleAsScreenshot(Bundle bundle, Rect rect, Insets insets, Task.TaskKey taskKey) throws RemoteException;

    void notifyAccessibilityButtonClicked(int i) throws RemoteException;

    void notifyAccessibilityButtonLongClicked() throws RemoteException;

    void notifyPrioritizedRotation(int i) throws RemoteException;

    void notifySwipeToHomeFinished() throws RemoteException;

    void notifySwipeUpGestureStarted() throws RemoteException;

    void notifyTaskbarAutohideSuspend(boolean z) throws RemoteException;

    void notifyTaskbarStatus(boolean z, boolean z2) throws RemoteException;

    void onAssistantGestureCompletion(float f) throws RemoteException;

    void onAssistantProgress(float f) throws RemoteException;

    void onBackPressed() throws RemoteException;

    void onImeSwitcherPressed() throws RemoteException;

    void onOverviewShown(boolean z) throws RemoteException;

    void onStatusBarMotionEvent(MotionEvent motionEvent) throws RemoteException;

    void setHomeRotationEnabled(boolean z) throws RemoteException;

    void setNavBarButtonAlpha(float f, boolean z) throws RemoteException;

    @Deprecated
    void setSplitScreenMinimized(boolean z) throws RemoteException;

    void startAssistant(Bundle bundle) throws RemoteException;

    void startScreenPinning(int i) throws RemoteException;

    void stopScreenPinning() throws RemoteException;

    void toggleNotificationPanel() throws RemoteException;
}
