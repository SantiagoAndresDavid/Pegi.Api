»
iC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\AcademicPrograms\AcademicProgramResponse.cs
	namespace 	
Api
 
. 
Controllers 
. 
AcademicPrograms *
;* +
public 
record #
AcademicProgramResponse %
(% &
string 

Code 
, 
string 

Name 
) 
; ë
lC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\AcademicPrograms\AcademicProgramsController.cs
	namespace 	
Api
 
. 
Controllers 
. 
AcademicPrograms *
;* +
[

 
ApiController

 
]

 
[ 
Route 
( 
$str 
) 
] 
public 
class &
AcademicProgramsController '
:( )
ControllerBase* 8
{ 
private 
readonly "
AcademicProgramService +#
_academicProgramService, C
;C D
public 
&
AcademicProgramsController %
(% &"
AcademicProgramService "
academicProgramService 5
)5 6
{ #
_academicProgramService 
=  !"
academicProgramService" 8
;8 9
} 
[ 
HttpGet 
( 
$str 
) 
] 
public 

ActionResult 
GetAcademicProgram *
(* +
[+ ,
	FromRoute, 5
]5 6
string7 =
code> B
)B C
{ 
AcademicProgram 
? 
academicProgram (
=) *#
_academicProgramService #
.# $*
SearchProfessorAcademicProgram$ B
(B C
codeC G
)G H
;H I
if 

( 
academicProgram 
== 
null #
)# $
{ 	
return 

BadRequest 
( 
new 
Response 
< 
Void !
>! "
(" #
$str# @
)@ A
)A B
;B C
} 	
return!! 
Ok!! 
(!! 
new!! 
Response!! 
<!! #
AcademicProgramResponse!! 6
>!!6 7
(!!7 8
academicProgram!!8 G
.!!G H
Adapt!!H M
<!!M N#
AcademicProgramResponse!!N e
>!!e f
(!!f g
)!!g h
)!!h i
)!!i j
;!!j k
}"" 
[$$ 
HttpGet$$ 
($$ 
$str$$ %
)$$% &
]$$& '
public%% 

ActionResult%% "
GetAllAcademicPrograms%% .
(%%. /
)%%/ 0
{&& 
try'' 
{(( 	
List)) 
<)) 
AcademicProgram))  
>))  !
academicPrograms))" 2
=))3 4#
_academicProgramService** '
.**' (
GetAll**( .
(**. /
)**/ 0
;**0 1
return++ 
Ok++ 
(++ 
new++ 
Response++ "
<++" #
List++# '
<++' (
AcademicProgram++( 7
>++7 8
>++8 9
(++9 :
academicPrograms++: J
)++J K
)++K L
;++L M
},, 	
catch-- 
(-- 
	Exception-- 
e-- 
)-- 
{.. 	
return// 

BadRequest// 
(// 
new// !
Response//" *
<//* +
Void//+ /
>/// 0
(//0 1
e//1 2
.//2 3
Message//3 :
)//: ;
)//; <
;//< =
}00 	
}33 
}44 Ì
iC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\AcademicPrograms\AcademicProgrmasRequest.cs
	namespace 	
Api
 
. 
Controllers 
. 
AcademicPrograms *
;* +
public 
record #
AcademicProgrmasRequest %
(% &
)& '
;' (¸ 
TC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\Auth\AuthController.cs
	namespace 	
Api
 
. 
Controllers 
. 
Auth 
; 
[

 
ApiController

 
]

 
[ 
Route 
( 
$str 
) 
] 
public 
class 
AuthController 
: 
ControllerBase ,
{ 
private 
readonly 
UsersService !
_usersService" /
;/ 0
private 
readonly 
AuthService  
_authService! -
;- .
private 
readonly 
PeopleService "
_peopleService# 1
;1 2
public 

AuthController 
( 
UsersService &
usersService' 3
,3 4
AuthService5 @
authServiceA L
,L M
PeopleServiceN [
peopleService\ i
)i j
{ 
_usersService 
= 
usersService $
;$ %
_authService 
= 
authService "
;" #
_peopleService 
= 
peopleService &
;& '
} 
[ 
HttpPost 
( 
$str 
) 
] 
public 

ActionResult 
Login 
( 
[ 
FromBody '
]' (
LoginRequest) 5
loginRequest6 B
)B C
{ 
try 
{ 	
var 
( 
message 
, 
	foundUser #
)# $
=% &
_authService' 3
.3 4
LogIn4 9
(9 :
loginRequest: F
.F G
NameG K
,K L
loginRequest 
. 
Password %
)% &
;& '
	foundUser   
.   
Person   
=   
_peopleService   -
.  - .
SearchPerson  . :
(  : ;
	foundUser  ; D
.  D E
PersonDocument  E S
!  S T
)  T U
;  U V
string!! 
token!! 
=!! 
TokenGenerator!! )
.!!) *
GenerateTokenJwt!!* :
(!!: ;
	foundUser!!; D
)!!D E
;!!E F
return"" 
Ok"" 
("" 
token"" 
)"" 
;"" 
}## 	
catch$$ 
($$ 
AuthException$$ 
e$$ 
)$$ 
{%% 	
return&& 

BadRequest&& 
(&& 
new&& !
Response&&" *
<&&* +
Void&&+ /
>&&/ 0
(&&0 1
e&&1 2
.&&2 3
Message&&3 :
)&&: ;
)&&; <
;&&< =
}'' 	
}(( 
[** 
HttpPost** 
(** 
$str** 
)** 
]** 
public++ 

ActionResult++ 
SignUp++ 
(++ 
[++  
FromBody++  (
]++( )
SingUpRequest++* 7
signUpRequest++8 E
)++E F
{,, 
var-- 
user-- 
=-- 
signUpRequest--  
.--  !
Adapt--! &
<--& '
User--' +
>--+ ,
(--, -
)--- .
;--. /
if.. 

(.. 
_usersService.. 
... 
SaveUser.. "
(.." #
user..# '
)..' (
)..( )
return// 
Ok// 
(// 
new// 
Response// "
<//" #
Void//# '
>//' (
(//( )
$str//) C
,//C D
false00 
)00 
)00 
;00 
return11 

BadRequest11 
(11 
new22 
Response22 
<22 
Void22 
>22 
(22 
$str22 >
)22> ?
)22? @
;22@ A
}33 
}44 û
RC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\Auth\LoginRequest.cs
	namespace 	
Api
 
. 
Controllers 
. 
Auth 
; 
public 
record 
LoginRequest 
( 
string !
Name" &
,& '
string( .
Password/ 7
)7 8
;8 9Í
SC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\Auth\LoginResponse.cs
	namespace 	
Api
 
. 
Controllers 
. 
Auth 
; 
public 
record 
LoginResponse 
( 
string "
Name# '
,' (
string( .
?. /
Role0 4
,4 5
PersonResponse5 C
PersonD J
)J K
;K L’
SC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\Auth\SingUpRequest.cs
	namespace 	
Api
 
. 
Controllers 
. 
Auth 
; 
public 
record 
SingUpRequest 
( 
string "
Name# '
,' (
string( .
Password/ 7
,7 8
string8 >
Role? C
)C D
;D E‰
cC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\Experience\CreateExperienceRequest.cs
	namespace 	
Api
 
. 
Controllers 
. 
People  
;  !
public 
record #
CreateExperienceRequest %
(% &
string 

Code 
, 
string 

Institution 
, 
DateTime 
	StartDate 
, 
DateTime		 
EndDate		 
,		 
string

 


CitiesCode

 
,

 
string 


PeopleCode 
, 
string 

Position 
) 
; ˇ
aC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\Experience\ExperiencesController.cs
	namespace 	
Api
 
. 
Controllers 
. 
People  
;  !
[		 
ApiController		 
]		 
[

 
Route

 
(

 
$str

 
)

 
]

 
public 
class !
ExperiencesController "
:# $
ControllerBase% 3
{ 
private 
readonly 
ExperienceService &
_experienceService' 9
;9 :
public 
!
ExperiencesController  
(  !
ExperienceService! 2
experienceService3 D
)D E
{ 
_experienceService 
= 
experienceService .
;. /
} 
[ 
HttpPost 
] 
public 

ActionResult 
RegisterExperience *
(* +
[ 	
FromBody	 
] #
CreateExperienceRequest *#
createExperienceRequest+ B
)B C
{ 
try 
{ 	
var 

experience 
= #
createExperienceRequest 4
.4 5
Adapt5 :
<: ;

Experience; E
>E F
(F G
)G H
;H I
_experienceService 
. 
saveExperience -
(- .

experience. 8
)8 9
;9 :
return 
Ok 
( 
new 
Response 
< 
Void !
>! "
(" #
$str# L
,L M
false 
) 
) 
; 
} 	
catch   
(   
PersonExeption   
exeption   &
)  & '
{!! 	
return"" 

BadRequest"" 
("" 
new"" !
Response""" *
<""* +
Void""+ /
>""/ 0
(""0 1
exeption""1 9
.""9 :
Message"": A
)""A B
)""B C
;""C D
}## 	
}$$ 
[&& 
HttpGet&& 
(&& 
$str&& 
)&& 
]&& 
public'' 

ActionResult'' 

GetStudies'' "
(''" #
[''# $
	FromRoute''$ -
]''- .
string''/ 5
document''6 >
)''> ?
{(( 
try)) 
{** 	
var++ 
experiences++ 
=++ 
_experienceService++ 0
.++0 1
SearchExperiences++1 B
(++B C
document++C K
)++K L
;++L M
if,, 
(,, 
experiences,, 
.,, 
Count,, !
<=,," $
$num,,% &
),,& '
{-- 
return.. 

BadRequest.. !
(..! "
new// 
Response//  
<//  !
Void//! %
>//% &
(//& '
$str//' J
)//J K
)//K L
;//L M
}00 
return11 
Ok11 
(11 
new22 
Response22 
<22 
List22 !
<22! "
ExperiencesResponse22" 5
>225 6
>226 7
(227 8
experiences33 
.33  
Adapt33  %
<33% &
List33& *
<33* +
ExperiencesResponse33+ >
>33> ?
>33? @
(33@ A
)33A B
)33B C
)33C D
;33D E
}44 	
catch55 
(55 
ExperienceExeption55 !
e55" #
)55# $
{66 	
return77 

BadRequest77 
(77 
new77 !
Response77" *
<77* +
Void77+ /
>77/ 0
(770 1
e771 2
.772 3
Message773 :
)77: ;
)77; <
;77< =
}88 	
}99 
}:: ⁄
_C:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\Experience\ExperiencesResponse.cs
	namespace 	
Api
 
. 
Controllers 
. 
People  
;  !
public 
record 
ExperiencesResponse !
(! "
string 

Code 
, 
string 

Institution 
, 
DateTime 
	StartDate 
, 
DateTime 
EndDate 
, 
string 


CitiesCode 
, 
string		 


PeopleCode		 
,		 
string

 

Position

 
) 
; á
lC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\HistorialProposal\HisotrialProposalResponse.cs
	namespace 	
Api
 
. 
Controllers 
. 
HistorialProposal +
;+ ,
public 
record %
HisotrialProposalResponse '
(' (
int( +
?+ ,
Code- 1
,1 2$
ProposalFeedBackResponse2 J
?J K
ProposalFeedBackL \
)\ ]
;] ^Ú5
nC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\HistorialProposal\HistorialProposalController.cs
	namespace 	
Api
 
. 
Controllers 
. 
HistorialProposal +
;+ ,
[

 
ApiController

 
]

 
[ 
Route 
( 
$str 
) 
] 
public 
class '
HistorialProposalController (
:) *
ControllerBase+ 9
{ 
private 
readonly "
HistoryProposalService +#
_historyProposalService, C
;C D
private 
readonly #
ProposalFeedBackService ,$
_proposalFeedBackService- E
;E F
private 
readonly 
ProposalService $
_proposalService% 5
;5 6
public 
'
HistorialProposalController &
(& '"
HistoryProposalService "
historyProposalService 5
,5 6#
ProposalFeedBackService #
proposalFeedBackService  7
,7 8
ProposalService 
proposalService '
)' (
{ #
_historyProposalService 
=  !"
historyProposalService" 8
;8 9$
_proposalFeedBackService  
=! "#
proposalFeedBackService# :
;: ;
_proposalService 
= 
proposalService *
;* +
} 
[ 
HttpPost 
( 
$str !
)! "
]" #
[ 
	Authorize 
( 
Roles 
= 
$str  
)  !
]! "
public 

ActionResult 
RegisterFeedback (
(( )
[ 	
FromBody	 
] #
ProposalFeedBackRequest *#
proposalFeedBackRequest+ B
)B C
{   
try!! 
{"" 	
var## 
feedBack## 
=## #
proposalFeedBackRequest## 2
.##2 3
Adapt##3 8
<##8 9
ProposalFeedBack##9 I
>##I J
(##J K
)##K L
;##L M
feedBack$$ 
.$$ 
Code$$ 
=$$ 
Random$$ "
.$$" #
Shared$$# )
.$$) *
Next$$* .
($$. /
)$$/ 0
;$$0 1$
_proposalFeedBackService%% $
.%%$ % 
SaveProposalFeedBack%%% 9
(%%9 :
feedBack%%: B
)%%B C
;%%C D
HistoryProposals&& 
historialProposal&& .
=&&/ 0
new'' 
HistoryProposals'' $
(''$ %
feedBack''% -
.''- .
Code''. 2
,''2 3#
proposalFeedBackRequest(( +
.((+ ,
ProposalCode((, 8
)((8 9
;((9 :
historialProposal)) 
.)) 
Code)) "
=))# $
Random))% +
.))+ ,
Shared)), 2
.))2 3
Next))3 7
())7 8
)))8 9
;))9 :#
_historyProposalService** #
.**# $
SaveProposalHistory**$ 7
(**7 8
historialProposal**8 I
)**I J
;**J K
_proposalService++ 
.++  
UpdateStatusProposal++ 1
(++1 2
historialProposal,, !
.,,! "
ProposalCode,," .
,,,. /
historialProposal-- !
.--! "
ProposalFeedBack--" 2
.--2 3
Status--3 9
)--9 :
;--: ;
return.. 
Ok.. 
(.. 
new// 
Response// 
<// %
HisotrialProposalResponse// 6
>//6 7
(//7 8
historialProposal00 %
.00% &
Adapt00& +
<00+ ,%
HisotrialProposalResponse00, E
>00E F
(00F G
)00G H
)00H I
)00I J
;00J K
}11 	
catch22 
(22 
PersonExeption22 
exeption22 &
)22& '
{33 	
return44 

BadRequest44 
(44 
new44 !
Response44" *
<44* +
Void44+ /
>44/ 0
(440 1
exeption441 9
.449 :
Message44: A
)44A B
)44B C
;44C D
}55 	
}66 
[88 
HttpGet88 
(88 
$str88 
)88 
]88 
public99 

ActionResult99 
GetHistoryProposals99 +
(99+ ,
[99, -
	FromRoute99- 6
]996 7
string998 >
proposalCode99? K
)99K L
{:: 
try;; 
{<< 	
List== 
<== 
HistoryProposals== !
>==! "
historyProposals==# 3
===4 5#
_historyProposalService>> '
.>>' (!
SearchHistoryProposal>>( =
(>>= >
proposalCode>>> J
)>>J K
;>>K L
foreach?? 
(?? 
var?? 
historyProposal?? (
in??) +
historyProposals??, <
)??< =
{@@ 
historyProposalAA 
.AA  
ProposalFeedBackAA  0
=AA1 2$
_proposalFeedBackServiceBB ,
.BB, -#
GetProposalFeedBackCodeBB- D
(BBD E
historyProposalCC '
.CC' ( 
PorposalFeedBackCodeCC( <
)CC< =
;CC= >
}DD 
ifEE 
(EE 
historyProposalsEE  
.EE  !
CountEE! &
<=EE' )
$numEE* +
)EE+ ,
{FF 
returnGG 

BadRequestGG !
(GG! "
newHH 
ResponseHH  
<HH  !
VoidHH! %
>HH% &
(HH& '
$strII H
)IIH I
)III J
;IIJ K
}JJ 
returnLL 
OkLL 
(LL 
newMM 
ResponseMM 
<MM 
ListMM !
<MM! "%
HisotrialProposalResponseMM" ;
>MM; <
>MM< =
(MM= >
historyProposalsNN $
.NN$ %
AdaptNN% *
<NN* +
ListNN+ /
<NN/ 0%
HisotrialProposalResponseNN0 I
>NNI J
>NNJ K
(NNK L
)NNL M
)NNM N
)NNN O
;NNO P
}OO 	
catchPP 
(PP 
ExperienceExeptionPP !
ePP" #
)PP# $
{QQ 	
returnRR 

BadRequestRR 
(RR 
newRR !
ResponseRR" *
<RR* +
VoidRR+ /
>RR/ 0
(RR0 1
eRR1 2
.RR2 3
MessageRR3 :
)RR: ;
)RR; <
;RR< =
}SS 	
}TT 
}UU ˇ
kC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\HistorialProposal\HistorialProposalRequest.cs
	namespace 	
Api
 
. 
Controllers 
. 
HistorialProposal +
;+ ,
public 
record $
HistorialProposalRequest &
(& '
int' *
?* + 
PorposalFeedBackCode, @
,@ A
stringA G
?G H
ProposalCodeI U
)U V
;V Wˇ
jC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\HistorialProposal\ProposalFeedBackRequest.cs
	namespace 	
Api
 
. 
Controllers 
. 
HistorialProposal +
;+ ,
public 
record #
ProposalFeedBackRequest %
(% &
string& ,
?, -
Comment. 5
,5 6
string 

?
 
Status 
, 
DateTime 
? 
Date "
," #
string# )
?) *
ProposalCode+ 7
)7 8
;8 9ˆ
kC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\HistorialProposal\ProposalFeedBackResponse.cs
	namespace 	
Api
 
. 
Controllers 
. 
HistorialProposal +
;+ ,
public 
record $
ProposalFeedBackResponse &
(& '
int' *
?* +
Code, 0
,0 1
string2 8
?8 9
Comment: A
,A B
string 

?
 
Status 
, 
DateTime 
? 
Date "
)" #
;# $‹5
lC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\HistorialProyect\HistorialProyectController.cs
	namespace		 	
Api		
 
.		 
Controllers		 
.		 
HistorialProyect		 *
;		* +
[ 
ApiController 
] 
[ 
Route 
( 
$str 
) 
] 
public 
class &
HistorialProyectController '
:( )
ControllerBase* 8
{ 
private 
readonly "
ProyectFeedBackService +#
_proyectFeedBackService, C
;C D
private 
readonly !
HistoryProyectService *"
_historyProyectService+ A
;A B
private 
readonly 
ProyectService #
_proyectService$ 3
;3 4
public 
&
HistorialProyectController %
(% &"
ProyectFeedBackService "
proyectFeedBackService 5
,5 6!
HistoryProyectService !
historyProyectService 3
,3 4
ProyectService 
proyectService %
)% &
{ #
_proyectFeedBackService 
=  !"
proyectFeedBackService" 8
;8 9"
_historyProyectService 
=  !
historyProyectService! 6
;6 7
_proyectService 
= 
proyectService (
;( )
} 
[ 
HttpPost 
( 
$str !
)! "
]" #
[ 
	Authorize 
( 
Roles 
= 
$str  
)  !
]! "
public 

ActionResult 
RegisterFeedback (
(( )
[   	
FromBody  	 
]   "
ProyectFeedbackRequest   )"
proyectFeedbackRequest  * @
)  @ A
{!! 
try"" 
{## 	
var$$ 
feedBack$$ 
=$$ "
proyectFeedbackRequest$$ 1
.$$1 2
Adapt$$2 7
<$$7 8
ProyectFeedBack$$8 G
>$$G H
($$H I
)$$I J
;$$J K
feedBack%% 
.%% 
Code%% 
=%% 
Random%% "
.%%" #
Shared%%# )
.%%) *
Next%%* .
(%%. /
)%%/ 0
;%%0 1#
_proyectFeedBackService&& #
.&&# $
SaveProyectFeedBack&&$ 7
(&&7 8
feedBack&&8 @
)&&@ A
;&&A B
HistoryProyect'' 
historialProyect'' +
='', -
new(( 
HistoryProyect(( "
(((" #
feedBack((# +
.((+ ,
Code((, 0
,((0 1"
proyectFeedbackRequest)) *
.))* +
ProyectCode))+ 6
)))6 7
;))7 8
historialProyect** 
.** 
Code** !
=**" #
Random**$ *
.*** +
Shared**+ 1
.**1 2
Next**2 6
(**6 7
)**7 8
;**8 9"
_historyProyectService++ "
.++" #
SaveProyectlHistory++# 6
(++6 7
historialProyect++7 G
)++G H
;++H I
_proyectService,, 
.,, 
UpdateStatusProyect,, /
(,,/ 0
historialProyect,,0 @
.,,@ A
ProyectCode,,A L
,,,L M"
proyectFeedbackRequest-- &
.--& '
Status--' -
,--- ."
proyectFeedbackRequest--/ E
.--E F
Score--F K
)--K L
;--L M
return.. 
Ok.. 
(.. 
new// 
Response// 
<// $
HistorialProyectResponse// 5
>//5 6
(//6 7
historialProyect00 $
.00$ %
Adapt00% *
<00* +$
HistorialProyectResponse00+ C
>00C D
(00D E
)00E F
)00F G
)00G H
;00H I
}11 	
catch22 
(22 
PersonExeption22 
exeption22 &
)22& '
{33 	
return44 

BadRequest44 
(44 
new44 !
Response44" *
<44* +
Void44+ /
>44/ 0
(440 1
exeption441 9
.449 :
Message44: A
)44A B
)44B C
;44C D
}55 	
}66 
[88 
HttpGet88 
(88 
$str88 
)88 
]88 
public99 

ActionResult99 
GetHistoryProyect99 )
(99) *
[99* +
	FromRoute99+ 4
]994 5
string996 <
proyectCode99= H
)99H I
{:: 
try;; 
{<< 	
List== 
<== 
HistoryProyect== 
>==  
historyProyects==! 0
===1 2"
_historyProyectService>> &
.>>& ' 
SearchProyectHistory>>' ;
(>>; <
proyectCode>>< G
)>>G H
;>>H I
foreach?? 
(?? 
var?? 
historyProyect?? '
in??( *
historyProyects??+ :
)??: ;
{@@ 
historyProyectAA 
.AA 
ProyectFeedBackAA .
=AA/ 0#
_proyectFeedBackServiceBB +
.BB+ ,"
GetProyectFeedBackCodeBB, B
(BBB C
historyProyectCC &
.CC& '
ProyectFeedBackCodeCC' :
)CC: ;
;CC; <
}DD 
ifEE 
(EE 
historyProyectsEE 
.EE  
CountEE  %
<=EE& (
$numEE) *
)EE* +
{FF 
returnGG 

BadRequestGG !
(GG! "
newHH 
ResponseHH  
<HH  !
VoidHH! %
>HH% &
(HH& '
$strII G
)IIG H
)IIH I
;III J
}JJ 
returnLL 
OkLL 
(LL 
newMM 
ResponseMM 
<MM 
ListMM !
<MM! "$
HistorialProyectResponseMM" :
>MM: ;
>MM; <
(MM< =
historyProyectsNN #
.NN# $
AdaptNN$ )
<NN) *
ListNN* .
<NN. /$
HistorialProyectResponseNN/ G
>NNG H
>NNH I
(NNI J
)NNJ K
)NNK L
)NNL M
;NNM N
}OO 	
catchPP 
(PP 
ExperienceExeptionPP !
ePP" #
)PP# $
{QQ 	
returnRR 

BadRequestRR 
(RR 
newRR !
ResponseRR" *
<RR* +
VoidRR+ /
>RR/ 0
(RR0 1
eRR1 2
.RR2 3
MessageRR3 :
)RR: ;
)RR; <
;RR< =
}SS 	
}TT 
}UU Å
jC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\HistorialProyect\HistorialProyectResponse.cs
	namespace 	
Api
 
. 
Controllers 
. 
HistorialProyect *
;* +
public 
record $
HistorialProyectResponse &
(& '
int' *
?* +
Code, 0
,0 1#
ProyectFeedBackResponse2 I
?I J
ProyectFeedBackK Z
)Z [
;[ \ˆ
hC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\HistorialProyect\ProyectFeedbackRequest.cs
	namespace 	
Api
 
. 
Controllers 
. 
HistorialProyect *
;* +
public 
record "
ProyectFeedbackRequest $
($ %
string% +
?+ ,
Comment- 4
,4 5
string6 <
?< =
Status> D
,D E
intF I
?I J
ScoreK P
,P Q
stringQ W
?W X
ProyectCodeY d
)d e
;e fÓ
iC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\HistorialProyect\ProyectFeedBackResponse.cs
	namespace 	
Api
 
. 
Controllers 
. 
HistorialProyect *
;* +
public 
record #
ProyectFeedBackResponse %
(% &
int& )
?) *
Code+ /
,/ 0
string0 6
?6 7
Comment8 ?
,? @
stringA G
?G H
StatusI O
,O P
intP S
?S T
ScoreU Z
)Z [
;[ \Æ
^C:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\Locations\LocationsController.cs
	namespace 	
Api
 
. 
Controllers 
. 
	Locations #
;# $
[ 
ApiController 
] 
[ 
Route 
( 
$str 
) 
] 
public		 
class		 
LocationsController		  
:		! "
ControllerBase		# 1
{

 
private 
readonly 
LocationsService %
_locationsService& 7
;7 8
public 

LocationsController 
( 
LocationsService /
locationsService0 @
)@ A
{ 
_locationsService 
= 
locationsService ,
;, -
} 
[ 
HttpGet 
( 
$str 
) 
] 
public 

ActionResult 
GetDepartments &
(& '
)' (
{ 
List 
< 

Department 
> 
departments $
=% &
_locationsService' 8
.8 9
GetDepartments9 G
(G H
)H I
;I J
return 
Ok 
( 
new 
Response 
< 
List #
<# $

Department$ .
>. /
>/ 0
(0 1
departments1 <
)< =
)= >
;> ?
} 
[ 
HttpGet 
( 
$str 
) 
] 
public 

ActionResult 
	GetCities !
(! "
[" #
	FromQuery# ,
], -
string. 4
departmentName5 C
)C D
{ 
List 
< 
City 
> 
cities 
= 
_locationsService -
.- .
	GetCities. 7
(7 8
departmentName8 F
)F G
;G H
return 
Ok 
( 
new 
Response 
< 
List #
<# $
City$ (
>( )
>) *
(* +
cities+ 1
)1 2
)2 3
;3 4
} 
} ¨
XC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\People\AddPersonRequest.cs
	namespace 	
Api
 
. 
Controllers 
. 
Auth 
; 
public 
record 
AddPersonRequest 
( 
string %
NameUser& .
,. /
string/ 5
Document6 >
)> ?
;? @»
[C:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\People\CreatePersonRequest.cs
	namespace 	
Api
 
. 
Controllers 
. 
People  
;  !
public 
record 
CreatePersonRequest !
(! "
string 

Document 
, 
string 

IdentificationType 
, 
string 

	FirstName 
, 
string 


SecondName 
, 
string 

FirstLastName 
, 
string		 

SecondLastName		 
,		 
string

 


CivilState

 
,

 
string 

Gender 
, 
DateTime 
	BirthDate 
, 
string 

Phone 
, 
string 

InstitutionalMail 
, 
string 


CitiesCode 
, 
string 

NameUser 
) 
; ˝0
XC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\People\PeopleController.cs
	namespace		 	
Api		
 
.		 
Controllers		 
.		 
People		  
;		  !
[

 
ApiController

 
]

 
[ 
Route 
( 
$str 
) 
] 
public 
class 
PeopleController 
: 
ControllerBase  .
{ 
private 
readonly 
PeopleService "
_peopleService# 1
;1 2
private 
readonly 
UsersService !
_usersService" /
;/ 0
public 

PeopleController 
( 
PeopleService )
peopleService* 7
,7 8
UsersService9 E
usersServiceF R
)R S
{ 
_peopleService 
= 
peopleService &
;& '
_usersService 
= 
usersService $
;$ %
} 
[ 	
HttpPost	 
] 
[ 	
	Authorize	 
( 
Roles 
= 
$str /
)/ 0
]0 1
public 
ActionResult 
RegisterPeople *
(* +
[ 
FromBody 
] 
CreatePersonRequest *
createPersonRequest+ >
)> ?
{ 	
try 
{ 
var 
person 
= 
createPersonRequest 0
.0 1
Adapt1 6
<6 7
Person7 =
>= >
(> ?
)? @
;@ A
_peopleService   
.   

SavePerson   )
(  ) *
person  * 0
)  0 1
;  1 2
var!! 
(!! 
response!! 
,!! 
	hasErrors!! '
)!!' (
=!!) *
_usersService!!+ 8
.!!8 9
AddPersonDocument!!9 J
(!!J K
createPersonRequest!!K ^
.!!^ _
Document!!_ g
,!!g h
createPersonRequest!!i |
.!!| }
NameUser	!!} Ö
)
!!Ö Ü
;
!!Ü á
return"" 
Ok"" 
("" 
new"" 
Response"" &
<""& '
Void""' +
>""+ ,
("", -
$str""- Q
,""Q R
false""S X
)""X Y
)""Y Z
;""Z [
}## 
catch$$ 
($$ 
PersonExeption$$ !
exeption$$" *
)$$* +
{%% 
return&& 

BadRequest&& !
(&&! "
new&&" %
Response&&& .
<&&. /
Void&&/ 3
>&&3 4
(&&4 5
exeption&&5 =
.&&= >
Message&&> E
)&&E F
)&&F G
;&&G H
}'' 
}(( 	
[** 
HttpGet** 
(** 
$str** 
)** 
]** 
[++ 
	Authorize++ 
(++ 
Roles++ 
=++ 
$str++ +
)+++ ,
]++, -
public,, 

ActionResult,, 
	GetPerson,, !
(,,! "
[,," #
	FromRoute,,# ,
],,, -
string,,. 4
document,,5 =
),,= >
{-- 
try.. 
{// 	
Person00 
?00 
person00 
=00 
_peopleService00 +
.00+ ,
SearchPerson00, 8
(008 9
document009 A
)00A B
;00B C
if11 
(11 
person11 
==11 
null11 
)11 
{22 
return33 

BadRequest33 !
(33! "
new33" %
Response33& .
<33. /
Void33/ 3
>333 4
(334 5
$str335 R
)33R S
)33S T
;33T U
}44 
return55 
Ok55 
(55 
new55 
Response55 "
<55" #
PersonResponse55# 1
>551 2
(552 3
person553 9
.559 :
Adapt55: ?
<55? @
PersonResponse55@ N
>55N O
(55O P
)55P Q
)55Q R
)55R S
;55S T
}66 	
catch77 
(77 
PersonExeption77 
e77 
)77  
{88 	
return99 

BadRequest99 
(99 
new99 !
Response99" *
<99* +
Void99+ /
>99/ 0
(990 1
e991 2
.992 3
Message993 :
)99: ;
)99; <
;99< =
}:: 	
};; 
[== 

HttpDelete== 
(== 
$str== 
)== 
]== 
[>> 
	Authorize>> 
(>> 
Roles>> 
=>> 
$str>> +
)>>+ ,
]>>, -
public?? 

ActionResult?? 
DeletePerson?? $
(??$ %
[??% &
	FromRoute??& /
]??/ 0
string??1 7
document??8 @
)??@ A
{@@ 
tryAA 
{BB 	
_usersServiceCC 
.CC  
DeletePersonDocumentCC .
(CC. /
documentCC/ 7
)CC7 8
;CC8 9
stringDD 
messageDD 
=DD 
_peopleServiceDD +
.DD+ ,
DeletePersonDD, 8
(DD8 9
documentDD9 A
)DDA B
;DDB C
returnEE 
OkEE 
(EE 
newEE 
ResponseEE "
<EE" #
VoidEE# '
>EE' (
(EE( )
messageEE) 0
,EE0 1
falseEE1 6
)EE6 7
)EE7 8
;EE8 9
}FF 	
catchGG 
(GG 
	ExceptionGG 
eGG 
)GG 
{HH 	
returnII 

BadRequestII 
(II 
newII !
ResponseII" *
<II* +
VoidII+ /
>II/ 0
(II0 1
eII1 2
.II2 3
MessageII3 :
)II: ;
)II; <
;II< =
}JJ 	
}KK 
}LL á
VC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\People\PersonResponse.cs
	namespace 	
Api
 
. 
Controllers 
. 
People  
;  !
public 
record 
PersonResponse 
( 
string #
Document$ ,
,, -
string 

IdentificationType 
, 
string 

	FirstName 
, 
string 


SecondName 
, 
string 

FirstLastName 
, 
string 

SecondLastName 
, 
string		 


CivilState		 
,		 
string

 

Gender

 
,

 
DateTime 
	BirthDate 
, 
string 

Phone 
, 
string 

InstitutionalMail 
, 
string 


CitiesCode 
) 
; æ
aC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\Professor\CreateProfessorRequest.cs
	namespace 	
Api
 
. 
Controllers 
. 
	Professor #
;# $
public 
record "
CreateProfessorRequest $
($ %
string 

Document 
, 
string 

Position 
) 
; ÒJ
^C:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\Professor\ProfessorController.cs
	namespace 	
Api
 
. 
Controllers 
. 
	Professor #
;# $
[		 
ApiController		 
]		 
[

 
Route

 
(

 
$str

 
)

 
]

 
public 
class 
ProfessorController  
:! "
ControllerBase# 1
{ 
private 
readonly 
ProfessorService %
_professorService& 7
;7 8
private 
readonly 
PeopleService "
_peopleService# 1
;1 2
public 

ProfessorController 
( 
ProfessorService /
professorService0 @
,@ A
PeopleServiceA N
peopleServiceO \
)\ ]
{ 
_professorService 
= 
professorService ,
;, -
_peopleService 
= 
peopleService &
;& '
} 
[ 
HttpPost 
] 
public 

ActionResult 
RegisterProfessor )
() *
[ 	
FromBody	 
] "
CreateProfessorRequest )"
createProfessorRequest* @
)@ A
{ 
try 
{ 	
if 
( 
_peopleService 
. 
SearchPerson +
(+ ,"
createProfessorRequest, B
.B C
DocumentC K
)K L
!=M O
nullP T
&&U W
_professorService !
.! "
SearchProfessor" 1
(1 2"
createProfessorRequest2 H
.H I
DocumentI Q
)Q R
==S U
nullV Z
)Z [
{ 
_professorService !
.! "
SaveProfessor" /
(/ 0"
createProfessorRequest0 F
.F G
AdaptG L
<L M
EntitiesM U
.U V
	ProfessorV _
>_ `
(` a
)a b
)b c
;c d
return   
Ok   
(   
new   
Response   &
<  & '
Void  ' +
>  + ,
(  , -
$str  - H
,  H I
false!! 
)!! 
)!! 
;!! 
}"" 
return## 

BadRequest## 
(## 
new## !
Response##" *
<##* +
Void##+ /
>##/ 0
(##0 1
$str##1 N
)##N O
)##O P
;##P Q
}$$ 	
catch%% 
(%% 
ProfessorExeption%%  
e%%! "
)%%" #
{&& 	
return'' 
('' 

BadRequest'' 
('' 
new'' "
Response''# +
<''+ ,
Void'', 0
>''0 1
(''1 2
e''2 3
.''3 4
Message''4 ;
)''; <
)''< =
)''= >
;''> ?
}(( 	
})) 
[++ 
HttpGet++ 
(++ 
$str++ 
)++ 
]++ 
public,, 

ActionResult,, 
GetProfessor,, $
(,,$ %
[,,% &
	FromRoute,,& /
],,/ 0
string,,1 7
document,,8 @
),,@ A
{-- 
try.. 
{// 	
Entities00 
.00 
	Professor00 
?00 
	professor00  )
=00* +
_professorService00, =
.00= >
SearchProfessor00> M
(00M N
document00N V
)00V W
;00W X
if11 
(11 
	professor11 
?11 
.11 
Document11 "
==11# %
null11& *
)11* +
{22 
return33 

BadRequest33 !
(33! "
new33" %
Response33& .
<33. /
Void33/ 3
>333 4
(334 5
$str335 b
)33b c
)33c d
;33d e
}44 
return55 
Ok55 
(55 
new55 
Response55 "
<55" #
ProfessorResponse55# 4
>554 5
(555 6
	professor556 ?
.55? @
Adapt55@ E
<55E F
ProfessorResponse55F W
>55W X
(55X Y
)55Y Z
)55Z [
)55[ \
;55\ ]
}66 	
catch77 
(77 
PersonExeption77 
e77 
)77  
{88 	
return99 

BadRequest99 
(99 
new99 !
Response99" *
<99* +
Void99+ /
>99/ 0
(990 1
e991 2
.992 3
Message993 :
)99: ;
)99; <
;99< =
}:: 	
};; 
[== 
HttpGet== 
(== 
$str== 1
)==1 2
]==2 3
public>> 
ActionResult>> "
GetProfessorByPosition>> /
(>>/ 0
[>>0 1
	FromRoute>>1 :
]>>: ;
string>>< B
position>>C K
)>>K L
{?? 
try@@	 
{AA	 

ListBB 
<BB 
EntitiesBB 
.BB 
	ProfessorBB $
>BB$ %

professorsBB& 0
=BB1 2
_professorServiceBB3 D
.BBD E%
SearchProfessorByPositionBBE ^
(BB^ _
positionBB_ g
)BBg h
;BBh i
ifCC 
(CC 

professorsCC 
.CC 
CountCC !
==CC" $
$numCC% &
)CC& '
{DD 
returnEE 

BadRequestEE "
(EE" #
newEE# &
ResponseEE' /
<EE/ 0
VoidEE0 4
>EE4 5
(EE5 6
$strEE6 e
)EEe f
)EEf g
;EEg h
}FF 
ListHH 
<HH 
PersonResponseHH  
>HH  !
professorResponsesHH" 4
=HH5 6
newHH7 :
ListHH; ?
<HH? @
PersonResponseHH@ N
>HHN O
(HHO P
)HHP Q
;HHQ R
foreachJJ 
(JJ 
EntitiesJJ 
.JJ 
	ProfessorJJ (
	professorJJ) 2
inJJ3 5

professorsJJ6 @
)JJ@ A
{KK 
PersonLL 
relatedPersonLL %
=LL& '
_peopleServiceLL( 6
.LL6 7
SearchPersonLL7 C
(LLC D
	professorLLD M
.LLM N
DocumentLLN V
)LLV W
;LLW X
ifMM 
(MM 
relatedPersonMM "
!=MM# %
nullMM& *
)MM* +
{NN 
professorResponsesOO '
.OO' (
AddOO( +
(OO+ ,
relatedPersonOO, 9
.OO9 :
AdaptOO: ?
<OO? @
PersonResponseOO@ N
>OON O
(OOO P
)OOP Q
)OOQ R
;OOR S
}PP 
}QQ 
returnSS 
OkSS 
(SS 
newSS 
ResponseSS #
<SS# $
ListSS$ (
<SS( )
PersonResponseSS) 7
>SS7 8
>SS8 9
(SS9 :
professorResponsesSS: L
)SSL M
)SSM N
;SSN O
}TT	 

catchUU	 
(UU 
PersonExeptionUU 
eUU  
)UU  !
{VV	 

returnWW 

BadRequestWW 
(WW 
newWW "
ResponseWW# +
<WW+ ,
VoidWW, 0
>WW0 1
(WW1 2
eWW2 3
.WW3 4
MessageWW4 ;
)WW; <
)WW< =
;WW= >
}XX	 

}YY 
[[[ 	
HttpGet[[	 
][[ 
public\\ 
ActionResult\\ 
GetAllProfessors\\ ,
(\\, -
)\\- .
{]] 	
try^^ 
{__ 
List`` 
<`` 
Entities`` 
.`` 
	Professor`` '
>``' (

professors``) 3
=``4 5
_professorServiceaa %
.aa% &
GetAllProfessorsaa& 6
(aa6 7
)aa7 8
;aa8 9
ifbb 
(bb 

professorsbb 
.bb 
Countbb $
<bb% &
$numbb' (
)bb( )
{cc 
returndd 

BadRequestdd %
(dd% &
newee 
Responseee $
<ee$ %
Voidee% )
>ee) *
(ee* +
$stree+ V
)eeV W
)eeW X
;eeX Y
}ff 
returnhh 
Okhh 
(hh 
newhh 
Responsehh &
<hh& '
Listhh' +
<hh+ ,
ProfessorResponsehh, =
>hh= >
>hh> ?
(hh? @

professorsii 
?ii 
.ii  
Adaptii  %
<ii% &
Listii& *
<ii* +
ProfessorResponseii+ <
>ii< =
>ii= >
(ii> ?
)ii? @
)ii@ A
)iiA B
;iiB C
}jj 
catchkk 
(kk 
PersonExeptionkk !
ekk" #
)kk# $
{ll 
returnmm 

BadRequestmm !
(mm! "
newmm" %
Responsemm& .
<mm. /
Voidmm/ 3
>mm3 4
(mm4 5
emm5 6
.mm6 7
Messagemm7 >
)mm> ?
)mm? @
;mm@ A
}nn 
}oo 	
}rr ¥
\C:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\Professor\ProfessorResponse.cs
	namespace 	
Api
 
. 
Controllers 
. 
	Professor #
;# $
public 
record 
ProfessorResponse 
(  
string 

Document 
, 
string 

Position 
) 
; §†
\C:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\Proposal\ProposalController.cs
	namespace		 	
Api		
 
.		 
Controllers		 
.		 
Proposal		 "
;		" #
[ 
ApiController 
] 
[ 
Route 
( 
$str 
) 
] 
public 
class 
ProposalController 
:  !
ControllerBase" 0
{ 
private 
readonly 
ProposalService $
_proposalService% 5
;5 6
public 

ProposalController 
( 
ProposalService -
proposalService. =
)= >
{ 
_proposalService 
= 
proposalService *
;* +
} 
[ 
HttpPost 
] 
[ 
	Authorize 
( 
Roles 
= 
( 
$str $
)$ %
)% &
]& '
public 

ActionResult 
RegisterProposal (
(( )
[ 	
FromBody	 
] 
ProposalRequest "
proposalRequest# 2
)2 3
{ 
try 
{ 	
Entities 
. 
Proposal 
? 
newProposal *
=+ ,
proposalRequest 
.  
Adapt  %
<% &
Entities& .
.. /
Proposal/ 7
>7 8
(8 9
)9 :
;: ;
newProposal 
. 
Code 
= 
Random %
.% &
Shared& ,
., -
Next- 1
(1 2
)2 3
.3 4
ToString4 <
(< =
)= >
;> ?
Entities   
.   
Proposal   
oldProposal   )
=  * +
_proposalService!!  
.!!  !
GetProposalCode!!! 0
(!!0 1
newProposal!!1 <
.!!< =
Code!!= A
!!!A B
)!!B C
!!!C D
;!!D E
if"" 
("" 
newProposal"" 
."" 
Code""  
==""! #
oldProposal""$ /
?""/ 0
.""0 1
Code""1 5
)""5 6
{## 
_proposalService$$  
.$$  !
UpdateProposal$$! /
($$/ 0
newProposal$$0 ;
)$$; <
;$$< =
}%% 
else&& 
{'' 
_proposalService((  
.((  !
SaveProposal((! -
(((- .
newProposal((. 9
)((9 :
;((: ;
})) 
return++ 
Ok++ 
(++ 
new++ 
Response++ "
<++" #
Void++# '
>++' (
(++( )
$str++) I
,++I J
false,, 
),, 
),, 
;,, 
}-- 	
catch.. 
(.. 
PersonExeption.. 
exeption.. &
)..& '
{// 	
return00 

BadRequest00 
(00 
new00 !
Response00" *
<00* +
Void00+ /
>00/ 0
(000 1
exeption001 9
.009 :
Message00: A
)00A B
)00B C
;00C D
}11 	
}22 
[44 
HttpGet44 
(44 
$str44 0
)440 1
]441 2
[55 
	Authorize55 
(55 
Roles55 
=55 
$str55 +
)55+ ,
]55, -
public66 

ActionResult66  
GetProposalsDocument66 ,
(66, -
[66- .
	FromRoute66. 7
]667 8
string669 ?
document66@ H
)66H I
{77 
try88 
{99 	
List:: 
<:: 
Entities:: 
.:: 
Proposal:: "
>::" #
	proposals::$ -
=::. /
_proposalService;;  
.;;  ! 
GetProposalsDocument;;! 5
(;;5 6
document;;6 >
);;> ?
;;;? @
if<< 
(<< 
	proposals<< 
.<< 
Count<< 
<<<  !
$num<<" #
)<<# $
{== 
return>> 

BadRequest>> !
(>>! "
new?? 
Response??  
<??  !
Void??! %
>??% &
(??& '
$str??' \
)??\ ]
)??] ^
;??^ _
}@@ 
returnBB 
OkBB 
(BB 
newBB 
ResponseBB "
<BB" #
ListBB# '
<BB' (
ProposalResponseBB( 8
>BB8 9
>BB9 :
(BB: ;
	proposalsCC 
?CC 
.CC 
AdaptCC  
<CC  !
ListCC! %
<CC% &
ProposalResponseCC& 6
>CC6 7
>CC7 8
(CC8 9
)CC9 :
)CC: ;
)CC; <
;CC< =
}DD 	
catchEE 
(EE 
PersonExeptionEE 
eEE 
)EE  
{FF 	
returnGG 

BadRequestGG 
(GG 
newGG !
ResponseGG" *
<GG* +
VoidGG+ /
>GG/ 0
(GG0 1
eGG1 2
.GG2 3
MessageGG3 :
)GG: ;
)GG; <
;GG< =
}HH 	
}II 
[KK 
HttpGetKK 
(KK 
$strKK 1
)KK1 2
]KK2 3
[LL 
	AuthorizeLL 
(LL 
RolesLL 
=LL 
$strLL .
)LL. /
]LL/ 0
publicMM 

ActionResultMM )
GetProposalsProfessorDocumentMM 5
(MM5 6
[MM6 7
	FromRouteMM7 @
]MM@ A
stringMMB H
documentMMI Q
)MMQ R
{NN 
tryOO 
{PP 	
ListQQ 
<QQ 
EntitiesQQ 
.QQ 
ProposalQQ "
>QQ" #
	proposalsQQ$ -
=QQ. /
_proposalServiceRR  
.RR  !)
GetProposalsProfessorDocumentRR! >
(RR> ?
documentRR? G
)RRG H
;RRH I
ifSS 
(SS 
	proposalsSS 
.SS 
CountSS 
<SS  !
$numSS" #
)SS# $
{TT 
returnUU 

BadRequestUU !
(UU! "
newVV 
ResponseVV  
<VV  !
VoidVV! %
>VV% &
(VV& '
$strVV' \
)VV\ ]
)VV] ^
;VV^ _
}WW 
returnYY 
OkYY 
(YY 
newYY 
ResponseYY "
<YY" #
ListYY# '
<YY' (
ProposalResponseYY( 8
>YY8 9
>YY9 :
(YY: ;
	proposalsZZ 
?ZZ 
.ZZ 
AdaptZZ  
<ZZ  !
ListZZ! %
<ZZ% &
ProposalResponseZZ& 6
>ZZ6 7
>ZZ7 8
(ZZ8 9
)ZZ9 :
)ZZ: ;
)ZZ; <
;ZZ< =
}[[ 	
catch\\ 
(\\ 
PersonExeption\\ 
e\\ 
)\\  
{]] 	
return^^ 

BadRequest^^ 
(^^ 
new^^ !
Response^^" *
<^^* +
Void^^+ /
>^^/ 0
(^^0 1
e^^1 2
.^^2 3
Message^^3 :
)^^: ;
)^^; <
;^^< =
}__ 	
}`` 
[bb 
HttpGetbb 
(bb 
$strbb ?
)bb? @
]bb@ A
[cc 
	Authorizecc 
(cc 
Rolescc 
=cc 
$strcc .
)cc. /
]cc/ 0
publicdd 

ActionResultdd 1
%GetGeneralStatisticsProposalProfessordd =
(dd= >
[dd> ?
	FromRoutedd? H
]ddH I
stringddJ P
documentddQ Y
)ddY Z
{ee 
tryff 
{gg 	
objecthh 

statisticshh 
=hh 
_proposalServiceii  
.ii  !.
"GeneralStatisticsProposalProfessorii! C
(iiC D
documentiiD L
)iiL M
;iiM N
ifjj 
(jj 

statisticsjj 
==jj 
nulljj "
)jj" #
{kk 
returnll 

BadRequestll !
(ll! "
newmm 
Responsemm  
<mm  !
Voidmm! %
>mm% &
(mm& '
$strmm' N
)mmN O
)mmO P
;mmP Q
}nn 
returnpp 
Okpp 
(pp 
newpp 
Responsepp "
<pp" #
objectpp# )
>pp) *
(pp* +

statisticspp+ 5
)pp5 6
)pp6 7
;pp7 8
}qq 	
catchrr 
(rr 
PersonExeptionrr 
err 
)rr  
{ss 	
returntt 

BadRequesttt 
(tt 
newtt !
Responsett" *
<tt* +
Voidtt+ /
>tt/ 0
(tt0 1
ett1 2
.tt2 3
Messagett3 :
)tt: ;
)tt; <
;tt< =
}uu 	
}vv 
[xx 
HttpGetxx 
(xx 
$strxx =
)xx= >
]xx> ?
[yy 
	Authorizeyy 
(yy 
Rolesyy 
=yy 
$stryy 1
)yy1 2
]yy2 3
publiczz 

ActionResultzz /
#GetGeneralStatisticsProposalStudentzz ;
(zz; <
[zz< =
	FromRoutezz= F
]zzF G
stringzzH N
documentzzO W
)zzW X
{{{ 
try|| 
{}} 	
object~~ 

statistics~~ 
=~~ 
_proposalService  
.  !,
 GeneralStatisticsProposalStudent! A
(A B
documentB J
)J K
;K L
if
ÄÄ 
(
ÄÄ 

statistics
ÄÄ 
==
ÄÄ 
null
ÄÄ "
)
ÄÄ" #
{
ÅÅ 
return
ÇÇ 

BadRequest
ÇÇ !
(
ÇÇ! "
new
ÉÉ 
Response
ÉÉ  
<
ÉÉ  !
Void
ÉÉ! %
>
ÉÉ% &
(
ÉÉ& '
$str
ÉÉ' N
)
ÉÉN O
)
ÉÉO P
;
ÉÉP Q
}
ÑÑ 
return
ÜÜ 
Ok
ÜÜ 
(
ÜÜ 
new
ÜÜ 
Response
ÜÜ "
<
ÜÜ" #
object
ÜÜ# )
>
ÜÜ) *
(
ÜÜ* +

statistics
ÜÜ+ 5
)
ÜÜ5 6
)
ÜÜ6 7
;
ÜÜ7 8
}
áá 	
catch
àà 
(
àà 
PersonExeption
àà 
e
àà 
)
àà  
{
ââ 	
return
ää 

BadRequest
ää 
(
ää 
new
ää !
Response
ää" *
<
ää* +
Void
ää+ /
>
ää/ 0
(
ää0 1
e
ää1 2
.
ää2 3
Message
ää3 :
)
ää: ;
)
ää; <
;
ää< =
}
ãã 	
}
åå 
[
éé 
HttpGet
éé 
(
éé 
$str
éé *
)
éé* +
]
éé+ ,
[
èè 
	Authorize
èè 
(
èè 
Roles
èè 
=
èè 
$str
èè &
)
èè& '
]
èè' (
public
êê 

ActionResult
êê +
GetGeneralStatisticsProposals
êê 5
(
êê5 6
)
êê6 7
{
ëë 
try
íí 
{
ìì 	
object
îî 

statistics
îî 
=
îî 
_proposalService
ïï  
.
ïï  !(
GeneralStatisticsProposals
ïï! ;
(
ïï; <
)
ïï< =
;
ïï= >
if
ññ 
(
ññ 

statistics
ññ 
==
ññ 
null
ññ "
)
ññ" #
{
óó 
return
òò 

BadRequest
òò !
(
òò! "
new
ôô 
Response
ôô  
<
ôô  !
Void
ôô! %
>
ôô% &
(
ôô& '
$str
ôô' <
)
ôô< =
)
ôô= >
;
ôô> ?
}
öö 
return
úú 
Ok
úú 
(
úú 
new
úú 
Response
úú "
<
úú" #
object
úú# )
>
úú) *
(
úú* +

statistics
úú+ 5
)
úú5 6
)
úú6 7
;
úú7 8
}
ùù 	
catch
ûû 
(
ûû 
PersonExeption
ûû 
e
ûû 
)
ûû  
{
üü 	
return
†† 

BadRequest
†† 
(
†† 
new
†† !
Response
††" *
<
††* +
Void
††+ /
>
††/ 0
(
††0 1
e
††1 2
.
††2 3
Message
††3 :
)
††: ;
)
††; <
;
††< =
}
°° 	
}
¢¢ 
[
•• 
HttpGet
•• 
(
•• 
$str
•• '
)
••' (
]
••( )
[
¶¶ 
	Authorize
¶¶ 
(
¶¶ 
Roles
¶¶ 
=
¶¶ 
$str
¶¶ 9
)
¶¶9 :
]
¶¶: ;
public
ßß 

ActionResult
ßß 
GetProposalCode
ßß '
(
ßß' (
[
ßß( )
	FromRoute
ßß) 2
]
ßß2 3
string
ßß4 :
code
ßß; ?
)
ßß? @
{
®® 
try
©© 
{
™™ 	
Entities
´´ 
.
´´ 
Proposal
´´ 
?
´´ 
proposal
¨¨ 
=
¨¨ 
_proposalService
¨¨ +
.
¨¨+ ,
GetProposalCode
¨¨, ;
(
¨¨; <
code
¨¨< @
)
¨¨@ A
;
¨¨A B
if
≠≠ 
(
≠≠ 
proposal
≠≠ 
==
≠≠ 
null
≠≠  
)
≠≠  !
{
ÆÆ 
return
ØØ 

BadRequest
ØØ !
(
ØØ! "
new
∞∞ 
Response
∞∞  
<
∞∞  !
Void
∞∞! %
>
∞∞% &
(
∞∞& '
$str
∞∞' V
)
∞∞V W
)
∞∞W X
;
∞∞X Y
}
±± 
return
≥≥ 
Ok
≥≥ 
(
≥≥ 
new
¥¥ 
Response
¥¥ 
<
¥¥ 
ProposalResponse
¥¥ -
>
¥¥- .
(
¥¥. /
proposal
µµ 
.
µµ 
Adapt
µµ "
<
µµ" #
ProposalResponse
µµ# 3
>
µµ3 4
(
µµ4 5
)
µµ5 6
)
µµ6 7
)
µµ7 8
;
µµ8 9
}
∂∂ 	
catch
∑∑ 
(
∑∑ 
PersonExeption
∑∑ 
e
∑∑ 
)
∑∑  
{
∏∏ 	
return
ππ 

BadRequest
ππ 
(
ππ 
new
ππ !
Response
ππ" *
<
ππ* +
Void
ππ+ /
>
ππ/ 0
(
ππ0 1
e
ππ1 2
.
ππ2 3
Message
ππ3 :
)
ππ: ;
)
ππ; <
;
ππ< =
}
∫∫ 	
}
ªª 
[
ΩΩ 
HttpPut
ΩΩ 
(
ΩΩ 
$str
ΩΩ )
)
ΩΩ) *
]
ΩΩ* +
[
ææ 
	Authorize
ææ 
(
ææ 
Roles
ææ 
=
ææ 
$str
ææ &
)
ææ& '
]
ææ' (
public
øø 

ActionResult
øø %
UpdateProfessorProposal
øø /
(
øø/ 0
[
øø0 1
FromBody
øø1 9
]
øø9 :#
ProposalUpdateRequest
øø; P#
proposalUpdateRequest
øøQ f
)
øøf g
{
¿¿ 
try
¡¡ 
{
¬¬ 	
var
√√ 
(
√√ 
message
√√ 
,
√√ 
response
√√ !
)
√√! "
=
√√" #
_proposalService
√√$ 4
.
√√4 5-
UpdateProfessorDocumentProposal
√√5 T
(
√√T U#
proposalUpdateRequest
√√U j
.
√√j k
code
√√k o
,
√√o p$
proposalUpdateRequest√√p Ö
.√√Ö Ü!
ProfessorDocument√√Ü ó
)√√ó ò
;√√ò ô
if
ƒƒ 
(
ƒƒ 
response
ƒƒ 
==
ƒƒ 
false
ƒƒ !
)
ƒƒ" #
{
≈≈ 
return
∆∆ 

BadRequest
∆∆ !
(
∆∆! "
new
«« 
Response
««  
<
««  !
Void
««! %
>
««% &
(
««& '
message
««' .
)
««. /
)
««/ 0
;
««0 1
}
…… 
return
ÀÀ 
Ok
ÀÀ 
(
ÀÀ 
new
ÀÀ 
Response
ÀÀ #
<
ÀÀ# $
Void
ÀÀ$ (
>
ÀÀ( )
(
ÀÀ) *
message
ÀÀ* 1
)
ÀÀ1 2
)
ÀÀ2 3
;
ÀÀ3 4
}
ÕÕ 	
catch
ŒŒ 
(
ŒŒ 
PersonExeption
ŒŒ 
e
ŒŒ 
)
ŒŒ  
{
œœ 	
return
–– 

BadRequest
–– 
(
–– 
new
–– !
Response
––" *
<
––* +
Void
––+ /
>
––/ 0
(
––0 1
e
––1 2
.
––2 3
Message
––3 :
)
––: ;
)
––; <
;
––< =
}
—— 	
}
““ 
[
‘‘ 
HttpGet
‘‘ 
]
‘‘ 
public
’’ 

ActionResult
’’ 
GetAll
’’ 
(
’’ 
)
’’  
{
÷÷ 
try
◊◊ 
{
ÿÿ 	
List
ŸŸ 
<
ŸŸ 
Entities
ŸŸ 
.
ŸŸ 
Proposal
ŸŸ "
>
ŸŸ" #
	proposals
ŸŸ$ -
=
ŸŸ. /
_proposalService
⁄⁄  
.
⁄⁄  !
GetAll
⁄⁄! '
(
⁄⁄' (
)
⁄⁄( )
;
⁄⁄) *
if
€€ 
(
€€ 
	proposals
€€ 
.
€€ 
Count
€€ 
<
€€  !
$num
€€" #
)
€€# $
{
‹‹ 
return
›› 

BadRequest
›› !
(
››! "
new
ﬁﬁ 
Response
ﬁﬁ  
<
ﬁﬁ  !
Void
ﬁﬁ! %
>
ﬁﬁ% &
(
ﬁﬁ& '
$str
ﬁﬁ' S
)
ﬁﬁS T
)
ﬁﬁT U
;
ﬁﬁU V
}
ﬂﬂ 
return
·· 
Ok
·· 
(
·· 
new
·· 
Response
·· "
<
··" #
List
··# '
<
··' (
ProposalResponse
··( 8
>
··8 9
>
··9 :
(
··: ;
	proposals
‚‚ 
?
‚‚ 
.
‚‚ 
Adapt
‚‚  
<
‚‚  !
List
‚‚! %
<
‚‚% &
ProposalResponse
‚‚& 6
>
‚‚6 7
>
‚‚7 8
(
‚‚8 9
)
‚‚9 :
)
‚‚: ;
)
‚‚; <
;
‚‚< =
}
„„ 	
catch
‰‰ 
(
‰‰ 
PersonExeption
‰‰ 
e
‰‰ 
)
‰‰  
{
ÂÂ 	
return
ÊÊ 

BadRequest
ÊÊ 
(
ÊÊ 
new
ÊÊ !
Response
ÊÊ" *
<
ÊÊ* +
Void
ÊÊ+ /
>
ÊÊ/ 0
(
ÊÊ0 1
e
ÊÊ1 2
.
ÊÊ2 3
Message
ÊÊ3 :
)
ÊÊ: ;
)
ÊÊ; <
;
ÊÊ< =
}
ÁÁ 	
}
ËË 
[
ÍÍ 

HttpDelete
ÍÍ 
(
ÍÍ 
$str
ÍÍ 
)
ÍÍ 
]
ÍÍ 
[
ÎÎ 
	Authorize
ÎÎ 
(
ÎÎ 
Roles
ÎÎ 
=
ÎÎ 
(
ÎÎ 
$str
ÎÎ $
)
ÎÎ$ %
)
ÎÎ% &
]
ÎÎ& '
public
ÏÏ 

ActionResult
ÏÏ 
DeleteProposal
ÏÏ &
(
ÏÏ& '
[
ÏÏ' (
	FromRoute
ÏÏ( 1
]
ÏÏ1 2
string
ÏÏ3 9
code
ÏÏ: >
)
ÏÏ> ?
{
ÌÌ 
try
ÓÓ 
{
ÔÔ 	
string
 
message
 
=
 
_proposalService
 -
.
- .
DeleteProposal
. <
(
< =
code
= A
)
A B
;
B C
return
ÒÒ 
Ok
ÒÒ 
(
ÒÒ 
new
ÒÒ 
Response
ÒÒ "
<
ÒÒ" #
Void
ÒÒ# '
>
ÒÒ' (
(
ÒÒ( )
message
ÒÒ) 0
,
ÒÒ0 1
false
ÒÒ2 7
)
ÒÒ7 8
)
ÒÒ8 9
;
ÒÒ9 :
}
ÚÚ 	
catch
ÛÛ 
(
ÛÛ 
	Exception
ÛÛ 
e
ÛÛ 
)
ÛÛ 
{
ÙÙ 	
return
ıı 

BadRequest
ıı 
(
ıı 
new
ıı !
Response
ıı" *
<
ıı* +
Void
ıı+ /
>
ıı/ 0
(
ıı0 1
e
ıı1 2
.
ıı2 3
Message
ıı3 :
)
ıı: ;
)
ıı; <
;
ıı< =
}
ˆˆ 	
}
˜˜ 
}¯¯ Ñ	
YC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\Proposal\ProposalRequest.cs
	namespace 	
Api
 
. 
Controllers 
. 
Proposal "
;" #
public 
record 
ProposalRequest 
( 
string $
?$ %
PersonDocument& 4
,4 5
string6 <
?< =
Title> C
,C D
DateTime 
? 
Date 
, 
string 

?
 
InvestigationGroup 
, 
string  &
?& '
Approach( 0
,0 1
string2 8
?8 9
Justification: G
,G H
string 

?
 
GeneralObjective 
, 
string $
?$ %
SpecificObjective& 7
,7 8
string 

?
 
Bibliographical 
, 
string #
?# $
Status% +
,+ ,
string- 3
?3 4
ThematicAreaCode5 E
)E F
;F Gó

ZC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\Proposal\ProposalResponse.cs
	namespace 	
Api
 
. 
Controllers 
. 
Proposal "
;" #
public 
record 
ProposalResponse 
( 
string %
?% &
Code' +
,+ ,
string- 3
?3 4
PersonDocument5 C
,C D
stringD J
?J K
ProfessorDocumentL ]
,] ^
string 

?
 
Title 
, 
DateTime 
? 
Date !
,! "
string 

?
 
InvestigationGroup 
, 
string  &
?& '
Approach( 0
,0 1
string2 8
?8 9
Justification: G
,G H
string 

?
 
GeneralObjective 
, 
string $
?$ %
SpecificObjective& 7
,7 8
string 

?
 
Bibliographical 
, 
string #
?# $
Status% +
,+ ,
string- 3
?3 4
ProposalCode5 A
)A B
;B Cﬂ
_C:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\Proposal\ProposalUpdateRequest.cs
	namespace 	
Api
 
. 
Controllers 
. 
Proposal "
;" #
public 
record !
ProposalUpdateRequest #
(# $
string$ *
?* +
ProfessorDocument, =
,= >
string? E
?E F
codeG K
)K L
;L Mãü
ZC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\Proyect\ProyectController.cs
	namespace 	
Api
 
. 
Controllers 
. 
Proyect !
;! "
[		 
ApiController		 
]		 
[

 
Route

 
(

 
$str

 
)

 
]

 
public 
class 
ProyectController 
:  
ControllerBase! /
{ 
private 
readonly 
ProyectService #
_proyectService$ 3
;3 4
public 

ProyectController 
( 
ProyectService +
proyectService, :
): ;
{ 
_proyectService 
= 
proyectService (
;( )
} 
[ 
HttpPost 
] 
[ 
	Authorize 
( 
Roles 
= 
( 
$str $
)$ %
)% &
]& '
public 

ActionResult 
RegisterProyect '
(' (
[ 	
FromBody	 
] 
ProyectRequest !
proyectRequest" 0
)0 1
{ 
try 
{ 	
Entities 
. 
Proyect 
? 

newProyect (
=) *
proyectRequest 
. 
Adapt $
<$ %
Entities% -
.- .
Proyect. 5
>5 6
(6 7
)7 8
;8 9

newProyect 
. 
Code 
= 
Random $
.$ %
Shared% +
.+ ,
Next, 0
(0 1
)1 2
.2 3
ToString3 ;
(; <
)< =
;= >
Entities 
. 
Proyect 

oldProyect '
=( )
_proyectService 
.  
SearchProyect  -
(- .

newProyect. 8
.8 9
Code9 =
!= >
)> ?
!? @
;@ A
if   
(   

newProyect   
.   
Code   
==    "

oldProyect  # -
?  - .
.  . /
Code  / 3
)  3 4
{!! 
_proyectService"" 
.""  
UpdateProyect""  -
(""- .

newProyect"". 8
)""8 9
;""9 :
}## 
else$$ 
{%% 
_proyectService&& 
.&&  
SaveProyect&&  +
(&&+ ,

newProyect&&, 6
)&&6 7
;&&7 8
}'' 
return)) 
Ok)) 
()) 
new)) 
Response)) "
<))" #
Void))# '
>))' (
())( )
$str))) C
,))C D
false** 
)** 
)** 
;** 
}++ 	
catch,, 
(,, 
PersonExeption,, 
exeption,, &
),,& '
{-- 	
return.. 

BadRequest.. 
(.. 
new.. !
Response.." *
<..* +
Void..+ /
>../ 0
(..0 1
exeption..1 9
...9 :
Message..: A
)..A B
)..B C
;..C D
}// 	
}00 
[22 
HttpGet22 
(22 
$str22 -
)22- .
]22. /
[33 
	Authorize33 
(33 
Roles33 
=33 
$str33 9
)339 :
]33: ;
public44 

ActionResult44 
GetProyects44 #
(44# $
[44$ %
	FromRoute44% .
]44. /
string440 6
document447 ?
)44? @
{55 
try66 
{77 	
List88 
<88 
Entities88 
.88 
Proyect88 !
>88! "
proyects88# +
=88, -
_proyectService99 
.99  
GetProyects99  +
(99+ ,
document99, 4
)994 5
;995 6
if:: 
(:: 
proyects:: 
.:: 
Count:: 
<::  
$num::! "
)::" #
{;; 
return<< 

BadRequest<< !
(<<! "
new== 
Response==  
<==  !
Void==! %
>==% &
(==& '
$str==' I
)==I J
)==J K
;==K L
}>> 
return@@ 
Ok@@ 
(@@ 
new@@ 
Response@@ "
<@@" #
List@@# '
<@@' (
ProyectResponse@@( 7
>@@7 8
>@@8 9
(@@9 :
proyectsAA 
?AA 
.AA 
AdaptAA 
<AA  
ListAA  $
<AA$ %
ProyectResponseAA% 4
>AA4 5
>AA5 6
(AA6 7
)AA7 8
)AA8 9
)AA9 :
;AA: ;
}BB 	
catchCC 
(CC 
PersonExeptionCC 
eCC 
)CC  
{DD 	
returnEE 

BadRequestEE 
(EE 
newEE !
ResponseEE" *
<EE* +
VoidEE+ /
>EE/ 0
(EE0 1
eEE1 2
.EE2 3
MessageEE3 :
)EE: ;
)EE; <
;EE< =
}FF 	
}GG 
[II 
HttpGetII 
(II 
$strII /
)II/ 0
]II0 1
[JJ 
	AuthorizeJJ 
(JJ 
RolesJJ 
=JJ 
$strJJ .
)JJ. /
]JJ/ 0
publicKK 

ActionResultKK (
GetProyectsProfessorDocumentKK 4
(KK4 5
[KK5 6
	FromRouteKK6 ?
]KK? @
stringKKA G
documentKKH P
)KKP Q
{LL 
tryMM 
{NN 	
ListOO 
<OO 
EntitiesOO 
.OO 
ProyectOO !
>OO! "
proyectsOO# +
=OO, -
_proyectServicePP 
.PP  (
GetProyectsProfessorDocumentPP  <
(PP< =
documentPP= E
)PPE F
;PPF G
ifQQ 
(QQ 
proyectsQQ 
.QQ 
CountQQ 
<QQ  
$numQQ! "
)QQ" #
{RR 
returnSS 

BadRequestSS !
(SS! "
newTT 
ResponseTT  
<TT  !
VoidTT! %
>TT% &
(TT& '
$strTT' \
)TT\ ]
)TT] ^
;TT^ _
}UU 
returnWW 
OkWW 
(WW 
newWW 
ResponseWW "
<WW" #
ListWW# '
<WW' (
ProyectResponseWW( 7
>WW7 8
>WW8 9
(WW9 :
proyectsXX 
?XX 
.XX 
AdaptXX 
<XX  
ListXX  $
<XX$ %
ProyectResponseXX% 4
>XX4 5
>XX5 6
(XX6 7
)XX7 8
)XX8 9
)XX9 :
;XX: ;
}YY 	
catchZZ 
(ZZ 
PersonExeptionZZ 
eZZ 
)ZZ  
{[[ 	
return\\ 

BadRequest\\ 
(\\ 
new\\ !
Response\\" *
<\\* +
Void\\+ /
>\\/ 0
(\\0 1
e\\1 2
.\\2 3
Message\\3 :
)\\: ;
)\\; <
;\\< =
}]] 	
}^^ 
[`` 
HttpGet`` 
(`` 
$str`` &
)``& '
]``' (
[aa 
	Authorizeaa 
(aa 
Rolesaa 
=aa 
$straa 9
)aa9 :
]aa: ;
publicbb 

ActionResultbb 
GetProyectCodebb &
(bb& '
[bb' (
	FromRoutebb( 1
]bb1 2
stringbb3 9
codebb: >
)bb> ?
{cc 
trydd 
{ee 	
Entitiesff 
.ff 
Proyectff 
?ff 
proyectgg 
=gg 
_proyectServicegg )
.gg) *
GetProyectCodegg* 8
(gg8 9
codegg9 =
)gg= >
;gg> ?
ifhh 
(hh 
proyecthh 
==hh 
nullhh 
)hh  
{ii 
returnjj 

BadRequestjj !
(jj! "
newkk 
Responsekk  
<kk  !
Voidkk! %
>kk% &
(kk& '
$strkk' F
)kkF G
)kkG H
;kkH I
}ll 
returnnn 
Oknn 
(nn 
newoo 
Responseoo 
<oo 
ProyectResponseoo ,
>oo, -
(oo- .
proyectpp 
.pp 
Adaptpp !
<pp! "
ProyectResponsepp" 1
>pp1 2
(pp2 3
)pp3 4
)pp4 5
)pp5 6
;pp6 7
}qq 	
catchrr 
(rr 
PersonExeptionrr 
err 
)rr  
{ss 	
returntt 

BadRequesttt 
(tt 
newtt !
Responsett" *
<tt* +
Voidtt+ /
>tt/ 0
(tt0 1
ett1 2
.tt2 3
Messagett3 :
)tt: ;
)tt; <
;tt< =
}uu 	
}vv 
[xx 
HttpPutxx 
(xx 
$strxx (
)xx( )
]xx) *
[yy 
	Authorizeyy 
(yy 
Rolesyy 
=yy 
$stryy &
)yy& '
]yy' (
publiczz 

ActionResultzz "
UpdateProfessorProyectzz .
(zz. /
[zz/ 0
FromBodyzz0 8
]zz8 9 
ProyectUpdateRequestzz: N 
proyectUpdateRequestzzO c
)zzc d
{{{ 
try|| 
{}} 	
var~~ 
(~~ 
message~~ 
,~~ 
response~~ !
)~~! "
=~~" #
_proyectService~~$ 3
.~~3 4*
UpdateProfessorDocumentProyect~~4 R
(~~R S 
proyectUpdateRequest~~S g
.~~g h
code~~h l
,~~l m!
proyectUpdateRequest	~~m Å
.
~~Å Ç
ProfessorDocument
~~Ç ì
)
~~ì î
;
~~î ï
if 
( 
response 
== 
false !
)" #
{
ÄÄ 
return
ÅÅ 

BadRequest
ÅÅ !
(
ÅÅ! "
new
ÇÇ 
Response
ÇÇ  
<
ÇÇ  !
Void
ÇÇ! %
>
ÇÇ% &
(
ÇÇ& '
message
ÇÇ' .
)
ÇÇ. /
)
ÇÇ/ 0
;
ÇÇ0 1
}
ÑÑ 
return
ÜÜ 
Ok
ÜÜ 
(
ÜÜ 
new
ÜÜ 
Response
ÜÜ "
<
ÜÜ" #
Void
ÜÜ# '
>
ÜÜ' (
(
ÜÜ( )
message
ÜÜ) 0
)
ÜÜ0 1
)
ÜÜ1 2
;
ÜÜ2 3
}
àà 	
catch
ââ 
(
ââ 
PersonExeption
ââ 
e
ââ 
)
ââ  
{
ää 	
return
ãã 

BadRequest
ãã 
(
ãã 
new
ãã !
Response
ãã" *
<
ãã* +
Void
ãã+ /
>
ãã/ 0
(
ãã0 1
e
ãã1 2
.
ãã2 3
Message
ãã3 :
)
ãã: ;
)
ãã; <
;
ãã< =
}
åå 	
}
çç 
[
êê 
HttpGet
êê 
]
êê 
public
ëë 

ActionResult
ëë 
GetAll
ëë 
(
ëë 
)
ëë  
{
íí 
try
ìì 
{
îî 	
List
ïï 
<
ïï 
Entities
ïï 
.
ïï 
Proyect
ïï !
>
ïï! "
proyects
ïï# +
=
ïï, -
_proyectService
ññ 
.
ññ  
GetAll
ññ  &
(
ññ& '
)
ññ' (
;
ññ( )
if
óó 
(
óó 
proyects
óó 
.
óó 
Count
óó 
<
óó  
$num
óó! "
)
óó" #
{
òò 
return
ôô 

BadRequest
ôô !
(
ôô! "
new
öö 
Response
öö  
<
öö  !
Void
öö! %
>
öö% &
(
öö& '
$str
öö' I
)
ööI J
)
ööJ K
;
ööK L
}
õõ 
return
ùù 
Ok
ùù 
(
ùù 
new
ùù 
Response
ùù "
<
ùù" #
List
ùù# '
<
ùù' (
ProyectResponse
ùù( 7
>
ùù7 8
>
ùù8 9
(
ùù9 :
proyects
ûû 
?
ûû 
.
ûû 
Adapt
ûû 
<
ûû  
List
ûû  $
<
ûû$ %
ProyectResponse
ûû% 4
>
ûû4 5
>
ûû5 6
(
ûû6 7
)
ûû7 8
)
ûû8 9
)
ûû9 :
;
ûû: ;
}
üü 	
catch
†† 
(
†† 
PersonExeption
†† 
e
†† 
)
††  
{
°° 	
return
¢¢ 

BadRequest
¢¢ 
(
¢¢ 
new
¢¢ !
Response
¢¢" *
<
¢¢* +
Void
¢¢+ /
>
¢¢/ 0
(
¢¢0 1
e
¢¢1 2
.
¢¢2 3
Message
¢¢3 :
)
¢¢: ;
)
¢¢; <
;
¢¢< =
}
££ 	
}
§§ 
[
¶¶ 

HttpDelete
¶¶ 
(
¶¶ 
$str
¶¶ 
)
¶¶ 
]
¶¶ 
[
ßß 
	Authorize
ßß 
(
ßß 
Roles
ßß 
=
ßß 
(
ßß 
$str
ßß $
)
ßß$ %
)
ßß% &
]
ßß& '
public
®® 

ActionResult
®® 
DeleteProyect
®® %
(
®®% &
[
®®& '
	FromRoute
®®' 0
]
®®0 1
string
®®2 8
code
®®9 =
)
®®= >
{
©© 
try
™™ 
{
´´ 	
string
¨¨ 
message
¨¨ 
=
¨¨ 
_proyectService
¨¨ ,
.
¨¨, -
DeleteProyect
¨¨- :
(
¨¨: ;
code
¨¨; ?
)
¨¨? @
;
¨¨@ A
return
≠≠ 
Ok
≠≠ 
(
≠≠ 
new
≠≠ 
Response
≠≠ "
<
≠≠" #
Void
≠≠# '
>
≠≠' (
(
≠≠( )
message
≠≠) 0
,
≠≠0 1
false
≠≠2 7
)
≠≠7 8
)
≠≠8 9
;
≠≠9 :
}
ÆÆ 	
catch
ØØ 
(
ØØ 
	Exception
ØØ 
e
ØØ 
)
ØØ 
{
∞∞ 	
return
±± 

BadRequest
±± 
(
±± 
new
±± !
Response
±±" *
<
±±* +
Void
±±+ /
>
±±/ 0
(
±±0 1
e
±±1 2
.
±±2 3
Message
±±3 :
)
±±: ;
)
±±; <
;
±±< =
}
≤≤ 	
}
≥≥ 
[
µµ 
HttpGet
µµ 
(
µµ 
$str
µµ >
)
µµ> ?
]
µµ? @
[
∂∂ 
	Authorize
∂∂ 
(
∂∂ 
Roles
∂∂ 
=
∂∂ 
$str
∂∂ .
)
∂∂. /
]
∂∂/ 0
public
∑∑ 

ActionResult
∑∑ 2
$GetGeneralStatisticsProyectProfessor
∑∑ <
(
∑∑< =
[
∑∑= >
	FromRoute
∑∑> G
]
∑∑G H
string
∑∑I O
document
∑∑P X
)
∑∑X Y
{
∏∏ 
try
ππ 
{
∫∫ 	
object
ªª 

statistics
ªª 
=
ªª 
_proyectService
ºº 
.
ºº  /
!GeneralStatisticsProyectProfessor
ºº  A
(
ººA B
document
ººB J
)
ººJ K
;
ººK L
if
ΩΩ 
(
ΩΩ 

statistics
ΩΩ 
==
ΩΩ 
null
ΩΩ "
)
ΩΩ" #
{
ææ 
return
øø 

BadRequest
øø !
(
øø! "
new
¿¿ 
Response
¿¿  
<
¿¿  !
Void
¿¿! %
>
¿¿% &
(
¿¿& '
$str
¿¿' N
)
¿¿N O
)
¿¿O P
;
¿¿P Q
}
¡¡ 
return
√√ 
Ok
√√ 
(
√√ 
new
√√ 
Response
√√ "
<
√√" #
object
√√# )
>
√√) *
(
√√* +

statistics
√√+ 5
)
√√5 6
)
√√6 7
;
√√7 8
}
ƒƒ 	
catch
≈≈ 
(
≈≈ 
PersonExeption
≈≈ 
e
≈≈ 
)
≈≈  
{
∆∆ 	
return
«« 

BadRequest
«« 
(
«« 
new
«« !
Response
««" *
<
««* +
Void
««+ /
>
««/ 0
(
««0 1
e
««1 2
.
««2 3
Message
««3 :
)
««: ;
)
««; <
;
««< =
}
»» 	
}
…… 
[
ÀÀ 
HttpGet
ÀÀ 
(
ÀÀ 
$str
ÀÀ <
)
ÀÀ< =
]
ÀÀ= >
[
ÃÃ 
	Authorize
ÃÃ 
(
ÃÃ 
Roles
ÃÃ 
=
ÃÃ 
$str
ÃÃ 1
)
ÃÃ1 2
]
ÃÃ2 3
public
ÕÕ 

ActionResult
ÕÕ 0
"GetGeneralStatisticsProyectStudent
ÕÕ :
(
ÕÕ: ;
[
ÕÕ; <
	FromRoute
ÕÕ< E
]
ÕÕE F
string
ÕÕG M
document
ÕÕN V
)
ÕÕV W
{
ŒŒ 
try
œœ 
{
–– 	
object
—— 

statistics
—— 
=
—— 
_proyectService
““ 
.
““  -
GeneralStatisticsProyectStudent
““  ?
(
““? @
document
““@ H
)
““H I
;
““I J
if
”” 
(
”” 

statistics
”” 
==
”” 
null
”” "
)
””" #
{
‘‘ 
return
’’ 

BadRequest
’’ !
(
’’! "
new
÷÷ 
Response
÷÷  
<
÷÷  !
Void
÷÷! %
>
÷÷% &
(
÷÷& '
$str
÷÷' N
)
÷÷N O
)
÷÷O P
;
÷÷P Q
}
◊◊ 
return
ŸŸ 
Ok
ŸŸ 
(
ŸŸ 
new
ŸŸ 
Response
ŸŸ "
<
ŸŸ" #
object
ŸŸ# )
>
ŸŸ) *
(
ŸŸ* +

statistics
ŸŸ+ 5
)
ŸŸ5 6
)
ŸŸ6 7
;
ŸŸ7 8
}
⁄⁄ 	
catch
€€ 
(
€€ 
PersonExeption
€€ 
e
€€ 
)
€€  
{
‹‹ 	
return
›› 

BadRequest
›› 
(
›› 
new
›› !
Response
››" *
<
››* +
Void
››+ /
>
››/ 0
(
››0 1
e
››1 2
.
››2 3
Message
››3 :
)
››: ;
)
››; <
;
››< =
}
ﬁﬁ 	
}
ﬂﬂ 
[
·· 
HttpGet
·· 
(
·· 
$str
·· )
)
··) *
]
··* +
[
‚‚ 
	Authorize
‚‚ 
(
‚‚ 
Roles
‚‚ 
=
‚‚ 
$str
‚‚ &
)
‚‚& '
]
‚‚' (
public
„„ 

ActionResult
„„ +
GetGeneralStatisticsProposals
„„ 5
(
„„5 6
)
„„6 7
{
‰‰ 
try
ÂÂ 
{
ÊÊ 	
object
ÁÁ 

statistics
ÁÁ 
=
ÁÁ 
_proyectService
ËË 
.
ËË  '
GeneralStatisticsProyects
ËË  9
(
ËË9 :
)
ËË: ;
;
ËË; <
if
ÈÈ 
(
ÈÈ 

statistics
ÈÈ 
==
ÈÈ 
null
ÈÈ "
)
ÈÈ" #
{
ÍÍ 
return
ÎÎ 

BadRequest
ÎÎ !
(
ÎÎ! "
new
ÏÏ 
Response
ÏÏ  
<
ÏÏ  !
Void
ÏÏ! %
>
ÏÏ% &
(
ÏÏ& '
$str
ÏÏ' <
)
ÏÏ< =
)
ÏÏ= >
;
ÏÏ> ?
}
ÌÌ 
return
ÔÔ 
Ok
ÔÔ 
(
ÔÔ 
new
ÔÔ 
Response
ÔÔ "
<
ÔÔ" #
object
ÔÔ# )
>
ÔÔ) *
(
ÔÔ* +

statistics
ÔÔ+ 5
)
ÔÔ5 6
)
ÔÔ6 7
;
ÔÔ7 8
}
 	
catch
ÒÒ 
(
ÒÒ 
PersonExeption
ÒÒ 
e
ÒÒ 
)
ÒÒ  
{
ÚÚ 	
return
ÛÛ 

BadRequest
ÛÛ 
(
ÛÛ 
new
ÛÛ !
Response
ÛÛ" *
<
ÛÛ* +
Void
ÛÛ+ /
>
ÛÛ/ 0
(
ÛÛ0 1
e
ÛÛ1 2
.
ÛÛ2 3
Message
ÛÛ3 :
)
ÛÛ: ;
)
ÛÛ; <
;
ÛÛ< =
}
ÙÙ 	
}
ıı 
}ˆˆ £
WC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\Proyect\ProyectRequest.cs
	namespace 	
Api
 
. 
Controllers 
. 
Proyect !
;! "
public 
record 
ProyectRequest 
( 
string #
?# $
PersonDocument% 3
,3 4
string 

?
 
Content 
, 
string 
? 
Status #
,# $
int% (
?( )
Score* /
,/ 0
string1 7
?7 8
ProposalCode9 E
)E F
;F G∫
XC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\Proyect\ProyectResponse.cs
	namespace 	
Api
 
. 
Controllers 
. 
Proyect !
;! "
public 
record 
ProyectResponse 
( 
string $
?$ %
Code& *
,* +
string, 2
?2 3
PersonDocument4 B
,B C
stringC I
?I J
ProfessorDocumentK \
,\ ]
string 

?
 
Content 
, 
string 
? 
Status #
,# $
int% (
?( )
Score* /
,/ 0
string1 7
?7 8
ProposalCode9 E
)E F
;F G€
]C:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\Proyect\ProyectUpdateRequest.cs
	namespace 	
Api
 
. 
Controllers 
. 
Proyect !
;! "
public 
record  
ProyectUpdateRequest "
(" #
string# )
?) *
ProfessorDocument+ <
,< =
string> D
?D E
codeF J
)J K
;K L¥
`C:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\ResearchLines\CreateLineRequest.cs
	namespace 	
Api
 
. 
Controllers 
. 
ResearchLines '
;' (
public 
record 
CreateLineRequest 
(  
string 

Code 
, 
string 

Name 
) 
; π'
fC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\ResearchLines\ResearchLinesController.cs
	namespace 	
Api
 
. 
Controllers 
. 
ResearchLines '
;' (
[ 
ApiController 
] 
[		 
Route		 
(		 
$str		 
)		 
]		 
public

 
class

 #
ResearchLinesController

 $
:

% &
ControllerBase

' 5
{ 
private 
readonly 
ResearchLineService ( 
_researchLineService) =
;= >
public 
#
ResearchLinesController "
(" #
ResearchLineService# 6
researchLineService7 J
)J K
{  
_researchLineService 
= 
researchLineService 2
;2 3
} 
[ 
HttpPost 
] 
public 

ActionResult  
RegisterResearchLine ,
(, -
[ 	
FromBody	 
] 
CreateLineRequest $
createLineRequest% 6
)6 7
{ 
try 
{ 	
var 
line 
= 
createLineRequest .
.. /
Adapt/ 4
<4 5
ResearchLine5 A
>A B
(B C
)C D
;D E
string 
message 
=  
_researchLineService 1
.1 2
SaveLine2 :
(: ;
line; ?
)? @
;@ A
return 
Ok 
( 
new 
Response "
<" #
Void# '
>' (
(( )
message) 0
,0 1
false2 7
)7 8
)8 9
;9 :
} 	
catch 
( 
	Exception 
e 
) 
{ 	
return 

BadRequest 
( 
new !
Response" *
<* +
Void+ /
>/ 0
(0 1
e1 2
.2 3
Message3 :
): ;
); <
;< =
}   	
}!! 
[## 
HttpGet## 
(## 
$str## 
)## 
]## 
public$$ 

ActionResult$$ 
GetResearchLine$$ '
($$' (
[$$( )
	FromRoute$$) 2
]$$2 3
string$$4 :
code$$; ?
)$$? @
{%% 
ResearchLine&& 
?&& 
researchLine&& "
=&&# $ 
_researchLineService''  
.''  !

SearchLine''! +
(''+ ,
code'', 0
)''0 1
;''1 2
if(( 

((( 
researchLine(( 
!(( 
.(( 
Code(( 
==(( !
null((" &
)((& '
{)) 	
return** 

BadRequest** 
(** 
new++ 
Response++ 
<++ 
Void++ !
>++! "
(++" #
$str++# Z
)++Z [
)++[ \
;++\ ]
},, 	
else,,	 
{-- 	
return.. 
Ok.. 
(.. 
new// 
Response// 
<// !
ResearchLinesResponse// 2
>//2 3
(//3 4
researchLine//4 @
?//@ A
.00 
Adapt00 
<00 !
ResearchLinesResponse00 0
>000 1
(001 2
)002 3
)003 4
)004 5
;005 6
}11 	
}22 
[44 
HttpGet44 
(44 
$str44 !
)44! "
]44" #
public55 

ActionResult55 
GetResearchLine55 '
(55' (
)55( )
{66 
List77 
<77 
ResearchLine77 
>77 
researchLines77 (
=77) * 
_researchLineService88  
.88  !
GetLines88! )
(88) *
)88* +
;88+ ,
if99 

(99 
researchLines99 
.99 
Count99 
<99  !
$num99" #
)99# $
{:: 	
return;; 

BadRequest;; 
(;; 
new<< 
Response<< 
<<< 
Void<< !
><<! "
(<<" #
$str<<# N
)<<N O
)<<O P
;<<P Q
}== 	
return?? 
Ok?? 
(?? 
new?? 
Response?? 
<?? 
List?? #
<??# $!
ResearchLinesResponse??$ 9
>??9 :
>??: ;
(??; <
researchLines@@ 
?@@ 
.@@ 
Adapt@@  
<@@  !
List@@! %
<@@% &!
ResearchLinesResponse@@& ;
>@@; <
>@@< =
(@@= >
)@@> ?
)@@? @
)@@@ A
;@@A B
}AA 
}BB ‹
dC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\ResearchLines\ResearchLinesResponse.cs
	namespace 	
Api
 
. 
Controllers 
. 
ResearchLines '
;' (
public 
record !
ResearchLinesResponse #
(# $
string$ *
?* +
Code, 0
,0 1
string2 8
?8 9
Name: >
)> ?
;? @Ä
fC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\ResearchSubLines\CreateSubLineRequest.cs
	namespace 	
Api
 
. 
Controllers 
. 
ResearchLines '
;' (
public 
record  
CreateSubLineRequest "
(" #
string 

Code 
, 
string 

Name 
, 
string 

ResearchLineCode 
) 
; ∑
iC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\ResearchSubLines\ResearchSubLineResponse.cs
	namespace 	
Api
 
. 
Controllers 
. 
ResearchSubLines *
;* +
public 
record $
ResearchSubLinesResponse &
(& '
string' -
?- .
Code/ 3
,3 4
string5 ;
?; <
Name= A
,A B
string 

?
 
ResearchLineCode 
) 
; ‡(
lC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\ResearchSubLines\ResearchSubLinesController.cs
	namespace		 	
Api		
 
.		 
Controllers		 
.		 
ResearchSubLines		 *
;		* +
[ 
ApiController 
] 
[ 
Route 
( 
$str 
) 
] 
public 
class &
ResearchSubLinesController '
:( )
ControllerBase* 8
{ 
private 
readonly "
ResearchSubLineService +#
_researchSubLineService, C
;C D
public 
&
ResearchSubLinesController %
(% &"
ResearchSubLineService "
researchSubLineService 5
)5 6
{ #
_researchSubLineService 
=  !"
researchSubLineService" 8
;8 9
} 
[ 
HttpPost 
] 
public 

ActionResult )
RegisterSublinesInvestigation 5
(5 6
[ 	
FromBody	 
]  
CreateSubLineRequest ' 
createSublineRequest( <
)< =
{ 
try 
{ 	
var 
subline 
=  
createSublineRequest 1
.1 2
Adapt2 7
<7 8
ResearchSubline8 G
>G H
(H I
)I J
;J K
string 
message 
= #
_researchSubLineService 4
.4 5
SaveSubline5 @
(@ A
sublineA H
)H I
;I J
return 
Ok 
( 
new 
Response "
<" #
Void# '
>' (
(( )
message) 0
,0 1
false2 7
)7 8
)8 9
;9 :
}   	
catch!! 
(!! 
	Exception!! 
e!! 
)!! 
{"" 	
return## 

BadRequest## 
(## 
new## !
Response##" *
<##* +
Void##+ /
>##/ 0
(##0 1
e##1 2
.##2 3
Message##3 :
)##: ;
)##; <
;##< =
}$$ 	
}%% 
['' 
HttpGet'' 
('' 
$str'' 
)'' 
]'' 
public(( 

ActionResult(( 
GetResearchSubLine(( *
(((* +
[((+ ,
	FromRoute((, 5
]((5 6
string((7 =
code((> B
)((B C
{)) 
try** 
{++ 	
List,, 
<,, 
ResearchSubline,,  
>,,  !
researchSubline,," 1
=,,2 3#
_researchSubLineService-- '
.--' (
SearchSubLine--( 5
(--5 6
code--6 :
)--: ;
;--; <
return.. 
Ok.. 
(.. 
new// 
Response// 
<// 
List// !
<//! "$
ResearchSubLinesResponse//" :
>//: ;
>//; <
(//< =
researchSubline//= L
?//L M
.00 
Adapt00 
<00 
List00 
<00  $
ResearchSubLinesResponse00  8
>008 9
>009 :
(00: ;
)00; <
)00< =
)00= >
;00> ?
}11 	
catch22 
(22 
	Exception22 
e22 
)22 
{33 	
return44 

BadRequest44 
(44 
new55 
Response55 
<55 
Void55 !
>55! "
(55" #
$str55# V
)55V W
)55W X
;55X Y
}66 	
}88 
[:: 
HttpGet:: 
(:: 
$str:: %
)::% &
]::& '
public;; 

ActionResult;; 
GetResearchSubLines;; +
(;;+ ,
);;, -
{<< 
try== 
{>> 	
List?? 
<?? 
ResearchSubline??  
>??  !
researchSublines??" 2
=??3 4#
_researchSubLineService@@ '
.@@' (
GetLines@@( 0
(@@0 1
)@@1 2
;@@2 3
returnAA 
OkAA 
(AA 
newAA 
ResponseAA "
<AA" #
ListAA# '
<AA' ($
ResearchSubLinesResponseAA( @
>AA@ A
>AAA B
(AAB C
researchSublinesBB  
?BB  !
.BB! "
AdaptBB" '
<BB' (
ListBB( ,
<BB, -$
ResearchSubLinesResponseBB- E
>BBE F
>BBF G
(BBG H
)BBH I
)BBI J
)BBJ K
;BBK L
}CC 	
catchDD 
(DD 
	ExceptionDD 
eDD 
)DD 
{EE 	
returnFF 

BadRequestFF 
(FF 
newGG 
ResponseGG  (
<GG( )
VoidGG) -
>GG- .
(GG. /
$strGG/ ]
)GG] ^
)GG^ _
;GG_ `
}HH 	
}JJ 
}KK œ
IC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\Response.cs
	namespace 	
Api
 
. 
Controllers 
; 
public 
record 
Void 
; 
public 
record 
Response 
< 
TData 
> 
{ 
public 

Response 
( 
TData 
? 
data 
)  
{ 
Data 
= 
data 
; 
	HasErrors		 
=		 
false		 
;		 
}

 
public 

Response 
( 
string 
? 
message #
,# $
TData% *
?* +
data, 0
)0 1
{ 
Message 
= 
message 
; 
Data 
= 
data 
; 
	HasErrors 
= 
false 
; 
} 
public 

Response 
( 
string 
? 
message #
,# $
bool% )
	hasErrors* 3
)3 4
{ 
Message 
= 
message 
; 
	HasErrors 
= 
	hasErrors 
; 
} 
public 

Response 
( 
string 
? 
message #
)# $
{ 
Message 
= 
message 
; 
	HasErrors 
= 
true 
; 
} 
public 

string 
? 
Message 
{ 
get "
;" #
set$ '
;' (
}) *
public   

TData   
?   
Data   
{   
get   "
;  " #
set  $ '
;  ' (
}  ) *
public!! 

bool!! 
	HasErrors!! 
{!! 
get!! "
;!!" #
set!!$ '
;!!' (
}!!) *
}"" É
^C:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\Students\CreateStudentRequest.cs
	namespace 	
Api
 
. 
Controllers 
. 
Students "
;" #
public 
record  
CreateStudentRequest "
(" #
string 

Document 
, 
string 

AcademicProgramCode 
, 
string 

AmountCredits 
)		 
;		 …%
[C:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\Students\StudentController.cs
	namespace 	
Api
 
. 
Controllers 
. 
Students "
;" #
[

 
ApiController

 
]

 
[ 
Route 
( 
$str 
) 
] 
public 
class 
StudentController 
:  
ControllerBase! /
{ 
private 
readonly 
StudentsService $
_studentsService% 5
;5 6
private 
readonly 
PeopleService "
_peopleService# 1
;1 2
public 

StudentController 
( 
StudentsService ,
studentsService- <
,< =
PeopleService= J
peopleServiceK X
)X Y
{ 
_studentsService 
= 
studentsService *
;* +
_peopleService 
= 
peopleService &
;& '
} 
[ 
HttpPost 
] 
public 

ActionResult 
RegisterStudent '
(' (
[ 	
FromBody	 
]  
CreateStudentRequest ' 
createStudentRequest( <
)< =
{ 
try 
{ 	
if 
( 
_peopleService 
. 
SearchPerson +
(+ , 
createStudentRequest, @
.@ A
DocumentA I
)I J
!=K M
nullN R
&&S U
_studentsService  
.  !
SearchStudent! .
(. / 
createStudentRequest/ C
.C D
DocumentD L
)L M
==N P
nullQ U
)U V
{ 
_studentsService    
.    !
SaveStudent  ! ,
(  , - 
createStudentRequest  - A
.  A B
Adapt  B G
<  G H
Student  H O
>  O P
(  P Q
)  Q R
)  R S
;  S T
return!! 
Ok!! 
(!! 
new!! 
Response!! &
<!!& '
Void!!' +
>!!+ ,
(!!, -
$str!!- J
,!!J K
false!!L Q
)!!Q R
)!!R S
;!!S T
}"" 
return## 

BadRequest## 
(## 
new## !
Response##" *
<##* +
Void##+ /
>##/ 0
(##0 1
$str##1 P
)##P Q
)##Q R
;##R S
}$$ 	
catch%% 
(%% 
PersonExeption%% 
exeption%% &
)%%& '
{&& 	
return'' 

BadRequest'' 
('' 
new'' !
Response''" *
<''* +
Void''+ /
>''/ 0
(''0 1
exeption''1 9
.''9 :
Message'': A
)''A B
)''B C
;''C D
}(( 	
})) 
[,, 
HttpGet,, 
(,, 
$str,, 
),, 
],, 
public-- 

ActionResult-- 

GetStudent-- "
(--" #
[--# $
	FromRoute--$ -
]--- .
string--/ 5
document--6 >
)--> ?
{.. 
try// 
{00 	
Student11 
?11 
student11 
=11 
_studentsService11 /
.11/ 0
SearchStudent110 =
(11= >
document11> F
)11F G
;11G H
if22 
(22 
student22 
==22 
null22 
)22 
{33 
return44 

BadRequest44 !
(44! "
new44" %
Response44& .
<44. /
Void44/ 3
>443 4
(444 5
$str445 U
)44U V
)44V W
;44W X
}55 
return66 
Ok66 
(66 
new66 
Response66 "
<66" #
StudentResponse66# 2
>662 3
(663 4
student664 ;
.66; <
Adapt66< A
<66A B
StudentResponse66B Q
>66Q R
(66R S
)66S T
)66T U
)66U V
;66V W
}77 	
catch88 
(88 
PersonExeption88 
e88 
)88  
{99 	
return:: 

BadRequest:: 
(:: 
new:: !
Response::" *
<::* +
Void::+ /
>::/ 0
(::0 1
e::1 2
.::2 3
Message::3 :
)::: ;
)::; <
;::< =
};; 	
}<< 
}>> ˘
YC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\Students\StudentResponse.cs
	namespace 	
Api
 
. 
Controllers 
. 
Students "
;" #
public 
record 
StudentResponse 
( 
string 

Document 
, 
string 

AcademicProgramCode 
, 
string 

AmountCredits 
) 
; ú
[C:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\Studies\CreateStudyRequest.cs
	namespace 	
Api
 
. 
Controllers 
. 
People  
;  !
public 
record 
CreateStudyRequest  
(  !
string 

Code 
, 
string 

Institution 
, 
DateTime 
	StartDate 
, 
DateTime 
EndDate 
, 
string 


CitiesCode 
, 
string		 


PeopleCode		 
)

 
;

 ì
ZC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\Studies\StudiesController.cs
	namespace 	
Api
 
. 
Controllers 
. 
People  
;  !
[		 
ApiController		 
]		 
[

 
Route

 
(

 
$str

 
)

 
]

 
public 
class 
StudiesController 
:  
ControllerBase! /
{ 
private 
readonly 
StudiesService #
_studiesService$ 3
;3 4
public 

StudiesController 
( 
StudiesService +
studiesService, :
): ;
{ 
_studiesService 
= 
studiesService (
;( )
} 
[ 
HttpPost 
] 
public 

ActionResult 
RegisterStudy %
(% &
[ 	
FromBody	 
] 
CreateStudyRequest %
createStudyRequest& 8
)8 9
{ 
try 
{ 	
var 
study 
= 
createStudyRequest *
.* +
Adapt+ 0
<0 1
Study1 6
>6 7
(7 8
)8 9
;9 :
_studiesService 
. 
	SaveStudy %
(% &
study& +
)+ ,
;, -
return 
Ok 
( 
new 
Response "
<" #
Void# '
>' (
(( )
$str) N
,N O
false 
) 
) 
; 
} 	
catch 
( 
PersonExeption 
exeption &
)& '
{   	
return!! 

BadRequest!! 
(!! 
new!! !
Response!!" *
<!!* +
Void!!+ /
>!!/ 0
(!!0 1
exeption!!1 9
.!!9 :
Message!!: A
)!!A B
)!!B C
;!!C D
}"" 	
}## 
[%% 
HttpGet%% 
(%% 
$str%% 
)%% 
]%% 
public&& 

ActionResult&& 

GetStudies&& "
(&&" #
[&&# $
	FromRoute&&$ -
]&&- .
string&&/ 5
document&&6 >
)&&> ?
{'' 
try(( 
{)) 	
var** 
studies** 
=** 
_studiesService** )
.**) *
SearchStudies*** 7
(**7 8
document**8 @
)**@ A
;**A B
if++ 
(++ 
studies++ 
.++ 
Count++ 
<=++  
$num++! "
)++" #
{,, 
return-- 

BadRequest-- !
(--! "
new.. 
Response..  
<..  !
Void..! %
>..% &
(..& '
$str..' D
)..D E
)..E F
;..F G
}// 
return11 
Ok11 
(11 
new22 
Response22 
<22 
List22 !
<22! "
StudiesResponse22" 1
>221 2
>222 3
(223 4
studies33 
.33 
Adapt33 !
<33! "
List33" &
<33& '
StudiesResponse33' 6
>336 7
>337 8
(338 9
)339 :
)33: ;
)33; <
;33< =
}44 	
catch55 
(55 
StudyExeption55 
e55 
)55 
{66 	
return77 

BadRequest77 
(77 
new77 !
Response77" *
<77* +
Void77+ /
>77/ 0
(770 1
e771 2
.772 3
Message773 :
)77: ;
)77; <
;77< =
}88 	
}99 
}:: ñ
XC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\Studies\StudiesResponse.cs
	namespace 	
Api
 
. 
Controllers 
. 
People  
;  !
public 
record 
StudiesResponse 
( 
string 

Code 
, 
string 

Institution 
, 
DateTime 
	StartDate 
, 
DateTime 
EndDate 
, 
string 


CitiesCode 
, 
string		 


PeopleCode		 
)

 
;

 ä
hC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\ThematicAreas\CreateThematicAreaRequest.cs
	namespace 	
Api
 
. 
Controllers 
. 
ThematicAreas '
;' (
public 
record %
CreateThematicAreaRequest '
(' (
string( .
Code/ 3
,3 4
string4 :
Name; ?
,? @
stringA G
ResearchSublineCodeH [
)[ \
;\ ]´
cC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\ThematicAreas\ThematicAreaResponse.cs
	namespace 	
Api
 
. 
Controllers 
. 
ThematicAreas '
;' (
public 
record  
ThematicAreaResponse "
(" #
string 

?
 
Code 
, 
string 

?
 
Name 
, 
string 

?
 
ResearchSublineCode 
) 
; Æ(
fC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Controllers\ThematicAreas\ThematicAreasController.cs
	namespace 	
Api
 
. 
Controllers 
. 
ThematicAreas '
;' (
[

 
ApiController

 
]

 
[ 
Route 
( 
$str 
) 
] 
public 
class #
ThematicAreasController $
:% &
ControllerBase' 5
{ 
private 
readonly 
ThematicAreaService ( 
_thematicAreaService) =
;= >
public 
#
ThematicAreasController "
(" #
ThematicAreaService# 6
thematicAreaService7 J
)J K
{  
_thematicAreaService 
= 
thematicAreaService 2
;2 3
} 
[ 
HttpPost 
] 
public 

ActionResult  
RegisterThematicArea ,
(, -
[ 	
FromBody	 
] %
CreateThematicAreaRequest ,%
createThematicAreaRequest- F
)F G
{ 
try 
{ 	
var 
thematicArea 
= %
createThematicAreaRequest 8
.8 9
Adapt9 >
<> ?
ThematicArea? K
>K L
(L M
)M N
;N O
string 
message 
=  
_thematicAreaService $
.$ %
SaveThematicArea% 5
(5 6
thematicArea6 B
)B C
;C D
return 
Ok 
( 
new 
Response "
<" #
Void# '
>' (
(( )
message) 0
,0 1
false2 7
)7 8
)8 9
;9 :
} 	
catch   
(   
	Exception   
e   
)   
{!! 	
return"" 

BadRequest"" 
("" 
new"" !
Response""" *
<""* +
Void""+ /
>""/ 0
(""0 1
e""1 2
.""2 3
Message""3 :
)"": ;
)""; <
;""< =
}## 	
}$$ 
[&& 
HttpGet&& 
(&& 
$str&& 
)&& 
]&& 
public'' 

ActionResult'' 
GetThematicArea'' '
(''' (
[''( )
	FromRoute'') 2
]''2 3
string''4 :
code''; ?
)''? @
{(( 
try)) 
{** 	
List++ 
<++ 
ThematicArea++ 
>++ 
thematicArea++ +
=++, - 
_thematicAreaService,, $
.,,$ %
SearchThematicArea,,% 7
(,,7 8
code,,8 <
),,< =
;,,= >
return-- 
Ok-- 
(-- 
new.. 
Response.. 
<.. 
List.. !
<..! " 
ThematicAreaResponse.." 6
>..6 7
>..7 8
(..8 9
thematicArea..9 E
?..E F
.// 
Adapt// 
<// 
List// 
<//   
ThematicAreaResponse//  4
>//4 5
>//5 6
(//6 7
)//7 8
)//8 9
)//9 :
;//: ;
}00 	
catch11 
(11  
ThematicAreaExeption11 #
e11$ %
)11% &
{22 	
return33 

BadRequest33 
(33 
new33 !
Response33" *
<33* +
Void33+ /
>33/ 0
(330 1
$str331 c
)33c d
)33d e
;33e f
}44 	
}55 
[77 
HttpGet77 
(77 
$str77 
)77 
]77 
public88 

ActionResult88 
GetThematicAreas88 (
(88( )
)88) *
{99 
try:: 
{;; 	
List<< 
<<< 
ThematicArea<< 
><< 
thematicAreas<< ,
=<<- . 
_thematicAreaService<</ C
.<<C D!
GetLinesThematicAreas<<D Y
(<<Y Z
)<<Z [
;<<[ \
return== 
Ok== 
(== 
new== 
Response== "
<==" #
List==# '
<==' ( 
ThematicAreaResponse==( <
>==< =
>=== >
(==> ?
thematicAreas==? L
.==L M
Adapt==M R
<==R S
List==S W
<==W X 
ThematicAreaResponse==X l
>==l m
>==m n
(==n o
)==o p
)==p q
)==q r
;==r s
}>> 	
catch?? 
(?? 
	Exception?? 
e?? 
)?? 
{@@ 	
returnAA 

BadRequestAA 
(AA 
newBB 
ResponseBB 
<BB 
VoidBB !
>BB! "
(BB" #
$strBB# F
)BBF G
)BBG H
;BBH I
}CC 	
}EE 
}FF Û
EC:\Users\sofia\Documents\project\Pegi.Api\src\Api\DataBaseProvider.cs
	namespace 	
Api
 
; 
public 
static 
class 
DataBaseProvider $
{ 
private 
const 
string 
MigrationsAssembly +
=, -
$str. 3
;3 4
public

 

static

 #
DbContextOptionsBuilder

 )
SetupDatabaseEngine

* =
(

= >
this #
DbContextOptionsBuilder $
options% ,
,, -
string. 4
connectionString5 E
) 
{ 
options 
. 
	UseNpgsql 
( 
connectionString *
,* +
builder, 3
=>4 6
builder7 >
.> ?
MigrationsAssembly? Q
(Q R
MigrationsAssemblyR d
)d e
)e f
.  
EnableDetailedErrors !
(! "
)" #
;# $
return 
options 
; 
} 
} ò5
HC:\Users\sofia\Documents\project\Pegi.Api\src\Api\DependencyInjection.cs
	namespace 	
Api
 
; 
public 
static 
class 
DependencyInjection '
{		 
public

 

static

 
void

 
AddRepositories

 &
(

& '
this

' +
IServiceCollection

, >
repositories

? K
)

K L
{ 
repositories 
. 
	AddScoped 
< 
UsersRepository .
>. /
(/ 0
)0 1
;1 2
repositories 
. 
	AddScoped 
< 
PeopleRepository /
>/ 0
(0 1
)1 2
;2 3
repositories 
. 
	AddScoped 
< 
CitiesRepository /
>/ 0
(0 1
)1 2
;2 3
repositories 
. 
	AddScoped 
< !
DepartmentsRepository 4
>4 5
(5 6
)6 7
;7 8
repositories 
. 
	AddScoped 
< 
StudiesRespository 1
>1 2
(2 3
)3 4
;4 5
repositories 
. 
	AddScoped 
< !
ExperiencesRepository 4
>4 5
(5 6
)6 7
;7 8
repositories 
. 
	AddScoped 
< 
ProfessorRepository 2
>2 3
(3 4
)4 5
;5 6
repositories 
. 
	AddScoped 
< &
AcademicProgramsRepository 9
>9 :
(: ;
); <
;< =
repositories 
. 
	AddScoped 
< 
StudentsRepository 1
>1 2
(2 3
)3 4
;4 5
repositories 
. 
	AddScoped 
< #
ThematicAreasRepository 6
>6 7
(7 8
)8 9
;9 :
repositories 
. 
	AddScoped 
< &
ResearchSubLinesRepository 9
>9 :
(: ;
); <
;< =
repositories 
. 
	AddScoped 
< #
ResearchLinesRepository 6
>6 7
(7 8
)8 9
;9 :
repositories 
. 
	AddScoped 
< 
ProposalRepository 1
>1 2
(2 3
)3 4
;4 5
repositories 
. 
	AddScoped 
< &
ProposalFeedBackRepository 9
>9 :
(: ;
); <
;< =
repositories 
. 
	AddScoped 
< &
HistoryProposalsRepository 9
>9 :
(: ;
); <
;< =
repositories 
. 
	AddScoped 
< 
ProyectRepository 0
>0 1
(1 2
)2 3
;3 4
repositories 
. 
	AddScoped 
< $
HistoryProyectRepository 7
>7 8
(8 9
)9 :
;: ;
repositories 
. 
	AddScoped 
< %
ProyectFeedBackRepository 8
>8 9
(9 :
): ;
;; <
} 
public   

static   
void   
AddServices   "
(  " #
this  # '
IServiceCollection  ( :
services  ; C
)  C D
{!! 
services"" 
."" 
	AddScoped"" 
<"" 
LocationsService"" +
>""+ ,
("", -
)""- .
;"". /
services## 
.## 
	AddScoped## 
<## 
AuthService## &
>##& '
(##' (
)##( )
;##) *
services$$ 
.$$ 
	AddScoped$$ 
<$$ 
UsersService$$ '
>$$' (
($$( )
)$$) *
;$$* +
services%% 
.%% 
	AddScoped%% 
<%% 
PeopleService%% (
>%%( )
(%%) *
)%%* +
;%%+ ,
services&& 
.&& 
	AddScoped&& 
<&& 
StudiesService&& )
>&&) *
(&&* +
)&&+ ,
;&&, -
services'' 
.'' 
	AddScoped'' 
<'' 
ExperienceService'' ,
>'', -
(''- .
)''. /
;''/ 0
services(( 
.(( 
	AddScoped(( 
<(( 
ProfessorService(( +
>((+ ,
(((, -
)((- .
;((. /
services)) 
.)) 
	AddScoped)) 
<)) "
AcademicProgramService)) 1
>))1 2
())2 3
)))3 4
;))4 5
services** 
.** 
	AddScoped** 
<** 
StudentsService** *
>*** +
(**+ ,
)**, -
;**- .
services++ 
.++ 
	AddScoped++ 
<++ 
ThematicAreaService++ .
>++. /
(++/ 0
)++0 1
;++1 2
services,, 
.,, 
	AddScoped,, 
<,, "
ResearchSubLineService,, 1
>,,1 2
(,,2 3
),,3 4
;,,4 5
services-- 
.-- 
	AddScoped-- 
<-- 
ResearchLineService-- .
>--. /
(--/ 0
)--0 1
;--1 2
services.. 
... 
	AddScoped.. 
<.. 
ProposalService.. *
>..* +
(..+ ,
).., -
;..- .
services// 
.// 
	AddScoped// 
<// #
ProposalFeedBackService// 2
>//2 3
(//3 4
)//4 5
;//5 6
services00 
.00 
	AddScoped00 
<00 "
HistoryProposalService00 1
>001 2
(002 3
)003 4
;004 5
services11 
.11 
	AddScoped11 
<11 
ProyectService11 )
>11) *
(11* +
)11+ ,
;11, -
services22 
.22 
	AddScoped22 
<22 !
HistoryProyectService22 0
>220 1
(221 2
)222 3
;223 4
services33 
.33 
	AddScoped33 
<33 "
ProyectFeedBackService33 1
>331 2
(332 3
)333 4
;334 5
}44 
}55 ®#
GC:\Users\sofia\Documents\project\Pegi.Api\src\Api\Jwt\TokenGenerator.cs
	namespace		 	
Api		
 
.		 
Jwt		 
{

 
internal 
static 
class 
TokenGenerator (
{ 
public 
static 
string 
GenerateTokenJwt -
(- .
User. 2
user3 7
)7 8
{ 	
var 
configuration 
= 
new  # 
ConfigurationManager$ 8
(8 9
)9 :
;: ;
configuration 
. 
AddJsonFile %
(% &
$str& 8
)8 9
;9 :
string 
key 
= 
configuration &
[& '
$str' 0
]0 1
;1 2
Claim 
[ 
] 
claims 
; 
var 
securityKey 
= 
new  
SymmetricSecurityKey (
(( )
Encoding 
. 
UTF8 !
.! "
GetBytes" *
(* +
key+ .
). /
)/ 0
;0 1
var 
credentials 
= 
new !
SigningCredentials" 4
(4 5
securityKey5 @
,@ A
SecurityAlgorithms "
." #

HmacSha256# -
)- .
;. /
if 
( 
user 
. 
Person 
!= 
null #
)# $
{ 
claims 
= 
new 
[ 
] 
{   
new!! 
Claim!! 
(!! 

ClaimTypes!! (
.!!( )
NameIdentifier!!) 7
,!!7 8
user!!9 =
.!!= >
Name!!> B
!!!B C
)!!C D
,!!D E
new"" 
Claim"" 
("" 

ClaimTypes"" (
.""( )
Role"") -
,""- .
user""/ 3
.""3 4
Role""4 8
!""8 9
)""9 :
,"": ;
new## 
Claim## 
(## 
$str## (
,##( )
user##* .
.##. /
Person##/ 5
!##5 6
.##6 7
Document##7 ?
!##? @
)##@ A
,##A B
new$$ 
Claim$$ 
($$ 
$str$$ )
,$$) *
user$$+ /
.$$/ 0
Person$$0 6
!$$6 7
.$$7 8
	FirstName$$8 A
!$$A B
)$$B C
,$$C D
new%% 
Claim%% 
(%% 
$str%% -
,%%- .
user%%/ 3
.%%3 4
Person%%4 :
!%%: ;
.%%; <
FirstLastName%%< I
!%%I J
)%%J K
,%%K L
new&& 
Claim&& 
(&& 
$str&& %
,&&% &
user&&' +
.&&+ ,
Person&&, 2
!&&2 3
.&&3 4
InstitutionalMail&&4 E
!&&E F
)&&F G
}'' 
;'' 
}(( 
else)) 
{** 
claims++ 
=++ 
new++ 
[++ 
]++ 
{,, 
new-- 
Claim-- 
(-- 

ClaimTypes-- (
.--( )
NameIdentifier--) 7
,--7 8
user--9 =
.--= >
Name--> B
!--B C
)--C D
,--D E
new.. 
Claim.. 
(.. 

ClaimTypes.. (
...( )
Role..) -
,..- .
user../ 3
...3 4
Role..4 8
!..8 9
)..9 :
,..: ;
}// 
;// 
}00 
var22 
token22 
=22 
new22 
JwtSecurityToken22 ,
(22, -
claims33 
:33 
claims33 
,33 
expires44 
:44 
DateTime44 !
.44! "
Now44" %
.44% &

AddMinutes44& 0
(440 1
$num441 3
)443 4
,444 5
signingCredentials55 "
:55" #
credentials55$ /
)55/ 0
;550 1
return66 
new66 #
JwtSecurityTokenHandler66 .
(66. /
)66/ 0
.660 1

WriteToken661 ;
(66; <
token66< A
)66A B
;66B C
}77 	
}88 
}99 ô
_C:\Users\sofia\Documents\project\Pegi.Api\src\Api\Migrations\20230524031938_InitialMigration.cs
	namespace 	
Api
 
. 

Migrations 
{ 
public

 

partial

 
class

 
InitialMigration

 )
:

* +
	Migration

, 5
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str )
,) *
columns 
: 
table 
=> !
new" %
{ 
code_program  
=! "
table# (
.( )
Column) /
</ 0
string0 6
>6 7
(7 8
type8 <
:< =
$str> D
,D E
nullableF N
:N O
falseP U
)U V
,V W
name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 <
,< =
nullable> F
:F G
trueH L
)L M
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% ;
,; <
x= >
=>? A
xB C
.C D
code_programD P
)P Q
;Q R
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str #
,# $
columns 
: 
table 
=> !
new" %
{ 
department_id !
=" #
table$ )
.) *
Column* 0
<0 1
string1 7
>7 8
(8 9
type9 =
:= >
$str? E
,E F
nullableG O
:O P
falseQ V
)V W
,W X
deparment_name   "
=  # $
table  % *
.  * +
Column  + 1
<  1 2
string  2 8
>  8 9
(  9 :
type  : >
:  > ?
$str  @ F
,  F G
nullable  H P
:  P Q
false  R W
)  W X
}!! 
,!! 
constraints"" 
:"" 
table"" "
=>""# %
{## 
table$$ 
.$$ 

PrimaryKey$$ $
($$$ %
$str$$% 5
,$$5 6
x$$7 8
=>$$9 ;
x$$< =
.$$= >
department_id$$> K
)$$K L
;$$L M
}%% 
)%% 
;%% 
migrationBuilder'' 
.'' 
CreateTable'' (
(''( )
name(( 
:(( 
$str(( )
,(() *
columns)) 
:)) 
table)) 
=>)) !
new))" %
{** 
code++ 
=++ 
table++  
.++  !
Column++! '
<++' (
int++( +
>+++ ,
(++, -
type++- 1
:++1 2
$str++3 <
,++< =
nullable++> F
:++F G
false++H M
)++M N
.,, 

Annotation,, #
(,,# $
$str,,$ D
,,,D E)
NpgsqlValueGenerationStrategy,,F c
.,,c d#
IdentityByDefaultColumn,,d {
),,{ |
,,,| }
comment-- 
=-- 
table-- #
.--# $
Column--$ *
<--* +
string--+ 1
>--1 2
(--2 3
type--3 7
:--7 8
$str--9 ?
,--? @
nullable--A I
:--I J
true--K O
)--O P
,--P Q
status.. 
=.. 
table.. "
..." #
Column..# )
<..) *
string..* 0
>..0 1
(..1 2
type..2 6
:..6 7
$str..8 >
,..> ?
nullable..@ H
:..H I
true..J N
)..N O
,..O P
date// 
=// 
table//  
.//  !
Column//! '
<//' (
DateTime//( 0
>//0 1
(//1 2
type//2 6
://6 7
$str//8 R
,//R S
nullable//T \
://\ ]
true//^ b
)//b c
}00 
,00 
constraints11 
:11 
table11 "
=>11# %
{22 
table33 
.33 

PrimaryKey33 $
(33$ %
$str33% ;
,33; <
x33= >
=>33? A
x33B C
.33C D
code33D H
)33H I
;33I J
}44 
)44 
;44 
migrationBuilder66 
.66 
CreateTable66 (
(66( )
name77 
:77 
$str77 (
,77( )
columns88 
:88 
table88 
=>88 !
new88" %
{99 
code:: 
=:: 
table::  
.::  !
Column::! '
<::' (
int::( +
>::+ ,
(::, -
type::- 1
:::1 2
$str::3 <
,::< =
nullable::> F
:::F G
false::H M
)::M N
.;; 

Annotation;; #
(;;# $
$str;;$ D
,;;D E)
NpgsqlValueGenerationStrategy;;F c
.;;c d#
IdentityByDefaultColumn;;d {
);;{ |
,;;| }
comment<< 
=<< 
table<< #
.<<# $
Column<<$ *
<<<* +
string<<+ 1
><<1 2
(<<2 3
type<<3 7
:<<7 8
$str<<9 ?
,<<? @
nullable<<A I
:<<I J
true<<K O
)<<O P
,<<P Q
status== 
=== 
table== "
.==" #
Column==# )
<==) *
string==* 0
>==0 1
(==1 2
type==2 6
:==6 7
$str==8 >
,==> ?
nullable==@ H
:==H I
true==J N
)==N O
,==O P
Score>> 
=>> 
table>> !
.>>! "
Column>>" (
<>>( )
int>>) ,
>>>, -
(>>- .
type>>. 2
:>>2 3
$str>>4 =
,>>= >
nullable>>? G
:>>G H
true>>I M
)>>M N
}?? 
,?? 
constraints@@ 
:@@ 
table@@ "
=>@@# %
{AA 
tableBB 
.BB 

PrimaryKeyBB $
(BB$ %
$strBB% :
,BB: ;
xBB< =
=>BB> @
xBBA B
.BBB C
codeBBC G
)BBG H
;BBH I
}CC 
)CC 
;CC 
migrationBuilderEE 
.EE 
CreateTableEE (
(EE( )
nameFF 
:FF 
$strFF &
,FF& '
columnsGG 
:GG 
tableGG 
=>GG !
newGG" %
{HH 
codeII 
=II 
tableII  
.II  !
ColumnII! '
<II' (
stringII( .
>II. /
(II/ 0
typeII0 4
:II4 5
$strII6 <
,II< =
nullableII> F
:IIF G
falseIIH M
)IIM N
,IIN O
nameJJ 
=JJ 
tableJJ  
.JJ  !
ColumnJJ! '
<JJ' (
stringJJ( .
>JJ. /
(JJ/ 0
typeJJ0 4
:JJ4 5
$strJJ6 <
,JJ< =
nullableJJ> F
:JJF G
trueJJH L
)JJL M
}KK 
,KK 
constraintsLL 
:LL 
tableLL "
=>LL# %
{MM 
tableNN 
.NN 

PrimaryKeyNN $
(NN$ %
$strNN% 8
,NN8 9
xNN: ;
=>NN< >
xNN? @
.NN@ A
codeNNA E
)NNE F
;NNF G
}OO 
)OO 
;OO 
migrationBuilderQQ 
.QQ 
CreateTableQQ (
(QQ( )
nameRR 
:RR 
$strRR 
,RR 
columnsSS 
:SS 
tableSS 
=>SS !
newSS" %
{TT 
city_idUU 
=UU 
tableUU #
.UU# $
ColumnUU$ *
<UU* +
stringUU+ 1
>UU1 2
(UU2 3
typeUU3 7
:UU7 8
$strUU9 ?
,UU? @
nullableUUA I
:UUI J
falseUUK P
)UUP Q
,UUQ R
	city_nameVV 
=VV 
tableVV  %
.VV% &
ColumnVV& ,
<VV, -
stringVV- 3
>VV3 4
(VV4 5
typeVV5 9
:VV9 :
$strVV; A
,VVA B
nullableVVC K
:VVK L
falseVVM R
)VVR S
,VVS T
DepartmentCodeWW "
=WW# $
tableWW% *
.WW* +
ColumnWW+ 1
<WW1 2
stringWW2 8
>WW8 9
(WW9 :
typeWW: >
:WW> ?
$strWW@ F
,WWF G
nullableWWH P
:WWP Q
falseWWR W
)WWW X
}XX 
,XX 
constraintsYY 
:YY 
tableYY "
=>YY# %
{ZZ 
table[[ 
.[[ 

PrimaryKey[[ $
([[$ %
$str[[% 0
,[[0 1
x[[2 3
=>[[4 6
x[[7 8
.[[8 9
city_id[[9 @
)[[@ A
;[[A B
table\\ 
.\\ 

ForeignKey\\ $
(\\$ %
name]] 
:]] 
$str]] D
,]]D E
column^^ 
:^^ 
x^^  !
=>^^" $
x^^% &
.^^& '
DepartmentCode^^' 5
,^^5 6
principalTable__ &
:__& '
$str__( 5
,__5 6
principalColumn`` '
:``' (
$str``) 8
,``8 9
onDeleteaa  
:aa  !
ReferentialActionaa" 3
.aa3 4
Cascadeaa4 ;
)aa; <
;aa< =
}bb 
)bb 
;bb 
migrationBuilderdd 
.dd 
CreateTabledd (
(dd( )
nameee 
:ee 
$stree )
,ee) *
columnsff 
:ff 
tableff 
=>ff !
newff" %
{gg 
codehh 
=hh 
tablehh  
.hh  !
Columnhh! '
<hh' (
stringhh( .
>hh. /
(hh/ 0
typehh0 4
:hh4 5
$strhh6 <
,hh< =
nullablehh> F
:hhF G
falsehhH M
)hhM N
,hhN O
nameii 
=ii 
tableii  
.ii  !
Columnii! '
<ii' (
stringii( .
>ii. /
(ii/ 0
typeii0 4
:ii4 5
$strii6 <
,ii< =
nullableii> F
:iiF G
trueiiH L
)iiL M
,iiM N
ResearchLineCodejj $
=jj% &
tablejj' ,
.jj, -
Columnjj- 3
<jj3 4
stringjj4 :
>jj: ;
(jj; <
typejj< @
:jj@ A
$strjjB H
,jjH I
nullablejjJ R
:jjR S
truejjT X
)jjX Y
}kk 
,kk 
constraintsll 
:ll 
tablell "
=>ll# %
{mm 
tablenn 
.nn 

PrimaryKeynn $
(nn$ %
$strnn% ;
,nn; <
xnn= >
=>nn? A
xnnB C
.nnC D
codennD H
)nnH I
;nnI J
tableoo 
.oo 

ForeignKeyoo $
(oo$ %
namepp 
:pp 
$strpp T
,ppT U
columnqq 
:qq 
xqq  !
=>qq" $
xqq% &
.qq& '
ResearchLineCodeqq' 7
,qq7 8
principalTablerr &
:rr& '
$strrr( 8
,rr8 9
principalColumnss '
:ss' (
$strss) /
)ss/ 0
;ss0 1
}tt 
)tt 
;tt 
migrationBuildervv 
.vv 
CreateTablevv (
(vv( )
nameww 
:ww 
$strww 
,ww 
columnsxx 
:xx 
tablexx 
=>xx !
newxx" %
{yy 
documentzz 
=zz 
tablezz $
.zz$ %
Columnzz% +
<zz+ ,
stringzz, 2
>zz2 3
(zz3 4
typezz4 8
:zz8 9
$strzz: @
,zz@ A
nullablezzB J
:zzJ K
falsezzL Q
)zzQ R
,zzR S&
person_identification_type{{ .
={{/ 0
table{{1 6
.{{6 7
Column{{7 =
<{{= >
string{{> D
>{{D E
({{E F
type{{F J
:{{J K
$str{{L R
,{{R S
nullable{{T \
:{{\ ]
false{{^ c
){{c d
,{{d e
person_first_name|| %
=||& '
table||( -
.||- .
Column||. 4
<||4 5
string||5 ;
>||; <
(||< =
type||= A
:||A B
$str||C I
,||I J
nullable||K S
:||S T
true||U Y
)||Y Z
,||Z [
person_second_name}} &
=}}' (
table}}) .
.}}. /
Column}}/ 5
<}}5 6
string}}6 <
>}}< =
(}}= >
type}}> B
:}}B C
$str}}D J
,}}J K
nullable}}L T
:}}T U
true}}V Z
)}}Z [
,}}[ \"
person_first_last_name~~ *
=~~+ ,
table~~- 2
.~~2 3
Column~~3 9
<~~9 :
string~~: @
>~~@ A
(~~A B
type~~B F
:~~F G
$str~~H N
,~~N O
nullable~~P X
:~~X Y
true~~Z ^
)~~^ _
,~~_ `#
person_second_last_name +
=, -
table. 3
.3 4
Column4 :
<: ;
string; A
>A B
(B C
typeC G
:G H
$strI O
,O P
nullableQ Y
:Y Z
true[ _
)_ `
,` a 
person_civil_state
ÄÄ &
=
ÄÄ' (
table
ÄÄ) .
.
ÄÄ. /
Column
ÄÄ/ 5
<
ÄÄ5 6
string
ÄÄ6 <
>
ÄÄ< =
(
ÄÄ= >
type
ÄÄ> B
:
ÄÄB C
$str
ÄÄD J
,
ÄÄJ K
nullable
ÄÄL T
:
ÄÄT U
true
ÄÄV Z
)
ÄÄZ [
,
ÄÄ[ \
person_gender
ÅÅ !
=
ÅÅ" #
table
ÅÅ$ )
.
ÅÅ) *
Column
ÅÅ* 0
<
ÅÅ0 1
string
ÅÅ1 7
>
ÅÅ7 8
(
ÅÅ8 9
type
ÅÅ9 =
:
ÅÅ= >
$str
ÅÅ? E
,
ÅÅE F
nullable
ÅÅG O
:
ÅÅO P
true
ÅÅQ U
)
ÅÅU V
,
ÅÅV W
person_birth_date
ÇÇ %
=
ÇÇ& '
table
ÇÇ( -
.
ÇÇ- .
Column
ÇÇ. 4
<
ÇÇ4 5
DateTime
ÇÇ5 =
>
ÇÇ= >
(
ÇÇ> ?
type
ÇÇ? C
:
ÇÇC D
$str
ÇÇE _
,
ÇÇ_ `
nullable
ÇÇa i
:
ÇÇi j
true
ÇÇk o
)
ÇÇo p
,
ÇÇp q
person_phone
ÉÉ  
=
ÉÉ! "
table
ÉÉ# (
.
ÉÉ( )
Column
ÉÉ) /
<
ÉÉ/ 0
string
ÉÉ0 6
>
ÉÉ6 7
(
ÉÉ7 8
type
ÉÉ8 <
:
ÉÉ< =
$str
ÉÉ> D
,
ÉÉD E
nullable
ÉÉF N
:
ÉÉN O
true
ÉÉP T
)
ÉÉT U
,
ÉÉU V(
person_institutional_email
ÑÑ .
=
ÑÑ/ 0
table
ÑÑ1 6
.
ÑÑ6 7
Column
ÑÑ7 =
<
ÑÑ= >
string
ÑÑ> D
>
ÑÑD E
(
ÑÑE F
type
ÑÑF J
:
ÑÑJ K
$str
ÑÑL R
,
ÑÑR S
nullable
ÑÑT \
:
ÑÑ\ ]
true
ÑÑ^ b
)
ÑÑb c
,
ÑÑc d

CitiesCode
ÖÖ 
=
ÖÖ  
table
ÖÖ! &
.
ÖÖ& '
Column
ÖÖ' -
<
ÖÖ- .
string
ÖÖ. 4
>
ÖÖ4 5
(
ÖÖ5 6
type
ÖÖ6 :
:
ÖÖ: ;
$str
ÖÖ< B
,
ÖÖB C
nullable
ÖÖD L
:
ÖÖL M
true
ÖÖN R
)
ÖÖR S
}
ÜÜ 
,
ÜÜ 
constraints
áá 
:
áá 
table
áá "
=>
áá# %
{
àà 
table
ââ 
.
ââ 

PrimaryKey
ââ $
(
ââ$ %
$str
ââ% 0
,
ââ0 1
x
ââ2 3
=>
ââ4 6
x
ââ7 8
.
ââ8 9
document
ââ9 A
)
ââA B
;
ââB C
table
ää 
.
ää 

ForeignKey
ää $
(
ää$ %
name
ãã 
:
ãã 
$str
ãã ;
,
ãã; <
column
åå 
:
åå 
x
åå  !
=>
åå" $
x
åå% &
.
åå& '

CitiesCode
åå' 1
,
åå1 2
principalTable
çç &
:
çç& '
$str
çç( 0
,
çç0 1
principalColumn
éé '
:
éé' (
$str
éé) 2
)
éé2 3
;
éé3 4
}
èè 
)
èè 
;
èè 
migrationBuilder
ëë 
.
ëë 
CreateTable
ëë (
(
ëë( )
name
íí 
:
íí 
$str
íí &
,
íí& '
columns
ìì 
:
ìì 
table
ìì 
=>
ìì !
new
ìì" %
{
îî 
code
ïï 
=
ïï 
table
ïï  
.
ïï  !
Column
ïï! '
<
ïï' (
string
ïï( .
>
ïï. /
(
ïï/ 0
type
ïï0 4
:
ïï4 5
$str
ïï6 <
,
ïï< =
nullable
ïï> F
:
ïïF G
false
ïïH M
)
ïïM N
,
ïïN O
name
ññ 
=
ññ 
table
ññ  
.
ññ  !
Column
ññ! '
<
ññ' (
string
ññ( .
>
ññ. /
(
ññ/ 0
type
ññ0 4
:
ññ4 5
$str
ññ6 <
,
ññ< =
nullable
ññ> F
:
ññF G
true
ññH L
)
ññL M
,
ññM N!
ResearchSublineCode
óó '
=
óó( )
table
óó* /
.
óó/ 0
Column
óó0 6
<
óó6 7
string
óó7 =
>
óó= >
(
óó> ?
type
óó? C
:
óóC D
$str
óóE K
,
óóK L
nullable
óóM U
:
óóU V
true
óóW [
)
óó[ \
}
òò 
,
òò 
constraints
ôô 
:
ôô 
table
ôô "
=>
ôô# %
{
öö 
table
õõ 
.
õõ 

PrimaryKey
õõ $
(
õõ$ %
$str
õõ% 8
,
õõ8 9
x
õõ: ;
=>
õõ< >
x
õõ? @
.
õõ@ A
code
õõA E
)
õõE F
;
õõF G
table
úú 
.
úú 

ForeignKey
úú $
(
úú$ %
name
ùù 
:
ùù 
$str
ùù W
,
ùùW X
column
ûû 
:
ûû 
x
ûû  !
=>
ûû" $
x
ûû% &
.
ûû& '!
ResearchSublineCode
ûû' :
,
ûû: ;
principalTable
üü &
:
üü& '
$str
üü( ;
,
üü; <
principalColumn
†† '
:
††' (
$str
††) /
)
††/ 0
;
††0 1
}
°° 
)
°° 
;
°° 
migrationBuilder
££ 
.
££ 
CreateTable
££ (
(
££( )
name
§§ 
:
§§ 
$str
§§ #
,
§§# $
columns
•• 
:
•• 
table
•• 
=>
•• !
new
••" %
{
¶¶ 
experience_code
ßß #
=
ßß$ %
table
ßß& +
.
ßß+ ,
Column
ßß, 2
<
ßß2 3
string
ßß3 9
>
ßß9 :
(
ßß: ;
type
ßß; ?
:
ßß? @
$str
ßßA G
,
ßßG H
nullable
ßßI Q
:
ßßQ R
false
ßßS X
)
ßßX Y
,
ßßY Z$
experience_institution
®® *
=
®®+ ,
table
®®- 2
.
®®2 3
Column
®®3 9
<
®®9 :
string
®®: @
>
®®@ A
(
®®A B
type
®®B F
:
®®F G
$str
®®H N
,
®®N O
nullable
®®P X
:
®®X Y
false
®®Z _
)
®®_ `
,
®®` a
study_start_date
©© $
=
©©% &
table
©©' ,
.
©©, -
Column
©©- 3
<
©©3 4
DateTime
©©4 <
>
©©< =
(
©©= >
type
©©> B
:
©©B C
$str
©©D ^
,
©©^ _
nullable
©©` h
:
©©h i
false
©©j o
)
©©o p
,
©©p q
study_end_date
™™ "
=
™™# $
table
™™% *
.
™™* +
Column
™™+ 1
<
™™1 2
DateTime
™™2 :
>
™™: ;
(
™™; <
type
™™< @
:
™™@ A
$str
™™B \
,
™™\ ]
nullable
™™^ f
:
™™f g
false
™™h m
)
™™m n
,
™™n o

CitiesCode
´´ 
=
´´  
table
´´! &
.
´´& '
Column
´´' -
<
´´- .
string
´´. 4
>
´´4 5
(
´´5 6
type
´´6 :
:
´´: ;
$str
´´< B
,
´´B C
nullable
´´D L
:
´´L M
false
´´N S
)
´´S T
,
´´T U

PeopleCode
¨¨ 
=
¨¨  
table
¨¨! &
.
¨¨& '
Column
¨¨' -
<
¨¨- .
string
¨¨. 4
>
¨¨4 5
(
¨¨5 6
type
¨¨6 :
:
¨¨: ;
$str
¨¨< B
,
¨¨B C
nullable
¨¨D L
:
¨¨L M
false
¨¨N S
)
¨¨S T
,
¨¨T U!
experience_position
≠≠ '
=
≠≠( )
table
≠≠* /
.
≠≠/ 0
Column
≠≠0 6
<
≠≠6 7
string
≠≠7 =
>
≠≠= >
(
≠≠> ?
type
≠≠? C
:
≠≠C D
$str
≠≠E K
,
≠≠K L
nullable
≠≠M U
:
≠≠U V
false
≠≠W \
)
≠≠\ ]
}
ÆÆ 
,
ÆÆ 
constraints
ØØ 
:
ØØ 
table
ØØ "
=>
ØØ# %
{
∞∞ 
table
±± 
.
±± 

PrimaryKey
±± $
(
±±$ %
$str
±±% 5
,
±±5 6
x
±±7 8
=>
±±9 ;
x
±±< =
.
±±= >
experience_code
±±> M
)
±±M N
;
±±N O
table
≤≤ 
.
≤≤ 

ForeignKey
≤≤ $
(
≤≤$ %
name
≥≥ 
:
≥≥ 
$str
≥≥ @
,
≥≥@ A
column
¥¥ 
:
¥¥ 
x
¥¥  !
=>
¥¥" $
x
¥¥% &
.
¥¥& '

CitiesCode
¥¥' 1
,
¥¥1 2
principalTable
µµ &
:
µµ& '
$str
µµ( 0
,
µµ0 1
principalColumn
∂∂ '
:
∂∂' (
$str
∂∂) 2
,
∂∂2 3
onDelete
∑∑  
:
∑∑  !
ReferentialAction
∑∑" 3
.
∑∑3 4
Cascade
∑∑4 ;
)
∑∑; <
;
∑∑< =
table
∏∏ 
.
∏∏ 

ForeignKey
∏∏ $
(
∏∏$ %
name
ππ 
:
ππ 
$str
ππ @
,
ππ@ A
column
∫∫ 
:
∫∫ 
x
∫∫  !
=>
∫∫" $
x
∫∫% &
.
∫∫& '

PeopleCode
∫∫' 1
,
∫∫1 2
principalTable
ªª &
:
ªª& '
$str
ªª( 0
,
ªª0 1
principalColumn
ºº '
:
ºº' (
$str
ºº) 3
,
ºº3 4
onDelete
ΩΩ  
:
ΩΩ  !
ReferentialAction
ΩΩ" 3
.
ΩΩ3 4
Cascade
ΩΩ4 ;
)
ΩΩ; <
;
ΩΩ< =
}
ææ 
)
ææ 
;
ææ 
migrationBuilder
¿¿ 
.
¿¿ 
CreateTable
¿¿ (
(
¿¿( )
name
¡¡ 
:
¡¡ 
$str
¡¡ !
,
¡¡! "
columns
¬¬ 
:
¬¬ 
table
¬¬ 
=>
¬¬ !
new
¬¬" %
{
√√ 
Document
ƒƒ 
=
ƒƒ 
table
ƒƒ $
.
ƒƒ$ %
Column
ƒƒ% +
<
ƒƒ+ ,
string
ƒƒ, 2
>
ƒƒ2 3
(
ƒƒ3 4
type
ƒƒ4 8
:
ƒƒ8 9
$str
ƒƒ: @
,
ƒƒ@ A
nullable
ƒƒB J
:
ƒƒJ K
false
ƒƒL Q
)
ƒƒQ R
,
ƒƒR S
position
≈≈ 
=
≈≈ 
table
≈≈ $
.
≈≈$ %
Column
≈≈% +
<
≈≈+ ,
string
≈≈, 2
>
≈≈2 3
(
≈≈3 4
type
≈≈4 8
:
≈≈8 9
$str
≈≈: @
,
≈≈@ A
nullable
≈≈B J
:
≈≈J K
true
≈≈L P
)
≈≈P Q
}
∆∆ 
,
∆∆ 
constraints
«« 
:
«« 
table
«« "
=>
««# %
{
»» 
table
…… 
.
…… 

PrimaryKey
…… $
(
……$ %
$str
……% 3
,
……3 4
x
……5 6
=>
……7 9
x
……: ;
.
……; <
Document
……< D
)
……D E
;
……E F
table
   
.
   

ForeignKey
   $
(
  $ %
name
ÀÀ 
:
ÀÀ 
$str
ÀÀ <
,
ÀÀ< =
column
ÃÃ 
:
ÃÃ 
x
ÃÃ  !
=>
ÃÃ" $
x
ÃÃ% &
.
ÃÃ& '
Document
ÃÃ' /
,
ÃÃ/ 0
principalTable
ÕÕ &
:
ÕÕ& '
$str
ÕÕ( 0
,
ÕÕ0 1
principalColumn
ŒŒ '
:
ŒŒ' (
$str
ŒŒ) 3
,
ŒŒ3 4
onDelete
œœ  
:
œœ  !
ReferentialAction
œœ" 3
.
œœ3 4
Cascade
œœ4 ;
)
œœ; <
;
œœ< =
}
–– 
)
–– 
;
–– 
migrationBuilder
““ 
.
““ 
CreateTable
““ (
(
““( )
name
”” 
:
”” 
$str
””  
,
””  !
columns
‘‘ 
:
‘‘ 
table
‘‘ 
=>
‘‘ !
new
‘‘" %
{
’’ 
Document
÷÷ 
=
÷÷ 
table
÷÷ $
.
÷÷$ %
Column
÷÷% +
<
÷÷+ ,
string
÷÷, 2
>
÷÷2 3
(
÷÷3 4
type
÷÷4 8
:
÷÷8 9
$str
÷÷: @
,
÷÷@ A
nullable
÷÷B J
:
÷÷J K
false
÷÷L Q
)
÷÷Q R
,
÷÷R S
amount_credits
◊◊ "
=
◊◊# $
table
◊◊% *
.
◊◊* +
Column
◊◊+ 1
<
◊◊1 2
string
◊◊2 8
>
◊◊8 9
(
◊◊9 :
type
◊◊: >
:
◊◊> ?
$str
◊◊@ F
,
◊◊F G
nullable
◊◊H P
:
◊◊P Q
true
◊◊R V
)
◊◊V W
,
◊◊W X!
AcademicProgramCode
ÿÿ '
=
ÿÿ( )
table
ÿÿ* /
.
ÿÿ/ 0
Column
ÿÿ0 6
<
ÿÿ6 7
string
ÿÿ7 =
>
ÿÿ= >
(
ÿÿ> ?
type
ÿÿ? C
:
ÿÿC D
$str
ÿÿE K
,
ÿÿK L
nullable
ÿÿM U
:
ÿÿU V
true
ÿÿW [
)
ÿÿ[ \
}
ŸŸ 
,
ŸŸ 
constraints
⁄⁄ 
:
⁄⁄ 
table
⁄⁄ "
=>
⁄⁄# %
{
€€ 
table
‹‹ 
.
‹‹ 

PrimaryKey
‹‹ $
(
‹‹$ %
$str
‹‹% 2
,
‹‹2 3
x
‹‹4 5
=>
‹‹6 8
x
‹‹9 :
.
‹‹: ;
Document
‹‹; C
)
‹‹C D
;
‹‹D E
table
›› 
.
›› 

ForeignKey
›› $
(
››$ %
name
ﬁﬁ 
:
ﬁﬁ 
$str
ﬁﬁ Q
,
ﬁﬁQ R
column
ﬂﬂ 
:
ﬂﬂ 
x
ﬂﬂ  !
=>
ﬂﬂ" $
x
ﬂﬂ% &
.
ﬂﬂ& '!
AcademicProgramCode
ﬂﬂ' :
,
ﬂﬂ: ;
principalTable
‡‡ &
:
‡‡& '
$str
‡‡( ;
,
‡‡; <
principalColumn
·· '
:
··' (
$str
··) 7
)
··7 8
;
··8 9
table
‚‚ 
.
‚‚ 

ForeignKey
‚‚ $
(
‚‚$ %
name
„„ 
:
„„ 
$str
„„ ;
,
„„; <
column
‰‰ 
:
‰‰ 
x
‰‰  !
=>
‰‰" $
x
‰‰% &
.
‰‰& '
Document
‰‰' /
,
‰‰/ 0
principalTable
ÂÂ &
:
ÂÂ& '
$str
ÂÂ( 0
,
ÂÂ0 1
principalColumn
ÊÊ '
:
ÊÊ' (
$str
ÊÊ) 3
,
ÊÊ3 4
onDelete
ÁÁ  
:
ÁÁ  !
ReferentialAction
ÁÁ" 3
.
ÁÁ3 4
Cascade
ÁÁ4 ;
)
ÁÁ; <
;
ÁÁ< =
}
ËË 
)
ËË 
;
ËË 
migrationBuilder
ÍÍ 
.
ÍÍ 
CreateTable
ÍÍ (
(
ÍÍ( )
name
ÎÎ 
:
ÎÎ 
$str
ÎÎ 
,
ÎÎ  
columns
ÏÏ 
:
ÏÏ 
table
ÏÏ 
=>
ÏÏ !
new
ÏÏ" %
{
ÌÌ 

study_code
ÓÓ 
=
ÓÓ  
table
ÓÓ! &
.
ÓÓ& '
Column
ÓÓ' -
<
ÓÓ- .
string
ÓÓ. 4
>
ÓÓ4 5
(
ÓÓ5 6
type
ÓÓ6 :
:
ÓÓ: ;
$str
ÓÓ< B
,
ÓÓB C
nullable
ÓÓD L
:
ÓÓL M
false
ÓÓN S
)
ÓÓS T
,
ÓÓT U
study_institution
ÔÔ %
=
ÔÔ& '
table
ÔÔ( -
.
ÔÔ- .
Column
ÔÔ. 4
<
ÔÔ4 5
string
ÔÔ5 ;
>
ÔÔ; <
(
ÔÔ< =
type
ÔÔ= A
:
ÔÔA B
$str
ÔÔC I
,
ÔÔI J
nullable
ÔÔK S
:
ÔÔS T
false
ÔÔU Z
)
ÔÔZ [
,
ÔÔ[ \
study_start_date
 $
=
% &
table
' ,
.
, -
Column
- 3
<
3 4
DateTime
4 <
>
< =
(
= >
type
> B
:
B C
$str
D ^
,
^ _
nullable
` h
:
h i
false
j o
)
o p
,
p q
study_end_date
ÒÒ "
=
ÒÒ# $
table
ÒÒ% *
.
ÒÒ* +
Column
ÒÒ+ 1
<
ÒÒ1 2
DateTime
ÒÒ2 :
>
ÒÒ: ;
(
ÒÒ; <
type
ÒÒ< @
:
ÒÒ@ A
$str
ÒÒB \
,
ÒÒ\ ]
nullable
ÒÒ^ f
:
ÒÒf g
false
ÒÒh m
)
ÒÒm n
,
ÒÒn o

CitiesCode
ÚÚ 
=
ÚÚ  
table
ÚÚ! &
.
ÚÚ& '
Column
ÚÚ' -
<
ÚÚ- .
string
ÚÚ. 4
>
ÚÚ4 5
(
ÚÚ5 6
type
ÚÚ6 :
:
ÚÚ: ;
$str
ÚÚ< B
,
ÚÚB C
nullable
ÚÚD L
:
ÚÚL M
false
ÚÚN S
)
ÚÚS T
,
ÚÚT U

PeopleCode
ÛÛ 
=
ÛÛ  
table
ÛÛ! &
.
ÛÛ& '
Column
ÛÛ' -
<
ÛÛ- .
string
ÛÛ. 4
>
ÛÛ4 5
(
ÛÛ5 6
type
ÛÛ6 :
:
ÛÛ: ;
$str
ÛÛ< B
,
ÛÛB C
nullable
ÛÛD L
:
ÛÛL M
false
ÛÛN S
)
ÛÛS T
}
ÙÙ 
,
ÙÙ 
constraints
ıı 
:
ıı 
table
ıı "
=>
ıı# %
{
ˆˆ 
table
˜˜ 
.
˜˜ 

PrimaryKey
˜˜ $
(
˜˜$ %
$str
˜˜% 1
,
˜˜1 2
x
˜˜3 4
=>
˜˜5 7
x
˜˜8 9
.
˜˜9 :

study_code
˜˜: D
)
˜˜D E
;
˜˜E F
table
¯¯ 
.
¯¯ 

ForeignKey
¯¯ $
(
¯¯$ %
name
˘˘ 
:
˘˘ 
$str
˘˘ <
,
˘˘< =
column
˙˙ 
:
˙˙ 
x
˙˙  !
=>
˙˙" $
x
˙˙% &
.
˙˙& '

CitiesCode
˙˙' 1
,
˙˙1 2
principalTable
˚˚ &
:
˚˚& '
$str
˚˚( 0
,
˚˚0 1
principalColumn
¸¸ '
:
¸¸' (
$str
¸¸) 2
,
¸¸2 3
onDelete
˝˝  
:
˝˝  !
ReferentialAction
˝˝" 3
.
˝˝3 4
Cascade
˝˝4 ;
)
˝˝; <
;
˝˝< =
table
˛˛ 
.
˛˛ 

ForeignKey
˛˛ $
(
˛˛$ %
name
ˇˇ 
:
ˇˇ 
$str
ˇˇ <
,
ˇˇ< =
column
ÄÄ 
:
ÄÄ 
x
ÄÄ  !
=>
ÄÄ" $
x
ÄÄ% &
.
ÄÄ& '

PeopleCode
ÄÄ' 1
,
ÄÄ1 2
principalTable
ÅÅ &
:
ÅÅ& '
$str
ÅÅ( 0
,
ÅÅ0 1
principalColumn
ÇÇ '
:
ÇÇ' (
$str
ÇÇ) 3
,
ÇÇ3 4
onDelete
ÉÉ  
:
ÉÉ  !
ReferentialAction
ÉÉ" 3
.
ÉÉ3 4
Cascade
ÉÉ4 ;
)
ÉÉ; <
;
ÉÉ< =
}
ÑÑ 
)
ÑÑ 
;
ÑÑ 
migrationBuilder
ÜÜ 
.
ÜÜ 
CreateTable
ÜÜ (
(
ÜÜ( )
name
áá 
:
áá 
$str
áá 
,
áá 
columns
àà 
:
àà 
table
àà 
=>
àà !
new
àà" %
{
ââ 
	user_name
ää 
=
ää 
table
ää  %
.
ää% &
Column
ää& ,
<
ää, -
string
ää- 3
>
ää3 4
(
ää4 5
type
ää5 9
:
ää9 :
$str
ää; A
,
ääA B
nullable
ääC K
:
ääK L
false
ääM R
)
ääR S
,
ääS T
user_password
ãã !
=
ãã" #
table
ãã$ )
.
ãã) *
Column
ãã* 0
<
ãã0 1
string
ãã1 7
>
ãã7 8
(
ãã8 9
type
ãã9 =
:
ãã= >
$str
ãã? E
,
ããE F
nullable
ããG O
:
ããO P
true
ããQ U
)
ããU V
,
ããV W
user_rol
åå 
=
åå 
table
åå $
.
åå$ %
Column
åå% +
<
åå+ ,
string
åå, 2
>
åå2 3
(
åå3 4
type
åå4 8
:
åå8 9
$str
åå: @
,
åå@ A
nullable
ååB J
:
ååJ K
true
ååL P
)
ååP Q
,
ååQ R
PersonDocument
çç "
=
çç# $
table
çç% *
.
çç* +
Column
çç+ 1
<
çç1 2
string
çç2 8
>
çç8 9
(
çç9 :
type
çç: >
:
çç> ?
$str
çç@ F
,
ççF G
nullable
ççH P
:
ççP Q
true
ççR V
)
ççV W
}
éé 
,
éé 
constraints
èè 
:
èè 
table
èè "
=>
èè# %
{
êê 
table
ëë 
.
ëë 

PrimaryKey
ëë $
(
ëë$ %
$str
ëë% /
,
ëë/ 0
x
ëë1 2
=>
ëë3 5
x
ëë6 7
.
ëë7 8
	user_name
ëë8 A
)
ëëA B
;
ëëB C
table
íí 
.
íí 

ForeignKey
íí $
(
íí$ %
name
ìì 
:
ìì 
$str
ìì >
,
ìì> ?
column
îî 
:
îî 
x
îî  !
=>
îî" $
x
îî% &
.
îî& '
PersonDocument
îî' 5
,
îî5 6
principalTable
ïï &
:
ïï& '
$str
ïï( 0
,
ïï0 1
principalColumn
ññ '
:
ññ' (
$str
ññ) 3
)
ññ3 4
;
ññ4 5
}
óó 
)
óó 
;
óó 
migrationBuilder
ôô 
.
ôô 
CreateTable
ôô (
(
ôô( )
name
öö 
:
öö 
$str
öö !
,
öö! "
columns
õõ 
:
õõ 
table
õõ 
=>
õõ !
new
õõ" %
{
úú 
code
ùù 
=
ùù 
table
ùù  
.
ùù  !
Column
ùù! '
<
ùù' (
string
ùù( .
>
ùù. /
(
ùù/ 0
type
ùù0 4
:
ùù4 5
$str
ùù6 <
,
ùù< =
nullable
ùù> F
:
ùùF G
false
ùùH M
)
ùùM N
,
ùùN O
PersonDocument
ûû "
=
ûû# $
table
ûû% *
.
ûû* +
Column
ûû+ 1
<
ûû1 2
string
ûû2 8
>
ûû8 9
(
ûû9 :
type
ûû: >
:
ûû> ?
$str
ûû@ F
,
ûûF G
nullable
ûûH P
:
ûûP Q
true
ûûR V
)
ûûV W
,
ûûW X
ProfessorDocument
üü %
=
üü& '
table
üü( -
.
üü- .
Column
üü. 4
<
üü4 5
string
üü5 ;
>
üü; <
(
üü< =
type
üü= A
:
üüA B
$str
üüC I
,
üüI J
nullable
üüK S
:
üüS T
true
üüU Y
)
üüY Z
,
üüZ [
title
†† 
=
†† 
table
†† !
.
††! "
Column
††" (
<
††( )
string
††) /
>
††/ 0
(
††0 1
type
††1 5
:
††5 6
$str
††7 =
,
††= >
nullable
††? G
:
††G H
true
††I M
)
††M N
,
††N O
date
°° 
=
°° 
table
°°  
.
°°  !
Column
°°! '
<
°°' (
DateTime
°°( 0
>
°°0 1
(
°°1 2
type
°°2 6
:
°°6 7
$str
°°8 R
,
°°R S
nullable
°°T \
:
°°\ ]
true
°°^ b
)
°°b c
,
°°c d 
investigationGroup
¢¢ &
=
¢¢' (
table
¢¢) .
.
¢¢. /
Column
¢¢/ 5
<
¢¢5 6
string
¢¢6 <
>
¢¢< =
(
¢¢= >
type
¢¢> B
:
¢¢B C
$str
¢¢D J
,
¢¢J K
nullable
¢¢L T
:
¢¢T U
true
¢¢V Z
)
¢¢Z [
,
¢¢[ \
approach
££ 
=
££ 
table
££ $
.
££$ %
Column
££% +
<
££+ ,
string
££, 2
>
££2 3
(
££3 4
type
££4 8
:
££8 9
$str
££: @
,
££@ A
nullable
££B J
:
££J K
true
££L P
)
££P Q
,
££Q R
justification
§§ !
=
§§" #
table
§§$ )
.
§§) *
Column
§§* 0
<
§§0 1
string
§§1 7
>
§§7 8
(
§§8 9
type
§§9 =
:
§§= >
$str
§§? E
,
§§E F
nullable
§§G O
:
§§O P
true
§§Q U
)
§§U V
,
§§V W
generalObjective
•• $
=
••% &
table
••' ,
.
••, -
Column
••- 3
<
••3 4
string
••4 :
>
••: ;
(
••; <
type
••< @
:
••@ A
$str
••B H
,
••H I
nullable
••J R
:
••R S
true
••T X
)
••X Y
,
••Y Z
specificObjective
¶¶ %
=
¶¶& '
table
¶¶( -
.
¶¶- .
Column
¶¶. 4
<
¶¶4 5
string
¶¶5 ;
>
¶¶; <
(
¶¶< =
type
¶¶= A
:
¶¶A B
$str
¶¶C I
,
¶¶I J
nullable
¶¶K S
:
¶¶S T
true
¶¶U Y
)
¶¶Y Z
,
¶¶Z [
biblioGraphical
ßß #
=
ßß$ %
table
ßß& +
.
ßß+ ,
Column
ßß, 2
<
ßß2 3
string
ßß3 9
>
ßß9 :
(
ßß: ;
type
ßß; ?
:
ßß? @
$str
ßßA G
,
ßßG H
nullable
ßßI Q
:
ßßQ R
true
ßßS W
)
ßßW X
,
ßßX Y
status
®® 
=
®® 
table
®® "
.
®®" #
Column
®®# )
<
®®) *
string
®®* 0
>
®®0 1
(
®®1 2
type
®®2 6
:
®®6 7
$str
®®8 >
,
®®> ?
nullable
®®@ H
:
®®H I
true
®®J N
)
®®N O
,
®®O P
ThematicAreaCode
©© $
=
©©% &
table
©©' ,
.
©©, -
Column
©©- 3
<
©©3 4
string
©©4 :
>
©©: ;
(
©©; <
type
©©< @
:
©©@ A
$str
©©B H
,
©©H I
nullable
©©J R
:
©©R S
true
©©T X
)
©©X Y
}
™™ 
,
™™ 
constraints
´´ 
:
´´ 
table
´´ "
=>
´´# %
{
¨¨ 
table
≠≠ 
.
≠≠ 

PrimaryKey
≠≠ $
(
≠≠$ %
$str
≠≠% 3
,
≠≠3 4
x
≠≠5 6
=>
≠≠7 9
x
≠≠: ;
.
≠≠; <
code
≠≠< @
)
≠≠@ A
;
≠≠A B
table
ÆÆ 
.
ÆÆ 

ForeignKey
ÆÆ $
(
ÆÆ$ %
name
ØØ 
:
ØØ 
$str
ØØ L
,
ØØL M
column
∞∞ 
:
∞∞ 
x
∞∞  !
=>
∞∞" $
x
∞∞% &
.
∞∞& '
ThematicAreaCode
∞∞' 7
,
∞∞7 8
principalTable
±± &
:
±±& '
$str
±±( 8
,
±±8 9
principalColumn
≤≤ '
:
≤≤' (
$str
≤≤) /
)
≤≤/ 0
;
≤≤0 1
table
≥≥ 
.
≥≥ 

ForeignKey
≥≥ $
(
≥≥$ %
name
¥¥ 
:
¥¥ 
$str
¥¥ H
,
¥¥H I
column
µµ 
:
µµ 
x
µµ  !
=>
µµ" $
x
µµ% &
.
µµ& '
ProfessorDocument
µµ' 8
,
µµ8 9
principalTable
∂∂ &
:
∂∂& '
$str
∂∂( 3
,
∂∂3 4
principalColumn
∑∑ '
:
∑∑' (
$str
∑∑) 3
)
∑∑3 4
;
∑∑4 5
table
∏∏ 
.
∏∏ 

ForeignKey
∏∏ $
(
∏∏$ %
name
ππ 
:
ππ 
$str
ππ D
,
ππD E
column
∫∫ 
:
∫∫ 
x
∫∫  !
=>
∫∫" $
x
∫∫% &
.
∫∫& '
PersonDocument
∫∫' 5
,
∫∫5 6
principalTable
ªª &
:
ªª& '
$str
ªª( 2
,
ªª2 3
principalColumn
ºº '
:
ºº' (
$str
ºº) 3
)
ºº3 4
;
ºº4 5
}
ΩΩ 
)
ΩΩ 
;
ΩΩ 
migrationBuilder
øø 
.
øø 
CreateTable
øø (
(
øø( )
name
¿¿ 
:
¿¿ 
$str
¿¿ )
,
¿¿) *
columns
¡¡ 
:
¡¡ 
table
¡¡ 
=>
¡¡ !
new
¡¡" %
{
¬¬ 
code
√√ 
=
√√ 
table
√√  
.
√√  !
Column
√√! '
<
√√' (
int
√√( +
>
√√+ ,
(
√√, -
type
√√- 1
:
√√1 2
$str
√√3 <
,
√√< =
nullable
√√> F
:
√√F G
false
√√H M
)
√√M N
.
ƒƒ 

Annotation
ƒƒ #
(
ƒƒ# $
$str
ƒƒ$ D
,
ƒƒD E+
NpgsqlValueGenerationStrategy
ƒƒF c
.
ƒƒc d%
IdentityByDefaultColumn
ƒƒd {
)
ƒƒ{ |
,
ƒƒ| }"
PorposalFeedBackCode
≈≈ (
=
≈≈) *
table
≈≈+ 0
.
≈≈0 1
Column
≈≈1 7
<
≈≈7 8
int
≈≈8 ;
>
≈≈; <
(
≈≈< =
type
≈≈= A
:
≈≈A B
$str
≈≈C L
,
≈≈L M
nullable
≈≈N V
:
≈≈V W
true
≈≈X \
)
≈≈\ ]
,
≈≈] ^
ProposalCode
∆∆  
=
∆∆! "
table
∆∆# (
.
∆∆( )
Column
∆∆) /
<
∆∆/ 0
string
∆∆0 6
>
∆∆6 7
(
∆∆7 8
type
∆∆8 <
:
∆∆< =
$str
∆∆> D
,
∆∆D E
nullable
∆∆F N
:
∆∆N O
true
∆∆P T
)
∆∆T U
}
«« 
,
«« 
constraints
»» 
:
»» 
table
»» "
=>
»»# %
{
…… 
table
   
.
   

PrimaryKey
   $
(
  $ %
$str
  % ;
,
  ; <
x
  = >
=>
  ? A
x
  B C
.
  C D
code
  D H
)
  H I
;
  I J
table
ÀÀ 
.
ÀÀ 

ForeignKey
ÀÀ $
(
ÀÀ$ %
name
ÃÃ 
:
ÃÃ 
$str
ÃÃ [
,
ÃÃ[ \
column
ÕÕ 
:
ÕÕ 
x
ÕÕ  !
=>
ÕÕ" $
x
ÕÕ% &
.
ÕÕ& '"
PorposalFeedBackCode
ÕÕ' ;
,
ÕÕ; <
principalTable
ŒŒ &
:
ŒŒ& '
$str
ŒŒ( ;
,
ŒŒ; <
principalColumn
œœ '
:
œœ' (
$str
œœ) /
)
œœ/ 0
;
œœ0 1
table
–– 
.
–– 

ForeignKey
–– $
(
––$ %
name
—— 
:
—— 
$str
—— K
,
——K L
column
““ 
:
““ 
x
““  !
=>
““" $
x
““% &
.
““& '
ProposalCode
““' 3
,
““3 4
principalTable
”” &
:
””& '
$str
””( 3
,
””3 4
principalColumn
‘‘ '
:
‘‘' (
$str
‘‘) /
)
‘‘/ 0
;
‘‘0 1
}
’’ 
)
’’ 
;
’’ 
migrationBuilder
◊◊ 
.
◊◊ 
CreateTable
◊◊ (
(
◊◊( )
name
ÿÿ 
:
ÿÿ 
$str
ÿÿ  
,
ÿÿ  !
columns
ŸŸ 
:
ŸŸ 
table
ŸŸ 
=>
ŸŸ !
new
ŸŸ" %
{
⁄⁄ 
code
€€ 
=
€€ 
table
€€  
.
€€  !
Column
€€! '
<
€€' (
string
€€( .
>
€€. /
(
€€/ 0
type
€€0 4
:
€€4 5
$str
€€6 <
,
€€< =
nullable
€€> F
:
€€F G
false
€€H M
)
€€M N
,
€€N O
PersonDocument
‹‹ "
=
‹‹# $
table
‹‹% *
.
‹‹* +
Column
‹‹+ 1
<
‹‹1 2
string
‹‹2 8
>
‹‹8 9
(
‹‹9 :
type
‹‹: >
:
‹‹> ?
$str
‹‹@ F
,
‹‹F G
nullable
‹‹H P
:
‹‹P Q
true
‹‹R V
)
‹‹V W
,
‹‹W X
ProfessorDocument
›› %
=
››& '
table
››( -
.
››- .
Column
››. 4
<
››4 5
string
››5 ;
>
››; <
(
››< =
type
››= A
:
››A B
$str
››C I
,
››I J
nullable
››K S
:
››S T
true
››U Y
)
››Y Z
,
››Z [
Content
ﬁﬁ 
=
ﬁﬁ 
table
ﬁﬁ #
.
ﬁﬁ# $
Column
ﬁﬁ$ *
<
ﬁﬁ* +
string
ﬁﬁ+ 1
>
ﬁﬁ1 2
(
ﬁﬁ2 3
type
ﬁﬁ3 7
:
ﬁﬁ7 8
$str
ﬁﬁ9 ?
,
ﬁﬁ? @
nullable
ﬁﬁA I
:
ﬁﬁI J
true
ﬁﬁK O
)
ﬁﬁO P
,
ﬁﬁP Q
Status
ﬂﬂ 
=
ﬂﬂ 
table
ﬂﬂ "
.
ﬂﬂ" #
Column
ﬂﬂ# )
<
ﬂﬂ) *
string
ﬂﬂ* 0
>
ﬂﬂ0 1
(
ﬂﬂ1 2
type
ﬂﬂ2 6
:
ﬂﬂ6 7
$str
ﬂﬂ8 >
,
ﬂﬂ> ?
nullable
ﬂﬂ@ H
:
ﬂﬂH I
true
ﬂﬂJ N
)
ﬂﬂN O
,
ﬂﬂO P
Score
‡‡ 
=
‡‡ 
table
‡‡ !
.
‡‡! "
Column
‡‡" (
<
‡‡( )
int
‡‡) ,
>
‡‡, -
(
‡‡- .
type
‡‡. 2
:
‡‡2 3
$str
‡‡4 =
,
‡‡= >
nullable
‡‡? G
:
‡‡G H
true
‡‡I M
)
‡‡M N
,
‡‡N O
ProposalCode
··  
=
··! "
table
··# (
.
··( )
Column
··) /
<
··/ 0
string
··0 6
>
··6 7
(
··7 8
type
··8 <
:
··< =
$str
··> D
,
··D E
nullable
··F N
:
··N O
true
··P T
)
··T U
}
‚‚ 
,
‚‚ 
constraints
„„ 
:
„„ 
table
„„ "
=>
„„# %
{
‰‰ 
table
ÂÂ 
.
ÂÂ 

PrimaryKey
ÂÂ $
(
ÂÂ$ %
$str
ÂÂ% 2
,
ÂÂ2 3
x
ÂÂ4 5
=>
ÂÂ6 8
x
ÂÂ9 :
.
ÂÂ: ;
code
ÂÂ; ?
)
ÂÂ? @
;
ÂÂ@ A
table
ÊÊ 
.
ÊÊ 

ForeignKey
ÊÊ $
(
ÊÊ$ %
name
ÁÁ 
:
ÁÁ 
$str
ÁÁ G
,
ÁÁG H
column
ËË 
:
ËË 
x
ËË  !
=>
ËË" $
x
ËË% &
.
ËË& '
ProfessorDocument
ËË' 8
,
ËË8 9
principalTable
ÈÈ &
:
ÈÈ& '
$str
ÈÈ( 3
,
ÈÈ3 4
principalColumn
ÍÍ '
:
ÍÍ' (
$str
ÍÍ) 3
)
ÍÍ3 4
;
ÍÍ4 5
table
ÎÎ 
.
ÎÎ 

ForeignKey
ÎÎ $
(
ÎÎ$ %
name
ÏÏ 
:
ÏÏ 
$str
ÏÏ B
,
ÏÏB C
column
ÌÌ 
:
ÌÌ 
x
ÌÌ  !
=>
ÌÌ" $
x
ÌÌ% &
.
ÌÌ& '
ProposalCode
ÌÌ' 3
,
ÌÌ3 4
principalTable
ÓÓ &
:
ÓÓ& '
$str
ÓÓ( 3
,
ÓÓ3 4
principalColumn
ÔÔ '
:
ÔÔ' (
$str
ÔÔ) /
)
ÔÔ/ 0
;
ÔÔ0 1
table
 
.
 

ForeignKey
 $
(
$ %
name
ÒÒ 
:
ÒÒ 
$str
ÒÒ C
,
ÒÒC D
column
ÚÚ 
:
ÚÚ 
x
ÚÚ  !
=>
ÚÚ" $
x
ÚÚ% &
.
ÚÚ& '
PersonDocument
ÚÚ' 5
,
ÚÚ5 6
principalTable
ÛÛ &
:
ÛÛ& '
$str
ÛÛ( 2
,
ÛÛ2 3
principalColumn
ÙÙ '
:
ÙÙ' (
$str
ÙÙ) 3
)
ÙÙ3 4
;
ÙÙ4 5
}
ıı 
)
ıı 
;
ıı 
migrationBuilder
˜˜ 
.
˜˜ 
CreateTable
˜˜ (
(
˜˜( )
name
¯¯ 
:
¯¯ 
$str
¯¯ '
,
¯¯' (
columns
˘˘ 
:
˘˘ 
table
˘˘ 
=>
˘˘ !
new
˘˘" %
{
˙˙ 
code
˚˚ 
=
˚˚ 
table
˚˚  
.
˚˚  !
Column
˚˚! '
<
˚˚' (
int
˚˚( +
>
˚˚+ ,
(
˚˚, -
type
˚˚- 1
:
˚˚1 2
$str
˚˚3 <
,
˚˚< =
nullable
˚˚> F
:
˚˚F G
false
˚˚H M
)
˚˚M N
.
¸¸ 

Annotation
¸¸ #
(
¸¸# $
$str
¸¸$ D
,
¸¸D E+
NpgsqlValueGenerationStrategy
¸¸F c
.
¸¸c d%
IdentityByDefaultColumn
¸¸d {
)
¸¸{ |
,
¸¸| }!
ProyectFeedBackCode
˝˝ '
=
˝˝( )
table
˝˝* /
.
˝˝/ 0
Column
˝˝0 6
<
˝˝6 7
int
˝˝7 :
>
˝˝: ;
(
˝˝; <
type
˝˝< @
:
˝˝@ A
$str
˝˝B K
,
˝˝K L
nullable
˝˝M U
:
˝˝U V
true
˝˝W [
)
˝˝[ \
,
˝˝\ ]
ProyectCode
˛˛ 
=
˛˛  !
table
˛˛" '
.
˛˛' (
Column
˛˛( .
<
˛˛. /
string
˛˛/ 5
>
˛˛5 6
(
˛˛6 7
type
˛˛7 ;
:
˛˛; <
$str
˛˛= C
,
˛˛C D
nullable
˛˛E M
:
˛˛M N
true
˛˛O S
)
˛˛S T
}
ˇˇ 
,
ˇˇ 
constraints
ÄÄ 
:
ÄÄ 
table
ÄÄ "
=>
ÄÄ# %
{
ÅÅ 
table
ÇÇ 
.
ÇÇ 

PrimaryKey
ÇÇ $
(
ÇÇ$ %
$str
ÇÇ% 9
,
ÇÇ9 :
x
ÇÇ; <
=>
ÇÇ= ?
x
ÇÇ@ A
.
ÇÇA B
code
ÇÇB F
)
ÇÇF G
;
ÇÇG H
table
ÉÉ 
.
ÉÉ 

ForeignKey
ÉÉ $
(
ÉÉ$ %
name
ÑÑ 
:
ÑÑ 
$str
ÑÑ W
,
ÑÑW X
column
ÖÖ 
:
ÖÖ 
x
ÖÖ  !
=>
ÖÖ" $
x
ÖÖ% &
.
ÖÖ& '!
ProyectFeedBackCode
ÖÖ' :
,
ÖÖ: ;
principalTable
ÜÜ &
:
ÜÜ& '
$str
ÜÜ( :
,
ÜÜ: ;
principalColumn
áá '
:
áá' (
$str
áá) /
)
áá/ 0
;
áá0 1
table
àà 
.
àà 

ForeignKey
àà $
(
àà$ %
name
ââ 
:
ââ 
$str
ââ G
,
ââG H
column
ää 
:
ää 
x
ää  !
=>
ää" $
x
ää% &
.
ää& '
ProyectCode
ää' 2
,
ää2 3
principalTable
ãã &
:
ãã& '
$str
ãã( 2
,
ãã2 3
principalColumn
åå '
:
åå' (
$str
åå) /
)
åå/ 0
;
åå0 1
}
çç 
)
çç 
;
çç 
migrationBuilder
èè 
.
èè 
CreateIndex
èè (
(
èè( )
name
êê 
:
êê 
$str
êê 0
,
êê0 1
table
ëë 
:
ëë 
$str
ëë 
,
ëë  
column
íí 
:
íí 
$str
íí (
)
íí( )
;
íí) *
migrationBuilder
îî 
.
îî 
CreateIndex
îî (
(
îî( )
name
ïï 
:
ïï 
$str
ïï 1
,
ïï1 2
table
ññ 
:
ññ 
$str
ññ $
,
ññ$ %
column
óó 
:
óó 
$str
óó $
)
óó$ %
;
óó% &
migrationBuilder
ôô 
.
ôô 
CreateIndex
ôô (
(
ôô( )
name
öö 
:
öö 
$str
öö 1
,
öö1 2
table
õõ 
:
õõ 
$str
õõ $
,
õõ$ %
column
úú 
:
úú 
$str
úú $
)
úú$ %
;
úú% &
migrationBuilder
ûû 
.
ûû 
CreateIndex
ûû (
(
ûû( )
name
üü 
:
üü 
$str
üü A
,
üüA B
table
†† 
:
†† 
$str
†† *
,
††* +
column
°° 
:
°° 
$str
°° .
)
°°. /
;
°°/ 0
migrationBuilder
££ 
.
££ 
CreateIndex
££ (
(
££( )
name
§§ 
:
§§ 
$str
§§ 9
,
§§9 :
table
•• 
:
•• 
$str
•• *
,
••* +
column
¶¶ 
:
¶¶ 
$str
¶¶ &
)
¶¶& '
;
¶¶' (
migrationBuilder
®® 
.
®® 
CreateIndex
®® (
(
®®( )
name
©© 
:
©© 
$str
©© 6
,
©©6 7
table
™™ 
:
™™ 
$str
™™ (
,
™™( )
column
´´ 
:
´´ 
$str
´´ %
)
´´% &
;
´´& '
migrationBuilder
≠≠ 
.
≠≠ 
CreateIndex
≠≠ (
(
≠≠( )
name
ÆÆ 
:
ÆÆ 
$str
ÆÆ >
,
ÆÆ> ?
table
ØØ 
:
ØØ 
$str
ØØ (
,
ØØ( )
column
∞∞ 
:
∞∞ 
$str
∞∞ -
)
∞∞- .
;
∞∞. /
migrationBuilder
≤≤ 
.
≤≤ 
CreateIndex
≤≤ (
(
≤≤( )
name
≥≥ 
:
≥≥ 
$str
≥≥ ,
,
≥≥, -
table
¥¥ 
:
¥¥ 
$str
¥¥ 
,
¥¥  
column
µµ 
:
µµ 
$str
µµ $
)
µµ$ %
;
µµ% &
migrationBuilder
∑∑ 
.
∑∑ 
CreateIndex
∑∑ (
(
∑∑( )
name
∏∏ 
:
∏∏ 
$str
∏∏ 3
,
∏∏3 4
table
ππ 
:
ππ 
$str
ππ "
,
ππ" #
column
∫∫ 
:
∫∫ 
$str
∫∫ (
)
∫∫( )
;
∫∫) *
migrationBuilder
ºº 
.
ºº 
CreateIndex
ºº (
(
ºº( )
name
ΩΩ 
:
ΩΩ 
$str
ΩΩ 6
,
ΩΩ6 7
table
ææ 
:
ææ 
$str
ææ "
,
ææ" #
column
øø 
:
øø 
$str
øø +
)
øø+ ,
;
øø, -
migrationBuilder
¡¡ 
.
¡¡ 
CreateIndex
¡¡ (
(
¡¡( )
name
¬¬ 
:
¬¬ 
$str
¬¬ 5
,
¬¬5 6
table
√√ 
:
√√ 
$str
√√ "
,
√√" #
column
ƒƒ 
:
ƒƒ 
$str
ƒƒ *
)
ƒƒ* +
;
ƒƒ+ ,
migrationBuilder
∆∆ 
.
∆∆ 
CreateIndex
∆∆ (
(
∆∆( )
name
«« 
:
«« 
$str
«« 2
,
««2 3
table
»» 
:
»» 
$str
»» !
,
»»! "
column
…… 
:
…… 
$str
…… (
)
……( )
;
……) *
migrationBuilder
ÀÀ 
.
ÀÀ 
CreateIndex
ÀÀ (
(
ÀÀ( )
name
ÃÃ 
:
ÃÃ 
$str
ÃÃ 5
,
ÃÃ5 6
table
ÕÕ 
:
ÕÕ 
$str
ÕÕ !
,
ÕÕ! "
column
ŒŒ 
:
ŒŒ 
$str
ŒŒ +
)
ŒŒ+ ,
;
ŒŒ, -
migrationBuilder
–– 
.
–– 
CreateIndex
–– (
(
––( )
name
—— 
:
—— 
$str
—— 0
,
——0 1
table
““ 
:
““ 
$str
““ !
,
““! "
column
”” 
:
”” 
$str
”” &
)
””& '
;
””' (
migrationBuilder
’’ 
.
’’ 
CreateIndex
’’ (
(
’’( )
name
÷÷ 
:
÷÷ 
$str
÷÷ =
,
÷÷= >
table
◊◊ 
:
◊◊ 
$str
◊◊ *
,
◊◊* +
column
ÿÿ 
:
ÿÿ 
$str
ÿÿ *
)
ÿÿ* +
;
ÿÿ+ ,
migrationBuilder
⁄⁄ 
.
⁄⁄ 
CreateIndex
⁄⁄ (
(
⁄⁄( )
name
€€ 
:
€€ 
$str
€€ 7
,
€€7 8
table
‹‹ 
:
‹‹ 
$str
‹‹ !
,
‹‹! "
column
›› 
:
›› 
$str
›› -
)
››- .
;
››. /
migrationBuilder
ﬂﬂ 
.
ﬂﬂ 
CreateIndex
ﬂﬂ (
(
ﬂﬂ( )
name
‡‡ 
:
‡‡ 
$str
‡‡ -
,
‡‡- .
table
·· 
:
·· 
$str
··  
,
··  !
column
‚‚ 
:
‚‚ 
$str
‚‚ $
)
‚‚$ %
;
‚‚% &
migrationBuilder
‰‰ 
.
‰‰ 
CreateIndex
‰‰ (
(
‰‰( )
name
ÂÂ 
:
ÂÂ 
$str
ÂÂ -
,
ÂÂ- .
table
ÊÊ 
:
ÊÊ 
$str
ÊÊ  
,
ÊÊ  !
column
ÁÁ 
:
ÁÁ 
$str
ÁÁ $
)
ÁÁ$ %
;
ÁÁ% &
migrationBuilder
ÈÈ 
.
ÈÈ 
CreateIndex
ÈÈ (
(
ÈÈ( )
name
ÍÍ 
:
ÍÍ 
$str
ÍÍ =
,
ÍÍ= >
table
ÎÎ 
:
ÎÎ 
$str
ÎÎ '
,
ÎÎ' (
column
ÏÏ 
:
ÏÏ 
$str
ÏÏ -
)
ÏÏ- .
;
ÏÏ. /
migrationBuilder
ÓÓ 
.
ÓÓ 
CreateIndex
ÓÓ (
(
ÓÓ( )
name
ÔÔ 
:
ÔÔ 
$str
ÔÔ /
,
ÔÔ/ 0
table
 
:
 
$str
 
,
 
column
ÒÒ 
:
ÒÒ 
$str
ÒÒ (
)
ÒÒ( )
;
ÒÒ) *
migrationBuilder
ÛÛ 
.
ÛÛ 
CreateIndex
ÛÛ (
(
ÛÛ( )
name
ÙÙ 
:
ÙÙ 
$str
ÙÙ *
,
ÙÙ* +
table
ıı 
:
ıı 
$str
ıı 
,
ıı 
column
ˆˆ 
:
ˆˆ 
$str
ˆˆ #
,
ˆˆ# $
unique
˜˜ 
:
˜˜ 
true
˜˜ 
)
˜˜ 
;
˜˜ 
}
¯¯ 	
	protected
˚˚ 
override
˚˚ 
void
˚˚ 
Down
˚˚  $
(
˚˚$ %
MigrationBuilder
˚˚% 5
migrationBuilder
˚˚6 F
)
˚˚F G
{
¸¸ 	
migrationBuilder
˝˝ 
.
˝˝ 
	DropTable
˝˝ &
(
˝˝& '
name
˛˛ 
:
˛˛ 
$str
˛˛ #
)
˛˛# $
;
˛˛$ %
migrationBuilder
ÄÄ 
.
ÄÄ 
	DropTable
ÄÄ &
(
ÄÄ& '
name
ÅÅ 
:
ÅÅ 
$str
ÅÅ )
)
ÅÅ) *
;
ÅÅ* +
migrationBuilder
ÉÉ 
.
ÉÉ 
	DropTable
ÉÉ &
(
ÉÉ& '
name
ÑÑ 
:
ÑÑ 
$str
ÑÑ '
)
ÑÑ' (
;
ÑÑ( )
migrationBuilder
ÜÜ 
.
ÜÜ 
	DropTable
ÜÜ &
(
ÜÜ& '
name
áá 
:
áá 
$str
áá 
)
áá  
;
áá  !
migrationBuilder
ââ 
.
ââ 
	DropTable
ââ &
(
ââ& '
name
ää 
:
ää 
$str
ää 
)
ää 
;
ää 
migrationBuilder
åå 
.
åå 
	DropTable
åå &
(
åå& '
name
çç 
:
çç 
$str
çç )
)
çç) *
;
çç* +
migrationBuilder
èè 
.
èè 
	DropTable
èè &
(
èè& '
name
êê 
:
êê 
$str
êê (
)
êê( )
;
êê) *
migrationBuilder
íí 
.
íí 
	DropTable
íí &
(
íí& '
name
ìì 
:
ìì 
$str
ìì  
)
ìì  !
;
ìì! "
migrationBuilder
ïï 
.
ïï 
	DropTable
ïï &
(
ïï& '
name
ññ 
:
ññ 
$str
ññ !
)
ññ! "
;
ññ" #
migrationBuilder
òò 
.
òò 
	DropTable
òò &
(
òò& '
name
ôô 
:
ôô 
$str
ôô &
)
ôô& '
;
ôô' (
migrationBuilder
õõ 
.
õõ 
	DropTable
õõ &
(
õõ& '
name
úú 
:
úú 
$str
úú !
)
úú! "
;
úú" #
migrationBuilder
ûû 
.
ûû 
	DropTable
ûû &
(
ûû& '
name
üü 
:
üü 
$str
üü  
)
üü  !
;
üü! "
migrationBuilder
°° 
.
°° 
	DropTable
°° &
(
°°& '
name
¢¢ 
:
¢¢ 
$str
¢¢ )
)
¢¢) *
;
¢¢* +
migrationBuilder
§§ 
.
§§ 
	DropTable
§§ &
(
§§& '
name
•• 
:
•• 
$str
•• )
)
••) *
;
••* +
migrationBuilder
ßß 
.
ßß 
	DropTable
ßß &
(
ßß& '
name
®® 
:
®® 
$str
®® 
)
®® 
;
®®  
migrationBuilder
™™ 
.
™™ 
	DropTable
™™ &
(
™™& '
name
´´ 
:
´´ 
$str
´´ &
)
´´& '
;
´´' (
migrationBuilder
≠≠ 
.
≠≠ 
	DropTable
≠≠ &
(
≠≠& '
name
ÆÆ 
:
ÆÆ 
$str
ÆÆ 
)
ÆÆ 
;
ÆÆ  
migrationBuilder
∞∞ 
.
∞∞ 
	DropTable
∞∞ &
(
∞∞& '
name
±± 
:
±± 
$str
±± #
)
±±# $
;
±±$ %
}
≤≤ 	
}
≥≥ 
}¥¥ À%
<C:\Users\sofia\Documents\project\Pegi.Api\src\Api\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
ConfigurationManager 
configuration "
=# $
builder% ,
., -
Configuration- :
;: ;
string 
? 
connectionString 
= 
configuration 
. 
GetConnectionString %
(% &
$str& 9
)9 :
;: ;
builder 
. 
Services 
. 
AddDbContext 
< 
PegiDbContext +
>+ ,
(, -
options- 4
=>5 7
options 
. 
SetupDatabaseEngine 
(  
connectionString  0
)0 1
) 
; 
builder 
. 
Services 
. 
AddAuthentication "
(" #
JwtBearerDefaults# 4
.4 5 
AuthenticationScheme5 I
)I J
.J K
AddJwtBearerK W
(W X
optionsX _
=>` b
{ 
options 
.  
RequireHttpsMetadata  
=! "
false# (
;( )
options 
. 
	SaveToken 
= 
true 
; 
options 
. %
TokenValidationParameters %
=& '
new( +%
TokenValidationParameters, E
(E F
)F G
{ 
ValidateIssuer 
= 
false 
, 
ValidateAudience 
= 
false  
,  !
ValidateLifetime 
= 
true 
,  $
ValidateIssuerSigningKey  
=! "
true# '
,' (
IssuerSigningKey 
= 
new  
SymmetricSecurityKey 3
(3 4
Encoding4 <
.< =
UTF8= A
.A B
GetBytesB J
(J K
builderK R
.R S
ConfigurationS `
[` a
$stra j
]j k
)k l
)l m
} 
; 
} 
) 
; 
builder!! 
.!! 
Services!! 
.!! 
AddRepositories!!  
(!!  !
)!!! "
;!!" #
builder"" 
."" 
Services"" 
."" 
AddServices"" 
("" 
)"" 
;"" 
builder## 
.## 
Services## 
.## 
AddControllers## 
(##  
)##  !
;##! "
builder%% 
.%% 
Services%% 
.%% #
AddEndpointsApiExplorer%% (
(%%( )
)%%) *
;%%* +
builder&& 
.&& 
Services&& 
.&& 
AddSwaggerGen&& 
(&& 
)&&  
;&&  !
builder'' 
.'' 
Services'' 
.'' 
AddCors'' 
('' 
options''  
=>''! #
options(( 
.(( 
AddDefaultPolicy(( 
((( 
policy)) 
=>)) 
policy)) 
.)) 
WithOrigins)) $
())$ %
$str))% (
)))( )
.))) *
AllowAnyMethod))* 8
())8 9
)))9 :
.)): ;
AllowAnyHeader)); I
())I J
)))J K
)))K L
)** 
;** 
WebApplication-- 
app-- 
=-- 
builder-- 
.-- 
Build-- "
(--" #
)--# $
;--$ %
if// 
(// 
app// 
.// 
Environment// 
.// 
IsDevelopment// !
(//! "
)//" #
)//# $
{00 
app11 
.11 

UseSwagger11 
(11 
)11 
;11 
app22 
.22 
UseSwaggerUI22 
(22 
)22 
;22 
}33 
app55 
.55 
UseCors55 
(55 
)55 
;55 
app66 
.66 
UseAuthentication66 
(66 
)66 
;66 
app77 
.77 
UseAuthorization77 
(77 
)77 
;77 
app88 
.88 
MapControllers88 
(88 
)88 
;88 
app:: 
.:: 
Run:: 
(:: 
):: 	
;::	 
