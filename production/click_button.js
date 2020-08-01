
Java.perform(function() {

    var [ACTIVITYSHORT] = Java.use("[ACTIVITY]");
    var View = Java.use("android.view.View");
    var EditText = Java.use("android.widget.EditText");
    var JavaString = Java.use('java.lang.String');

    [ACTIVITYSHORT].onCreate.implementation = function(savedInstanceState) {
        console.log("[*] [ACTIVITYSHORT]: Activity started, clicking Button [BUTTONID]...");
        this.onCreate(savedInstanceState);

        var btn = Java.cast(this.findViewById([BUTTONID]), View);
        btn.performClick();
    }

    EditText.setText.implementation = function(text, type) {
        console.log("[*] [ACTIVITYSHORT]: Filling input with '5Om3_53cr37_1NFo'...");
        var newText = JavaString.$new('5Om3_53cr37_1NFo');
        this.setText(newText, type);
    }
    
})
