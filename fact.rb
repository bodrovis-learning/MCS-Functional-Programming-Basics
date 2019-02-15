def fact(n)
  return unless n.is_a?(Integer)

  if n <= 1
    1
  else
    n * fact(n - 1)
  end
end
