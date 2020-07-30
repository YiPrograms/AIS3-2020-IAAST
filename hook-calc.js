
Java.perform(function() {
    console.log("Script running..")

    var Logic = Java.use("com.android.calculator2.CalculatorExpressionEvaluator");

    console.log("Import finished")

    Logic["evaluate"].implementation = function(input, callback) {
        console.log("Input:", input);
        return this["evaluate"](input, callback);
    }

    console.log("Script finished")
    
})