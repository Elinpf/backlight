#!/usr/bin/env ruby

@lb = File::read("/sys/class/backlight/intel_backlight/brightness").strip.to_i

@lb ||= 300

def help
	<<-EOF
backlight
Usage: bl [option]
	hight
	low
	max_light
	mix_light
	middle
	[Fixnum]
EOF
end

case ARGV[0]
when "hight"
	@lb += 100
when "low"
	@lb -= 100
when "max_light"
	@lb = 900
when "min_light"
	@lb = 100
when "middle"
	@lb = 500
when /\d+/
	@lb = ARGV[0].to_i
else
	$stdout.puts help
end

if @lb > 900
	@lb = 900
end

if @lb < 100
	@lb = 100
end

`echo #{@lb} > /sys/class/backlight/intel_backlight/brightness`
