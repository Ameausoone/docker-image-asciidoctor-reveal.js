TESTS=$(wildcard slides/*.adoc)
MOST_RECENT=$(shell ls -t output/*.html | head -1)

default: $(patsubst %.adoc,%.html,$(TESTS))

%.html: %.adoc
	asciidoctor -T templates/slim -b revealjs -D output/ $<

clean:
	rm -f output/*.html

serve:
	python2 -m SimpleHTTPServer 8000
