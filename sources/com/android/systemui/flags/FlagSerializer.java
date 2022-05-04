package com.android.systemui.flags;

import android.util.Log;
import androidx.core.graphics.drawable.IconCompat;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONException;
import org.json.JSONObject;
/* compiled from: FlagSerializer.kt */
/* loaded from: classes.dex */
public abstract class FlagSerializer<T> {
    @NotNull
    private final Function2<JSONObject, String, T> getter;
    @NotNull
    private final Function3<JSONObject, String, T, Unit> setter;
    @NotNull
    private final String type;

    @Nullable
    public final T fromSettingsData(@Nullable String str) {
        boolean z;
        if (str != null) {
            if (str.length() == 0) {
                z = true;
            } else {
                z = false;
            }
            if (!z) {
                try {
                    JSONObject jSONObject = new JSONObject(str);
                    if (Intrinsics.areEqual(jSONObject.getString(IconCompat.EXTRA_TYPE), this.type)) {
                        return this.getter.invoke(jSONObject, FlagManager.EXTRA_VALUE);
                    }
                    return null;
                } catch (JSONException e) {
                    Log.w("FlagSerializer", "read error", e);
                    throw new InvalidFlagStorageException();
                }
            }
        }
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public FlagSerializer(@NotNull String type, @NotNull Function3<? super JSONObject, ? super String, ? super T, Unit> setter, @NotNull Function2<? super JSONObject, ? super String, ? extends T> getter) {
        Intrinsics.checkNotNullParameter(type, "type");
        Intrinsics.checkNotNullParameter(setter, "setter");
        Intrinsics.checkNotNullParameter(getter, "getter");
        this.type = type;
        this.setter = setter;
        this.getter = getter;
    }

    @Nullable
    public final String toSettingsData(T t) {
        try {
            JSONObject it = new JSONObject().put(IconCompat.EXTRA_TYPE, this.type);
            Function3<JSONObject, String, T, Unit> function3 = this.setter;
            Intrinsics.checkNotNullExpressionValue(it, "it");
            function3.invoke(it, FlagManager.EXTRA_VALUE, t);
            return it.toString();
        } catch (JSONException e) {
            Log.w("FlagSerializer", "write error", e);
            return null;
        }
    }
}
