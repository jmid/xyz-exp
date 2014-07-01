let lexbuf = Lexing.from_channel stdin in
try
  let _cst = Parser.start Lexer.token lexbuf in
  ()
with
  | Failure msg         -> print_endline ("Failure --- " ^ msg)
  | Parsing.Parse_error -> print_endline ("Parse error")
  | End_of_file         -> print_endline "Parse error: unexpected end of string"
