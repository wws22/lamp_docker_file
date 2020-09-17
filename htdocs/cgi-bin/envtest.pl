#!/usr/bin/env perl

# That is the old piece of an ugly code. Please forgive me

$cooky=$ENV{'HTTP_COOKIE'};
$cooky=~s/(\s*)//g;
@cookieArray=split(/;/, $cooky);
foreach  $i (@cookieArray) {
	($CookieArrayRowFirst, $CookieArrayRowSecond)=split(/=/, $i);
	$COOKIE{$CookieArrayRowFirst}=$CookieArrayRowSecond;
}
$COOKIE{'samcookie'}=$COOKIE{'samcookie'}+1;
print "Set-cookie: samcookie = $COOKIE{'samcookie'}\n";
print "Content-Type: text/html\n\n";
 
print "<html><head><title>New Page 2</title>";
print "</head><body><p align=\"center\">&nbsp;</p>\n";
print "<p align=\"center\"><big><big><font color=\"#FF0000\">\n";
print "WELCOME!</font></big></big></p>";
print "<p>";
print "$PATH_INFO";
print "</p><pre>";
my $f = $ENV{QUERY_STRING} eq 'ip' ? 0 : 1;
foreach (sort keys %ENV)
{
	if($f){
		print "$_\t".$ENV{$_}."\n";
	}else{	
	  if( $ENV{$_} =~ /\A(\d+\.){3}\d+/msx ){
		print "$_\t".$ENV{$_}."\n";
	  }
	}
}
print "</pre>";
read(STDIN, $poststring , $ENV{'CONTENT_LENGTH'});
print "$poststring";
print "<p align=\"center\">&nbsp;</p>";
print "</body></html>";
__END__

