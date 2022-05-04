package com.bumptech.glide.gifdecoder;

import java.util.ArrayList;
/* loaded from: classes.dex */
public final class GifHeader {
    public int bgColor;
    public int bgIndex;
    public GifFrame currentFrame;
    public boolean gctFlag;
    public int gctSize;
    public int height;
    public int width;
    public int[] gct = null;
    public int status = 0;
    public int frameCount = 0;
    public final ArrayList frames = new ArrayList();
}
