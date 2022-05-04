package com.bumptech.glide.load.resource;

import android.annotation.SuppressLint;
import android.graphics.Bitmap;
import android.graphics.ColorSpace;
import android.graphics.ImageDecoder;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import android.util.Size;
import com.bumptech.glide.load.DecodeFormat;
import com.bumptech.glide.load.Option;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.PreferredColorSpace;
import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.resource.bitmap.BitmapImageDecoderResourceDecoder;
import com.bumptech.glide.load.resource.bitmap.BitmapResource;
import com.bumptech.glide.load.resource.bitmap.DownsampleStrategy;
import com.bumptech.glide.load.resource.bitmap.Downsampler;
import com.bumptech.glide.load.resource.bitmap.HardwareConfigState;
import java.io.IOException;
/* loaded from: classes.dex */
public abstract class ImageDecoderResourceDecoder<T> implements ResourceDecoder<ImageDecoder.Source, T> {
    public final HardwareConfigState hardwareConfigState = HardwareConfigState.getInstance();

    public final BitmapResource decode(ImageDecoder.Source source, final int i, final int i2, Options options) throws IOException {
        final DecodeFormat decodeFormat = (DecodeFormat) options.get(Downsampler.DECODE_FORMAT);
        final DownsampleStrategy downsampleStrategy = (DownsampleStrategy) options.get(DownsampleStrategy.OPTION);
        Option<Boolean> option = Downsampler.ALLOW_HARDWARE_CONFIG;
        final boolean z = options.get(option) != null && ((Boolean) options.get(option)).booleanValue();
        final PreferredColorSpace preferredColorSpace = (PreferredColorSpace) options.get(Downsampler.PREFERRED_COLOR_SPACE);
        ImageDecoder.OnHeaderDecodedListener onHeaderDecodedListener = new ImageDecoder.OnHeaderDecodedListener() { // from class: com.bumptech.glide.load.resource.ImageDecoderResourceDecoder.1
            @Override // android.graphics.ImageDecoder.OnHeaderDecodedListener
            @SuppressLint({"Override"})
            public final void onHeaderDecoded(ImageDecoder imageDecoder, ImageDecoder.ImageInfo imageInfo, ImageDecoder.Source source2) {
                ColorSpace.Named named;
                boolean z2 = false;
                if (ImageDecoderResourceDecoder.this.hardwareConfigState.isHardwareConfigAllowed(i, i2, z, false)) {
                    imageDecoder.setAllocator(3);
                } else {
                    imageDecoder.setAllocator(1);
                }
                if (decodeFormat == DecodeFormat.PREFER_RGB_565) {
                    imageDecoder.setMemorySizePolicy(0);
                }
                imageDecoder.setOnPartialImageListener(new ImageDecoder.OnPartialImageListener() { // from class: com.bumptech.glide.load.resource.ImageDecoderResourceDecoder.1.1
                    @Override // android.graphics.ImageDecoder.OnPartialImageListener
                    public final boolean onPartialImage(ImageDecoder.DecodeException decodeException) {
                        return false;
                    }
                });
                Size size = imageInfo.getSize();
                int i3 = i;
                if (i3 == Integer.MIN_VALUE) {
                    i3 = size.getWidth();
                }
                int i4 = i2;
                if (i4 == Integer.MIN_VALUE) {
                    i4 = size.getHeight();
                }
                float scaleFactor = downsampleStrategy.getScaleFactor(size.getWidth(), size.getHeight(), i3, i4);
                int round = Math.round(size.getWidth() * scaleFactor);
                int round2 = Math.round(size.getHeight() * scaleFactor);
                if (Log.isLoggable("ImageDecoder", 2)) {
                    StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Resizing from [");
                    m.append(size.getWidth());
                    m.append("x");
                    m.append(size.getHeight());
                    m.append("] to [");
                    m.append(round);
                    m.append("x");
                    m.append(round2);
                    m.append("] scaleFactor: ");
                    m.append(scaleFactor);
                    Log.v("ImageDecoder", m.toString());
                }
                imageDecoder.setTargetSize(round, round2);
                if (preferredColorSpace == PreferredColorSpace.DISPLAY_P3 && imageInfo.getColorSpace() != null && imageInfo.getColorSpace().isWideGamut()) {
                    z2 = true;
                }
                if (z2) {
                    named = ColorSpace.Named.DISPLAY_P3;
                } else {
                    named = ColorSpace.Named.SRGB;
                }
                imageDecoder.setTargetColorSpace(ColorSpace.get(named));
            }
        };
        BitmapImageDecoderResourceDecoder bitmapImageDecoderResourceDecoder = (BitmapImageDecoderResourceDecoder) this;
        Bitmap decodeBitmap = ImageDecoder.decodeBitmap(source, onHeaderDecodedListener);
        if (Log.isLoggable("BitmapImageDecoder", 2)) {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Decoded [");
            m.append(decodeBitmap.getWidth());
            m.append("x");
            m.append(decodeBitmap.getHeight());
            m.append("] for [");
            m.append(i);
            m.append("x");
            m.append(i2);
            m.append("]");
            Log.v("BitmapImageDecoder", m.toString());
        }
        return new BitmapResource(decodeBitmap, bitmapImageDecoderResourceDecoder.bitmapPool);
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public final /* bridge */ /* synthetic */ boolean handles(ImageDecoder.Source source, Options options) throws IOException {
        return true;
    }
}
