package com.bumptech.glide.load.data;

import android.content.res.AssetManager;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes.dex */
public final class StreamAssetPathFetcher extends AssetPathFetcher<InputStream> {
    @Override // com.bumptech.glide.load.data.AssetPathFetcher
    public final void close(InputStream inputStream) throws IOException {
        inputStream.close();
    }

    @Override // com.bumptech.glide.load.data.AssetPathFetcher
    public final InputStream loadResource(AssetManager assetManager, String str) throws IOException {
        return assetManager.open(str);
    }

    public StreamAssetPathFetcher(AssetManager assetManager, String str) {
        super(assetManager, str);
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public final Class<InputStream> getDataClass() {
        return InputStream.class;
    }
}
