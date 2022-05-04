package com.bumptech.glide.load.data;

import android.os.ParcelFileDescriptor;
import android.system.ErrnoException;
import android.system.Os;
import android.system.OsConstants;
import com.bumptech.glide.load.data.DataRewinder;
import java.io.IOException;
/* loaded from: classes.dex */
public final class ParcelFileDescriptorRewinder implements DataRewinder<ParcelFileDescriptor> {
    public final InternalRewinder rewinder;

    /* loaded from: classes.dex */
    public static final class Factory implements DataRewinder.Factory<ParcelFileDescriptor> {
        @Override // com.bumptech.glide.load.data.DataRewinder.Factory
        public final DataRewinder<ParcelFileDescriptor> build(ParcelFileDescriptor parcelFileDescriptor) {
            return new ParcelFileDescriptorRewinder(parcelFileDescriptor);
        }

        @Override // com.bumptech.glide.load.data.DataRewinder.Factory
        public final Class<ParcelFileDescriptor> getDataClass() {
            return ParcelFileDescriptor.class;
        }
    }

    /* loaded from: classes.dex */
    public static final class InternalRewinder {
        public final ParcelFileDescriptor parcelFileDescriptor;

        public ParcelFileDescriptor rewind() throws IOException {
            try {
                Os.lseek(this.parcelFileDescriptor.getFileDescriptor(), 0L, OsConstants.SEEK_SET);
                return this.parcelFileDescriptor;
            } catch (ErrnoException e) {
                throw new IOException(e);
            }
        }

        public InternalRewinder(ParcelFileDescriptor parcelFileDescriptor) {
            this.parcelFileDescriptor = parcelFileDescriptor;
        }
    }

    @Override // com.bumptech.glide.load.data.DataRewinder
    public final void cleanup() {
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.bumptech.glide.load.data.DataRewinder
    public final ParcelFileDescriptor rewindAndGet() throws IOException {
        return this.rewinder.rewind();
    }

    public ParcelFileDescriptorRewinder(ParcelFileDescriptor parcelFileDescriptor) {
        this.rewinder = new InternalRewinder(parcelFileDescriptor);
    }
}
