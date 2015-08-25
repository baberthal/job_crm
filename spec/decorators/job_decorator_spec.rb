require 'rails_helper'

RSpec.describe JobDecorator do
  let(:job) { create(:job).decorate }

  describe '#last_touch' do
    before :each do
      job.last_touch = DateTime.now.utc
    end

    context 'without a format provided' do
      let(:today) { Time.zone.today.strftime('%_m/%-d/%y') }
      it 'returns the last_touch according to the default format' do
        expect(job.last_touch).to match(/#{today}/)
      end
    end

    context 'with a format provided' do
      let(:today) { Time.zone.today.strftime('%D') }
      it 'returns the last_touch according to the provided format' do
        expect(job.last_touch(format: '%D')).to match(/#{today}/)
      end
    end
  end

  describe '#application_sent' do
    before :each do
      job.application_sent = DateTime.now.utc
    end

    context 'without a format provided' do
      let(:today) { Time.zone.today.strftime('%_m/%-d/%y') }
      it 'returns the last_touch according to the default format' do
        expect(job.application_sent).to match(/#{today}/)
      end
    end

    context 'with a format provided' do
      let(:today) { Time.zone.today.strftime('%D') }
      it 'returns the last_touch according to the provided format' do
        expect(job.application_sent(format: '%D')).to match(/#{today}/)
      end
    end
  end
end
