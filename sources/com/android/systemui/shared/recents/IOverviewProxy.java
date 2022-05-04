package com.android.systemui.shared.recents;

import android.graphics.Rect;
import android.graphics.Region;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
/* loaded from: classes.dex */
public interface IOverviewProxy extends IInterface {
    public static final String DESCRIPTOR = "com.android.systemui.shared.recents.IOverviewProxy";

    /* loaded from: classes.dex */
    public static class Default implements IOverviewProxy {
        @Override // android.os.IInterface
        public IBinder asBinder() {
            return null;
        }

        @Override // com.android.systemui.shared.recents.IOverviewProxy
        public void disable(int i, int i2, int i3, boolean z) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.IOverviewProxy
        public void onActiveNavBarRegionChanges(Region region) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.IOverviewProxy
        public void onAssistantAvailable(boolean z) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.IOverviewProxy
        public void onAssistantVisibilityChanged(float f) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.IOverviewProxy
        public void onBackAction(boolean z, int i, int i2, boolean z2, boolean z3) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.IOverviewProxy
        public void onInitialize(Bundle bundle) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.IOverviewProxy
        public void onNavButtonsDarkIntensityChanged(float f) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.IOverviewProxy
        public void onOverviewHidden(boolean z, boolean z2) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.IOverviewProxy
        public void onOverviewShown(boolean z) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.IOverviewProxy
        public void onOverviewToggle() throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.IOverviewProxy
        public void onRotationProposal(int i, boolean z) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.IOverviewProxy
        public void onScreenTurnedOn() throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.IOverviewProxy
        public void onSplitScreenSecondaryBoundsChanged(Rect rect, Rect rect2) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.IOverviewProxy
        public void onSystemBarAttributesChanged(int i, int i2) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.IOverviewProxy
        public void onSystemUiStateChanged(int i) throws RemoteException {
        }

        @Override // com.android.systemui.shared.recents.IOverviewProxy
        public void onTip(int i, int i2) throws RemoteException {
        }
    }

    /* loaded from: classes.dex */
    public static abstract class Stub extends Binder implements IOverviewProxy {
        public static final int TRANSACTION_disable = 20;
        public static final int TRANSACTION_onActiveNavBarRegionChanges = 12;
        public static final int TRANSACTION_onAssistantAvailable = 14;
        public static final int TRANSACTION_onAssistantVisibilityChanged = 15;
        public static final int TRANSACTION_onBackAction = 16;
        public static final int TRANSACTION_onInitialize = 13;
        public static final int TRANSACTION_onNavButtonsDarkIntensityChanged = 23;
        public static final int TRANSACTION_onOverviewHidden = 9;
        public static final int TRANSACTION_onOverviewShown = 8;
        public static final int TRANSACTION_onOverviewToggle = 7;
        public static final int TRANSACTION_onRotationProposal = 19;
        public static final int TRANSACTION_onScreenTurnedOn = 22;
        public static final int TRANSACTION_onSplitScreenSecondaryBoundsChanged = 18;
        public static final int TRANSACTION_onSystemBarAttributesChanged = 21;
        public static final int TRANSACTION_onSystemUiStateChanged = 17;
        public static final int TRANSACTION_onTip = 11;

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            if (i >= 1 && i <= 16777215) {
                parcel.enforceInterface(IOverviewProxy.DESCRIPTOR);
            }
            if (i != 1598968902) {
                switch (i) {
                    case 7:
                        onOverviewToggle();
                        break;
                    case 8:
                        boolean readBoolean = parcel.readBoolean();
                        parcel.enforceNoDataAvail();
                        onOverviewShown(readBoolean);
                        break;
                    case 9:
                        boolean readBoolean2 = parcel.readBoolean();
                        boolean readBoolean3 = parcel.readBoolean();
                        parcel.enforceNoDataAvail();
                        onOverviewHidden(readBoolean2, readBoolean3);
                        break;
                    case 10:
                    default:
                        return super.onTransact(i, parcel, parcel2, i2);
                    case 11:
                        int readInt = parcel.readInt();
                        int readInt2 = parcel.readInt();
                        parcel.enforceNoDataAvail();
                        onTip(readInt, readInt2);
                        break;
                    case 12:
                        parcel.enforceNoDataAvail();
                        onActiveNavBarRegionChanges((Region) parcel.readTypedObject(Region.CREATOR));
                        break;
                    case 13:
                        parcel.enforceNoDataAvail();
                        onInitialize((Bundle) parcel.readTypedObject(Bundle.CREATOR));
                        break;
                    case 14:
                        boolean readBoolean4 = parcel.readBoolean();
                        parcel.enforceNoDataAvail();
                        onAssistantAvailable(readBoolean4);
                        break;
                    case 15:
                        float readFloat = parcel.readFloat();
                        parcel.enforceNoDataAvail();
                        onAssistantVisibilityChanged(readFloat);
                        break;
                    case 16:
                        boolean readBoolean5 = parcel.readBoolean();
                        int readInt3 = parcel.readInt();
                        int readInt4 = parcel.readInt();
                        boolean readBoolean6 = parcel.readBoolean();
                        boolean readBoolean7 = parcel.readBoolean();
                        parcel.enforceNoDataAvail();
                        onBackAction(readBoolean5, readInt3, readInt4, readBoolean6, readBoolean7);
                        break;
                    case 17:
                        int readInt5 = parcel.readInt();
                        parcel.enforceNoDataAvail();
                        onSystemUiStateChanged(readInt5);
                        break;
                    case 18:
                        parcel.enforceNoDataAvail();
                        onSplitScreenSecondaryBoundsChanged((Rect) parcel.readTypedObject(Rect.CREATOR), (Rect) parcel.readTypedObject(Rect.CREATOR));
                        break;
                    case 19:
                        int readInt6 = parcel.readInt();
                        boolean readBoolean8 = parcel.readBoolean();
                        parcel.enforceNoDataAvail();
                        onRotationProposal(readInt6, readBoolean8);
                        break;
                    case 20:
                        int readInt7 = parcel.readInt();
                        int readInt8 = parcel.readInt();
                        int readInt9 = parcel.readInt();
                        boolean readBoolean9 = parcel.readBoolean();
                        parcel.enforceNoDataAvail();
                        disable(readInt7, readInt8, readInt9, readBoolean9);
                        break;
                    case 21:
                        int readInt10 = parcel.readInt();
                        int readInt11 = parcel.readInt();
                        parcel.enforceNoDataAvail();
                        onSystemBarAttributesChanged(readInt10, readInt11);
                        break;
                    case 22:
                        onScreenTurnedOn();
                        break;
                    case 23:
                        float readFloat2 = parcel.readFloat();
                        parcel.enforceNoDataAvail();
                        onNavButtonsDarkIntensityChanged(readFloat2);
                        break;
                }
                return true;
            }
            parcel2.writeString(IOverviewProxy.DESCRIPTOR);
            return true;
        }

        /* loaded from: classes.dex */
        public static class Proxy implements IOverviewProxy {
            private IBinder mRemote;

            public String getInterfaceDescriptor() {
                return IOverviewProxy.DESCRIPTOR;
            }

            public Proxy(IBinder iBinder) {
                this.mRemote = iBinder;
            }

            @Override // com.android.systemui.shared.recents.IOverviewProxy
            public void disable(int i, int i2, int i3, boolean z) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(IOverviewProxy.DESCRIPTOR);
                    obtain.writeInt(i);
                    obtain.writeInt(i2);
                    obtain.writeInt(i3);
                    obtain.writeBoolean(z);
                    this.mRemote.transact(20, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.IOverviewProxy
            public void onActiveNavBarRegionChanges(Region region) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(IOverviewProxy.DESCRIPTOR);
                    obtain.writeTypedObject(region, 0);
                    this.mRemote.transact(12, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.IOverviewProxy
            public void onAssistantAvailable(boolean z) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(IOverviewProxy.DESCRIPTOR);
                    obtain.writeBoolean(z);
                    this.mRemote.transact(14, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.IOverviewProxy
            public void onAssistantVisibilityChanged(float f) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(IOverviewProxy.DESCRIPTOR);
                    obtain.writeFloat(f);
                    this.mRemote.transact(15, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.IOverviewProxy
            public void onBackAction(boolean z, int i, int i2, boolean z2, boolean z3) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(IOverviewProxy.DESCRIPTOR);
                    obtain.writeBoolean(z);
                    obtain.writeInt(i);
                    obtain.writeInt(i2);
                    obtain.writeBoolean(z2);
                    obtain.writeBoolean(z3);
                    this.mRemote.transact(16, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.IOverviewProxy
            public void onInitialize(Bundle bundle) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(IOverviewProxy.DESCRIPTOR);
                    obtain.writeTypedObject(bundle, 0);
                    this.mRemote.transact(13, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.IOverviewProxy
            public void onNavButtonsDarkIntensityChanged(float f) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(IOverviewProxy.DESCRIPTOR);
                    obtain.writeFloat(f);
                    this.mRemote.transact(23, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.IOverviewProxy
            public void onOverviewHidden(boolean z, boolean z2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(IOverviewProxy.DESCRIPTOR);
                    obtain.writeBoolean(z);
                    obtain.writeBoolean(z2);
                    this.mRemote.transact(9, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.IOverviewProxy
            public void onOverviewShown(boolean z) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(IOverviewProxy.DESCRIPTOR);
                    obtain.writeBoolean(z);
                    this.mRemote.transact(8, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.IOverviewProxy
            public void onOverviewToggle() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(IOverviewProxy.DESCRIPTOR);
                    this.mRemote.transact(7, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.IOverviewProxy
            public void onRotationProposal(int i, boolean z) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(IOverviewProxy.DESCRIPTOR);
                    obtain.writeInt(i);
                    obtain.writeBoolean(z);
                    this.mRemote.transact(19, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.IOverviewProxy
            public void onScreenTurnedOn() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(IOverviewProxy.DESCRIPTOR);
                    this.mRemote.transact(22, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.IOverviewProxy
            public void onSplitScreenSecondaryBoundsChanged(Rect rect, Rect rect2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(IOverviewProxy.DESCRIPTOR);
                    obtain.writeTypedObject(rect, 0);
                    obtain.writeTypedObject(rect2, 0);
                    this.mRemote.transact(18, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.IOverviewProxy
            public void onSystemBarAttributesChanged(int i, int i2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(IOverviewProxy.DESCRIPTOR);
                    obtain.writeInt(i);
                    obtain.writeInt(i2);
                    this.mRemote.transact(21, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.IOverviewProxy
            public void onSystemUiStateChanged(int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(IOverviewProxy.DESCRIPTOR);
                    obtain.writeInt(i);
                    this.mRemote.transact(17, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // com.android.systemui.shared.recents.IOverviewProxy
            public void onTip(int i, int i2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(IOverviewProxy.DESCRIPTOR);
                    obtain.writeInt(i);
                    obtain.writeInt(i2);
                    this.mRemote.transact(11, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.mRemote;
            }
        }

        public static IOverviewProxy asInterface(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface(IOverviewProxy.DESCRIPTOR);
            if (queryLocalInterface == null || !(queryLocalInterface instanceof IOverviewProxy)) {
                return new Proxy(iBinder);
            }
            return (IOverviewProxy) queryLocalInterface;
        }

        public Stub() {
            attachInterface(this, IOverviewProxy.DESCRIPTOR);
        }
    }

    void disable(int i, int i2, int i3, boolean z) throws RemoteException;

    void onActiveNavBarRegionChanges(Region region) throws RemoteException;

    void onAssistantAvailable(boolean z) throws RemoteException;

    void onAssistantVisibilityChanged(float f) throws RemoteException;

    void onBackAction(boolean z, int i, int i2, boolean z2, boolean z3) throws RemoteException;

    void onInitialize(Bundle bundle) throws RemoteException;

    void onNavButtonsDarkIntensityChanged(float f) throws RemoteException;

    void onOverviewHidden(boolean z, boolean z2) throws RemoteException;

    void onOverviewShown(boolean z) throws RemoteException;

    void onOverviewToggle() throws RemoteException;

    void onRotationProposal(int i, boolean z) throws RemoteException;

    void onScreenTurnedOn() throws RemoteException;

    void onSplitScreenSecondaryBoundsChanged(Rect rect, Rect rect2) throws RemoteException;

    void onSystemBarAttributesChanged(int i, int i2) throws RemoteException;

    void onSystemUiStateChanged(int i) throws RemoteException;

    void onTip(int i, int i2) throws RemoteException;
}
