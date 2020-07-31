
Java.perform(function() {

    var Button = Java.use("android.widget.Button");

    Button.setOnClickListener.implementation = function(listener) {
        send("" + this)
        this.setOnClickListener(listener)
        // console.log(this.toString())
    }

})
