package androidx.slice;

import android.net.Uri;
/* loaded from: classes.dex */
public class SliceStructure {
    public final String mStructure;
    public final Uri mUri;

    public SliceStructure(Slice s) {
        StringBuilder sb = new StringBuilder();
        getStructure(s, sb);
        this.mStructure = sb.toString();
        this.mUri = s.getUri();
    }

    public static void getStructure(Slice s, StringBuilder str) {
        str.append("s{");
        for (SliceItem sliceItem : s.getItems()) {
            getStructure(sliceItem, str);
        }
        str.append("}");
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof SliceStructure)) {
            return false;
        }
        return this.mStructure.equals(((SliceStructure) obj).mStructure);
    }

    public int hashCode() {
        return this.mStructure.hashCode();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public static void getStructure(SliceItem item, StringBuilder str) {
        char c;
        String str2 = item.mFormat;
        switch (str2.hashCode()) {
            case -1422950858:
                if (str2.equals("action")) {
                    c = 1;
                    break;
                }
                c = 65535;
                break;
            case -1377881982:
                if (str2.equals("bundle")) {
                    c = 7;
                    break;
                }
                c = 65535;
                break;
            case 104431:
                if (str2.equals("int")) {
                    c = 4;
                    break;
                }
                c = 65535;
                break;
            case 3327612:
                if (str2.equals("long")) {
                    c = 5;
                    break;
                }
                c = 65535;
                break;
            case 3556653:
                if (str2.equals("text")) {
                    c = 2;
                    break;
                }
                c = 65535;
                break;
            case 100313435:
                if (str2.equals("image")) {
                    c = 3;
                    break;
                }
                c = 65535;
                break;
            case 100358090:
                if (str2.equals("input")) {
                    c = 6;
                    break;
                }
                c = 65535;
                break;
            case 109526418:
                if (str2.equals("slice")) {
                    c = 0;
                    break;
                }
                c = 65535;
                break;
            default:
                c = 65535;
                break;
        }
        if (c == 0) {
            getStructure(item.getSlice(), str);
        } else if (c == 1) {
            str.append('a');
            if ("range".equals(item.mSubType)) {
                str.append('r');
            }
            getStructure(item.getSlice(), str);
        } else if (c == 2) {
            str.append('t');
        } else if (c == 3) {
            str.append('i');
        }
    }

    public SliceStructure(SliceItem s) {
        StringBuilder sb = new StringBuilder();
        getStructure(s, sb);
        this.mStructure = sb.toString();
        if ("action".equals(s.mFormat) || "slice".equals(s.mFormat)) {
            this.mUri = s.getSlice().getUri();
        } else {
            this.mUri = null;
        }
    }
}
