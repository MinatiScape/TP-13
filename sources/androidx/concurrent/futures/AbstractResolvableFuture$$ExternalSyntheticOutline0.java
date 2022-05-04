package androidx.concurrent.futures;

import androidx.activity.result.ActivityResult;
import androidx.activity.result.ActivityResultCallback;
import com.android.wallpaper.picker.IpcDownloadablePreviewFragment;
import java.util.Arrays;
import java.util.Iterator;
import java.util.ServiceConfigurationError;
import kotlinx.coroutines.android.AndroidExceptionPreHandler;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class AbstractResolvableFuture$$ExternalSyntheticOutline0 implements ActivityResultCallback {
    public static final /* synthetic */ AbstractResolvableFuture$$ExternalSyntheticOutline0 INSTANCE = new AbstractResolvableFuture$$ExternalSyntheticOutline0();

    public static String m(String str, String str2, String str3) {
        return str + str2 + str3;
    }

    public static /* synthetic */ Iterator m() {
        try {
            return Arrays.asList(new AndroidExceptionPreHandler()).iterator();
        } catch (Throwable th) {
            throw new ServiceConfigurationError(th.getMessage(), th);
        }
    }

    @Override // androidx.activity.result.ActivityResultCallback
    public void onActivityResult(Object obj) {
        ActivityResult activityResult = (ActivityResult) obj;
        int i = IpcDownloadablePreviewFragment.$r8$clinit;
    }
}
