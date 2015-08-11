#Installation:  

[![Join the chat at https://gitter.im/rstormsf/devtest](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/rstormsf/devtest?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
  1. ```git clone ```
  2. ```npm install && gulp install```
    * this will install all npm dependencies and bower packages
  3. `cordova platform add ios android`

#Quick Run:
`gulp`
#Build:
  ``` gulp build --device DEVICE```
  Please note that --device is OPTIONAL.  
  if you don't specify this one, cordova won't create a build for you  
    List of options:  
    * android - this will build www directory + cordova build android
    * ios     - this wiill build www directory + cordova build ios

#Build & Watch:
  ```gulp --device DEVICE```  
  DEVICE options:  
* android
* ios
if you omit device it will just compile and run browser

###How Gulp is structured:
gulpfile.js -> Gulpfile.coffee -> ./gulp/tasks