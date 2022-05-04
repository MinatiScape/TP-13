package androidx.slice.widget;

import android.support.media.ExifInterface$$ExternalSyntheticOutline0;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import androidx.slice.core.SliceAction;
import java.util.Comparator;
/* loaded from: classes.dex */
public class EventInfo {
    public int actionType;
    public int rowIndex;
    public int rowTemplateType;
    public int sliceMode;
    public int actionPosition = -1;
    public int actionIndex = -1;
    public int actionCount = -1;
    public int state = -1;

    public EventInfo(int sliceMode, int actionType, int rowTemplateType, int rowIndex) {
        this.sliceMode = sliceMode;
        this.actionType = actionType;
        this.rowTemplateType = rowTemplateType;
        this.rowIndex = rowIndex;
    }

    public void setPosition(int actionPosition, int actionIndex, int actionCount) {
        this.actionPosition = actionPosition;
        this.actionIndex = actionIndex;
        this.actionCount = actionCount;
    }

    public String toString() {
        String str;
        String str2;
        String str3;
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("mode=");
        int i = this.sliceMode;
        Comparator<SliceAction> comparator = SliceView.SLICE_ACTION_PRIORITY_COMPARATOR;
        if (i == 1) {
            str = "MODE SMALL";
        } else if (i != 2) {
            str = i != 3 ? ExifInterface$$ExternalSyntheticOutline0.m("unknown mode: ", i) : "MODE SHORTCUT";
        } else {
            str = "MODE LARGE";
        }
        m.append(str);
        m.append(", actionType=");
        int i2 = this.actionType;
        String str4 = "TIME_PICK";
        switch (i2) {
            case 0:
                str2 = "TOGGLE";
                break;
            case 1:
                str2 = "BUTTON";
                break;
            case 2:
                str2 = "SLIDER";
                break;
            case 3:
                str2 = "CONTENT";
                break;
            case 4:
                str2 = "SEE MORE";
                break;
            case 5:
                str2 = "SELECTION";
                break;
            case 6:
                str2 = "DATE_PICK";
                break;
            case 7:
                str2 = str4;
                break;
            default:
                str2 = ExifInterface$$ExternalSyntheticOutline0.m("unknown action: ", i2);
                break;
        }
        m.append(str2);
        m.append(", rowTemplateType=");
        int i3 = this.rowTemplateType;
        switch (i3) {
            case -1:
                str4 = "SHORTCUT";
                break;
            case 0:
                str4 = "LIST";
                break;
            case 1:
                str4 = "GRID";
                break;
            case 2:
                str4 = "MESSAGING";
                break;
            case 3:
                str4 = "TOGGLE";
                break;
            case 4:
                str4 = "SLIDER";
                break;
            case 5:
                str4 = "PROGRESS";
                break;
            case 6:
                str4 = "SELECTION";
                break;
            case 7:
                str4 = "DATE_PICK";
                break;
            case 8:
                break;
            default:
                str4 = ExifInterface$$ExternalSyntheticOutline0.m("unknown row type: ", i3);
                break;
        }
        m.append(str4);
        m.append(", rowIndex=");
        m.append(this.rowIndex);
        m.append(", actionPosition=");
        int i4 = this.actionPosition;
        if (i4 == 0) {
            str3 = "START";
        } else if (i4 != 1) {
            str3 = i4 != 2 ? ExifInterface$$ExternalSyntheticOutline0.m("unknown position: ", i4) : "CELL";
        } else {
            str3 = "END";
        }
        m.append(str3);
        m.append(", actionIndex=");
        m.append(this.actionIndex);
        m.append(", actionCount=");
        m.append(this.actionCount);
        m.append(", state=");
        m.append(this.state);
        return m.toString();
    }
}
