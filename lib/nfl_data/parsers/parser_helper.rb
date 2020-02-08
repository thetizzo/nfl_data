module ParserHelper
  def make_jacksonville_abbreviation_consistent(team_name)
    # Use JAX because schedule pages use JAX and it's easier to fix it here
    team_name == "JAC" ? "JAX" : team_name
  end
end
