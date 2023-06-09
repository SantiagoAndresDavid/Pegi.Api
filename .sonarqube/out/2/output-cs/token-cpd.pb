—
PC:\Users\sofia\Documents\project\Pegi.Api\src\Services\AcademicProgramService.cs
	namespace 	
Services
 
; 
public 
class "
AcademicProgramService #
{ 
private		 
readonly		 &
AcademicProgramsRepository		 /'
_academicProgramsRepository		0 K
;		K L
public 
"
AcademicProgramService !
(! "&
AcademicProgramsRepository" <&
academicProgramsRepository= W
)W X
{ '
_academicProgramsRepository #
=$ %&
academicProgramsRepository& @
;@ A
} 
public 

AcademicProgram 
? *
SearchProfessorAcademicProgram :
(: ;
string; A
codeB F
)F G
{ 
return '
_academicProgramsRepository *
.* +
Find+ /
(/ 0
AcademicProgram0 ?
=>@ B
AcademicProgram 
. 
Code  
==! #
code$ (
)( )
;) *
} 
public 

List 
< 
AcademicProgram 
>  
GetAll! '
(' (
)( )
{ 
return '
_academicProgramsRepository *
.* +
GetAll+ 1
(1 2
)2 3
;3 4
} 
} ·
EC:\Users\sofia\Documents\project\Pegi.Api\src\Services\AuthService.cs
	namespace 	
Services
 
; 
public 
class 
AuthService 
{ 
private		 
readonly		 
UsersRepository		 $
_repository		% 0
;		0 1
public 

AuthService 
( 
UsersRepository &

repository' 1
)1 2
{ 
_repository 
= 

repository  
;  !
} 
public 

( 
string 
, 
User 
	foundUser "
)" #
LogIn$ )
() *
string* 0
username1 9
,9 :
string; A
passwordB J
)J K
{ 
User 
? 
	foundUser 
= 
_repository %
.% &
Find& *
(* +
user+ /
=>0 2
user3 7
.7 8
Name8 <
=== ?
username@ H
)H I
;I J
if 

( 
	foundUser 
== 
null 
) 
throw $
new% (
AuthException) 6
(6 7
$str7 M
)M N
;N O
if 

( 
! 
	Encryptor 
. 
Verify 
( 
password &
,& '
	foundUser( 1
.1 2
Password2 :
): ;
); <
throw 
new 
AuthException #
(# $
$str$ ;
); <
;< =
return 
( 
$str +
,+ ,
	foundUser- 6
)6 7
;7 8
} 
} ≠
KC:\Users\sofia\Documents\project\Pegi.Api\src\Services\ExperienceService.cs
	namespace 	
Services
 
; 
public 
class 
ExperienceService 
{ 
private		 
readonly		 !
ExperiencesRepository		 *"
_experiencesRepository		+ A
;		A B
public 

ExperienceService 
( !
ExperiencesRepository 2!
experiencesRepository3 H
)H I
{ "
_experiencesRepository 
=  !
experiencesRepository! 6
;6 7
} 
public 

( 
string 
, 
bool 
) 
saveExperience )
() *

Experience* 4

experience5 ?
)? @
{ 
try 
{ 	"
_experiencesRepository "
." #
Save# '
(' (

experience( 2
)2 3
;3 4
return 
( 
$str .
,. /
true0 4
)4 5
;5 6
} 	
catch 
( 
StudyExeption 
e 
) 
{ 	
return 
( 
e 
. 
Message 
, 
false $
)$ %
;% &
} 	
} 
public 

List 
< 

Experience 
> 
SearchExperiences -
(- .
string. 4
documentPerson5 C
)C D
{ 
return "
_experiencesRepository %
.% &
Filter& ,
(, -

experience- 7
=>8 :

experience; E
.E F

PeopleCodeF P
==Q S
documentPersonT b
)b c
;c d
}   
}!! ó
PC:\Users\sofia\Documents\project\Pegi.Api\src\Services\HistoryProposalService.cs
	namespace 	
Services
 
; 
public 
class "
HistoryProposalService #
{ 
private 
readonly &
HistoryProposalsRepository /'
_historyProposalsRepository0 K
;K L
public 
"
HistoryProposalService !
(! "&
HistoryProposalsRepository "&
historyProposalsRepository# =
)= >
{ '
_historyProposalsRepository #
=$ %&
historyProposalsRepository& @
;@ A
} 
public 

( 
string 
, 
bool 
) 
SaveProposalHistory -
(- .
HistoryProposals. >
historyProposals? O
)O P
{ 
try 
{ 	'
_historyProposalsRepository '
.' (
Save( ,
(, -
historyProposals- =
)= >
;> ?
return 
( 
$str .
,. /
true0 4
)4 5
;5 6
} 	
catch 
( #
HistoryProposalExeption &
e' (
)( )
{ 	
return 
( 
e 
. 
Message 
, 
false $
)$ %
;% &
} 	
} 
public 

List 
< 
HistoryProposals  
>  !!
SearchHistoryProposal" 7
(7 8
string8 >
codeProposal? K
)K L
{ 
return   '
_historyProposalsRepository   *
.  * +
Filter  + 1
(  1 2
HistoryProposal  2 A
=>  B D
HistoryProposal!! 
.!! 
ProposalCode!! (
==!!) +
codeProposal!!, 8
)!!8 9
;!!9 :
}"" 
}## ı
OC:\Users\sofia\Documents\project\Pegi.Api\src\Services\HistoryProyectService.cs
	namespace 	
Services
 
; 
public 
class !
HistoryProyectService "
{ 
private 
readonly $
HistoryProyectRepository -%
_historyProyectRepository. G
;G H
public

 
!
HistoryProyectService

  
(

  !$
HistoryProyectRepository

! 9$
historyProyectRepository

: R
)

R S
{ %
_historyProyectRepository !
=" #$
historyProyectRepository$ <
;< =
} 
public 

( 
string 
, 
bool 
) 
SaveProyectlHistory -
(- .
HistoryProyect. <
historyProyect= K
)K L
{ 
try 
{ 	%
_historyProyectRepository %
.% &
Save& *
(* +
historyProyect+ 9
)9 :
;: ;
return 
( 
$str .
,. /
true0 4
)4 5
;5 6
} 	
catch 
( "
HistoryProyectExeption %
e& '
)' (
{ 	
return 
( 
e 
. 
Message 
, 
false $
)$ %
;% &
} 	
} 
public 

List 
< 
HistoryProyect 
>  
SearchProyectHistory  4
(4 5
string5 ;
codeProyect< G
)G H
{ 
return %
_historyProyectRepository (
.( )
Filter) /
(/ 0
historyProyect0 >
=>? A
historyProyect 
. 
ProyectCode &
==' )
codeProyect* 5
)5 6
;6 7
}   
}## Ω
JC:\Users\sofia\Documents\project\Pegi.Api\src\Services\LocationsService.cs
	namespace 	
Services
 
; 
public 
class 
LocationsService 
{ 
private 
readonly 
CitiesRepository %
_citiesRepository& 7
;7 8
private		 
readonly		 !
DepartmentsRepository		 *"
_departmentsRepository		+ A
;		A B
public 

LocationsService 
( 
CitiesRepository ,
citiesRepository- =
,= >!
DepartmentsRepository? T!
departmentsRepositoryU j
)j k
{ 
_citiesRepository 
= 
citiesRepository ,
;, -"
_departmentsRepository 
=  !
departmentsRepository! 6
;6 7
} 
public 

List 
< 

Department 
> 
GetDepartments *
(* +
)+ ,
{ 
return "
_departmentsRepository %
.% &
GetAll& ,
(, -
)- .
;. /
} 
public 

List 
< 
City 
> 
	GetCities 
(  
string  &

department' 1
)1 2
{ 
return 
_citiesRepository  
.  !
Filter! '
(' (
city( ,
=>- /
city 
. 

Department 
!= 
null #
&&$ &
city' +
.+ ,

Department, 6
.6 7
Name7 ;
==< >

department? I
)I J
;J K
} 
} ‡
GC:\Users\sofia\Documents\project\Pegi.Api\src\Services\PeopleService.cs
	namespace 	
Services
 
; 
public 
class 
PeopleService 
{		 
private

 
readonly

 
PeopleRepository

 %
_peopleRepository

& 7
;

7 8
public 

PeopleService 
( 
PeopleRepository )
peopleRepository* :
): ;
{ 
_peopleRepository 
= 
peopleRepository ,
;, -
} 
public 

( 
string 
, 
bool 
) 

SavePerson $
($ %
Person% +
person, 2
)2 3
{ 
try 
{ 	
_peopleRepository 
. 
Save "
(" #
person# )
)) *
;* +
return 
( 
$str .
,. /
true0 4
)4 5
;5 6
} 	
catch 
( 
PersonExeption 
e 
)  
{ 	
return 
( 
e 
. 
Message 
, 
false $
)$ %
;% &
} 	
} 
public 

Person 
? 
SearchPerson 
(  
string  &
document' /
)/ 0
{   
return!! 
_peopleRepository!!  
.!!  !
Find!!! %
(!!% &
person!!& ,
=>!!- /
person!!0 6
.!!6 7
Document!!7 ?
==!!@ B
document!!C K
)!!K L
;!!L M
}"" 
public$$ 

string$$ 
DeletePerson$$ 
($$ 
string$$ %
document$$& .
)$$. /
{%% 
try&& 
{'' 	
Person(( 
?(( 
person(( 
=(( 
_peopleRepository(( .
.((. /
Find((/ 3
(((3 4
person((4 :
=>((; =
person((> D
.((D E
Document((E M
==((O Q
document((R Z
)(([ \
;((\ ]
_peopleRepository)) 
.)) 
Delete)) $
())$ %
person))% +
!))+ ,
))), -
;))- .
return** 
$str** '
;**' (
}++ 	
catch,, 
(,, 
	Exception,, 
e,, 
),, 
{-- 	
throw.. 
new.. 
PersonExeption.. $
(..$ %
$"// 
$str// 3
{//3 4
e//4 5
.//5 6
Message//6 =
}//= >
"//> ?
)//? @
;//@ A
}00 	
}11 
}22 Å
JC:\Users\sofia\Documents\project\Pegi.Api\src\Services\ProfessorService.cs
	namespace 	
Services
 
; 
public 
class 
ProfessorService 
{ 
private 
readonly 
ProfessorRepository ( 
_professorRepository) =
;= >
public

 

ProfessorService

 
(

 
ProfessorRepository

 /
professorRepository

0 C
)

C D
{  
_professorRepository 
= 
professorRepository 2
;2 3
} 
public 

( 
string 
, 
bool 
) 
SaveProfessor '
(' (
	Professor( 1
	professor2 ;
); <
{ 
try 
{ 	 
_professorRepository  
.  !
Save! %
(% &
	professor& /
)/ 0
;0 1
return 
( 
$str .
,. /
true0 4
)4 5
;5 6
} 	
catch 
( 
PersonExeption 
e 
)  
{ 	
return 
( 
e 
. 
Message 
, 
false $
)$ %
;% &
} 	
} 
public 

	Professor 
? 
SearchProfessor %
(% &
string& ,
document- 5
)5 6
{ 
return  
_professorRepository #
.# $
Find$ (
(( )
	professor) 2
=>3 5
	professor   
.   
Document   
==   !
document  " *
)  * +
;  + ,
}!! 
public## 

List## 
<## 
	Professor## 
>## %
SearchProfessorByPosition## 4
(##4 5
string##5 ;
position##< D
)##D E
{$$ 
return%%  
_professorRepository%% #
.%%# $
Filter%%$ *
(%%* +
	professor%%+ 4
=>%%5 7
	professor&& 
.&& 
Position&& 
!=&& !
null&&" &
&&&&' )
	professor'' 
.'' 
Position'' 
=='' !
position''" *
)''* +
;''+ ,
}(( 
public** 

List** 
<** 
	Professor** 
>** 
GetAllProfessors** +
(**+ ,
)**, -
{++ 
return,,  
_professorRepository,, #
.,,# $
GetAll,,$ *
(,,* +
),,+ ,
;,,, -
}-- 
}00 Ò
QC:\Users\sofia\Documents\project\Pegi.Api\src\Services\ProposalFeedBackService.cs
	namespace 	
Services
 
; 
public 
class #
ProposalFeedBackService $
{ 
private		 
readonly		 &
ProposalFeedBackRepository		 /'
_proposalFeedBackRepository		0 K
;		K L
public 
#
ProposalFeedBackService "
(" #&
ProposalFeedBackRepository# =&
proposalFeedBackRepository> X
)X Y
{ '
_proposalFeedBackRepository #
=$ %&
proposalFeedBackRepository& @
;@ A
} 
public 

( 
string 
, 
bool 
)  
SaveProposalFeedBack .
(. /
ProposalFeedBack/ ?
proposalFeedBack@ P
)P Q
{ 
try 
{ 	'
_proposalFeedBackRepository '
.' (
Save( ,
(, -
proposalFeedBack- =
)= >
;> ?
return 
( 
$str .
,. /
true0 4
)4 5
;5 6
} 	
catch 
( $
ProposalFeedBackExeption '
e( )
)) *
{ 	
return 
( 
e 
. 
Message 
, 
false $
)$ %
;% &
} 	
} 
public 

ProposalFeedBack 
? #
GetProposalFeedBackCode 4
(4 5
int5 8
?8 9
code: >
)> ?
{ 
return '
_proposalFeedBackRepository *
.* +
Find+ /
(/ 0
ProposalFeedBack0 @
=>A C
ProposalFeedBackD T
.T U
CodeU Y
==Z \
code] a
)a b
;b c
}   
}"" æa
IC:\Users\sofia\Documents\project\Pegi.Api\src\Services\ProposalService.cs
	namespace 	
Services
 
; 
public 
class 
ProposalService 
{ 
private		 
readonly		 
ProposalRepository		 '
_proposalRepository		( ;
;		; <
public 

ProposalService 
( 
ProposalRepository -
proposalRepository. @
)@ A
{ 
_proposalRepository 
= 
proposalRepository 0
;0 1
} 
public 

( 
string 
, 
bool 
) 
SaveProposal &
(& '
Proposal' /
proposal0 8
)8 9
{ 
try 
{ 	
_proposalRepository 
.  
Save  $
($ %
proposal% -
)- .
;. /
return 
( 
$str .
,. /
true0 4
)4 5
;5 6
} 	
catch 
( 
ProposalExeption 
e  !
)! "
{ 	
return 
( 
e 
. 
Message 
, 
false $
)$ %
;% &
} 	
} 
public 

( 
string 
, 
bool 
? 
) 
UpdateProposal )
() *
Proposal* 2
proposal3 ;
); <
{ 
try 
{   	
_proposalRepository!! 
.!!  
Update!!  &
(!!& '
proposal!!' /
)!!/ 0
;!!0 1
return"" 
("" 
$str"" ,
,"", -
true"". 2
)""2 3
;""3 4
}## 	
catch$$ 
($$ 
AuthException$$ 
e$$ 
)$$ 
{%% 	
return&& 
(&& 
$str&& 
,&& 
false&& "
)&&" #
;&&# $
}'' 	
}(( 
public** 

(** 
string** 
,** 
bool** 
?** 
)**  
UpdateStatusProposal** .
(**. /
string**/ 5
code**6 :
,**: ;
string**; A
status**B H
)**H I
{++ 
try,, 
{-- 	
Proposal.. 
?.. 
proposal.. 
=..  
_proposalRepository..! 4
...4 5
Find..5 9
(..9 :
proposal..: B
=>..C E
proposal..F N
...N O
Code..O S
==..T V
code..W [
)..[ \
;..\ ]
proposal// 
!// 
.// 
Status// 
=// 
status// %
;//% &
_proposalRepository00 
.00  
Update00  &
(00& '
proposal00' /
)00/ 0
;000 1
return11 
(11 
$str11 +
,11+ ,
true11, 0
)110 1
;111 2
}22 	
catch33 
(33 
AuthException33 
e33 
)33 
{44 	
return55 
(55 
$str55 
,55 
false55 !
)55! "
;55" #
}66 	
}77 
public99 

(99 
string99 
,99 
bool99 
?99 
)99 +
UpdateProfessorDocumentProposal99 9
(999 :
string99: @
code99A E
,99E F
string99F L
document99M U
)99U V
{:: 
try;; 
{<< 	
Proposal== 
?== 
proposal== 
===  
_proposalRepository==! 4
.==4 5
Find==5 9
(==9 :
proposal==: B
=>==C E
proposal==F N
.==N O
Code==O S
====T V
code==W [
)==[ \
;==\ ]
proposal>> 
!>> 
.>> 
ProfessorDocument>> '
=>>( )
document>>* 2
;>>2 3
_proposalRepository?? 
.??  
Update??  &
(??& '
proposal??' /
)??/ 0
;??0 1
return@@ 
(@@ 
$str@@ D
,@@D E
true@@E I
)@@I J
;@@J K
}AA 	
catchBB 
(BB 
AuthExceptionBB 
eBB 
)BB 
{CC 	
returnDD 
(DD 
$strDD >
,DD> ?
falseDD? D
)DDD E
;DDE F
}EE 	
}FF 
publicHH 

ListHH 
<HH 
ProposalHH 
>HH  
GetProposalsDocumentHH .
(HH. /
stringHH/ 5
personDocumentHH6 D
)HHD E
{II 
returnJJ 
_proposalRepositoryJJ "
.JJ" #
FilterJJ# )
(JJ) *
proposalJJ* 2
=>JJ3 5
proposalKK 
.KK 
PersonDocumentKK #
!=KK$ &
nullKK' +
&&KK, .
proposalLL 
.LL 
PersonDocumentLL #
==LL$ &
personDocumentLL' 5
)LL5 6
;LL6 7
}MM 
publicPP 

objectPP 
filterListProposalPP $
(PP$ %
ListPP% )
<PP) *
ProposalPP* 2
>PP2 3
	proposalsPP4 =
)PP= >
{QQ 
intRR 
	pendienteRR 
=RR 
$numRR 
,RR 
aprobadoRR #
=RR$ %
$numRR& '
,RR' (
corregirRR) 1
=RR2 3
$numRR4 5
,RR5 6
	rechazadoRR7 @
=RRA B
$numRRC D
,RRD E
totalRRE J
=RRK L
$numRRM N
;RRN O
foreachTT 
(TT 
ProposalTT 
pTT 
inTT 
	proposalsTT (
)TT( )
{UU 	
ifVV 
(VV 
pVV 
.VV 
StatusVV 
==VV 
$strVV &
)VV& '
{WW 
aprobadoXX 
++XX 
;XX 
}YY 
ifZZ 
(ZZ 
pZZ 
.ZZ 
StatusZZ 
==ZZ 
$strZZ '
)ZZ' (
{[[ 
	pendiente\\ 
++\\ 
;\\ 
}]] 
if^^ 
(^^ 
p^^ 
.^^ 
Status^^ 
==^^ 
$str^^ &
)^^& '
{__ 
corregir`` 
++`` 
;`` 
}aa 
ifbb 
(bb 
pbb 
.bb 
Statusbb 
==bb 
$strbb '
)bb' (
{cc 
	rechazadodd 
++dd 
;dd 
}ee 
totalgg 
++gg 
;gg 
}hh 	
varii 

statisticsii 
=ii 
newii 
{jj 	
	Pendientekk 
=kk 
	pendientekk !
,kk! "
	Rechazadoll 
=ll 
	rechazadoll !
,ll! "
Aprobadomm 
=mm 
aprobadomm 
,mm  
Corregirnn 
=nn 
corregirnn 
,nn  
Totaloo 
=oo 
totaloo 
}pp 	
;pp	 

returnqq 

statisticsqq 
;qq 
}rr 
publicss 	
objectss
 .
"GeneralStatisticsProposalProfessorss 3
(ss3 4
stringss4 :
personDocumentss; I
)ssI J
{tt 
Listuu 
<uu 
Proposaluu 
>uu 
	proposalsuu  
=uu! "
_proposalRepositoryuu# 6
.uu6 7
Filteruu7 =
(uu= >
proposaluu> F
=>uuG I
proposalvv 
.vv 
ProfessorDocumentvv &
!=vv' )
nullvv* .
&&vv/ 1
proposalww 
.ww 
ProfessorDocumentww &
==ww' )
personDocumentww* 8
)ww8 9
;ww9 :
returnxx 
filterListProposalxx !
(xx! "
	proposalsxx" +
)xx+ ,
;xx, -
}yy 
public{{ 	
object{{
 ,
 GeneralStatisticsProposalStudent{{ 1
({{1 2
string{{2 8
personDocument{{9 G
){{G H
{|| 
List}} 
<}} 
Proposal}} 
>}} 
	proposals}} 
=}}  !
_proposalRepository}}" 5
.}}5 6
Filter}}6 <
(}}< =
proposal}}= E
=>}}F H
proposal~~ 
.~~ 
PersonDocument~~ "
!=~~# %
null~~& *
&&~~+ -
proposal 
. 
PersonDocument "
==# %
personDocument& 4
)4 5
;5 6
return
ÄÄ  
filterListProposal
ÄÄ  
(
ÄÄ  !
	proposals
ÄÄ! *
)
ÄÄ* +
;
ÄÄ+ ,
}
ÅÅ 
public
ÉÉ 

object
ÉÉ (
GeneralStatisticsProposals
ÉÉ ,
(
ÉÉ, -
)
ÉÉ- .
{
ÑÑ 
List
ÖÖ 
<
ÖÖ 
Proposal
ÖÖ 
>
ÖÖ 
	proposals
ÖÖ  
=
ÖÖ! "!
_proposalRepository
ÖÖ# 6
.
ÖÖ6 7
GetAll
ÖÖ7 =
(
ÖÖ= >
)
ÖÖ> ?
;
ÖÖ? @
return
ÜÜ  
filterListProposal
ÜÜ "
(
ÜÜ" #
	proposals
ÜÜ# ,
)
ÜÜ, -
;
ÜÜ- .
}
áá 
public
ââ 

List
ââ 
<
ââ 
Proposal
ââ 
>
ââ +
GetProposalsProfessorDocument
ââ 7
(
ââ7 8
string
ââ8 >
personDocument
ââ? M
)
ââM N
{
ää 
return
ãã !
_proposalRepository
ãã "
.
ãã" #
Filter
ãã# )
(
ãã) *
proposal
ãã* 2
=>
ãã3 5
proposal
åå 
.
åå 
ProfessorDocument
åå &
!=
åå' )
null
åå* .
&&
åå/ 1
proposal
çç 
.
çç 
ProfessorDocument
çç &
==
çç' )
personDocument
çç* 8
)
çç8 9
;
çç9 :
}
éé 
public
ëë 

List
ëë 
<
ëë 
Proposal
ëë 
>
ëë 
GetAll
ëë  
(
ëë  !
)
ëë! "
{
íí 
return
ìì !
_proposalRepository
ìì "
.
ìì" #
GetAll
ìì# )
(
ìì) *
)
ìì* +
;
ìì+ ,
}
îî 
public
ññ 

string
ññ 
DeleteProposal
ññ  
(
ññ  !
string
ññ! '
code
ññ( ,
)
ññ, -
{
óó 
try
òò 
{
ôô 	
Proposal
öö 
?
öö 
proposal
öö 
=
öö  !
_proposalRepository
õõ #
.
õõ# $
Find
õõ$ (
(
õõ( )
proposal
õõ) 1
=>
õõ2 4
proposal
õõ5 =
.
õõ= >
Code
õõ> B
==
õõC E
code
õõF J
)
õõJ K
;
õõK L!
_proposalRepository
úú 
.
úú  
Delete
úú  &
(
úú& '
proposal
úú' /
!
úú/ 0
)
úú0 1
;
úú1 2
return
ùù 
$str
ùù '
;
ùù' (
}
ûû 	
catch
üü 
(
üü 
	Exception
üü 
e
üü 
)
üü 
{
†† 	
throw
°° 
new
°° 
PersonExeption
°° $
(
°°$ %
$"
¢¢ 
$str
¢¢ 3
{
¢¢3 4
e
¢¢4 5
.
¢¢5 6
Message
¢¢6 =
}
¢¢= >
"
¢¢> ?
)
¢¢? @
;
¢¢@ A
}
££ 	
}
§§ 
public
¶¶ 

Proposal
¶¶ 
?
¶¶ 
GetProposalCode
¶¶ $
(
¶¶$ %
string
¶¶% +
code
¶¶, 0
)
¶¶0 1
{
ßß 
return
®® !
_proposalRepository
®® "
.
®®" #
Find
®®# '
(
®®' (
proposal
®®( 0
=>
®®1 3
proposal
®®4 <
.
®®< =
Code
®®= A
==
®®B D
code
®®E I
)
®®I J
;
®®J K
}
©© 
}™™ ›
PC:\Users\sofia\Documents\project\Pegi.Api\src\Services\ProyectFeedBackService.cs
	namespace 	
Services
 
; 
public 
class "
ProyectFeedBackService #
{ 
private		 
readonly		 %
ProyectFeedBackRepository		 .&
_proyectFeedBackRepository		/ I
;		I J
public 
"
ProyectFeedBackService !
(! "%
ProyectFeedBackRepository" ;%
proyectFeedBackRepository< U
)U V
{ &
_proyectFeedBackRepository "
=# $%
proyectFeedBackRepository% >
;> ?
} 
public 

( 
string 
, 
bool 
) 
SaveProyectFeedBack -
(- .
ProyectFeedBack. =
proyectFeedBack> M
)M N
{ 
try 
{ 	&
_proyectFeedBackRepository &
.& '
Save' +
(+ ,
proyectFeedBack, ;
); <
;< =
return 
( 
$str .
,. /
true0 4
)4 5
;5 6
} 	
catch 
( #
ProyectFeedBackExeption &
e' (
)( )
{ 	
return 
( 
e 
. 
Message 
, 
false $
)$ %
;% &
} 	
} 
public 

ProyectFeedBack 
? "
GetProyectFeedBackCode 2
(2 3
int3 6
?6 7
code8 <
)< =
{ 
return &
_proyectFeedBackRepository )
.) *
Find* .
(. /
Proyectfeedback/ >
=>? A
ProyectfeedbackB Q
.Q R
CodeR V
==W Y
codeZ ^
)^ _
;_ `
}   
}## Üf
HC:\Users\sofia\Documents\project\Pegi.Api\src\Services\ProyectService.cs
	namespace 	
Services
 
; 
public 
class 
ProyectService 
{ 
private		 
readonly		 
ProyectRepository		 &
_proyectRepository		' 9
;		9 :
public 

ProyectService 
( 
ProyectRepository +
proyectRepository, =
)= >
{ 
_proyectRepository 
= 
proyectRepository .
;. /
} 
public 

( 
string 
, 
bool 
) 
SaveProyect %
(% &
Proyect& -
proyect. 5
)5 6
{ 
try 
{ 	
_proyectRepository 
. 
Save #
(# $
proyect$ +
)+ ,
;, -
return 
( 
$str .
,. /
true0 4
)4 5
;5 6
} 	
catch 
( 
ProposalExeption 
e  !
)! "
{ 	
return 
( 
e 
. 
Message 
, 
false $
)$ %
;% &
} 	
} 
public 

( 
string 
, 
bool 
? 
) 
UpdateProyect (
(( )
Proyect) 0
proyect1 8
)8 9
{ 
try 
{   	
_proyectRepository!! 
.!! 
Update!! %
(!!% &
proyect!!& -
)!!- .
;!!. /
return"" 
("" 
$str"" ,
,"", -
true"". 2
)""2 3
;""3 4
}## 	
catch$$ 
($$ 
AuthException$$ 
e$$ 
)$$ 
{%% 	
return&& 
(&& 
$str&& 
,&& 
false&& "
)&&" #
;&&# $
}'' 	
}(( 
public** 

(** 
string** 
,** 
bool** 
?** 
)** 
UpdateStatusProyect** -
(**- .
string**. 4
code**5 9
,**9 :
string**: @
status**A G
,**G H
int**H K
?**K L
score**M R
)**R S
{++ 
try,, 
{-- 	
Proyect.. 
?.. 
proyect.. 
=.. 
_proyectRepository.. 1
...1 2
Find..2 6
(..6 7
proyect..7 >
=>..? A
proyect..B I
...I J
Code..J N
==..O Q
code..R V
)..V W
;..W X
proyect// 
!// 
.// 
Status// 
=// 
status// $
;//$ %
proyect00 
!00 
.00 
Score00 
=00 
score00 "
;00" #
_proyectRepository11 
.11 
Update11 %
(11% &
proyect11& -
)11- .
;11. /
return22 
(22 
$str22 +
,22+ ,
true22, 0
)220 1
;221 2
}33 	
catch44 
(44 
AuthException44 
e44 
)44 
{55 	
return66 
(66 
$str66 
,66 
false66 !
)66! "
;66" #
}77 	
}88 
public:: 

(:: 
string:: 
,:: 
bool:: 
?:: 
):: *
UpdateProfessorDocumentProyect:: 8
(::8 9
string::9 ?
code::@ D
,::D E
string::E K
document::L T
)::T U
{;; 
try<< 
{== 	
Proyect>> 
?>> 
proyect>> 
=>> 
_proyectRepository>> 1
.>>1 2
Find>>2 6
(>>6 7
proyect>>7 >
=>>>? A
proyect>>B I
.>>I J
Code>>J N
==>>O Q
code>>R V
)>>V W
;>>W X
proyect?? 
!?? 
.?? 
ProfessorDocument?? &
=??' (
document??) 1
;??1 2
_proyectRepository@@ 
.@@ 
Update@@ %
(@@% &
proyect@@& -
)@@- .
;@@. /
returnAA 
(AA 
$strAA C
,AAC D
trueAAD H
)AAH I
;AAI J
}BB 	
catchCC 
(CC 
AuthExceptionCC 
eCC 
)CC 
{DD 	
returnEE 
(EE 
$strEE :
,EE: ;
falseEE; @
)EE@ A
;EEA B
}FF 	
}GG 
publicJJ 

ListJJ 
<JJ 
ProyectJJ 
>JJ 
GetProyectsJJ $
(JJ$ %
stringJJ% +
personDocumentJJ, :
)JJ: ;
{KK 
returnLL 
_proyectRepositoryLL !
.LL! "
FilterLL" (
(LL( )
proyectLL) 0
=>LL1 3
proyectMM 
.MM 
PersonDocumentMM "
!=MM# %
nullMM& *
&&MM+ -
proyectNN 
.NN 
PersonDocumentNN "
==NN# %
personDocumentNN& 4
)NN4 5
;NN5 6
}OO 
publicQQ 

ListQQ 
<QQ 
ProyectQQ 
>QQ (
GetProyectsProfessorDocumentQQ 5
(QQ5 6
stringQQ6 <
personDocumentQQ= K
)QQK L
{RR 
returnSS 
_proyectRepositorySS !
.SS! "
FilterSS" (
(SS( )
proyectSS) 0
=>SS1 3
proyectTT 
.TT 
ProfessorDocumentTT %
!=TT& (
nullTT) -
&&TT. 0
proyectUU 
.UU 
ProfessorDocumentUU %
==UU& (
personDocumentUU) 7
)UU7 8
;UU8 9
}VV 
publicXX 

ProyectXX 
?XX 
SearchProyectXX !
(XX! "
stringXX" (
personDocumentXX) 7
)XX7 8
{YY 
returnZZ 
_proyectRepositoryZZ !
.ZZ! "
FindZZ" &
(ZZ& '
proyectZZ' .
=>ZZ/ 1
proyect[[ 
.[[ 
PersonDocument[[ "
==[[# %
personDocument[[& 4
)[[4 5
;[[5 6
}\\ 
public^^ 

string^^ 
DeleteProyect^^ 
(^^  
string^^  &
code^^' +
)^^+ ,
{__ 
try`` 
{aa 	
Proyectbb 
?bb 
proyectbb 
=bb 
_proyectRepositorycc "
.cc" #
Findcc# '
(cc' (
proyectcc( /
=>cc0 2
proyectcc3 :
.cc: ;
Codecc; ?
==cc@ B
codeccC G
)ccG H
;ccH I
_proyectRepositorydd 
.dd 
Deletedd %
(dd% &
proyectdd& -
!dd- .
)dd. /
;dd/ 0
returnee 
$stree '
;ee' (
}ff 	
catchgg 
(gg 
	Exceptiongg 
egg 
)gg 
{hh 	
throwii 
newii 
PersonExeptionii $
(ii$ %
$"jj 
$strjj 3
{jj3 4
ejj4 5
.jj5 6
Messagejj6 =
}jj= >
"jj> ?
)jj? @
;jj@ A
}kk 	
}ll 
publicnn 

Listnn 
<nn 
Proyectnn 
>nn 
GetAllnn 
(nn  
)nn  !
{oo 
returnpp 
_proyectRepositorypp !
.pp! "
GetAllpp" (
(pp( )
)pp) *
;pp* +
}qq 
publictt 

Proyecttt 
?tt 
GetProyectCodett "
(tt" #
stringtt# )
codett* .
)tt. /
{uu 
returnvv 
_proyectRepositoryvv !
.vv! "
Findvv" &
(vv& '
proyectvv' .
=>vv/ 1
proyectvv2 9
.vv9 :
Codevv: >
==vv? A
codevvB F
)vvF G
;vvG H
}ww 
publicyy 

objectyy 
filterListProposalyy $
(yy$ %
Listyy% )
<yy) *
Proyectyy* 1
>yy1 2
proyectyy3 :
)yy: ;
{zz 
int{{ 
	pendiente{{ 
={{ 
$num{{ 
,{{ 
aprobado{{ #
={{$ %
$num{{& '
,{{' (
corregir{{) 1
={{2 3
$num{{4 5
,{{5 6
	rechazado{{7 @
={{A B
$num{{C D
,{{D E
total{{E J
={{K L
$num{{M N
;{{N O
foreach|| 
(|| 
Proyect|| 
p|| 
in|| 
proyect|| %
)||% &
{}} 	
if~~ 
(~~ 
p~~ 
.~~ 
Status~~ 
==~~ 
$str~~ &
)~~& '
{ 
aprobado
ÄÄ 
++
ÄÄ 
;
ÄÄ 
}
ÅÅ 
if
ÇÇ 
(
ÇÇ 
p
ÇÇ 
.
ÇÇ 
Status
ÇÇ 
==
ÇÇ 
$str
ÇÇ '
)
ÇÇ' (
{
ÉÉ 
	pendiente
ÑÑ 
++
ÑÑ 
;
ÑÑ 
}
ÖÖ 
if
ÜÜ 
(
ÜÜ 
p
ÜÜ 
.
ÜÜ 
Status
ÜÜ 
==
ÜÜ 
$str
ÜÜ &
)
ÜÜ& '
{
áá 
corregir
àà 
++
àà 
;
àà 
}
ââ 
if
ää 
(
ää 
p
ää 
.
ää 
Status
ää 
==
ää 
$str
ää '
)
ää' (
{
ãã 
	rechazado
åå 
++
åå 
;
åå 
}
çç 
total
èè 
++
èè 
;
èè 
}
êê 	
var
ëë 

statistics
ëë 
=
ëë 
new
ëë 
{
íí 	
	Pendiente
ìì 
=
ìì 
	pendiente
ìì !
,
ìì! "
	Rechazado
îî 
=
îî 
	rechazado
îî !
,
îî! "
Aprobado
ïï 
=
ïï 
aprobado
ïï 
,
ïï  
Corregir
ññ 
=
ññ 
corregir
ññ 
,
ññ  
Total
óó 
=
óó 
total
óó 
}
òò 	
;
òò	 

return
ôô 

statistics
ôô 
;
ôô 
}
öö 
public
õõ 

object
õõ /
!GeneralStatisticsProyectProfessor
õõ 3
(
õõ3 4
string
õõ4 :
personDocument
õõ; I
)
õõI J
{
úú 
List
ùù 
<
ùù 
Proyect
ùù 
>
ùù 
proyects
ùù 
=
ùù   
_proyectRepository
ùù! 3
.
ùù3 4
Filter
ùù4 :
(
ùù: ;
proyect
ùù; B
=>
ùùC E
proyect
ûû 
.
ûû 
ProfessorDocument
ûû %
!=
ûû& (
null
ûû) -
&&
ûû. 0
proyect
üü 
.
üü 
ProfessorDocument
üü %
==
üü& (
personDocument
üü) 7
)
üü7 8
;
üü8 9
return
††  
filterListProposal
†† !
(
††! "
proyects
††" *
)
††* +
;
††+ ,
}
°° 
public
££ 

object
££ -
GeneralStatisticsProyectStudent
££ 1
(
££1 2
string
££2 8
personDocument
££9 G
)
££G H
{
§§ 
List
•• 
<
•• 
Proyect
•• 
>
•• 
proyects
•• 
=
••   
_proyectRepository
••! 3
.
••3 4
Filter
••4 :
(
••: ;
proyect
••; B
=>
••C E
proyect
¶¶ 
.
¶¶ 
PersonDocument
¶¶ "
!=
¶¶# %
null
¶¶& *
&&
¶¶+ -
proyect
ßß 
.
ßß 
PersonDocument
ßß "
==
ßß# %
personDocument
ßß& 4
)
ßß4 5
;
ßß5 6
return
®®  
filterListProposal
®® !
(
®®! "
proyects
®®" *
)
®®* +
;
®®+ ,
}
©© 
public
´´ 

object
´´ '
GeneralStatisticsProyects
´´ +
(
´´+ ,
)
´´, -
{
¨¨ 
List
≠≠ 
<
≠≠ 
Proyect
≠≠ 
>
≠≠ 
proyects
≠≠ 
=
≠≠   
_proyectRepository
≠≠! 3
.
≠≠3 4
GetAll
≠≠4 :
(
≠≠: ;
)
≠≠; <
;
≠≠< =
return
ÆÆ  
filterListProposal
ÆÆ !
(
ÆÆ! "
proyects
ÆÆ" *
)
ÆÆ* +
;
ÆÆ+ ,
}
ØØ 
}≤≤ ¸
MC:\Users\sofia\Documents\project\Pegi.Api\src\Services\ResearchLineService.cs
	namespace 	
Services
 
; 
public 
class 
ResearchLineService  
{ 
private		 
readonly		 #
ResearchLinesRepository		 ,$
_researchLinesRepository		- E
;		E F
public 

ResearchLineService 
( #
ResearchLinesRepository 6#
researchLinesRepository7 N
)N O
{ $
_researchLinesRepository  
=! "#
researchLinesRepository# :
;: ;
} 
public 

string 
SaveLine 
( 
ResearchLine '
line( ,
), -
{ 
try 
{ 	$
_researchLinesRepository $
.$ %
Save% )
() *
line* .
). /
;/ 0
return 
$str @
;@ A
} 	
catch 
( 
	Exception 
e 
) 
{ 	
throw 
new  
ResearchLineExcepion *
(* +
$" 
$str >
{> ?
e? @
.@ A
MessageA H
}H I
"I J
)J K
;K L
} 	
} 
public 

List 
< 
ResearchLine 
> 
GetLines &
(& '
)' (
{ 
return   $
_researchLinesRepository   '
.  ' (
GetAll  ( .
(  . /
)  / 0
;  0 1
}!! 
public## 

ResearchLine## 
?## 

SearchLine## #
(### $
string##$ *
code##+ /
)##/ 0
{$$ 
return%% $
_researchLinesRepository%% '
.%%' (
Find%%( ,
(%%, -
line%%- 1
=>%%2 4
line&& 
.&& 
Code&& 
==&& 
code&& 
)&& 
;&& 
}'' 
})) Á
PC:\Users\sofia\Documents\project\Pegi.Api\src\Services\ResearchSubLineService.cs
	namespace 	
Services
 
; 
public 
class "
ResearchSubLineService #
{ 
private		 
readonly		 &
ResearchSubLinesRepository		 /'
_researchSubLinesRepository		0 K
;		K L
public 
"
ResearchSubLineService !
(! "&
ResearchSubLinesRepository" <&
researchSubLinesRepository= W
)W X
{ '
_researchSubLinesRepository #
=$ %&
researchSubLinesRepository& @
;@ A
} 
public 

string 
SaveSubline 
( 
ResearchSubline -
subline. 5
)5 6
{ 
try 
{ 	'
_researchSubLinesRepository '
.' (
Save( ,
(, -
subline- 4
)4 5
;5 6
return 
$str 2
;2 3
} 	
catch 
( 
	Exception 
e 
) 
{ 	
throw 
new #
ResearchSubLineExeption -
(- .
$" 
$str @
{@ A
eA B
.B C
MessageC J
}J K
"K L
)L M
;M N
} 	
} 
public 

List 
< 
ResearchSubline 
>  
GetLines! )
() *
)* +
{   
return!! '
_researchSubLinesRepository!! *
.!!* +
GetAll!!+ 1
(!!1 2
)!!2 3
;!!3 4
}"" 
public$$ 

List$$ 
<$$ 
ResearchSubline$$ 
>$$  
SearchSubLine$$! .
($$. /
string$$/ 5
code$$6 :
)$$: ;
{%% 
return&& '
_researchSubLinesRepository&& *
.&&* +
Filter&&+ 1
(&&1 2
line&&2 6
=>&&7 9
line'' 
.'' 
ResearchLineCode'' !
==''" $
code''% )
)'') *
;''* +
}(( 
}++ »
IC:\Users\sofia\Documents\project\Pegi.Api\src\Services\StudentsService.cs
	namespace 	
Services
 
; 
public 
class 
StudentsService 
{ 
private		 
readonly		 
StudentsRepository		 '
_studentsRepository		( ;
;		; <
public 

StudentsService 
( 
StudentsRepository -
studentsRepository. @
)@ A
{ 
_studentsRepository 
= 
studentsRepository 0
;0 1
} 
public 

( 
string 
, 
bool 
) 
SaveStudent %
(% &
Student& -
student. 5
)5 6
{ 
try 
{ 	
_studentsRepository 
.  
Save  $
($ %
student% ,
), -
;- .
return 
( 
$str .
,. /
true0 4
)4 5
;5 6
} 	
catch 
( 
StudentException 
e  !
)! "
{ 	
return 
( 
e 
. 
Message 
, 
false $
)$ %
;% &
} 	
} 
public 

Student 
? 
SearchStudent !
(! "
string" (
document) 1
)1 2
{ 
return 
_studentsRepository "
." #
Find# '
(' (
student( /
=>0 2
student3 :
.: ;
Document; C
==D F
documentG O
)O P
;P Q
}   
}!! Â
HC:\Users\sofia\Documents\project\Pegi.Api\src\Services\StudiesService.cs
	namespace 	
Services
 
; 
public 
class 
StudiesService 
{ 
private		 
readonly		 
StudiesRespository		 '
_studiesrespository		( ;
;		; <
public 

StudiesService 
( 
StudiesRespository ,
studiesrespository- ?
)? @
{ 
_studiesrespository 
= 
studiesrespository 0
;0 1
} 
public 

( 
string 
, 
bool 
) 
	SaveStudy $
($ %
Study% *
study+ 0
)0 1
{ 
try 
{ 	
_studiesrespository 
.  
Save  $
($ %
study% *
)* +
;+ ,
return 
( 
$str .
,. /
true0 4
)4 5
;5 6
} 	
catch 
( 
StudyExeption 
e 
) 
{ 	
return 
( 
e 
. 
Message 
, 
false $
)$ %
;% &
} 	
} 
public 

List 
< 
Study 
> 
SearchStudies $
($ %
string% +
documentPerson, :
): ;
{ 
return 
_studiesrespository "
." #
Filter# )
() *
study* /
=>0 2
study3 8
.8 9

PeopleCode9 C
==D F
documentPersonG U
)U V
;V W
}   
}"" €
MC:\Users\sofia\Documents\project\Pegi.Api\src\Services\ThematicAreaService.cs
	namespace 	
Services
 
; 
public 
class 
ThematicAreaService  
{ 
private		 
readonly		 #
ThematicAreasRepository		 ,$
_thematicAreasRepository		- E
;		E F
public 

ThematicAreaService 
( #
ThematicAreasRepository 6#
thematicAreasRepository7 N
)N O
{ $
_thematicAreasRepository  
=! "#
thematicAreasRepository# :
;: ;
} 
public 

string 
SaveThematicArea "
(" #
ThematicArea# /
thematicArea0 <
)< =
{ 
try 
{ 	$
_thematicAreasRepository $
.$ %
Save% )
() *
thematicArea* 6
)6 7
;7 8
return 
$str 7
;7 8
} 	
catch 
( 
	Exception 
e 
) 
{ 	
throw 
new  
ThematicAreaExeption *
(* +
$" 
$str E
{E F
eF G
.G H
MessageH O
}O P
"P Q
)Q R
;R S
} 	
} 
public 

List 
< 
ThematicArea 
> !
GetLinesThematicAreas 3
(3 4
)4 5
{ 
return   $
_thematicAreasRepository   '
.  ' (
GetAll  ( .
(  . /
)  / 0
;  0 1
}!! 
public## 

List## 
<## 
ThematicArea## 
>## 
SearchThematicArea## 0
(##0 1
string##1 7
code##8 <
)##< =
{$$ 
return%% $
_thematicAreasRepository%% '
.%%' (
Filter%%( .
(%%. /
area%%/ 3
=>%%5 7
area&& 
.&& 
ResearchSublineCode&& $
==&&% '
code&&( ,
)&&, -
;&&- .
}'' 
}(( Ø
FC:\Users\sofia\Documents\project\Pegi.Api\src\Services\UsersService.cs
	namespace 	
Services
 
; 
public 
class 
UsersService 
{		 
private

 
readonly

 
UsersRepository

 $
_usersRepository

% 5
;

5 6
public 

UsersService 
( 
UsersRepository '

repository( 2
)2 3
{ 
_usersRepository 
= 

repository %
;% &
} 
public 

bool 
SaveUser 
( 
User 
user "
)" #
{ 
try 
{ 	
user 
. 
Password 
= 
	Encryptor %
.% &
HashPassword& 2
(2 3
user3 7
.7 8
Password8 @
)@ A
;A B
_usersRepository 
. 
Save !
(! "
user" &
)& '
;' (
return 
true 
; 
} 	
catch 
{ 	
return 
false 
; 
} 	
} 
public 

( 
string 
, 
bool 
? 
) 
AddPersonDocument +
(+ ,
string, 2
document3 ;
,; <
string< B
usernameC K
)K L
{   
try!! 
{"" 	
User## 
?## 
user## 
=## 
_usersRepository## )
.##) *
Find##* .
(##. /
user##/ 3
=>##4 6
user##7 ;
.##; <
Name##< @
==##A C
username##D L
)##M N
;##N O
user$$ 
!$$ 
.$$ 
PersonDocument$$  
=$$! "
document$$# +
;$$+ ,
_usersRepository%% 
.%% 
Update%% #
(%%# $
user%%$ (
)%%( )
;%%) *
return&& 
(&& 
$str&& )
,&&) *
true&&* .
)&&. /
;&&/ 0
}'' 	
catch(( 
((( 
AuthException(( 
e(( 
)(( 
{)) 	
return** 
(** 
$str** 
,** 
false** !
)**! "
;**" #
}++ 	
},, 
public.. 

(.. 
string.. 
,.. 
bool.. 
?.. 
)..  
DeletePersonDocument.. .
(... /
string../ 5
document..6 >
)..> ?
{// 
try00 
{11 	
User22 
?22 
user22 
=22 
_usersRepository22 )
.22) *
Find22* .
(22. /
user22/ 3
=>224 6
user227 ;
.22; <
PersonDocument22< J
==22K M
document22N V
)22W X
;22X Y
user33 
.33 
PersonDocument33 
=33  !
null33" &
;33& '
_usersRepository44 
.44 
Update44 #
(44# $
user44$ (
)44( )
;44) *
return55 
(55 
$str55 *
,55* +
true55+ /
)55/ 0
;550 1
}66 	
catch77 
(77 
AuthException77 
e77 
)77 
{88 	
return99 
(99 
$str99 
,99 
false99 !
)99! "
;99" #
}:: 	
};; 
}>> 