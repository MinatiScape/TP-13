package androidx.coordinatorlayout;

import android.text.TextUtils;
import android.view.View;
import android.widget.TextView;
import androidx.appcompat.widget.Toolbar;
import com.google.chrome.dongle.imax.wallpaper2.protos.ImaxWallpaperProto$Attribution;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public class R$style {
    public static TextView getTextView(Toolbar toolbar, CharSequence charSequence) {
        for (int i = 0; i < toolbar.getChildCount(); i++) {
            View childAt = toolbar.getChildAt(i);
            if (childAt instanceof TextView) {
                TextView textView = (TextView) childAt;
                if (TextUtils.equals(textView.getText(), charSequence)) {
                    return textView;
                }
            }
        }
        return null;
    }

    public static List<String> parseAttributions(List<ImaxWallpaperProto$Attribution> list, String str) {
        ArrayList arrayList = new ArrayList();
        for (ImaxWallpaperProto$Attribution imaxWallpaperProto$Attribution : list) {
            arrayList.add(imaxWallpaperProto$Attribution.getText());
        }
        if (arrayList.size() == 0) {
            arrayList.add(str);
        }
        return arrayList;
    }
}
