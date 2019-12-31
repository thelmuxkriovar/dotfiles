timeZones = ["Asia/Tokyo", "Europe/Berlin", "America/New_York", "Europe/London"]

def applyColor(str, color, isForeground = true)
  tag = isForeground ? "F" : "B"
  return "%{#{tag}##{color}}#{str}%{#{tag}-}"
end

def changeTimeZone(timeZone)
  system "sudo timedatectl set-timezone #{timeZone}"
end

def currentTimeZone
  tz = `timedatectl | grep "Time zone"`.strip
  tz.split(": ")[1].split(" ")[0]
end

Signal::USR1.trap do
  nextTimeZoneIndex = ((timeZones.index(currentTimeZone()) || 0) + 1) % timeZones.size
  changeTimeZone(timeZones[nextTimeZoneIndex])
end

Signal::USR2.trap do
  previousTimeZoneIndex = ((timeZones.index(currentTimeZone()) || 0) - 1) % timeZones.size
  previousTimeZoneIndex = -previousTimeZoneIndex if previousTimeZoneIndex < 0
  changeTimeZone(timeZones[previousTimeZoneIndex])
end

while true
  dateStr = "+'" + applyColor('\ue0c5', "e25822") + applyColor("  %A, %Y年%m月%d日  %H:%M:%S (%Z) ", "e25822", false) + applyColor('\ue0c4', "e25822") + "'"
  system "date #{dateStr}"
  sleep 0.5
end
