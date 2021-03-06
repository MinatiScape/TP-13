package com.android.systemui.shared.system;

import android.graphics.Rect;
import com.android.systemui.shared.recents.model.ThumbnailData;
import java.util.HashMap;
/* loaded from: classes.dex */
public interface RecentsAnimationListener {
    void onAnimationCanceled(HashMap<Integer, ThumbnailData> hashMap);

    void onAnimationStart(RecentsAnimationControllerCompat recentsAnimationControllerCompat, RemoteAnimationTargetCompat[] remoteAnimationTargetCompatArr, RemoteAnimationTargetCompat[] remoteAnimationTargetCompatArr2, Rect rect, Rect rect2);

    void onTasksAppeared(RemoteAnimationTargetCompat[] remoteAnimationTargetCompatArr);
}
