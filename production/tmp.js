
Java.perform(function() {

    var AccessControl2Activity = Java.use("jakhar.aseem.diva.AccessControl2Activity");
    var View = Java.use("android.view.View");
    var EditText = Java.use("android.widget.EditText");
    var JavaString = Java.use('java.lang.String');

    AccessControl2Activity.onCreate.implementation = function(savedInstanceState) {
        console.log("[*] AccessControl2Activity: Activity started, clicking Button 2131492970...");
        this.onCreate(savedInstanceState);

        var btn = Java.cast(this.findViewById(2131492970), View);
        btn.performClick();
    }

    EditText.setText.implementation = function(text, type) {
        console.log("[*] AccessControl2Activity: Filling input with '5Om3_53cr37_1NFo'...");
        var newText = JavaString.$new('5Om3_53cr37_1NFo');
        this.setText(newText, type);
    }



    var sendWarn = function(disc, msg){
        send("WARN#[!] AccessControl2Activity: ----- ⚠️ Found security issue ⚠️ -----");
        send("WARN#[!] AccessControl2Activity: " + disc);
        if (msg)
            send("WARN#[!] AccessControl2Activity: > " + msg);
        send("WARN#[!] AccessControl2Activity: ----------------------------------");
    }

    var android_util_Log = Java.use('android.util.Log');
    android_util_Log.v.overload('java.lang.String', 'java.lang.String').implementation = function(a, b) {
        sendWarn('The App logs information. Sensitive information should never be logged.', a);
        return this.v(a, b);
    }
    android_util_Log.v.overload('java.lang.String', 'java.lang.String', 'java.lang.Throwable').implementation = function(a, b, c) {
        sendWarn('The App logs information. Sensitive information should never be logged.', a);
        return this.v(a, b, c);
    }
    android_util_Log.d.overload('java.lang.String', 'java.lang.String').implementation = function(a, b) {
        sendWarn('The App logs information. Sensitive information should never be logged.', a);
        return this.d(a, b);
    }
    android_util_Log.d.overload('java.lang.String', 'java.lang.String', 'java.lang.Throwable').implementation = function(a, b, c) {
        sendWarn('The App logs information. Sensitive information should never be logged.', a);
        return this.d(a, b, c);
    }
    android_util_Log.i.overload('java.lang.String', 'java.lang.String').implementation = function(a, b) {
        sendWarn('The App logs information. Sensitive information should never be logged.', a);
        return this.i(a, b);
    }
    android_util_Log.i.overload('java.lang.String', 'java.lang.String', 'java.lang.Throwable').implementation = function(a, b, c) {
        sendWarn('The App logs information. Sensitive information should never be logged.', a);
        return this.i(a, b, c);
    }
    android_util_Log.w.overload('java.lang.String', 'java.lang.String').implementation = function(a, b) {
        sendWarn('The App logs information. Sensitive information should never be logged.', a);
        return this.w(a, b);
    }
    android_util_Log.w.overload('java.lang.String', 'java.lang.Throwable').implementation = function(a, b) {
        sendWarn('The App logs information. Sensitive information should never be logged.', a);
        return this.w(a, b);
    }
    android_util_Log.w.overload('java.lang.String', 'java.lang.String', 'java.lang.Throwable').implementation = function(a, b, c) {
        sendWarn('The App logs information. Sensitive information should never be logged.', a);
        return this.w(a, b, c);
    }
    android_util_Log.e.overload('java.lang.String', 'java.lang.String').implementation = function(a, b) {
        sendWarn('The App logs information. Sensitive information should never be logged.', a);
        return this.e(a, b);
    }
    android_util_Log.e.overload('java.lang.String', 'java.lang.String', 'java.lang.Throwable').implementation = function(a, b, c) {
        sendWarn('The App logs information. Sensitive information should never be logged.', a);
        return this.e(a, b, c);
    }

    var android_os_Environment = Java.use('android.os.Environment');
    android_os_Environment.getExternalStorageDirectory.implementation = function() {
        sendWarn('App can read/write to External Storage. Any App can read data written to External Storage.', 'Environment.getExternalStorageDirectory()');
        return this.getExternalStorageDirectory();
    }
    android_os_Environment.getExternalStoragePublicDirectory.implementation = function(a) {
        sendWarn('App can read/write to External Storage. Any App can read data written to External Storage.', 'Environment.getExternalStoragePublicDirectory(...)');
        return this.getExternalStoragePublicDirectory(a);
    }
    android_os_Environment.getExternalStorageState.overload().implementation = function() {
        sendWarn('App can read/write to External Storage. Any App can read data written to External Storage.', 'Environment.getExternalStorageState()');
        return this.getExternalStorageState();
    }
    android_os_Environment.getExternalStorageState.overload('java.io.File').implementation = function(a) {
        sendWarn('App can read/write to External Storage. Any App can read data written to External Storage.', 'Environment.getExternalStorageState(...)');
        return this.getExternalStorageState(a);
    }

    var java_io_File = Java.use('java.io.File');
    java_io_File.createTempFile.overload('java.lang.String', 'java.lang.String').implementation = function(a, b) {
        sendWarn('App can read/write to External Storage. Any App can read data written to External Storage.', 'File.createTempFile(...)');
        return this.createTempFile(a, b);
    }
    java_io_File.createTempFile.overload('java.lang.String', 'java.lang.String', "java.io.File").implementation = function(a, b, c) {
        sendWarn('App can read/write to External Storage. Any App can read data written to External Storage.', 'File.createTempFile(...)');
        return this.createTempFile(a, b, c);
    }

    var android_database_sqlite_SQLiteDatabase = Java.use('android.database.sqlite.SQLiteDatabase');
    android_database_sqlite_SQLiteDatabase.query.overload('java.lang.String', '[Ljava.lang.String;', 'java.lang.String', '[Ljava.lang.String;', 'java.lang.String', 'java.lang.String', 'java.lang.String').implementation = function(a, b, c, d, e, f, g) {
        sendWarn('App uses SQLite Database and execute raw SQL query. Untrusted user input in raw SQL queries can cause SQL Injection. Also sensitive information should be encrypted and written to the database.', 'SQLiteDatabase.query(...)');
        return this.query(a, b, c, d, e, f, g);
    }
    android_database_sqlite_SQLiteDatabase.query.overload('java.lang.String', '[Ljava.lang.String;', 'java.lang.String', '[Ljava.lang.String;', 'java.lang.String', 'java.lang.String', 'java.lang.String', 'java.lang.String').implementation = function(a, b, c, d, e, f, g, h) {
        sendWarn('App uses SQLite Database and execute raw SQL query. Untrusted user input in raw SQL queries can cause SQL Injection. Also sensitive information should be encrypted and written to the database.', 'SQLiteDatabase.query(...)');
        return this.query(a, b, c, d, e, f, g, h);
    }
    android_database_sqlite_SQLiteDatabase.query.overload('boolean', 'java.lang.String', '[Ljava.lang.String;', 'java.lang.String', '[Ljava.lang.String;', 'java.lang.String', 'java.lang.String', 'java.lang.String', 'java.lang.String').implementation = function(a, b, c, d, e, f, g, h, i) {
        sendWarn('App uses SQLite Database and execute raw SQL query. Untrusted user input in raw SQL queries can cause SQL Injection. Also sensitive information should be encrypted and written to the database.', 'SQLiteDatabase.query(...)');
        return this.query(a, b, c, d, e, f, g, h, i);
    }
    android_database_sqlite_SQLiteDatabase.query.overload('boolean', 'java.lang.String', '[Ljava.lang.String;', 'java.lang.String', '[Ljava.lang.String;', 'java.lang.String', 'java.lang.String', 'java.lang.String', 'java.lang.String', 'android.os.CancellationSignal').implementation = function(a, b, c, d, e, f, g, h, i, j) {
        sendWarn('App uses SQLite Database and execute raw SQL query. Untrusted user input in raw SQL queries can cause SQL Injection. Also sensitive information should be encrypted and written to the database.', 'SQLiteDatabase.query(...)');
        return this.query(a, b, c, d, e, f, g, h, i, j);
    }
    android_database_sqlite_SQLiteDatabase.rawQuery.overload('java.lang.String', '[Ljava.lang.String;', 'android.os.CancellationSignal').implementation = function(a, b, c) {
        sendWarn('App uses SQLite Database and execute raw SQL query. Untrusted user input in raw SQL queries can cause SQL Injection. Also sensitive information should be encrypted and written to the database.', 'SQLiteDatabase.rawQuery(...)');
        return this.rawQuery(a, b, c);
    }
    android_database_sqlite_SQLiteDatabase.rawQuery.overload('java.lang.String', '[Ljava.lang.String;').implementation = function(a, b) {
        sendWarn('App uses SQLite Database and execute raw SQL query. Untrusted user input in raw SQL queries can cause SQL Injection. Also sensitive information should be encrypted and written to the database.', 'SQLiteDatabase.rawQuery(...)');
        return this.rawQuery(a, b);
    }
    android_database_sqlite_SQLiteDatabase.execSQL.overload('java.lang.String').implementation = function(a) {
        sendWarn('App uses SQLite Database and execute raw SQL query. Untrusted user input in raw SQL queries can cause SQL Injection. Also sensitive information should be encrypted and written to the database.', 'SQLiteDatabase.execSQL(...)');
        return this.execSQL(a);
    }
    android_database_sqlite_SQLiteDatabase.execSQL.overload('java.lang.String', '[Ljava.lang.Object;').implementation = function(a, b) {
        sendWarn('App uses SQLite Database and execute raw SQL query. Untrusted user input in raw SQL queries can cause SQL Injection. Also sensitive information should be encrypted and written to the database.', 'SQLiteDatabase.execSQL(...)');
        return this.execSQL(a, b);
    }

})
