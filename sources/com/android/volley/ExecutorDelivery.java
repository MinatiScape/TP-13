package com.android.volley;

import android.os.Handler;
import com.android.volley.CacheDispatcher;
import java.util.concurrent.Executor;
/* loaded from: classes.dex */
public final class ExecutorDelivery implements ResponseDelivery {
    public final AnonymousClass1 mResponsePoster;

    /* renamed from: com.android.volley.ExecutorDelivery$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass1 implements Executor {
        public final /* synthetic */ Handler val$handler;

        public AnonymousClass1(Handler handler) {
            this.val$handler = handler;
        }

        @Override // java.util.concurrent.Executor
        public final void execute(Runnable runnable) {
            this.val$handler.post(runnable);
        }
    }

    /* loaded from: classes.dex */
    public static class ResponseDeliveryRunnable implements Runnable {
        public final Request mRequest;
        public final Response mResponse;
        public final Runnable mRunnable;

        @Override // java.lang.Runnable
        public final void run() {
            boolean z;
            synchronized (this.mRequest.mLock) {
            }
            Response response = this.mResponse;
            VolleyError volleyError = response.error;
            if (volleyError == null) {
                z = true;
            } else {
                z = false;
            }
            if (z) {
                this.mRequest.deliverResponse(response.result);
            } else {
                this.mRequest.deliverError(volleyError);
            }
            if (this.mResponse.intermediate) {
                this.mRequest.addMarker("intermediate-response");
            } else {
                this.mRequest.finish("done");
            }
            Runnable runnable = this.mRunnable;
            if (runnable != null) {
                runnable.run();
            }
        }

        public ResponseDeliveryRunnable(Request request, Response response, CacheDispatcher.AnonymousClass1 r3) {
            this.mRequest = request;
            this.mResponse = response;
            this.mRunnable = r3;
        }
    }

    public final void postResponse(Request request, Response response, CacheDispatcher.AnonymousClass1 r5) {
        synchronized (request.mLock) {
            request.mResponseDelivered = true;
        }
        request.addMarker("post-response");
        this.mResponsePoster.execute(new ResponseDeliveryRunnable(request, response, r5));
    }

    public ExecutorDelivery(Handler handler) {
        this.mResponsePoster = new AnonymousClass1(handler);
    }
}
