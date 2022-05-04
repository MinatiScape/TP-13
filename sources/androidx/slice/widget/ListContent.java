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
import androidx.core.util.Pair;
import androidx.slice.Slice;
import androidx.slice.SliceItem;
import androidx.slice.core.SliceAction;
import androidx.slice.core.SliceActionImpl;
import androidx.slice.core.SliceQuery;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public final class ListContent extends SliceContent {
    public RowContent mHeaderContent;
    public SliceActionImpl mPrimaryAction;
    public ArrayList<SliceContent> mRowItems = new ArrayList<>();
    public RowContent mSeeMoreContent;
    public ArrayList mSliceActions;

    public static int getRowType(SliceContent sliceContent, boolean z, List<SliceAction> list) {
        if (sliceContent == null) {
            return 0;
        }
        if (sliceContent instanceof GridContent) {
            return 1;
        }
        RowContent rowContent = (RowContent) sliceContent;
        SliceItem sliceItem = rowContent.mPrimaryAction;
        SliceActionImpl sliceActionImpl = null;
        if (sliceItem != null) {
            sliceActionImpl = new SliceActionImpl(sliceItem);
        }
        SliceItem sliceItem2 = rowContent.mRange;
        if (sliceItem2 != null) {
            if ("action".equals(sliceItem2.mFormat)) {
                return 4;
            }
            return 5;
        } else if (rowContent.mSelection != null) {
            return 6;
        } else {
            if (sliceActionImpl != null && sliceActionImpl.isToggle()) {
                return 3;
            }
            if (!z || list == null) {
                return rowContent.mToggleItems.size() > 0 ? 3 : 0;
            }
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i).isToggle()) {
                    return 3;
                }
            }
            return 0;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x0091, code lost:
        if (r11 != false) goto L29;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public ListContent(androidx.slice.Slice r18) {
        /*
            Method dump skipped, instructions count: 439
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.slice.widget.ListContent.<init>(androidx.slice.Slice):void");
    }

    public final SliceAction getShortcut(Context context) {
        SliceItem sliceItem;
        SliceItem sliceItem2;
        SliceActionImpl sliceActionImpl;
        IconCompat iconCompat;
        CharSequence charSequence;
        ApplicationInfo applicationInfo;
        Intent launchIntentForPackage;
        SliceActionImpl sliceActionImpl2 = this.mPrimaryAction;
        if (sliceActionImpl2 != null) {
            return sliceActionImpl2;
        }
        SliceItem sliceItem3 = this.mSliceItem;
        if (sliceItem3 != null) {
            int i = 5;
            SliceItem find = SliceQuery.find(sliceItem3, "action", new String[]{"title", "shortcut"}, (String[]) null);
            if (find != null) {
                sliceItem2 = SliceQuery.find(find, "image", "title");
                sliceItem = SliceQuery.find(find, "text", (String) null);
            } else {
                sliceItem2 = null;
                sliceItem = null;
            }
            if (find == null) {
                find = SliceQuery.find(this.mSliceItem, "action", (String) null);
            }
            if (sliceItem2 == null) {
                sliceItem2 = SliceQuery.find(this.mSliceItem, "image", "title");
            }
            if (sliceItem == null) {
                sliceItem = SliceQuery.find(this.mSliceItem, "text", "title");
            }
            if (sliceItem2 == null) {
                sliceItem2 = SliceQuery.find(this.mSliceItem, "image", (String) null);
            }
            if (sliceItem == null) {
                sliceItem = SliceQuery.find(this.mSliceItem, "text", (String) null);
            }
            if (sliceItem2 != null) {
                i = SliceActionImpl.parseImageMode(sliceItem2);
            }
            if (context != null) {
                SliceItem find2 = SliceQuery.find(this.mSliceItem, "slice", (String) null);
                if (find2 != null) {
                    Uri uri = find2.getSlice().getUri();
                    if (sliceItem2 != null) {
                        iconCompat = (IconCompat) sliceItem2.mObj;
                    } else {
                        iconCompat = null;
                    }
                    if (sliceItem != null) {
                        charSequence = (CharSequence) sliceItem.mObj;
                    } else {
                        charSequence = null;
                    }
                    PackageManager packageManager = context.getPackageManager();
                    ProviderInfo resolveContentProvider = packageManager.resolveContentProvider(uri.getAuthority(), 0);
                    if (resolveContentProvider != null) {
                        applicationInfo = resolveContentProvider.applicationInfo;
                    } else {
                        applicationInfo = null;
                    }
                    if (applicationInfo != null) {
                        if (iconCompat == null) {
                            Drawable applicationIcon = packageManager.getApplicationIcon(applicationInfo);
                            if (applicationIcon instanceof BitmapDrawable) {
                                Bitmap bitmap = ((BitmapDrawable) applicationIcon).getBitmap();
                                if (bitmap != null) {
                                    iconCompat = new IconCompat(1);
                                    iconCompat.mObj1 = bitmap;
                                } else {
                                    String str = IconCompat.EXTRA_TYPE;
                                    throw new IllegalArgumentException("Bitmap must not be null.");
                                }
                            } else {
                                Bitmap createBitmap = Bitmap.createBitmap(applicationIcon.getIntrinsicWidth(), applicationIcon.getIntrinsicHeight(), Bitmap.Config.ARGB_8888);
                                Canvas canvas = new Canvas(createBitmap);
                                applicationIcon.setBounds(0, 0, canvas.getWidth(), canvas.getHeight());
                                applicationIcon.draw(canvas);
                                if (createBitmap != null) {
                                    IconCompat iconCompat2 = new IconCompat(1);
                                    iconCompat2.mObj1 = createBitmap;
                                    iconCompat = iconCompat2;
                                } else {
                                    String str2 = IconCompat.EXTRA_TYPE;
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
                            find = new SliceItem(activity, new Slice(arrayList, (String[]) arrayList2.toArray(new String[arrayList2.size()]), uri, null), (String) null, new String[0]);
                        }
                    }
                    if (find == null) {
                        find = new SliceItem(PendingIntent.getActivity(context, 0, new Intent(), 67108864), (Slice) null, (String) null, (String[]) null);
                    }
                    if (!(charSequence == null || iconCompat == null)) {
                        F f = ((Pair) find.mObj).first;
                        if (f instanceof PendingIntent) {
                            PendingIntent pendingIntent = (PendingIntent) f;
                        }
                        sliceActionImpl = new SliceActionImpl(iconCompat, i, charSequence);
                        return sliceActionImpl;
                    }
                }
            } else if (!(sliceItem2 == null || find == null || sliceItem == null)) {
                F f2 = ((Pair) find.mObj).first;
                if (f2 instanceof PendingIntent) {
                    PendingIntent pendingIntent2 = (PendingIntent) f2;
                }
                sliceActionImpl = new SliceActionImpl((IconCompat) sliceItem2.mObj, i, (CharSequence) sliceItem.mObj);
                return sliceActionImpl;
            }
        }
        return null;
    }

    public final boolean isValid() {
        boolean z;
        if (this.mSliceItem != null) {
            z = true;
        } else {
            z = false;
        }
        if (!z || this.mRowItems.size() <= 0) {
            return false;
        }
        return true;
    }

    @Override // androidx.slice.widget.SliceContent
    public final int getHeight(SliceStyle sliceStyle, SliceViewPolicy sliceViewPolicy) {
        int i;
        sliceStyle.getClass();
        boolean z = true;
        if (sliceViewPolicy.mMode == 1) {
            return this.mHeaderContent.getHeight(sliceStyle, sliceViewPolicy);
        }
        int i2 = sliceViewPolicy.mMaxHeight;
        boolean z2 = sliceViewPolicy.mScrollable;
        int listItemsHeight = sliceStyle.getListItemsHeight(this.mRowItems, sliceViewPolicy);
        if (i2 > 0) {
            i2 = Math.max(this.mHeaderContent.getHeight(sliceStyle, sliceViewPolicy), i2);
        }
        if (i2 > 0) {
            i = i2;
        } else {
            i = sliceStyle.mListLargeHeight;
        }
        if (listItemsHeight - i < sliceStyle.mListMinScrollHeight) {
            z = false;
        }
        if (z && !sliceStyle.mExpandToAvailableHeight) {
            listItemsHeight = i;
        } else if (i2 > 0) {
            listItemsHeight = Math.min(i, listItemsHeight);
        }
        if (!z2) {
            return sliceStyle.getListItemsHeight(sliceStyle.getListItemsForNonScrollingList(this, listItemsHeight, sliceViewPolicy).mDisplayedItems, sliceViewPolicy);
        }
        return listItemsHeight;
    }
}
