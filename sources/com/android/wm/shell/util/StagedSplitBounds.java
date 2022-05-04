package com.android.wm.shell.util;

import android.graphics.Rect;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import java.util.Objects;
/* loaded from: classes.dex */
public class StagedSplitBounds implements Parcelable {
    public static final Parcelable.Creator<StagedSplitBounds> CREATOR = new Parcelable.Creator<StagedSplitBounds>() { // from class: com.android.wm.shell.util.StagedSplitBounds.1
        @Override // android.os.Parcelable.Creator
        public StagedSplitBounds createFromParcel(Parcel parcel) {
            return new StagedSplitBounds(parcel);
        }

        @Override // android.os.Parcelable.Creator
        public StagedSplitBounds[] newArray(int i) {
            return new StagedSplitBounds[i];
        }
    };
    public final boolean appsStackedVertically;
    public final float leftTaskPercent;
    public final Rect leftTopBounds;
    public final int leftTopTaskId;
    public final Rect rightBottomBounds;
    public final int rightBottomTaskId;
    public final float topTaskPercent;
    public final Rect visualDividerBounds;

    public StagedSplitBounds(Parcel parcel) {
        this.leftTopBounds = (Rect) parcel.readTypedObject(Rect.CREATOR);
        this.rightBottomBounds = (Rect) parcel.readTypedObject(Rect.CREATOR);
        this.visualDividerBounds = (Rect) parcel.readTypedObject(Rect.CREATOR);
        this.topTaskPercent = parcel.readFloat();
        this.leftTaskPercent = parcel.readFloat();
        this.appsStackedVertically = parcel.readBoolean();
        this.leftTopTaskId = parcel.readInt();
        this.rightBottomTaskId = parcel.readInt();
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof StagedSplitBounds)) {
            return false;
        }
        StagedSplitBounds stagedSplitBounds = (StagedSplitBounds) obj;
        return Objects.equals(this.leftTopBounds, stagedSplitBounds.leftTopBounds) && Objects.equals(this.rightBottomBounds, stagedSplitBounds.rightBottomBounds) && this.leftTopTaskId == stagedSplitBounds.leftTopTaskId && this.rightBottomTaskId == stagedSplitBounds.rightBottomTaskId;
    }

    public int hashCode() {
        return Objects.hash(this.leftTopBounds, this.rightBottomBounds, Integer.valueOf(this.leftTopTaskId), Integer.valueOf(this.rightBottomTaskId));
    }

    public String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("LeftTop: ");
        m.append(this.leftTopBounds);
        m.append(", taskId: ");
        m.append(this.leftTopTaskId);
        m.append("\nRightBottom: ");
        m.append(this.rightBottomBounds);
        m.append(", taskId: ");
        m.append(this.rightBottomTaskId);
        m.append("\nDivider: ");
        m.append(this.visualDividerBounds);
        m.append("\nAppsVertical? ");
        m.append(this.appsStackedVertically);
        return m.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeTypedObject(this.leftTopBounds, i);
        parcel.writeTypedObject(this.rightBottomBounds, i);
        parcel.writeTypedObject(this.visualDividerBounds, i);
        parcel.writeFloat(this.topTaskPercent);
        parcel.writeFloat(this.leftTaskPercent);
        parcel.writeBoolean(this.appsStackedVertically);
        parcel.writeInt(this.leftTopTaskId);
        parcel.writeInt(this.rightBottomTaskId);
    }
}
