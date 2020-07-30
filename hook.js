
Java.perform(function() {
    var LoginViewModel = Java.use("org.covidwatch.android.ui.login.LoginViewModel");
    // var LoggedInUser = Java.use("org.covidwatch.android.ui.login.data.LoggedInUser");

    console.log("Script running..")

    LoginViewModel["login"].implementation = function(username, password, muuid) {
        console.log("Username:", username, " Password:", password, " MUUID:", muuid);
        return this["login"](username, password, muuid);
    }

    console.log("Script finished")
    
})