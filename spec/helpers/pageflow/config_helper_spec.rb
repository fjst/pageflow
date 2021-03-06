require 'spec_helper'

module Pageflow
  describe ConfigHelper do
    describe '#editor_config_seeds' do
      it 'includes confirm_encoding_jobs option' do
        Pageflow.config.confirm_encoding_jobs = true

        result = JSON.parse(helper.editor_config_seeds)

        expect(result['confirmEncodingJobs']).to eq(true)
      end

      it 'includes file type collection names' do
        result = JSON.parse(helper.editor_config_seeds)

        expect(result['fileTypes'][0]['collectionName']).to eq('image_files')
      end

      it 'includes available locales' do
        Pageflow.config.available_locales = [:de, :fr]

        result = JSON.parse(helper.editor_config_seeds)

        expect(result['availableLocales']).to eq(['de', 'fr'])
      end
    end
  end
end
