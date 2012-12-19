use utf8;
package RODA::RODADB::Result::DocumentType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

RODA::RODADB::Result::DocumentType - Tabel ce contine tipurile de documente

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

=head1 TABLE: C<document_type>

=cut

__PACKAGE__->table("document_type");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_nullable: 0

Codul tipului de document

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 100

Denumirea tipului de document

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 100 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 documents

Type: has_many

Related object: L<RODA::RODADB::Result::Document>

=cut

__PACKAGE__->has_many(
  "documents",
  "RODA::RODADB::Result::Document",
  { "foreign.type_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07012 @ 2012-12-19 19:21:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2RR9h7DdTJrVALWIijNSPg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
