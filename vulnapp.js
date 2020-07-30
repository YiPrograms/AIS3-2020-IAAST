
Java.perform(function() {
    // var StringBuilder = Java.use("java.lang.StringBuilder");
    // var JavaString = Java.use("java.lang.String");
    var MainActivity = Java.use("com.ais2.vulnapp.MainActivity")

    // MainActivity.showBtnOnClick.implementation = function(view) {
    //     console.log(Java.use("android.util.Log").getStackTraceString(Java.use("java.lang.Exception").$new()))
    // } 

    // StringBuilder.toString.implementation = function() {
    //     // console.log(Java.use("android.util.Log").getStackTraceString(Java.use("java.lang.Exception").$new()))
    //     return JavaString.$new("FXXK");
    // }
})