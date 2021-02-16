class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
  end

  def create
    @author = Author.create!(author_params)
      if @post.valid?
            # If--and only if--the post is valid, do what we usually do.
            @post.save
            # This returns a status_code of 302, which instructs the browser to
            # perform a NEW REQUEST! (AKA: throw @post away and let the show action
            # worry about re-reading it from the database)
            redirect_to post_path(@post)
          else
            # If the post is invalid, hold on to @post, because it is now full of
            # useful error messages, and re-render the :new page, which knows how
            # to display them alongside the user's entries.
            render :new
          end
  end

  private

  def author_params
    params.permit(:email, :name)
  end
end
