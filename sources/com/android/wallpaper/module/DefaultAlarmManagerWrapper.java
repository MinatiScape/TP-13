package com.android.wallpaper.module;

import android.app.AlarmManager;
import android.content.Context;
/* loaded from: classes.dex */
public final class DefaultAlarmManagerWrapper {
    public AlarmManager mAlarmManager;

    public DefaultAlarmManagerWrapper(Context context) {
        this.mAlarmManager = (AlarmManager) context.getSystemService("alarm");
    }
}
