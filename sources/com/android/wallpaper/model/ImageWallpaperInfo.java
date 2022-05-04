package com.android.wallpaper.model;

import android.app.Activity;
import android.content.Context;
import android.media.ExifInterface;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.Log;
import com.android.systemui.shared.R;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.asset.ContentUriAsset;
import com.android.wallpaper.asset.ExifInterfaceCompat;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
/* loaded from: classes.dex */
public class ImageWallpaperInfo extends WallpaperInfo {
    public static final Parcelable.Creator<ImageWallpaperInfo> CREATOR = new Parcelable.Creator<ImageWallpaperInfo>() { // from class: com.android.wallpaper.model.ImageWallpaperInfo.1
        @Override // android.os.Parcelable.Creator
        public final ImageWallpaperInfo createFromParcel(Parcel parcel) {
            return new ImageWallpaperInfo(parcel);
        }

        @Override // android.os.Parcelable.Creator
        public final ImageWallpaperInfo[] newArray(int i) {
            return new ImageWallpaperInfo[i];
        }
    };
    public static final String[] EXIF_TAGS = {"ImageDescription", "Artist", "DateTimeOriginal", "Model"};
    public ContentUriAsset mAsset;
    public boolean mIsAssetUncached;
    public Uri mUri;

    public ImageWallpaperInfo(Uri uri) {
        this.mUri = uri;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final String getTitle(Activity activity) {
        return null;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final Asset getAsset(Context context) {
        if (this.mIsAssetUncached) {
            this.mAsset = new ContentUriAsset(context, this.mUri, true);
        } else if (this.mAsset == null) {
            this.mAsset = new ContentUriAsset(context, this.mUri, false);
        }
        return this.mAsset;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo, android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.mPlaceholderColor);
        parcel.writeString(this.mUri.toString());
    }

    public ImageWallpaperInfo(Uri uri, int i) {
        this.mUri = uri;
        this.mIsAssetUncached = true;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public List<String> getAttributions(Context context) {
        boolean z;
        ContentUriAsset contentUriAsset = (ContentUriAsset) getAsset(context);
        String type = contentUriAsset.mContext.getContentResolver().getType(contentUriAsset.mUri);
        if (type == null || !type.equals("image/jpeg")) {
            z = false;
        } else {
            z = true;
        }
        if (!z) {
            return Arrays.asList(context.getResources().getString(R.string.my_photos_generic_wallpaper_title));
        }
        ArrayList arrayList = new ArrayList();
        String[] strArr = EXIF_TAGS;
        for (int i = 0; i < 4; i++) {
            String str = strArr[i];
            contentUriAsset.ensureExifInterface();
            ExifInterfaceCompat exifInterfaceCompat = contentUriAsset.mExifCompat;
            String str2 = null;
            if (exifInterfaceCompat == null) {
                Log.w("ContentUriAsset", "Unable to read EXIF tags for content URI asset");
            } else {
                ExifInterface exifInterface = exifInterfaceCompat.mFrameworkExifInterface;
                exifInterface.getClass();
                String attribute = exifInterface.getAttribute(str);
                if (attribute != null && !attribute.trim().isEmpty()) {
                    str2 = attribute.trim();
                }
            }
            if (str2 != null) {
                if (str == "DateTimeOriginal") {
                    try {
                        str2 = DateFormat.getDateInstance().format(new SimpleDateFormat("yyyy:MM:dd HH:mm:ss").parse(str2));
                    } catch (ParseException e) {
                        Log.w("ImageWallpaperInfo", "Unable to parse image datetime", e);
                    }
                }
                arrayList.add(str2);
            }
        }
        if (!arrayList.isEmpty()) {
            return arrayList;
        }
        return Arrays.asList(context.getResources().getString(R.string.my_photos_generic_wallpaper_title));
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final String getCollectionId(Context context) {
        return context.getString(R.string.image_wallpaper_collection_id);
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final Asset getThumbAsset(Context context) {
        return getAsset(context);
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final void showPreview(Activity activity, InlinePreviewIntentFactory inlinePreviewIntentFactory, int i) {
        activity.startActivityForResult(inlinePreviewIntentFactory.newIntent(activity, this), i);
    }

    public ImageWallpaperInfo(Parcel parcel) {
        super(parcel);
        this.mUri = Uri.parse(parcel.readString());
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final Uri getUri() {
        return this.mUri;
    }
}
