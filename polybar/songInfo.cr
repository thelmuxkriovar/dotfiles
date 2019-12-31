title = `mpc current`.chomp
timeElapsed = `mpc | awk 'NR==2{print $3}'`.chomp.split('/').join(" / ")
state = `mpc | awk 'NR==2{print $1}'`.chomp
outText = title
if state == "[paused]"
 	outText += " (Paused)"
else
	outText = " " + outText
	outText += " ("+timeElapsed+") "
end
puts outText
