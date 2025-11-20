%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

FILE *errors_file = NULL;     // changed name
FILE *token_output = NULL;
%}

%option yylineno
%option noyywrap

DIGIT           [0-9]
LETTER          [a-zA-Z_]
IDENTIFIER      {LETTER}({LETTER}|{DIGIT})*
INTEGER         {DIGIT}+
FLOAT           {DIGIT}+\.{DIGIT}+
EXPONENTIAL     ({INTEGER}|{FLOAT})[eE][+-]?{INTEGER}
STRING          \"[^\"]*\"
CHAR            \'[^\']\'

%%

"Aaghaaz-e-Ghazal" {
    printf("Line %d | MAIN keyword detected\n", yylineno);
    fprintf(token_output, "Line %d | MAIN keyword detected\n", yylineno);
}

"Anjaam-e-Naghma" {
    printf("Line %d | RETURN keyword detected\n", yylineno);
    fprintf(token_output, "Line %d | RETURN keyword detected\n", yylineno);
}

"Lehja-e-Hisaab" {
    printf("Line %d | INT keyword detected\n", yylineno);
    fprintf(token_output, "Line %d | INT keyword detected\n", yylineno);
}

"Bole-e-Mohabbat" {
    printf("Line %d | STRING keyword detected\n", yylineno);
    fprintf(token_output, "Line %d | STRING keyword detected\n", yylineno);
}

"Saaya-e-Khayaal" {
    printf("Line %d | VOID keyword detected\n", yylineno);
    fprintf(token_output, "Line %d | VOID keyword detected\n", yylineno);
}

"Sachchi-Sadaa" {
    printf("Line %d | BOOLEAN keyword detected\n", yylineno);
    fprintf(token_output, "Line %d | BOOLEAN keyword detected\n", yylineno);
}

"Toota-Hua-Alfaaz" {
    printf("Line %d | BREAK keyword detected\n", yylineno);
    fprintf(token_output, "Line %d | BREAK keyword detected\n", yylineno);
}

"Raqs-e-Jaari" {
    printf("Line %d | CONTINUE keyword detected\n", yylineno);
    fprintf(token_output, "Line %d | CONTINUE keyword detected\n", yylineno);
}

"Suno-Aey-Dilbar" {
    printf("Line %d | PRINT keyword detected\n", yylineno);
    fprintf(token_output, "Line %d | PRINT keyword detected\n", yylineno);
}

"Gar-Yun-Ho" {
    printf("Line %d | IF keyword detected\n", yylineno);
    fprintf(token_output, "Line %d | IF keyword detected\n", yylineno);
}

"Warna-Yun-Na-Ho" {
    printf("Line %d | WHILE keyword detected\n", yylineno);
    fprintf(token_output, "Line %d | WHILE keyword detected\n", yylineno);
}

"Naghma-e-Haq" {
    printf("Line %d | TRUE literal detected\n", yylineno);
    fprintf(token_output, "Line %d | TRUE literal detected\n", yylineno);
}

"Saaz-e-Fareb" {
    printf("Line %d | FALSE literal detected\n", yylineno);
    fprintf(token_output, "Line %d | FALSE literal detected\n", yylineno);
}

"ishq+" {
    printf("Line %d | ADD operator detected\n", yylineno);
    fprintf(token_output, "Line %d | ADD operator detected\n", yylineno);
}

"gham-" {
    printf("Line %d | SUB operator detected\n", yylineno);
    fprintf(token_output, "Line %d | SUB operator detected\n", yylineno);
}

"%rubaa%" {
    printf("Line %d | EQUAL operator detected\n", yylineno);
    fprintf(token_output, "Line %d | EQUAL operator detected\n", yylineno);
}

"junoon*" {
    printf("Line %d | MUL operator detected\n", yylineno);
    fprintf(token_output, "Line %d | MUL operator detected\n", yylineno);
}

"::bahaar::" {
    printf("Line %d | BLOCK_START detected\n", yylineno);
    fprintf(token_output, "Line %d | BLOCK_START detected\n", yylineno);
}

";khamoshi;" {
    printf("Line %d | BLOCK_END detected\n", yylineno);
    fprintf(token_output, "Line %d | BLOCK_END detected\n", yylineno);
}

"!aasar!" {
    printf("Line %d | TERMINATOR detected\n", yylineno);
    fprintf(token_output, "Line %d | TERMINATOR detected\n", yylineno);
}

"(nazar" {
    printf("Line %d | Left Parenthesis detected\n", yylineno);
    fprintf(token_output, "Line %d | Left Parenthesis detected\n", yylineno);
}

"khwaab)" {
    printf("Line %d | Right Parenthesis detected\n", yylineno);
    fprintf(token_output, "Line %d | Right Parenthesis detected\n", yylineno);
}

",sukoon," {
    printf("Line %d | COMMA detected\n", yylineno);
    fprintf(token_output, "Line %d | COMMA detected\n", yylineno);
}

{EXPONENTIAL} {
    printf("Line %d | EXP literal: %s\n", yylineno, yytext);
    fprintf(token_output, "Line %d | EXP literal: %s\n", yylineno, yytext);
}

{FLOAT} {
    printf("Line %d | FLOAT literal: %s\n", yylineno, yytext);
    fprintf(token_output, "Line %d | FLOAT literal: %s\n", yylineno, yytext);
}

{INTEGER} {
    printf("Line %d | INT literal: %s\n", yylineno, yytext);
    fprintf(token_output, "Line %d | INT literal: %s\n", yylineno, yytext);
}

{STRING} {
    printf("Line %d | STRING literal: %s\n", yylineno, yytext);
    fprintf(token_output, "Line %d | STRING literal: %s\n", yylineno, yytext);
}

{CHAR} {
    printf("Line %d | CHAR literal: %s\n", yylineno, yytext);
    fprintf(token_output, "Line %d | CHAR literal: %s\n", yylineno, yytext);
}

{IDENTIFIER} {
    printf("Line %d | IDENTIFIER: %s\n", yylineno, yytext);
    fprintf(token_output, "Line %d | IDENTIFIER: %s\n", yylineno, yytext);
}

[ \t\r]+        {}

\n              {}

"//".*          {}

. {
    fprintf(stderr, "Line %d | ERROR: Illegal character '%s'\n", yylineno, yytext);
    fprintf(errors_file, "Line %d | ERROR: Illegal character '%s'\n", yylineno, yytext);
}

%%

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        exit(1);
    }

    yyin = fopen(argv[1], "r");
    if (yyin == NULL) {
        fprintf(stderr, "Cannot open input file %s\n", argv[1]);
        exit(1);
    }

    token_output = fopen("tokens.txt", "w");
    errors_file = fopen("errors.txt", "w");

    if (token_output == NULL || errors_file == NULL) {
        fprintf(stderr, "Error creating output files\n");
        exit(1);
    }

    fprintf(errors_file, "--- Lexical Errors Log ---\n");

    printf("\nStarting Lexical Analysis...\n\n");
    yylex();
    printf("\nLexical Analysis Complete.\n");

    long error_pos = ftell(errors_file);
    if (error_pos == (long)strlen("--- Lexical Errors Log ---\n")) {
        fprintf(errors_file, "No lexical errors found.\n");
    }

    fclose(yyin);
    fclose(token_output);
    fclose(errors_file);


    return 0;
}
