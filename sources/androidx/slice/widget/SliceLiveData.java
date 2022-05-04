package androidx.slice.widget;

import android.content.Context;
import android.net.Uri;
import android.os.AsyncTask;
import android.util.Log;
import android.util.Pair;
import androidx.collection.ArraySet;
import androidx.lifecycle.LiveData;
import androidx.slice.Slice;
import androidx.slice.SliceSpec;
import androidx.slice.SliceSpecs;
import androidx.slice.SliceViewManagerBase;
import androidx.slice.SliceViewManagerWrapper;
import java.util.Arrays;
import java.util.List;
/* loaded from: classes.dex */
public final class SliceLiveData {
    public static final ArraySet SUPPORTED_SPECS;

    /* loaded from: classes.dex */
    public interface OnErrorListener {
        void onSliceError();
    }

    /* loaded from: classes.dex */
    public static class SliceLiveDataImpl extends LiveData<Slice> {
        public final SliceViewManagerWrapper mSliceViewManager;
        public Uri mUri;
        public final AnonymousClass1 mUpdateSlice = new Runnable() { // from class: androidx.slice.widget.SliceLiveData.SliceLiveDataImpl.1
            @Override // java.lang.Runnable
            public final void run() {
                try {
                    SliceLiveDataImpl sliceLiveDataImpl = SliceLiveDataImpl.this;
                    Uri uri = sliceLiveDataImpl.mUri;
                    if (uri != null) {
                        Slice bindSlice = sliceLiveDataImpl.mSliceViewManager.bindSlice(uri);
                        SliceLiveDataImpl sliceLiveDataImpl2 = SliceLiveDataImpl.this;
                        if (sliceLiveDataImpl2.mUri == null && bindSlice != null) {
                            sliceLiveDataImpl2.mUri = bindSlice.getUri();
                            SliceLiveDataImpl sliceLiveDataImpl3 = SliceLiveDataImpl.this;
                            sliceLiveDataImpl3.mSliceViewManager.registerSliceCallback(sliceLiveDataImpl3.mUri, sliceLiveDataImpl3.mSliceCallback);
                        }
                        SliceLiveDataImpl.this.postValue(bindSlice);
                        return;
                    }
                    sliceLiveDataImpl.mSliceViewManager.getClass();
                    throw null;
                } catch (IllegalArgumentException e) {
                    OnErrorListener onErrorListener = SliceLiveDataImpl.this.mListener;
                    if (onErrorListener != null) {
                        onErrorListener.onSliceError();
                    } else {
                        Log.e("SliceLiveData", "Error binding slice", e);
                    }
                    SliceLiveDataImpl.this.postValue(null);
                } catch (Exception e2) {
                    OnErrorListener onErrorListener2 = SliceLiveDataImpl.this.mListener;
                    if (onErrorListener2 != null) {
                        onErrorListener2.onSliceError();
                    } else {
                        Log.e("SliceLiveData", "Error binding slice", e2);
                    }
                    SliceLiveDataImpl.this.postValue(null);
                }
            }
        };
        public final SliceLiveData$SliceLiveDataImpl$$ExternalSyntheticLambda0 mSliceCallback = new SliceLiveData$SliceLiveDataImpl$$ExternalSyntheticLambda0(this);
        public final OnErrorListener mListener = null;

        @Override // androidx.lifecycle.LiveData
        public final void onActive() {
            AsyncTask.execute(this.mUpdateSlice);
            Uri uri = this.mUri;
            if (uri != null) {
                this.mSliceViewManager.registerSliceCallback(uri, this.mSliceCallback);
            }
        }

        @Override // androidx.lifecycle.LiveData
        public final void onInactive() {
            Uri uri = this.mUri;
            if (uri != null) {
                SliceViewManagerWrapper sliceViewManagerWrapper = this.mSliceViewManager;
                SliceLiveData$SliceLiveDataImpl$$ExternalSyntheticLambda0 sliceLiveData$SliceLiveDataImpl$$ExternalSyntheticLambda0 = this.mSliceCallback;
                synchronized (sliceViewManagerWrapper.mListenerLookup) {
                    SliceViewManagerBase.SliceListenerImpl remove = sliceViewManagerWrapper.mListenerLookup.remove(new Pair(uri, sliceLiveData$SliceLiveDataImpl$$ExternalSyntheticLambda0));
                    if (remove != null) {
                        SliceViewManagerBase.this.mContext.getContentResolver().unregisterContentObserver(remove.mObserver);
                        if (remove.mPinned) {
                            SliceViewManagerBase.this.unpinSlice(remove.mUri);
                            remove.mPinned = false;
                        }
                    }
                }
            }
        }

        /* JADX WARN: Type inference failed for: r0v0, types: [androidx.slice.widget.SliceLiveData$SliceLiveDataImpl$1] */
        public SliceLiveDataImpl(Context context, Uri uri) {
            this.mSliceViewManager = new SliceViewManagerWrapper(context);
            this.mUri = uri;
        }
    }

    static {
        List asList = Arrays.asList(SliceSpecs.BASIC, SliceSpecs.LIST, SliceSpecs.LIST_V2, new SliceSpec("androidx.app.slice.BASIC", 1), new SliceSpec("androidx.app.slice.LIST", 1));
        ArraySet arraySet = new ArraySet(0);
        if (asList != null) {
            arraySet.addAll(asList);
        }
        SUPPORTED_SPECS = arraySet;
    }
}
