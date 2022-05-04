package androidx.cardview;

import android.content.Context;
import android.content.Intent;
/* loaded from: classes.dex */
public class R$style {
    public static void launchHome(Context context) {
        Intent intent = new Intent("android.intent.action.MAIN");
        intent.addCategory("android.intent.category.HOME");
        intent.setFlags(268468224);
        context.startActivity(intent);
    }
}
