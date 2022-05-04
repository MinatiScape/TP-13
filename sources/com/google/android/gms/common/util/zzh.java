package com.google.android.gms.common.util;

import android.app.WallpaperManager;
import android.content.Context;
import android.os.ParcelFileDescriptor;
import android.util.Log;
import androidx.cardview.R$style;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.resource.bytes.BytesResource;
import com.bumptech.glide.load.resource.gif.GifDrawable;
import com.bumptech.glide.load.resource.transcode.ResourceTranscoder;
import com.bumptech.glide.util.ByteBufferUtil;
import com.google.android.material.shape.ShapePath;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.concurrent.atomic.AtomicReference;
/* compiled from: DefaultClock.java */
/* loaded from: classes.dex */
public class zzh implements ResourceTranscoder, Clock {
    public static zzh zza = new zzh();

    public void getEdgePath(float f, float f2, float f3, ShapePath shapePath) {
        shapePath.lineTo(f, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
    }

    public static boolean isHomeStaticWallpaperSet(Context context) {
        boolean z = true;
        ParcelFileDescriptor wallpaperFile = R$style.getInjector().getWallpaperManagerCompat(context).getWallpaperFile(1);
        if (wallpaperFile == null) {
            z = false;
        }
        if (wallpaperFile != null) {
            try {
                wallpaperFile.close();
            } catch (IOException e) {
                Log.e("DefaultWallpaperStatusChecker", "Unable to close system wallpaper ParcelFileDescriptor", e);
            }
        }
        return z;
    }

    public static boolean isLockWallpaperSet(Context context) {
        if (WallpaperManager.getInstance(context).getWallpaperId(2) > 0) {
            return true;
        }
        return false;
    }

    @Override // com.bumptech.glide.load.resource.transcode.ResourceTranscoder
    public Resource transcode(Resource resource, Options options) {
        ByteBufferUtil.SafeArray safeArray;
        byte[] bArr;
        ByteBuffer asReadOnlyBuffer = ((GifDrawable) resource.get()).state.frameLoader.gifDecoder.getData().asReadOnlyBuffer();
        AtomicReference<byte[]> atomicReference = ByteBufferUtil.BUFFER_REF;
        if (asReadOnlyBuffer.isReadOnly() || !asReadOnlyBuffer.hasArray()) {
            safeArray = null;
        } else {
            safeArray = new ByteBufferUtil.SafeArray(asReadOnlyBuffer.array(), asReadOnlyBuffer.arrayOffset(), asReadOnlyBuffer.limit());
        }
        if (safeArray != null && safeArray.offset == 0 && safeArray.limit == safeArray.data.length) {
            bArr = asReadOnlyBuffer.array();
        } else {
            ByteBuffer asReadOnlyBuffer2 = asReadOnlyBuffer.asReadOnlyBuffer();
            byte[] bArr2 = new byte[asReadOnlyBuffer2.limit()];
            asReadOnlyBuffer2.position(0);
            asReadOnlyBuffer2.get(bArr2);
            bArr = bArr2;
        }
        return new BytesResource(bArr);
    }
}
