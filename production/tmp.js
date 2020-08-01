
Java.perform(function() {

    var AccessControl2Activity = Java.use("jakhar.aseem.diva.AccessControl2Activity");
    var View = Java.use("android.view.View");
    var EditText = Java.use("android.widget.EditText");
    var JavaString = Java.use('java.lang.String');

    AccessControl2Activity.onCreate.implementation = function(savedInstanceState) {
        console.log("[*] AccessControl2Activity: Activity started, clicking Button 2131492970...");
        this.onCreate(savedInstanceState);

        var btn = Java.cast(this.findViewById(2131492970), View);
        btn.performClick();
    }

    EditText.setText.implementation = function(text, type) {
        console.log("[*] AccessControl2Activity: Filling input with '5Om3_53cr37_1NFo'...");
        var newText = JavaString.$new('5Om3_53cr37_1NFo');
        this.setText(newText, type);
    }
    
})
