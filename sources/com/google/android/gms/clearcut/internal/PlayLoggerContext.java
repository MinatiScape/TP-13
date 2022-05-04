package com.google.android.gms.clearcut.internal;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.core.R$id;
import androidx.slice.view.R$layout;
import com.google.android.gms.internal.zzbkv;
import java.util.Arrays;
import java.util.Objects;
/* loaded from: classes.dex */
public class PlayLoggerContext extends zzbkv {
    public static final Parcelable.Creator<PlayLoggerContext> CREATOR = new zzu();
    public final boolean isAnonymous;
    public final boolean logAndroidId;
    public final int logSource;
    public final String logSourceName;
    public final String loggingId;
    public final String packageName;
    public final int packageVersionCode;
    public final int qosTier;
    public final String uploadAccountName;

    public PlayLoggerContext(String str, int i, int i2, String str2, String str3, boolean z, String str4, boolean z2, int i3) {
        this.packageName = str;
        this.packageVersionCode = i;
        this.logSource = i2;
        this.uploadAccountName = str2;
        this.loggingId = str3;
        this.logAndroidId = z;
        this.logSourceName = str4;
        this.isAnonymous = z2;
        this.qosTier = i3;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof PlayLoggerContext) {
            PlayLoggerContext playLoggerContext = (PlayLoggerContext) obj;
            if (R$id.zza(this.packageName, playLoggerContext.packageName) && this.packageVersionCode == playLoggerContext.packageVersionCode && this.logSource == playLoggerContext.logSource && R$id.zza(this.logSourceName, playLoggerContext.logSourceName) && R$id.zza(this.uploadAccountName, playLoggerContext.uploadAccountName) && R$id.zza(this.loggingId, playLoggerContext.loggingId) && this.logAndroidId == playLoggerContext.logAndroidId && this.isAnonymous == playLoggerContext.isAnonymous && this.qosTier == playLoggerContext.qosTier) {
                return true;
            }
        }
        return false;
    }

    public int hashCode() {
        return Arrays.hashCode(new Object[]{this.packageName, Integer.valueOf(this.packageVersionCode), Integer.valueOf(this.logSource), this.logSourceName, this.uploadAccountName, this.loggingId, Boolean.valueOf(this.logAndroidId), Boolean.valueOf(this.isAnonymous), Integer.valueOf(this.qosTier)});
    }

    public String toString() {
        return "PlayLoggerContext[package=" + this.packageName + ",packageVersionCode=" + this.packageVersionCode + ",logSource=" + this.logSource + ",logSourceName=" + this.logSourceName + ",uploadAccount=" + this.uploadAccountName + ",loggingId=" + this.loggingId + ",logAndroidId=" + this.logAndroidId + ",isAnonymous=" + this.isAnonymous + ",qosTier=" + this.qosTier + "]";
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        int zzb = R$layout.zzb(parcel, 20293);
        R$layout.zza(parcel, 2, this.packageName, false);
        int i2 = this.packageVersionCode;
        R$layout.zzb(parcel, 3, 4);
        parcel.writeInt(i2);
        int i3 = this.logSource;
        R$layout.zzb(parcel, 4, 4);
        parcel.writeInt(i3);
        R$layout.zza(parcel, 5, this.uploadAccountName, false);
        R$layout.zza(parcel, 6, this.loggingId, false);
        boolean z = this.logAndroidId;
        R$layout.zzb(parcel, 7, 4);
        parcel.writeInt(z ? 1 : 0);
        R$layout.zza(parcel, 8, this.logSourceName, false);
        boolean z2 = this.isAnonymous;
        R$layout.zzb(parcel, 9, 4);
        parcel.writeInt(z2 ? 1 : 0);
        int i4 = this.qosTier;
        R$layout.zzb(parcel, 10, 4);
        parcel.writeInt(i4);
        R$layout.zzc(parcel, zzb);
    }

    public PlayLoggerContext(String str, int i, int i2, String str2, String str3, String str4, boolean z, int i3) {
        Objects.requireNonNull(str, "null reference");
        this.packageName = str;
        this.packageVersionCode = i;
        this.logSource = i2;
        this.logSourceName = str2;
        this.uploadAccountName = str3;
        this.loggingId = str4;
        this.logAndroidId = !z;
        this.isAnonymous = z;
        this.qosTier = i3;
    }
}
