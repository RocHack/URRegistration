var Nightmare = require('nightmare');

var n = new Nightmare();

n
    .goto("https://webreg.its.rochester.edu/prod/web/LoginMain.jsp")
    .type("input[name='STUDENT_ID']", "jkottas")
    .type("input[name='STUDENT_PIN']", "")
    .evaluate(function() {
        document.getElementsByName("Form")[0].submit();
        console.log(document.getElementsByName("Form").length);
    }, function(res) {
        console.log("Submitted!");
        n
            .goto("https://google.com/")
            .evaluate(function() {
                throw 2;
            }, function(){})
            .run(function(){});
    })
    .run(function(){});

/*

var page = require('webpage').create();

var time = 1415370325856;

var crn = 15156;

var form = null;
var id = null;
var pin = null;

page.open("https://webreg.its.rochester.edu/prod/web/LoginMain.jsp", function()
          {
              page.evaluate(function() {
                  console.log("hi");
                  form = document.getElementsByName("Form")[0];
                  id = document.getElementsByName("STUDENT_ID")[0];
                  pin = document.getElementsByName("STUDENT_PIN")[0];
                  // id.value = "jkottas";
                  // pin.value = "";
                  // form.submit();
              });

            // form = page.form_with(:name => "Form")

            // form["STUDENT_ID"] = ARGV[0] form["STUDENT_PIN"] = ARGV[1]

            // form.submit

              setTimeout(function() {

            page.open("https://webreg.its.rochester.edu/prod/tapp?Navigate=classindex.jsp&WAITPAGE=Loading.htm&LOAD_TERMS=true&TRX_ID=GetCollegeRegTerms&LOAD_DEF_REG_TERM=true&LOAD_SCHEDULE=true&OnError=error.jsp&TS="
                      + time, function() {

                page.open("https://webreg.its.rochester.edu/prod/tapp?Navigate=regdisplay1.jsp&OnError=error.jsp&TS="
                          + time +
                          "&SHOP_CART=true&LOAD_SCHEDULE=false&ADD_CALL_NUM=" +
                          crn + "&GRADE_TYPE=N", function() {

                    page.open("https://webreg.its.rochester.edu/prod/tapp?Navigate=CartResults.jsp&OnError=error.jsp&TS="
                              + time + "&SUBMIT_CART=true", function() {

                        console.log("Done!");
                        phantom.exit();
                    });
                });
            });
              }, 5000);
          });

*/
