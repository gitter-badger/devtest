args         = require('minimist')(process.argv.slice(2))
exec 				 = require('child-process-promise').exec
colors = require 'colors'
module.exports = (command, callback) ->
  exec(command)
    .then (result) ->
        stdout = result.stdout
        stderr = result.stderr
        # console.log("stdout: ".red, stdout)
        console.log("stderr: ".red, stderr)
        callback(result.stdout) if callback
    .fail (err) ->
        console.error("ERROR: ", err)
        callback(err) if callback
    .progress (childProcess) ->
        console.log('childProcess.pid: '.yellow, "#{childProcess.pid} is executing #{command}".cyan)
        console.log "For device: #{args.device}" if args.device
        childProcess.stdout.on 'data', (data) ->
            console.log("stdout: #{data.toString()}".green)
            return
        return
