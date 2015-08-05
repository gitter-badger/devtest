#!/usr/bin/env node
var exec = require('child_process').exec;
var fs = require('fs');
var path = require('path');
var sys = require('sys');
var cordova  = require('cordova');

var pluginlist = [
	"de.appplant.cordova.plugin.email-composer",
    "org.apache.cordova.globalization",
    "org.apache.cordova.contacts",
    "com.phonegap.plugins.barcodescanner"
].sort(sortArray);

var pluginPath = cordova.findProjectRoot() + "/plugins";
var installedPlugins = findPlugins(pluginPath).sort(sortArray);

if(arraysIdentical(installedPlugins, pluginlist)){
		console.log("Plugins are already installed");
  return true;
} else {
    pluginlist.forEach(function  (plug) {
        exec("cordova plugin add " + plug, puts);
    });
}

function puts(error,stdout,stderr){
    sys.puts(stdout);
};

function arraysIdentical(a, b) {
    var i = a.length;
    if (i != b.length) return false;
    while (i--) {
        if (a[i] !== b[i]) return false;
    }
    return true;
};

function findPlugins(pluginPath) {
    var plugins = [],
        stats;

    if (fs.existsSync(pluginPath)) {
        plugins = fs.readdirSync(pluginPath).filter(function (fileName) {
            stats = fs.statSync(path.join(pluginPath, fileName));
            return fileName != '.svn' && fileName != 'CVS' && stats.isDirectory();
        });
    }

    return plugins;
};

function sortArray(a, b)
{

    var va = (a === null) ? "" : "" + a,
        vb = (b === null) ? "" : "" + b;

    return va > vb ? 1 : ( va === vb ? 0 : -1 );
};