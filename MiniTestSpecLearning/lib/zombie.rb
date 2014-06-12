class Zombie
  def needs
    'brains'
  end

  def growl
    puts ZombieBucket.random_growl
  end
end
