#!/usr/bin/ruby

trap "SIGINT" do
puts " got SIGINT exitting!"
exit 130
end
# setup
$dev = "hci0"
puts %q/hello this is a tiny hcitool shell
originally writen in ruby by theMontarCannon/;
puts "entrer device you want to use by default #{$dev}";
print ">>> "
$dev = gets.chomp();
puts "using device #{$dev}"
puts %q/now write a hcitool command or
type help for list of commands or ext to exit/

#command exec section
while 1 === 1
	print ">>> ";
	$cmd = gets.chomp
	case $cmd
		when "up"
			system("hciconfig #{$dev} up");
		when "down"
			system("hciconfig #{$dev} down");
		when "help"
			puts %q|
commands bulit in to shell:
ext    exit the program
help   this help
up     makes adapter up (using hciconfig <device> up)
down   makes adapter down (using hciconfig <device> down )
ndev   change target device
now i display hcitool help|;
			puts `hcitool -h`;
		when "ndev"
			puts "enter new device";
			print ">>> "
			$dev = gets.chomp
			puts "new device #{$dev}"
		when "ext"
			exit 1;
		else
			system("hcitool -i #{$dev} #{$cmd}");
	end
end
