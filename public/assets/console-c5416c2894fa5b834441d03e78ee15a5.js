/*
Copyright (c) 2008-2013 Pivotal Labs

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/
function getJasmineRequireObj(){return"undefined"!=typeof module&&module.exports?exports:(window.jasmineRequire=window.jasmineRequire||{},window.jasmineRequire)}getJasmineRequireObj().console=function(e,n){n.ConsoleReporter=e.ConsoleReporter()},getJasmineRequireObj().ConsoleReporter=function(){function e(e){function t(){d("\n")}function o(e,n){return l?v[e]+n+v.none:n}function i(e,n){return 1==n?e:e+"s"}function r(e,n){for(var t=[],o=0;n>o;o++)t.push(e);return t}function s(e,n){for(var t=(e||"").split("\n"),o=[],i=0;i<t.length;i++)o.push(r(" ",n).join("")+t[i]);return o.join("\n")}function u(e){t(),d(e.fullName);for(var n=0;n<e.failedExpectations.length;n++){var o=e.failedExpectations[n];t(),d(s(o.stack,2))}t()}var a,f,c,d=e.print,l=e.showColors||!1,p=e.onComplete||function(){},m=e.timer||n,h=[],v={green:"[32m",red:"[31m",yellow:"[33m",none:"[0m"};return this.jasmineStarted=function(){a=0,f=0,c=0,d("Started"),t(),m.start()},this.jasmineDone=function(){t();for(var e=0;e<h.length;e++)u(h[e]);t();var n=a+" "+i("spec",a)+", "+f+" "+i("failure",f);c&&(n+=", "+c+" pending "+i("spec",c)),d(n),t();var o=m.elapsed()/1e3;d("Finished in "+o+" "+i("second",o)),t(),p(0===f)},this.specDone=function(e){return a++,"pending"==e.status?(c++,void d(o("yellow","*"))):"passed"==e.status?void d(o("green",".")):void("failed"==e.status&&(f++,h.push(e),d(o("red","F"))))},this}var n={start:function(){},elapsed:function(){return 0}};return e};