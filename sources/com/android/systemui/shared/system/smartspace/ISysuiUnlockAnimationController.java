package com.android.systemui.shared.system.smartspace;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.android.systemui.shared.system.smartspace.ILauncherUnlockAnimationController;
/* loaded from: classes.dex */
public interface ISysuiUnlockAnimationController extends IInterface {
    public static final String DESCRIPTOR = "com.android.systemui.shared.system.smartspace.ISysuiUnlockAnimationController";

    /* loaded from: classes.dex */
    public static class Default implements ISysuiUnlockAnimationController {
        @Override // android.os.IInterface
        public IBinder asBinder() {
            return null;
        }

        @Override // com.android.systemui.shared.system.smartspace.ISysuiUnlockAnimationController
        public void onLauncherSmartspaceStateUpdated(SmartspaceState smartspaceState) throws RemoteException {
        }

        @Override // com.android.systemui.shared.system.smartspace.ISysuiUnlockAnimationController
        public void setLauncherUnlockController(ILauncherUnlockAnimationController iLauncherUnlockAnimationController) throws RemoteException {
        }
    }

    /* loaded from: classes.dex */
    public static abstract class Stub extends Binder implements ISysuiUnlockAnimationController {
        public static final int TRANSACTION_onLauncherSmartspaceStateUpdated = 2;
        public static final int TRANSACTION_setLauncherUnlockController = 1;

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            if (i >= 1 && i <= 16777215) {
                parcel.enforceInterface(ISysuiUnlockAnimationController.DESCRIPTOR);
            }
            if (i != 1598968902) {
                if (i == 1) {
                    ILauncherUnlockAnimationController asInterface = ILauncherUnlockAnimationController.Stub.asInterface(parcel.readStrongBinder());
                    parcel.enforceNoDataAvail();
                    setLauncherUnlockController(asInterface);
                } else if (i != 2) {
                    return super.onTransact(i, parcel, parcel2, i2);
                } else {
                    parcel.enforceNoDataAvail();
                    onLauncherSmartspaceStateUpdated((SmartspaceState) parcel.readTypedObject(SmartspaceState.CREATOR));
                }
                return true;
            }
            parcel2.writeString(ISysuiUnlockAnimationController.DESCRIPTOR);
            return true;
        }

        /* loaded from: classes.dex */
        public static class Proxy implements ISysuiUnlockAnimationController {
            private IBinder mRemote;

            public String getInterfaceDescriptor() {
                return ISysuiUnlockAnimationController.DESCRIPTOR;
            }

            public Proxy(IBinder iBinder) {
                this.mRemote = iBinder;
            }

            @Override // com.android.systemui.shared.system.smartspace.ISysuiUnlockAnimationController
            public void onLauncherSmartspaceStateUpdated(SmartspaceState smartspaceState) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ISysuiUnlockAnimationController.DESCRIPTOR);
                    obtain.writeTypedObject(smartspaceState, 0);
                    this.mRemote.transact(2, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.system.smartspace.ISysuiUnlockAnimationController
            public void setLauncherUnlockController(ILauncherUnlockAnimationController iLauncherUnlockAnimationController) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ISysuiUnlockAnimationController.DESCRIPTOR);
                    obtain.writeStrongInterface(iLauncherUnlockAnimationController);
                    this.mRemote.transact(1, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.mRemote;
            }
        }

        public static ISysuiUnlockAnimationController asInterface(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface(ISysuiUnlockAnimationController.DESCRIPTOR);
            if (queryLocalInterface == null || !(queryLocalInterface instanceof ISysuiUnlockAnimationController)) {
                return new Proxy(iBinder);
            }
            return (ISysuiUnlockAnimationController) queryLocalInterface;
        }

        public Stub() {
            attachInterface(this, ISysuiUnlockAnimationController.DESCRIPTOR);
        }
    }

    void onLauncherSmartspaceStateUpdated(SmartspaceState smartspaceState) throws RemoteException;

    void setLauncherUnlockController(ILauncherUnlockAnimationController iLauncherUnlockAnimationController) throws RemoteException;
}
