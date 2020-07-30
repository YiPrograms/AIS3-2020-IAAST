
Java.perform(function() {
    var LoginViewModel = Java.use("org.covidwatch.android.ui.login.LoginViewModel");
    var OkHttpClient = Java.use("okhttp3.OkHttpClient");
    var LoginDataSource = Java.use("org.covidwatch.android.ui.login.data.LoginDataSource");
    var LoginRepository = Java.use("org.covidwatch.android.ui.login.data.LoginRepository");
    var JavaString = Java.use('java.lang.String');
    
    console.log("Import finished")
    
    var okhc = OkHttpClient.$new();
    var lds = LoginDataSource.$new(okhc);
    var lrepo = LoginRepository.$new(lds);

    console.log("Script running..")

    var loginViewModel = LoginViewModel.$new(lrepo)
    var username = JavaString.$new('lololololol');
    var password = JavaString.$new('lololo132131321lolol');
    var uuid = JavaString.$new('lolol8a98sd498sd4aololol');
    console.log("String created..")

    LoginViewModel["login"].implementation = function(username, password, muuid) {
        console.log("Username:", username, " Password:", password, " MUUID:", muuid);
        return this["login"](username, password, muuid);
    }

    loginViewModel.login(username, password, uuid);

    

    console.log("Script finished")
    
})