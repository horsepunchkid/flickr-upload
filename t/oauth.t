use Test::More qw(no_plan);
BEGIN { use_ok('Flickr::Upload') };

# Load saved configuration including access token. If none, fail nicely.
my $saved_config = 't/saved_config';
-r $saved_config or (print STDERR "No stored Flickr::API config file\n" && exit 0);
my $ua = Flickr::Upload->import_storable_config($saved_config);
ok(defined $ua);
bless $ua, 'Flickr::Upload';

my $rc = $ua->upload(
	'photo' => 't/testimage.jpg',
	'tags' => "test kernel perl cat dog",
	'description' => "Flickr Upload test for $0",
	'is_public' => 0,
	'is_friend' => 0,
	'is_family' => 0,
);

ok( defined $rc );

exit 0;
