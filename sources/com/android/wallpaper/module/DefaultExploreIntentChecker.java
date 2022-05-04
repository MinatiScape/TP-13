package com.android.wallpaper.module;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
import com.android.wallpaper.module.ExploreIntentChecker;
import com.android.wallpaper.picker.PreviewFragment;
import com.android.wallpaper.picker.PreviewFragment$WallpaperInfoContent$$ExternalSyntheticLambda0;
import com.android.wallpaper.picker.WallpaperInfoHelper$$ExternalSyntheticLambda0;
import com.android.wallpaper.picker.WallpaperInfoHelper$ExploreIntentReceiver;
import java.util.HashMap;
/* loaded from: classes.dex */
public final class DefaultExploreIntentChecker implements ExploreIntentChecker {
    public Context mAppContext;
    public HashMap mUriToActionViewIntentMap = new HashMap();

    /* loaded from: classes.dex */
    public class FetchActionViewIntentTask extends AsyncTask<Void, Void, Intent> {
        public Context mAppContext;
        public ExploreIntentChecker.IntentReceiver mReceiver;
        public Uri mUri;

        public FetchActionViewIntentTask(Context context, Uri uri, WallpaperInfoHelper$$ExternalSyntheticLambda0 wallpaperInfoHelper$$ExternalSyntheticLambda0) {
            this.mAppContext = context;
            this.mUri = uri;
            this.mReceiver = wallpaperInfoHelper$$ExternalSyntheticLambda0;
        }

        @Override // android.os.AsyncTask
        public final Intent doInBackground(Void[] voidArr) {
            Intent intent = new Intent("android.intent.action.VIEW", this.mUri);
            if (this.mAppContext.getPackageManager().queryIntentActivities(intent, 0).isEmpty()) {
                intent = null;
            }
            DefaultExploreIntentChecker.this.mUriToActionViewIntentMap.put(this.mUri, intent);
            return intent;
        }

        @Override // android.os.AsyncTask
        public final void onPostExecute(Intent intent) {
            WallpaperInfoHelper$$ExternalSyntheticLambda0 wallpaperInfoHelper$$ExternalSyntheticLambda0 = (WallpaperInfoHelper$$ExternalSyntheticLambda0) this.mReceiver;
            PreviewFragment$WallpaperInfoContent$$ExternalSyntheticLambda0 previewFragment$WallpaperInfoContent$$ExternalSyntheticLambda0 = (PreviewFragment$WallpaperInfoContent$$ExternalSyntheticLambda0) ((WallpaperInfoHelper$ExploreIntentReceiver) wallpaperInfoHelper$$ExternalSyntheticLambda0.f$0);
            PreviewFragment.WallpaperInfoContent wallpaperInfoContent = previewFragment$WallpaperInfoContent$$ExternalSyntheticLambda0.f$0;
            Runnable runnable = previewFragment$WallpaperInfoContent$$ExternalSyntheticLambda0.f$1;
            wallpaperInfoContent.mActionLabel = (CharSequence) wallpaperInfoHelper$$ExternalSyntheticLambda0.f$1;
            wallpaperInfoContent.mExploreIntent = intent;
            if (runnable != null) {
                runnable.run();
            }
        }
    }

    public DefaultExploreIntentChecker(Context context) {
        this.mAppContext = context;
    }
}
