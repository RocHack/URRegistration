URReg
=====

This is an attempt to automate UR registration. The idea is to simply enter the
CRNs of the courses you want, and this will ping the site and automatically
register you for all of them as soon as it can.

There's even a chance it could register extra early, the site actually sends a
timestamp as a GET param.

It's currently a mess with temp files and scripts and nothing working. The
registration site is a mess, which makes this fairly difficult.

My Attempts So Far
==================

Browser
-------

I have gotten it to consistently work in the browser (I've used Chrome for
this). Here's the steps:

* Log in.
* Pick a timestamp and CRN.
* Go to the following urls, replacing #{TIME} with the timestamp and #{CRN}
  with the CRN.
    1. https://webreg.its.rochester.edu/prod/tapp?Navigate=classindex.jsp&WAITPAGE=Loading.htm&LOAD_TERMS=true&TRX_ID=GetCollegeRegTerms&LOAD_DEF_REG_TERM=true&LOAD_SCHEDULE=true&OnError=error.jsp&TS=#{TIME}
    2. https://webreg.its.rochester.edu/prod/tapp?Navigate=regdisplay1.jsp&OnError=error.jsp&TS=#{TIME}&SHOP_CART=true&LOAD_SCHEDULE=false&ADD_CALL_NUM=#{CRN}&GRADE_TYPE=N
    3. https://webreg.its.rochester.edu/prod/tapp?Navigate=CartResults.jsp&OnError=error.jsp&TS=#{TIME}&SUBMIT_CART=true

Ruby
----

login.rb uses Ruby's mechanize. It seems to work well for the most part, but
the last request times out with too many connection resets.

tmp will let you input your credentials and send them to login.rb, so that you
don't need to enter your password in clear text on the command line.

Note: Yes, login.rb is misnamed.

Javascript
----------

reg.js uses phantomjs/Nightmare. Neither work, and I couldn't get a good error
message out of either. (It's also my first node.js script).

Shell
-----

urreg uses curl. Now, I don't think this will work, because I don't think it it
can log in and stay logged in.

urreg has a fairly well-developed UI and logging system, unlike all the other
scripts. A good logging system is useful because registration happens so
rarely.

The script test, I believe, is basically the same as urreg but calls login.rb
rather than using curl.
