package CLIDTestClass::More::Basic;

use strict;
use warnings;
use Test::Classy::Base;
use CLIDTest::More;

sub simple_dispatch : Test {
  my $class = shift;

  my $ret = $class->dispatch(qw( simple ));

  ok $ret eq 'simple', $class->message("dispatch succeeded: $ret");
}

sub simple_with_args : Test {
  my $class = shift;

  my $ret = $class->dispatch(qw( with_args one two three ));

  ok $ret eq 'onetwothree', $class->message("dispatch succeeded: $ret");
}

sub simple_with_options : Test {
  my $class = shift;

  my $ret = $class->dispatch(qw( WithOptions --hello --target=world ));

  ok $ret eq 'hello world', $class->message("dispatch succeeded: $ret");
}

sub dispatch {
  my $class = shift;

  local @ARGV = @_;

  my $ret;
  eval { $ret = CLIDTest::More->run };

  return $@ ? $@ : $ret;
}

1;