package androidx.core;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import androidx.cardview.R$style;
import com.android.wallpaper.module.DailyLoggingAlarmReceiver;
import com.android.wallpaper.module.DefaultAlarmManagerWrapper;
import com.android.wallpaper.module.Injector;
import java.util.Calendar;
import java.util.List;
import java.util.concurrent.TimeUnit;
/* loaded from: classes.dex */
public final class R$id {
    public static boolean zza(Object obj, Object obj2) {
        if (obj != obj2) {
            return obj != null && obj.equals(obj2);
        }
        return true;
    }

    public static void zzb(Parcel parcel, int i, int i2) {
        if (i2 >= 65535) {
            parcel.writeInt(i | (-65536));
            parcel.writeInt(i2);
            return;
        }
        parcel.writeInt(i | (i2 << 16));
    }

    public static void zzc(Parcel parcel, int i) {
        int dataPosition = parcel.dataPosition();
        parcel.setDataPosition(i - 4);
        parcel.writeInt(dataPosition - i);
        parcel.setDataPosition(dataPosition);
    }

    public static void zza(Parcel parcel, int i, String str) {
        if (str != null) {
            int zzb = zzb(parcel, i);
            parcel.writeString(str);
            zzc(parcel, zzb);
        }
    }

    public static long generateHashCode(Bitmap bitmap) {
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        long j = ((527 + width) * 31) + height;
        for (int i = 0; i < width; i = (i * 2) + 1) {
            for (int i2 = 0; i2 < height; i2 = (i2 * 2) + 1) {
                j = (j * 31) + bitmap.getPixel(i, i2);
            }
        }
        return j;
    }

    public static void setAlarm(Context context) {
        long j;
        Injector injector = R$style.getInjector();
        DefaultAlarmManagerWrapper alarmManagerWrapper = injector.getAlarmManagerWrapper(context);
        long lastDailyLogTimestamp = injector.getPreferences(context).getLastDailyLogTimestamp();
        Calendar calendar = Calendar.getInstance();
        long currentTimeMillis = System.currentTimeMillis();
        calendar.setTimeInMillis(currentTimeMillis);
        calendar.add(6, -1);
        if (lastDailyLogTimestamp == -1 || lastDailyLogTimestamp < calendar.getTimeInMillis()) {
            Calendar calendar2 = Calendar.getInstance();
            calendar2.setTimeInMillis(currentTimeMillis);
            calendar2.add(12, 1);
            j = calendar2.getTimeInMillis();
        } else {
            Calendar calendar3 = Calendar.getInstance();
            calendar3.setTimeInMillis(lastDailyLogTimestamp);
            calendar3.add(6, 1);
            j = calendar3.getTimeInMillis();
        }
        alarmManagerWrapper.mAlarmManager.cancel(PendingIntent.getBroadcast(context, 0, new Intent(context, DailyLoggingAlarmReceiver.class), 67108864));
        PendingIntent broadcast = PendingIntent.getBroadcast(context, 0, new Intent(context, DailyLoggingAlarmReceiver.class), 67108864);
        long convert = TimeUnit.MILLISECONDS.convert(24L, TimeUnit.HOURS);
        alarmManagerWrapper.mAlarmManager.setInexactRepeating(1, j, convert, broadcast);
    }

    public static int zzb(Parcel parcel, int i) {
        parcel.writeInt(i | (-65536));
        parcel.writeInt(0);
        return parcel.dataPosition();
    }

    public static void zza(Parcel parcel, int i, Parcelable parcelable, int i2) {
        if (parcelable != null) {
            int zzb = zzb(parcel, i);
            parcelable.writeToParcel(parcel, i2);
            zzc(parcel, zzb);
        }
    }

    public static void zzc(Parcel parcel, int i, List list) {
        if (list != null) {
            int zzb = zzb(parcel, i);
            int size = list.size();
            parcel.writeInt(size);
            for (int i2 = 0; i2 < size; i2++) {
                Parcelable parcelable = (Parcelable) list.get(i2);
                if (parcelable == null) {
                    parcel.writeInt(0);
                } else {
                    zza(parcel, parcelable, 0);
                }
            }
            zzc(parcel, zzb);
        }
    }

    public static void zza(Parcel parcel, int i, Bundle bundle) {
        if (bundle != null) {
            int zzb = zzb(parcel, i);
            parcel.writeBundle(bundle);
            zzc(parcel, zzb);
        }
    }

    public static void zza(Parcel parcel, int i, byte[] bArr) {
        if (bArr != null) {
            int zzb = zzb(parcel, i);
            parcel.writeByteArray(bArr);
            zzc(parcel, zzb);
        }
    }

    public static void zza(Parcel parcel, int i, byte[][] bArr) {
        if (bArr != null) {
            int zzb = zzb(parcel, i);
            parcel.writeInt(bArr.length);
            for (byte[] bArr2 : bArr) {
                parcel.writeByteArray(bArr2);
            }
            zzc(parcel, zzb);
        }
    }

    public static void zza(Parcel parcel, int i, int[] iArr) {
        if (iArr != null) {
            int zzb = zzb(parcel, i);
            parcel.writeIntArray(iArr);
            zzc(parcel, zzb);
        }
    }

    public static void zza(Parcel parcel, int i, String[] strArr) {
        if (strArr != null) {
            int zzb = zzb(parcel, i);
            parcel.writeStringArray(strArr);
            zzc(parcel, zzb);
        }
    }

    public static void zza(Parcel parcel, int i, Parcelable[] parcelableArr, int i2) {
        if (parcelableArr != null) {
            int zzb = zzb(parcel, i);
            parcel.writeInt(parcelableArr.length);
            for (Parcelable parcelable : parcelableArr) {
                if (parcelable == null) {
                    parcel.writeInt(0);
                } else {
                    zza(parcel, parcelable, i2);
                }
            }
            zzc(parcel, zzb);
        }
    }

    public static void zza(Parcel parcel, Parcelable parcelable, int i) {
        int dataPosition = parcel.dataPosition();
        parcel.writeInt(1);
        int dataPosition2 = parcel.dataPosition();
        parcelable.writeToParcel(parcel, i);
        int dataPosition3 = parcel.dataPosition();
        parcel.setDataPosition(dataPosition);
        parcel.writeInt(dataPosition3 - dataPosition2);
        parcel.setDataPosition(dataPosition3);
    }
}
