package com.android.customization.model;

import android.util.Log;
import com.android.customization.model.CustomizationOption;
import java.util.List;
/* loaded from: classes.dex */
public interface CustomizationManager<T extends CustomizationOption> {

    /* loaded from: classes.dex */
    public interface Callback {
        void onError();

        void onSuccess();
    }

    /* loaded from: classes.dex */
    public interface OptionsFetchedListener<T extends CustomizationOption> {
        void onOptionsLoaded(List<T> list);

        default void onError(Throwable th) {
            if (th != null) {
                Log.e("OptionsFecthedListener", "Error loading options", th);
            }
        }
    }
}
