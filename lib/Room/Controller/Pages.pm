package Room::Controller::Pages;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Room::Controller::Pages - Custom pages controller.

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path {
    my ( $self, $c, @page ) = @_;
    my $template = join '/', @page;

    $c->res->redirect( '/404-not-found' ) unless $template ne "";

    if ( $c->view('HTML')->template_exists('pages', $template) ) {
        $c->stash->{template} = 'pages/' . $template;
        $c->forward( $c->view('HTML') ); 
    }
    else {
        $c->res->redirect( '/404-not-found' ); 
    }
}


=head1 AUTHOR

Pavel Karoukin

=head1 LICENSE

Copyright (C) 2010 Pavel A. Karoukin <pavel@yepcorp.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.


=cut

__PACKAGE__->meta->make_immutable;

1;
