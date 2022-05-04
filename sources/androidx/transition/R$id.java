package androidx.transition;

import android.os.Build;
import android.util.Log;
import com.bumptech.glide.load.EncodeStrategy;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.ResourceEncoder;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.resource.gif.GifDrawable;
import com.bumptech.glide.util.ByteBufferUtil;
import java.io.File;
import java.io.IOException;
import java.util.Locale;
/* loaded from: classes.dex */
public final class R$id implements ResourceEncoder {
    public static boolean isDateInputKeyboardMissingSeparatorCharacters() {
        String str = Build.MANUFACTURER;
        Locale locale = Locale.ENGLISH;
        if (str.toLowerCase(locale).equals("lge") || str.toLowerCase(locale).equals("samsung")) {
            return true;
        }
        return false;
    }

    @Override // com.bumptech.glide.load.Encoder
    public boolean encode(Object obj, File file, Options options) {
        try {
            ByteBufferUtil.toFile(((GifDrawable) ((Resource) obj).get()).state.frameLoader.gifDecoder.getData().asReadOnlyBuffer(), file);
            return true;
        } catch (IOException e) {
            if (Log.isLoggable("GifEncoder", 5)) {
                Log.w("GifEncoder", "Failed to encode GIF drawable data", e);
            }
            return false;
        }
    }

    @Override // com.bumptech.glide.load.ResourceEncoder
    public EncodeStrategy getEncodeStrategy(Options options) {
        return EncodeStrategy.SOURCE;
    }
}
