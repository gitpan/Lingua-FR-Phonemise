package Lingua::FR::Phonemise;

use 5.008008;
use strict;
use warnings;
use Unicode::String qw(latin1 latin1);


require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows dlaration	use Lingua::FR::Phonemise ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(Text2Phoneme),qw(NbSyllabe) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT =( qw(Text2Phoneme), qw(NbSyllabe));


my %Exceptions;
our $VERSION = '1.0';

#ce programme permet là phonémisation
# Remarque : les consonnes chant les sons :

#Voyelle : aeiouyàèùéâêîôûäëïöüE§2598£\@
# E=ai
# §=on
# 2=eu généreux
# 9 neuf
# 5 in
# 8 ui
# \@ an
# £ interne é final qui est à la fin substitué à e
# Voyelles mouillées : eiy5E9

#Lettres fictives : des lettres qui sont transformées en leur majuscule pour ne pas être reprises une deuxième fois
# exemple : nage => naJe => naje le J évitant que le j soit pris pour le son i qui est le j


sub TraiteA
{
 my $mot = shift;
  $mot=~s/ents$/\@/;
 $mot=~s/ends$/\@/;
 $mot=~s/aiement$/Em\@/;

 $mot=~s/faiss/feC/;
 $mot=~s/faiz/f°z/;
 $mot=~s/ail$/aJ/;
 $mot=~s/aill/aJ/;
 $mot=~s/âill/aJ/;

 $mot=~s/aims*$/5/;
 $mot=~s/tiaire/sJER/g;
 $mot=~s/man$/mAn/;

 $mot=~s/atie/aCie/;


 $mot=~s/ains*$/5/;
 $mot=~s/ain([cdfgjkmqrstvwxz])/5$1/g;
 $mot=~s/am([bp])/\@$1/g;
 $mot=~s/ans*$/\@/g;
 $mot=~s/an([^naeiouyàèùéâêîôûäëïöüE§2598£\@])/\@$1/g;
 $mot=~s/a(i|î)t$/E/;
 $mot=~s/aient$/E/;
 $mot=~s/airé/£R£/g;
 $mot=~s/aï/aJ/g;

 $mot=~s/a(i|î)/E/g;
 $mot=~s/â/a/g;
 $mot=~s/à/a/g;
 $mot=~s/ä/a/g;
 $mot=~s/eaux$/o/;
 $mot=~s/aux$/o/;
 $mot=~s/eau$/o/;
 $mot=~s/au/o/g;
 $mot=~s/eau/o/g;


 return $mot;
}

sub TraiteB
{
 my $mot=shift;
 $mot=~s/^b$/b£/;
 $mot=~s/§bs*$/§/;
 $mot=~s/bapt/bat/;
 $mot=~s/abs/aps/;
 $mot=~s/obs/ops/;
 $mot=~s/obt/opt/;
 $mot=~s/ybst/ypst/;
 return ($mot);
}

sub TraiteC
{
 my $mot=shift;
 $mot=~s/^c$/C£/;
$mot=~s/eç/°s/g;
$mot=~s/eci/°si/g;
$mot=~s/ancs*$/\@/;
$mot=~s/tabacs*$/taba/;

$mot=~s/ce/se/g;
 $mot=~s/ci/si/g;
 $mot=~s/cî/si/g;

 $mot=~s/cé/s£/g;
 $mot=~s/cè/sE/g;
 $mot=~s/cE/sE/g;
 $mot=~s/cê/sE/g;
 $mot=~s/cy/si/g;
 $mot=~s/tachy/taki/g;
 $mot=~s/tachéo/takeo/g;

 $mot=~s/orchestr/orkEstR/g;
 $mot=~s/archè/arSE/g;
 $mot=~s/archi/arSi/g;
 $mot=~s/chiro/kiRo/g;
 $mot=~s/chle/Sle/g;
 $mot=~s/chli/Sli/g;
 $mot=~s/choe/koe/g;
 $mot=~s/chol/kol/g;

 $mot=~s/ch([lrnt])/k$1/g;
 $mot=~s/ycho/iko/g;
 $mot=~s/arche/arS°/g;
 $mot=~s/cch/k/g;
 $mot=~s/écho/£ko/g;
 $mot=~s/atch/atS/g;
 $mot=~s/tch$/tS/;

 $mot=~s/arch/ark/g;
 $mot=~s/acc([ieéèE5])/aks$1/g;
 $mot=~s/chr/kR/;
 $mot=~s/ch$/k/;
 $mot=~s/ch/S/g;
 $mot=~s/cueill/k9J/g;
 $mot=~s/cueil/k9J/g;
 $mot=~s/c/k/g;
 $mot=~s/ç/s/g;
 return $mot;
 }

sub TraiteD
{
 my $mot=shift;
 $mot=~s/^d$/d£/;
 $mot=~s/\@d$/\@/;
 $mot=~s/od$/o/;
 $mot=~s/ed$/Ed/;
 $mot=~s/rds*$/R/;
 $mot=~s/Wad$/Wa/;

 return $mot;
 }


sub TraiteE
{
 my $mot=shift;
 $mot=~s/^([bsdfZklmnprtvz])e$/{$1}2/;
 $mot=~s/^é$/£/;
 $mot=~s/grée/gR£/;
$mot=~s/ea/i/g;
 $mot=~s/ets*$/£/g;
 $mot=~s/êts*$/E/g;

 $mot=~s/ements*$/em\@/;
 $mot=~s/ee/i/g;
 $mot=~s/([^8t])e$/$1/;
 $mot=~s/eR$/£/;

 $mot=~s/ients*$/J\@/g;
 $mot=~s/ientes*$/J\@t/g;

 $mot=~s/ienc/J\@s/g;
 $mot=~s/ienc/J\@s/g;
 $mot=~s/ien([^n]*)/J5/g;
 $mot=~s/^(.)ent$/$1\@/;
 $mot=~s/([^m])ent$/$1/;
 $mot=~s/en([^naeiouyàèùéâêîôûäëïöüUE§2598£\@JWo])/\@$1/g;
 $mot=~s/em([pb])/\@$1/;
 $mot=~s/\@t$/\@/;
 $mot=~s/ez$/£/;
 $mot=~s/eR([aeio§Eo])/R$1/g;
#  $mot=~s/êt/et/g;

 $mot=~s/ê/E/g;
 $mot=~s/è/E/g;
 $mot=~s/es$/e/;
 $mot=~s/esc/es/g;
 $mot=~s/es/Es/g;
 $mot=~s/ems*$/Em/g;
 $mot=~s/egs*$/Eg/g;

 $mot=~s/eR([bcdgklmnrstvZSTNGCµ])/ER$1/g;
 $mot=~s/ek([aou])/°k$1/g;
 $mot=~s/ek/Ek/g;
 $mot=~s/ep/Ep/g;

 $mot=~s/el$/El/g;
 $mot=~s/ef$/Ef/g;

 $mot=~s/enn/En/g;

#  $mot=~s/(e|E)(r|R)(E|as|a|§|e|J§|ie)$/°R$/g;
#
 $mot=~s/ec/Ec/g;
 $mot=~s/é$/£/g;
 $mot=~s/é/£/g;

 $mot=~s/te$/t/g;
 $mot=~s/ie$/Je/;
 $mot=~s/i2/J2/;
 $mot=~s/i§/J§/;
 $mot=~s/iE/JE/;
 $mot=~s/ee/i/;
 $mot=~s/ReR([oa])s*/R£R$1/g;
 $mot=~s/^ben/b°n/;
 $mot=~s/^Zen/Z°n/;
 $mot=~s/^den/d°n/;

 $mot=~s/vet/v°t/;
 $mot=~s/zem/z°m/;


 $mot=~s/([bsdfgZklmnpRtvxzS])e([bsdfgZklmnpRtvxzS])([bsdfgZklmnpRtvxzS])/$1E$2$3/g;
 $mot=~s/([bsdfgZklmnpRtvxzS])e([bsdfgZklmnpRtvxzS])/$1°$2/g;

 $mot=~s/kRem/kR£m/g;
 $mot=~s/([nsSrgJlfzRkt])em/$1m/g;
 $mot=~s/([v])em/$1°m/g;

 #  $mot=~s/([bl])e([R])/$1$2/g;
 return $mot;
 }

sub TraiteF
{
 my $mot=shift;
 $mot=~s/^f$/Ef/;
 return $mot;
}
sub TraiteG
{
 my $mot=shift;
 $mot=~s/^g$/Z£/g;
 $mot=~s/gnos(.*)/Gnos$1/;
 $mot=~s/gnom(.*)/Gnom$1/;

 $mot=~s/gn/NJ/g;
 $mot=~s/geuze/Z2z/g;
 $mot=~s/geu/Z9/g;
 $mot=~s/ge([âaoE§\@])/Z$1/g;
 $mot=~s/g([eiyèéâêîëïE259])/Z$1/g;
 $mot=~s/guï/G8i/g;
 $mot=~s/guë/GY/g;
 $mot=~s/gent/Z\@/g;
 $mot=~s/g\@/Z\@/g;

 $mot=~s/gu([aeiouyàèùéâêîôûäöüE§2598£\@])/G$1/g;

 $mot=~s/gt/t/g;

 return $mot;
 }

sub TraiteH
{
 my $mot=shift;
 $mot=~s/^h$/aS/g;
 $mot=~s/th$/te/g;
 $mot=~s/ph/f/g;
 $mot=~s/h//g;
 return ($mot);
}

sub TraiteI
{
 my $mot = shift;
 $mot=~s/ain([^aeiouy])/5$1/;
 $mot=~s/ains$/5/;
 $mot=~s/ain$/5/;
 $mot=~s/ein([aeiouyàèùéâêîôûäëïöüEo§2598£\@])/En$1/g;
 $mot=~s/ein([^aeiouyàèùéâêîôûäëïöüEo§2598£\@])/5$1/g;
 $mot=~s/eint*s*/5/g;
 $mot=~s/ings*$/iQ/;
 $mot=~s/in([^aeiouyàèùéâêîôûäëïöüEo§2598n£\@W])/5$1/g;
 $mot=~s/în([^aeiouyàèùéâêîôûäëïöüEo§2598n£\@W])/5$1/g;
 $mot=~s/in$/5/;
 $mot=~s/im([pb])/5$1/g;
 $mot=~s/ieds*$/i£/;
#  $mot=~s/([bcdfgkpv])li([aeiouyàèùéâêîôûäëïöüEo§2598n£\@W])/$1li$2/g;
#  $mot=~s/li([aeiouyàèùéâêîôûäëïöüEo§2598n£\@W])/lJ$2/g;

 $mot=~s/ie$/i/;
 $mot=~s/([bcdfgkptv])ri([eao§\@5E])/$1riJ$2/g;
 $mot=~s/ienn/JEn/g;
 $mot=~s/ients*$/J\@/g;
 $mot=~s/ientes*$/J\@µ/g;

 $mot=~s/ienc/J\@s/g;
 $mot=~s/ien/J5/;
 $mot=~s/iens*$/J5/;
 $mot=~s/siennes*$/zJEn/;
 $mot=~s/iennes*$/JEn/;
 $mot=~s/éens*$/e5/;
 $mot=~s/([^gZf])ill/$1iJ/;

 $mot=~s/iera$/iRa/;
 $mot=~s/ierE$/iRE/;
 $mot=~s/ier§$/iR§/;

 $mot=~s/ierait*s*$/iRE/;
 $mot=~s/ieront*s*$/iRon/;
 $mot=~s/ierez$/iRE/;


 $mot=~s/eil+/EJ/g;
 $mot=~s/ei/E/g;

 $mot=~s/tiel+/sJEl/g;
#  $mot=~s/li([ao])/liJ$1/g;
 $mot=~s/([bcdfgkpt])rio/$1RiJo/g;
 $mot=~s/i([aeiouyàèùéâêîôûäëïöüEo§2598£\@])/J$1/g;
#  $mot=~s/io/jo/g;
#  $mot=~s/io/jo/g;
#  $mot=~s/iel/jEl/g;
#  $mot=~s/ieu/j2/g;
#  $mot=~s/iet/jEt/g;
#  $mot=~s/ial/jal/g;
#  $mot=~s/i\@/j\@/g;
#  $mot=~s/lie/lje/g;
#  $mot=~s/ries*$/ri/g;


 $mot=~s/î/i/g;
 $mot=~s/six$/siC/;
 $mot=~s/^dix$/diC/;

 $mot=~s/ix$/i/g;

 $mot=~s/([Rrs])i([aeo])/$1sJ$2/g;



 return $mot;
}

sub TraiteJ
{
 my $mot = shift;
 $mot=~s/^j$/Zi/;
 $mot=~s/jean/Zan/g;
 $mot=~s/ej/°Z/g;
 $mot=~s/j/Z/g;
 return ($mot);
}

sub TraiteK
{
 my $mot = shift;
 $mot=~s/^k$/ka/;
 $mot=~s/oker$/okER/;
 $mot=~s/c*ker$/k9R/;


 return ($mot);
}

sub TraiteL
{
 my $mot = shift;
 $mot=~s/^l$/El/ ;
 $mot=~s/gilles/Zil/ ;
 $mot=~s/ieil/JEJ/g;
 $mot=~s/ueill/9J/g;
 $mot=~s/ieill/JEJ/g;
 $mot=~s/eill/EJ/g;
 $mot=~s/ueil/9J/g;
 $mot=~s/eil/EJ/g;
 $mot=~s/([aou])ille/$1J/g;
 $mot=~s/([aou])il/$1J/g;
 return ($mot);
}

sub TraiteM
{
 my $mot = shift;
 $mot=~s/^m$/Em/ ;
#  $mot=~s/emn$/Em/ ;

 return ($mot);
}

sub TraiteN
{
 my $mot = shift;
 $mot=~s/^n$/En/ ;
 return ($mot);
}

sub TraiteO
{
 my $mot = shift;
# Sons on
# En fin
 $mot=~s/ow/o/g;

 $mot=~s/oots*$/ut/g;
 $mot=~s/([oo])ts*$/$1/g;
 $mot=~s/ond*t*s*$/§/g;
 $mot=~s/kompt/k§t/g;
 $mot=~s/ons*$/§/g;
 $mot=~s/ont$/§/g;

 $mot=~s/omt/§t/g;
 $mot=~s/oin([^aeiouynéEè\@285§o])/W5$1/;

 $mot=~s/oin$/W5/;
 $mot=~s/ion([^aeiouynéEè\@285§o])/J§$1/g;
 $mot=~s/on([^aeiouynéEè\@285§o])/§$1/g;
 $mot=~s/oiement$/wam\@/g;
 $mot=~s/oiem\@$/wam\@/g;
 $mot=~s/om([bp])/§$1/g;
 $mot=~s/ons*$/§/g;
 $mot=~s/oix$/Wa/g;
 $mot=~s/oi/Wa/g;
 $mot=~s/oî/Wa/g;
 $mot=~s/^oe/2/g;
 $mot=~s/oeu/9/g;
 $mot=~s/zoom/zum/g;
 $mot=~s/zoo/zoo/g;
 $mot=~s/koop/kop/g;
 $mot=~s/koord/koord/g;

 $mot=~s/alkool/alkol/g;
 $mot=~s/oo/U/g;
 $mot=~s/oeil+/9J/g;
 $mot=~s/oïn/o5/;
 $mot=~s/O/o/g;
 $mot=~s/ô/o/g;

 return $mot;
}

sub TraiteP
{
 my $mot = shift;
 $mot=~s/^p$/p£/ ;
#  $mot=~s/septe/sEpte/g ;
 $mot=~s/skylpt/skylt/g ;
#  $mot=~s/sept/sEt/ ;
 return ($mot);
}


sub TraiteQ
{
my $mot = shift;
 $mot=~s/^q$/qY/ ;
$mot=~s/q$/k/g;
$mot=~s/^aqua/akwa/;
$mot=~s/qu/k/g;
$mot=~s/qû/kY/g;

return $mot;
}

sub TraiteR
{
my $mot = shift;
$mot=~s/^r$/ER/ ;
$mot=~s/^(.)er$/$1ER/ ;
$mot=~s/^rept/REpt/;
$mot=~s/^rekt/REct/;
$mot=~s/^rest/REst/;
$mot=~s/^ren([cdfgjklqrstvxz])/R\@$1/;
$mot=~s/^rem([bp])/R\@$1/;
# $mot=~s/^rein([cdfgjklqrstvxz])/R5$1/;
# $mot=~s/^rein([^cdfgjklqrstvxzd])/RE$1/;


$mot=~s/^re/R°/;
$mot=~s/ert$/%/;
$mot=~s/ers$/%/;

$mot=~s/er([bcdfgjklmnpqrstv])/ER$1/g;
$mot=~s/r/R/g;

$mot=~s/RR/R/g;
return $mot;
}

sub TraiteS
{
 my $mot = shift;
$mot=~s/^s$/EC/ ;
$mot=~s/ess$/EC/ ;
$mot=~s/esç/eC/ ;
$mot=~s/susu/CYCY/ ;


 $mot=~s/^as([oy])/as$1/;
#  $mot=~s/sia/zja/g;
 $mot=~s/([aeiouyàèùéâêîôûäëïöüE§2598£])s([aeiouyàèùéâêîôûäëïöüE§2598£])/$1z$2/g;
 $mot=~s/ansi([st]*)/\@zi$1/g;
 $mot=~s/lsant/ls\@/g;

 $mot=~s/lsa/lza/g;

 $mot=~s/isme$/izm/;
 $mot=~s/(^[cdlmst])es$/$1£/;
 $mot=~s/([aeio])s$/$1/;
 $mot=~s/(i|ï)sme/izm/g;
 $mot=~s/ents$/\@/;
 $mot=~s/sh/S/g;
#  $mot=~s/us$/YC/;
 $mot=~s/pays$/peï/; #suppression des s muets
 $mot=~s/s$//; #suppression des s muets

 return $mot;
}

sub TraiteT
{
 my $mot = shift;
$mot=~s/^t$/t£/ ;

$mot=~s/kRati/kRasi/;
$mot=~s/êest$/£/;


$mot=~s/\@t$/\@/;
 $mot=~s/tière/tiER/;
 $mot=~s/étJEne/eTEne/;
 $mot=~s/étJ5s*/eT5/;
 $mot=~s/(.+)stJEne/$1sTEne/;
 $mot=~s/(.+)tJEne/$1sJEne/;
 $mot=~s/(.+)tJ5s*$/$1sJ5/;

 $mot=~s/5t$/5/;
 $mot=~s/([Rr])t$/$1/;
 $mot=~s/[oo]t$/o/;
 $mot=~s/éth*io/eTo/;
 $mot=~s/ttJ/TJ/;
 $mot=~s/£tJ§$/£T§/;
 $mot=~s/stJ/sT/;
 $mot=~s/stJ§/sT§/;
 $mot=~s/tJ§/sJ§/g;
 $mot=~s/ti§/sJ§/g;
 $mot=~s/ti([aoo])/sJ$1/g;
 $mot=~s/tJ([aoo])/sJ$1/g;
 $mot=~s/tiez$/tJe/g
;
 $mot=~s/tie([^sz]+)/sie$1/g;

 $mot=~s/\@ts*$/\@/;
 $mot=~s/§t$/§/;
 $mot=~s/it$/i/;
 $mot=~s/at$/a/;
 return $mot;
}


sub TraiteU
{
 my $mot = shift;
 $mot=~s/ût$/u/;
 $mot=~s/ut$/u/;
 $mot=~s/amus$/amuC/;
 $mot=~s/anus$/anuC/;
 $mot=~s/aurus$/auruC/;


 $mot=~s/û/u/g;
 # les sons en eu parfois font 9 parfois 2
 # bœuf, chœur, cœur, manœuvre, mœurs, œil, œillet, œuf, œuvre, sœur, œrsted
#  $mot=~s/chœeur/k9R/g;
 $mot=~s/œil/9J/g;
 $mot=~s/œu([rfv])/9$1/g;
 $mot=~s/œud*$/2/g;
 $mot=~s/œ*$/°/g;

 $mot=~s/oeu/9/g;
 $mot=~s/euill/9J/g;
 $mot=~s/euil/9J/g;

 $mot=~s/([bcdfgpstv])rieur/$1riJ9R/g;
 $mot=~s/rieur/rJ9R/g;


 $mot=~s/neur$/n9R/g;
 $mot=~s/neur/n2R/g;
 $mot=~s/eur/9R/g;
 $mot=~s/euze/2z/g;
 $mot=~s/eul/9l/g;
 $mot=~s/euv/9v/g;
 $mot=~s/euf/9f/g;
 $mot=~s/eut$/2/g;
 $mot=~s/eut/2t/g;
 $mot=~s/eux$/2/;
 $mot=~s/eu/2/g;
 $mot=~s/ouel/uEl/g;
 $mot=~s/uel/8El/g;


 $mot=~s/([bcdfhjklmnprstvzw])uer$/${1}8£/g;
 $mot=~s/([bcdfhjklmnprstvzw])uée*s*$/${1}8£/g;
 $mot=~s/([bcdfhjklmnprstvzw])ueras*$/${1}YRa/g;
 $mot=~s/([bcdfhjklmnprstvzw])uerai*s*t*$/${1}YR£/g;
 $mot=~s/([bcdfhjklmnprstvzw])uais*t*$/${1}8E/g;
 $mot=~s/([bcdfhjklmnprstvzw])uaient$/${1}8E/g;
 $mot=~s/([bcdfhjklmnprstvzw])uE$/${1}8E/g;
 $mot=~s/([bcdfhjklmnprstvzw])ua+s*t*$/${1}8a/g;
 $mot=~s/ru\@/rU\@/g;
 $mot=~s/([bcdfhjklmnprstvzw])u([é\@aèoiy29])/${1}8$2/g;
 $mot=~s/um$/om/;
 $mot=~s/oua/Wa/g;
 $mot=~s/ua/8a/g;
 $mot=~s/e*un([^aeiouyàèùéâêîôûäëïöüE§2598£])/1$1/g;
 $mot=~s/([^oea])u/$1y/g;
 $mot=~s/rouet$/RU£/g;
 $mot=~s/roué/RU£/g;
 $mot=~s/oué/W£/g;
 $mot=~s/oua/Wa/g;
 $mot=~s/ouill/UJ/g;
 $mot=~s/loui/lUi/g;
 $mot=~s/oui/Wi/g;
 $mot=~s/out$/U/g;
 $mot=~s/oup$/U/g;
 $mot=~s/iou/JU/g;
 $mot=~s/kaoutSouks*/kaUtSU/g;
 $mot=~s/kaout/kaUt/g;
 $mot=~s/aou/U/g;
 $mot=~s/ou/U/g;
 $mot=~s/ôu/U/g;
 $mot=~s/oû/U/g;
 $mot=~s/uy/8iJ/g;
 $mot=~s/e*unt*s*$/1/;
 $mot=~s/u/Y/g;
 return $mot;
}

sub TraiteV
{
 my $mot = shift;
 $mot=~s/^v$/v£/g;
 return $mot;
}

sub TraiteW
{
 my $mot = shift;
 $mot=~s/^w$/dyblv£/g;
 $mot=~s/wa/va/g;
 return $mot;
}

sub TraiteX
{
 my $mot = shift ;
 $mot=~s/^x$/iks/g;
 $mot=~s/2x$/2/;
 $mot=~s/Ux$/U/;
 $mot=~s/wax$/wa/;



 $mot=~s/x$/ks/;

 $mot=~s/^exi/Egzi/,
 $mot=~s/^exe/Egze/,
 $mot=~s/^exE/Egze/,

 $mot=~s/^exa/Egza/,

 $mot=~s/exsi/EkCi/;
 $mot=~s/exi/EkCi/;
 $mot=~s/exes*$/Eks/;
 $mot=~s/exeR$/Ekse/;
 $mot=~s/exeR(.*)$/EkseR$1/;


 $mot=~s/ax/aks/;
 $mot=~s/ixJèm/izjEm/;
 $mot=~s/ixi/iksi/;

 $mot=~s/^x([aoieéo£])/gz$1/;

 $mot=~s/ex([aoieéo£])/Egz$1/;
 $mot=~s/ex/Eks/;
 $mot=~s/yx/iks/;
 $mot=~s/ix/iks/;


 $mot=~s/x([cèEi])/ks$1/;
 $mot=~s/x/gz/g;
 return $mot;
}

sub TraiteY
{
 my $mot = shift;
 $mot=~s/^y$/igrEk/g;
 $mot=~s/yll/il/g;

 $mot=~s/e*uns*$/1/g;
 $mot=~s/ays/eïs/g;
 $mot=~s/ryo/riJo/g;
 $mot=~s/oyou/WaJU/g;
 $mot=~s/you/JU/g;
 $mot=~s/yens*$/y5/g;
 $mot=~s/boy/boJ/g;

 $mot=~s/oy([aeéè\@§5uooU]|ou)/WaJ$1/g;
 $mot=~s/oy([aeéè\@§5uooqU]|ou)/WaJ$1/g;
 $mot=~s/yeu/J2/g;
 $mot=~s/ay([aâéèe2J])/EJ$1/g;
#  $mot=~s/ay\@/eJ\@/g;
 $mot=~s/ay([aeéè\@§5uoo])/eJ$1/g;
 $mot=~s/uy/8iJ/g;
 $mot=~s/ey/EJ/g;

 $mot=~s/y([^aeqiouy8925])/i$1/g;
 $mot=~s/yx/iks/g;
 $mot=~s/y/i/g;
 return $mot;
}

sub TraiteZ
{
 my $mot = shift;
 $mot=~s/^z$/zEd/g;
 $mot=~s/tz/ts/g;
 return $mot;
}


sub FinMuette
{
 my $mot=shift;
 $mot=~s/lt$//;
 $mot=~s/pects*$/p£/;
 $mot=~s/([lp])pects*$/$1£/;
 $mot=~s/tacts*$/takt/;
 $mot=~s/ends*$/\@/;
 $mot=~s/champs*$/S\@/;
#  $mot=~s/cts*$//;
 return $mot;
}

sub TraiteTrema
{
 my $mot = shift;
 $mot=~s/ä/a/g;
 $mot=~s/ë/e/g;
 $mot=~s/ï/i/g;
 $mot=~s/ö/o/g;
 $mot=~s/ü/o/g;
 $mot=~s/ÿ/y/g;
 return $mot;
}

sub ChangeLettresFictives
{
 my $mot = shift;
 $mot=~s/A/a/g;
 $mot=~s/£/e/g;
 $mot=~s/J/j/g;
 $mot=~s/N/n/g;
 $mot=~s/T/tj/g;
 $mot=~s/W/w/g;
 $mot=~s/C/s/g;
 $mot=~s/G/g/g;
 $mot=~s/Q/G/g;
 $mot=~s/Y/y/g;
 $mot=~s/U/u/g;
 $mot=~s/%/eR/g;
 $mot=~s/µ/t/g;

return $mot;
}

sub TraiteDoubleConsonne
{
 my $mot = shift;
 $mot=~s/emment/am\@/g;
 $mot=~s/emm/\@m/g;
 $mot=~s/enn/En/g;
 $mot=~s/ess9/£ss9/g;
 $mot=~s/ellé/£l£/g;
 $mot=~s/ell/El/g;
 $mot=~s/jazz/dSaz/g;
 $mot=~s/([aiou])zz/$1dz/g;
 $mot=~s/ezz/£dz/g;

 $mot=~s/ttJ/T/g;
 $mot=~s/e([cdfgjlprstz])\1e/E$1e/g;
 $mot=~s/e([cdfgjlprstz])\1/£$1/g;
 $mot=~s/([^bdfgklmnpruZ])ill/iJ/g;
 $mot=~s/([bdfgjklmnprstvwx])\1/$1/g;
 return $mot;
}

%Exceptions =(
anus=>"SF",
cumulus=>"SF",
cubitus=>"SF",
tumulus=>"SF",
abribus=>"SF",
bus=>"SF",
phallus=>"SF",
uranus=>"SF",
cul=>"SL",
cucul=>"SL",
peignecul=>"SL",
culs=>"SL",
cuculs=>"SL",
peigneculs=>"SL"

);

sub Minuscule
{
 my $mot = shift;
$mot=~s/A/a/g;
 $mot=~s/À/à/g;
 $mot=~s/Ä/ä/g;
 $mot=~s/Â/â/g;
 $mot=~s/B/b/g;
 $mot=~s/C/c/g;
 $mot=~s/Ç/ç/g;
 $mot=~s/D/d/g;
 $mot=~s/E/e/g;
 $mot=~s/É/é/g;
 $mot=~s/È/è/g;
 $mot=~s/Ë/ë/g;
 $mot=~s/Ê/ê/g;
 $mot=~s/F/f/g;
 $mot=~s/G/g/g;
 $mot=~s/H/h/g;
 $mot=~s/I/i/g;
 $mot=~s/J/j/g;
 $mot=~s/K/k/g;
 $mot=~s/L/l/g;
 $mot=~s/M/m/g;
 $mot=~s/N/n/g;
 $mot=~s/O/o/g;
 $mot=~s/Ö/ö/g;
 $mot=~s/P/p/g;
 $mot=~s/Q/q/g;
 $mot=~s/R/r/g;
 $mot=~s/S/s/g;
 $mot=~s/T/t/g;
 $mot=~s/U/u/g;
 $mot=~s/Ù/ù/g;
 $mot=~s/Ü/ü/g;
 $mot=~s/Û/û/g;
 $mot=~s/V/v/g;
 $mot=~s/W/w/g;
 $mot=~s/X/x/g;
 $mot=~s/Y/y/g;
 $mot=~s/Z/z/g;
 return ($mot);
}

sub SupprimePonctuation
{
 my $mot=shift;
 $mot=~s/[',;:"]//g;
 return ($mot);
}

sub Exceptions
{
 my $mot=shift;
 my $return;
 if ( defined $Exceptions{$mot} )
 {
 if ( $Exceptions{$mot} eq "SF" ) { $mot=~s/s$/C/ ; }
 elsif ( $Exceptions{$mot} eq "SL" ) { $mot=~s/l$// ; }
 elsif ( $mot=~/^culs*$/ ) { $return="ky";}
 elsif ( $mot=~/^cuculs*$/ ) { $return="kyky";}
 }
 return ($mot);
}

sub MinusculeSaufSigle
{
    my $mot=shift;
    my $ret=$mot;
    if (lengh($mot)>=2)
    {
    my @mots=split(//,$mot);
    if ( lc($mots[1]) eq  $mots[1]) {$ret=lc($mot);}
    }
    return $ret;
}


sub Sigle
{
 my $mot=shift;
 my $return="" ;
 $mot=~s/\.//g;
 if ( $mot=~/^[A-Z]+$/)
  {
   $mot=Minuscule($mot);
   my @lettres=split(//,$mot);
   foreach my $lettre (@lettres) { $return.=PhonemiseMot($lettre); }
  }
 return $return;
}

# Cette fonction isole les racines manifestes d'un mot pour lancer la phonémisation sur la partie autre que le mot.
# Elle n'est utilisée que pour les racines qui ne sont des exceptions
sub PhonemiseAvecRacine
{
 my $mot=shift;
 my $return=0 ;
 if (   $return=Sigle ($mot) ) { $mot=$return }
 else {
 $mot=Minuscule($mot);
 if ( $mot=~/([^ ]+) (.*)/) {$mot=PhonemiseAvecRacine($1).PhonemiseAvecRacine($2);}
 if ( $mot=~/([^-]+)-(.*)/) {$mot=PhonemiseAvecRacine($1).PhonemiseAvecRacine($2);}
 elsif ( $mot=~/(.*)équa([^n]+)/ ) { $mot=PhonemiseAvecRacine($1)."ekwa".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)ground-*(.*)/ ) { $mot=PhonemiseAvecRacine($1)."gRawnd".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)vert-(.*)/ ) { $mot=PhonemiseAvecRacine($1)."vEr".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)under(.*)/ ) { $mot=PhonemiseAvecRacine($1)."9nd9R".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)ultra(.*)/ ) { $mot=PhonemiseAvecRacine($1)."yltRa".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)vraisembl*(.*)/ ) { $mot=PhonemiseAvecRacine($1)."vREs\@bl".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)girl(.*)/ ) { $mot=PhonemiseAvecRacine($1)."g9Rl".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)electro(.*)/ ) { $mot=PhonemiseAvecRacine($1)."elektRo".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)trust(.*)/ ) { $mot=PhonemiseAvecRacine($1)."tR9st".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)bluff(.*)/ ) { $mot=PhonemiseAvecRacine($1)."bl9f".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)vingt(.*)/ ) { $mot=PhonemiseAvecRacine($1)."v5t".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)tranquilles*(.*)/ ) { $mot=PhonemiseAvecRacine($1)."tR\@kil".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)tranquillou(.*)/ ) { $mot=PhonemiseAvecRacine($1)."tR\@kily".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)tranquillo(.*)/ ) { $mot=PhonemiseAvecRacine($1)."tR\@kilo".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)tranquill(.*)/ ) { $mot=PhonemiseAvecRacine($1)."tR\@kil".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)codicille(.*)/ ) { $mot=PhonemiseAvecRacine($1)."kodisil".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)quadr(.*)/ ) { $mot=PhonemiseAvecRacine($1)."kwadR".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)fascistes*(.*)/ ) { $mot=PhonemiseAvecRacine($1)."faSist".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)fascismes(.*)/ ) { $mot=PhonemiseAvecRacine($1)."fa scismes*".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)bacilles*(.*)/ ) { $mot=PhonemiseAvecRacine($1)."bacil".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)mille(.*)/ ) { $mot=PhonemiseAvecRacine($1)."mil".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)club(.*)/ ) { $mot=PhonemiseAvecRacine($1)."kl9b".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)seconds*$/ ) { $mot=PhonemiseAvecRacine($1)."s°g§".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)second(.*)/ ) { $mot=PhonemiseAvecRacine($1)."s°g§d".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)monsieur(.*)/ ) { $mot=PhonemiseAvecRacine($1)."m°sj2".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)messieurs(.*)/ ) { $mot=PhonemiseAvecRacine($1)."mesj2".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/télé(.*)/ ) { $mot="tele".PhonemiseAvecRacine($1); }
 elsif ( $mot=~/(.*)noms*$/ ) { $mot=PhonemiseAvecRacine($1)."n£"; }
 elsif ( $mot=~/(.*)techn(.*)/ ) { $mot=PhonemiseAvecRacine($1)."tEkn".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)orient(.*)/ ) { $mot=PhonemiseAvecRacine($1)."orj\@t".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)supers*/ ) { $mot=PhonemiseAvecRacine($1)."sypER" }
 elsif ( $mot=~/(.*)endum$/ ) { $mot=PhonemiseAvecRacine($1)."5dom" }
 elsif ( $mot=~/saint-([aeiouyhàâéèêîöû])(.*)/ ) { $mot="s5t".PhonemiseAvecRacine("$1$2") }
 elsif ( $mot=~/sous-([aeiouyhàâéèêîöû])(.*)/ ) { $mot="suz".PhonemiseAvecRacine("$1$2") }
 elsif ( $mot=~/^ville*(.*)/ ) { $mot="vil".PhonemiseAvecRacine($1); }
 elsif ( $mot=~/(.*)ville$/ ) { $mot=PhonemiseAvecRacine($1)."vil"; }
 elsif ( $mot=~/^anti(.*)/ ) { $mot="\@ti".PhonemiseAvecRacine($1); }
 elsif ( $mot=~/^choré(.*)/ ) { $mot="koRe".PhonemiseAvecRacine($1); }
 elsif ( $mot=~/^auto(.*)/ ) { $mot="oto".PhonemiseAvecRacine($1); }
 elsif ( $mot=~/^tiers$/ ) { $mot="tjEr"; }
 elsif ( $mot=~/^tiers-(.*)$/ ) { $mot="tjEr".PhonemiseAvecRacine($1);; }
 elsif ( $mot=~/(.*)girls*$/ ) { $mot=PhonemiseAvecRacine($1)."g9Rl"; }
 elsif ( $mot=~/afters*(.*)/ ) { $mot="aftER".PhonemiseAvecRacine($1); }
 elsif ( $mot=~/gentilhomm(.*)/ ) { $mot="Z\@tijom".PhonemiseAvecRacine($1); }
 elsif ( $mot=~/(.*)dessus(.*)/ ) { $mot=PhonemiseAvecRacine($1)."d°sy".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)dessous(.*)/ ) { $mot=PhonemiseAvecRacine($1)."d°su".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)suspense$/ ) { $mot=PhonemiseAvecRacine($1)."syspEns".PhonemiseAvecRacine($2); }
 elsif ( $mot=~/(.*)poids$/ ) { $mot=PhonemiseAvecRacine($1)."pwa" }
 elsif ( $mot=~/(.*)camps$/ ) { $mot=PhonemiseAvecRacine($1)."k\@" }

 else { $mot=Phonemise($mot); }
 }
 return $mot;
}

sub PhonemiseMot
{
my $mot = shift ;
$mot=SupprimePonctuation($mot);
$mot=Exceptions($mot);
$mot=FinMuette($mot);
#Traitement des consonnes à changement de prononciation en fonction des voyelles
$mot=TraiteS($mot);
$mot=TraiteK($mot);
$mot=TraiteC($mot);
$mot=TraiteQ($mot);
$mot=TraiteG($mot);
$mot=TraiteJ($mot);

# Traitement des voyelles sauf e
$mot=TraiteY($mot);
$mot=TraiteA($mot);
$mot=TraiteU($mot);
$mot=TraiteW($mot);
$mot=TraiteO($mot);

$mot=TraiteI($mot);

#Traitement des consonnes
$mot=TraiteDoubleConsonne($mot);
$mot=TraiteDoubleConsonne($mot); # zzzz
$mot=TraiteB($mot);
$mot=TraiteD($mot);
$mot=TraiteF($mot);
$mot=TraiteH($mot);

$mot=TraiteL($mot);
$mot=TraiteM($mot);
$mot=TraiteN($mot);
$mot=TraiteP($mot);
$mot=TraiteR($mot);
$mot=TraiteT($mot);
$mot=TraiteX($mot);
$mot=TraiteZ($mot);



#Traitement des e et des tréma
$mot=TraiteE($mot);
$mot=TraiteTrema($mot);
$mot=ChangeLettresFictives($mot);

#changement sans grande complications
return ($mot);
}



sub Phonemise
{
 my $mot= shift;
 my $return;
 my @retour;
 my @sousmot=split(/-| /,$mot);
 foreach my $sm (@sousmot) { push (@retour,PhonemiseMot($sm)); }
 $return =  join ('',@retour);
 return ($return);
}


sub Text2Phoneme
{
 my $mot = shift;
 return ( PhonemiseAvecRacine ($mot));
}


sub NbSyllabe
{
my $mot = shift;
$mot=~s/b//g;
$mot=~s/c//g;
$mot=~s/d//g;
$mot=~s/f//g;
$mot=~s/g//g;
$mot=~s/k//g;
$mot=~s/l//g;
$mot=~s/m//g;
$mot=~s/n//g;
$mot=~s/p//g;
$mot=~s/r//gi;
$mot=~s/s//gi;
$mot=~s/t//g;
$mot=~s/v//g;
$mot=~s/w//g;
$mot=~s/x//g;
$mot=~s/z//gi;
return (length($mot));




}

# Preloaded methods go here.

1;
__END__

# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Lingua::FR::Phonemise - Perl extension to transform in french language word in phoneme. For example  the word

=over

=item *

Paris => paRi

=item *

feuillage => f9jaZ

=back

To see the convention please go to www.lexique.org

The module is itented to allow several task :

=over

=item *

speech synthese

=item *

search in lexique3 to allow ryhme dictionnarys

=back



=head1 SYNOPSIS


 use Lingua::FR::Phonemise;

 print Text2Phoneme("bravoure"),"\n" ;

 => bRavuR

print NbSyllabe ("bravoure"),"\n";

 => 2

=head1 DESCRIPTION


=head2 EXPORT

Text2Phoneme
NbSyllable



=head1 SEE ALSO

http://www.gillesmaire.com

=head1 AUTHOR

Gilles Maire, gilles AT gillesmaire.com

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2008 2013 by Gilles Maire

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.


=cut
