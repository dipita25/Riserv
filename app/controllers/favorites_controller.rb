class FavoritesController < ApplicationController
  def my_favorites
    @favorites = Favorite.where(user_id: current_user.id)
    @enterprises = []
    @favorites.each do |favorite|
      @enterprises << Enterprise.find(favorite.enterprise_id)
    end
  end
end
