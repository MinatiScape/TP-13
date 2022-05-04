package android.support.v4.os;

import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import android.support.v4.os.ResultReceiver;
import java.util.Objects;
/* loaded from: classes.dex */
public interface IResultReceiver extends IInterface {

    /* loaded from: classes.dex */
    public static abstract class Stub extends Binder implements IResultReceiver {
        public static final /* synthetic */ int $r8$clinit = 0;

        /* loaded from: classes.dex */
        public static class Proxy implements IResultReceiver {
            public IBinder mRemote;

            public Proxy(IBinder remote) {
                this.mRemote = remote;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.mRemote;
            }
        }

        public Stub() {
            attachInterface(this, "android.support.v4.os.IResultReceiver");
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            if (code == 1) {
                data.enforceInterface("android.support.v4.os.IResultReceiver");
                int readInt = data.readInt();
                Bundle bundle = data.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(data) : null;
                ResultReceiver.MyResultReceiver myResultReceiver = (ResultReceiver.MyResultReceiver) this;
                Objects.requireNonNull(ResultReceiver.this);
                ResultReceiver.this.onReceiveResult(readInt, bundle);
                return true;
            } else if (code != 1598968902) {
                return super.onTransact(code, data, reply, flags);
            } else {
                reply.writeString("android.support.v4.os.IResultReceiver");
                return true;
            }
        }
    }
}
