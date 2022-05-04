package com.android.wallpaper.model;

import android.util.Log;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;
import com.android.wallpaper.module.WallpaperPersister;
/* loaded from: classes.dex */
public class SetWallpaperViewModel extends ViewModel {
    public int mDestination;
    public final MutableLiveData<SetWallpaperStatus> mStatus;

    /* renamed from: com.android.wallpaper.model.SetWallpaperViewModel$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass1 implements WallpaperPersister.SetWallpaperCallback {
        public AnonymousClass1() {
        }

        @Override // com.android.wallpaper.module.WallpaperPersister.SetWallpaperCallback
        public void onError(Throwable th) {
            Log.w("SetWallpaperViewModel", "SetWallpaperCallback error", th);
            SetWallpaperViewModel.this.mStatus.setValue(SetWallpaperStatus.ERROR);
        }

        @Override // com.android.wallpaper.module.WallpaperPersister.SetWallpaperCallback
        public void onSuccess(WallpaperInfo wallpaperInfo) {
            Log.d("SetWallpaperViewModel", "SetWallpaperCallback success");
            SetWallpaperViewModel.this.mStatus.setValue(SetWallpaperStatus.SUCCESS);
        }
    }

    /* loaded from: classes.dex */
    public enum SetWallpaperStatus {
        UNKNOWN,
        /* JADX INFO: Fake field, exist only in values array */
        PENDING,
        SUCCESS,
        ERROR
    }

    public SetWallpaperViewModel() {
        MutableLiveData<SetWallpaperStatus> mutableLiveData = new MutableLiveData<>();
        this.mStatus = mutableLiveData;
        mutableLiveData.setValue(SetWallpaperStatus.UNKNOWN);
    }
}
