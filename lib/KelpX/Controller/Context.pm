package KelpX::Controller::Context;

use Kelp::Base 'Kelp::Context';

attr persistent_controllers => !!1;

sub build_controller
{
	my ($self, $class) = @_;
	return $class->new(context => $self);
}
#
sub set_controller
{
	my ($self, $class) = @_;

	# normally, if there is no controller, an app will be used as current
	# context. Use base controller instead.
	return $self->current($self->controller)
		unless $class;

	return $self->SUPER::set_controller($class);
}

1;

