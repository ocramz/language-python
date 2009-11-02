-----------------------------------------------------------------------------
-- |
-- Module      : Language.Python.Common.PrettyToken 
-- Copyright   : (c) 2009 Bernie Pope 
-- License     : BSD-style
-- Maintainer  : bjpop@csse.unimelb.edu.au
-- Stability   : experimental
-- Portability : ghc
--
-- Lexical tokens for the Python lexer. 
-- See: <http://www.python.org/doc/3.0/reference/lexical_analysis.html>
-----------------------------------------------------------------------------

module Language.Python.Common.PrettyToken where

import Language.Python.Common.Token
import Language.Python.Common.Pretty
-- import Language.Python.Common.SrcLocation (SrcSpan (..), SrcLocation (..), Location (location), Span(getSpan))
import qualified Data.ByteString.Char8 as BS (ByteString, unpack)
-- import Data.Data

instance Pretty Token where
   pretty tok = 
      case tok of
        IndentToken {} -> text "indentation"
        DedentToken {} -> text "dedentation"
        NewlineToken {} -> text "end of line" 
        CommentToken { token_comment = str } -> 
           text "comment:" <+> prettyPrefix 5 str
        IdentifierToken { token_identifier = str } ->
           text "identifier:" <+> text str 
        StringToken { token_string = str } -> 
           text "string:" <+> quotes (prettyPrefix 5 str)
        ByteStringToken { token_byte_string = str } ->
           text "byte string:" <+> quotes (prettyPrefix 5 (BS.unpack $ str))
        IntegerToken { token_integer = i } ->
           text "integer:" <+> pretty i
        FloatToken { token_double = d } ->
           text "floating point number:" <+> pretty d
        ImaginaryToken { token_double = d } ->
           text "imaginary number:" <+> pretty d
        DefToken {} -> text "def" 
        WhileToken {} -> text "while"
        IfToken {} -> text "if"
        TrueToken {} -> text "True"
        FalseToken {} -> text "False"
        ReturnToken {} -> text "return"
        TryToken {} -> text "try"
        ExceptToken {} -> text "except"
        RaiseToken {} -> text "raise"
        InToken {} -> text "in" 
        IsToken {} -> text "is" 
        LambdaToken {} -> text "lambda" 
        ClassToken {} -> text "class"                       
        FinallyToken {} -> text "finally"                     
        NoneToken {} -> text "None"
        ForToken {} -> text "for"
        FromToken {} -> text "from"
        GlobalToken {} -> text "global"
        WithToken {} -> text "with"
        AsToken {} -> text "as"
        ElifToken {} -> text "elif"
        YieldToken {} -> text "yield"
        AssertToken {} -> text "assert"
        ImportToken {} -> text "import"
        PassToken {} -> text "pass"
        BreakToken {} -> text "break"
        ContinueToken {} -> text "continue"
        DeleteToken {} -> text "delete"
        ElseToken {} -> text "else"
        NotToken {} -> text "not"
        AndToken {} -> text "and"
        OrToken {} -> text "or"
        NonLocalToken {} -> text "nonlocal"
        PrintToken {} -> text "print"
        ExecToken {} -> text "exec"
        AtToken {} -> text "at"
        LeftRoundBracketToken {} -> text "("
        RightRoundBracketToken {} -> text ")"
        LeftSquareBracketToken {} -> text "["
        RightSquareBracketToken {} -> text "]"
        LeftBraceToken {} -> text "{"
        RightBraceToken {} -> text "}"
        DotToken {} -> text "." 
        CommaToken {} -> text ","
        SemiColonToken {} -> text ";"
        ColonToken {} -> text ":"
        EllipsisToken {} -> text "..."
        RightArrowToken {} -> text "->"
        AssignToken {} -> text "="
        PlusAssignToken {} -> text "+="
        MinusAssignToken {} -> text "-="
        MultAssignToken {} -> text "*="
        DivAssignToken {} -> text "/="
        ModAssignToken {} -> text "%="
        PowAssignToken {} -> text "**="
        BinAndAssignToken {} -> text "&="
        BinOrAssignToken {} -> text "|="
        BinXorAssignToken {} -> text "^="
        LeftShiftAssignToken {} -> text "<<="
        RightShiftAssignToken {} -> text ">>="
        FloorDivAssignToken {} -> text "//="
        BackQuoteToken {} -> text "` (back quote)"
        PlusToken {} -> text "+"
        MinusToken {} -> text "-"
        MultToken {} -> text "*" 
        DivToken {} -> text "/"
        GreaterThanToken {} -> text ">"
        LessThanToken {} -> text "<"
        EqualityToken {} -> text "=="
        GreaterThanEqualsToken {} -> text ">="
        LessThanEqualsToken {} -> text "<="
        ExponentToken {} -> text "**" 
        BinaryOrToken {} -> text "|"
        XorToken {} -> text "^"
        BinaryAndToken {} -> text "&"
        ShiftLeftToken {} -> text "<<"
        ShiftRightToken {} -> text ">>"
        ModuloToken {} -> text "%" 
        FloorDivToken {} -> text "//"
        TildeToken {} -> text "~"
        NotEqualsToken {} -> text "!="
        NotEqualsV2Token {} -> text "<>"
        EOFToken {} -> text "end of input"