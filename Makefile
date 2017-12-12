all: docImage

docDiagImageSrcs = $(wildcard documentation/images/*.diag)
docDiagImageObjs = $(foreach x, $(basename $(docDiagImageSrcs)), $(x).png)
docDotImageSrcs = $(wildcard documentation/images/*.gv)
docDotImageObjs = $(foreach x, $(basename $(docDotImageSrcs)), $(x).ps)

docImage: $(docDiagImageObjs) $(docDotImageObjs)

%.png: %.diag
	seqdiag $^ $@

%.ps: %.gv
	dot -Tps $^ -o $@

clean:
	rm -f documentation/images/*.png && rm -f documentation/images/*.ps
