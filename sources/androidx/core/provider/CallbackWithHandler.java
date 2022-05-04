package androidx.core.provider;

import android.graphics.Typeface;
import android.os.Handler;
import androidx.core.content.res.ResourcesCompat;
import androidx.core.graphics.TypefaceCompat;
import androidx.core.provider.FontRequestWorker;
import com.google.android.gms.common.util.zzh;
/* loaded from: classes.dex */
public final class CallbackWithHandler {
    public final zzh mCallback;
    public final Handler mCallbackHandler;

    /* renamed from: androidx.core.provider.CallbackWithHandler$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public final class AnonymousClass1 implements Runnable {
        public final /* synthetic */ zzh val$callback;
        public final /* synthetic */ Typeface val$typeface;

        public AnonymousClass1(zzh zzhVar, Typeface typeface) {
            this.val$callback = zzhVar;
            this.val$typeface = typeface;
        }

        @Override // java.lang.Runnable
        public final void run() {
            zzh zzhVar = this.val$callback;
            Typeface typeface = this.val$typeface;
            ResourcesCompat.FontCallback fontCallback = ((TypefaceCompat.ResourcesCallbackAdapter) zzhVar).mFontCallback;
            if (fontCallback != null) {
                fontCallback.onFontRetrieved(typeface);
            }
        }
    }

    /* renamed from: androidx.core.provider.CallbackWithHandler$2  reason: invalid class name */
    /* loaded from: classes.dex */
    public final class AnonymousClass2 implements Runnable {
        public final /* synthetic */ zzh val$callback;
        public final /* synthetic */ int val$reason;

        public AnonymousClass2(zzh zzhVar, int i) {
            this.val$callback = zzhVar;
            this.val$reason = i;
        }

        @Override // java.lang.Runnable
        public final void run() {
            zzh zzhVar = this.val$callback;
            int i = this.val$reason;
            ResourcesCompat.FontCallback fontCallback = ((TypefaceCompat.ResourcesCallbackAdapter) zzhVar).mFontCallback;
            if (fontCallback != null) {
                fontCallback.onFontRetrievalFailed(i);
            }
        }
    }

    public final void onTypefaceResult(FontRequestWorker.TypefaceResult typefaceResult) {
        boolean z;
        int i = typefaceResult.mResult;
        if (i == 0) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            Typeface typeface = typefaceResult.mTypeface;
            this.mCallbackHandler.post(new AnonymousClass1(this.mCallback, typeface));
            return;
        }
        this.mCallbackHandler.post(new AnonymousClass2(this.mCallback, i));
    }

    public CallbackWithHandler(TypefaceCompat.ResourcesCallbackAdapter resourcesCallbackAdapter, Handler handler) {
        this.mCallback = resourcesCallbackAdapter;
        this.mCallbackHandler = handler;
    }
}
