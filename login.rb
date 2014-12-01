require 'mechanize'

agent = Mechanize.new
agent.ssl_version = 'SSLv3'
agent.verify_mode = OpenSSL::SSL::VERIFY_NONE

page = agent.get("https://webreg.its.rochester.edu/prod/web/LoginMain.jsp")

form = page.form_with(:name => "Form")

form["STUDENT_ID"] = ARGV[0]
form["STUDENT_PIN"] = ARGV[1]

form.submit

sleep 5

time = 1415370325856

puts "1"

page =
    agent.get("https://webreg.its.rochester.edu/prod/tapp?Navigate=classindex.jsp&WAITPAGE=Loading.htm&LOAD_TERMS=true&TRX_ID=GetCollegeRegTerms&LOAD_DEF_REG_TERM=true&LOAD_SCHEDULE=true&OnError=error.jsp&TS=#{time}")

puts "2"

page =
    agent.get("https://webreg.its.rochester.edu/prod/tapp?Navigate=regdisplay1.jsp&OnError=error.jsp&TS=#{time}&SHOP_CART=true&LOAD_SCHEDULE=false&ADD_CALL_NUM=15156&GRADE_TYPE=N")

puts "3"

# This times out and fails for me with too many connection resets. This may be
# a mechanize bug but I'm not sure.
page =
    agent.get("https://webreg.its.rochester.edu/prod/tapp?Navigate=CartResults.jsp&OnError=error.jsp&TS=#{time}&SUBMIT_CART=true")

puts "Done!"
