package com.google.android.gms.common.internal;

import android.accounts.Account;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.internal.zzbkw;
/* compiled from: ResolveAccountRequestCreator.java */
/* loaded from: classes.dex */
public final class zzaw implements Parcelable.Creator<zzav> {
    @Override // android.os.Parcelable.Creator
    public final /* synthetic */ zzav createFromParcel(Parcel parcel) {
        int zza = zzbkw.zza(parcel);
        Account account = null;
        int i = 0;
        int i2 = 0;
        GoogleSignInAccount googleSignInAccount = null;
        while (parcel.dataPosition() < zza) {
            int readInt = parcel.readInt();
            int i3 = 65535 & readInt;
            if (i3 == 1) {
                i = zzbkw.zzg(parcel, readInt);
            } else if (i3 == 2) {
                account = (Account) zzbkw.zza(parcel, readInt, Account.CREATOR);
            } else if (i3 == 3) {
                i2 = zzbkw.zzg(parcel, readInt);
            } else if (i3 != 4) {
                zzbkw.zzb(parcel, readInt);
            } else {
                googleSignInAccount = (GoogleSignInAccount) zzbkw.zza(parcel, readInt, GoogleSignInAccount.CREATOR);
            }
        }
        zzbkw.zzae(parcel, zza);
        return new zzav(i, account, i2, googleSignInAccount);
    }

    @Override // android.os.Parcelable.Creator
    public final /* synthetic */ zzav[] newArray(int i) {
        return new zzav[i];
    }
}
