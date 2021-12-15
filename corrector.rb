class Corrector
  def correct_name(name)
    if name.length <= 10
      name.capitalize
    else
      name[0, 10].capitalize
    end
  end
end
