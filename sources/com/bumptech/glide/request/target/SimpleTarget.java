package com.bumptech.glide.request.target;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import androidx.recyclerview.widget.RecyclerView;
import com.bumptech.glide.util.Util;
@Deprecated
/* loaded from: classes.dex */
public abstract class SimpleTarget<Z> extends BaseTarget<Z> {
    public final int width = RecyclerView.UNDEFINED_DURATION;
    public final int height = RecyclerView.UNDEFINED_DURATION;

    @Override // com.bumptech.glide.request.target.Target
    public final void removeCallback(SizeReadyCallback sizeReadyCallback) {
    }

    @Override // com.bumptech.glide.request.target.Target
    public final void getSize(SizeReadyCallback sizeReadyCallback) {
        if (Util.isValidDimensions(this.width, this.height)) {
            sizeReadyCallback.onSizeReady(this.width, this.height);
            return;
        }
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Width and height must both be > 0 or Target#SIZE_ORIGINAL, but given width: ");
        m.append(this.width);
        m.append(" and height: ");
        m.append(this.height);
        m.append(", either provide dimensions in the constructor or call override()");
        throw new IllegalArgumentException(m.toString());
    }
}
