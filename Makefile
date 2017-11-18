all: docImage

docImageSrcs = $(wildcard documentation/images/*.diag)
docImageObjs = $(foreach x, $(basename $(docImageSrcs)), $(x).png)

docImage: $(docImageObjs)

%.png: %.diag
	seqdiag $^ $@


clean:
	rm -f documentation/images/*.png
