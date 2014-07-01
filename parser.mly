%{
(* you can put OCaml helper functions here *)
%}

%token EOF
%token PLUS MINUS STAR SLASH
%token LPAR RPAR
%token <string>IDENTIFIER

%start start             /* the entry point */
%type <unit> start
%%

/* Productions */
start
  :  expr EOF          { };

expr
  :  expr PLUS term    { }
  |  expr MINUS term   { }
  |  term              { };

term
  :  term STAR factor  { }
  |  term SLASH factor { }
  |  factor            { };

factor
  :  IDENTIFIER        { }
  |  LPAR expr RPAR    { };
