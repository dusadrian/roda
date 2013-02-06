use utf8;
package RODA::RODADB::Result::StudyTopic;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

RODA::RODADB::Result::StudyTopic

=head1 DESCRIPTION

Tabel ce stocheaza asocierile dintre studii si topic-uri (implementeaza relatia many-to-many intre tabelele study si topic)

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

=head1 TABLE: C<study_topic>

=cut

__PACKAGE__->table("study_topic");

=head1 ACCESSORS

=head2 study_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

Codul studiului caruia ii este asociat topic-ul referit prin atributul topic_id

=head2 topic_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

Codul unui topic asociat studiului identificat prin atributul study_id

=cut

__PACKAGE__->add_columns(
  "study_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "topic_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</study_id>

=item * L</topic_id>

=back

=cut

__PACKAGE__->set_primary_key("study_id", "topic_id");

=head1 RELATIONS

=head2 study

Type: belongs_to

Related object: L<RODA::RODADB::Result::Study>

=cut

__PACKAGE__->belongs_to(
  "study",
  "RODA::RODADB::Result::Study",
  { id => "study_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 topic

Type: belongs_to

Related object: L<RODA::RODADB::Result::Topic>

=cut

__PACKAGE__->belongs_to(
  "topic",
  "RODA::RODADB::Result::Topic",
  { id => "topic_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-02-05 11:04:04
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9dC+7oHvEH+sXLTGBe1AlQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
