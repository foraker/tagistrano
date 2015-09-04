require 'tagistrano/tag'

module Tagistrano
  describe Tag do
    describe '.next_tags' do
      it 'returns an array of the next tag options' do
        allow(described_class).to receive(:git_tags).and_return %q(
          0.0.1
          0.1.0
          1.0.0
          1.0.1
        )

        expect(described_class.next_tags).to eq(['2.0.0', '1.1.0', '1.0.2'])
      end
    end

    context 'version incrementing' do
      let(:tag) { described_class.new('1.2.3') }

      describe '#next_major_tag' do
        it 'increments the major version' do
          expect(tag.next_major_tag).to eq '2.0.0'
        end
      end

      describe '#next_minor_tag' do
        it 'increments the minor version' do
          expect(tag.next_minor_tag).to eq '1.3.0'
        end
      end

      describe '#next_patch_tag' do
        it 'increments the patch version' do
          expect(tag.next_patch_tag).to eq '1.2.4'
        end
      end
    end
  end
end
