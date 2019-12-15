SVG = evolution-of-girls-with-weapons.svg
PNG = $(SVG).png
JPEG = $(SVG).jpg
WEBP = $(SVG).webp

WIDTH = 600

all: $(PNG) $(JPEG) $(WEBP)

$(PNG): $(SVG)
	inkscape --export-png=$@ --export-width=400 $<

$(JPEG): $(PNG)
	gm convert $< $@

$(WEBP): $(PNG)
	gm convert $< $@

upload: all
	rsync --progress -v -a --inplace $(PNG) $(WEBP) $(SVG) *.jpg $(__HOMEPAGE_REMOTE_PATH)/evolution-of-girls-with-weapons/
