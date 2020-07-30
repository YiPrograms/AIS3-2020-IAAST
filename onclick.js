

Java.perform(function() {

    var Button = Java.use("android.widget.Button");
    var View = Java.use("android.view.View");


    Button.setOnClickListener.implementation = function(listener) {
        var tmp 
        console.log("SetOnclick!", this , listener)
        this.setOnClickListener(listener)
        console.log(tmp)
        tmp = this
    }

})