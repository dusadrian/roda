use utf8;
package RODA::RODADB::Result::InstancePersonAssoc;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

RODA::RODADB::Result::InstancePersonAssoc

=head1 DESCRIPTION

Tabel ce contine tipurile de asociere intre instanta si persoana

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<instance_person_assoc>

=cut

__PACKAGE__->table("instance_person_assoc");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_nullable: 0

Codul unui tip de asociere care poate exista intre persoane si instante

=head2 assoc_name

  data_type: 'varchar'
  is_nullable: 0
  size: 100

Denumirea unui tip de asociere care poate exista intre persoane si instante

=head2 assoc_description

  data_type: 'text'
  is_nullable: 1

Descrierea tipului de asociere identificat prin atributul id

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_nullable => 0 },
  "assoc_name",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "assoc_description",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 instance_people

Type: has_many

Related object: L<RODA::RODADB::Result::InstancePerson>

=cut

__PACKAGE__->has_many(
  "instance_people",
  "RODA::RODADB::Result::InstancePerson",
  { "foreign.assoc_type_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07012 @ 2012-12-19 19:21:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3EkTuymAKxRMGFazwl2UOA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;