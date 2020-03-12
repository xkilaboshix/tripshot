module PostsHelper
  def rank(post,first_rank,second_rank,third_rank)
    file_name = 'no-image.png'
    if post.id == first_rank.id
      file_name = 'first_place.png'
    elsif post.id == second_rank.id
      file_name = 'second_place.png'
    elsif post.id == third_rank.id
      file_name = 'third_place.png'
    end
  end
end
