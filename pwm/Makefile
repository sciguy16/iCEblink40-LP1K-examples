PROJ = pwm
TOP = pwm
PCF = iceblink40_vq100.pcf
DEVICE = lp1k
PACKAGE = qn84
ICEBURN = /usr/bin/iCEburn

all: $(PROJ).rpt $(PROJ).bin

%.json: %.v
	yosys -p 'synth_ice40 -top $(TOP) -json $@' $<

%.asc: %.json $(PCF)
	nextpnr-ice40 --$(DEVICE) --package $(PACKAGE) --pcf $(PCF) --asc $@ --json $(PROJ).json

%.bin: %.asc
	icepack $< $@

%.rpt: %.asc
	icetime -d $(DEVICE) -mtr $@ $<

prog: $(PROJ).bin
	iCEburn -v -e -w $<

clean:
	rm -f $(PROJ).json $(PROJ).asc $(PROJ).bin $(PROJ).rpt

.PHONY: all prog clean

