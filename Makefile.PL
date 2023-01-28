use strict;
use warnings;
use PDL::Core::Dev;
use ExtUtils::MakeMaker;
use Prima::Config;

our @pack = (["primaimage.pd",'PrimaImage','PDL::PrimaImage']);
my %hash = (
	pdlpp_stdargs(@::pack),
	OBJECT       => "PrimaImage\$(OBJ_EXT)",
	VERSION_FROM => "PrimaImage.pm",
	clean        => {
		FILES => 'PrimaImage',
	},
	META_MERGE   => {
		resources => {
			repository => 'https://github.com/dk/PDL-PrimaImage'
		}
	},
);
$hash{INC}      .= " $Prima::Config::Config{inc}";
push @{$hash{LIBS}}, $Prima::Config::Config{libs};
$hash{DEFINE}   .= " $Prima::Config::Config{define}";
WriteMakefile(%hash);

sub MY::postamble { pdlpp_postamble(@::pack); } 
