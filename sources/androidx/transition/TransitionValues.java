package androidx.transition;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.view.View;
import androidx.appcompat.view.SupportMenuInflater$$ExternalSyntheticOutline0;
import java.util.ArrayList;
import java.util.HashMap;
/* loaded from: classes.dex */
public final class TransitionValues {
    public final ArrayList<Transition> mTargetedTransitions;
    public final HashMap values;
    public View view;

    @Deprecated
    public TransitionValues() {
        throw null;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof TransitionValues)) {
            return false;
        }
        TransitionValues transitionValues = (TransitionValues) obj;
        if (this.view != transitionValues.view || !this.values.equals(transitionValues.values)) {
            return false;
        }
        return true;
    }

    public final int hashCode() {
        return this.values.hashCode() + (this.view.hashCode() * 31);
    }

    public final String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("TransitionValues@");
        m.append(Integer.toHexString(hashCode()));
        m.append(":\n");
        String m2 = SupportMenuInflater$$ExternalSyntheticOutline0.m(m.toString() + "    view = " + this.view + "\n", "    values:");
        for (String str : this.values.keySet()) {
            m2 = m2 + "    " + str + ": " + this.values.get(str) + "\n";
        }
        return m2;
    }

    public TransitionValues(View view) {
        this.values = new HashMap();
        this.mTargetedTransitions = new ArrayList<>();
        this.view = view;
    }
}
