�
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
; �
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
}44 �
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
;' (� 
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
}44 �
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
;8 9�
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
;K L�
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
;D E�
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
; �
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
}:: �
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
; �
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
;] ^�5
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
}UU �
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
;V W�
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
;8 9�
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
;# $�5
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
}UU �
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
;[ \�
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
;e f�
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
;[ \�
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
} �
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
;? @�
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
; �0
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
NameUser	!!} �
)
!!� �
;
!!� �
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
}LL �
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
; �
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
; �J
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
}rr �
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
; ��
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
�� 
(
�� 

statistics
�� 
==
�� 
null
�� "
)
��" #
{
�� 
return
�� 

BadRequest
�� !
(
��! "
new
�� 
Response
��  
<
��  !
Void
��! %
>
��% &
(
��& '
$str
��' N
)
��N O
)
��O P
;
��P Q
}
�� 
return
�� 
Ok
�� 
(
�� 
new
�� 
Response
�� "
<
��" #
object
��# )
>
��) *
(
��* +

statistics
��+ 5
)
��5 6
)
��6 7
;
��7 8
}
�� 	
catch
�� 
(
�� 
PersonExeption
�� 
e
�� 
)
��  
{
�� 	
return
�� 

BadRequest
�� 
(
�� 
new
�� !
Response
��" *
<
��* +
Void
��+ /
>
��/ 0
(
��0 1
e
��1 2
.
��2 3
Message
��3 :
)
��: ;
)
��; <
;
��< =
}
�� 	
}
�� 
[
�� 
HttpGet
�� 
(
�� 
$str
�� *
)
��* +
]
��+ ,
[
�� 
	Authorize
�� 
(
�� 
Roles
�� 
=
�� 
$str
�� &
)
��& '
]
��' (
public
�� 

ActionResult
�� +
GetGeneralStatisticsProposals
�� 5
(
��5 6
)
��6 7
{
�� 
try
�� 
{
�� 	
object
�� 

statistics
�� 
=
�� 
_proposalService
��  
.
��  !(
GeneralStatisticsProposals
��! ;
(
��; <
)
��< =
;
��= >
if
�� 
(
�� 

statistics
�� 
==
�� 
null
�� "
)
��" #
{
�� 
return
�� 

BadRequest
�� !
(
��! "
new
�� 
Response
��  
<
��  !
Void
��! %
>
��% &
(
��& '
$str
��' <
)
��< =
)
��= >
;
��> ?
}
�� 
return
�� 
Ok
�� 
(
�� 
new
�� 
Response
�� "
<
��" #
object
��# )
>
��) *
(
��* +

statistics
��+ 5
)
��5 6
)
��6 7
;
��7 8
}
�� 	
catch
�� 
(
�� 
PersonExeption
�� 
e
�� 
)
��  
{
�� 	
return
�� 

BadRequest
�� 
(
�� 
new
�� !
Response
��" *
<
��* +
Void
��+ /
>
��/ 0
(
��0 1
e
��1 2
.
��2 3
Message
��3 :
)
��: ;
)
��; <
;
��< =
}
�� 	
}
�� 
[
�� 
HttpGet
�� 
(
�� 
$str
�� '
)
��' (
]
��( )
[
�� 
	Authorize
�� 
(
�� 
Roles
�� 
=
�� 
$str
�� 9
)
��9 :
]
��: ;
public
�� 

ActionResult
�� 
GetProposalCode
�� '
(
��' (
[
��( )
	FromRoute
��) 2
]
��2 3
string
��4 :
code
��; ?
)
��? @
{
�� 
try
�� 
{
�� 	
Entities
�� 
.
�� 
Proposal
�� 
?
�� 
proposal
�� 
=
�� 
_proposalService
�� +
.
��+ ,
GetProposalCode
��, ;
(
��; <
code
��< @
)
��@ A
;
��A B
if
�� 
(
�� 
proposal
�� 
==
�� 
null
��  
)
��  !
{
�� 
return
�� 

BadRequest
�� !
(
��! "
new
�� 
Response
��  
<
��  !
Void
��! %
>
��% &
(
��& '
$str
��' V
)
��V W
)
��W X
;
��X Y
}
�� 
return
�� 
Ok
�� 
(
�� 
new
�� 
Response
�� 
<
�� 
ProposalResponse
�� -
>
��- .
(
��. /
proposal
�� 
.
�� 
Adapt
�� "
<
��" #
ProposalResponse
��# 3
>
��3 4
(
��4 5
)
��5 6
)
��6 7
)
��7 8
;
��8 9
}
�� 	
catch
�� 
(
�� 
PersonExeption
�� 
e
�� 
)
��  
{
�� 	
return
�� 

BadRequest
�� 
(
�� 
new
�� !
Response
��" *
<
��* +
Void
��+ /
>
��/ 0
(
��0 1
e
��1 2
.
��2 3
Message
��3 :
)
��: ;
)
��; <
;
��< =
}
�� 	
}
�� 
[
�� 
HttpPut
�� 
(
�� 
$str
�� )
)
��) *
]
��* +
[
�� 
	Authorize
�� 
(
�� 
Roles
�� 
=
�� 
$str
�� &
)
��& '
]
��' (
public
�� 

ActionResult
�� %
UpdateProfessorProposal
�� /
(
��/ 0
[
��0 1
FromBody
��1 9
]
��9 :#
ProposalUpdateRequest
��; P#
proposalUpdateRequest
��Q f
)
��f g
{
�� 
try
�� 
{
�� 	
var
�� 
(
�� 
message
�� 
,
�� 
response
�� !
)
��! "
=
��" #
_proposalService
��$ 4
.
��4 5-
UpdateProfessorDocumentProposal
��5 T
(
��T U#
proposalUpdateRequest
��U j
.
��j k
code
��k o
,
��o p$
proposalUpdateRequest��p �
.��� �!
ProfessorDocument��� �
)��� �
;��� �
if
�� 
(
�� 
response
�� 
==
�� 
false
�� !
)
��" #
{
�� 
return
�� 

BadRequest
�� !
(
��! "
new
�� 
Response
��  
<
��  !
Void
��! %
>
��% &
(
��& '
message
��' .
)
��. /
)
��/ 0
;
��0 1
}
�� 
return
�� 
Ok
�� 
(
�� 
new
�� 
Response
�� #
<
��# $
Void
��$ (
>
��( )
(
��) *
message
��* 1
)
��1 2
)
��2 3
;
��3 4
}
�� 	
catch
�� 
(
�� 
PersonExeption
�� 
e
�� 
)
��  
{
�� 	
return
�� 

BadRequest
�� 
(
�� 
new
�� !
Response
��" *
<
��* +
Void
��+ /
>
��/ 0
(
��0 1
e
��1 2
.
��2 3
Message
��3 :
)
��: ;
)
��; <
;
��< =
}
�� 	
}
�� 
[
�� 
HttpGet
�� 
]
�� 
public
�� 

ActionResult
�� 
GetAll
�� 
(
�� 
)
��  
{
�� 
try
�� 
{
�� 	
List
�� 
<
�� 
Entities
�� 
.
�� 
Proposal
�� "
>
��" #
	proposals
��$ -
=
��. /
_proposalService
��  
.
��  !
GetAll
��! '
(
��' (
)
��( )
;
��) *
if
�� 
(
�� 
	proposals
�� 
.
�� 
Count
�� 
<
��  !
$num
��" #
)
��# $
{
�� 
return
�� 

BadRequest
�� !
(
��! "
new
�� 
Response
��  
<
��  !
Void
��! %
>
��% &
(
��& '
$str
��' S
)
��S T
)
��T U
;
��U V
}
�� 
return
�� 
Ok
�� 
(
�� 
new
�� 
Response
�� "
<
��" #
List
��# '
<
��' (
ProposalResponse
��( 8
>
��8 9
>
��9 :
(
��: ;
	proposals
�� 
?
�� 
.
�� 
Adapt
��  
<
��  !
List
��! %
<
��% &
ProposalResponse
��& 6
>
��6 7
>
��7 8
(
��8 9
)
��9 :
)
��: ;
)
��; <
;
��< =
}
�� 	
catch
�� 
(
�� 
PersonExeption
�� 
e
�� 
)
��  
{
�� 	
return
�� 

BadRequest
�� 
(
�� 
new
�� !
Response
��" *
<
��* +
Void
��+ /
>
��/ 0
(
��0 1
e
��1 2
.
��2 3
Message
��3 :
)
��: ;
)
��; <
;
��< =
}
�� 	
}
�� 
[
�� 

HttpDelete
�� 
(
�� 
$str
�� 
)
�� 
]
�� 
[
�� 
	Authorize
�� 
(
�� 
Roles
�� 
=
�� 
(
�� 
$str
�� $
)
��$ %
)
��% &
]
��& '
public
�� 

ActionResult
�� 
DeleteProposal
�� &
(
��& '
[
��' (
	FromRoute
��( 1
]
��1 2
string
��3 9
code
��: >
)
��> ?
{
�� 
try
�� 
{
�� 	
string
�� 
message
�� 
=
�� 
_proposalService
�� -
.
��- .
DeleteProposal
��. <
(
��< =
code
��= A
)
��A B
;
��B C
return
�� 
Ok
�� 
(
�� 
new
�� 
Response
�� "
<
��" #
Void
��# '
>
��' (
(
��( )
message
��) 0
,
��0 1
false
��2 7
)
��7 8
)
��8 9
;
��9 :
}
�� 	
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 	
return
�� 

BadRequest
�� 
(
�� 
new
�� !
Response
��" *
<
��* +
Void
��+ /
>
��/ 0
(
��0 1
e
��1 2
.
��2 3
Message
��3 :
)
��: ;
)
��; <
;
��< =
}
�� 	
}
�� 
}�� �	
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
;F G�

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
;B C�
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
;L M��
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
proyectUpdateRequest	~~m �
.
~~� �
ProfessorDocument
~~� �
)
~~� �
;
~~� �
if 
( 
response 
== 
false !
)" #
{
�� 
return
�� 

BadRequest
�� !
(
��! "
new
�� 
Response
��  
<
��  !
Void
��! %
>
��% &
(
��& '
message
��' .
)
��. /
)
��/ 0
;
��0 1
}
�� 
return
�� 
Ok
�� 
(
�� 
new
�� 
Response
�� "
<
��" #
Void
��# '
>
��' (
(
��( )
message
��) 0
)
��0 1
)
��1 2
;
��2 3
}
�� 	
catch
�� 
(
�� 
PersonExeption
�� 
e
�� 
)
��  
{
�� 	
return
�� 

BadRequest
�� 
(
�� 
new
�� !
Response
��" *
<
��* +
Void
��+ /
>
��/ 0
(
��0 1
e
��1 2
.
��2 3
Message
��3 :
)
��: ;
)
��; <
;
��< =
}
�� 	
}
�� 
[
�� 
HttpGet
�� 
]
�� 
public
�� 

ActionResult
�� 
GetAll
�� 
(
�� 
)
��  
{
�� 
try
�� 
{
�� 	
List
�� 
<
�� 
Entities
�� 
.
�� 
Proyect
�� !
>
��! "
proyects
��# +
=
��, -
_proyectService
�� 
.
��  
GetAll
��  &
(
��& '
)
��' (
;
��( )
if
�� 
(
�� 
proyects
�� 
.
�� 
Count
�� 
<
��  
$num
��! "
)
��" #
{
�� 
return
�� 

BadRequest
�� !
(
��! "
new
�� 
Response
��  
<
��  !
Void
��! %
>
��% &
(
��& '
$str
��' I
)
��I J
)
��J K
;
��K L
}
�� 
return
�� 
Ok
�� 
(
�� 
new
�� 
Response
�� "
<
��" #
List
��# '
<
��' (
ProyectResponse
��( 7
>
��7 8
>
��8 9
(
��9 :
proyects
�� 
?
�� 
.
�� 
Adapt
�� 
<
��  
List
��  $
<
��$ %
ProyectResponse
��% 4
>
��4 5
>
��5 6
(
��6 7
)
��7 8
)
��8 9
)
��9 :
;
��: ;
}
�� 	
catch
�� 
(
�� 
PersonExeption
�� 
e
�� 
)
��  
{
�� 	
return
�� 

BadRequest
�� 
(
�� 
new
�� !
Response
��" *
<
��* +
Void
��+ /
>
��/ 0
(
��0 1
e
��1 2
.
��2 3
Message
��3 :
)
��: ;
)
��; <
;
��< =
}
�� 	
}
�� 
[
�� 

HttpDelete
�� 
(
�� 
$str
�� 
)
�� 
]
�� 
[
�� 
	Authorize
�� 
(
�� 
Roles
�� 
=
�� 
(
�� 
$str
�� $
)
��$ %
)
��% &
]
��& '
public
�� 

ActionResult
�� 
DeleteProyect
�� %
(
��% &
[
��& '
	FromRoute
��' 0
]
��0 1
string
��2 8
code
��9 =
)
��= >
{
�� 
try
�� 
{
�� 	
string
�� 
message
�� 
=
�� 
_proyectService
�� ,
.
��, -
DeleteProyect
��- :
(
��: ;
code
��; ?
)
��? @
;
��@ A
return
�� 
Ok
�� 
(
�� 
new
�� 
Response
�� "
<
��" #
Void
��# '
>
��' (
(
��( )
message
��) 0
,
��0 1
false
��2 7
)
��7 8
)
��8 9
;
��9 :
}
�� 	
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 	
return
�� 

BadRequest
�� 
(
�� 
new
�� !
Response
��" *
<
��* +
Void
��+ /
>
��/ 0
(
��0 1
e
��1 2
.
��2 3
Message
��3 :
)
��: ;
)
��; <
;
��< =
}
�� 	
}
�� 
[
�� 
HttpGet
�� 
(
�� 
$str
�� >
)
��> ?
]
��? @
[
�� 
	Authorize
�� 
(
�� 
Roles
�� 
=
�� 
$str
�� .
)
��. /
]
��/ 0
public
�� 

ActionResult
�� 2
$GetGeneralStatisticsProyectProfessor
�� <
(
��< =
[
��= >
	FromRoute
��> G
]
��G H
string
��I O
document
��P X
)
��X Y
{
�� 
try
�� 
{
�� 	
object
�� 

statistics
�� 
=
�� 
_proyectService
�� 
.
��  /
!GeneralStatisticsProyectProfessor
��  A
(
��A B
document
��B J
)
��J K
;
��K L
if
�� 
(
�� 

statistics
�� 
==
�� 
null
�� "
)
��" #
{
�� 
return
�� 

BadRequest
�� !
(
��! "
new
�� 
Response
��  
<
��  !
Void
��! %
>
��% &
(
��& '
$str
��' N
)
��N O
)
��O P
;
��P Q
}
�� 
return
�� 
Ok
�� 
(
�� 
new
�� 
Response
�� "
<
��" #
object
��# )
>
��) *
(
��* +

statistics
��+ 5
)
��5 6
)
��6 7
;
��7 8
}
�� 	
catch
�� 
(
�� 
PersonExeption
�� 
e
�� 
)
��  
{
�� 	
return
�� 

BadRequest
�� 
(
�� 
new
�� !
Response
��" *
<
��* +
Void
��+ /
>
��/ 0
(
��0 1
e
��1 2
.
��2 3
Message
��3 :
)
��: ;
)
��; <
;
��< =
}
�� 	
}
�� 
[
�� 
HttpGet
�� 
(
�� 
$str
�� <
)
��< =
]
��= >
[
�� 
	Authorize
�� 
(
�� 
Roles
�� 
=
�� 
$str
�� 1
)
��1 2
]
��2 3
public
�� 

ActionResult
�� 0
"GetGeneralStatisticsProyectStudent
�� :
(
��: ;
[
��; <
	FromRoute
��< E
]
��E F
string
��G M
document
��N V
)
��V W
{
�� 
try
�� 
{
�� 	
object
�� 

statistics
�� 
=
�� 
_proyectService
�� 
.
��  -
GeneralStatisticsProyectStudent
��  ?
(
��? @
document
��@ H
)
��H I
;
��I J
if
�� 
(
�� 

statistics
�� 
==
�� 
null
�� "
)
��" #
{
�� 
return
�� 

BadRequest
�� !
(
��! "
new
�� 
Response
��  
<
��  !
Void
��! %
>
��% &
(
��& '
$str
��' N
)
��N O
)
��O P
;
��P Q
}
�� 
return
�� 
Ok
�� 
(
�� 
new
�� 
Response
�� "
<
��" #
object
��# )
>
��) *
(
��* +

statistics
��+ 5
)
��5 6
)
��6 7
;
��7 8
}
�� 	
catch
�� 
(
�� 
PersonExeption
�� 
e
�� 
)
��  
{
�� 	
return
�� 

BadRequest
�� 
(
�� 
new
�� !
Response
��" *
<
��* +
Void
��+ /
>
��/ 0
(
��0 1
e
��1 2
.
��2 3
Message
��3 :
)
��: ;
)
��; <
;
��< =
}
�� 	
}
�� 
[
�� 
HttpGet
�� 
(
�� 
$str
�� )
)
��) *
]
��* +
[
�� 
	Authorize
�� 
(
�� 
Roles
�� 
=
�� 
$str
�� &
)
��& '
]
��' (
public
�� 

ActionResult
�� +
GetGeneralStatisticsProposals
�� 5
(
��5 6
)
��6 7
{
�� 
try
�� 
{
�� 	
object
�� 

statistics
�� 
=
�� 
_proyectService
�� 
.
��  '
GeneralStatisticsProyects
��  9
(
��9 :
)
��: ;
;
��; <
if
�� 
(
�� 

statistics
�� 
==
�� 
null
�� "
)
��" #
{
�� 
return
�� 

BadRequest
�� !
(
��! "
new
�� 
Response
��  
<
��  !
Void
��! %
>
��% &
(
��& '
$str
��' <
)
��< =
)
��= >
;
��> ?
}
�� 
return
�� 
Ok
�� 
(
�� 
new
�� 
Response
�� "
<
��" #
object
��# )
>
��) *
(
��* +

statistics
��+ 5
)
��5 6
)
��6 7
;
��7 8
}
�� 	
catch
�� 
(
�� 
PersonExeption
�� 
e
�� 
)
��  
{
�� 	
return
�� 

BadRequest
�� 
(
�� 
new
�� !
Response
��" *
<
��* +
Void
��+ /
>
��/ 0
(
��0 1
e
��1 2
.
��2 3
Message
��3 :
)
��: ;
)
��; <
;
��< =
}
�� 	
}
�� 
}�� �
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
;F G�
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
;F G�
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
;K L�
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
; �'
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
}BB �
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
;? @�
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
; �
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
; �(
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
}KK �
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
}"" �
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
;		 �%
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
}>> �
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
; �
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
 �
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
}:: �
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
 �
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
;\ ]�
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
; �(
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
}FF �
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
} �5
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
}55 �#
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
}99 ��
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
�� &
=
��' (
table
��) .
.
��. /
Column
��/ 5
<
��5 6
string
��6 <
>
��< =
(
��= >
type
��> B
:
��B C
$str
��D J
,
��J K
nullable
��L T
:
��T U
true
��V Z
)
��Z [
,
��[ \
person_gender
�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
string
��1 7
>
��7 8
(
��8 9
type
��9 =
:
��= >
$str
��? E
,
��E F
nullable
��G O
:
��O P
true
��Q U
)
��U V
,
��V W
person_birth_date
�� %
=
��& '
table
��( -
.
��- .
Column
��. 4
<
��4 5
DateTime
��5 =
>
��= >
(
��> ?
type
��? C
:
��C D
$str
��E _
,
��_ `
nullable
��a i
:
��i j
true
��k o
)
��o p
,
��p q
person_phone
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
string
��0 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> D
,
��D E
nullable
��F N
:
��N O
true
��P T
)
��T U
,
��U V(
person_institutional_email
�� .
=
��/ 0
table
��1 6
.
��6 7
Column
��7 =
<
��= >
string
��> D
>
��D E
(
��E F
type
��F J
:
��J K
$str
��L R
,
��R S
nullable
��T \
:
��\ ]
true
��^ b
)
��b c
,
��c d

CitiesCode
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
string
��. 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< B
,
��B C
nullable
��D L
:
��L M
true
��N R
)
��R S
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 0
,
��0 1
x
��2 3
=>
��4 6
x
��7 8
.
��8 9
document
��9 A
)
��A B
;
��B C
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� ;
,
��; <
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '

CitiesCode
��' 1
,
��1 2
principalTable
�� &
:
��& '
$str
��( 0
,
��0 1
principalColumn
�� '
:
��' (
$str
��) 2
)
��2 3
;
��3 4
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� &
,
��& '
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
code
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 <
,
��< =
nullable
��> F
:
��F G
false
��H M
)
��M N
,
��N O
name
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 <
,
��< =
nullable
��> F
:
��F G
true
��H L
)
��L M
,
��M N!
ResearchSublineCode
�� '
=
��( )
table
��* /
.
��/ 0
Column
��0 6
<
��6 7
string
��7 =
>
��= >
(
��> ?
type
��? C
:
��C D
$str
��E K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 8
,
��8 9
x
��: ;
=>
��< >
x
��? @
.
��@ A
code
��A E
)
��E F
;
��F G
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� W
,
��W X
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '!
ResearchSublineCode
��' :
,
��: ;
principalTable
�� &
:
��& '
$str
��( ;
,
��; <
principalColumn
�� '
:
��' (
$str
��) /
)
��/ 0
;
��0 1
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� #
,
��# $
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
experience_code
�� #
=
��$ %
table
��& +
.
��+ ,
Column
��, 2
<
��2 3
string
��3 9
>
��9 :
(
��: ;
type
��; ?
:
��? @
$str
��A G
,
��G H
nullable
��I Q
:
��Q R
false
��S X
)
��X Y
,
��Y Z$
experience_institution
�� *
=
��+ ,
table
��- 2
.
��2 3
Column
��3 9
<
��9 :
string
��: @
>
��@ A
(
��A B
type
��B F
:
��F G
$str
��H N
,
��N O
nullable
��P X
:
��X Y
false
��Z _
)
��_ `
,
��` a
study_start_date
�� $
=
��% &
table
��' ,
.
��, -
Column
��- 3
<
��3 4
DateTime
��4 <
>
��< =
(
��= >
type
��> B
:
��B C
$str
��D ^
,
��^ _
nullable
��` h
:
��h i
false
��j o
)
��o p
,
��p q
study_end_date
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
DateTime
��2 :
>
��: ;
(
��; <
type
��< @
:
��@ A
$str
��B \
,
��\ ]
nullable
��^ f
:
��f g
false
��h m
)
��m n
,
��n o

CitiesCode
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
string
��. 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< B
,
��B C
nullable
��D L
:
��L M
false
��N S
)
��S T
,
��T U

PeopleCode
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
string
��. 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< B
,
��B C
nullable
��D L
:
��L M
false
��N S
)
��S T
,
��T U!
experience_position
�� '
=
��( )
table
��* /
.
��/ 0
Column
��0 6
<
��6 7
string
��7 =
>
��= >
(
��> ?
type
��? C
:
��C D
$str
��E K
,
��K L
nullable
��M U
:
��U V
false
��W \
)
��\ ]
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 5
,
��5 6
x
��7 8
=>
��9 ;
x
��< =
.
��= >
experience_code
��> M
)
��M N
;
��N O
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� @
,
��@ A
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '

CitiesCode
��' 1
,
��1 2
principalTable
�� &
:
��& '
$str
��( 0
,
��0 1
principalColumn
�� '
:
��' (
$str
��) 2
,
��2 3
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� @
,
��@ A
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '

PeopleCode
��' 1
,
��1 2
principalTable
�� &
:
��& '
$str
��( 0
,
��0 1
principalColumn
�� '
:
��' (
$str
��) 3
,
��3 4
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� !
,
��! "
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Document
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
string
��, 2
>
��2 3
(
��3 4
type
��4 8
:
��8 9
$str
��: @
,
��@ A
nullable
��B J
:
��J K
false
��L Q
)
��Q R
,
��R S
position
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
string
��, 2
>
��2 3
(
��3 4
type
��4 8
:
��8 9
$str
��: @
,
��@ A
nullable
��B J
:
��J K
true
��L P
)
��P Q
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 3
,
��3 4
x
��5 6
=>
��7 9
x
��: ;
.
��; <
Document
��< D
)
��D E
;
��E F
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� <
,
��< =
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
Document
��' /
,
��/ 0
principalTable
�� &
:
��& '
$str
��( 0
,
��0 1
principalColumn
�� '
:
��' (
$str
��) 3
,
��3 4
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
��  
,
��  !
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Document
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
string
��, 2
>
��2 3
(
��3 4
type
��4 8
:
��8 9
$str
��: @
,
��@ A
nullable
��B J
:
��J K
false
��L Q
)
��Q R
,
��R S
amount_credits
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
string
��2 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ F
,
��F G
nullable
��H P
:
��P Q
true
��R V
)
��V W
,
��W X!
AcademicProgramCode
�� '
=
��( )
table
��* /
.
��/ 0
Column
��0 6
<
��6 7
string
��7 =
>
��= >
(
��> ?
type
��? C
:
��C D
$str
��E K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 2
,
��2 3
x
��4 5
=>
��6 8
x
��9 :
.
��: ;
Document
��; C
)
��C D
;
��D E
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� Q
,
��Q R
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '!
AcademicProgramCode
��' :
,
��: ;
principalTable
�� &
:
��& '
$str
��( ;
,
��; <
principalColumn
�� '
:
��' (
$str
��) 7
)
��7 8
;
��8 9
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� ;
,
��; <
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
Document
��' /
,
��/ 0
principalTable
�� &
:
��& '
$str
��( 0
,
��0 1
principalColumn
�� '
:
��' (
$str
��) 3
,
��3 4
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� 
,
��  
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 

study_code
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
string
��. 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< B
,
��B C
nullable
��D L
:
��L M
false
��N S
)
��S T
,
��T U
study_institution
�� %
=
��& '
table
��( -
.
��- .
Column
��. 4
<
��4 5
string
��5 ;
>
��; <
(
��< =
type
��= A
:
��A B
$str
��C I
,
��I J
nullable
��K S
:
��S T
false
��U Z
)
��Z [
,
��[ \
study_start_date
�� $
=
��% &
table
��' ,
.
��, -
Column
��- 3
<
��3 4
DateTime
��4 <
>
��< =
(
��= >
type
��> B
:
��B C
$str
��D ^
,
��^ _
nullable
��` h
:
��h i
false
��j o
)
��o p
,
��p q
study_end_date
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
DateTime
��2 :
>
��: ;
(
��; <
type
��< @
:
��@ A
$str
��B \
,
��\ ]
nullable
��^ f
:
��f g
false
��h m
)
��m n
,
��n o

CitiesCode
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
string
��. 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< B
,
��B C
nullable
��D L
:
��L M
false
��N S
)
��S T
,
��T U

PeopleCode
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
string
��. 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< B
,
��B C
nullable
��D L
:
��L M
false
��N S
)
��S T
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 1
,
��1 2
x
��3 4
=>
��5 7
x
��8 9
.
��9 :

study_code
��: D
)
��D E
;
��E F
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� <
,
��< =
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '

CitiesCode
��' 1
,
��1 2
principalTable
�� &
:
��& '
$str
��( 0
,
��0 1
principalColumn
�� '
:
��' (
$str
��) 2
,
��2 3
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� <
,
��< =
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '

PeopleCode
��' 1
,
��1 2
principalTable
�� &
:
��& '
$str
��( 0
,
��0 1
principalColumn
�� '
:
��' (
$str
��) 3
,
��3 4
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� 
,
�� 
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
	user_name
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
string
��- 3
>
��3 4
(
��4 5
type
��5 9
:
��9 :
$str
��; A
,
��A B
nullable
��C K
:
��K L
false
��M R
)
��R S
,
��S T
user_password
�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
string
��1 7
>
��7 8
(
��8 9
type
��9 =
:
��= >
$str
��? E
,
��E F
nullable
��G O
:
��O P
true
��Q U
)
��U V
,
��V W
user_rol
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
string
��, 2
>
��2 3
(
��3 4
type
��4 8
:
��8 9
$str
��: @
,
��@ A
nullable
��B J
:
��J K
true
��L P
)
��P Q
,
��Q R
PersonDocument
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
string
��2 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ F
,
��F G
nullable
��H P
:
��P Q
true
��R V
)
��V W
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% /
,
��/ 0
x
��1 2
=>
��3 5
x
��6 7
.
��7 8
	user_name
��8 A
)
��A B
;
��B C
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� >
,
��> ?
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
PersonDocument
��' 5
,
��5 6
principalTable
�� &
:
��& '
$str
��( 0
,
��0 1
principalColumn
�� '
:
��' (
$str
��) 3
)
��3 4
;
��4 5
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� !
,
��! "
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
code
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 <
,
��< =
nullable
��> F
:
��F G
false
��H M
)
��M N
,
��N O
PersonDocument
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
string
��2 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ F
,
��F G
nullable
��H P
:
��P Q
true
��R V
)
��V W
,
��W X
ProfessorDocument
�� %
=
��& '
table
��( -
.
��- .
Column
��. 4
<
��4 5
string
��5 ;
>
��; <
(
��< =
type
��= A
:
��A B
$str
��C I
,
��I J
nullable
��K S
:
��S T
true
��U Y
)
��Y Z
,
��Z [
title
�� 
=
�� 
table
�� !
.
��! "
Column
��" (
<
��( )
string
��) /
>
��/ 0
(
��0 1
type
��1 5
:
��5 6
$str
��7 =
,
��= >
nullable
��? G
:
��G H
true
��I M
)
��M N
,
��N O
date
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
DateTime
��( 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 R
,
��R S
nullable
��T \
:
��\ ]
true
��^ b
)
��b c
,
��c d 
investigationGroup
�� &
=
��' (
table
��) .
.
��. /
Column
��/ 5
<
��5 6
string
��6 <
>
��< =
(
��= >
type
��> B
:
��B C
$str
��D J
,
��J K
nullable
��L T
:
��T U
true
��V Z
)
��Z [
,
��[ \
approach
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
string
��, 2
>
��2 3
(
��3 4
type
��4 8
:
��8 9
$str
��: @
,
��@ A
nullable
��B J
:
��J K
true
��L P
)
��P Q
,
��Q R
justification
�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
string
��1 7
>
��7 8
(
��8 9
type
��9 =
:
��= >
$str
��? E
,
��E F
nullable
��G O
:
��O P
true
��Q U
)
��U V
,
��V W
generalObjective
�� $
=
��% &
table
��' ,
.
��, -
Column
��- 3
<
��3 4
string
��4 :
>
��: ;
(
��; <
type
��< @
:
��@ A
$str
��B H
,
��H I
nullable
��J R
:
��R S
true
��T X
)
��X Y
,
��Y Z
specificObjective
�� %
=
��& '
table
��( -
.
��- .
Column
��. 4
<
��4 5
string
��5 ;
>
��; <
(
��< =
type
��= A
:
��A B
$str
��C I
,
��I J
nullable
��K S
:
��S T
true
��U Y
)
��Y Z
,
��Z [
biblioGraphical
�� #
=
��$ %
table
��& +
.
��+ ,
Column
��, 2
<
��2 3
string
��3 9
>
��9 :
(
��: ;
type
��; ?
:
��? @
$str
��A G
,
��G H
nullable
��I Q
:
��Q R
true
��S W
)
��W X
,
��X Y
status
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
string
��* 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 >
,
��> ?
nullable
��@ H
:
��H I
true
��J N
)
��N O
,
��O P
ThematicAreaCode
�� $
=
��% &
table
��' ,
.
��, -
Column
��- 3
<
��3 4
string
��4 :
>
��: ;
(
��; <
type
��< @
:
��@ A
$str
��B H
,
��H I
nullable
��J R
:
��R S
true
��T X
)
��X Y
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 3
,
��3 4
x
��5 6
=>
��7 9
x
��: ;
.
��; <
code
��< @
)
��@ A
;
��A B
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� L
,
��L M
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
ThematicAreaCode
��' 7
,
��7 8
principalTable
�� &
:
��& '
$str
��( 8
,
��8 9
principalColumn
�� '
:
��' (
$str
��) /
)
��/ 0
;
��0 1
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� H
,
��H I
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
ProfessorDocument
��' 8
,
��8 9
principalTable
�� &
:
��& '
$str
��( 3
,
��3 4
principalColumn
�� '
:
��' (
$str
��) 3
)
��3 4
;
��4 5
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� D
,
��D E
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
PersonDocument
��' 5
,
��5 6
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) 3
)
��3 4
;
��4 5
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� )
,
��) *
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
code
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
int
��( +
>
��+ ,
(
��, -
type
��- 1
:
��1 2
$str
��3 <
,
��< =
nullable
��> F
:
��F G
false
��H M
)
��M N
.
�� 

Annotation
�� #
(
��# $
$str
��$ D
,
��D E+
NpgsqlValueGenerationStrategy
��F c
.
��c d%
IdentityByDefaultColumn
��d {
)
��{ |
,
��| }"
PorposalFeedBackCode
�� (
=
��) *
table
��+ 0
.
��0 1
Column
��1 7
<
��7 8
int
��8 ;
>
��; <
(
��< =
type
��= A
:
��A B
$str
��C L
,
��L M
nullable
��N V
:
��V W
true
��X \
)
��\ ]
,
��] ^
ProposalCode
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
string
��0 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> D
,
��D E
nullable
��F N
:
��N O
true
��P T
)
��T U
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% ;
,
��; <
x
��= >
=>
��? A
x
��B C
.
��C D
code
��D H
)
��H I
;
��I J
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� [
,
��[ \
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '"
PorposalFeedBackCode
��' ;
,
��; <
principalTable
�� &
:
��& '
$str
��( ;
,
��; <
principalColumn
�� '
:
��' (
$str
��) /
)
��/ 0
;
��0 1
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� K
,
��K L
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
ProposalCode
��' 3
,
��3 4
principalTable
�� &
:
��& '
$str
��( 3
,
��3 4
principalColumn
�� '
:
��' (
$str
��) /
)
��/ 0
;
��0 1
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
��  
,
��  !
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
code
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 <
,
��< =
nullable
��> F
:
��F G
false
��H M
)
��M N
,
��N O
PersonDocument
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
string
��2 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ F
,
��F G
nullable
��H P
:
��P Q
true
��R V
)
��V W
,
��W X
ProfessorDocument
�� %
=
��& '
table
��( -
.
��- .
Column
��. 4
<
��4 5
string
��5 ;
>
��; <
(
��< =
type
��= A
:
��A B
$str
��C I
,
��I J
nullable
��K S
:
��S T
true
��U Y
)
��Y Z
,
��Z [
Content
�� 
=
�� 
table
�� #
.
��# $
Column
��$ *
<
��* +
string
��+ 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 ?
,
��? @
nullable
��A I
:
��I J
true
��K O
)
��O P
,
��P Q
Status
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
string
��* 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 >
,
��> ?
nullable
��@ H
:
��H I
true
��J N
)
��N O
,
��O P
Score
�� 
=
�� 
table
�� !
.
��! "
Column
��" (
<
��( )
int
��) ,
>
��, -
(
��- .
type
��. 2
:
��2 3
$str
��4 =
,
��= >
nullable
��? G
:
��G H
true
��I M
)
��M N
,
��N O
ProposalCode
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
string
��0 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> D
,
��D E
nullable
��F N
:
��N O
true
��P T
)
��T U
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 2
,
��2 3
x
��4 5
=>
��6 8
x
��9 :
.
��: ;
code
��; ?
)
��? @
;
��@ A
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� G
,
��G H
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
ProfessorDocument
��' 8
,
��8 9
principalTable
�� &
:
��& '
$str
��( 3
,
��3 4
principalColumn
�� '
:
��' (
$str
��) 3
)
��3 4
;
��4 5
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� B
,
��B C
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
ProposalCode
��' 3
,
��3 4
principalTable
�� &
:
��& '
$str
��( 3
,
��3 4
principalColumn
�� '
:
��' (
$str
��) /
)
��/ 0
;
��0 1
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� C
,
��C D
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
PersonDocument
��' 5
,
��5 6
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) 3
)
��3 4
;
��4 5
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� '
,
��' (
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
code
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
int
��( +
>
��+ ,
(
��, -
type
��- 1
:
��1 2
$str
��3 <
,
��< =
nullable
��> F
:
��F G
false
��H M
)
��M N
.
�� 

Annotation
�� #
(
��# $
$str
��$ D
,
��D E+
NpgsqlValueGenerationStrategy
��F c
.
��c d%
IdentityByDefaultColumn
��d {
)
��{ |
,
��| }!
ProyectFeedBackCode
�� '
=
��( )
table
��* /
.
��/ 0
Column
��0 6
<
��6 7
int
��7 :
>
��: ;
(
��; <
type
��< @
:
��@ A
$str
��B K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
,
��\ ]
ProyectCode
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
type
��7 ;
:
��; <
$str
��= C
,
��C D
nullable
��E M
:
��M N
true
��O S
)
��S T
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 9
,
��9 :
x
��; <
=>
��= ?
x
��@ A
.
��A B
code
��B F
)
��F G
;
��G H
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� W
,
��W X
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '!
ProyectFeedBackCode
��' :
,
��: ;
principalTable
�� &
:
��& '
$str
��( :
,
��: ;
principalColumn
�� '
:
��' (
$str
��) /
)
��/ 0
;
��0 1
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� G
,
��G H
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
ProyectCode
��' 2
,
��2 3
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) /
)
��/ 0
;
��0 1
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 0
,
��0 1
table
�� 
:
�� 
$str
�� 
,
��  
column
�� 
:
�� 
$str
�� (
)
��( )
;
��) *
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 1
,
��1 2
table
�� 
:
�� 
$str
�� $
,
��$ %
column
�� 
:
�� 
$str
�� $
)
��$ %
;
��% &
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 1
,
��1 2
table
�� 
:
�� 
$str
�� $
,
��$ %
column
�� 
:
�� 
$str
�� $
)
��$ %
;
��% &
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� A
,
��A B
table
�� 
:
�� 
$str
�� *
,
��* +
column
�� 
:
�� 
$str
�� .
)
��. /
;
��/ 0
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 9
,
��9 :
table
�� 
:
�� 
$str
�� *
,
��* +
column
�� 
:
�� 
$str
�� &
)
��& '
;
��' (
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 6
,
��6 7
table
�� 
:
�� 
$str
�� (
,
��( )
column
�� 
:
�� 
$str
�� %
)
��% &
;
��& '
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� >
,
��> ?
table
�� 
:
�� 
$str
�� (
,
��( )
column
�� 
:
�� 
$str
�� -
)
��- .
;
��. /
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� ,
,
��, -
table
�� 
:
�� 
$str
�� 
,
��  
column
�� 
:
�� 
$str
�� $
)
��$ %
;
��% &
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 3
,
��3 4
table
�� 
:
�� 
$str
�� "
,
��" #
column
�� 
:
�� 
$str
�� (
)
��( )
;
��) *
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 6
,
��6 7
table
�� 
:
�� 
$str
�� "
,
��" #
column
�� 
:
�� 
$str
�� +
)
��+ ,
;
��, -
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 5
,
��5 6
table
�� 
:
�� 
$str
�� "
,
��" #
column
�� 
:
�� 
$str
�� *
)
��* +
;
��+ ,
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 2
,
��2 3
table
�� 
:
�� 
$str
�� !
,
��! "
column
�� 
:
�� 
$str
�� (
)
��( )
;
��) *
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 5
,
��5 6
table
�� 
:
�� 
$str
�� !
,
��! "
column
�� 
:
�� 
$str
�� +
)
��+ ,
;
��, -
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 0
,
��0 1
table
�� 
:
�� 
$str
�� !
,
��! "
column
�� 
:
�� 
$str
�� &
)
��& '
;
��' (
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� =
,
��= >
table
�� 
:
�� 
$str
�� *
,
��* +
column
�� 
:
�� 
$str
�� *
)
��* +
;
��+ ,
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 7
,
��7 8
table
�� 
:
�� 
$str
�� !
,
��! "
column
�� 
:
�� 
$str
�� -
)
��- .
;
��. /
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� -
,
��- .
table
�� 
:
�� 
$str
��  
,
��  !
column
�� 
:
�� 
$str
�� $
)
��$ %
;
��% &
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� -
,
��- .
table
�� 
:
�� 
$str
��  
,
��  !
column
�� 
:
�� 
$str
�� $
)
��$ %
;
��% &
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� =
,
��= >
table
�� 
:
�� 
$str
�� '
,
��' (
column
�� 
:
�� 
$str
�� -
)
��- .
;
��. /
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� /
,
��/ 0
table
�� 
:
�� 
$str
�� 
,
�� 
column
�� 
:
�� 
$str
�� (
)
��( )
;
��) *
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� *
,
��* +
table
�� 
:
�� 
$str
�� 
,
�� 
column
�� 
:
�� 
$str
�� #
,
��# $
unique
�� 
:
�� 
true
�� 
)
�� 
;
�� 
}
�� 	
	protected
�� 
override
�� 
void
�� 
Down
��  $
(
��$ %
MigrationBuilder
��% 5
migrationBuilder
��6 F
)
��F G
{
�� 	
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� #
)
��# $
;
��$ %
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� )
)
��) *
;
��* +
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� '
)
��' (
;
��( )
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� 
)
��  
;
��  !
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� )
)
��) *
;
��* +
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� (
)
��( )
;
��) *
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
��  
)
��  !
;
��! "
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� !
)
��! "
;
��" #
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� &
)
��& '
;
��' (
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� !
)
��! "
;
��" #
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
��  
)
��  !
;
��! "
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� )
)
��) *
;
��* +
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� )
)
��) *
;
��* +
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� 
)
�� 
;
��  
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� &
)
��& '
;
��' (
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� 
)
�� 
;
��  
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� #
)
��# $
;
��$ %
}
�� 	
}
�� 
}�� �%
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
