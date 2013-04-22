require 'ripple-cli'

module Ripple
  describe Restore do
    subject { Restore.new }

    describe '#build_args' do
      context 'with nil feeds' do
        it { subject.build_args.should eq '' }
      end

      context 'with no feeds' do
        before { subject.feeds = [] }
        it { subject.build_args.should eq '' }
      end

      context 'with one feed' do
        before { subject.feeds = ['feed1'] }
        it { subject.build_args.should eq '--feeds "feed1"' }
      end

      context 'with multipe feeds' do
        before { subject.feeds = ['feed1', 'feed2'] }
        it { subject.build_args.should eq '--feeds "feed1#feed2"' }
      end

      context 'force' do
        before { subject.force = true }
        it { subject.build_args.should eq '--force' }
      end

      context 'with nil cache' do
        it { subject.build_args.should eq '' }
      end

      context 'with empty cache' do
        before { subject.cache = '' }
        it { subject.build_args.should eq '' }
      end

      context 'with cache' do
        before { subject.cache = 'some/cache' }
        it { subject.build_args.should eq '--cache "some/cache"' }
      end

      context 'not for all solutions' do
        before { subject.all_solutions = false }
        it { subject.build_args.should eq '' }
      end

      context 'for all solutions' do
        before { subject.all_solutions = true }
        it { subject.build_args.should eq '--all' }
      end

      context 'for specific solution' do
        before { subject.solution = 'some/solution' }
        it { subject.build_args.should eq '--solution "some/solution"' }
      end

      context 'for specific solution and all solutions' do
        before {
          subject.solution = 'some/solution'
          subject.all_solutions = true
        }
        it { subject.build_args.should eq '--all' }
      end

      context 'no solution specified' do
        it { subject.build_args.should eq '' }
      end

      context 'verbose no' do
        it { subject.build_args.should eq '' }
      end

      context 'verbose yes' do
        before { subject.verbose = true }
        it { subject.build_args.should eq '--verbose' }
      end

      context 'with feeds, force, cache, all, and verbose' do
        before {
          subject.feeds = ['feed1', 'feed2']
          subject.force = true
          subject.cache = 'some/cache'
          subject.all_solutions = true
          subject.verbose = true
        }
        it { subject.build_args.should eq '--feeds "feed1#feed2" --force --cache "some/cache" --all --verbose' }
      end
    end
  end
end
