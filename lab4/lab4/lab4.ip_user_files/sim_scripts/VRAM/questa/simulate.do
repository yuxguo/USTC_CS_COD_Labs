onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib VRAM_opt

do {wave.do}

view wave
view structure
view signals

do {VRAM.udo}

run -all

quit -force
