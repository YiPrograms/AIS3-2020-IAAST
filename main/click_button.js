
Java.perform(function() {

    var [ACTIVITY] = Java.use("[APPNAME].[ACTIVITY]");
    var View = Java.use("android.view.View")
    var EditText = Java.use("android.widget.EditText");
    var JavaString = Java.use('java.lang.String');

    [ACTIVITY].onCreate.implementation = function(savedInstanceState) {
        console.log("[*] [ACTIVITY]: onCreate, clicking Button [BUTTONID]")
        this.onCreate(savedInstanceState)

        var btn = Java.cast(this.findViewById([BUTTONID]), View)
        btn.performClick()
    }

    EditText.setText.implementation = function(text, type) {
        var newText = JavaString.$new('Hello World');
        this.setText(newText, type)
    }

})
