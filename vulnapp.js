
Java.perform(function() {
    var StringBuilder = Java.use("java.lang.StringBuilder");
    var JavaString = Java.use("java.lang.String");

    StringBuilder.toString.implementation = function() {
        return JavaString.$new("FXXK");
    }
})