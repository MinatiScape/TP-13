package com.android.wallpaper.picker.individual;

import android.app.Activity;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.fragment.app.FragmentActivity;
import androidx.recyclerview.widget.RecyclerView;
import com.android.systemui.shared.R;
import com.android.wallpaper.model.WallpaperInfo;
/* loaded from: classes.dex */
public abstract class IndividualHolder extends RecyclerView.ViewHolder {
    public Activity mActivity;
    public ImageView mThumbnailView;
    public View mTileLayout;
    public TextView mTitleView;
    public WallpaperInfo mWallpaper;

    public IndividualHolder(FragmentActivity fragmentActivity, int i, View view) {
        super(view);
        this.mActivity = fragmentActivity;
        this.mTileLayout = view.findViewById(R.id.tile);
        this.mThumbnailView = (ImageView) view.findViewById(R.id.thumbnail);
        ImageView imageView = (ImageView) view.findViewById(R.id.overlay_icon);
        this.mTitleView = (TextView) view.findViewById(R.id.title);
        view.findViewById(R.id.wallpaper_container).getLayoutParams().height = i;
    }
}
