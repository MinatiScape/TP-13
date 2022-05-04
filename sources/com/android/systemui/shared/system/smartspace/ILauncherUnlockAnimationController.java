package com.android.systemui.shared.system.smartspace;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
/* loaded from: classes.dex */
public interface ILauncherUnlockAnimationController extends IInterface {
    public static final String DESCRIPTOR = "com.android.systemui.shared.system.smartspace.ILauncherUnlockAnimationController";

    /* loaded from: classes.dex */
    public static class Default implements ILauncherUnlockAnimationController {
        @Override // android.os.IInterface
        public IBinder asBinder() {
            return null;
        }

        @Override // com.android.systemui.shared.system.smartspace.ILauncherUnlockAnimationController
        public void dispatchSmartspaceStateToSysui() throws RemoteException {
        }

        @Override // com.android.systemui.shared.system.smartspace.ILauncherUnlockAnimationController
        public void playUnlockAnimation(boolean z, long j) throws RemoteException {
        }

        @Override // com.android.systemui.shared.system.smartspace.ILauncherUnlockAnimationController
        public void prepareForUnlock(boolean z, int i) throws RemoteException {
        }

        @Override // com.android.systemui.shared.system.smartspace.ILauncherUnlockAnimationController
        public void setSmartspaceSelectedPage(int i) throws RemoteException {
        }

        @Override // com.android.systemui.shared.system.smartspace.ILauncherUnlockAnimationController
        public void setSmartspaceVisibility(int i) throws RemoteException {
        }

        @Override // com.android.systemui.shared.system.smartspace.ILauncherUnlockAnimationController
        public void setUnlockAmount(float f) throws RemoteException {
        }
    }

    /* loaded from: classes.dex */
    public static abstract class Stub extends Binder implements ILauncherUnlockAnimationController {
        public static final int TRANSACTION_dispatchSmartspaceStateToSysui = 6;
        public static final int TRANSACTION_playUnlockAnimation = 3;
        public static final int TRANSACTION_prepareForUnlock = 1;
        public static final int TRANSACTION_setSmartspaceSelectedPage = 4;
        public static final int TRANSACTION_setSmartspaceVisibility = 5;
        public static final int TRANSACTION_setUnlockAmount = 2;

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            if (i >= 1 && i <= 16777215) {
                parcel.enforceInterface(ILauncherUnlockAnimationController.DESCRIPTOR);
            }
            if (i != 1598968902) {
                switch (i) {
                    case 1:
                        boolean readBoolean = parcel.readBoolean();
                        int readInt = parcel.readInt();
                        parcel.enforceNoDataAvail();
                        prepareForUnlock(readBoolean, readInt);
                        parcel2.writeNoException();
                        break;
                    case 2:
                        float readFloat = parcel.readFloat();
                        parcel.enforceNoDataAvail();
                        setUnlockAmount(readFloat);
                        break;
                    case 3:
                        boolean readBoolean2 = parcel.readBoolean();
                        long readLong = parcel.readLong();
                        parcel.enforceNoDataAvail();
                        playUnlockAnimation(readBoolean2, readLong);
                        break;
                    case 4:
                        int readInt2 = parcel.readInt();
                        parcel.enforceNoDataAvail();
                        setSmartspaceSelectedPage(readInt2);
                        break;
                    case 5:
                        int readInt3 = parcel.readInt();
                        parcel.enforceNoDataAvail();
                        setSmartspaceVisibility(readInt3);
                        parcel2.writeNoException();
                        break;
                    case 6:
                        dispatchSmartspaceStateToSysui();
                        break;
                    default:
                        return super.onTransact(i, parcel, parcel2, i2);
                }
                return true;
            }
            parcel2.writeString(ILauncherUnlockAnimationController.DESCRIPTOR);
            return true;
        }

        /* loaded from: classes.dex */
        public static class Proxy implements ILauncherUnlockAnimationController {
            private IBinder mRemote;

            public String getInterfaceDescriptor() {
                return ILauncherUnlockAnimationController.DESCRIPTOR;
            }

            public Proxy(IBinder iBinder) {
                this.mRemote = iBinder;
            }

            @Override // com.android.systemui.shared.system.smartspace.ILauncherUnlockAnimationController
            public void dispatchSmartspaceStateToSysui() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ILauncherUnlockAnimationController.DESCRIPTOR);
                    this.mRemote.transact(6, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.system.smartspace.ILauncherUnlockAnimationController
            public void playUnlockAnimation(boolean z, long j) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ILauncherUnlockAnimationController.DESCRIPTOR);
                    obtain.writeBoolean(z);
                    obtain.writeLong(j);
                    this.mRemote.transact(3, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.system.smartspace.ILauncherUnlockAnimationController
            public void prepareForUnlock(boolean z, int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ILauncherUnlockAnimationController.DESCRIPTOR);
                    obtain.writeBoolean(z);
                    obtain.writeInt(i);
                    this.mRemote.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.system.smartspace.ILauncherUnlockAnimationController
            public void setSmartspaceSelectedPage(int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ILauncherUnlockAnimationController.DESCRIPTOR);
                    obtain.writeInt(i);
                    this.mRemote.transact(4, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.system.smartspace.ILauncherUnlockAnimationController
            public void setSmartspaceVisibility(int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ILauncherUnlockAnimationController.DESCRIPTOR);
                    obtain.writeInt(i);
                    this.mRemote.transact(5, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.system.smartspace.ILauncherUnlockAnimationController
            public void setUnlockAmount(float f) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ILauncherUnlockAnimationController.DESCRIPTOR);
                    obtain.writeFloat(f);
                    this.mRemote.transact(2, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.mRemote;
            }
        }

        public static ILauncherUnlockAnimationController asInterface(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface(ILauncherUnlockAnimationController.DESCRIPTOR);
            if (queryLocalInterface == null || !(queryLocalInterface instanceof ILauncherUnlockAnimationController)) {
                return new Proxy(iBinder);
            }
            return (ILauncherUnlockAnimationController) queryLocalInterface;
        }

        public Stub() {
            attachInterface(this, ILauncherUnlockAnimationController.DESCRIPTOR);
        }
    }

    void dispatchSmartspaceStateToSysui() throws RemoteException;

    void playUnlockAnimation(boolean z, long j) throws RemoteException;

    void prepareForUnlock(boolean z, int i) throws RemoteException;

    void setSmartspaceSelectedPage(int i) throws RemoteException;

    void setSmartspaceVisibility(int i) throws RemoteException;

    void setUnlockAmount(float f) throws RemoteException;
}
