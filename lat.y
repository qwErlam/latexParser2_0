%{
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <iostream> 
#include <vector>
#include <algorithm>
#include <stack>
#include <regex>


std::stack<std::string> begEnd;
std::map <std::string,std::vector<std::string>> hardComands;
std::map <std::string,std::vector<std::string>> hardComandsSquare; 
std::vector <std::pair <std::string, std::string>> specChar;

std::vector <std::string> commands = {
    "\\AE",                              
    "\\AtBeginDocument",                 
    "\\AtEndDocument",                   
    "\\AtEndOfClass",                    
    "\\AtEndOfPackage",                  
    "\\CheckCommand",                    
    "\\CurrentOption",                   
    "\\DeclareFixedFont",                
    "\\DeclareFontShape",                
    "\\DeclareMathVersion",              
    "\\DeclareOldFontCommand",           
    "\\DeclareRobustCommand",            
    "\\DeclareSymbolFont",               
    "\\DeclareSymbolFontAlphabet",       
    "\\DeclareTextFontCommand",          
    "\\DeclareTextSymbol",               
    "\\Huge",                            
    "\\LARGE",                           
    "\\LRmulticolcolumns",               
    "\\MakeLowercase",                   
    "\\MinusOne",                        
    "\\NeedsTeXFormat",                  
    "\\OT",                              
    "\\OptionNotUsed",                   
    "\\PackageError",                    
    "\\PackageInfo",                     
    "\\PackageWarning",                  
    "\\PassOptionsToClass",              
    "\\PassOptionsToPackage",            
    "\\ProvidesClass",                   
    "\\ProvidesFile",                    
    "\\RLmulticolcolumns",               
    "\\SetMathAlphabet",                 
    "\\SetSymbolFont",                   
    "\\ShellEscape",                     
    "\\TBerror",                         
    "\\Umathcode",                       
    "\\UseRawInputEncoding",             
    "\\XeTeX",                           
    "\\XeTeXintercharclass",             
    "\\XeTeXinterchartoks",              
    "\\advance",                         
    "\\ae",                              
    "\\alpha",                           
    "\\alphld",                          
    "\\babel",                           
    "\\baz",                             
    "\\begingroup",                      
    "\\bfdefault",                       
    "\\catcode",                         
    "\\catcodetable",                    
    "\\cfgguide",                        
    "\\check",                           
    "\\color",                           
    "\\columnsep",                       
    "\\crcr",                            
    "\\csname",                          
    "\\dimen",                           
    "\\docolaction",                     
    "\\ds",                              
    "\\edef",                            
    "\\eg",                              
    "\\encodingdefault",                 
    "\\endcsname",                       
    "\\enddocument",                     
    "\\endfoo",                          
    "\\evensidemargin",                  
    "\\expandafter",                     
    "\\f",                               
    "\\familydefault",                   
    "\\filename",                        
    "\\font",                            
    "\\fontencoding",                    
    "\\fontfamily",                      
    "\\fontseries",                      
    "\\fontshape",                       
    "\\fontsize",                        
    "\\foobar",                          
    "\\footnotesize",                    
    "\\footskip",                        
    "\\getfirstgithubissue",             
    "\\headheight",                      
    "\\headlinecolor",                   
    "\\headsep",                         
    "\\hfill",                           
    "\\hidewidth",                       
    "\\hmode",                           
    "\\href",                            
    "\\huge",                            
    "\\idxentry",                        
    "\\ifhmode",                         
    "\\inputencoding",                   
    "\\isanitize",                       
    "\\it",                              
    "\\itdefault",                       
    "\\lablst",                          
    "\\lablstclass",                     
    "\\lablstfile",                      
    "\\lablstpackages",                  
    "\\langle",                          
    "\\lessdot",                         
    "\\linespread",                      
    "\\lowercase",                       
    "\\luatexluafunction",               
    "\\marginpar",                       
    "\\marginparsep",                    
    "\\marginparwidth",                  
    "\\math",                            
    "\\mathalpha",                       
    "\\mathbin",                         
    "\\mathclose",                       
    "\\mathop",                          
    "\\mathopen",                        
    "\\mathord",                         
    "\\mathpunct",                       
    "\\mathrel",                         
    "\\maxbalancingoverflow",            
    "\\mddefault",                       
    "\\meaning",                         
    "\\modguide",                        
    "\\newattribute",                    
    "\\newcatcodetable",                 
    "\\newinsert",                       
    "\\newlabel",                        
    "\\newluafunction",                  
    "\\newmark",                         
    "\\newwhatsit",                      
    "\\newwrite",                        
    "\\nobreak",                         
    "\\nobreakspace",                    
    "\\nopagecolor",                     
    "\\normalcolor",                     
    "\\normalit",                        
    "\\normalshape",                     
    "\\nstex",                           
    "\\null",                            
    "\\ooalign",                         
    "\\oplus",                           
    "\\overfullrule",                    
    "\\paperheight",                     
    "\\paperwidth",                      
    "\\par",                             
    "\\paragraph",                       
    "\\parindent",                       
    "\\parshape",                        
    "\\parskip",                         
    "\\penalty",                         
    "\\phantom",                         
    "\\picturechar",                     
    "\\pkg",                             
    "\\protect",                         
    "\\protected",                       
    "\\ps",                              
    "\\qquad",                           
    "\\raise",                           
    "\\relax",                           
    "\\reserveinserts",                  
    "\\rmdefault",                       
    "\\romannumeral",                    
    "\\rotatebox",                       
    "\\scdefault",                       
    "\\scriptfont",                      
    "\\scriptsize",                      
    "\\selectfont",                      
    "\\seriesdefault",                   
    "\\setattribute",                    
    "\\setbox",                          
    "\\sf",                              
    "\\sfcode",                          
    "\\sfdefault",                       
    "\\shapedefault",                    
    "\\sl",                              
    "\\sldefault",                       
    "\\spacedallcaps",                   
    "\\spacedlowsmallcaps",              
    "\\sscdefault",                      
    "\\sscshape",                        
    "\\ssf",                             
    "\\string",                          
    "\\strip",                           
    "\\strut",                           
    "\\subsubsection",                   
    "\\sum",                             
    "\\swdefault",                       
    "\\swshape",                         
    "\\tabularx",                        
    "\\textcommaabove",                  
    "\\textfont",                        
    "\\textssc",                         
    "\\textsw",                          
    "\\textulc",                         
    "\\tf",                              
    "\\thanks",                          
    "\\tiny",                            
    "\\today",                           
    "\\topmargin",                       
    "\\topskip",                         
    "\\tracefloats",                     
    "\\tracefloatsoff",                  
    "\\tracefloatvals",                  
    "\\ttdefault",                       
    "\\twocolumn",                       
    "\\ulcdefault",                      
    "\\ulcshape",                        
    "\\unitlength",                      
    "\\unsetattribute",                  
    "\\unskip",                          
    "\\updefault",                       
    "\\uppercase",                       
    "\\usefont",                         
    "\\vbox",                            
    "\\vskip",                           
    "\\write",                           
    "\\xspace",                          
    "\\xtxHanGlue",                      
    "\\xtxHanSpace",                     
    "\\z",                                
    "\\maketitle",
    "\\bf",
    "\\lang",
    "\\large",
    "\\t",
    "\\title",
    "\\ne",
    "\\leq",
    "\\noindent",
    "\\textsection",
    "\\displaystyle",
    "\\normalsize",
    "\\item",
    "\\Lambda",
    "\\LaTeX",
    "\\glqq",
    "\\grqq",
    "\\ldots",
    "\\emph",
    "\\tableofcontents",
    "\\newpage",
    "\\centering",
    "\\AND",                                         
    "\\AW",                                          
    "\\AmSLaTeX",                                    
    "\\BooleanFalse",                                
    "\\BooleanTrue",                                 
    "\\Box",                                         
    "\\CheckSum",                                    
    "\\ConTeXt",                                     
    "\\DH",                                          
    "\\DJ",                                          
    "\\DeclareDocumentCommand",                      
    "\\DeclareDocumentEnvironment",                  
    "\\DeclareExpandableDocumentCommand",            
    "\\DeclareMathAlphabet",                         
    "\\DeclareMathDelimiter",                        
    "\\DeclareMathSizes",                            
    "\\DeclareMathSymbol",                           
    "\\DeclareOption",                               
    "\\DeclareTextCommandDefault",                   
    "\\Diamond",                                     
    "\\DoSomethingJustWithMandatoryArgument",        
    "\\DoSomethingWithBothArguments",                
    "\\DoSomethingWithStar",                         
    "\\DoSomethingWithoutStar",                      
    "\\EndIncludeInRelease",                         
    "\\ExecuteOptions",                              
    "\\GetDocumentCommandArgSpec",                   
    "\\GetDocumentEnvironmentArgSpec",               
    "\\Gp",                                          
    "\\IfBooleanF",                                  
    "\\IfBooleanT",                                  
    "\\IfBooleanTF",                                 
    "\\IfNoValueF",                                  
    "\\IfNoValueT",                                  
    "\\IfNoValueTF",                                 
    "\\IfValueF",                                    
    "\\IfValueT",                                    
    "\\IfValueTF",                                   
    "\\InputIfFileExists",                           
    "\\InternalFunctionOfThreeArguments",            
    "\\Join",                                        
    "\\LaTeXGcomp",                                  
    "\\LaTeXNews",                                   
    "\\LaTeXWcomp",                                  
    "\\LaTeXbook",                                   
    "\\LaTeXcomp",                                   
    "\\LaTeXe",                                      
    "\\Large",                                       
    "\\LoadClass",                                   
    "\\LoadClassWithOptions",                        
    "\\MakeUppercase",                               
    "\\MappingFunction",                             
    "\\NFSS",                                        
    "\\NG",                                          
    "\\NOT",                                         
    "\\NewDocumentCommand",                          
    "\\NewDocumentEnvironment",                      
    "\\NewExpandableDocumentCommand",                
    "\\OE",                                          
    "\\OR",                                          
    "\\OnlyDescription",                             
    "\\PSNFSS",                                      
    "\\ProcessList",                                 
    "\\ProcessOptions",                              
    "\\ProcessorA",                                  
    "\\ProcessorB",                                  
    "\\ProvideDocumentCommand",                      
    "\\ProvideDocumentEnvironment",                  
    "\\ProvideExpandableDocumentCommand",            
    "\\ProvidesPackage",                             
    "\\Ref",                                         
    "\\RenewDocumentCommand",                        
    "\\RenewDocumentEnvironment",                    
    "\\RenewExpandableDocumentCommand",              
    "\\RequirePackage",                              
    "\\RequirePackageWithOptions",                   
    "\\ReverseBoolean",                              
    "\\Rightarrow",                                  
    "\\SLiTeX",                                      
    "\\SS",                                          
    "\\ShowDocumentCommandArgSpec",                  
    "\\ShowDocumentEnvironmentArgSpec",              
    "\\SomeDocumentCommand",                         
    "\\SplitArgument",                               
    "\\SplitList",                                   
    "\\TH",                                          
    "\\TeX",                                         
    "\\TextOrMath",                                  
    "\\TrimSpaces",                                  
    "\\Vref",                                        
    "\\acro",                                        
    "\\addpenalty",                                  
    "\\backmatter",                                  
    "\\backslash",                                   
    "\\baselineskip",                                
    "\\begin",                                       
    "\\bezier",                                      
    "\\bfseries",                                    
    "\\bm",                                          
    "\\boldmath",                                    
    "\\boldsymbol",                                  
    "\\bullet",                                      
    "\\c",                                           
    "\\cal",                                         
    "\\cdot",                                        
    "\\chapter",                                     
    "\\cite",                                        
    "\\clearpage",                                   
    "\\clsguide",                                    
    "\\columnbreak",                                 
    "\\columnwidth",                                 
    "\\copyright",                                   
    "\\cs",                                          
    "\\ctan",                                        
    "\\ctanhttp",                                    
    "\\cyrguide",                                    
    "\\d",                                           
    "\\def",                                         
    "\\depth",                                       
    "\\dh",                                          
    "\\dj",                                          
    "\\document",                                    
    "\\documentstyle",                               
    "\\dots",                                        
    "\\dump",                                        
    "\\eTeX",                                        
    "\\else",                                        
    "\\elvbf",                                       
    "\\elvrm",                                       
    "\\elvsf",                                       
    "\\em",                                          
    "\\end",                                         
    "\\endtabularx",                                 
    "\\enlargethispage",                             
    "\\ensuremath",                                  
    "\\errorcontextlines",                           
    "\\example",                                     
    "\\extrafloats",                                 
    "\\fauxguillemet",                               
    "\\fi",                                          
    "\\fmbox",                                       
    "\\fmtversion",                                  
    "\\fnsymbol",                                    
    "\\fntguide",                                    
    "\\foo",                                         
    "\\framebox",                                    
    "\\frenchspacing",                               
    "\\frontmatter",                                 
    "\\fsf",                                         
    "\\gg",                                          
    "\\graphpaper",                                  
    "\\guillemotleft",                               
    "\\guillemotright",                              
    "\\guilsinglleft",                               
    "\\guilsinglright",                              
    "\\hbox",                                        
    "\\height",                                      
    "\\heightof",                                    
    "\\hologo",                                      
    "\\hspace",                                      
    "\\hyphenation",                                 
    "\\hyphenchar",                                  
    "\\i",                                           
    "\\ifcase",                                      
    "\\ifx",                                         
    "\\ignorespacesafterend",                        
    "\\include",                                     
    "\\includegraphics",                             
    "\\index",                                       
    "\\iniTeX",                                      
    "\\input",                                       
    "\\itshape",                                     
    "\\jobname",                                     
    "\\kern",                                        
    "\\l",                                           
    "\\label",                                       
    "\\labelformat",                                 
    "\\language",                                    
    "\\latex",                                       
    "\\lccode",                                      
    "\\leadsto",                                     
    "\\left",                                        
    "\\lefthyphenmin",                               
    "\\let",                                         
    "\\lhd",                                         
    "\\line",                                        
    "\\lineskiplimit",                               
    "\\linewidth",                                   
    "\\listfiles",                                   
    "\\ll",                                          
    "\\long",                                        
    "\\looseness",                                   
    "\\m",                                           
    "\\mainmatter",                                  
    "\\makeatletter",                                
    "\\makeatother",                                 
    "\\makebox",                                     
    "\\mark",                                        
    "\\mathbf",                                      
    "\\mathcal",                                     
    "\\mathchardef",                                 
    "\\mathcode",                                    
    "\\mathit",                                      
    "\\mathnormal",                                  
    "\\mathring",                                    
    "\\mathrm",                                      
    "\\mathsf",                                      
    "\\mathtt",                                      
    "\\maxof",                                       
    "\\mbox",                                        
    "\\mdseries",                                    
    "\\meta",                                        
    "\\mho",                                         
    "\\mid",                                         
    "\\minof",                                       
    "\\multicolumn",                                 
    "\\newXeTeXintercharclass",                      
    "\\newblock",                                    
    "\\newenvironment",                              
    "\\newline",                                     
    "\\newmarks",                                    
    "\\newmathalphabet",                             
    "\\ng",                                          
    "\\nobreakdashes",                               
    "\\nocorr",                                      
    "\\nofiles",                                     
    "\\normalfont",                                  
    "\\normalsfcodes",                               
    "\\o",                                           
    "\\oddsidemargin",                               
    "\\oe",                                          
    "\\oldstylenums",                                
    "\\package",                                     
    "\\pagebreak",                                   
    "\\parbox",                                      
    "\\part",                                        
    "\\path",                                        
    "\\patterns",                                    
    "\\providecommand",                              
    "\\qbezier",                                     
    "\\quad",                                        
    "\\quotedblbase",                                
    "\\quotesinglbase",                              
    "\\r",                                           
    "\\raggedright",                                 
    "\\raisefirstsection",                           
    "\\ref",                                         
    "\\reftextbefore",                               
    "\\reftextfaraway",                              
    "\\renewcommand",                                
    "\\renewenvironment",                            
    "\\rhd",                                         
    "\\right",                                       
    "\\righthyphenmin",                              
    "\\rm",                                          
    "\\rmfamily",                                    
    "\\rule",                                        
    "\\samepage",                                    
    "\\savebox",                                     
    "\\sbox",                                        
    "\\scshape",                                     
    "\\section",                                     
    "\\setcounter",                                  
    "\\setlength",                                   
    "\\setlongtables",                               
    "\\settodepth",                                  
    "\\settoheight",                                 
    "\\settototalheight",                            
    "\\settowidth",                                  
    "\\sffamily",                                    
    "\\showkeyslabelformat",                         
    "\\showtokens",                                  
    "\\slash",                                       
    "\\slshape",                                     
    "\\small",                                       
    "\\sqrt",                                        
    "\\sqsubset",                                    
    "\\sqsupset",                                    
    "\\ss",                                          
    "\\subsection",                                  
    "\\suppressfloats",                              
    "\\tabularnewline",                              
    "\\tenbf",                                       
    "\\tenrm",                                       
    "\\tensf",                                       
    "\\textasciicircum",                             
    "\\textasciitilde",                              
    "\\textbackslash",                               
    "\\textbar",                                     
    "\\textbf",                                      
    "\\textbrokenbar",                               
    "\\textbullet",                                  
    "\\textcommabelow",                              
    "\\textcompwordmark",                            
    "\\textcurrency",                                
    "\\textemdash",                                  
    "\\textendash",                                  
    "\\texteuro",                                    
    "\\textexclamdown",                              
    "\\textgreater",                                 
    "\\textheight",                                  
    "\\textit",                                      
    "\\textless",                                    
    "\\textmd",                                      
    "\\textnormal",                                  
    "\\textonehalf",                                 
    "\\textonequarter",                              
    "\\textperiodcentered",                          
    "\\textquestiondown",                            
    "\\textquotedbl",                                
    "\\textquotedblleft",                            
    "\\textquotedblright",                           
    "\\textquoteleft",                               
    "\\textquoteright",                              
    "\\textregistered",                              
    "\\textrm",                                      
    "\\textsc",                                      
    "\\textsf",                                      
    "\\textsl",                                      
    "\\textsubscript",                               
    "\\textsuperscript",                             
    "\\textthreequarters",                           
    "\\texttrademark",                               
    "\\texttt",                                      
    "\\textup",                                      
    "\\textvisiblespace",                            
    "\\textwidth",                                   
    "\\th",                                          
    "\\thicklines",                                  
    "\\thinlines",                                   
    "\\times",                                       
    "\\totalheight",                                 
    "\\totalheightof",                               
    "\\traceoff",                                    
    "\\traceon",                                     
    "\\tracingall",                                  
    "\\tt",                                          
    "\\ttfamily",                                    
    "\\twlbf",                                       
    "\\twlrm",                                       
    "\\twlsf",                                       
    "\\typein",                                      
    "\\typeout",                                     
    "\\typesetnormalchapter",                        
    "\\typesetstarchapter",                          
    "\\uccode",                                      
    "\\unlhd",                                       
    "\\unrhd",                                       
    "\\upshape",                                     
    "\\url",                                         
    "\\usebox",                                      
    "\\usrguide",                                    
    "\\v",                                           
    "\\value",                                       
    "\\verb",                                        
    "\\vfill",                                       
    "\\vpagerefnum",                                 
    "\\width",                                       
    "\\wlog",                                        
    "\\zzz"                                         
};

std::vector <std::string> specCommand = {
    "\\langle",
    "\\cdot",
    "\\ast",
    "\\rangle",
    "\\forall",
    "\\all",
    "\\leftarrow",
    "\\displaystyle",
    "\\over",
    "\\pm",
    "\\pi",
    "\\displaystyle",
    "\\ne",
    "\\bigg",
    "\\big",
    "\\leq",
    "\\geq",
    "\\sqrt",
    "\\in",
    "\\beta",
    "\\max",
    "\\min",
    "\\seq",
    "\\lbrace",
    "\\ldots",
    "\\rbrace",
    "\\mathbf",
    "\\tilde",
    "\\times",
    "\\bullet",
    "\\backslash",
    "\\mid",
    "\\bf",
    "\\vdots",
    "\\text",
    "\\meta",
    "\\alpha",  
    "\\cdot3",  
    "\\cdot4",  
    "\\cdot9",  
    "\\int",    
    "\\mathcal",
    "\\mathit", 
    "\\mathrm", 
    "\\mathsf", 
    "\\mathtt", 
    "\\ne0",    
    "\\oplus",  
    "\\prod",   
    "\\sin",    
    "\\star",   
    "\\sum",    
    "\\to"     

    
};

std::vector <std::string> v_usepackage = {
    "amssymb",
    "mathtext",
    "physics",
    "graphicx",
    "babel",
    "csquotes",
    "xy",
    "inputenc",
    "setspace",
    "amsmath",
    "fontenc",
    "url",
    "lmodern",
    "hologo",
    "ifthen",
    "lablstpackages",
    "mflogo",
    "multicol",
    "tabularx",
    "textcomp",
    "varioref"

};

std::vector <std::string> v_usepackageS = {
    "russian",
    "english",
    "all",
    "german",
    "utf8",
    "koi8",
    "T2A",
    "T1",
    "T2",
    "T3",
    "r"
};

std::vector <std::string> v_docclass = {
    "article",
    "report",
    "book",
    "letter",
    "slides",
    "beamer",
    "ltnews",
    "ltxguide"
}; 

std::vector <std::string> v_docclassS = {
    "12pt", // TODO
    "letterpaper",
    "twoside",
    "a5paper",
    "a4paper",
    "b5paper",
    "executivepaper",
    "legalpaper"
};

std::vector <std::string> outside_com = {
    "\\title",
    "\\author",
    "\\date",
    "\\thanks",
    "\\ConTeXt",
    "\\DeclareTextCommandDefault",
    "\\acro",
    "\\def",
    "\\else",
    "\\ifx",
    "\\makeatletter",
    "\\makeatother",
    "\\nofiles",
    "\\providecommand",
    "\\setlength",
    "\\textcommabelow",
    "\\CTAN",                
    "\\LuaTeX",              
    "\\MiKTeX",              
    "\\TL",                  
    "\\XeTeX",               
    "\\addtolength",         
    "\\cls",                 
    "\\crcr",                
    "\\csname",              
    "\\egroup",              
    "\\endcsname",           
    "\\endgroup",            
    "\\expandafter",         
    "\\fi",                  
    "\\fontdimen",           
    "\\foo",                 
    "\\gdef",                
    "\\getfirstgithubissue", 
    "\\hangindent",          
    "\\hidewidth",           
    "\\href",                
    "\\hyphenation",         
    "\\idxentry",            
    "\\iffalse",             
    "\\indexentry",          
    "\\input",               
    "\\isanitize",           
    "\\let",                 
    "\\newsavebox",          
    "\\nonfrenchspacing",    
    "\\null",                
    "\\par",                 
    "\\parindent",           
    "\\pdfTeX",              
    "\\pkg",                 
    "\\raggedright",         
    "\\rangle",              
    "\\relax",               
    "\\textcommaabove",      
    "\\textheight",          
    "\\thispage",            
    "\\tolerance",           
    "\\topmargin",           
    "\\ttfamily",            
    "\\undefined",           
    "\\vbadness",            
    "\\vskip"               
}; 

extern FILE *yyin;
extern int line;
int yyerror (std::string error);

#define YYERROR_VERBOSE 1
extern int yylex();

enum ERROR
{
    ALL_GOOD,
    ERROR_HARD,
    ERROR_SIMPL, 
    ERROR_SPEC,
    ERROR_LEX,
    ERROR_USEPACK,
    ERROR_OUT,
    ERROR_DOCCLASS  
};

struct S_ERROR
{
    S_ERROR (ERROR _num,std::string strErr = ""){
        num = _num;
        str_error = strErr;
    }
    std::string str_error;
    ERROR num; 
};

int printError(struct S_ERROR* yep);
%}


%union
{
    char str[255];
    int num;
    struct S_ERROR* erro;
}

%start state
%token <str>    DOCCLASS USEPAC BEGINDOC COMMAND INSQUAREBR INCURLYBR NEWCOM SPECTEXT ENDDOC MATHSPEC COMMANDINER TITLE END ERROR 
%token <num>    LBRACE RBRACE LSK RSK

%%
state: lasttreatment state
        | lasttreatment

lasttreatment:
    docclass usepall BEGINDOC maintext ENDDOC {}
    | docclass usepall commandoutpall BEGINDOC maintext ENDDOC {}
    | docclass commandoutpall BEGINDOC maintext ENDDOC {}
    | docclass BEGINDOC maintext ENDDOC {}
    | END {
        if(begEnd.size()!=0)
            std::cout << "ERROR:\t Expected end " << std::endl;
        else
            std::cout << "Succes " << std::endl;
        exit(1);
    }

newcomm: 
    NEWCOM LBRACE COMMANDINER RBRACE LBRACE COMMANDINER LBRACE INCURLYBR RBRACE RBRACE{
        

    }
    | NEWCOM LBRACE COMMANDINER RBRACE LBRACE COMMANDINER RBRACE{
        std::cout << " IN VECTOR - COMMANDS ---" << $3 << std::endl;
        std::cout << " PROVERIT' IN COMMANDS ---" << $6 << std::endl;
    }


maintext: main maintext 
    | main 

main:
    newcomm
    | MATHSPEC {
        if (std::find(specCommand.begin(),specCommand.end(), std::string($1)) == specCommand.end()){
            S_ERROR *errMsg = new S_ERROR(ERROR_SPEC,std::string($1));
            printError(errMsg);
        } 
    }
    | helpmeall
    | LBRACE helpmeall RBRACE 
    | COMMAND  LBRACE helpmeall RBRACE {
        std::string com($1);
        S_ERROR *errMsg = new S_ERROR(ERROR_HARD,std::string($1));//TODO
        if (hardComands.find(com) != hardComands.end()) { }
        else {
            printError(errMsg);
        }
    }
    | COMMAND LBRACE RBRACE
    {
        if (std::find(commands.begin(),commands.end(), std::string($1)) == commands.end()){
            S_ERROR *errMsg = new S_ERROR(ERROR_SIMPL,std::string($1));
            printError(errMsg);
        }
    }
    | COMMAND {  
        if (std::find(commands.begin(),commands.end(), std::string($1)) == commands.end()){
            S_ERROR *errMsg = new S_ERROR(ERROR_SIMPL,std::string($1));
            printError(errMsg);
        } 
    }

    | COMMAND LBRACE INCURLYBR RBRACE {
        std::string com($1);
        std::string incom($3);
        S_ERROR *errMsg = new S_ERROR(ERROR_HARD,com + "\t" + incom);
        if (hardComands.find(com) != hardComands.end()) {
            auto tmpVect = hardComands.at(com);
            if(tmpVect.size()){
                if(com.compare("\\begin") == 0){
                    begEnd.push(incom);
                   // std::cout<<"push \t"<<incom<<std::endl;   
                }
                else if (com.compare("\\end") == 0){
                    if(begEnd.size()==0){
                        S_ERROR *errMsg1 = new S_ERROR(ERROR_HARD, com + "\t" + incom);
                        printError(errMsg1);
                    }
                    if (incom.compare(begEnd.top()) == 0){
                       // std::cout<<"pop \t"<<begEnd.top()<<std::endl;
                        begEnd.pop();

                    }
                    else {
                        //S_ERROR *errMsg1 = new S_ERROR(ERROR_HARD,"end command not found for " + incom);
                        std::cout<<"ERROR:\tCant find \\end{" << incom<< "}"<<std::endl;
                        //printError(errMsg1);
                        exit(-1);
                    }
                }
                if (std::find(tmpVect.begin(),tmpVect.end(), std::string($3)) == tmpVect.end()) {
                    printError(errMsg);
                }
            }
        }
        else {
            printError(errMsg);
        }{}
        
    }
    | NEWCOM
    | BEGINDOC
    | DOCCLASS
    | USEPAC
    | INCURLYBR {}
    | INSQUAREBR {}
    | LSK {}
    | RSK {}
    | LBRACE
    | RBRACE



commandoutpall : commandout commandoutpall
    |commandout

commandout:
    COMMAND LSK INSQUAREBR RSK LBRACE helpmeall RBRACE
    |COMMAND LBRACE helpmeall RBRACE LBRACE helpmeall RBRACE {}
    |COMMAND LBRACE helpmeall RBRACE  { 
        if (std::find(outside_com.begin(),outside_com.end(), std::string($1)) == outside_com.end()){
            S_ERROR *errMsg = new S_ERROR(ERROR_OUT,std::string($1));
            printError(errMsg);
        } 
        
    }
    | COMMAND LBRACE INCURLYBR RBRACE {}
    | COMMAND LBRACE INCURLYBR RBRACE LBRACE INCURLYBR RBRACE {}
    | COMMAND {
         if (std::find(outside_com.begin(),outside_com.end(), std::string($1)) == outside_com.end()){
            S_ERROR *errMsg = new S_ERROR(ERROR_OUT,std::string($1));
            printError(errMsg);
        } 
    }
    | COMMANDINER {
        if (std::find(commands.begin(),commands.end(), std::string($1)) == commands.end()){
            S_ERROR *errMsg = new S_ERROR(ERROR_OUT,std::string($1));
            printError(errMsg);
        } 
    }
    | NEWCOM



helpmeall: helpme helpmeall
    |helpme

helpme: 
    INCURLYBR { }
    | COMMANDINER {
        if (std::find(commands.begin(),commands.end(), std::string($1)) == commands.end()){
            S_ERROR *errMsg = new S_ERROR(ERROR_SIMPL,std::string($1));
            printError(errMsg);
        } 
    }
    
docclass: 
    DOCCLASS LSK {}
    | docclass INSQUAREBR {}
    | docclass LSK {}
    | docclass RSK {}
    | DOCCLASS LBRACE {}
    | docclass LBRACE {}
    | docclass INCURLYBR {
        if (std::find(v_docclass.begin(),v_docclass.end(), std::string($2)) == v_docclass.end()){
            S_ERROR *errMsg = new S_ERROR(ERROR_DOCCLASS ,std::string($2));
            printError(errMsg);
        }
    }
    |docclass RBRACE {}



usepall : usep usepall
    |usep

usep: 
    USEPAC LSK { }
    | USEPAC LBRACE
    | usep INSQUAREBR {
        if (std::find(v_usepackageS.begin(),v_usepackageS.end(), std::string($2)) == v_usepackageS.end()){
            S_ERROR *errMsg = new S_ERROR(ERROR_USEPACK ,std::string($2) + "\t\t\t\t\t[]");
            printError(errMsg);
        }
    }
    | usep RSK {}
    | usep LBRACE {}
    | usep INCURLYBR {
        if (std::find(v_usepackage.begin(),v_usepackage.end(), std::string($2)) == v_usepackage.end()){
            S_ERROR *errMsg = new S_ERROR(ERROR_USEPACK ,std::string($2) + "\t\t\t\t\t{}");
            printError(errMsg);
        }
    }
    |usep RBRACE {}

;
%%


int printError(struct S_ERROR* yep)
{
    if (yep->num == 1 ) {
        yyerror("WARNING: Unknown complex command - " + yep->str_error);
    }
    else if (yep->num == 2 ) {
        yyerror("WARNING: Unknown command - " + yep->str_error );
    }
    else if (yep->num == 3) {
        yyerror("WARNING: Unknown MATH command - " + yep->str_error );
    }
    else if (yep->num == 4){
        yyerror("Lexical error - " + yep->str_error);
    }
    else if (yep->num == 5){
        yyerror("WARNING: Unknown usepackage arguments - " + yep->str_error);
    }
    else if (yep->num == 6){
        yyerror("WARNING: Unknown global command - " + yep->str_error);
    }
    else if (yep->num == 5){
        yyerror("WARNING: Unknown docclass arguments - " + yep->str_error);
    }

    return 0;
}

int  yyerror(std::string s)
{
    fflush(stdout);
    std::cout<<s<<"\t in line: "<< line<<std::endl;
    return 0;
}

int main(int argc, char *argv[]){
    std::vector<std::string> emptyVect = {};
    yyin = fopen(argv[1], "r");
    
    std::vector <std::string> v_usepackage = {"amssymb","mathtext","physics","graphicx", "babel"};
    std::vector <std::string> v_begin = {"equation","verbatim","twice","minipage","description","decl","footnotesize","small","latexonly","flushright","htmlonly","verbatim", "citations","document","abstract","figure","em","verse","quotation","quote","enumerate","cases","gather","otherlanguage","tabular","equation","","center","itemize","large","flushleft","thebibliography","picture","lrbox","filecontents","verbatim","equation","lrbox", "verbatim",""};
    std::vector <std::string> v_documentclass = {"article","book","letter"};
    std::vector <std::string> v_languare = {"german","russian", "english"};
    hardComands["\\selectlanguage"] = v_languare;
    hardComands["\\foreignlanguage"] = v_languare;
    hardComands["\\begin"] = v_begin; hardComands["\\end"] = v_begin;
    hardComands["\\usepackage"] = v_usepackage;
    hardComands["\\author"]; hardComands["\\section"];
    hardComands["\\subsection"]; hardComands["\\subchapter"];
    hardComands["\\paragraph"]; hardComands["\\textbf"];
    hardComands["\\textit"]; hardComands["\\textsc"];
    hardComands["\\markright"]; hardComands["\\markboth"];
    hardComands["\\pagenumbering"]; hardComands["\\emph"];
    hardComands["\\mbox"]; hardComands["\\footnote"];
    hardComands["\\setcounter"]; hardComands["\\over"];
    hardComands["\\displaystyle"]; hardComands["\\sqrt"];
    hardComands["\\caption"]; hardComands["\\ref"];
    hardComands["\\label"]; hardComands["\\bar"];
    hardComands["\\filesection"];
    hardComands["\\def"];
    hardComands["\\InputIfFileExists"];
    hardComands["\\texttt"];
    hardComands["\\textsf"];
    hardComands["\\m"] = {"file","number","text","cmd","pos","inner-pos","option-list","class-name","release-date","package-name","N","package","command","num","default","file-contents","width","size","ENC","code","date","dimen","encoding","factorfamily","family","font-switches","format-name","math-alph","math-switch","option-name","options-list","release-info","series","shape","skip","slot","slot-1","slot-2","sym-font","sym-font-1","sym-font-2","sym-font-i","symbol","text-switch","type","version","factor","","",""};
    hardComands["\\fsf"];
    hardComands["\\input"];
    hardComands["\\file"];
    hardComands["\\url"];
    hardComands["\\AtEndOfClass"];
    hardComands["\\AtBeginDocument"];
    hardComands["\\everyjob"];
    hardComands["\\batchfile"];
    hardComands["\\parbox"];
    hardComands["\\latex"];
    hardComands["\\vspace"];
    hardComands["\\DeclareMathSizes"];
    hardComands["\\IncludeInRelease"];
    hardComands["\\rightskip"];
    hardComands["\\email"];
    hardComands["\\href"];
    hardComands["\\cite"];
    hardComands["\\NEWfeature"];
    hardComands["\\NEWdescription"];
    hardComands["\\framebox"];
    hardComands["\\newsavebox"];
    hardComands["\\put"];
    hardComands["\\bibitem"];
    hardComands["\\newblock"];
    hardComands["\\fbox"];
    hardComands["\\meta"] = {"environment","function","code","list","token","number","tokens","argument","beg-code","end-code","cmd","token1","token2","token3","default","defaults","command","encoding","","","","","","","","",""};
    hardComands["\\marg"] = {"environment","function","code","list","token","number","tokens","argument","beg-code","end-code","cmd","token1","token2","token3","default","defaults","processor","","","","","","","","","",""};
    hardComands["\\cs"] = {"NewDocumentEnvironment","NewDocumentCommand","protect","omit","ArgumentSpecification","ProcessorB","ProcessorA","BooleanTrue","BooleanFalse","ifblank","IfNoValueF","IfNoValueT","IfNoValueTF","newcommand","begin","end","addvspace","flushbottom","chapter","typesetnormalchapter","IfBooleanTF","New","Renew","Provide","Declare","RenewDocumentCommand","ProvideDocumentCommand","DeclareDocumentCommand","TrimSpaces","long","verb","SplitList","ProcessList","showhyphens","binom","genfrac","","IncludeInRelease","addtoreset","columnbreak","counterwithin","counterwithout","newcounter","removefromreset","","","","","","","","","","","","","","",""};
    hardComands["\\arg"] = {"text","letters","size","length-cmd","class","beg-def","end-def","environment","function","code","cmd","list","number","tokens","arg","","beg-code","end-code","env","width","definition","file-name","package-name","class-name","style","packages","file","num","baselineskip","encoding","factor","family","font-switches","format-name","math-alph","math-switch","option-name","options-list","series","shape","slot","slot-1","slot-2","sym-font","sym-font-1","sym-font-2","symbol","text-switch","type","version","","",""};
    hardComands["\\PassOptionsToClass"] = {"a4paper"};
    hardComands["\\ExecuteOptions"] = {"dvips","textures","dvips","textures",""};
    hardComands["\\pageref"] = {"fsfcode","addrs"};
    hardComands["\\fontencoding"] = {"T1"};
    hardComands["\\newenvironment"] = {"texteqn","fmpage","pageref","","","","","","","","","","","","","","",""};
    hardComands["\\foo"] = {"sm","arg1","arg2","arg3","om","","","","",""};
    hardComands["\\package"];
    hardComands["\\bm"] = {"f"};
    hardComands["\\u"] = {"a"};
    hardComands["\\NewDocumentEnvironment"] = {"twice"};
    hardComands["\\pkg"];
    hardComands["\\hologo"] = {"XeTeX","LuaTeX","LuaLaTeX","XeLaTeX","pdfTeX","eTeX","","","","","","","","","","",""};
    hardComands["\\class"] = {"slides"};
    hardComands["\\LoadClassWithOptions"] = {"\article","article","class-name"};
    hardComands["\\foobar"] = {"arg1","arg2","arg3",""};
    hardComands["\\IfNoValueTF"] = {"-NoValue-"};
    hardComands["\\widthof"] = {"text"};
    hardComands["\\heightof"] = {"text"};
    hardComands["\\depthof"] = {"text"};
    hardComands["\\r"] = {"text", "o"};
    hardComands["\\k"] = {"text"};
    hardComands["\\example"] = {"BBB"};
    hardComands["\\subsubsection"] = {"Tools"};
    hardComands["\\LaTeX"] = {"a","1",""};
    hardComands["\\LaTeXe"] = {"a"};
    hardComands["\\hspace"] = {"4em","-1em","12pt","1em","","","","","","",""};
    hardComands["\\oarg"] = {"default", "num","width","pos","height","inner-pos","options","option-list","release-date","placement","vertical-space","options-list","release-info",""};
    hardComands["\\baz"] = {"o",""};
    hardComands["\\chapter"] = {"title",""};
    hardComands["\\verb"] = {"and"};
    hardComands["\\textcircled"] = {"text","a"};
    hardComands["\\bezier"] = {"N"};
    hardComands["\\ExecuteOptions"] = {"oldlfont","newlfont","latexrelease","dvips","textures","color","ifthen",""};
    hardComands["\\RequirePackage"] = {"oldlfont","newlfont","latexrelease","dvips","textures","color","ifthen",""};
    hardComands["\\cal"] = {"A"};
    hardComands["\\extrafloats"];
    hardComands["\\vrefrange"] = {"eq-first"};
    hardComands["\\DeclareFixedFont"] = {""};
    hardComands["\\DeclareMathAlphabet"] = {""};
    hardComands["\\DeclareMathSymbol"] = {""};
    hardComands["\\DeclareMathVersion"] = {"normal"};
    hardComands["\\DeclareOldFontCommand"] = {""};
    hardComands["\\DeclareOption"] = {"a4paper","baz","code","draft","dvips","foo","green","landscape","onecolumn","option","twoside",""};
    hardComands["\\DeclareSymbolFont"] = {"largesymbols","letters","operators","symbols",""};
    hardComands["\\DeclareSymbolFontAlphabet"] = {""};
    hardComands["\\DeclareTextFontCommand"] = {""};
    hardComands["\\LoadClass"] = {"article"};
    hardComands["\\MakeUppercase"] = {""};
    hardComands["\\NeedsTeXFormat"] = {"LaTeX2e"};
    hardComands["\\PassOptionsToPackage"] = {""};
    hardComands["\\ProvidesClass"] = {"article","class-name","minimal","neplet","smplnews",""};
    hardComands["\\ProvidesFile"] = {""};
    hardComands["\\ProvidesPackage"] = {"ifthen","latexsym","package","",""};
    hardComands["\\RequirePackageWithOptions"] = {"graphics","package",""};
    hardComands["\\SetMathAlphabet"] = {""};
    hardComands["\\SetSymbolFont"] = {"letters","operators"};
    hardComands["\\URL"] = {""};
    hardComands["\\acro"] = {"CD-ROM","TUG","ascii",""};
    hardComands["\\begidn"] = {"figure"};
    hardComands["\\bibcite"] = {""};
    hardComands["\\c"] = {"g","G"};
    hardComands["\\directlua"] = {""};
    hardComands["\\ds"] = {""};
    hardComands["\\ends"] = {"document"};
    hardComands["\\expandafter"] = {""};
    hardComands["\\fontfamily"] = {"phv","ptm",""};
    hardComands["\\fontseries"] = {"b"};
    hardComands["\\fontshape"] = {"sl"};
    hardComands["\\"] = {""};
    hardComands["\\fontsize"] = {"12"};
    hardComands["\\hbox"] = {""};
    //hardComands["\\hologo"] = {"eTeX",""};
    hardComands["\\ip"] = {"A"};
    hardComands["\\k"];
    hardComands["\\lablst"] = {"toc"};
    hardComands["\\mathbf"] = {"math","vec",""};
    hardComands["\\mathcal"] = {"math"};
    hardComands["\\mathit"] = {"math"};
    hardComands["\\mathnormal"] = {"math"};
    hardComands["\\mathrm"] = {"math"};
    hardComands["\\mathsf"] = {"math","max"};
    hardComands["\\mathtt"] = {"math"};
    hardComands["\\mathversion"] = {"bold","version"};
    hardComands["\\multicolumn"];
    hardComands["\\newlabel"] = {""};
    hardComands["\\par"];
    hardComands["\\reasonsection"] = {""};
    hardComands["\\renewcommand"] = {"","oddfoot"};
    hardComands["\\setlength"] = {""};
    hardComands["\\sum"] = {"i"};
    hardComands["\\textcommaabove"];
    hardComands["\\textcommabelow"];
    hardComands["\\typeout"] = {""};
    hardComands["\\"] = {""};
    hardComands["\\"] = {""};
    hardComands["\\"] = {""};





    
    yyparse();
    return 0;
}