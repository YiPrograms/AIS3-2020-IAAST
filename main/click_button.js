
Java.perform(function() {

    var [ACTIVITY] = Java.use("[APPNAME].[ACTIVITY]");
    var View = Java.use("android.view.View");
    var EditText = Java.use("android.widget.EditText");
    var JavaString = Java.use('java.lang.String');

    [ACTIVITY].onCreate.implementation = function(savedInstanceState) {
        console.log("[*] [ACTIVITY]: Activity started, clicking Button [BUTTONID]...");
        this.onCreate(savedInstanceState);

        var btn = Java.cast(this.findViewById([BUTTONID]), View);
        btn.performClick();
    }

    EditText.setText.implementation = function(text, type) {
        var newText = JavaString.$new('5Om3_53cr37_1NFo');
        this.setText(newText, type);
    }



    var sendWarn = function(disc, msg){
        send("WARN#[!] [ACTIVITY]: ----- ⚠️ Found security flaw ⚠️ -----");
        send("WARN#[!] [ACTIVITY]: " + disc);
        if (msg)
            send("WARN#[!] [ACTIVITY]: > " + msg);
        send("WARN#[!] [ACTIVITY]: ----------------------------------");
    }



    var Log = Java.use("android.util.Log");
    var LogHook = function(tag, msg, tr) {
        sendWarn("The App logs information. Sensitive information should never be logged.", msg)
        return 0;
    }
    Log.v.overload('java.lang.String', 'java.lang.String').implementation = LogHook;
    Log.v.overload('java.lang.String', 'java.lang.String', 'java.lang.Throwable').implementation = LogHook;
    Log.d.overload('java.lang.String', 'java.lang.String').implementation = LogHook;
    Log.d.overload('java.lang.String', 'java.lang.String', 'java.lang.Throwable').implementation = LogHook;
    Log.i.overload('java.lang.String', 'java.lang.String').implementation = LogHook;
    Log.i.overload('java.lang.String', 'java.lang.String', 'java.lang.Throwable').implementation = LogHook;
    Log.w.overload('java.lang.String', 'java.lang.String').implementation = LogHook;
    Log.w.overload('java.lang.String', 'java.lang.Throwable').implementation = LogHook;
    Log.w.overload('java.lang.String', 'java.lang.String', 'java.lang.Throwable').implementation = LogHook;
    Log.e.overload('java.lang.String', 'java.lang.String').implementation = LogHook;
    Log.e.overload('java.lang.String', 'java.lang.String', 'java.lang.Throwable').implementation = LogHook;


    var Environment = Java.use("android.os.Environment");
    Environment.getExternalStorageDirectory.implementation = function() {
        sendWarn("App can read/write to External Storage. Any App can read data written to External Storage.", "Environment.getExternalStorageDirectory()")
        return this.getExternalStorageDirectory()
    }
    Environment.getExternalStoragePublicDirectory.implementation = function(type) {
        sendWarn("App can read/write to External Storage. Any App can read data written to External Storage.", "Environment.getExternalStoragePublicDirectory(String type)")
        return this.getExternalStoragePublicDirectory(type)
    }
    Environment.getExternalStorageState.overload().implementation = function() {
        sendWarn("App can read/write to External Storage. Any App can read data written to External Storage.", "Environment.getExternalStorageState()")
        return this.getExternalStorageState()
    }
    Environment.getExternalStorageState.overload('java.io.File').implementation = function(file) {
        sendWarn("App can read/write to External Storage. Any App can read data written to External Storage.", "Environment.getExternalStorageState(File path)")
        return this.getExternalStorageState(file)
    }

    var JavaFile = Java.use("java.io.File")
    JavaFile.createTempFile.overload('java.lang.String', 'java.lang.String').implementation = function(pf, sf) {
        sendWarn("App can read/write to External Storage. Any App can read data written to External Storage.", "File.createTempFile(String prefix, String suffix)")
        return this.createTempFile(pf, sf)
    }
    JavaFile.createTempFile.overload('java.lang.String', 'java.lang.String', "java.io.File").implementation = function(pf, sf, dir) {
        sendWarn("App can read/write to External Storage. Any App can read data written to External Storage.", "File.createTempFile(String prefix, String suffix, File directory)")
        return this.createTempFile(pf, sf, dir)
    }

    var sqli = Java.use("android.database.sqlite.SQLiteDatabase");
    sqli.query.overload('java.lang.String', '[Ljava.lang.String;', 'java.lang.String', '[Ljava.lang.String;', 'java.lang.String', 'java.lang.String', 'java.lang.String').implementation = function (a,b,c,d,e,f,g,h,i) {
        sendWarn("App uses SQLite Database and execute raw SQL query(9). Untrusted user input in raw SQL queries can cause SQL Injection. Also sensitive information should be encrypted and written to the database.");
        return this.query(a,b,c,d,e,f,g,h,i);
    } //9

    sqli.query.overload('java.lang.String', '[Ljava.lang.String;', 'java.lang.String', '[Ljava.lang.String;', 'java.lang.String', 'java.lang.String', 'java.lang.String', 'java.lang.String').implementation = function (a,b,c,d,e,f,g,h) {
        sendWarn("App uses SQLite Database and execute raw SQL query(8). Untrusted user input in raw SQL queries can cause SQL Injection. Also sensitive information should be encrypted and written to the database.");
        return this.query(a,b,c,d,e,f,g,h);
    } //8


    sqli.query.overload('boolean', 'java.lang.String', '[Ljava.lang.String;', 'java.lang.String', '[Ljava.lang.String;', 'java.lang.String', 'java.lang.String', 'java.lang.String', 'java.lang.String').implementation = function (a,b,c,d,e,f,g,h,i,j) {
        sendWarn("App uses SQLite Database and execute raw SQL query(10). Untrusted user input in raw SQL queries can cause SQL Injection. Also sensitive information should be encrypted and written to the database.");
        return this.query(a,b,c,d,e,f,g,h,i,j);
    } //10

    sqli.query.overload('boolean', 'java.lang.String', '[Ljava.lang.String;', 'java.lang.String', '[Ljava.lang.String;', 'java.lang.String', 'java.lang.String', 'java.lang.String', 'java.lang.String', 'android.os.CancellationSignal').implementation = function (a,b,c,d,e,f,g) {
        sendWarn("App uses SQLite Database and execute raw SQL query(7). Untrusted user input in raw SQL queries can cause SQL Injection. Also sensitive information should be encrypted and written to the database.");
        return this.query(a,b,c,d,e,f,g);
    } //7

    sqli.rawQuery.overload('java.lang.String', '[Ljava.lang.String;', 'android.os.CancellationSignal').implementation = function (a,b,c) {
        sendWarn("App uses SQLite Database and execute raw SQL query. Untrusted user input in raw SQL queries can cause SQL Injection. Also sensitive information should be encrypted and written to the database.", "SQLiteDatabase.raqQuery()");
        return this.rawQuery(a,b,c);
    }

    sqli.rawQuery.overload('java.lang.String', '[Ljava.lang.String;').implementation = function (a,b) {
        sendWarn("App uses SQLite Database and execute raw SQL query. Untrusted user input in raw SQL queries can cause SQL Injection. Also sensitive information should be encrypted and written to the database.", "SQLiteDatabase.raqQuery()");
        return this.rawQuery(a,b);
    }

    sqli.execSQL.overload('java.lang.String').implementation = function (a) {
        sendWarn("App uses SQLite Database and execute execSQL(1) SQL query. Untrusted user input in raw SQL queries can cause SQL Injection. Also sensitive information should be encrypted and written to the database.");
        return this.execSQL(a);
    }


    sqli.execSQL.overload('java.lang.String', '[Ljava.lang.Object;').implementation = function (a, b) {
        sendWarn("App uses SQLite Database and execute execSQL(2) SQL query. Untrusted user input in raw SQL queries can cause SQL Injection. Also sensitive information should be encrypted and written to the database.");
        return this.execSQL(a, b);
    }

})
