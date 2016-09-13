# mac_battery_charging.rb
Facter.add(:mac_battery_charging) do
  confine kernel: 'Darwin', mac_laptop: true
  setcode do
    output = Facter::Util::Resolution.exec("/usr/sbin/ioreg -r -c 'AppleSmartBattery'").lines.select { |line| line =~ /"IsCharging"/ }[0].split(' ')[2]
    if output == 'Yes'
      true
    else
      false
    end
  end
end
