require 'ripple-cli'

module Ripple
  describe Update do
    subject { Update.new }

    describe '#build_args' do
      context 'with nil nuget' do
        it { subject.build_args.should eq '' }
      end

      context 'with empty nuget' do
        before { subject.nuget = '' }
        it { subject.build_args.should eq '' }
      end

      context 'with nuget' do
        before { subject.nuget = 'some.nuget' }
        it { subject.build_args.should eq '--nuget "some.nuget"' }
      end

      context 'preview no' do
        before { subject.preview = false }
        it { subject.build_args.should eq '' }
      end

      context 'preview yes' do
        before { subject.preview = true }
        it { subject.build_args.should eq '--preview' }
      end

      context 'force no' do
        before { subject.force = false }
        it { subject.build_args.should eq '' }
      end

      context 'force yes' do
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
          subject.nuget = 'some.nuget'
          subject.preview = true
          subject.force = true
          subject.cache = 'some/cache'
          subject.all_solutions = true
          subject.verbose = true
        }
        it { subject.build_args.should eq '--nuget "some.nuget" --preview --force --cache "some/cache" --all --verbose' }
      end
    end
  end
end
