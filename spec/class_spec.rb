require File.expand_path('../spec_helper', __FILE__)
require 'fixtures/class_spec'

describe "ClassMirror" do

  before do
    @r = reflection
    @m = reflection.reflect_object(ClassFixture)
  end

  describe "queries" do
    it "name" do
      @m.name.should == ClassFixture.name
    end

    it "known instance variables" do
      names = @m.instance_variables.collect(&:name)
      names.should include("@a", "@b")
    end

    it "known class variables" do
      names = @m.class_variables.collect(&:name)
      names.should include "@@cva"
    end

    it "known class instance variables" do
      names = @m.class_instance_variables.collect(&:name)
      names.should include "@civa"
    end

    it "known constants" do
      names = @m.constants.collect(&:name)
      names.should include "Foo"
    end

    it "known inner classes" do
      @m.nested_classes.first.name.should == ClassFixtureNested.name
    end

    it "known direct methods" do
      @m.methods.size.should == 2
    end

    it "ancestors" do
      ancestorsnames = [*ClassFixture.ancestors.collect(&:name)]
      @m.ancestors.collect(&:name).should include *ancestorsnames
    end

    it "superclass" do
      @m.superclass.name.should == ClassFixture.superclass.name
    end

    it "known subclasses" do
      @m.subclasses.size.should == 1
    end

    it "mixins" do
      @m.mixins.first.name.should == ClassFixtureModule.name
    end

    it "nesting" do
      @m.nesting.last
      @m.nesting.last.name.should == ClassFixture.name
    end

    # it "source locations" do
    #   @m.source_files.any? {|l| l =~ /spec\/class_spec.rb/ }.should.be_true
    #   @m.source_files.any? {|l| l =~ /fixtures\/class_spec.rb/ }.should.be_true
    # end

    # it "value of a known constant" do
    #   @m.value_of("Foo").should == "Bar"
    # end

    # it "value of a known class variable" do
    #   @m.value_of("cva").should == 1
    # end

    # it "value of a known class instance variable" do
    #   @m.value_of("cvia").should == 1
    # end
  end
end
