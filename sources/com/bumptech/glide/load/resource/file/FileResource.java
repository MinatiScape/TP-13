package com.bumptech.glide.load.resource.file;

import androidx.collection.ContainerHelpers;
import com.bumptech.glide.load.engine.Resource;
import java.io.File;
/* loaded from: classes.dex */
public final class FileResource implements Resource<File> {
    public final File data;

    @Override // com.bumptech.glide.load.engine.Resource
    public final /* bridge */ /* synthetic */ int getSize() {
        return 1;
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public final /* bridge */ /* synthetic */ void recycle() {
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public final Class<File> getResourceClass() {
        return this.data.getClass();
    }

    public FileResource(File file) {
        ContainerHelpers.checkNotNull(file);
        this.data = file;
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public final File get() {
        return this.data;
    }
}
