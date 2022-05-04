package androidx.slice;

import androidx.versionedparcelable.VersionedParcelable;
/* loaded from: classes.dex */
public final class SliceSpec implements VersionedParcelable {
    public int mRevision;
    public String mType;

    public SliceSpec() {
        this.mRevision = 1;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof SliceSpec)) {
            return false;
        }
        SliceSpec sliceSpec = (SliceSpec) obj;
        return this.mType.equals(sliceSpec.mType) && this.mRevision == sliceSpec.mRevision;
    }

    public int hashCode() {
        return this.mType.hashCode() + this.mRevision;
    }

    public String toString() {
        return String.format("SliceSpec{%s,%d}", this.mType, Integer.valueOf(this.mRevision));
    }

    public SliceSpec(String type, int revision) {
        this.mRevision = 1;
        this.mType = type;
        this.mRevision = revision;
    }
}
