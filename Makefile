source := minecraft-avatars.js
target := $(source:.js=.min.js)
demo_target := demo/$(target)

all : $(target) $(demo_target)

$(target) : $(source)
	uglifyjs --unsafe -o $@ $<

$(demo_target) : $(target)
	cp -a $< $@

.PHONY : check
check ::
	jslint $(source)

.PHONY : clean
clean ::
	$(RM) $(target) $(demo_target)
