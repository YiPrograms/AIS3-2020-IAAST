    var Random = Java.use("java.util.Random");
    Random.$init.overload().implementation = function() {
        sendWarn("RANDOM", "Random()")
        return this.$init()
    }
    Random.$init.overload('long').implementation = function(a) {
        sendWarn("RANDOM", "Random(seed)")
        return this.$init(a)
    }
