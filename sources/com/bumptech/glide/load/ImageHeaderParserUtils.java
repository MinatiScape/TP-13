package com.bumptech.glide.load;

import com.android.systemui.shared.system.QuickStepContract;
import com.bumptech.glide.load.ImageHeaderParser;
import com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool;
import com.bumptech.glide.load.resource.bitmap.RecyclableBufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
/* loaded from: classes.dex */
public final class ImageHeaderParserUtils {
    public static int getOrientation(List<ImageHeaderParser> parsers, InputStream is, ArrayPool byteArrayPool) throws IOException {
        if (is == null) {
            return -1;
        }
        if (!is.markSupported()) {
            is = new RecyclableBufferedInputStream(is, byteArrayPool, QuickStepContract.SYSUI_STATE_ONE_HANDED_ACTIVE);
        }
        is.mark(5242880);
        int size = parsers.size();
        for (int i = 0; i < size; i++) {
            try {
                int orientation = parsers.get(i).getOrientation(is, byteArrayPool);
                if (orientation != -1) {
                    return orientation;
                }
                is.reset();
            } finally {
                is.reset();
            }
        }
        return -1;
    }

    public static ImageHeaderParser.ImageType getType(List<ImageHeaderParser> parsers, InputStream is, ArrayPool byteArrayPool) throws IOException {
        if (is == null) {
            return ImageHeaderParser.ImageType.UNKNOWN;
        }
        if (!is.markSupported()) {
            is = new RecyclableBufferedInputStream(is, byteArrayPool, QuickStepContract.SYSUI_STATE_ONE_HANDED_ACTIVE);
        }
        is.mark(5242880);
        int size = parsers.size();
        for (int i = 0; i < size; i++) {
            try {
                ImageHeaderParser.ImageType type = parsers.get(i).getType(is);
                if (type != ImageHeaderParser.ImageType.UNKNOWN) {
                    return type;
                }
                is.reset();
            } finally {
                is.reset();
            }
        }
        return ImageHeaderParser.ImageType.UNKNOWN;
    }
}
