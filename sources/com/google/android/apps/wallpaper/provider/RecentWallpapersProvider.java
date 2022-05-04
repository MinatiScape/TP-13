package com.google.android.apps.wallpaper.provider;

import android.app.WallpaperManager;
import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.text.TextUtils;
import android.util.Log;
import com.android.systemui.flags.FlagManager;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.android.wallpaper.model.LiveWallpaperInfo;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.module.DefaultWallpaperPersister;
import com.android.wallpaper.module.Injector;
import com.android.wallpaper.module.InjectorProvider;
import com.android.wallpaper.module.UserEventLogger;
import com.android.wallpaper.module.WallpaperPersister;
import com.android.wallpaper.module.WallpaperPreferences;
import com.android.wallpaper.module.WallpapersInjector;
import com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences;
import com.google.android.apps.wallpaper.module.RecentWallpaperEntry;
import com.google.android.apps.wallpaper.module.RecentWallpaperUtils;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.ExecutorService;
import kotlin.collections.CollectionsKt___CollectionsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.StringsKt__StringsKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* loaded from: classes.dex */
public final class RecentWallpapersProvider extends ContentProvider {
    @Override // android.content.ContentProvider
    public int delete(@NotNull Uri uri, @NotNull String selection, @NotNull String[] selectionArgs) {
        Intrinsics.checkNotNullParameter(uri, "uri");
        Intrinsics.checkNotNullParameter(selection, "selection");
        Intrinsics.checkNotNullParameter(selectionArgs, "selectionArgs");
        return 0;
    }

    public final List<RecentWallpaperEntry> getRecentWallpapers() {
        WallpaperPreferences preferences = InjectorProvider.getInjector().getPreferences(getContext());
        Objects.requireNonNull(preferences, "null cannot be cast to non-null type com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences");
        GoogleWallpaperPreferences googleWallpaperPreferences = (GoogleWallpaperPreferences) preferences;
        List<RecentWallpaperEntry> parseRecentWallpapers = RecentWallpaperUtils.parseRecentWallpapers(googleWallpaperPreferences.getRecentWallpapers());
        int size = ((ArrayList) parseRecentWallpapers).size();
        ArrayList arrayList = new ArrayList();
        if (size < 5) {
            arrayList.addAll(RecentWallpaperUtils.parseRecentWallpapers(googleWallpaperPreferences.getDefaultRecentWallpapers()));
            arrayList.removeAll(parseRecentWallpapers);
        }
        arrayList.addAll(parseRecentWallpapers);
        int size2 = arrayList.size() - 5;
        size2 = 0;
        if (size2 < 0) {
        }
        return CollectionsKt___CollectionsKt.reversed(CollectionsKt___CollectionsKt.drop(arrayList, size2));
    }

    @Override // android.content.ContentProvider
    @NotNull
    public String getType(@NotNull Uri uri) {
        Intrinsics.checkNotNullParameter(uri, "uri");
        return "vnd.android.cursor.dir/recent_wallpapers";
    }

    @Override // android.content.ContentProvider
    @Nullable
    public Uri insert(@NotNull Uri uri, @NotNull ContentValues initialValues) {
        Intrinsics.checkNotNullParameter(uri, "uri");
        Intrinsics.checkNotNullParameter(initialValues, "initialValues");
        return null;
    }

    @Override // android.content.ContentProvider
    public boolean onCreate() {
        if (InjectorProvider.getInjector() != null) {
            return true;
        }
        InjectorProvider.sInjector = new WallpapersInjector();
        return true;
    }

    @Override // android.content.ContentProvider
    @Nullable
    public ParcelFileDescriptor openFile(@NotNull Uri uri, @Nullable String str) {
        Intrinsics.checkNotNullParameter(uri, "uri");
        List<String> pathSegments = uri.getPathSegments();
        if (pathSegments.size() < 2 || !Intrinsics.areEqual("thumb", pathSegments.get(0))) {
            throw new FileNotFoundException("Invalid thumb url");
        }
        String wallpaperId = pathSegments.get(1);
        if (!TextUtils.isEmpty(wallpaperId)) {
            Intrinsics.checkNotNullExpressionValue(wallpaperId, "wallpaperId");
            try {
                return ParcelFileDescriptor.open(new File(getContext().getFilesDir(), RecentWallpaperUtils.getWallpaperThumbnailFileName(wallpaperId)), 268435456);
            } catch (Exception e) {
                throw new FileNotFoundException(e.getMessage());
            }
        } else {
            throw new FileNotFoundException("Invalid wallpaper id");
        }
    }

    @Override // android.content.ContentProvider
    @Nullable
    public Cursor query(@NotNull Uri uri, @Nullable String[] strArr, @Nullable String str, @Nullable String[] strArr2, @Nullable String str2) {
        Intrinsics.checkNotNullParameter(uri, "uri");
        if (!Intrinsics.areEqual("/list_recent", uri.getPath())) {
            return null;
        }
        MatrixCursor matrixCursor = new MatrixCursor(new String[]{FlagManager.FIELD_ID, "placeholder_color", "component", "title"});
        for (RecentWallpaperEntry recentWallpaperEntry : getRecentWallpapers()) {
            List<String> list = recentWallpaperEntry.attributions;
            int i = 0;
            MatrixCursor.RowBuilder add = matrixCursor.newRow().add(FlagManager.FIELD_ID, recentWallpaperEntry.id).add("component", recentWallpaperEntry.component).add("title", (list == null || !(list.isEmpty() ^ true)) ? "" : recentWallpaperEntry.attributions.get(0));
            Integer num = recentWallpaperEntry.placeHolderColor;
            if (num != null) {
                i = num.intValue();
            }
            add.add("placeholder_color", Integer.valueOf(i));
        }
        return matrixCursor;
    }

    @Override // android.content.ContentProvider
    public int update(@NotNull Uri uri, @NotNull ContentValues values, @Nullable String str, @Nullable String[] strArr) {
        String str2;
        Object obj;
        Intrinsics.checkNotNullParameter(uri, "uri");
        Intrinsics.checkNotNullParameter(values, "values");
        if (!Intrinsics.areEqual("/set_recent_wallpaper", uri.getPath())) {
            return 0;
        }
        String id = values.getAsString(FlagManager.FIELD_ID);
        Injector injector = InjectorProvider.getInjector();
        WallpaperPreferences preferences = InjectorProvider.getInjector().getPreferences(getContext());
        Objects.requireNonNull(preferences, "null cannot be cast to non-null type com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences");
        GoogleWallpaperPreferences googleWallpaperPreferences = (GoogleWallpaperPreferences) preferences;
        Iterator<T> it = getRecentWallpapers().iterator();
        while (true) {
            str2 = null;
            if (!it.hasNext()) {
                obj = null;
                break;
            }
            obj = it.next();
            if (Intrinsics.areEqual(((RecentWallpaperEntry) obj).id, id)) {
                break;
            }
        }
        RecentWallpaperEntry recentWallpaperEntry = (RecentWallpaperEntry) obj;
        if (recentWallpaperEntry == null) {
            return 0;
        }
        UserEventLogger userEventLogger = injector.getUserEventLogger(getContext());
        WallpaperPersister wallpaperPersister = injector.getWallpaperPersister(getContext());
        String str3 = recentWallpaperEntry.component;
        if (str3 == null) {
            try {
                Context context = getContext();
                Intrinsics.checkNotNullExpressionValue(id, "id");
                DefaultWallpaperPersister defaultWallpaperPersister = (DefaultWallpaperPersister) wallpaperPersister;
                int bitmapToWallpaperManagerCompat = defaultWallpaperPersister.setBitmapToWallpaperManagerCompat(BitmapFactory.decodeStream(context.openFileInput(RecentWallpaperUtils.getWallpaperFullBitmapFileName(id))), false, defaultWallpaperPersister.getDefaultWhichWallpaper());
                List<String> list = recentWallpaperEntry.attributions;
                String str4 = recentWallpaperEntry.actionUrl;
                ExecutorService executorService = WallpaperInfo.sExecutor;
                defaultWallpaperPersister.saveStaticWallpaperMetadata(list, str4, R.string.explore, R.drawable.ic_explore_24px, recentWallpaperEntry.collectionId, bitmapToWallpaperManagerCompat);
                if (!Intrinsics.areEqual(recentWallpaperEntry.collectionId, getContext().getString(R.string.image_wallpaper_collection_id))) {
                    str2 = recentWallpaperEntry.id;
                }
            } catch (FileNotFoundException e) {
                Log.e("RecentWallpapersProvider", "File not found exception setting wallpaper from recent provider", e);
                return 0;
            } catch (Exception e2) {
                Log.e("RecentWallpapersProvider", "Exception setting wallpaper from recent provider", e2);
                return 0;
            }
        } else {
            List split$default = StringsKt__StringsKt.split$default(str3, new String[]{"/"}, false, 0, 6);
            LiveWallpaperInfo fromPackageAndServiceName = LiveWallpaperInfo.fromPackageAndServiceName(getContext(), recentWallpaperEntry.collectionId, recentWallpaperEntry.id, (String) split$default.get(0), (String) split$default.get(1));
            if (fromPackageAndServiceName == null) {
                Log.w("RecentWallpapersProvider", "Couldn't find specified live wallpaper: " + recentWallpaperEntry + ".service");
                return 0;
            }
            WallpaperManager wallpaperManager = WallpaperManager.getInstance(getContext());
            wallpaperManager.setWallpaperComponent(fromPackageAndServiceName.mInfo.getComponent());
            wallpaperManager.setWallpaperOffsetSteps(0.5f, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            if ((((DefaultWallpaperPersister) wallpaperPersister).getDefaultWhichWallpaper() & 2) == 0) {
                wallpaperManager.clear(2);
            }
            str2 = fromPackageAndServiceName.getWallpaperId();
        }
        googleWallpaperPreferences.updateLastWallpaper(recentWallpaperEntry.id);
        userEventLogger.logWallpaperSet(recentWallpaperEntry.collectionId, str2);
        return 1;
    }
}
