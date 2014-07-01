

all: 
	menhir -v parser.mly
	ocamllex lexer.mll
	ocamlc -c parser.mli
	ocamlc -c parser.ml
	ocamlc -c lexer.ml
	ocamlc -c main.ml
	ocamlc parser.cmo lexer.cmo main.cmo
mail.ml: 

lexer.ml: lexer.mll
	ocamllex lexer.mll

parser.ml: parser.mly ast.ml
	menhir -v parser.mly

parser.mli: parser.ml
parser.cmo: parser.cmi
parser.cmx: parser.cmi

lexer.cmo: parser.cmo
lexer.cmx: parser.cmx

%.cmi: %.mli
	$(OCC) $(OCC_FLAGS) $<

%.cmo: %.ml
	$(OCC) $(OCC_FLAGS) $<

%.cmx: %.ml
	$(OCCOPT) $(OCC_FLAGS) $<

clean:
	rm -f parser.ml parser.mli parser.automaton lexer.ml *.cmi *.cmo *.cmx *.o *.output *~
