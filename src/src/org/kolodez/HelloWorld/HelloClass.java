package org.kolodez.HelloWorld;

import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;

public class HelloClass extends Activity {
    protected void onCreate (Bundle savedInstanceState) {
        super.onCreate (savedInstanceState);
        this.setContentView (R.layout.hello);
        TextView tv = (TextView) this.findViewById (R.id.MainTextView);
        tv.setText ("Hello, world!");
    }   
}
