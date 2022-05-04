package com.google.android.apps.wallpaper.backdrop;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import android.widget.Toast;
import androidx.appcompat.R$layout;
import androidx.cardview.R$style;
import androidx.fragment.app.FragmentActivity;
import androidx.transition.PathMotion;
import com.android.systemui.shared.R;
import com.android.volley.VolleyError;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.model.WallpaperRotationInitializer;
import com.android.wallpaper.module.DefaultWallpaperPersister;
import com.android.wallpaper.module.GoogleWallpapersInjector;
import com.android.wallpaper.module.Injector;
import com.android.wallpaper.module.WallpaperChangedNotifier;
import com.android.wallpaper.network.ServerFetcher$NextImageInCollectionCallback;
import com.android.wallpaper.picker.individual.IndividualPickerFragment;
import com.android.wallpaper.util.DiskBasedLogger;
import com.android.wallpaper.util.LaunchUtils;
import com.bumptech.glide.request.target.SimpleTarget;
import com.bumptech.glide.request.transition.Transition;
import com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences;
import com.google.android.gms.common.util.zzh;
import com.google.chrome.dongle.imax.wallpaper2.protos.ImaxWallpaperProto$Image;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ExecutorService;
/* loaded from: classes.dex */
public class BackdropWallpaperRotationInitializer implements WallpaperRotationInitializer {
    public static final Parcelable.Creator<BackdropWallpaperRotationInitializer> CREATOR = new Parcelable.Creator<BackdropWallpaperRotationInitializer>() { // from class: com.google.android.apps.wallpaper.backdrop.BackdropWallpaperRotationInitializer.1
        @Override // android.os.Parcelable.Creator
        public final BackdropWallpaperRotationInitializer createFromParcel(Parcel parcel) {
            return new BackdropWallpaperRotationInitializer(parcel);
        }

        @Override // android.os.Parcelable.Creator
        public final BackdropWallpaperRotationInitializer[] newArray(int i) {
            return new BackdropWallpaperRotationInitializer[i];
        }
    };
    public String mCollectionId;
    public String mCollectionName;
    public int mStagedActionIconRes;
    public int mStagedActionLabelRes;
    public String mStagedActionUrl;
    public List<String> mStagedAttributions;
    public int mStagedRequiredNetworkState;
    public String mStagedResumeToken;
    public int mStagedWallpaperId;

    /* loaded from: classes.dex */
    public static class Factory extends WallpaperRotationInitializerFactory {
    }

    /* loaded from: classes.dex */
    public class NextImageCallback implements ServerFetcher$NextImageInCollectionCallback {
        public final Context mAppContext;
        public final WallpaperRotationInitializer.Listener mListener;
        public final int mNetworkPreference;

        public NextImageCallback(Context context, int i, IndividualPickerFragment.AnonymousClass3 r4) {
            this.mAppContext = context;
            this.mListener = r4;
            this.mNetworkPreference = i;
        }

        @Override // com.android.wallpaper.network.ServerFetcher$NextImageInCollectionCallback
        public final void onError(VolleyError volleyError) {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Unable to get first wallpaper in rotation for wallpaper from collection  with ID ");
            m.append(BackdropWallpaperRotationInitializer.this.mCollectionId);
            m.append(".");
            DiskBasedLogger.e("BackdropWPRotationInit", m.toString(), this.mAppContext);
            ((IndividualPickerFragment.AnonymousClass3) this.mListener).onError();
        }

        @Override // com.android.wallpaper.network.ServerFetcher$NextImageInCollectionCallback
        public final void onSuccess(final ImaxWallpaperProto$Image imaxWallpaperProto$Image, final String str) {
            if (FifeImageUrlFactory.sInstance == null) {
                FifeImageUrlFactory.sInstance = new FifeImageUrlFactory();
            }
            FifeImageUrlFactory fifeImageUrlFactory = FifeImageUrlFactory.sInstance;
            Context context = this.mAppContext;
            String imageUrl = imaxWallpaperProto$Image.getImageUrl();
            fifeImageUrlFactory.getClass();
            final Uri createRotatingWallpaperUri = FifeImageUrlFactory.createRotatingWallpaperUri(context, imageUrl);
            R$style.getInjector().getRequester(this.mAppContext).loadImageBitmap(createRotatingWallpaperUri, new SimpleTarget<Bitmap>() { // from class: com.google.android.apps.wallpaper.backdrop.BackdropWallpaperRotationInitializer.NextImageCallback.1
                @Override // com.bumptech.glide.request.target.Target
                public final void onLoadFailed(Drawable drawable) {
                    StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Wallpaper bitmap load failed for FIFE URL: ");
                    m.append(createRotatingWallpaperUri);
                    m.append(" from  collection with collectionId: ");
                    m.append(BackdropWallpaperRotationInitializer.this.mCollectionId);
                    m.append(" with new resumeToken: ");
                    m.append(str);
                    m.append(".");
                    DiskBasedLogger.e("BackdropWPRotationInit", m.toString(), NextImageCallback.this.mAppContext);
                    ((IndividualPickerFragment.AnonymousClass3) NextImageCallback.this.mListener).onError();
                }

                @Override // com.bumptech.glide.request.target.Target
                public final void onResourceReady(Object obj, Transition transition) {
                    int i;
                    int i2;
                    ArrayList parseAttributions = R$layout.parseAttributions(imaxWallpaperProto$Image.getAttributionList(), BackdropWallpaperRotationInitializer.this.mCollectionName);
                    int cropAndSetWallpaperBitmapInRotationStatic = ((DefaultWallpaperPersister) R$style.getInjector().getWallpaperPersister(NextImageCallback.this.mAppContext)).cropAndSetWallpaperBitmapInRotationStatic((Bitmap) obj, parseAttributions, imaxWallpaperProto$Image.getActionUrl(), BackdropWallpaperRotationInitializer.this.mCollectionId);
                    if (cropAndSetWallpaperBitmapInRotationStatic == 0) {
                        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Unable to set rotating wallpaper bitmap for wallpaper from FIFE URL: ");
                        m.append(createRotatingWallpaperUri);
                        m.append(" from collection with collectionId: ");
                        m.append(BackdropWallpaperRotationInitializer.this.mCollectionId);
                        m.append(" with new resumeToken: ");
                        m.append(str);
                        m.append(".");
                        DiskBasedLogger.e("BackdropWPRotationInit", m.toString(), NextImageCallback.this.mAppContext);
                        ((IndividualPickerFragment.AnonymousClass3) NextImageCallback.this.mListener).onError();
                        return;
                    }
                    BackdropWallpaperRotationInitializer backdropWallpaperRotationInitializer = BackdropWallpaperRotationInitializer.this;
                    backdropWallpaperRotationInitializer.mStagedAttributions = parseAttributions;
                    backdropWallpaperRotationInitializer.mStagedActionUrl = imaxWallpaperProto$Image.getActionUrl();
                    BackdropWallpaperRotationInitializer backdropWallpaperRotationInitializer2 = BackdropWallpaperRotationInitializer.this;
                    int i3 = 2;
                    if (imaxWallpaperProto$Image.getType().getNumber() == 2) {
                        i = R.string.build_case;
                    } else {
                        ExecutorService executorService = WallpaperInfo.sExecutor;
                        i = R.string.explore;
                    }
                    backdropWallpaperRotationInitializer2.mStagedActionLabelRes = i;
                    BackdropWallpaperRotationInitializer backdropWallpaperRotationInitializer3 = BackdropWallpaperRotationInitializer.this;
                    if (imaxWallpaperProto$Image.getType().getNumber() == 2) {
                        i2 = R.drawable.ic_case_24px;
                    } else {
                        ExecutorService executorService2 = WallpaperInfo.sExecutor;
                        i2 = R.drawable.ic_explore_24px;
                    }
                    backdropWallpaperRotationInitializer3.mStagedActionIconRes = i2;
                    NextImageCallback nextImageCallback = NextImageCallback.this;
                    BackdropWallpaperRotationInitializer backdropWallpaperRotationInitializer4 = BackdropWallpaperRotationInitializer.this;
                    backdropWallpaperRotationInitializer4.mStagedWallpaperId = cropAndSetWallpaperBitmapInRotationStatic;
                    backdropWallpaperRotationInitializer4.mStagedRequiredNetworkState = nextImageCallback.mNetworkPreference;
                    backdropWallpaperRotationInitializer4.mStagedResumeToken = str;
                    IndividualPickerFragment.AnonymousClass3 r6 = (IndividualPickerFragment.AnonymousClass3) nextImageCallback.mListener;
                    ProgressDialog progressDialog = IndividualPickerFragment.this.mProgressDialog;
                    if (progressDialog != null) {
                        progressDialog.dismiss();
                    }
                    FragmentActivity activity = IndividualPickerFragment.this.getActivity();
                    IndividualPickerFragment.this.mWallpaperRotationInitializer.startRotation(r6.val$appContext);
                    if (activity != null) {
                        try {
                            Toast.makeText(activity, (int) R.string.wallpaper_set_successfully_message, 0).show();
                        } catch (Resources.NotFoundException e) {
                            Log.e("IndividualPickerFrgmnt", "Could not show toast " + e);
                        }
                        activity.setResult(-1);
                        activity.finish();
                        LaunchUtils.launchHome(r6.val$appContext);
                    }
                    GoogleWallpaperPreferences preferences = R$style.getInjector().getPreferences(NextImageCallback.this.mAppContext);
                    zzh wallpaperStatusChecker = R$style.getInjector().getWallpaperStatusChecker();
                    Context context2 = NextImageCallback.this.mAppContext;
                    wallpaperStatusChecker.getClass();
                    if (zzh.isLockWallpaperSet(context2)) {
                        i3 = 0;
                    }
                    preferences.updateDailyWallpaperSet(i3, BackdropWallpaperRotationInitializer.this.mCollectionId, String.valueOf(imaxWallpaperProto$Image.getAssetId()));
                }
            });
        }
    }

    public BackdropWallpaperRotationInitializer(String str, String str2) {
        this.mCollectionId = str;
        this.mCollectionName = str2;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.mCollectionId);
        parcel.writeString(this.mCollectionName);
        parcel.writeStringList(this.mStagedAttributions);
        parcel.writeString(this.mStagedActionUrl);
        parcel.writeInt(this.mStagedWallpaperId);
        parcel.writeInt(this.mStagedRequiredNetworkState);
        parcel.writeString(this.mStagedResumeToken);
        parcel.writeInt(this.mStagedActionLabelRes);
        parcel.writeInt(this.mStagedActionIconRes);
    }

    @Override // com.android.wallpaper.model.WallpaperRotationInitializer
    public final void setFirstWallpaperInRotation(Context context, int i, IndividualPickerFragment.AnonymousClass3 r6) {
        ((GoogleWallpapersInjector) R$style.getInjector()).getServerFetcher(context).fetchNextImageInCollection(context, this.mCollectionId, null, new NextImageCallback(context, i, r6));
    }

    @Override // com.android.wallpaper.model.WallpaperRotationInitializer
    public final void startRotation(Context context) {
        WallpaperChangedNotifier wallpaperChangedNotifier;
        Injector injector = R$style.getInjector();
        GoogleWallpaperPreferences preferences = injector.getPreferences(context);
        ((DefaultWallpaperPersister) injector.getWallpaperPersister(context)).saveStaticWallpaperMetadata(this.mStagedAttributions, this.mStagedActionUrl, this.mStagedActionLabelRes, this.mStagedActionIconRes, this.mCollectionId, this.mStagedWallpaperId);
        BackdropPreferences backdropPreferences = BackdropPreferences.getInstance(context);
        backdropPreferences.mSharedPrefs.edit().remove("collection_id").remove("collection_name").remove("required_network_state").remove("resume_token").apply();
        backdropPreferences.mSharedPrefs.edit().putString("collection_id", this.mCollectionId).apply();
        backdropPreferences.mSharedPrefs.edit().putString("collection_name", this.mCollectionName).apply();
        backdropPreferences.mSharedPrefs.edit().putInt("required_network_state", this.mStagedRequiredNetworkState).apply();
        backdropPreferences.mSharedPrefs.edit().putString("resume_token", this.mStagedResumeToken).apply();
        if (PathMotion.sInstance == null) {
            PathMotion.sInstance = new JobSchedulerBackdropTaskScheduler(context);
        }
        JobSchedulerBackdropTaskScheduler jobSchedulerBackdropTaskScheduler = PathMotion.sInstance;
        jobSchedulerBackdropTaskScheduler.mJobScheduler.cancel(0);
        jobSchedulerBackdropTaskScheduler.mJobScheduler.cancel(1);
        BackdropAlarmScheduler.snoozeAlarm(context);
        preferences.setWallpaperPresentationMode(2);
        preferences.setDailyWallpaperEnabledTimestamp(new Date().getTime());
        synchronized (WallpaperChangedNotifier.sInstanceLock) {
            if (WallpaperChangedNotifier.sInstance == null) {
                WallpaperChangedNotifier.sInstance = new WallpaperChangedNotifier();
            }
            wallpaperChangedNotifier = WallpaperChangedNotifier.sInstance;
        }
        for (int i = 0; i < wallpaperChangedNotifier.mListeners.size(); i++) {
            ((WallpaperChangedNotifier.Listener) wallpaperChangedNotifier.mListeners.get(i)).onWallpaperChanged();
        }
        injector.getUserEventLogger(context).logDailyRefreshTurnedOn();
    }

    public BackdropWallpaperRotationInitializer(Parcel parcel) {
        this.mCollectionId = parcel.readString();
        this.mCollectionName = parcel.readString();
        ArrayList arrayList = new ArrayList();
        this.mStagedAttributions = arrayList;
        parcel.readStringList(arrayList);
        this.mStagedActionUrl = parcel.readString();
        this.mStagedWallpaperId = parcel.readInt();
        this.mStagedRequiredNetworkState = parcel.readInt();
        this.mStagedResumeToken = parcel.readString();
        this.mStagedActionLabelRes = parcel.readInt();
        this.mStagedActionIconRes = parcel.readInt();
    }
}
