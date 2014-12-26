URRegistration
==============

This is a script to automate UR registration. The idea is to simply enter the
CRNs of the courses you want, and this will ping the site and automatically
register you for all of them as soon as it can.

There's even a chance it could register extra early; the site actually sends a
timestamp as a GET param.

Currently it doesn't keep pinging the server; it just tries once to register.
It also doesn't deal with courses that need a permission code or courses that
are closed because they're full. I'm not sure what happens with either of
these; I haven't tried them.

To run, just do `urreg`. `urreg --help` or `urreg -h` will display the options,
and unless `--quiet` or `-q` is given, the script will display intructions at
runtime.

Other attempts
--------------

I made some other attempts at this in other languages, but since urreg works
I'm sticking with it. The other attempts are in the 'other-attempts' branch.
