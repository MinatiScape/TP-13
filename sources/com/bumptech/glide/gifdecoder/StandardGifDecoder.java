package com.bumptech.glide.gifdecoder;

import android.graphics.Bitmap;
import android.util.Log;
import com.bumptech.glide.gifdecoder.GifDecoder;
import com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool;
import com.bumptech.glide.load.resource.gif.GifBitmapProvider;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Iterator;
/* loaded from: classes.dex */
public final class StandardGifDecoder implements GifDecoder {
    public int[] act;
    public final GifDecoder.BitmapProvider bitmapProvider;
    public byte[] block;
    public int downsampledHeight;
    public int downsampledWidth;
    public int framePointer;
    public GifHeader header;
    public Boolean isFirstFrameTransparent;
    public byte[] mainPixels;
    public int[] mainScratch;
    public byte[] pixelStack;
    public short[] prefix;
    public Bitmap previousImage;
    public ByteBuffer rawData;
    public int sampleSize;
    public boolean savePrevious;
    public int status;
    public byte[] suffix;
    public final int[] pct = new int[256];
    public Bitmap.Config bitmapConfig = Bitmap.Config.ARGB_8888;

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public final void clear() {
        ArrayPool arrayPool;
        ArrayPool arrayPool2;
        ArrayPool arrayPool3;
        this.header = null;
        byte[] bArr = this.mainPixels;
        if (!(bArr == null || (arrayPool3 = ((GifBitmapProvider) this.bitmapProvider).arrayPool) == null)) {
            arrayPool3.put(bArr);
        }
        int[] iArr = this.mainScratch;
        if (!(iArr == null || (arrayPool2 = ((GifBitmapProvider) this.bitmapProvider).arrayPool) == null)) {
            arrayPool2.put(iArr);
        }
        Bitmap bitmap = this.previousImage;
        if (bitmap != null) {
            ((GifBitmapProvider) this.bitmapProvider).bitmapPool.put(bitmap);
        }
        this.previousImage = null;
        this.rawData = null;
        this.isFirstFrameTransparent = null;
        byte[] bArr2 = this.block;
        if (bArr2 != null && (arrayPool = ((GifBitmapProvider) this.bitmapProvider).arrayPool) != null) {
            arrayPool.put(bArr2);
        }
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public final synchronized Bitmap getNextFrame() {
        GifFrame gifFrame;
        byte[] bArr;
        if (this.header.frameCount <= 0 || this.framePointer < 0) {
            if (Log.isLoggable("StandardGifDecoder", 3)) {
                Log.d("StandardGifDecoder", "Unable to decode frame, frameCount=" + this.header.frameCount + ", framePointer=" + this.framePointer);
            }
            this.status = 1;
        }
        int i = this.status;
        if (!(i == 1 || i == 2)) {
            this.status = 0;
            if (this.block == null) {
                ArrayPool arrayPool = ((GifBitmapProvider) this.bitmapProvider).arrayPool;
                if (arrayPool == null) {
                    bArr = new byte[255];
                } else {
                    bArr = (byte[]) arrayPool.get(255, byte[].class);
                }
                this.block = bArr;
            }
            GifFrame gifFrame2 = (GifFrame) this.header.frames.get(this.framePointer);
            int i2 = this.framePointer - 1;
            if (i2 >= 0) {
                gifFrame = (GifFrame) this.header.frames.get(i2);
            } else {
                gifFrame = null;
            }
            int[] iArr = gifFrame2.lct;
            if (iArr == null) {
                iArr = this.header.gct;
            }
            this.act = iArr;
            if (iArr == null) {
                if (Log.isLoggable("StandardGifDecoder", 3)) {
                    Log.d("StandardGifDecoder", "No valid color table found for frame #" + this.framePointer);
                }
                this.status = 1;
                return null;
            }
            if (gifFrame2.transparency) {
                System.arraycopy(iArr, 0, this.pct, 0, iArr.length);
                int[] iArr2 = this.pct;
                this.act = iArr2;
                iArr2[gifFrame2.transIndex] = 0;
                if (gifFrame2.dispose == 2 && this.framePointer == 0) {
                    this.isFirstFrameTransparent = Boolean.TRUE;
                }
            }
            return setPixels(gifFrame2, gifFrame);
        }
        if (Log.isLoggable("StandardGifDecoder", 3)) {
            Log.d("StandardGifDecoder", "Unable to decode frame, status=" + this.status);
        }
        return null;
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public final void advance() {
        this.framePointer = (this.framePointer + 1) % this.header.frameCount;
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public final int getByteSize() {
        return (this.mainScratch.length * 4) + this.rawData.limit() + this.mainPixels.length;
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public final int getFrameCount() {
        return this.header.frameCount;
    }

    public final Bitmap getNextBitmap() {
        Bitmap.Config config;
        Boolean bool = this.isFirstFrameTransparent;
        if (bool == null || bool.booleanValue()) {
            config = Bitmap.Config.ARGB_8888;
        } else {
            config = this.bitmapConfig;
        }
        GifDecoder.BitmapProvider bitmapProvider = this.bitmapProvider;
        Bitmap dirty = ((GifBitmapProvider) bitmapProvider).bitmapPool.getDirty(this.downsampledWidth, this.downsampledHeight, config);
        dirty.setHasAlpha(true);
        return dirty;
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public final int getNextDelay() {
        int i;
        GifHeader gifHeader = this.header;
        int i2 = gifHeader.frameCount;
        if (i2 <= 0 || (i = this.framePointer) < 0) {
            return 0;
        }
        if (i < 0 || i >= i2) {
            return -1;
        }
        return ((GifFrame) gifHeader.frames.get(i)).delay;
    }

    public final void setDefaultBitmapConfig(Bitmap.Config config) {
        if (config == Bitmap.Config.ARGB_8888 || config == Bitmap.Config.RGB_565) {
            this.bitmapConfig = config;
            return;
        }
        throw new IllegalArgumentException("Unsupported format: " + config + ", must be one of " + Bitmap.Config.ARGB_8888 + " or " + Bitmap.Config.RGB_565);
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x0045, code lost:
        if (r3.bgIndex == r36.transIndex) goto L26;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:29:0x005e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final android.graphics.Bitmap setPixels(com.bumptech.glide.gifdecoder.GifFrame r36, com.bumptech.glide.gifdecoder.GifFrame r37) {
        /*
            Method dump skipped, instructions count: 1090
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.gifdecoder.StandardGifDecoder.setPixels(com.bumptech.glide.gifdecoder.GifFrame, com.bumptech.glide.gifdecoder.GifFrame):android.graphics.Bitmap");
    }

    public StandardGifDecoder(GifBitmapProvider gifBitmapProvider, GifHeader gifHeader, ByteBuffer byteBuffer, int i) {
        byte[] bArr;
        int[] iArr;
        this.bitmapProvider = gifBitmapProvider;
        this.header = new GifHeader();
        synchronized (this) {
            if (i > 0) {
                int highestOneBit = Integer.highestOneBit(i);
                this.status = 0;
                this.header = gifHeader;
                this.framePointer = -1;
                ByteBuffer asReadOnlyBuffer = byteBuffer.asReadOnlyBuffer();
                this.rawData = asReadOnlyBuffer;
                asReadOnlyBuffer.position(0);
                this.rawData.order(ByteOrder.LITTLE_ENDIAN);
                this.savePrevious = false;
                Iterator it = gifHeader.frames.iterator();
                while (true) {
                    if (it.hasNext()) {
                        if (((GifFrame) it.next()).dispose == 3) {
                            this.savePrevious = true;
                            break;
                        }
                    } else {
                        break;
                    }
                }
                this.sampleSize = highestOneBit;
                int i2 = gifHeader.width;
                this.downsampledWidth = i2 / highestOneBit;
                int i3 = gifHeader.height;
                this.downsampledHeight = i3 / highestOneBit;
                int i4 = i2 * i3;
                ArrayPool arrayPool = ((GifBitmapProvider) this.bitmapProvider).arrayPool;
                if (arrayPool == null) {
                    bArr = new byte[i4];
                } else {
                    bArr = (byte[]) arrayPool.get(i4, byte[].class);
                }
                this.mainPixels = bArr;
                GifDecoder.BitmapProvider bitmapProvider = this.bitmapProvider;
                int i5 = this.downsampledWidth * this.downsampledHeight;
                ArrayPool arrayPool2 = ((GifBitmapProvider) bitmapProvider).arrayPool;
                if (arrayPool2 == null) {
                    iArr = new int[i5];
                } else {
                    iArr = (int[]) arrayPool2.get(i5, int[].class);
                }
                this.mainScratch = iArr;
            } else {
                throw new IllegalArgumentException("Sample size must be >=0, not: " + i);
            }
        }
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public final int getCurrentFrameIndex() {
        return this.framePointer;
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public final ByteBuffer getData() {
        return this.rawData;
    }
}
