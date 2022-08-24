# frozen_string_literal: true

RSpec.describe(Book::CreateBookUseCase, unit: true) do
  describe '#call' do
    let(:book) { build(:book) }
    let(:params) do
      {
        title: nil,
        author: nil,
        year: nil,
        quantity: nil
      }
    end

    it 'return correct data' do
      described_class.new(params).call
    end
  end
end
