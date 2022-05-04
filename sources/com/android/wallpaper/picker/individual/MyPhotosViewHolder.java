package com.android.wallpaper.picker.individual;

import android.app.Activity;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.AsyncTask;
import android.provider.MediaStore;
import android.view.View;
import android.widget.ImageView;
import androidx.appcompat.R$bool;
import androidx.fragment.app.FragmentActivity;
import androidx.recyclerview.widget.RecyclerView;
import com.android.systemui.shared.R;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.asset.ContentUriAsset;
import com.android.wallpaper.picker.MyPhotosStarter;
import com.android.wallpaper.picker.WallpaperPickerDelegate;
/* loaded from: classes.dex */
public final class MyPhotosViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener, MyPhotosStarter.PermissionChangedListener {
    public final Activity mActivity;
    public final MyPhotosStarter mMyPhotosStarter;
    public final ImageView mOverlayIconView;
    public final ImageView mThumbnailView;

    /* renamed from: com.android.wallpaper.picker.individual.MyPhotosViewHolder$2  reason: invalid class name */
    /* loaded from: classes.dex */
    public final class AnonymousClass2 implements AssetListener {
        public AnonymousClass2() {
        }
    }

    /* loaded from: classes.dex */
    public interface AssetListener {
    }

    @Override // com.android.wallpaper.picker.MyPhotosStarter.PermissionChangedListener
    public final void onPermissionsDenied(boolean z) {
    }

    public final void bind$1() {
        boolean z;
        Activity activity = this.mActivity;
        if (activity.getPackageManager().checkPermission("android.permission.READ_EXTERNAL_STORAGE", activity.getPackageName()) == 0) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            this.mOverlayIconView.setVisibility(8);
            final Activity activity2 = this.mActivity;
            final AnonymousClass2 r3 = new AnonymousClass2();
            activity2.getPackageManager().checkPermission("android.permission.READ_EXTERNAL_STORAGE", activity2.getPackageName());
            new AsyncTask<Void, Void, Asset>() { // from class: com.android.wallpaper.picker.individual.MyPhotosViewHolder.1
                @Override // android.os.AsyncTask
                public final Asset doInBackground(Void[] voidArr) {
                    Cursor query = activity2.getContentResolver().query(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, new String[]{"_id", "datetaken"}, null, null, "datetaken DESC LIMIT 1");
                    ContentUriAsset contentUriAsset = null;
                    if (query != null) {
                        if (query.moveToNext()) {
                            Context context = activity2;
                            contentUriAsset = new ContentUriAsset(context, Uri.parse(MediaStore.Images.Media.EXTERNAL_CONTENT_URI + "/" + query.getString(0)), false);
                        }
                        query.close();
                    }
                    return contentUriAsset;
                }

                @Override // android.os.AsyncTask
                public final void onPostExecute(Asset asset) {
                    Asset asset2 = asset;
                    AnonymousClass2 r2 = (AnonymousClass2) r3;
                    if (asset2 == null) {
                        r2.getClass();
                        return;
                    }
                    MyPhotosViewHolder myPhotosViewHolder = MyPhotosViewHolder.this;
                    Activity activity3 = myPhotosViewHolder.mActivity;
                    asset2.loadDrawable(activity3, myPhotosViewHolder.mThumbnailView, R$bool.getColorAttr(activity3, 16844080));
                }
            }.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
            return;
        }
        this.mOverlayIconView.setVisibility(0);
        this.mOverlayIconView.setImageDrawable(this.mActivity.getDrawable(R.drawable.myphotos_empty_tile_illustration));
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        ((WallpaperPickerDelegate) this.mMyPhotosStarter).requestCustomPhotoPicker(this);
    }

    public MyPhotosViewHolder(FragmentActivity fragmentActivity, MyPhotosStarter myPhotosStarter, int i, View view) {
        super(view);
        this.mActivity = fragmentActivity;
        this.mMyPhotosStarter = myPhotosStarter;
        view.getLayoutParams().height = i;
        view.findViewById(R.id.tile).setOnClickListener(this);
        this.mThumbnailView = (ImageView) view.findViewById(R.id.thumbnail);
        this.mOverlayIconView = (ImageView) view.findViewById(R.id.overlay_icon);
    }

    @Override // com.android.wallpaper.picker.MyPhotosStarter.PermissionChangedListener
    public final void onPermissionsGranted() {
        bind$1();
    }
}
