use strict;
use warnings;
use Test::More 'no_plan', import => ['!pass'];

use lib 't';
use TestUtils;
use Dancer;

get '/' => sub { 'home' };
get '/bounce' => sub { redirect '/' };

my $res = get_response_for_request(GET => '/');
ok(defined($res), "got response for /");
is($res->{content}, "home", 
    "response content for / looks good");

$res = get_response_for_request(GET => '/bounce');
ok(defined($res), "got response for /bounce");
is($res->{status}, 302, 
    "response status is 302 for /bounce");

$res = get_response_for_request(GET => '/');
ok(defined($res), "still got response for /");
is($res->{content}, "home", 
    "response content for / looks good after a redirect");


