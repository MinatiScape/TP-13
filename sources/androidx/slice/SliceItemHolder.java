package androidx.slice;

import android.app.PendingIntent;
import android.os.Bundle;
import android.os.Parcelable;
import android.text.Html;
import android.text.Spanned;
import androidx.core.util.Pair;
import androidx.slice.compat.SliceProviderCompat$2;
import androidx.versionedparcelable.VersionedParcelable;
import java.util.ArrayList;
import java.util.Objects;
/* loaded from: classes.dex */
public class SliceItemHolder implements VersionedParcelable {
    public static HolderHandler sHandler;
    public static final Object sSerializeLock = new Object();
    public Bundle mBundle;
    public int mInt;
    public long mLong;
    public Parcelable mParcelable;
    public SliceItemPool mPool;
    public String mStr;
    public VersionedParcelable mVersionedParcelable;

    /* loaded from: classes.dex */
    public interface HolderHandler {
    }

    /* loaded from: classes.dex */
    public static class SliceItemPool {
        public final ArrayList<SliceItemHolder> mCached = new ArrayList<>();
    }

    public SliceItemHolder(SliceItemPool pool) {
        this.mVersionedParcelable = null;
        this.mParcelable = null;
        this.mStr = null;
        this.mInt = 0;
        this.mLong = 0L;
        this.mBundle = null;
        this.mPool = pool;
    }

    public SliceItemHolder(String format, Object mObj, boolean isStream) {
        String str;
        this.mVersionedParcelable = null;
        this.mParcelable = null;
        this.mStr = null;
        this.mInt = 0;
        this.mLong = 0L;
        this.mBundle = null;
        Objects.requireNonNull(format);
        char c = 65535;
        switch (format.hashCode()) {
            case -1422950858:
                if (format.equals("action")) {
                    c = 0;
                    break;
                }
                break;
            case -1377881982:
                if (format.equals("bundle")) {
                    c = 1;
                    break;
                }
                break;
            case 104431:
                if (format.equals("int")) {
                    c = 2;
                    break;
                }
                break;
            case 3327612:
                if (format.equals("long")) {
                    c = 3;
                    break;
                }
                break;
            case 3556653:
                if (format.equals("text")) {
                    c = 4;
                    break;
                }
                break;
            case 100313435:
                if (format.equals("image")) {
                    c = 5;
                    break;
                }
                break;
            case 100358090:
                if (format.equals("input")) {
                    c = 6;
                    break;
                }
                break;
            case 109526418:
                if (format.equals("slice")) {
                    c = 7;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
                Pair pair = (Pair) mObj;
                F f = pair.first;
                if (f instanceof PendingIntent) {
                    this.mParcelable = (Parcelable) f;
                } else if (!isStream) {
                    throw new IllegalArgumentException("Cannot write callback to parcel");
                }
                this.mVersionedParcelable = (VersionedParcelable) pair.second;
                break;
            case 1:
                this.mBundle = (Bundle) mObj;
                break;
            case 2:
                this.mInt = ((Integer) mObj).intValue();
                break;
            case 3:
                this.mLong = ((Long) mObj).longValue();
                break;
            case 4:
                if (mObj instanceof Spanned) {
                    str = Html.toHtml((Spanned) mObj, 0);
                } else {
                    str = (String) mObj;
                }
                this.mStr = str;
                break;
            case 5:
            case 7:
                this.mVersionedParcelable = (VersionedParcelable) mObj;
                break;
            case 6:
                this.mParcelable = (Parcelable) mObj;
                break;
        }
        HolderHandler holderHandler = sHandler;
        if (holderHandler != null) {
            ((SliceProviderCompat$2) holderHandler).handle(this, format);
        }
    }
}
