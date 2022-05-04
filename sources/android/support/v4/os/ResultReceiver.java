package android.support.v4.os;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.v4.os.IResultReceiver;
@SuppressLint({"BanParcelableUsage"})
/* loaded from: classes.dex */
public class ResultReceiver implements Parcelable {
    public static final Parcelable.Creator<ResultReceiver> CREATOR = new Parcelable.Creator<ResultReceiver>() { // from class: android.support.v4.os.ResultReceiver.1
        @Override // android.os.Parcelable.Creator
        public ResultReceiver createFromParcel(Parcel in) {
            return new ResultReceiver(in);
        }

        @Override // android.os.Parcelable.Creator
        public ResultReceiver[] newArray(int size) {
            return new ResultReceiver[size];
        }
    };
    public IResultReceiver mReceiver;

    /* loaded from: classes.dex */
    public class MyResultReceiver extends IResultReceiver.Stub {
        public MyResultReceiver() {
        }
    }

    public ResultReceiver(Parcel in) {
        IResultReceiver iResultReceiver;
        IBinder readStrongBinder = in.readStrongBinder();
        int i = IResultReceiver.Stub.$r8$clinit;
        if (readStrongBinder == null) {
            iResultReceiver = null;
        } else {
            IInterface queryLocalInterface = readStrongBinder.queryLocalInterface("android.support.v4.os.IResultReceiver");
            if (queryLocalInterface == null || !(queryLocalInterface instanceof IResultReceiver)) {
                iResultReceiver = new IResultReceiver.Stub.Proxy(readStrongBinder);
            } else {
                iResultReceiver = (IResultReceiver) queryLocalInterface;
            }
        }
        this.mReceiver = iResultReceiver;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public void onReceiveResult(int resultCode, Bundle resultData) {
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        synchronized (this) {
            if (this.mReceiver == null) {
                this.mReceiver = new MyResultReceiver();
            }
            out.writeStrongBinder(this.mReceiver.asBinder());
        }
    }
}
