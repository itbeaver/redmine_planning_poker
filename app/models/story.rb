class Story
  class << self

    def update(params)
      story = RedmineClient::Issue.find(
        params[:story_id]
      )

      story.update(params[:story])
    end

  end
end