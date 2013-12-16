# $Id: Makefile.PL,v 1.2 2003/02/16 12:39:31 dk Exp $
use PDL::Core::Dev;
use ExtUtils::MakeMaker;
use Prima::Config;

@pack = (["primaimage.pd",PrimaImage,PDL::PrimaImage]);
%hash = pdlpp_stdargs(@::pack);
$hash{OBJECT}="PrimaImage\$(OBJ_EXT)";
$hash{VERSION_FROM}="primaimage.pd";
$hash{clean}{FILES} ='PrimaImage';
$hash{INC} .= " $Prima::Config::Config{inc}";
push @{$hash{LIBS}}, $Prima::Config::Config{libs};
$hash{DEFINE} .= " $Prima::Config::Config{define}";
$hash{META_MERGE}->{resources}->{repository} = 'https://github.com/dk/PDL-PrimaImage';
WriteMakefile(%hash);
sub MY::postamble { pdlpp_postamble(@::pack); } 
