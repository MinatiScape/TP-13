package com.android.wallpaper.model;

import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.provider.MediaStore;
import androidx.fragment.app.FragmentActivity;
import com.android.systemui.shared.R;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.asset.ContentUriAsset;
/* loaded from: classes.dex */
public final class ImageCategory extends Category {
    public ImageCategory(String str, String str2) {
        super(str, str2, 1);
    }

    @Override // com.android.wallpaper.model.Category
    public final int getOverlayIconSizeDp() {
        return 128;
    }

    @Override // com.android.wallpaper.model.Category
    public final void show(FragmentActivity fragmentActivity) {
        Intent intent = new Intent("android.intent.action.GET_CONTENT");
        intent.setType("image/*");
        fragmentActivity.startActivityForResult(intent, 0);
    }

    @Override // com.android.wallpaper.model.Category
    public final Drawable getOverlayIcon(Context context) {
        if (getThumbnail(context) == null) {
            return context.getResources().getDrawable(R.drawable.myphotos_empty_tile_illustration);
        }
        return null;
    }

    @Override // com.android.wallpaper.model.Category
    public final Asset getThumbnail(Context context) {
        boolean z;
        if (context.getPackageManager().checkPermission("android.permission.READ_EXTERNAL_STORAGE", context.getPackageName()) == 0) {
            z = true;
        } else {
            z = false;
        }
        ContentUriAsset contentUriAsset = null;
        if (!z) {
            return null;
        }
        Cursor query = context.getContentResolver().query(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, new String[]{"_id", "datetaken"}, null, null, "datetaken DESC");
        if (query != null) {
            if (query.moveToNext()) {
                contentUriAsset = new ContentUriAsset(context, Uri.parse(MediaStore.Images.Media.EXTERNAL_CONTENT_URI + "/" + query.getString(0)), false);
            }
            query.close();
        }
        return contentUriAsset;
    }
}
