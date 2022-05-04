package androidx.lifecycle;

import java.io.Closeable;
import java.io.IOException;
import java.util.HashMap;
/* loaded from: classes.dex */
public abstract class ViewModel {
    public final HashMap mBagOfTags = new HashMap();
    public volatile boolean mCleared = false;

    public void onCleared() {
    }

    public final void setTagIfAbsent(Object obj) {
        Object obj2;
        synchronized (this.mBagOfTags) {
            obj2 = this.mBagOfTags.get("androidx.lifecycle.savedstate.vm.tag");
            if (obj2 == null) {
                this.mBagOfTags.put("androidx.lifecycle.savedstate.vm.tag", obj);
            }
        }
        if (obj2 != null) {
            obj = obj2;
        }
        if (this.mCleared && (obj instanceof Closeable)) {
            try {
                ((Closeable) obj).close();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
