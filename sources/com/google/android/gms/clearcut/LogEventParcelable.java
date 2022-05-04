package com.google.android.gms.clearcut;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.core.R$id;
import com.google.android.gms.clearcut.ClearcutLogger;
import com.google.android.gms.clearcut.internal.PlayLoggerContext;
import com.google.android.gms.internal.zzbkv;
import com.google.android.gms.internal.zzgsv;
import com.google.android.gms.phenotype.ExperimentTokens;
import java.util.Arrays;
/* loaded from: classes.dex */
public class LogEventParcelable extends zzbkv {
    public static final Parcelable.Creator<LogEventParcelable> CREATOR = new zzq();
    public boolean addPhenotypeExperimentTokens;
    public final ClearcutLogger.MessageProducer clientVisualElementsProducer;
    public int[] experimentIds;
    public byte[][] experimentTokens;
    public ExperimentTokens[] experimentTokensParcelables;
    public final ClearcutLogger.MessageProducer extensionProducer;
    public final zzgsv logEvent;
    public byte[] logEventBytes;
    public String[] mendelPackages;
    public PlayLoggerContext playLoggerContext;
    public int[] testCodes;

    public LogEventParcelable(PlayLoggerContext playLoggerContext, zzgsv zzgsvVar, ClearcutLogger.MessageProducer messageProducer, int[] iArr, int[] iArr2, boolean z) {
        this.playLoggerContext = playLoggerContext;
        this.logEvent = zzgsvVar;
        this.extensionProducer = messageProducer;
        this.clientVisualElementsProducer = null;
        this.testCodes = iArr;
        this.mendelPackages = null;
        this.experimentIds = iArr2;
        this.experimentTokens = null;
        this.experimentTokensParcelables = null;
        this.addPhenotypeExperimentTokens = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof LogEventParcelable) {
            LogEventParcelable logEventParcelable = (LogEventParcelable) obj;
            if (R$id.zza(this.playLoggerContext, logEventParcelable.playLoggerContext) && Arrays.equals(this.logEventBytes, logEventParcelable.logEventBytes) && Arrays.equals(this.testCodes, logEventParcelable.testCodes) && Arrays.equals(this.mendelPackages, logEventParcelable.mendelPackages) && R$id.zza(this.logEvent, logEventParcelable.logEvent) && R$id.zza(this.extensionProducer, logEventParcelable.extensionProducer) && R$id.zza(this.clientVisualElementsProducer, logEventParcelable.clientVisualElementsProducer) && Arrays.equals(this.experimentIds, logEventParcelable.experimentIds) && Arrays.deepEquals(this.experimentTokens, logEventParcelable.experimentTokens) && Arrays.equals(this.experimentTokensParcelables, logEventParcelable.experimentTokensParcelables) && this.addPhenotypeExperimentTokens == logEventParcelable.addPhenotypeExperimentTokens) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.playLoggerContext, this.logEventBytes, this.testCodes, this.mendelPackages, this.logEvent, this.extensionProducer, this.clientVisualElementsProducer, this.experimentIds, this.experimentTokens, this.experimentTokensParcelables, Boolean.valueOf(this.addPhenotypeExperimentTokens)});
    }

    public final String toString() {
        String str;
        StringBuilder sb = new StringBuilder("LogEventParcelable[");
        sb.append(this.playLoggerContext);
        sb.append(", LogEventBytes: ");
        byte[] bArr = this.logEventBytes;
        if (bArr == null) {
            str = null;
        } else {
            str = new String(bArr);
        }
        sb.append(str);
        sb.append(", TestCodes: ");
        sb.append(Arrays.toString(this.testCodes));
        sb.append(", MendelPackages: ");
        sb.append(Arrays.toString(this.mendelPackages));
        sb.append(", LogEvent: ");
        sb.append(this.logEvent);
        sb.append(", ExtensionProducer: ");
        sb.append(this.extensionProducer);
        sb.append(", VeProducer: ");
        sb.append(this.clientVisualElementsProducer);
        sb.append(", ExperimentIDs: ");
        sb.append(Arrays.toString(this.experimentIds));
        sb.append(", ExperimentTokens: ");
        sb.append(Arrays.toString(this.experimentTokens));
        sb.append(", ExperimentTokensParcelables: ");
        sb.append(Arrays.toString(this.experimentTokensParcelables));
        sb.append(", AddPhenotypeExperimentTokens: ");
        sb.append(this.addPhenotypeExperimentTokens);
        sb.append("]");
        return sb.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int zzb = R$id.zzb(parcel, 20293);
        R$id.zza(parcel, 2, this.playLoggerContext, i);
        R$id.zza(parcel, 3, this.logEventBytes);
        R$id.zza(parcel, 4, this.testCodes);
        R$id.zza(parcel, 5, this.mendelPackages);
        R$id.zza(parcel, 6, this.experimentIds);
        R$id.zza(parcel, 7, this.experimentTokens);
        boolean z = this.addPhenotypeExperimentTokens;
        R$id.zzb(parcel, 8, 4);
        parcel.writeInt(z ? 1 : 0);
        R$id.zza(parcel, 9, this.experimentTokensParcelables, i);
        R$id.zzc(parcel, zzb);
    }

    public LogEventParcelable(PlayLoggerContext playLoggerContext, byte[] bArr, int[] iArr, String[] strArr, int[] iArr2, byte[][] bArr2, boolean z, ExperimentTokens[] experimentTokensArr) {
        this.playLoggerContext = playLoggerContext;
        this.logEventBytes = bArr;
        this.testCodes = iArr;
        this.mendelPackages = strArr;
        this.logEvent = null;
        this.extensionProducer = null;
        this.clientVisualElementsProducer = null;
        this.experimentIds = iArr2;
        this.experimentTokens = bArr2;
        this.experimentTokensParcelables = experimentTokensArr;
        this.addPhenotypeExperimentTokens = z;
    }
}
