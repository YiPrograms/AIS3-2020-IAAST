    var Random = Java.use("java.util.Random");
    Random.$init.overload().implementation = function() {
        sendWarn("RANDOM", "Random()", "1.0 (low)")
        return this.$init()
    }
    Random.$init.overload('long').implementation = function(a) {
        sendWarn("RANDOM", "Random(seed)", "1.0 (low)")
        return this.$init(a)
    }
