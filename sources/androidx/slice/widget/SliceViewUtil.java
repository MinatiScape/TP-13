package androidx.slice.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.text.format.DateUtils;
import android.widget.ProgressBar;
import com.android.systemui.shared.R;
import com.android.systemui.shared.system.QuickStepContract;
import java.util.Calendar;
/* loaded from: classes.dex */
public class SliceViewUtil {
    public static Bitmap getCircularBitmap(Bitmap bitmap) {
        Bitmap createBitmap = Bitmap.createBitmap(bitmap.getWidth(), bitmap.getHeight(), Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(createBitmap);
        Paint paint = new Paint();
        Rect rect = new Rect(0, 0, bitmap.getWidth(), bitmap.getHeight());
        paint.setAntiAlias(true);
        canvas.drawARGB(0, 0, 0, 0);
        canvas.drawCircle(bitmap.getWidth() / 2, bitmap.getHeight() / 2, bitmap.getWidth() / 2, paint);
        paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC_IN));
        canvas.drawBitmap(bitmap, rect, rect, paint);
        return createBitmap;
    }

    public static int getColorAttr(Context context, int attr) {
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(new int[]{attr});
        int color = obtainStyledAttributes.getColor(0, 0);
        obtainStyledAttributes.recycle();
        return color;
    }

    public static Drawable getDrawable(Context context, int attr) {
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(new int[]{attr});
        Drawable drawable = obtainStyledAttributes.getDrawable(0);
        obtainStyledAttributes.recycle();
        return drawable;
    }

    public static CharSequence getTimestampString(Context context, long time) {
        if (time < System.currentTimeMillis() || DateUtils.isToday(time)) {
            return DateUtils.getRelativeTimeSpanString(time, Calendar.getInstance().getTimeInMillis(), 60000L, QuickStepContract.SYSUI_STATE_IME_SHOWING);
        }
        return DateUtils.formatDateTime(context, time, 8);
    }

    public static void tintIndeterminateProgressBar(Context context, ProgressBar bar) {
        int colorAttr = getColorAttr(context, R.attr.colorControlHighlight);
        Drawable indeterminateDrawable = bar.getIndeterminateDrawable();
        if (indeterminateDrawable != null && colorAttr != 0) {
            indeterminateDrawable.setColorFilter(colorAttr, PorterDuff.Mode.MULTIPLY);
            bar.setProgressDrawable(indeterminateDrawable);
        }
    }
}
