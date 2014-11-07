require 'mechanize'

agent = Mechanize.new
agent.ssl_version = 'SSLv3'

puts "WARNING: This program needs to disable SSL verification to work."
puts "Be sure your browser can open pages with SSL safely first."
agent.verify_mode = OpenSSL::SSL::VERIFY_NONE

page = agent.get("https://webreg.its.rochester.edu/prod/web/LoginMain.jsp")

form = page.form_with(:name => "Form")

puts "Please enter your student ID:"
form["STUDENT_ID"] = STDIN.gets.chomp

puts "Please enter your password:"
`stty -echo`
form["STUDENT_PIN"] = STDIN.gets.chomp
`stty echo`

form.submit
