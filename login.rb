require 'mechanize'

agent = Mechanize.new
agent.ssl_version = 'SSLv3'
agent.verify_mode = OpenSSL::SSL::VERIFY_NONE

page = agent.get("https://webreg.its.rochester.edu/prod/web/LoginMain.jsp")

form = page.form_with(:name => "Form")

form["STUDENT_ID"] = ARGV[0]
form["STUDENT_PIN"] = ARGV[1]

form.submit
