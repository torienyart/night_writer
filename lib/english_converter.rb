class EnglishConverter

  def dictionary_hash
    {
      'a' => [b_key, d_key, d_key],
      'b' => [b_key, b_key, d_key],
      'c' => [a_key, d_key, d_key],
      'd' => [a_key, c_key, d_key],
      'e' => [b_key, c_key, d_key],
      'f' => [a_key, b_key, d_key],
      'g' => [a_key, a_key, d_key],
      'h' => [b_key, a_key, d_key],
      'i' => [c_key, b_key, d_key],
      'j' => [c_key, a_key, d_key],
      'k' => [b_key, d_key, b_key],
      'l' => [b_key, b_key, b_key],
      'm' => [c_key, a_key, c_key],
      'n' => [a_key, d_key, a_key],
      'o' => [a_key, c_key, a_key],
      'p' => [b_key, c_key, a_key],
      'q' => [a_key, a_key, b_key],
      'r' => [b_key, a_key, b_key],
      's' => [c_key, b_key, b_key],
      't' => [c_key, a_key, b_key],
      'u' => [b_key, d_key, a_key],
      'v' => [b_key, b_key, a_key],
      'w' => [c_key, a_key, c_key],
      'x' => [a_key, d_key, a_key],
      'y' => [a_key, c_key, a_key],
      'z' => [b_key, c_key, a_key]
    }
  end
  def a_key
    '00'
  end

  def b_key
    '0.'
  end

  def c_key
    '.0'
  end

  def d_key
    '..'
  end

end