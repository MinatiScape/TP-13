package androidx.core.app;

import android.app.PendingIntent;
import androidx.core.graphics.drawable.IconCompat;
import androidx.versionedparcelable.VersionedParcel;
import java.util.Objects;
/* loaded from: classes.dex */
public class RemoteActionCompatParcelizer {
    public static RemoteActionCompat read(VersionedParcel parcel) {
        RemoteActionCompat remoteActionCompat = new RemoteActionCompat();
        remoteActionCompat.mIcon = (IconCompat) parcel.readVersionedParcelable(remoteActionCompat.mIcon, 1);
        CharSequence charSequence = remoteActionCompat.mTitle;
        if (parcel.readField(2)) {
            charSequence = parcel.readCharSequence();
        }
        remoteActionCompat.mTitle = charSequence;
        CharSequence charSequence2 = remoteActionCompat.mContentDescription;
        if (parcel.readField(3)) {
            charSequence2 = parcel.readCharSequence();
        }
        remoteActionCompat.mContentDescription = charSequence2;
        remoteActionCompat.mActionIntent = (PendingIntent) parcel.readParcelable(remoteActionCompat.mActionIntent, 4);
        boolean z = remoteActionCompat.mEnabled;
        if (parcel.readField(5)) {
            z = parcel.readBoolean();
        }
        remoteActionCompat.mEnabled = z;
        boolean z2 = remoteActionCompat.mShouldShowIcon;
        if (parcel.readField(6)) {
            z2 = parcel.readBoolean();
        }
        remoteActionCompat.mShouldShowIcon = z2;
        return remoteActionCompat;
    }

    public static void write(RemoteActionCompat obj, VersionedParcel parcel) {
        Objects.requireNonNull(parcel);
        IconCompat iconCompat = obj.mIcon;
        parcel.setOutputField(1);
        parcel.writeVersionedParcelable(iconCompat);
        CharSequence charSequence = obj.mTitle;
        parcel.setOutputField(2);
        parcel.writeCharSequence(charSequence);
        CharSequence charSequence2 = obj.mContentDescription;
        parcel.setOutputField(3);
        parcel.writeCharSequence(charSequence2);
        PendingIntent pendingIntent = obj.mActionIntent;
        parcel.setOutputField(4);
        parcel.writeParcelable(pendingIntent);
        boolean z = obj.mEnabled;
        parcel.setOutputField(5);
        parcel.writeBoolean(z);
        boolean z2 = obj.mShouldShowIcon;
        parcel.setOutputField(6);
        parcel.writeBoolean(z2);
    }
}
