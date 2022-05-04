package androidx.activity.result.contract;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Parcelable;
import androidx.activity.ComponentActivity;
import java.util.Map;
/* loaded from: classes.dex */
public abstract class ActivityResultContract<I, O> {
    public abstract Intent createIntent(@SuppressLint({"UnknownNullness"}) Parcelable parcelable);

    public SynchronousResult getSynchronousResult(ComponentActivity componentActivity, @SuppressLint({"UnknownNullness"}) Parcelable parcelable) {
        return null;
    }

    @SuppressLint({"UnknownNullness"})
    public abstract O parseResult(int i, Intent intent);

    /* loaded from: classes.dex */
    public static final class SynchronousResult<T> {
        @SuppressLint({"UnknownNullness"})
        public final T mValue;

        /* JADX WARN: Multi-variable type inference failed */
        public SynchronousResult(@SuppressLint({"UnknownNullness"}) Map map) {
            this.mValue = map;
        }
    }
}
