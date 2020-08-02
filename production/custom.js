    var Random = Java.use("java.util.Random");
    Random.$init.overload().implementation = function() {
        sendWarn("This app uses an insecure Random Number Generator", "Random()", "7.5 (high)")
        return this.$init()
    }
    Random.$init.overload('long').implementation = function(a) {
        sendWarn("This app uses an insecure Random Number Generator", "Random(seed)", "7.5 (high)")
        return this.$init(a)
    }
