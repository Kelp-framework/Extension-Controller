package TestApp::Controller;

use Kelp::Base 'KelpX::Controller';

attr test => undef;
my $last = 0;

sub before_dispatch
{
	my $self = shift;

	$self->res->header('X-Dispatch', ref $self);
}

sub build
{
	my $self = shift;

	$last += 1;
	$self->test($last);
}

sub dump
{
	my $self = shift;

	return $self->app->dumper_sub->($self);
}

1;

