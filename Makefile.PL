# $Id: Makefile.PL,v 1.2 2003/02/16 12:39:31 dk Exp $
use PDL::Core::Dev;
use ExtUtils::MakeMaker;
use Prima::Config;

@pack = (["primaimage.pd",PrimaImage,PDL::PrimaImage]);
%hash = pdlpp_stdargs(@::pack);
$hash{OBJECT}="PrimaImage\$(OBJ_EXT)";
$hash{VERSION_FROM}="primaimage.pd";
$hash{clean}{FILES} ='PrimaImage';
$hash{INC} .= join( ' ' , map { $Prima::Config::Config{cincflag}.$_} @{$Prima::Config::Config{incpaths}});
$hash{LDDLFLAGS} .= $Prima::Config::Config{libname} if $^O =~ /win32|os2/i;
my %DEFINES=map { my @z = split('=', $_, 2); scalar(@z)?(@z):($_ => 1)} @{$Prima::Config::Config{cdefs}};
$hash{CCFLAGS} .= join( ' ' , map { $Prima::Config::Config{cdefflag}.$_.'='.$DEFINES{$_}} keys %DEFINES);
WriteMakefile(%hash);
sub MY::postamble { pdlpp_postamble(@::pack); } 
