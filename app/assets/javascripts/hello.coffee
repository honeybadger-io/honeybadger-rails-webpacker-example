document.addEventListener "turbolinks:load", () ->
  abc = Example.abc()
  document.getElementById("example").innerHTML = abc

Example =
  abc: () ->
    @a()

  a: () ->
    'a' + @b()

  b: () ->
    'b' + @c()

  c: () ->
    'c' + @d()

  d: () ->
    'd' + @e()

  e: () ->
    'e' + @f()

  f: () ->
    'f' + @g()

  g: () ->
    'g' + @h()

  h: () ->
    'h' + @i()

  i: () ->
    'i' + @j()

  j: () ->
    'j' + @k()

  k: () ->
    'k' + @l()

  l: () ->
    'l' + @m()

  m: () ->
    'm' + @n()

  n: () ->
    'n' + @o()

  o: () ->
    'o' + @p()

  p: () ->
    'p' + @q()

  q: () ->
    'q' + @r()

  r: () ->
    'r' + @s()

  s: () ->
    's' + @t()

  t: () ->
    't' + @u()

  u: () ->
    'u' + @v()

  v: () ->
    'v' + @w()

  w: () ->
    'w' + @x()

  x: () ->
    'x' + @y()

  y: () ->
    'y' + @z()

  z: () ->
    'z'
