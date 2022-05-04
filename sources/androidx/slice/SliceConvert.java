package androidx.slice;

import android.app.PendingIntent;
import android.app.RemoteInput;
import android.app.slice.Slice;
import android.app.slice.SliceItem;
import android.app.slice.SliceSpec;
import android.content.Context;
import android.content.res.Resources;
import android.net.Uri;
import android.util.Log;
import androidx.collection.ArraySet;
import androidx.core.graphics.drawable.IconCompat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes.dex */
public final class SliceConvert {
    public static ArraySet unwrap(ArraySet arraySet) {
        SliceSpec sliceSpec;
        ArraySet arraySet2 = new ArraySet(0);
        if (arraySet != null) {
            ArraySet.ElementIterator elementIterator = new ArraySet.ElementIterator();
            while (elementIterator.hasNext()) {
                SliceSpec sliceSpec2 = (SliceSpec) elementIterator.next();
                if (sliceSpec2 == null) {
                    sliceSpec = null;
                } else {
                    sliceSpec = new SliceSpec(sliceSpec2.mType, sliceSpec2.mRevision);
                }
                arraySet2.add(sliceSpec);
            }
        }
        return arraySet2;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public static Slice wrap(Slice slice, Context context) {
        char c;
        SliceSpec sliceSpec = null;
        if (slice == null || slice.getUri() == null) {
            return null;
        }
        Uri uri = slice.getUri();
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        List<String> hints = slice.getHints();
        arrayList2.addAll(Arrays.asList((String[]) hints.toArray(new String[hints.size()])));
        SliceSpec spec = slice.getSpec();
        if (spec != null) {
            sliceSpec = new SliceSpec(spec.getType(), spec.getRevision());
        }
        SliceSpec sliceSpec2 = sliceSpec;
        Iterator<SliceItem> it = slice.getItems().iterator();
        while (it.hasNext()) {
            SliceItem next = it.next();
            String format = next.getFormat();
            format.getClass();
            Iterator<SliceItem> it2 = it;
            switch (format.hashCode()) {
                case -1422950858:
                    if (format.equals("action")) {
                        c = 0;
                        break;
                    }
                    c = 65535;
                    break;
                case -1377881982:
                    if (format.equals("bundle")) {
                        c = 1;
                        break;
                    }
                    c = 65535;
                    break;
                case 104431:
                    if (format.equals("int")) {
                        c = 2;
                        break;
                    }
                    c = 65535;
                    break;
                case 3327612:
                    if (format.equals("long")) {
                        c = 3;
                        break;
                    }
                    c = 65535;
                    break;
                case 3556653:
                    if (format.equals("text")) {
                        c = 4;
                        break;
                    }
                    c = 65535;
                    break;
                case 100313435:
                    if (format.equals("image")) {
                        c = 5;
                        break;
                    }
                    c = 65535;
                    break;
                case 100358090:
                    if (format.equals("input")) {
                        c = 6;
                        break;
                    }
                    c = 65535;
                    break;
                case 109526418:
                    if (format.equals("slice")) {
                        c = 7;
                        break;
                    }
                    c = 65535;
                    break;
                default:
                    c = 65535;
                    break;
            }
            switch (c) {
                case 0:
                    PendingIntent action = next.getAction();
                    Slice wrap = wrap(next.getSlice(), context);
                    String subType = next.getSubType();
                    action.getClass();
                    wrap.getClass();
                    arrayList.add(new SliceItem(action, wrap, subType, wrap.mHints));
                    break;
                case 1:
                    arrayList.add(new SliceItem(next.getBundle(), next.getFormat(), next.getSubType(), next.getHints()));
                    break;
                case 2:
                    int i = next.getInt();
                    String subType2 = next.getSubType();
                    List<String> hints2 = next.getHints();
                    arrayList.add(new SliceItem(Integer.valueOf(i), "int", subType2, (String[]) hints2.toArray(new String[hints2.size()])));
                    break;
                case 3:
                    long j = next.getLong();
                    String subType3 = next.getSubType();
                    List<String> hints3 = next.getHints();
                    arrayList.add(new SliceItem(Long.valueOf(j), "long", subType3, (String[]) hints3.toArray(new String[hints3.size()])));
                    break;
                case 4:
                    CharSequence text = next.getText();
                    String subType4 = next.getSubType();
                    List<String> hints4 = next.getHints();
                    arrayList.add(new SliceItem(text, "text", subType4, (String[]) hints4.toArray(new String[hints4.size()])));
                    break;
                case 5:
                    try {
                        IconCompat createFromIcon = IconCompat.createFromIcon(context, next.getIcon());
                        String subType5 = next.getSubType();
                        List<String> hints5 = next.getHints();
                        Slice.isValidIcon(createFromIcon);
                        Slice.isValidIcon(createFromIcon);
                        arrayList.add(new SliceItem(createFromIcon, "image", subType5, (String[]) hints5.toArray(new String[hints5.size()])));
                        break;
                    } catch (Resources.NotFoundException e) {
                        Log.w("SliceConvert", "The icon resource isn't available.", e);
                        break;
                    } catch (IllegalArgumentException e2) {
                        Log.w("SliceConvert", "The icon resource isn't available.", e2);
                        break;
                    }
                case 6:
                    RemoteInput remoteInput = next.getRemoteInput();
                    String subType6 = next.getSubType();
                    List<String> hints6 = next.getHints();
                    remoteInput.getClass();
                    arrayList.add(new SliceItem(remoteInput, "input", subType6, (String[]) hints6.toArray(new String[hints6.size()])));
                    break;
                case 7:
                    Slice wrap2 = wrap(next.getSlice(), context);
                    String subType7 = next.getSubType();
                    wrap2.getClass();
                    arrayList.add(new SliceItem(wrap2, "slice", subType7, wrap2.mHints));
                    break;
            }
            it = it2;
        }
        return new Slice(arrayList, (String[]) arrayList2.toArray(new String[arrayList2.size()]), uri, sliceSpec2);
    }
}
