LECT_1_OUT=lecture1.pdf
LECT_1_IN=lecture1.tex
TEST_OUT=test.pdf
TEST_IN=test.tex

TEX=latexmk
TEXFLAGS=-pdf -shell-escape

all : $(LECT_1_OUT) $(TEST_OUT)

$(LECT_1_OUT) : $(LECT_1_IN)
	$(TEX) $(TEXFLAGS) -jobname=$(basename $(LECT_1_OUT)) $(LECT_1_IN)

$(TEST_OUT) : $(TEST_IN)
	$(TEX) $(TEXFLAGS) -jobname=$(basename $(TEST_OUT)) $(TEST_IN)

.PHONY: clean

clean:
	latexmk -C
	rm -rf $(LECT_1_OUT)
	rm -rf $(basename $(LECT_1_OUT)).nav
	rm -rf $(basename $(LECT_1_OUT)).snm
	rm -rf $(basename $(LECT_1_OUT)).log
	rm -rf $(TEST_OUT)
	rm -rf $(basename $(TEST_OUT)).nav
	rm -rf $(basename $(TEST_OUT)).snm
	rm -rf $(basename $(TEST_OUT)).log

