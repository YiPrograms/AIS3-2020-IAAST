
// Stack Trace
// console.log(Java.use("android.util.Log").getStackTraceString(Java.use("java.lang.Exception").$new()))

Java.perform(function() {

    // var MainActivity = Java.use("jakhar.aseem.diva.MainActivity");
    
    // var LogActivity = Java.use("jakhar.aseem.diva.LogActivity");
    // var JavaString = Java.use("java.lang.String");
    // var Button = Java.use("android.view.Button")
    // Java.use("android.app.Activity")

    var AppCompactActivity = Java.use("android.support.v7.app.AppCompatActivity");

    var View = Java.use("android.view.View");
    View.setOnClickListener.implementation = function(listener) {
        console.log("SetOnclick!", this, listener)
        this.setOnClickListener(listener)
    }

    // var OnClickListener = Java.use("android.support.v7.internal.app.AppCompatViewInflater$DeclaredOnClickListener")

    // OnClickListener.onClick.implementation = function(view) {
    //     console.log("OnClick:" ,view)
    //     this.onClick(view)
    // }

    // AppCompactActivity.onCreate.implementation = function(savedInstanceState) {
    //     console.log("ONCREATE!!!!")
    //     this.onCreate(savedInstanceState)
    //     // this.startActivity(Intent.$new(this, LogActivity.class));
    //     // var button = this.findViewById
    // }



    // var mainActivity = MainActivity.$new();
    // mainActivity.startActivity(Intent.$new(JavaString.$new("jakhar.aseem.diva.LogActivity")));
    
    // MainActivity.startChallenge.implementation = function(view) {
    //     console.log(Java.use("android.util.Log").getStackTraceString(Java.use("java.lang.Exception").$new()))
    // }

    

    // Java.use("android.app.Activity").onCreate.overload("android.os.Bundle").implementation = function(savedInstanceState) {
    //     var currentActivity = this;

    //     var application = ActivityThread.currentApplication();
    //     var launcherIntent = application.getPackageManager().getLaunchIntentForPackage(application.getPackageName());
    //     var launchActivityInfo = launcherIntent.resolveActivityInfo(application.getPackageManager(), 0);


    // }
    
})

// Java.perform(function() {
//     var System = Java.use('java.lang.System');
//     var ActivityThread = Java.use("android.app.ActivityThread");
//     var AlertDialogBuilder = Java.use("android.app.AlertDialog$Builder");
//     var DialogInterfaceOnClickListener = Java.use('android.content.DialogInterface$OnClickListener');

//     Java.use("android.app.Activity").onCreate.overload("android.os.Bundle").implementation = function(savedInstanceState) {
//         var currentActivity = this;

//         // Get Main Activity
//         var application = ActivityThread.currentApplication();
//         var launcherIntent = application.getPackageManager().getLaunchIntentForPackage(application.getPackageName());
//         var launchActivityInfo = launcherIntent.resolveActivityInfo(application.getPackageManager(), 0);

//         // Alert Will Only Execute On Main Package Activity Creation
//         if (launchActivityInfo.name.value === this.getComponentName().getClassName()) {
//             var alert = AlertDialogBuilder.$new(this);
//             alert.setMessage("What you want to do now?");

//             alert.setPositiveButton("Dismiss", Java.registerClass({
//                 name: 'il.co.realgame.OnClickListenerPositive',
//                 implements: [DialogInterfaceOnClickListener],
//                 methods: {
//                     getName: function() {
//                         return 'OnClickListenerPositive';
//                     },
//                     onClick: function(dialog, which) {
//                         // Dismiss
//                         dialog.dismiss();
//                     }
//                 }
//             }).$new());

//             alert.setNegativeButton("Force Close!", Java.registerClass({
//                 name: 'il.co.realgame.OnClickListenerNegative',
//                 implements: [DialogInterfaceOnClickListener],
//                 methods: {
//                     getName: function() {
//                         return 'OnClickListenerNegative';
//                     },
//                     onClick: function(dialog, which) {
//                         // Close Application
//                         currentActivity.finish();
//                         System.exit(0);
//                     }
//                 }
//             }).$new());

//             // Create Alert
//             alert.create().show();
//         }
//         return this.onCreate.overload("android.os.Bundle").call(this, savedInstanceState);
//     };
// });