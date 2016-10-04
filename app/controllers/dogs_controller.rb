class DogsController < ApplicationController
  before_action :authenticate_user!

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user_id = current_user.id

    if @dog.save
      flash[:notice] = 'Seu cão foi adicionado ao seu perfil.'
      redirect_to my_profile_path
    else
      render :new
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :age, :size,
                                :race, :personality, :avatar)
  end
end
