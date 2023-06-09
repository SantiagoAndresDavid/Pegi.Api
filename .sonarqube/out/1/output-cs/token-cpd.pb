®&
CC:\Users\sofia\Documents\project\Pegi.Api\src\Data\PegiDbContext.cs
	namespace 	
Data
 
; 
public 
class 
PegiDbContext 
: 
	DbContext &
{ 
public 

PegiDbContext 
( 
DbContextOptions )
options* 1
)1 2
:3 4
base5 9
(9 :
options: A
)A B
{		 
}

 
public 

DbSet 
< 
User 
> 
? 
Users 
{ 
get  #
;# $
set% (
;( )
}* +
public 

DbSet 
< 
Person 
> 
People 
{  !
get" %
;% &
set' *
;* +
}, -
public 

DbSet 
< 
Study 
> 
Studies 
{  !
get" %
;% &
set' *
;* +
}, -
public 

DbSet 
< 
City 
> 
Cities 
{ 
get  #
;# $
set% (
;( )
}* +
public 

DbSet 
< 

Department 
> 
Departments (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 

DbSet 
< 

Experience 
> 
Experiences (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 

DbSet 
< 
AcademicProgram  
>  !
AcademicPrograms" 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 

DbSet 
< 
Student 
> 
Students "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 

DbSet 
< 
	Professor 
> 

Professors &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 

DbSet 
< 
Proposal 
> 
	Proposals $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 

DbSet 
< 
ThematicArea 
> 
ThematicAreas ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 

DbSet 
< 
ResearchSubline  
>  !
ResearchSublines" 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 

DbSet 
< 
ResearchLine 
> 
ResearchLine +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 

DbSet 
< 
HistoryProposals !
>! "
HistoryProposals# 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 

DbSet 
< 
ProposalFeedBack !
>! "
ProposalFeedBacks# 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
public 

DbSet 
< 
Proyect 
> 
Proyects "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 

DbSet 
< 
ProyectFeedBack  
>  !
ProyectFeedBacks" 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 

DbSet 
< 
HistoryProyect 
>  
HistoryProyects! 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
	protected 
override 
void 
OnModelCreating +
(+ ,
ModelBuilder, 8
modelBuilder9 E
)E F
{   
modelBuilder!! 
.!! 
Entity!! 
<!! 
User!!  
>!!  !
(!!! "
)!!" #
.!!# $
HasIndex!!$ ,
(!!, -
user!!- 1
=>!!2 4
user!!5 9
.!!9 :
Name!!: >
)!!> ?
.!!? @
IsUnique!!@ H
(!!H I
)!!I J
;!!J K
}"" 
}## ÿ
[C:\Users\sofia\Documents\project\Pegi.Api\src\Data\Repository\AcademicProgramsRepository.cs
	namespace 	
Data
 
. 

Repository 
; 
public 
class &
AcademicProgramsRepository '
:( )

Repository* 4
<4 5
AcademicProgram5 D
>D E
{ 
public 
&
AcademicProgramsRepository %
(% &
PegiDbContext& 3
context4 ;
); <
:= >
base? C
(C D
contextD K
)K L
{		 
}

 
} Ö
QC:\Users\sofia\Documents\project\Pegi.Api\src\Data\Repository\CitiesRepository.cs
	namespace 	
Data
 
. 

Repository 
; 
public 
class 
CitiesRepository 
: 

Repository  *
<* +
City+ /
>/ 0
{ 
public 

CitiesRepository 
( 
PegiDbContext )
context* 1
)1 2
:3 4
base5 9
(9 :
context: A
)A B
{		 
}

 
} ë
VC:\Users\sofia\Documents\project\Pegi.Api\src\Data\Repository\DepartmentsRepository.cs
	namespace 	
Data
 
. 

Repository 
; 
public 
class !
DepartmentsRepository "
:# $

Repository% /
</ 0

Department0 :
>: ;
{ 
public 
!
DepartmentsRepository  
(  !
PegiDbContext! .
context/ 6
)6 7
:8 9
base: >
(> ?
context? F
)F G
{		 
}

 
} ë
VC:\Users\sofia\Documents\project\Pegi.Api\src\Data\Repository\ExperiencesRepository.cs
	namespace 	
Data
 
. 

Repository 
; 
public 
class !
ExperiencesRepository "
:# $

Repository% /
</ 0

Experience0 :
>: ;
{ 
public 
!
ExperiencesRepository  
(  !
PegiDbContext! .
context/ 6
)6 7
:8 9
base: >
(> ?
context? F
)F G
{		 
}

 
} £
[C:\Users\sofia\Documents\project\Pegi.Api\src\Data\Repository\HistoryProposalsRepository.cs
public 
class &
HistoryProposalsRepository '
:( )

Repository* 4
<4 5
HistoryProposals5 E
>E F
{ 
public 
&
HistoryProposalsRepository %
(% &
PegiDbContext& 3
context4 ;
); <
:= >
base? C
(C D
contextD K
)K L
{		 
}

 
} ›
YC:\Users\sofia\Documents\project\Pegi.Api\src\Data\Repository\HistoryProyectRepository.cs
public 
class $
HistoryProyectRepository %
:& '

Repository( 2
<2 3
HistoryProyect3 A
>A B
{ 
public		 
$
HistoryProyectRepository		 #
(		# $
PegiDbContext		$ 1
context		2 9
)		9 :
:		; <
base		= A
(		A B
context		B I
)		I J
{

 
} 
} Ø
QC:\Users\sofia\Documents\project\Pegi.Api\src\Data\Repository\PeopleRepository.cs
	namespace 	
Data
 
. 

Repository 
; 
public 
class 
PeopleRepository 
: 

Repository  *
<* +
Person+ 1
>1 2
{ 
public		 

PeopleRepository		 
(		 
PegiDbContext		 )
context		* 1
)		1 2
:		3 4
base		5 9
(		9 :
context		: A
)		A B
{

 
} 
} ‡
TC:\Users\sofia\Documents\project\Pegi.Api\src\Data\Repository\ProfessorRepository.cs
public 
class 
ProfessorRepository  
:! "

Repository# -
<- .
	Professor. 7
>7 8
{ 
public		 

ProfessorRepository		 
(		 
PegiDbContext		 ,
context		- 4
)		4 5
:		6 7
base		8 <
(		< =
context		= D
)		D E
{

 
} 
} €
[C:\Users\sofia\Documents\project\Pegi.Api\src\Data\Repository\ProposalFeedBackRepository.cs
	namespace 	
Data
 
. 

Repository 
; 
public 
class &
ProposalFeedBackRepository '
:( )

Repository* 4
<4 5
ProposalFeedBack5 E
>E F
{ 
public 
&
ProposalFeedBackRepository %
(% &
PegiDbContext& 3
context4 ;
); <
:= >
base? C
(C D
contextD K
)K L
{		 
}

 
} à
SC:\Users\sofia\Documents\project\Pegi.Api\src\Data\Repository\ProposalRepository.cs
	namespace 	
Data
 
. 

Repository 
; 
public 
class 
ProposalRepository 
:  !

Repository" ,
<, -
Proposal- 5
>5 6
{ 
public 

ProposalRepository 
( 
PegiDbContext +
context, 3
)3 4
:5 6
base7 ;
(; <
context< C
)C D
{		 
}

 
} ü
ZC:\Users\sofia\Documents\project\Pegi.Api\src\Data\Repository\ProyectFeedBackRepository.cs
	namespace 	
Data
 
. 

Repository 
; 
public 
class %
ProyectFeedBackRepository &
:' (

Repository) 3
<3 4
ProyectFeedBack4 C
>C D
{ 
public 
%
ProyectFeedBackRepository $
($ %
PegiDbContext% 2
context3 :
): ;
:< =
base> B
(B C
contextC J
)J K
{		 
}

 
} Ü
RC:\Users\sofia\Documents\project\Pegi.Api\src\Data\Repository\ProyectRepository.cs
	namespace 	
Data
 
. 

Repository 
; 
public 
class 
ProyectRepository 
:  

Repository! +
<+ ,
Proyect, 3
>3 4
{ 
public 

ProyectRepository 
( 
PegiDbContext *
context+ 2
)2 3
:4 5
base6 :
(: ;
context; B
)B C
{		 
}

 
} ó
XC:\Users\sofia\Documents\project\Pegi.Api\src\Data\Repository\ResearchLinesRepository.cs
	namespace 	
Data
 
. 

Repository 
; 
public 
class #
ResearchLinesRepository $
:% &

Repository' 1
<1 2
ResearchLine2 >
>> ?
{ 
public 
#
ResearchLinesRepository "
(" #
PegiDbContext# 0
context1 8
)8 9
:: ;
base< @
(@ A
contextA H
)H I
{		 
}

 
} ÿ
[C:\Users\sofia\Documents\project\Pegi.Api\src\Data\Repository\ResearchSubLinesRepository.cs
	namespace 	
Data
 
. 

Repository 
; 
public 
class &
ResearchSubLinesRepository '
:( )

Repository* 4
<4 5
ResearchSubline5 D
>D E
{ 
public 
&
ResearchSubLinesRepository %
(% &
PegiDbContext& 3
context4 ;
); <
:= >
base? C
(C D
contextD K
)K L
{		 
}

 
} Ã$
RC:\Users\sofia\Documents\project\Pegi.Api\src\Data\Repository\shared\Repository.cs
	namespace 	
Data
 
. 

Repository 
. 
shared  
;  !
public 
class 

Repository 
< 
TEntity 
>  
where! &
TEntity' .
:/ 0
class1 6
{ 
private 
	protected 
readonly 
PegiDbContext ,
Context- 4
;4 5
public

 


Repository

 
(

 
PegiDbContext

 #
context

$ +
)

+ ,
{ 
Context 
= 
context 
; 
} 
public 

void 
Save 
( 
TEntity 
entity #
)# $
{ 
Context 
. 
Set 
< 
TEntity 
> 
( 
) 
. 
Add "
(" #
entity# )
)) *
;* +
Context 
. 
SaveChanges 
( 
) 
; 
} 
public 

bool 
HasAny 
( 

Expression !
<! "
Func" &
<& '
TEntity' .
,. /
bool0 4
>4 5
>5 6
	predicate7 @
)@ A
{ 
return 
Context 
. 
Set 
< 
TEntity "
>" #
(# $
)$ %
.% &
Any& )
() *
	predicate* 3
)3 4
;4 5
} 
public 

virtual 
TEntity 
? 
Find  
(  !

Expression! +
<+ ,
Func, 0
<0 1
TEntity1 8
,8 9
bool: >
>> ?
>? @
	predicateA J
)J K
{ 
return 
Context 
. 
Set 
< 
TEntity "
>" #
(# $
)$ %
.% &
AsNoTracking& 2
(2 3
)3 4
.4 5
FirstOrDefault5 C
(C D
	predicateD M
)M N
;N O
} 
public 

virtual 
List 
< 
TEntity 
>  
Filter! '
(' (

Expression   
<   
Func   
<   
TEntity   
,    
bool  ! %
>  % &
>  & '
	predicate  ( 1
)  1 2
{!! 
return"" 
Context"" 
."" 
Set"" 
<"" 
TEntity"" "
>""" #
(""# $
)""$ %
.""% &
Where""& +
(""+ ,
	predicate"", 5
)""5 6
.""6 7
ToList""7 =
(""= >
)""> ?
;""? @
}## 
public%% 

virtual%% 
List%% 
<%% 
TEntity%% 
>%%  
GetAll%%! '
(%%' (
)%%( )
{&& 
return'' 
Context'' 
.'' 
Set'' 
<'' 
TEntity'' "
>''" #
(''# $
)''$ %
.''% &
AsNoTracking''& 2
(''2 3
)''3 4
.''4 5
ToList''5 ;
(''; <
)''< =
;''= >
}(( 
public** 

void** 
Delete** 
(** 
TEntity** 
entity** %
)**% &
{++ 
Context,, 
.,, 
Set,, 
<,, 
TEntity,, 
>,, 
(,, 
),, 
.,, 
Remove,, %
(,,% &
entity,,& ,
),,, -
;,,- .
Context-- 
.-- 
SaveChanges-- 
(-- 
)-- 
;-- 
}.. 
public00 

void00 
Update00 
(00 
TEntity00 
entity00 %
)00% &
{11 
Context22 
.22 
Set22 
<22 
TEntity22 
>22 
(22 
)22 
.22 
Update22 %
(22% &
entity22& ,
)22, -
;22- .
Context33 
.33 
SaveChanges33 
(33 
)33 
;33 
}44 
}55 ß
SC:\Users\sofia\Documents\project\Pegi.Api\src\Data\Repository\StudentsRepository.cs
	namespace 	
Data
 
. 

Repository 
; 
public 
class 
StudentsRepository 
:  !

Repository" ,
<, -
Student- 4
>4 5
{ 
public 

StudentsRepository 
( 
PegiDbContext +
context, 3
)3 4
:5 6
base7 ;
(; <
context< C
)C D
{		 
}

 
} Ý
SC:\Users\sofia\Documents\project\Pegi.Api\src\Data\Repository\StudiesRespository.cs
	namespace 	
Data
 
. 

Repository 
; 
public 
class 
StudiesRespository 
:  !

Repository" ,
<, -
Study- 2
>2 3
{ 
public 

StudiesRespository 
( 
PegiDbContext +
context, 3
)3 4
:5 6
base7 ;
(; <
context< C
)C D
{		 
}

 
} ó
XC:\Users\sofia\Documents\project\Pegi.Api\src\Data\Repository\ThematicAreasRepository.cs
	namespace 	
Data
 
. 

Repository 
; 
public 
class #
ThematicAreasRepository $
:% &

Repository' 1
<1 2
ThematicArea2 >
>> ?
{ 
public 
#
ThematicAreasRepository "
(" #
PegiDbContext# 0
context1 8
)8 9
:: ;
base< @
(@ A
contextA H
)H I
{		 
}

 
} Ó
PC:\Users\sofia\Documents\project\Pegi.Api\src\Data\Repository\UsersRepository.cs
	namespace 	
Data
 
. 

Repository 
; 
public 
class 
UsersRepository 
: 

Repository )
<) *
User* .
>. /
{ 
public 

UsersRepository 
( 
PegiDbContext (
context) 0
)0 1
:2 3
base4 8
(8 9
context9 @
)@ A
{		 
}

 
} 