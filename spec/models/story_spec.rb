require 'spec_helper'

describe Story do

  context '.class' do

    context '#update' do
      let(:story) { OpenStruct.new }

      let(:params) {{
        story:      'story',
        story_id:   123,
        project_id: 312
      }}

      before do
        RedmineClient::Issue.stubs(:find).returns(story)
        story.stubs(:update)
      end

      it 'should call find on RedmineClient::Issue' do
        RedmineClient::Issue.expects(:find).with(
          params[:story_id], params[:project_id]
        ).returns(story)
        
        Issue.update(params)
      end

      it 'should call update on story' do
        story.expects(:update).with(params[:story])
        Issue.update(params)
      end
    end

  end
end