package androidx.slice.widget;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.ProviderInfo;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import androidx.core.graphics.drawable.IconCompat;
import androidx.slice.Slice;
import androidx.slice.SliceItem;
import androidx.slice.core.SliceAction;
import androidx.slice.core.SliceActionImpl;
import androidx.slice.core.SliceQuery;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
/* loaded from: classes.dex */
public class ListContent extends SliceContent {
    public RowContent mHeaderContent;
    public SliceAction mPrimaryAction;
    public ArrayList<SliceContent> mRowItems = new ArrayList<>();
    public RowContent mSeeMoreContent;
    public List<SliceAction> mSliceActions;

    /* JADX WARN: Code restructure failed: missing block: B:27:0x0091, code lost:
        if (("slice".equals(r5.mFormat) && !r5.hasAnyHints("actions", "keywords", "see_more") && androidx.slice.core.SliceQuery.find(r5, "text", (java.lang.String) null, (java.lang.String) null) != null) != false) goto L29;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public ListContent(androidx.slice.Slice r18) {
        /*
            Method dump skipped, instructions count: 445
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.slice.widget.ListContent.<init>(androidx.slice.Slice):void");
    }

    public static int getRowType(SliceContent content, boolean isHeader, List<SliceAction> actions) {
        if (content == null) {
            return 0;
        }
        if (content instanceof GridContent) {
            return 1;
        }
        RowContent rowContent = (RowContent) content;
        SliceItem sliceItem = rowContent.mPrimaryAction;
        SliceActionImpl sliceActionImpl = null;
        if (sliceItem != null) {
            sliceActionImpl = new SliceActionImpl(sliceItem);
        }
        SliceItem sliceItem2 = rowContent.mRange;
        if (sliceItem2 != null) {
            return "action".equals(sliceItem2.mFormat) ? 4 : 5;
        }
        if (rowContent.mSelection != null) {
            return 6;
        }
        if (sliceActionImpl != null && sliceActionImpl.isToggle()) {
            return 3;
        }
        if (!isHeader || actions == null) {
            return rowContent.mToggleItems.size() > 0 ? 3 : 0;
        }
        for (int i = 0; i < actions.size(); i++) {
            if (actions.get(i).isToggle()) {
                return 3;
            }
        }
        return 0;
    }

    @Override // androidx.slice.widget.SliceContent
    public int getHeight(SliceStyle style, SliceViewPolicy policy) {
        Objects.requireNonNull(style);
        boolean z = true;
        if (policy.mMode == 1) {
            return this.mHeaderContent.getHeight(style, policy);
        }
        int i = policy.mMaxHeight;
        boolean z2 = policy.mScrollable;
        int listItemsHeight = style.getListItemsHeight(this.mRowItems, policy);
        if (i > 0) {
            i = Math.max(this.mHeaderContent.getHeight(style, policy), i);
        }
        int i2 = i > 0 ? i : style.mListLargeHeight;
        if (listItemsHeight - i2 < style.mListMinScrollHeight) {
            z = false;
        }
        if (z && !style.mExpandToAvailableHeight) {
            listItemsHeight = i2;
        } else if (i > 0) {
            listItemsHeight = Math.min(i2, listItemsHeight);
        }
        return !z2 ? style.getListItemsHeight(style.getListItemsForNonScrollingList(this, listItemsHeight, policy).mDisplayedItems, policy) : listItemsHeight;
    }

    public SliceAction getShortcut(Context context) {
        SliceItem sliceItem;
        SliceItem sliceItem2;
        Intent launchIntentForPackage;
        SliceAction sliceAction = this.mPrimaryAction;
        if (sliceAction != null) {
            return sliceAction;
        }
        SliceItem sliceItem3 = this.mSliceItem;
        SliceActionImpl sliceActionImpl = null;
        if (sliceItem3 != null) {
            int i = 5;
            SliceItem find = SliceQuery.find(sliceItem3, "action", new String[]{"title", "shortcut"}, (String[]) null);
            if (find != null) {
                sliceItem2 = SliceQuery.find(find, "image", "title", (String) null);
                sliceItem = SliceQuery.find(find, "text", (String) null, (String) null);
            } else {
                sliceItem2 = null;
                sliceItem = null;
            }
            if (find == null) {
                find = SliceQuery.find(this.mSliceItem, "action", (String) null, (String) null);
            }
            if (sliceItem2 == null) {
                sliceItem2 = SliceQuery.find(this.mSliceItem, "image", "title", (String) null);
            }
            if (sliceItem == null) {
                sliceItem = SliceQuery.find(this.mSliceItem, "text", "title", (String) null);
            }
            if (sliceItem2 == null) {
                sliceItem2 = SliceQuery.find(this.mSliceItem, "image", (String) null, (String) null);
            }
            if (sliceItem == null) {
                sliceItem = SliceQuery.find(this.mSliceItem, "text", (String) null, (String) null);
            }
            if (sliceItem2 != null) {
                i = SliceActionImpl.parseImageMode(sliceItem2);
            }
            if (context != null) {
                SliceItem find2 = SliceQuery.find(this.mSliceItem, "slice", (String) null, (String) null);
                if (find2 != null) {
                    Uri uri = find2.getSlice().getUri();
                    IconCompat iconCompat = sliceItem2 != null ? (IconCompat) sliceItem2.mObj : null;
                    CharSequence charSequence = sliceItem != null ? (CharSequence) sliceItem.mObj : null;
                    PackageManager packageManager = context.getPackageManager();
                    ProviderInfo resolveContentProvider = packageManager.resolveContentProvider(uri.getAuthority(), 0);
                    ApplicationInfo applicationInfo = resolveContentProvider != null ? resolveContentProvider.applicationInfo : null;
                    if (applicationInfo != null) {
                        if (iconCompat == null) {
                            Drawable applicationIcon = packageManager.getApplicationIcon(applicationInfo);
                            if (applicationIcon instanceof BitmapDrawable) {
                                Bitmap bitmap = ((BitmapDrawable) applicationIcon).getBitmap();
                                String str = IconCompat.EXTRA_TYPE;
                                if (bitmap != null) {
                                    iconCompat = new IconCompat(1);
                                    iconCompat.mObj1 = bitmap;
                                } else {
                                    throw new IllegalArgumentException("Bitmap must not be null.");
                                }
                            } else {
                                Bitmap createBitmap = Bitmap.createBitmap(applicationIcon.getIntrinsicWidth(), applicationIcon.getIntrinsicHeight(), Bitmap.Config.ARGB_8888);
                                Canvas canvas = new Canvas(createBitmap);
                                applicationIcon.setBounds(0, 0, canvas.getWidth(), canvas.getHeight());
                                applicationIcon.draw(canvas);
                                String str2 = IconCompat.EXTRA_TYPE;
                                if (createBitmap != null) {
                                    IconCompat iconCompat2 = new IconCompat(1);
                                    iconCompat2.mObj1 = createBitmap;
                                    iconCompat = iconCompat2;
                                } else {
                                    throw new IllegalArgumentException("Bitmap must not be null.");
                                }
                            }
                            i = 2;
                        }
                        if (charSequence == null) {
                            charSequence = packageManager.getApplicationLabel(applicationInfo);
                        }
                        if (find == null && (launchIntentForPackage = packageManager.getLaunchIntentForPackage(applicationInfo.packageName)) != null) {
                            PendingIntent activity = PendingIntent.getActivity(context, 0, launchIntentForPackage, 67108864);
                            ArrayList arrayList = new ArrayList();
                            ArrayList arrayList2 = new ArrayList();
                            find = new SliceItem(activity, new Slice(arrayList, (String[]) arrayList2.toArray(new String[arrayList2.size()]), uri, null), "action", null, new String[0]);
                        }
                    }
                    if (find == null) {
                        find = new SliceItem(PendingIntent.getActivity(context, 0, new Intent(), 67108864), null, "action", null, null);
                    }
                    if (!(charSequence == null || iconCompat == null)) {
                        sliceActionImpl = new SliceActionImpl(find.getAction(), iconCompat, i, charSequence);
                    }
                }
            } else if (!(sliceItem2 == null || find == null || sliceItem == null)) {
                return new SliceActionImpl(find.getAction(), (IconCompat) sliceItem2.mObj, i, (CharSequence) sliceItem.mObj);
            }
        }
        return sliceActionImpl;
    }

    @Override // androidx.slice.widget.SliceContent
    public boolean isValid() {
        return super.isValid() && this.mRowItems.size() > 0;
    }
}
