
// Stack Trace
// console.log(Java.use("android.util.Log").getStackTraceString(Java.use("java.lang.Exception").$new()))

Java.perform(function() {

    var MainActivity = Java.use("jakhar.aseem.diva.MainActivity");
    var Button = Java.use("android.widget.Button");
    var View = Java.use("android.view.View");
    var v = View.$new()

    MainActivity.onCreate.implementation = function(savedInstanceState) {
        console.log("ONCREATE!!!!")
        this.onCreate(savedInstanceState)
        var button = this.findViewById(2131493023)
        // Java.cast(button, View)
        // console.log(button)
        // button.performClick()
        this.startChallenge(button)
    }
    
})